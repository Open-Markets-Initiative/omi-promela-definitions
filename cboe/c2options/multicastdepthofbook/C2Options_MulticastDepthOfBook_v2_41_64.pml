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

/* ---- Ox Time Message: 4 bytes ------------------------------------------------ */

/* A Time message is immediately generated and sent when there is a PITCH event for a given clock second */
typedef OxTimeMessage {
  byte time[4]
};

int ox_time_message_at;

/* every byte of Ox Time Message set to one value */
inline fill_ox_time_message(ox_time_message_record, ox_time_message_value) {
  ox_time_message_at = 0;
  do
  :: ox_time_message_at < 4 -> ox_time_message_record.time[ox_time_message_at] = ox_time_message_value; ox_time_message_at = ox_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Time Message set to where it lies, so a field read out of place says so */
inline ramp_ox_time_message(ox_time_message_record, ox_time_message_base) {
  ox_time_message_at = 0;
  do
  :: ox_time_message_at < 4 -> ox_time_message_record.time[ox_time_message_at] = (ox_time_message_base + 0 + ox_time_message_at + 1) % 256; ox_time_message_at = ox_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Time Message to the wire, 4 bytes from where the cursor stands */
inline encode_ox_time_message(ox_time_message_record) {
  ox_time_message_at = 0;
  do
  :: ox_time_message_at < 4 -> wire[at] = ox_time_message_record.time[ox_time_message_at]; at = at + 1; ox_time_message_at = ox_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Time Message off the wire, 4 bytes from where the cursor stands */
inline decode_ox_time_message(ox_time_message_record) {
  ox_time_message_at = 0;
  do
  :: ox_time_message_at < 4 -> ox_time_message_record.time[ox_time_message_at] = wire[at]; at = at + 1; ox_time_message_at = ox_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Time Message is what was written, byte for byte */
inline equal_ox_time_message(ox_time_message_read, ox_time_message_written) {
  ox_time_message_at = 0;
  do
  :: ox_time_message_at < 4 -> assert(ox_time_message_read.time[ox_time_message_at] == ox_time_message_written.time[ox_time_message_at]); ox_time_message_at = ox_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Unit Clear Message: 4 bytes ------------------------------------------ */

/* The Unit Clear message instructs feed recipients to clear all orders for the Cboe book in the unit specified in the Sequenced Unit Header */
typedef OxUnitClearMessage {
  byte time_offset[4]
};

int ox_unit_clear_message_at;

/* every byte of Ox Unit Clear Message set to one value */
inline fill_ox_unit_clear_message(ox_unit_clear_message_record, ox_unit_clear_message_value) {
  ox_unit_clear_message_at = 0;
  do
  :: ox_unit_clear_message_at < 4 -> ox_unit_clear_message_record.time_offset[ox_unit_clear_message_at] = ox_unit_clear_message_value; ox_unit_clear_message_at = ox_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Unit Clear Message set to where it lies, so a field read out of place says so */
inline ramp_ox_unit_clear_message(ox_unit_clear_message_record, ox_unit_clear_message_base) {
  ox_unit_clear_message_at = 0;
  do
  :: ox_unit_clear_message_at < 4 -> ox_unit_clear_message_record.time_offset[ox_unit_clear_message_at] = (ox_unit_clear_message_base + 0 + ox_unit_clear_message_at + 1) % 256; ox_unit_clear_message_at = ox_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Unit Clear Message to the wire, 4 bytes from where the cursor stands */
inline encode_ox_unit_clear_message(ox_unit_clear_message_record) {
  ox_unit_clear_message_at = 0;
  do
  :: ox_unit_clear_message_at < 4 -> wire[at] = ox_unit_clear_message_record.time_offset[ox_unit_clear_message_at]; at = at + 1; ox_unit_clear_message_at = ox_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Unit Clear Message off the wire, 4 bytes from where the cursor stands */
inline decode_ox_unit_clear_message(ox_unit_clear_message_record) {
  ox_unit_clear_message_at = 0;
  do
  :: ox_unit_clear_message_at < 4 -> ox_unit_clear_message_record.time_offset[ox_unit_clear_message_at] = wire[at]; at = at + 1; ox_unit_clear_message_at = ox_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Unit Clear Message is what was written, byte for byte */
inline equal_ox_unit_clear_message(ox_unit_clear_message_read, ox_unit_clear_message_written) {
  ox_unit_clear_message_at = 0;
  do
  :: ox_unit_clear_message_at < 4 -> assert(ox_unit_clear_message_read.time_offset[ox_unit_clear_message_at] == ox_unit_clear_message_written.time_offset[ox_unit_clear_message_at]); ox_unit_clear_message_at = ox_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Transaction Begin Message: 4 bytes ----------------------------------- */

/* The Transaction Begin message indicates any subsequent messages, up to the accompanying Transaction End message, are all part of the same transaction block. */
typedef OxTransactionBeginMessage {
  byte time_offset[4]
};

int ox_transaction_begin_message_at;

/* every byte of Ox Transaction Begin Message set to one value */
inline fill_ox_transaction_begin_message(ox_transaction_begin_message_record, ox_transaction_begin_message_value) {
  ox_transaction_begin_message_at = 0;
  do
  :: ox_transaction_begin_message_at < 4 -> ox_transaction_begin_message_record.time_offset[ox_transaction_begin_message_at] = ox_transaction_begin_message_value; ox_transaction_begin_message_at = ox_transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Transaction Begin Message set to where it lies, so a field read out of place says so */
inline ramp_ox_transaction_begin_message(ox_transaction_begin_message_record, ox_transaction_begin_message_base) {
  ox_transaction_begin_message_at = 0;
  do
  :: ox_transaction_begin_message_at < 4 -> ox_transaction_begin_message_record.time_offset[ox_transaction_begin_message_at] = (ox_transaction_begin_message_base + 0 + ox_transaction_begin_message_at + 1) % 256; ox_transaction_begin_message_at = ox_transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Transaction Begin Message to the wire, 4 bytes from where the cursor stands */
inline encode_ox_transaction_begin_message(ox_transaction_begin_message_record) {
  ox_transaction_begin_message_at = 0;
  do
  :: ox_transaction_begin_message_at < 4 -> wire[at] = ox_transaction_begin_message_record.time_offset[ox_transaction_begin_message_at]; at = at + 1; ox_transaction_begin_message_at = ox_transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Transaction Begin Message off the wire, 4 bytes from where the cursor stands */
inline decode_ox_transaction_begin_message(ox_transaction_begin_message_record) {
  ox_transaction_begin_message_at = 0;
  do
  :: ox_transaction_begin_message_at < 4 -> ox_transaction_begin_message_record.time_offset[ox_transaction_begin_message_at] = wire[at]; at = at + 1; ox_transaction_begin_message_at = ox_transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Transaction Begin Message is what was written, byte for byte */
inline equal_ox_transaction_begin_message(ox_transaction_begin_message_read, ox_transaction_begin_message_written) {
  ox_transaction_begin_message_at = 0;
  do
  :: ox_transaction_begin_message_at < 4 -> assert(ox_transaction_begin_message_read.time_offset[ox_transaction_begin_message_at] == ox_transaction_begin_message_written.time_offset[ox_transaction_begin_message_at]); ox_transaction_begin_message_at = ox_transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Transaction End Message: 4 bytes ------------------------------------- */

/* The Transaction End message indicates that a transaction indicated by a previous Transaction Begin message has completed. */
typedef OxTransactionEndMessage {
  byte time_offset[4]
};

int ox_transaction_end_message_at;

/* every byte of Ox Transaction End Message set to one value */
inline fill_ox_transaction_end_message(ox_transaction_end_message_record, ox_transaction_end_message_value) {
  ox_transaction_end_message_at = 0;
  do
  :: ox_transaction_end_message_at < 4 -> ox_transaction_end_message_record.time_offset[ox_transaction_end_message_at] = ox_transaction_end_message_value; ox_transaction_end_message_at = ox_transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Transaction End Message set to where it lies, so a field read out of place says so */
inline ramp_ox_transaction_end_message(ox_transaction_end_message_record, ox_transaction_end_message_base) {
  ox_transaction_end_message_at = 0;
  do
  :: ox_transaction_end_message_at < 4 -> ox_transaction_end_message_record.time_offset[ox_transaction_end_message_at] = (ox_transaction_end_message_base + 0 + ox_transaction_end_message_at + 1) % 256; ox_transaction_end_message_at = ox_transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Transaction End Message to the wire, 4 bytes from where the cursor stands */
inline encode_ox_transaction_end_message(ox_transaction_end_message_record) {
  ox_transaction_end_message_at = 0;
  do
  :: ox_transaction_end_message_at < 4 -> wire[at] = ox_transaction_end_message_record.time_offset[ox_transaction_end_message_at]; at = at + 1; ox_transaction_end_message_at = ox_transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Transaction End Message off the wire, 4 bytes from where the cursor stands */
inline decode_ox_transaction_end_message(ox_transaction_end_message_record) {
  ox_transaction_end_message_at = 0;
  do
  :: ox_transaction_end_message_at < 4 -> ox_transaction_end_message_record.time_offset[ox_transaction_end_message_at] = wire[at]; at = at + 1; ox_transaction_end_message_at = ox_transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Transaction End Message is what was written, byte for byte */
inline equal_ox_transaction_end_message(ox_transaction_end_message_read, ox_transaction_end_message_written) {
  ox_transaction_end_message_at = 0;
  do
  :: ox_transaction_end_message_at < 4 -> assert(ox_transaction_end_message_read.time_offset[ox_transaction_end_message_at] == ox_transaction_end_message_written.time_offset[ox_transaction_end_message_at]); ox_transaction_end_message_at = ox_transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Order Executed Message: 25 bytes ------------------------------------- */

/* Order Executed messages are sent when a visible order on the Cboe book is executed in whole or in part */
typedef OxOrderExecutedMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte execution_id[8];
  byte trade_condition
};

int ox_order_executed_message_at;

/* every byte of Ox Order Executed Message set to one value */
inline fill_ox_order_executed_message(ox_order_executed_message_record, ox_order_executed_message_value) {
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> ox_order_executed_message_record.time_offset[ox_order_executed_message_at] = ox_order_executed_message_value; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> ox_order_executed_message_record.order_id[ox_order_executed_message_at] = ox_order_executed_message_value; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> ox_order_executed_message_record.executed_quantity[ox_order_executed_message_at] = ox_order_executed_message_value; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> ox_order_executed_message_record.execution_id[ox_order_executed_message_at] = ox_order_executed_message_value; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_record.trade_condition = ox_order_executed_message_value;
  skip
}

/* each byte of Ox Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_ox_order_executed_message(ox_order_executed_message_record, ox_order_executed_message_base) {
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> ox_order_executed_message_record.time_offset[ox_order_executed_message_at] = (ox_order_executed_message_base + 0 + ox_order_executed_message_at + 1) % 256; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> ox_order_executed_message_record.order_id[ox_order_executed_message_at] = (ox_order_executed_message_base + 4 + ox_order_executed_message_at + 1) % 256; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> ox_order_executed_message_record.executed_quantity[ox_order_executed_message_at] = (ox_order_executed_message_base + 12 + ox_order_executed_message_at + 1) % 256; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> ox_order_executed_message_record.execution_id[ox_order_executed_message_at] = (ox_order_executed_message_base + 16 + ox_order_executed_message_at + 1) % 256; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_record.trade_condition = (ox_order_executed_message_base + 24 + 1) % 256;
  skip
}

/* Ox Order Executed Message to the wire, 25 bytes from where the cursor stands */
inline encode_ox_order_executed_message(ox_order_executed_message_record) {
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> wire[at] = ox_order_executed_message_record.time_offset[ox_order_executed_message_at]; at = at + 1; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> wire[at] = ox_order_executed_message_record.order_id[ox_order_executed_message_at]; at = at + 1; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> wire[at] = ox_order_executed_message_record.executed_quantity[ox_order_executed_message_at]; at = at + 1; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> wire[at] = ox_order_executed_message_record.execution_id[ox_order_executed_message_at]; at = at + 1; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_order_executed_message_record.trade_condition; at = at + 1;
  skip
}

/* Ox Order Executed Message off the wire, 25 bytes from where the cursor stands */
inline decode_ox_order_executed_message(ox_order_executed_message_record) {
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> ox_order_executed_message_record.time_offset[ox_order_executed_message_at] = wire[at]; at = at + 1; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> ox_order_executed_message_record.order_id[ox_order_executed_message_at] = wire[at]; at = at + 1; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> ox_order_executed_message_record.executed_quantity[ox_order_executed_message_at] = wire[at]; at = at + 1; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> ox_order_executed_message_record.execution_id[ox_order_executed_message_at] = wire[at]; at = at + 1; ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Ox Order Executed Message is what was written, byte for byte */
inline equal_ox_order_executed_message(ox_order_executed_message_read, ox_order_executed_message_written) {
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> assert(ox_order_executed_message_read.time_offset[ox_order_executed_message_at] == ox_order_executed_message_written.time_offset[ox_order_executed_message_at]); ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> assert(ox_order_executed_message_read.order_id[ox_order_executed_message_at] == ox_order_executed_message_written.order_id[ox_order_executed_message_at]); ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 4 -> assert(ox_order_executed_message_read.executed_quantity[ox_order_executed_message_at] == ox_order_executed_message_written.executed_quantity[ox_order_executed_message_at]); ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  ox_order_executed_message_at = 0;
  do
  :: ox_order_executed_message_at < 8 -> assert(ox_order_executed_message_read.execution_id[ox_order_executed_message_at] == ox_order_executed_message_written.execution_id[ox_order_executed_message_at]); ox_order_executed_message_at = ox_order_executed_message_at + 1
  :: else -> break
  od;
  assert(ox_order_executed_message_read.trade_condition == ox_order_executed_message_written.trade_condition);
  skip
}

/* ---- Ox Order Executed At Price Size Message: 37 bytes ----------------------- */

/* Order Executed at Price/Size messages are sent when a visible order on the Cboe book is executed in whole or in part at a different price than the limit price on the original Add Order message or the limit order price in the latest Modify Order message referencing the Order Id */
typedef OxOrderExecutedAtPriceSizeMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte remaining_quantity[4];
  byte execution_id[8];
  byte price_long[8];
  byte trade_condition
};

int ox_order_executed_at_price_size_message_at;

/* every byte of Ox Order Executed At Price Size Message set to one value */
inline fill_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_record, ox_order_executed_at_price_size_message_value) {
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> ox_order_executed_at_price_size_message_record.time_offset[ox_order_executed_at_price_size_message_at] = ox_order_executed_at_price_size_message_value; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> ox_order_executed_at_price_size_message_record.order_id[ox_order_executed_at_price_size_message_at] = ox_order_executed_at_price_size_message_value; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> ox_order_executed_at_price_size_message_record.executed_quantity[ox_order_executed_at_price_size_message_at] = ox_order_executed_at_price_size_message_value; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> ox_order_executed_at_price_size_message_record.remaining_quantity[ox_order_executed_at_price_size_message_at] = ox_order_executed_at_price_size_message_value; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> ox_order_executed_at_price_size_message_record.execution_id[ox_order_executed_at_price_size_message_at] = ox_order_executed_at_price_size_message_value; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> ox_order_executed_at_price_size_message_record.price_long[ox_order_executed_at_price_size_message_at] = ox_order_executed_at_price_size_message_value; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_record.trade_condition = ox_order_executed_at_price_size_message_value;
  skip
}

/* each byte of Ox Order Executed At Price Size Message set to where it lies, so a field read out of place says so */
inline ramp_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_record, ox_order_executed_at_price_size_message_base) {
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> ox_order_executed_at_price_size_message_record.time_offset[ox_order_executed_at_price_size_message_at] = (ox_order_executed_at_price_size_message_base + 0 + ox_order_executed_at_price_size_message_at + 1) % 256; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> ox_order_executed_at_price_size_message_record.order_id[ox_order_executed_at_price_size_message_at] = (ox_order_executed_at_price_size_message_base + 4 + ox_order_executed_at_price_size_message_at + 1) % 256; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> ox_order_executed_at_price_size_message_record.executed_quantity[ox_order_executed_at_price_size_message_at] = (ox_order_executed_at_price_size_message_base + 12 + ox_order_executed_at_price_size_message_at + 1) % 256; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> ox_order_executed_at_price_size_message_record.remaining_quantity[ox_order_executed_at_price_size_message_at] = (ox_order_executed_at_price_size_message_base + 16 + ox_order_executed_at_price_size_message_at + 1) % 256; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> ox_order_executed_at_price_size_message_record.execution_id[ox_order_executed_at_price_size_message_at] = (ox_order_executed_at_price_size_message_base + 20 + ox_order_executed_at_price_size_message_at + 1) % 256; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> ox_order_executed_at_price_size_message_record.price_long[ox_order_executed_at_price_size_message_at] = (ox_order_executed_at_price_size_message_base + 28 + ox_order_executed_at_price_size_message_at + 1) % 256; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_record.trade_condition = (ox_order_executed_at_price_size_message_base + 36 + 1) % 256;
  skip
}

/* Ox Order Executed At Price Size Message to the wire, 37 bytes from where the cursor stands */
inline encode_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_record) {
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> wire[at] = ox_order_executed_at_price_size_message_record.time_offset[ox_order_executed_at_price_size_message_at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> wire[at] = ox_order_executed_at_price_size_message_record.order_id[ox_order_executed_at_price_size_message_at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> wire[at] = ox_order_executed_at_price_size_message_record.executed_quantity[ox_order_executed_at_price_size_message_at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> wire[at] = ox_order_executed_at_price_size_message_record.remaining_quantity[ox_order_executed_at_price_size_message_at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> wire[at] = ox_order_executed_at_price_size_message_record.execution_id[ox_order_executed_at_price_size_message_at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> wire[at] = ox_order_executed_at_price_size_message_record.price_long[ox_order_executed_at_price_size_message_at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_order_executed_at_price_size_message_record.trade_condition; at = at + 1;
  skip
}

/* Ox Order Executed At Price Size Message off the wire, 37 bytes from where the cursor stands */
inline decode_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_record) {
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> ox_order_executed_at_price_size_message_record.time_offset[ox_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> ox_order_executed_at_price_size_message_record.order_id[ox_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> ox_order_executed_at_price_size_message_record.executed_quantity[ox_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> ox_order_executed_at_price_size_message_record.remaining_quantity[ox_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> ox_order_executed_at_price_size_message_record.execution_id[ox_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> ox_order_executed_at_price_size_message_record.price_long[ox_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Ox Order Executed At Price Size Message is what was written, byte for byte */
inline equal_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_read, ox_order_executed_at_price_size_message_written) {
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> assert(ox_order_executed_at_price_size_message_read.time_offset[ox_order_executed_at_price_size_message_at] == ox_order_executed_at_price_size_message_written.time_offset[ox_order_executed_at_price_size_message_at]); ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> assert(ox_order_executed_at_price_size_message_read.order_id[ox_order_executed_at_price_size_message_at] == ox_order_executed_at_price_size_message_written.order_id[ox_order_executed_at_price_size_message_at]); ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> assert(ox_order_executed_at_price_size_message_read.executed_quantity[ox_order_executed_at_price_size_message_at] == ox_order_executed_at_price_size_message_written.executed_quantity[ox_order_executed_at_price_size_message_at]); ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 4 -> assert(ox_order_executed_at_price_size_message_read.remaining_quantity[ox_order_executed_at_price_size_message_at] == ox_order_executed_at_price_size_message_written.remaining_quantity[ox_order_executed_at_price_size_message_at]); ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> assert(ox_order_executed_at_price_size_message_read.execution_id[ox_order_executed_at_price_size_message_at] == ox_order_executed_at_price_size_message_written.execution_id[ox_order_executed_at_price_size_message_at]); ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ox_order_executed_at_price_size_message_at = 0;
  do
  :: ox_order_executed_at_price_size_message_at < 8 -> assert(ox_order_executed_at_price_size_message_read.price_long[ox_order_executed_at_price_size_message_at] == ox_order_executed_at_price_size_message_written.price_long[ox_order_executed_at_price_size_message_at]); ox_order_executed_at_price_size_message_at = ox_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  assert(ox_order_executed_at_price_size_message_read.trade_condition == ox_order_executed_at_price_size_message_written.trade_condition);
  skip
}

/* ---- Ox Reduce Size Long Message: 16 bytes ----------------------------------- */

/* Reduce Size messages are sent when a visible order on the Cboe book is partially reduced */
typedef OxReduceSizeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_quantity_long[4]
};

int ox_reduce_size_long_message_at;

/* every byte of Ox Reduce Size Long Message set to one value */
inline fill_ox_reduce_size_long_message(ox_reduce_size_long_message_record, ox_reduce_size_long_message_value) {
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> ox_reduce_size_long_message_record.time_offset[ox_reduce_size_long_message_at] = ox_reduce_size_long_message_value; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 8 -> ox_reduce_size_long_message_record.order_id[ox_reduce_size_long_message_at] = ox_reduce_size_long_message_value; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> ox_reduce_size_long_message_record.canceled_quantity_long[ox_reduce_size_long_message_at] = ox_reduce_size_long_message_value; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Reduce Size Long Message set to where it lies, so a field read out of place says so */
inline ramp_ox_reduce_size_long_message(ox_reduce_size_long_message_record, ox_reduce_size_long_message_base) {
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> ox_reduce_size_long_message_record.time_offset[ox_reduce_size_long_message_at] = (ox_reduce_size_long_message_base + 0 + ox_reduce_size_long_message_at + 1) % 256; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 8 -> ox_reduce_size_long_message_record.order_id[ox_reduce_size_long_message_at] = (ox_reduce_size_long_message_base + 4 + ox_reduce_size_long_message_at + 1) % 256; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> ox_reduce_size_long_message_record.canceled_quantity_long[ox_reduce_size_long_message_at] = (ox_reduce_size_long_message_base + 12 + ox_reduce_size_long_message_at + 1) % 256; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Reduce Size Long Message to the wire, 16 bytes from where the cursor stands */
inline encode_ox_reduce_size_long_message(ox_reduce_size_long_message_record) {
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> wire[at] = ox_reduce_size_long_message_record.time_offset[ox_reduce_size_long_message_at]; at = at + 1; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 8 -> wire[at] = ox_reduce_size_long_message_record.order_id[ox_reduce_size_long_message_at]; at = at + 1; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> wire[at] = ox_reduce_size_long_message_record.canceled_quantity_long[ox_reduce_size_long_message_at]; at = at + 1; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Reduce Size Long Message off the wire, 16 bytes from where the cursor stands */
inline decode_ox_reduce_size_long_message(ox_reduce_size_long_message_record) {
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> ox_reduce_size_long_message_record.time_offset[ox_reduce_size_long_message_at] = wire[at]; at = at + 1; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 8 -> ox_reduce_size_long_message_record.order_id[ox_reduce_size_long_message_at] = wire[at]; at = at + 1; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> ox_reduce_size_long_message_record.canceled_quantity_long[ox_reduce_size_long_message_at] = wire[at]; at = at + 1; ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Reduce Size Long Message is what was written, byte for byte */
inline equal_ox_reduce_size_long_message(ox_reduce_size_long_message_read, ox_reduce_size_long_message_written) {
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> assert(ox_reduce_size_long_message_read.time_offset[ox_reduce_size_long_message_at] == ox_reduce_size_long_message_written.time_offset[ox_reduce_size_long_message_at]); ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 8 -> assert(ox_reduce_size_long_message_read.order_id[ox_reduce_size_long_message_at] == ox_reduce_size_long_message_written.order_id[ox_reduce_size_long_message_at]); ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_long_message_at = 0;
  do
  :: ox_reduce_size_long_message_at < 4 -> assert(ox_reduce_size_long_message_read.canceled_quantity_long[ox_reduce_size_long_message_at] == ox_reduce_size_long_message_written.canceled_quantity_long[ox_reduce_size_long_message_at]); ox_reduce_size_long_message_at = ox_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Reduce Size Short Message: 14 bytes ---------------------------------- */

/* Reduce Size messages are sent when a visible order on the Cboe book is partially reduced */
typedef OxReduceSizeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_quantity_short[2]
};

int ox_reduce_size_short_message_at;

/* every byte of Ox Reduce Size Short Message set to one value */
inline fill_ox_reduce_size_short_message(ox_reduce_size_short_message_record, ox_reduce_size_short_message_value) {
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 4 -> ox_reduce_size_short_message_record.time_offset[ox_reduce_size_short_message_at] = ox_reduce_size_short_message_value; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 8 -> ox_reduce_size_short_message_record.order_id[ox_reduce_size_short_message_at] = ox_reduce_size_short_message_value; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 2 -> ox_reduce_size_short_message_record.canceled_quantity_short[ox_reduce_size_short_message_at] = ox_reduce_size_short_message_value; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Reduce Size Short Message set to where it lies, so a field read out of place says so */
inline ramp_ox_reduce_size_short_message(ox_reduce_size_short_message_record, ox_reduce_size_short_message_base) {
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 4 -> ox_reduce_size_short_message_record.time_offset[ox_reduce_size_short_message_at] = (ox_reduce_size_short_message_base + 0 + ox_reduce_size_short_message_at + 1) % 256; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 8 -> ox_reduce_size_short_message_record.order_id[ox_reduce_size_short_message_at] = (ox_reduce_size_short_message_base + 4 + ox_reduce_size_short_message_at + 1) % 256; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 2 -> ox_reduce_size_short_message_record.canceled_quantity_short[ox_reduce_size_short_message_at] = (ox_reduce_size_short_message_base + 12 + ox_reduce_size_short_message_at + 1) % 256; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Reduce Size Short Message to the wire, 14 bytes from where the cursor stands */
inline encode_ox_reduce_size_short_message(ox_reduce_size_short_message_record) {
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 4 -> wire[at] = ox_reduce_size_short_message_record.time_offset[ox_reduce_size_short_message_at]; at = at + 1; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 8 -> wire[at] = ox_reduce_size_short_message_record.order_id[ox_reduce_size_short_message_at]; at = at + 1; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 2 -> wire[at] = ox_reduce_size_short_message_record.canceled_quantity_short[ox_reduce_size_short_message_at]; at = at + 1; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Reduce Size Short Message off the wire, 14 bytes from where the cursor stands */
inline decode_ox_reduce_size_short_message(ox_reduce_size_short_message_record) {
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 4 -> ox_reduce_size_short_message_record.time_offset[ox_reduce_size_short_message_at] = wire[at]; at = at + 1; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 8 -> ox_reduce_size_short_message_record.order_id[ox_reduce_size_short_message_at] = wire[at]; at = at + 1; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 2 -> ox_reduce_size_short_message_record.canceled_quantity_short[ox_reduce_size_short_message_at] = wire[at]; at = at + 1; ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Reduce Size Short Message is what was written, byte for byte */
inline equal_ox_reduce_size_short_message(ox_reduce_size_short_message_read, ox_reduce_size_short_message_written) {
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 4 -> assert(ox_reduce_size_short_message_read.time_offset[ox_reduce_size_short_message_at] == ox_reduce_size_short_message_written.time_offset[ox_reduce_size_short_message_at]); ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 8 -> assert(ox_reduce_size_short_message_read.order_id[ox_reduce_size_short_message_at] == ox_reduce_size_short_message_written.order_id[ox_reduce_size_short_message_at]); ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  ox_reduce_size_short_message_at = 0;
  do
  :: ox_reduce_size_short_message_at < 2 -> assert(ox_reduce_size_short_message_read.canceled_quantity_short[ox_reduce_size_short_message_at] == ox_reduce_size_short_message_written.canceled_quantity_short[ox_reduce_size_short_message_at]); ox_reduce_size_short_message_at = ox_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Delete Order Message: 12 bytes --------------------------------------- */

/* The Delete Order message is sent whenever a booked order is cancelled or leaves the order book */
typedef OxDeleteOrderMessage {
  byte time_offset[4];
  byte order_id[8]
};

int ox_delete_order_message_at;

/* every byte of Ox Delete Order Message set to one value */
inline fill_ox_delete_order_message(ox_delete_order_message_record, ox_delete_order_message_value) {
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 4 -> ox_delete_order_message_record.time_offset[ox_delete_order_message_at] = ox_delete_order_message_value; ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 8 -> ox_delete_order_message_record.order_id[ox_delete_order_message_at] = ox_delete_order_message_value; ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_ox_delete_order_message(ox_delete_order_message_record, ox_delete_order_message_base) {
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 4 -> ox_delete_order_message_record.time_offset[ox_delete_order_message_at] = (ox_delete_order_message_base + 0 + ox_delete_order_message_at + 1) % 256; ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 8 -> ox_delete_order_message_record.order_id[ox_delete_order_message_at] = (ox_delete_order_message_base + 4 + ox_delete_order_message_at + 1) % 256; ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Delete Order Message to the wire, 12 bytes from where the cursor stands */
inline encode_ox_delete_order_message(ox_delete_order_message_record) {
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 4 -> wire[at] = ox_delete_order_message_record.time_offset[ox_delete_order_message_at]; at = at + 1; ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 8 -> wire[at] = ox_delete_order_message_record.order_id[ox_delete_order_message_at]; at = at + 1; ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Delete Order Message off the wire, 12 bytes from where the cursor stands */
inline decode_ox_delete_order_message(ox_delete_order_message_record) {
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 4 -> ox_delete_order_message_record.time_offset[ox_delete_order_message_at] = wire[at]; at = at + 1; ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 8 -> ox_delete_order_message_record.order_id[ox_delete_order_message_at] = wire[at]; at = at + 1; ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Delete Order Message is what was written, byte for byte */
inline equal_ox_delete_order_message(ox_delete_order_message_read, ox_delete_order_message_written) {
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 4 -> assert(ox_delete_order_message_read.time_offset[ox_delete_order_message_at] == ox_delete_order_message_written.time_offset[ox_delete_order_message_at]); ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  ox_delete_order_message_at = 0;
  do
  :: ox_delete_order_message_at < 8 -> assert(ox_delete_order_message_read.order_id[ox_delete_order_message_at] == ox_delete_order_message_written.order_id[ox_delete_order_message_at]); ox_delete_order_message_at = ox_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Trade Long Message: 40 bytes ----------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers */
typedef OxTradeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte symbol[6];
  byte price_long[8];
  byte execution_id[8];
  byte trade_condition
};

int ox_trade_long_message_at;

/* every byte of Ox Trade Long Message set to one value */
inline fill_ox_trade_long_message(ox_trade_long_message_record, ox_trade_long_message_value) {
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> ox_trade_long_message_record.time_offset[ox_trade_long_message_at] = ox_trade_long_message_value; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> ox_trade_long_message_record.order_id[ox_trade_long_message_at] = ox_trade_long_message_value; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_record.side_indicator = ox_trade_long_message_value;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> ox_trade_long_message_record.quantity_long[ox_trade_long_message_at] = ox_trade_long_message_value; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 6 -> ox_trade_long_message_record.symbol[ox_trade_long_message_at] = ox_trade_long_message_value; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> ox_trade_long_message_record.price_long[ox_trade_long_message_at] = ox_trade_long_message_value; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> ox_trade_long_message_record.execution_id[ox_trade_long_message_at] = ox_trade_long_message_value; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_record.trade_condition = ox_trade_long_message_value;
  skip
}

/* each byte of Ox Trade Long Message set to where it lies, so a field read out of place says so */
inline ramp_ox_trade_long_message(ox_trade_long_message_record, ox_trade_long_message_base) {
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> ox_trade_long_message_record.time_offset[ox_trade_long_message_at] = (ox_trade_long_message_base + 0 + ox_trade_long_message_at + 1) % 256; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> ox_trade_long_message_record.order_id[ox_trade_long_message_at] = (ox_trade_long_message_base + 4 + ox_trade_long_message_at + 1) % 256; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_record.side_indicator = (ox_trade_long_message_base + 12 + 1) % 256;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> ox_trade_long_message_record.quantity_long[ox_trade_long_message_at] = (ox_trade_long_message_base + 13 + ox_trade_long_message_at + 1) % 256; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 6 -> ox_trade_long_message_record.symbol[ox_trade_long_message_at] = (ox_trade_long_message_base + 17 + ox_trade_long_message_at + 1) % 256; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> ox_trade_long_message_record.price_long[ox_trade_long_message_at] = (ox_trade_long_message_base + 23 + ox_trade_long_message_at + 1) % 256; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> ox_trade_long_message_record.execution_id[ox_trade_long_message_at] = (ox_trade_long_message_base + 31 + ox_trade_long_message_at + 1) % 256; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_record.trade_condition = (ox_trade_long_message_base + 39 + 1) % 256;
  skip
}

/* Ox Trade Long Message to the wire, 40 bytes from where the cursor stands */
inline encode_ox_trade_long_message(ox_trade_long_message_record) {
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> wire[at] = ox_trade_long_message_record.time_offset[ox_trade_long_message_at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> wire[at] = ox_trade_long_message_record.order_id[ox_trade_long_message_at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_trade_long_message_record.side_indicator; at = at + 1;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> wire[at] = ox_trade_long_message_record.quantity_long[ox_trade_long_message_at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 6 -> wire[at] = ox_trade_long_message_record.symbol[ox_trade_long_message_at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> wire[at] = ox_trade_long_message_record.price_long[ox_trade_long_message_at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> wire[at] = ox_trade_long_message_record.execution_id[ox_trade_long_message_at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_trade_long_message_record.trade_condition; at = at + 1;
  skip
}

/* Ox Trade Long Message off the wire, 40 bytes from where the cursor stands */
inline decode_ox_trade_long_message(ox_trade_long_message_record) {
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> ox_trade_long_message_record.time_offset[ox_trade_long_message_at] = wire[at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> ox_trade_long_message_record.order_id[ox_trade_long_message_at] = wire[at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_record.side_indicator = wire[at]; at = at + 1;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> ox_trade_long_message_record.quantity_long[ox_trade_long_message_at] = wire[at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 6 -> ox_trade_long_message_record.symbol[ox_trade_long_message_at] = wire[at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> ox_trade_long_message_record.price_long[ox_trade_long_message_at] = wire[at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> ox_trade_long_message_record.execution_id[ox_trade_long_message_at] = wire[at]; at = at + 1; ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Ox Trade Long Message is what was written, byte for byte */
inline equal_ox_trade_long_message(ox_trade_long_message_read, ox_trade_long_message_written) {
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> assert(ox_trade_long_message_read.time_offset[ox_trade_long_message_at] == ox_trade_long_message_written.time_offset[ox_trade_long_message_at]); ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> assert(ox_trade_long_message_read.order_id[ox_trade_long_message_at] == ox_trade_long_message_written.order_id[ox_trade_long_message_at]); ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  assert(ox_trade_long_message_read.side_indicator == ox_trade_long_message_written.side_indicator);
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 4 -> assert(ox_trade_long_message_read.quantity_long[ox_trade_long_message_at] == ox_trade_long_message_written.quantity_long[ox_trade_long_message_at]); ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 6 -> assert(ox_trade_long_message_read.symbol[ox_trade_long_message_at] == ox_trade_long_message_written.symbol[ox_trade_long_message_at]); ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> assert(ox_trade_long_message_read.price_long[ox_trade_long_message_at] == ox_trade_long_message_written.price_long[ox_trade_long_message_at]); ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  ox_trade_long_message_at = 0;
  do
  :: ox_trade_long_message_at < 8 -> assert(ox_trade_long_message_read.execution_id[ox_trade_long_message_at] == ox_trade_long_message_written.execution_id[ox_trade_long_message_at]); ox_trade_long_message_at = ox_trade_long_message_at + 1
  :: else -> break
  od;
  assert(ox_trade_long_message_read.trade_condition == ox_trade_long_message_written.trade_condition);
  skip
}

/* ---- Ox Trade Short Message: 32 bytes ---------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers */
typedef OxTradeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_short[2];
  byte symbol[6];
  byte price_short[2];
  byte execution_id[8];
  byte trade_condition
};

int ox_trade_short_message_at;

/* every byte of Ox Trade Short Message set to one value */
inline fill_ox_trade_short_message(ox_trade_short_message_record, ox_trade_short_message_value) {
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 4 -> ox_trade_short_message_record.time_offset[ox_trade_short_message_at] = ox_trade_short_message_value; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> ox_trade_short_message_record.order_id[ox_trade_short_message_at] = ox_trade_short_message_value; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_record.side_indicator = ox_trade_short_message_value;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> ox_trade_short_message_record.quantity_short[ox_trade_short_message_at] = ox_trade_short_message_value; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 6 -> ox_trade_short_message_record.symbol[ox_trade_short_message_at] = ox_trade_short_message_value; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> ox_trade_short_message_record.price_short[ox_trade_short_message_at] = ox_trade_short_message_value; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> ox_trade_short_message_record.execution_id[ox_trade_short_message_at] = ox_trade_short_message_value; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_record.trade_condition = ox_trade_short_message_value;
  skip
}

/* each byte of Ox Trade Short Message set to where it lies, so a field read out of place says so */
inline ramp_ox_trade_short_message(ox_trade_short_message_record, ox_trade_short_message_base) {
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 4 -> ox_trade_short_message_record.time_offset[ox_trade_short_message_at] = (ox_trade_short_message_base + 0 + ox_trade_short_message_at + 1) % 256; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> ox_trade_short_message_record.order_id[ox_trade_short_message_at] = (ox_trade_short_message_base + 4 + ox_trade_short_message_at + 1) % 256; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_record.side_indicator = (ox_trade_short_message_base + 12 + 1) % 256;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> ox_trade_short_message_record.quantity_short[ox_trade_short_message_at] = (ox_trade_short_message_base + 13 + ox_trade_short_message_at + 1) % 256; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 6 -> ox_trade_short_message_record.symbol[ox_trade_short_message_at] = (ox_trade_short_message_base + 15 + ox_trade_short_message_at + 1) % 256; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> ox_trade_short_message_record.price_short[ox_trade_short_message_at] = (ox_trade_short_message_base + 21 + ox_trade_short_message_at + 1) % 256; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> ox_trade_short_message_record.execution_id[ox_trade_short_message_at] = (ox_trade_short_message_base + 23 + ox_trade_short_message_at + 1) % 256; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_record.trade_condition = (ox_trade_short_message_base + 31 + 1) % 256;
  skip
}

/* Ox Trade Short Message to the wire, 32 bytes from where the cursor stands */
inline encode_ox_trade_short_message(ox_trade_short_message_record) {
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 4 -> wire[at] = ox_trade_short_message_record.time_offset[ox_trade_short_message_at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> wire[at] = ox_trade_short_message_record.order_id[ox_trade_short_message_at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_trade_short_message_record.side_indicator; at = at + 1;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> wire[at] = ox_trade_short_message_record.quantity_short[ox_trade_short_message_at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 6 -> wire[at] = ox_trade_short_message_record.symbol[ox_trade_short_message_at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> wire[at] = ox_trade_short_message_record.price_short[ox_trade_short_message_at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> wire[at] = ox_trade_short_message_record.execution_id[ox_trade_short_message_at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_trade_short_message_record.trade_condition; at = at + 1;
  skip
}

/* Ox Trade Short Message off the wire, 32 bytes from where the cursor stands */
inline decode_ox_trade_short_message(ox_trade_short_message_record) {
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 4 -> ox_trade_short_message_record.time_offset[ox_trade_short_message_at] = wire[at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> ox_trade_short_message_record.order_id[ox_trade_short_message_at] = wire[at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_record.side_indicator = wire[at]; at = at + 1;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> ox_trade_short_message_record.quantity_short[ox_trade_short_message_at] = wire[at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 6 -> ox_trade_short_message_record.symbol[ox_trade_short_message_at] = wire[at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> ox_trade_short_message_record.price_short[ox_trade_short_message_at] = wire[at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> ox_trade_short_message_record.execution_id[ox_trade_short_message_at] = wire[at]; at = at + 1; ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Ox Trade Short Message is what was written, byte for byte */
inline equal_ox_trade_short_message(ox_trade_short_message_read, ox_trade_short_message_written) {
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 4 -> assert(ox_trade_short_message_read.time_offset[ox_trade_short_message_at] == ox_trade_short_message_written.time_offset[ox_trade_short_message_at]); ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> assert(ox_trade_short_message_read.order_id[ox_trade_short_message_at] == ox_trade_short_message_written.order_id[ox_trade_short_message_at]); ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  assert(ox_trade_short_message_read.side_indicator == ox_trade_short_message_written.side_indicator);
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> assert(ox_trade_short_message_read.quantity_short[ox_trade_short_message_at] == ox_trade_short_message_written.quantity_short[ox_trade_short_message_at]); ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 6 -> assert(ox_trade_short_message_read.symbol[ox_trade_short_message_at] == ox_trade_short_message_written.symbol[ox_trade_short_message_at]); ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 2 -> assert(ox_trade_short_message_read.price_short[ox_trade_short_message_at] == ox_trade_short_message_written.price_short[ox_trade_short_message_at]); ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  ox_trade_short_message_at = 0;
  do
  :: ox_trade_short_message_at < 8 -> assert(ox_trade_short_message_read.execution_id[ox_trade_short_message_at] == ox_trade_short_message_written.execution_id[ox_trade_short_message_at]); ox_trade_short_message_at = ox_trade_short_message_at + 1
  :: else -> break
  od;
  assert(ox_trade_short_message_read.trade_condition == ox_trade_short_message_written.trade_condition);
  skip
}

/* ---- Ox Trade Expanded Message: 42 bytes ------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers. Expanded version accommodates larger symbol sizes possible through the ISRA plan. */
typedef OxTradeExpandedMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte expanded_symbol[8];
  byte price_long[8];
  byte execution_id[8];
  byte trade_condition
};

int ox_trade_expanded_message_at;

/* every byte of Ox Trade Expanded Message set to one value */
inline fill_ox_trade_expanded_message(ox_trade_expanded_message_record, ox_trade_expanded_message_value) {
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> ox_trade_expanded_message_record.time_offset[ox_trade_expanded_message_at] = ox_trade_expanded_message_value; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.order_id[ox_trade_expanded_message_at] = ox_trade_expanded_message_value; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_record.side_indicator = ox_trade_expanded_message_value;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> ox_trade_expanded_message_record.quantity_long[ox_trade_expanded_message_at] = ox_trade_expanded_message_value; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.expanded_symbol[ox_trade_expanded_message_at] = ox_trade_expanded_message_value; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.price_long[ox_trade_expanded_message_at] = ox_trade_expanded_message_value; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.execution_id[ox_trade_expanded_message_at] = ox_trade_expanded_message_value; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_record.trade_condition = ox_trade_expanded_message_value;
  skip
}

/* each byte of Ox Trade Expanded Message set to where it lies, so a field read out of place says so */
inline ramp_ox_trade_expanded_message(ox_trade_expanded_message_record, ox_trade_expanded_message_base) {
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> ox_trade_expanded_message_record.time_offset[ox_trade_expanded_message_at] = (ox_trade_expanded_message_base + 0 + ox_trade_expanded_message_at + 1) % 256; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.order_id[ox_trade_expanded_message_at] = (ox_trade_expanded_message_base + 4 + ox_trade_expanded_message_at + 1) % 256; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_record.side_indicator = (ox_trade_expanded_message_base + 12 + 1) % 256;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> ox_trade_expanded_message_record.quantity_long[ox_trade_expanded_message_at] = (ox_trade_expanded_message_base + 13 + ox_trade_expanded_message_at + 1) % 256; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.expanded_symbol[ox_trade_expanded_message_at] = (ox_trade_expanded_message_base + 17 + ox_trade_expanded_message_at + 1) % 256; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.price_long[ox_trade_expanded_message_at] = (ox_trade_expanded_message_base + 25 + ox_trade_expanded_message_at + 1) % 256; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.execution_id[ox_trade_expanded_message_at] = (ox_trade_expanded_message_base + 33 + ox_trade_expanded_message_at + 1) % 256; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_record.trade_condition = (ox_trade_expanded_message_base + 41 + 1) % 256;
  skip
}

/* Ox Trade Expanded Message to the wire, 42 bytes from where the cursor stands */
inline encode_ox_trade_expanded_message(ox_trade_expanded_message_record) {
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> wire[at] = ox_trade_expanded_message_record.time_offset[ox_trade_expanded_message_at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> wire[at] = ox_trade_expanded_message_record.order_id[ox_trade_expanded_message_at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_trade_expanded_message_record.side_indicator; at = at + 1;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> wire[at] = ox_trade_expanded_message_record.quantity_long[ox_trade_expanded_message_at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> wire[at] = ox_trade_expanded_message_record.expanded_symbol[ox_trade_expanded_message_at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> wire[at] = ox_trade_expanded_message_record.price_long[ox_trade_expanded_message_at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> wire[at] = ox_trade_expanded_message_record.execution_id[ox_trade_expanded_message_at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_trade_expanded_message_record.trade_condition; at = at + 1;
  skip
}

/* Ox Trade Expanded Message off the wire, 42 bytes from where the cursor stands */
inline decode_ox_trade_expanded_message(ox_trade_expanded_message_record) {
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> ox_trade_expanded_message_record.time_offset[ox_trade_expanded_message_at] = wire[at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.order_id[ox_trade_expanded_message_at] = wire[at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_record.side_indicator = wire[at]; at = at + 1;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> ox_trade_expanded_message_record.quantity_long[ox_trade_expanded_message_at] = wire[at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.expanded_symbol[ox_trade_expanded_message_at] = wire[at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.price_long[ox_trade_expanded_message_at] = wire[at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> ox_trade_expanded_message_record.execution_id[ox_trade_expanded_message_at] = wire[at]; at = at + 1; ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Ox Trade Expanded Message is what was written, byte for byte */
inline equal_ox_trade_expanded_message(ox_trade_expanded_message_read, ox_trade_expanded_message_written) {
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> assert(ox_trade_expanded_message_read.time_offset[ox_trade_expanded_message_at] == ox_trade_expanded_message_written.time_offset[ox_trade_expanded_message_at]); ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> assert(ox_trade_expanded_message_read.order_id[ox_trade_expanded_message_at] == ox_trade_expanded_message_written.order_id[ox_trade_expanded_message_at]); ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  assert(ox_trade_expanded_message_read.side_indicator == ox_trade_expanded_message_written.side_indicator);
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 4 -> assert(ox_trade_expanded_message_read.quantity_long[ox_trade_expanded_message_at] == ox_trade_expanded_message_written.quantity_long[ox_trade_expanded_message_at]); ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> assert(ox_trade_expanded_message_read.expanded_symbol[ox_trade_expanded_message_at] == ox_trade_expanded_message_written.expanded_symbol[ox_trade_expanded_message_at]); ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> assert(ox_trade_expanded_message_read.price_long[ox_trade_expanded_message_at] == ox_trade_expanded_message_written.price_long[ox_trade_expanded_message_at]); ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  ox_trade_expanded_message_at = 0;
  do
  :: ox_trade_expanded_message_at < 8 -> assert(ox_trade_expanded_message_read.execution_id[ox_trade_expanded_message_at] == ox_trade_expanded_message_written.execution_id[ox_trade_expanded_message_at]); ox_trade_expanded_message_at = ox_trade_expanded_message_at + 1
  :: else -> break
  od;
  assert(ox_trade_expanded_message_read.trade_condition == ox_trade_expanded_message_written.trade_condition);
  skip
}

/* ---- Ox Trade Break Message: 12 bytes ---------------------------------------- */

/* The Trade Break message is sent whenever an execution on Cboe is broken */
typedef OxTradeBreakMessage {
  byte time_offset[4];
  byte execution_id[8]
};

int ox_trade_break_message_at;

/* every byte of Ox Trade Break Message set to one value */
inline fill_ox_trade_break_message(ox_trade_break_message_record, ox_trade_break_message_value) {
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 4 -> ox_trade_break_message_record.time_offset[ox_trade_break_message_at] = ox_trade_break_message_value; ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 8 -> ox_trade_break_message_record.execution_id[ox_trade_break_message_at] = ox_trade_break_message_value; ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_ox_trade_break_message(ox_trade_break_message_record, ox_trade_break_message_base) {
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 4 -> ox_trade_break_message_record.time_offset[ox_trade_break_message_at] = (ox_trade_break_message_base + 0 + ox_trade_break_message_at + 1) % 256; ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 8 -> ox_trade_break_message_record.execution_id[ox_trade_break_message_at] = (ox_trade_break_message_base + 4 + ox_trade_break_message_at + 1) % 256; ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Trade Break Message to the wire, 12 bytes from where the cursor stands */
inline encode_ox_trade_break_message(ox_trade_break_message_record) {
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 4 -> wire[at] = ox_trade_break_message_record.time_offset[ox_trade_break_message_at]; at = at + 1; ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 8 -> wire[at] = ox_trade_break_message_record.execution_id[ox_trade_break_message_at]; at = at + 1; ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Trade Break Message off the wire, 12 bytes from where the cursor stands */
inline decode_ox_trade_break_message(ox_trade_break_message_record) {
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 4 -> ox_trade_break_message_record.time_offset[ox_trade_break_message_at] = wire[at]; at = at + 1; ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 8 -> ox_trade_break_message_record.execution_id[ox_trade_break_message_at] = wire[at]; at = at + 1; ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Trade Break Message is what was written, byte for byte */
inline equal_ox_trade_break_message(ox_trade_break_message_read, ox_trade_break_message_written) {
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 4 -> assert(ox_trade_break_message_read.time_offset[ox_trade_break_message_at] == ox_trade_break_message_written.time_offset[ox_trade_break_message_at]); ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  ox_trade_break_message_at = 0;
  do
  :: ox_trade_break_message_at < 8 -> assert(ox_trade_break_message_read.execution_id[ox_trade_break_message_at] == ox_trade_break_message_written.execution_id[ox_trade_break_message_at]); ox_trade_break_message_at = ox_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox End Of Session: 4 bytes ---------------------------------------------- */

/* The End of Session message is sent for each unit when the unit shuts down */
typedef OxEndOfSession {
  byte time_offset[4]
};

int ox_end_of_session_at;

/* every byte of Ox End Of Session set to one value */
inline fill_ox_end_of_session(ox_end_of_session_record, ox_end_of_session_value) {
  ox_end_of_session_at = 0;
  do
  :: ox_end_of_session_at < 4 -> ox_end_of_session_record.time_offset[ox_end_of_session_at] = ox_end_of_session_value; ox_end_of_session_at = ox_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox End Of Session set to where it lies, so a field read out of place says so */
inline ramp_ox_end_of_session(ox_end_of_session_record, ox_end_of_session_base) {
  ox_end_of_session_at = 0;
  do
  :: ox_end_of_session_at < 4 -> ox_end_of_session_record.time_offset[ox_end_of_session_at] = (ox_end_of_session_base + 0 + ox_end_of_session_at + 1) % 256; ox_end_of_session_at = ox_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* Ox End Of Session to the wire, 4 bytes from where the cursor stands */
inline encode_ox_end_of_session(ox_end_of_session_record) {
  ox_end_of_session_at = 0;
  do
  :: ox_end_of_session_at < 4 -> wire[at] = ox_end_of_session_record.time_offset[ox_end_of_session_at]; at = at + 1; ox_end_of_session_at = ox_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* Ox End Of Session off the wire, 4 bytes from where the cursor stands */
inline decode_ox_end_of_session(ox_end_of_session_record) {
  ox_end_of_session_at = 0;
  do
  :: ox_end_of_session_at < 4 -> ox_end_of_session_record.time_offset[ox_end_of_session_at] = wire[at]; at = at + 1; ox_end_of_session_at = ox_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox End Of Session is what was written, byte for byte */
inline equal_ox_end_of_session(ox_end_of_session_read, ox_end_of_session_written) {
  ox_end_of_session_at = 0;
  do
  :: ox_end_of_session_at < 4 -> assert(ox_end_of_session_read.time_offset[ox_end_of_session_at] == ox_end_of_session_written.time_offset[ox_end_of_session_at]); ox_end_of_session_at = ox_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Symbol Mapping Message: 36 bytes ------------------------------------- */

/* A Symbol Mapping message is used to map the 6 character multicast feed symbol field to an OSI symbol and Underlying. These messages are not sequenced and are sent continuously through the day at variable rates as bandwidth allows. */
typedef OxSymbolMappingMessage {
  byte feed_symbol[6];
  byte osi_symbol[21];
  byte symbol_condition;
  byte underlying[8]
};

int ox_symbol_mapping_message_at;

/* every byte of Ox Symbol Mapping Message set to one value */
inline fill_ox_symbol_mapping_message(ox_symbol_mapping_message_record, ox_symbol_mapping_message_value) {
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 6 -> ox_symbol_mapping_message_record.feed_symbol[ox_symbol_mapping_message_at] = ox_symbol_mapping_message_value; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 21 -> ox_symbol_mapping_message_record.osi_symbol[ox_symbol_mapping_message_at] = ox_symbol_mapping_message_value; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_symbol_mapping_message_record.symbol_condition = ox_symbol_mapping_message_value;
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 8 -> ox_symbol_mapping_message_record.underlying[ox_symbol_mapping_message_at] = ox_symbol_mapping_message_value; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_ox_symbol_mapping_message(ox_symbol_mapping_message_record, ox_symbol_mapping_message_base) {
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 6 -> ox_symbol_mapping_message_record.feed_symbol[ox_symbol_mapping_message_at] = (ox_symbol_mapping_message_base + 0 + ox_symbol_mapping_message_at + 1) % 256; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 21 -> ox_symbol_mapping_message_record.osi_symbol[ox_symbol_mapping_message_at] = (ox_symbol_mapping_message_base + 6 + ox_symbol_mapping_message_at + 1) % 256; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_symbol_mapping_message_record.symbol_condition = (ox_symbol_mapping_message_base + 27 + 1) % 256;
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 8 -> ox_symbol_mapping_message_record.underlying[ox_symbol_mapping_message_at] = (ox_symbol_mapping_message_base + 28 + ox_symbol_mapping_message_at + 1) % 256; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Symbol Mapping Message to the wire, 36 bytes from where the cursor stands */
inline encode_ox_symbol_mapping_message(ox_symbol_mapping_message_record) {
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 6 -> wire[at] = ox_symbol_mapping_message_record.feed_symbol[ox_symbol_mapping_message_at]; at = at + 1; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 21 -> wire[at] = ox_symbol_mapping_message_record.osi_symbol[ox_symbol_mapping_message_at]; at = at + 1; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_symbol_mapping_message_record.symbol_condition; at = at + 1;
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 8 -> wire[at] = ox_symbol_mapping_message_record.underlying[ox_symbol_mapping_message_at]; at = at + 1; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Symbol Mapping Message off the wire, 36 bytes from where the cursor stands */
inline decode_ox_symbol_mapping_message(ox_symbol_mapping_message_record) {
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 6 -> ox_symbol_mapping_message_record.feed_symbol[ox_symbol_mapping_message_at] = wire[at]; at = at + 1; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 21 -> ox_symbol_mapping_message_record.osi_symbol[ox_symbol_mapping_message_at] = wire[at]; at = at + 1; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_symbol_mapping_message_record.symbol_condition = wire[at]; at = at + 1;
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 8 -> ox_symbol_mapping_message_record.underlying[ox_symbol_mapping_message_at] = wire[at]; at = at + 1; ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Symbol Mapping Message is what was written, byte for byte */
inline equal_ox_symbol_mapping_message(ox_symbol_mapping_message_read, ox_symbol_mapping_message_written) {
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 6 -> assert(ox_symbol_mapping_message_read.feed_symbol[ox_symbol_mapping_message_at] == ox_symbol_mapping_message_written.feed_symbol[ox_symbol_mapping_message_at]); ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 21 -> assert(ox_symbol_mapping_message_read.osi_symbol[ox_symbol_mapping_message_at] == ox_symbol_mapping_message_written.osi_symbol[ox_symbol_mapping_message_at]); ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(ox_symbol_mapping_message_read.symbol_condition == ox_symbol_mapping_message_written.symbol_condition);
  ox_symbol_mapping_message_at = 0;
  do
  :: ox_symbol_mapping_message_at < 8 -> assert(ox_symbol_mapping_message_read.underlying[ox_symbol_mapping_message_at] == ox_symbol_mapping_message_written.underlying[ox_symbol_mapping_message_at]); ox_symbol_mapping_message_at = ox_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Trading Status Message: 16 bytes ------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a security */
typedef OxTradingStatusMessage {
  byte time_offset[4];
  byte symbol[6];
  byte reserved_2[2];
  byte trading_status;
  byte reserved_1;
  byte gth_trading_status;
  byte second_reserved_1
};

int ox_trading_status_message_at;

/* every byte of Ox Trading Status Message set to one value */
inline fill_ox_trading_status_message(ox_trading_status_message_record, ox_trading_status_message_value) {
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 4 -> ox_trading_status_message_record.time_offset[ox_trading_status_message_at] = ox_trading_status_message_value; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 6 -> ox_trading_status_message_record.symbol[ox_trading_status_message_at] = ox_trading_status_message_value; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 2 -> ox_trading_status_message_record.reserved_2[ox_trading_status_message_at] = ox_trading_status_message_value; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_record.trading_status = ox_trading_status_message_value;
  ox_trading_status_message_record.reserved_1 = ox_trading_status_message_value;
  ox_trading_status_message_record.gth_trading_status = ox_trading_status_message_value;
  ox_trading_status_message_record.second_reserved_1 = ox_trading_status_message_value;
  skip
}

/* each byte of Ox Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_ox_trading_status_message(ox_trading_status_message_record, ox_trading_status_message_base) {
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 4 -> ox_trading_status_message_record.time_offset[ox_trading_status_message_at] = (ox_trading_status_message_base + 0 + ox_trading_status_message_at + 1) % 256; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 6 -> ox_trading_status_message_record.symbol[ox_trading_status_message_at] = (ox_trading_status_message_base + 4 + ox_trading_status_message_at + 1) % 256; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 2 -> ox_trading_status_message_record.reserved_2[ox_trading_status_message_at] = (ox_trading_status_message_base + 10 + ox_trading_status_message_at + 1) % 256; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_record.trading_status = (ox_trading_status_message_base + 12 + 1) % 256;
  ox_trading_status_message_record.reserved_1 = (ox_trading_status_message_base + 13 + 1) % 256;
  ox_trading_status_message_record.gth_trading_status = (ox_trading_status_message_base + 14 + 1) % 256;
  ox_trading_status_message_record.second_reserved_1 = (ox_trading_status_message_base + 15 + 1) % 256;
  skip
}

/* Ox Trading Status Message to the wire, 16 bytes from where the cursor stands */
inline encode_ox_trading_status_message(ox_trading_status_message_record) {
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 4 -> wire[at] = ox_trading_status_message_record.time_offset[ox_trading_status_message_at]; at = at + 1; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 6 -> wire[at] = ox_trading_status_message_record.symbol[ox_trading_status_message_at]; at = at + 1; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 2 -> wire[at] = ox_trading_status_message_record.reserved_2[ox_trading_status_message_at]; at = at + 1; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_trading_status_message_record.trading_status; at = at + 1;
  wire[at] = ox_trading_status_message_record.reserved_1; at = at + 1;
  wire[at] = ox_trading_status_message_record.gth_trading_status; at = at + 1;
  wire[at] = ox_trading_status_message_record.second_reserved_1; at = at + 1;
  skip
}

/* Ox Trading Status Message off the wire, 16 bytes from where the cursor stands */
inline decode_ox_trading_status_message(ox_trading_status_message_record) {
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 4 -> ox_trading_status_message_record.time_offset[ox_trading_status_message_at] = wire[at]; at = at + 1; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 6 -> ox_trading_status_message_record.symbol[ox_trading_status_message_at] = wire[at]; at = at + 1; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 2 -> ox_trading_status_message_record.reserved_2[ox_trading_status_message_at] = wire[at]; at = at + 1; ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_record.trading_status = wire[at]; at = at + 1;
  ox_trading_status_message_record.reserved_1 = wire[at]; at = at + 1;
  ox_trading_status_message_record.gth_trading_status = wire[at]; at = at + 1;
  ox_trading_status_message_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Ox Trading Status Message is what was written, byte for byte */
inline equal_ox_trading_status_message(ox_trading_status_message_read, ox_trading_status_message_written) {
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 4 -> assert(ox_trading_status_message_read.time_offset[ox_trading_status_message_at] == ox_trading_status_message_written.time_offset[ox_trading_status_message_at]); ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 6 -> assert(ox_trading_status_message_read.symbol[ox_trading_status_message_at] == ox_trading_status_message_written.symbol[ox_trading_status_message_at]); ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  ox_trading_status_message_at = 0;
  do
  :: ox_trading_status_message_at < 2 -> assert(ox_trading_status_message_read.reserved_2[ox_trading_status_message_at] == ox_trading_status_message_written.reserved_2[ox_trading_status_message_at]); ox_trading_status_message_at = ox_trading_status_message_at + 1
  :: else -> break
  od;
  assert(ox_trading_status_message_read.trading_status == ox_trading_status_message_written.trading_status);
  assert(ox_trading_status_message_read.reserved_1 == ox_trading_status_message_written.reserved_1);
  assert(ox_trading_status_message_read.gth_trading_status == ox_trading_status_message_written.gth_trading_status);
  assert(ox_trading_status_message_read.second_reserved_1 == ox_trading_status_message_written.second_reserved_1);
  skip
}

/* ---- Ox Width Update Message: 17 bytes --------------------------------------- */

/* The Width Update message is used to communicate opening quote width multiplier. This message will be sent in the event that the exchange decides to change the quote width multiplier on a per underlying basis. */
typedef OxWidthUpdateMessage {
  byte time_offset[4];
  byte underlying[8];
  byte width_type;
  byte multiplier[4]
};

int ox_width_update_message_at;

/* every byte of Ox Width Update Message set to one value */
inline fill_ox_width_update_message(ox_width_update_message_record, ox_width_update_message_value) {
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> ox_width_update_message_record.time_offset[ox_width_update_message_at] = ox_width_update_message_value; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 8 -> ox_width_update_message_record.underlying[ox_width_update_message_at] = ox_width_update_message_value; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  ox_width_update_message_record.width_type = ox_width_update_message_value;
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> ox_width_update_message_record.multiplier[ox_width_update_message_at] = ox_width_update_message_value; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Width Update Message set to where it lies, so a field read out of place says so */
inline ramp_ox_width_update_message(ox_width_update_message_record, ox_width_update_message_base) {
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> ox_width_update_message_record.time_offset[ox_width_update_message_at] = (ox_width_update_message_base + 0 + ox_width_update_message_at + 1) % 256; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 8 -> ox_width_update_message_record.underlying[ox_width_update_message_at] = (ox_width_update_message_base + 4 + ox_width_update_message_at + 1) % 256; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  ox_width_update_message_record.width_type = (ox_width_update_message_base + 12 + 1) % 256;
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> ox_width_update_message_record.multiplier[ox_width_update_message_at] = (ox_width_update_message_base + 13 + ox_width_update_message_at + 1) % 256; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Width Update Message to the wire, 17 bytes from where the cursor stands */
inline encode_ox_width_update_message(ox_width_update_message_record) {
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> wire[at] = ox_width_update_message_record.time_offset[ox_width_update_message_at]; at = at + 1; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 8 -> wire[at] = ox_width_update_message_record.underlying[ox_width_update_message_at]; at = at + 1; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_width_update_message_record.width_type; at = at + 1;
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> wire[at] = ox_width_update_message_record.multiplier[ox_width_update_message_at]; at = at + 1; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Width Update Message off the wire, 17 bytes from where the cursor stands */
inline decode_ox_width_update_message(ox_width_update_message_record) {
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> ox_width_update_message_record.time_offset[ox_width_update_message_at] = wire[at]; at = at + 1; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 8 -> ox_width_update_message_record.underlying[ox_width_update_message_at] = wire[at]; at = at + 1; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  ox_width_update_message_record.width_type = wire[at]; at = at + 1;
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> ox_width_update_message_record.multiplier[ox_width_update_message_at] = wire[at]; at = at + 1; ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Width Update Message is what was written, byte for byte */
inline equal_ox_width_update_message(ox_width_update_message_read, ox_width_update_message_written) {
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> assert(ox_width_update_message_read.time_offset[ox_width_update_message_at] == ox_width_update_message_written.time_offset[ox_width_update_message_at]); ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 8 -> assert(ox_width_update_message_read.underlying[ox_width_update_message_at] == ox_width_update_message_written.underlying[ox_width_update_message_at]); ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  assert(ox_width_update_message_read.width_type == ox_width_update_message_written.width_type);
  ox_width_update_message_at = 0;
  do
  :: ox_width_update_message_at < 4 -> assert(ox_width_update_message_read.multiplier[ox_width_update_message_at] == ox_width_update_message_written.multiplier[ox_width_update_message_at]); ox_width_update_message_at = ox_width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Options Auction Update Message: 62 bytes ----------------------------- */

/* Options Auction Update messages are used to disseminate price and size information and Composite Market bid and offer prices during Opening and Re-Opening (halt) auctions on the Cboe Options Exchange. */
typedef OxOptionsAuctionUpdateMessage {
  byte time_offset[4];
  byte expanded_symbol[8];
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

int ox_options_auction_update_message_at;

/* every byte of Ox Options Auction Update Message set to one value */
inline fill_ox_options_auction_update_message(ox_options_auction_update_message_record, ox_options_auction_update_message_value) {
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> ox_options_auction_update_message_record.time_offset[ox_options_auction_update_message_at] = ox_options_auction_update_message_value; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.expanded_symbol[ox_options_auction_update_message_at] = ox_options_auction_update_message_value; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_record.auction_type = ox_options_auction_update_message_value;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.reference_price[ox_options_auction_update_message_at] = ox_options_auction_update_message_value; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> ox_options_auction_update_message_record.buy_contracts[ox_options_auction_update_message_at] = ox_options_auction_update_message_value; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> ox_options_auction_update_message_record.sell_contracts[ox_options_auction_update_message_at] = ox_options_auction_update_message_value; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.indicative_price[ox_options_auction_update_message_at] = ox_options_auction_update_message_value; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.auction_only_price[ox_options_auction_update_message_at] = ox_options_auction_update_message_value; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_record.opening_condition = ox_options_auction_update_message_value;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.composite_market_bid_price[ox_options_auction_update_message_at] = ox_options_auction_update_message_value; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.composite_market_offer_price[ox_options_auction_update_message_at] = ox_options_auction_update_message_value; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Options Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_ox_options_auction_update_message(ox_options_auction_update_message_record, ox_options_auction_update_message_base) {
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> ox_options_auction_update_message_record.time_offset[ox_options_auction_update_message_at] = (ox_options_auction_update_message_base + 0 + ox_options_auction_update_message_at + 1) % 256; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.expanded_symbol[ox_options_auction_update_message_at] = (ox_options_auction_update_message_base + 4 + ox_options_auction_update_message_at + 1) % 256; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_record.auction_type = (ox_options_auction_update_message_base + 12 + 1) % 256;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.reference_price[ox_options_auction_update_message_at] = (ox_options_auction_update_message_base + 13 + ox_options_auction_update_message_at + 1) % 256; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> ox_options_auction_update_message_record.buy_contracts[ox_options_auction_update_message_at] = (ox_options_auction_update_message_base + 21 + ox_options_auction_update_message_at + 1) % 256; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> ox_options_auction_update_message_record.sell_contracts[ox_options_auction_update_message_at] = (ox_options_auction_update_message_base + 25 + ox_options_auction_update_message_at + 1) % 256; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.indicative_price[ox_options_auction_update_message_at] = (ox_options_auction_update_message_base + 29 + ox_options_auction_update_message_at + 1) % 256; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.auction_only_price[ox_options_auction_update_message_at] = (ox_options_auction_update_message_base + 37 + ox_options_auction_update_message_at + 1) % 256; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_record.opening_condition = (ox_options_auction_update_message_base + 45 + 1) % 256;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.composite_market_bid_price[ox_options_auction_update_message_at] = (ox_options_auction_update_message_base + 46 + ox_options_auction_update_message_at + 1) % 256; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.composite_market_offer_price[ox_options_auction_update_message_at] = (ox_options_auction_update_message_base + 54 + ox_options_auction_update_message_at + 1) % 256; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Options Auction Update Message to the wire, 62 bytes from where the cursor stands */
inline encode_ox_options_auction_update_message(ox_options_auction_update_message_record) {
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> wire[at] = ox_options_auction_update_message_record.time_offset[ox_options_auction_update_message_at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> wire[at] = ox_options_auction_update_message_record.expanded_symbol[ox_options_auction_update_message_at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_options_auction_update_message_record.auction_type; at = at + 1;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> wire[at] = ox_options_auction_update_message_record.reference_price[ox_options_auction_update_message_at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> wire[at] = ox_options_auction_update_message_record.buy_contracts[ox_options_auction_update_message_at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> wire[at] = ox_options_auction_update_message_record.sell_contracts[ox_options_auction_update_message_at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> wire[at] = ox_options_auction_update_message_record.indicative_price[ox_options_auction_update_message_at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> wire[at] = ox_options_auction_update_message_record.auction_only_price[ox_options_auction_update_message_at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_options_auction_update_message_record.opening_condition; at = at + 1;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> wire[at] = ox_options_auction_update_message_record.composite_market_bid_price[ox_options_auction_update_message_at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> wire[at] = ox_options_auction_update_message_record.composite_market_offer_price[ox_options_auction_update_message_at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Options Auction Update Message off the wire, 62 bytes from where the cursor stands */
inline decode_ox_options_auction_update_message(ox_options_auction_update_message_record) {
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> ox_options_auction_update_message_record.time_offset[ox_options_auction_update_message_at] = wire[at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.expanded_symbol[ox_options_auction_update_message_at] = wire[at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_record.auction_type = wire[at]; at = at + 1;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.reference_price[ox_options_auction_update_message_at] = wire[at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> ox_options_auction_update_message_record.buy_contracts[ox_options_auction_update_message_at] = wire[at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> ox_options_auction_update_message_record.sell_contracts[ox_options_auction_update_message_at] = wire[at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.indicative_price[ox_options_auction_update_message_at] = wire[at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.auction_only_price[ox_options_auction_update_message_at] = wire[at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_record.opening_condition = wire[at]; at = at + 1;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.composite_market_bid_price[ox_options_auction_update_message_at] = wire[at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> ox_options_auction_update_message_record.composite_market_offer_price[ox_options_auction_update_message_at] = wire[at]; at = at + 1; ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Options Auction Update Message is what was written, byte for byte */
inline equal_ox_options_auction_update_message(ox_options_auction_update_message_read, ox_options_auction_update_message_written) {
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> assert(ox_options_auction_update_message_read.time_offset[ox_options_auction_update_message_at] == ox_options_auction_update_message_written.time_offset[ox_options_auction_update_message_at]); ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> assert(ox_options_auction_update_message_read.expanded_symbol[ox_options_auction_update_message_at] == ox_options_auction_update_message_written.expanded_symbol[ox_options_auction_update_message_at]); ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  assert(ox_options_auction_update_message_read.auction_type == ox_options_auction_update_message_written.auction_type);
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> assert(ox_options_auction_update_message_read.reference_price[ox_options_auction_update_message_at] == ox_options_auction_update_message_written.reference_price[ox_options_auction_update_message_at]); ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> assert(ox_options_auction_update_message_read.buy_contracts[ox_options_auction_update_message_at] == ox_options_auction_update_message_written.buy_contracts[ox_options_auction_update_message_at]); ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 4 -> assert(ox_options_auction_update_message_read.sell_contracts[ox_options_auction_update_message_at] == ox_options_auction_update_message_written.sell_contracts[ox_options_auction_update_message_at]); ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> assert(ox_options_auction_update_message_read.indicative_price[ox_options_auction_update_message_at] == ox_options_auction_update_message_written.indicative_price[ox_options_auction_update_message_at]); ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> assert(ox_options_auction_update_message_read.auction_only_price[ox_options_auction_update_message_at] == ox_options_auction_update_message_written.auction_only_price[ox_options_auction_update_message_at]); ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  assert(ox_options_auction_update_message_read.opening_condition == ox_options_auction_update_message_written.opening_condition);
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> assert(ox_options_auction_update_message_read.composite_market_bid_price[ox_options_auction_update_message_at] == ox_options_auction_update_message_written.composite_market_bid_price[ox_options_auction_update_message_at]); ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  ox_options_auction_update_message_at = 0;
  do
  :: ox_options_auction_update_message_at < 8 -> assert(ox_options_auction_update_message_read.composite_market_offer_price[ox_options_auction_update_message_at] == ox_options_auction_update_message_written.composite_market_offer_price[ox_options_auction_update_message_at]); ox_options_auction_update_message_at = ox_options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Auction Summary Message: 25 bytes ------------------------------------ */

/* Auction Summary messages are used to disseminate the results of an auction, including Opening and Re-Opening on the Cboe Options Exchange */
typedef OxAuctionSummaryMessage {
  byte time_offset[4];
  byte stock_symbol[8];
  byte auction_type;
  byte price_long[8];
  byte shares_contracts[4]
};

int ox_auction_summary_message_at;

/* every byte of Ox Auction Summary Message set to one value */
inline fill_ox_auction_summary_message(ox_auction_summary_message_record, ox_auction_summary_message_value) {
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> ox_auction_summary_message_record.time_offset[ox_auction_summary_message_at] = ox_auction_summary_message_value; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> ox_auction_summary_message_record.stock_symbol[ox_auction_summary_message_at] = ox_auction_summary_message_value; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_record.auction_type = ox_auction_summary_message_value;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> ox_auction_summary_message_record.price_long[ox_auction_summary_message_at] = ox_auction_summary_message_value; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> ox_auction_summary_message_record.shares_contracts[ox_auction_summary_message_at] = ox_auction_summary_message_value; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_ox_auction_summary_message(ox_auction_summary_message_record, ox_auction_summary_message_base) {
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> ox_auction_summary_message_record.time_offset[ox_auction_summary_message_at] = (ox_auction_summary_message_base + 0 + ox_auction_summary_message_at + 1) % 256; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> ox_auction_summary_message_record.stock_symbol[ox_auction_summary_message_at] = (ox_auction_summary_message_base + 4 + ox_auction_summary_message_at + 1) % 256; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_record.auction_type = (ox_auction_summary_message_base + 12 + 1) % 256;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> ox_auction_summary_message_record.price_long[ox_auction_summary_message_at] = (ox_auction_summary_message_base + 13 + ox_auction_summary_message_at + 1) % 256; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> ox_auction_summary_message_record.shares_contracts[ox_auction_summary_message_at] = (ox_auction_summary_message_base + 21 + ox_auction_summary_message_at + 1) % 256; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Auction Summary Message to the wire, 25 bytes from where the cursor stands */
inline encode_ox_auction_summary_message(ox_auction_summary_message_record) {
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> wire[at] = ox_auction_summary_message_record.time_offset[ox_auction_summary_message_at]; at = at + 1; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> wire[at] = ox_auction_summary_message_record.stock_symbol[ox_auction_summary_message_at]; at = at + 1; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_auction_summary_message_record.auction_type; at = at + 1;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> wire[at] = ox_auction_summary_message_record.price_long[ox_auction_summary_message_at]; at = at + 1; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> wire[at] = ox_auction_summary_message_record.shares_contracts[ox_auction_summary_message_at]; at = at + 1; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Auction Summary Message off the wire, 25 bytes from where the cursor stands */
inline decode_ox_auction_summary_message(ox_auction_summary_message_record) {
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> ox_auction_summary_message_record.time_offset[ox_auction_summary_message_at] = wire[at]; at = at + 1; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> ox_auction_summary_message_record.stock_symbol[ox_auction_summary_message_at] = wire[at]; at = at + 1; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_record.auction_type = wire[at]; at = at + 1;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> ox_auction_summary_message_record.price_long[ox_auction_summary_message_at] = wire[at]; at = at + 1; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> ox_auction_summary_message_record.shares_contracts[ox_auction_summary_message_at] = wire[at]; at = at + 1; ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Auction Summary Message is what was written, byte for byte */
inline equal_ox_auction_summary_message(ox_auction_summary_message_read, ox_auction_summary_message_written) {
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> assert(ox_auction_summary_message_read.time_offset[ox_auction_summary_message_at] == ox_auction_summary_message_written.time_offset[ox_auction_summary_message_at]); ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> assert(ox_auction_summary_message_read.stock_symbol[ox_auction_summary_message_at] == ox_auction_summary_message_written.stock_symbol[ox_auction_summary_message_at]); ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  assert(ox_auction_summary_message_read.auction_type == ox_auction_summary_message_written.auction_type);
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 8 -> assert(ox_auction_summary_message_read.price_long[ox_auction_summary_message_at] == ox_auction_summary_message_written.price_long[ox_auction_summary_message_at]); ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  ox_auction_summary_message_at = 0;
  do
  :: ox_auction_summary_message_at < 4 -> assert(ox_auction_summary_message_read.shares_contracts[ox_auction_summary_message_at] == ox_auction_summary_message_written.shares_contracts[ox_auction_summary_message_at]); ox_auction_summary_message_at = ox_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Auction Notification Message: 45 bytes ------------------------------- */

/* Auction Notification messages are used to disseminate order details of an auction. Auctions will be available for a defined period of time known as the exposure period. */
typedef OxAuctionNotificationMessage {
  byte time_offset[4];
  byte symbol[6];
  byte auction_id[8];
  byte auction_type;
  byte side;
  byte price_long[8];
  byte contracts[4];
  byte customer_indicator;
  byte participant_id[4];
  byte auction_end_offset[4];
  byte client_id[4]
};

int ox_auction_notification_message_at;

/* every byte of Ox Auction Notification Message set to one value */
inline fill_ox_auction_notification_message(ox_auction_notification_message_record, ox_auction_notification_message_value) {
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.time_offset[ox_auction_notification_message_at] = ox_auction_notification_message_value; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 6 -> ox_auction_notification_message_record.symbol[ox_auction_notification_message_at] = ox_auction_notification_message_value; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> ox_auction_notification_message_record.auction_id[ox_auction_notification_message_at] = ox_auction_notification_message_value; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_record.auction_type = ox_auction_notification_message_value;
  ox_auction_notification_message_record.side = ox_auction_notification_message_value;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> ox_auction_notification_message_record.price_long[ox_auction_notification_message_at] = ox_auction_notification_message_value; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.contracts[ox_auction_notification_message_at] = ox_auction_notification_message_value; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_record.customer_indicator = ox_auction_notification_message_value;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.participant_id[ox_auction_notification_message_at] = ox_auction_notification_message_value; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.auction_end_offset[ox_auction_notification_message_at] = ox_auction_notification_message_value; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.client_id[ox_auction_notification_message_at] = ox_auction_notification_message_value; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Auction Notification Message set to where it lies, so a field read out of place says so */
inline ramp_ox_auction_notification_message(ox_auction_notification_message_record, ox_auction_notification_message_base) {
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.time_offset[ox_auction_notification_message_at] = (ox_auction_notification_message_base + 0 + ox_auction_notification_message_at + 1) % 256; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 6 -> ox_auction_notification_message_record.symbol[ox_auction_notification_message_at] = (ox_auction_notification_message_base + 4 + ox_auction_notification_message_at + 1) % 256; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> ox_auction_notification_message_record.auction_id[ox_auction_notification_message_at] = (ox_auction_notification_message_base + 10 + ox_auction_notification_message_at + 1) % 256; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_record.auction_type = (ox_auction_notification_message_base + 18 + 1) % 256;
  ox_auction_notification_message_record.side = (ox_auction_notification_message_base + 19 + 1) % 256;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> ox_auction_notification_message_record.price_long[ox_auction_notification_message_at] = (ox_auction_notification_message_base + 20 + ox_auction_notification_message_at + 1) % 256; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.contracts[ox_auction_notification_message_at] = (ox_auction_notification_message_base + 28 + ox_auction_notification_message_at + 1) % 256; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_record.customer_indicator = (ox_auction_notification_message_base + 32 + 1) % 256;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.participant_id[ox_auction_notification_message_at] = (ox_auction_notification_message_base + 33 + ox_auction_notification_message_at + 1) % 256; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.auction_end_offset[ox_auction_notification_message_at] = (ox_auction_notification_message_base + 37 + ox_auction_notification_message_at + 1) % 256; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.client_id[ox_auction_notification_message_at] = (ox_auction_notification_message_base + 41 + ox_auction_notification_message_at + 1) % 256; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Auction Notification Message to the wire, 45 bytes from where the cursor stands */
inline encode_ox_auction_notification_message(ox_auction_notification_message_record) {
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> wire[at] = ox_auction_notification_message_record.time_offset[ox_auction_notification_message_at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 6 -> wire[at] = ox_auction_notification_message_record.symbol[ox_auction_notification_message_at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> wire[at] = ox_auction_notification_message_record.auction_id[ox_auction_notification_message_at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_auction_notification_message_record.auction_type; at = at + 1;
  wire[at] = ox_auction_notification_message_record.side; at = at + 1;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> wire[at] = ox_auction_notification_message_record.price_long[ox_auction_notification_message_at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> wire[at] = ox_auction_notification_message_record.contracts[ox_auction_notification_message_at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_auction_notification_message_record.customer_indicator; at = at + 1;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> wire[at] = ox_auction_notification_message_record.participant_id[ox_auction_notification_message_at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> wire[at] = ox_auction_notification_message_record.auction_end_offset[ox_auction_notification_message_at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> wire[at] = ox_auction_notification_message_record.client_id[ox_auction_notification_message_at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Auction Notification Message off the wire, 45 bytes from where the cursor stands */
inline decode_ox_auction_notification_message(ox_auction_notification_message_record) {
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.time_offset[ox_auction_notification_message_at] = wire[at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 6 -> ox_auction_notification_message_record.symbol[ox_auction_notification_message_at] = wire[at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> ox_auction_notification_message_record.auction_id[ox_auction_notification_message_at] = wire[at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_record.auction_type = wire[at]; at = at + 1;
  ox_auction_notification_message_record.side = wire[at]; at = at + 1;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> ox_auction_notification_message_record.price_long[ox_auction_notification_message_at] = wire[at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.contracts[ox_auction_notification_message_at] = wire[at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_record.customer_indicator = wire[at]; at = at + 1;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.participant_id[ox_auction_notification_message_at] = wire[at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.auction_end_offset[ox_auction_notification_message_at] = wire[at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> ox_auction_notification_message_record.client_id[ox_auction_notification_message_at] = wire[at]; at = at + 1; ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Auction Notification Message is what was written, byte for byte */
inline equal_ox_auction_notification_message(ox_auction_notification_message_read, ox_auction_notification_message_written) {
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> assert(ox_auction_notification_message_read.time_offset[ox_auction_notification_message_at] == ox_auction_notification_message_written.time_offset[ox_auction_notification_message_at]); ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 6 -> assert(ox_auction_notification_message_read.symbol[ox_auction_notification_message_at] == ox_auction_notification_message_written.symbol[ox_auction_notification_message_at]); ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> assert(ox_auction_notification_message_read.auction_id[ox_auction_notification_message_at] == ox_auction_notification_message_written.auction_id[ox_auction_notification_message_at]); ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  assert(ox_auction_notification_message_read.auction_type == ox_auction_notification_message_written.auction_type);
  assert(ox_auction_notification_message_read.side == ox_auction_notification_message_written.side);
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 8 -> assert(ox_auction_notification_message_read.price_long[ox_auction_notification_message_at] == ox_auction_notification_message_written.price_long[ox_auction_notification_message_at]); ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> assert(ox_auction_notification_message_read.contracts[ox_auction_notification_message_at] == ox_auction_notification_message_written.contracts[ox_auction_notification_message_at]); ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  assert(ox_auction_notification_message_read.customer_indicator == ox_auction_notification_message_written.customer_indicator);
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> assert(ox_auction_notification_message_read.participant_id[ox_auction_notification_message_at] == ox_auction_notification_message_written.participant_id[ox_auction_notification_message_at]); ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> assert(ox_auction_notification_message_read.auction_end_offset[ox_auction_notification_message_at] == ox_auction_notification_message_written.auction_end_offset[ox_auction_notification_message_at]); ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  ox_auction_notification_message_at = 0;
  do
  :: ox_auction_notification_message_at < 4 -> assert(ox_auction_notification_message_read.client_id[ox_auction_notification_message_at] == ox_auction_notification_message_written.client_id[ox_auction_notification_message_at]); ox_auction_notification_message_at = ox_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Auction Cancel Message: 12 bytes ------------------------------------- */

/* Auction Cancel messages are used to disseminate the cancelation of an earlier Auction Notification message. */
typedef OxAuctionCancelMessage {
  byte time_offset[4];
  byte auction_id[8]
};

int ox_auction_cancel_message_at;

/* every byte of Ox Auction Cancel Message set to one value */
inline fill_ox_auction_cancel_message(ox_auction_cancel_message_record, ox_auction_cancel_message_value) {
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 4 -> ox_auction_cancel_message_record.time_offset[ox_auction_cancel_message_at] = ox_auction_cancel_message_value; ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 8 -> ox_auction_cancel_message_record.auction_id[ox_auction_cancel_message_at] = ox_auction_cancel_message_value; ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Auction Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_ox_auction_cancel_message(ox_auction_cancel_message_record, ox_auction_cancel_message_base) {
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 4 -> ox_auction_cancel_message_record.time_offset[ox_auction_cancel_message_at] = (ox_auction_cancel_message_base + 0 + ox_auction_cancel_message_at + 1) % 256; ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 8 -> ox_auction_cancel_message_record.auction_id[ox_auction_cancel_message_at] = (ox_auction_cancel_message_base + 4 + ox_auction_cancel_message_at + 1) % 256; ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Auction Cancel Message to the wire, 12 bytes from where the cursor stands */
inline encode_ox_auction_cancel_message(ox_auction_cancel_message_record) {
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 4 -> wire[at] = ox_auction_cancel_message_record.time_offset[ox_auction_cancel_message_at]; at = at + 1; ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 8 -> wire[at] = ox_auction_cancel_message_record.auction_id[ox_auction_cancel_message_at]; at = at + 1; ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Auction Cancel Message off the wire, 12 bytes from where the cursor stands */
inline decode_ox_auction_cancel_message(ox_auction_cancel_message_record) {
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 4 -> ox_auction_cancel_message_record.time_offset[ox_auction_cancel_message_at] = wire[at]; at = at + 1; ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 8 -> ox_auction_cancel_message_record.auction_id[ox_auction_cancel_message_at] = wire[at]; at = at + 1; ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Auction Cancel Message is what was written, byte for byte */
inline equal_ox_auction_cancel_message(ox_auction_cancel_message_read, ox_auction_cancel_message_written) {
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 4 -> assert(ox_auction_cancel_message_read.time_offset[ox_auction_cancel_message_at] == ox_auction_cancel_message_written.time_offset[ox_auction_cancel_message_at]); ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  ox_auction_cancel_message_at = 0;
  do
  :: ox_auction_cancel_message_at < 8 -> assert(ox_auction_cancel_message_read.auction_id[ox_auction_cancel_message_at] == ox_auction_cancel_message_written.auction_id[ox_auction_cancel_message_at]); ox_auction_cancel_message_at = ox_auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Auction Trade Message: 32 bytes -------------------------------------- */

/* Auction Trade messages are used to disseminate executions resulting from an options auction. */
typedef OxAuctionTradeMessage {
  byte time_offset[4];
  byte auction_id[8];
  byte execution_id[8];
  byte price_long[8];
  byte contracts[4]
};

int ox_auction_trade_message_at;

/* every byte of Ox Auction Trade Message set to one value */
inline fill_ox_auction_trade_message(ox_auction_trade_message_record, ox_auction_trade_message_value) {
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> ox_auction_trade_message_record.time_offset[ox_auction_trade_message_at] = ox_auction_trade_message_value; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> ox_auction_trade_message_record.auction_id[ox_auction_trade_message_at] = ox_auction_trade_message_value; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> ox_auction_trade_message_record.execution_id[ox_auction_trade_message_at] = ox_auction_trade_message_value; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> ox_auction_trade_message_record.price_long[ox_auction_trade_message_at] = ox_auction_trade_message_value; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> ox_auction_trade_message_record.contracts[ox_auction_trade_message_at] = ox_auction_trade_message_value; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Auction Trade Message set to where it lies, so a field read out of place says so */
inline ramp_ox_auction_trade_message(ox_auction_trade_message_record, ox_auction_trade_message_base) {
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> ox_auction_trade_message_record.time_offset[ox_auction_trade_message_at] = (ox_auction_trade_message_base + 0 + ox_auction_trade_message_at + 1) % 256; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> ox_auction_trade_message_record.auction_id[ox_auction_trade_message_at] = (ox_auction_trade_message_base + 4 + ox_auction_trade_message_at + 1) % 256; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> ox_auction_trade_message_record.execution_id[ox_auction_trade_message_at] = (ox_auction_trade_message_base + 12 + ox_auction_trade_message_at + 1) % 256; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> ox_auction_trade_message_record.price_long[ox_auction_trade_message_at] = (ox_auction_trade_message_base + 20 + ox_auction_trade_message_at + 1) % 256; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> ox_auction_trade_message_record.contracts[ox_auction_trade_message_at] = (ox_auction_trade_message_base + 28 + ox_auction_trade_message_at + 1) % 256; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Auction Trade Message to the wire, 32 bytes from where the cursor stands */
inline encode_ox_auction_trade_message(ox_auction_trade_message_record) {
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> wire[at] = ox_auction_trade_message_record.time_offset[ox_auction_trade_message_at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> wire[at] = ox_auction_trade_message_record.auction_id[ox_auction_trade_message_at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> wire[at] = ox_auction_trade_message_record.execution_id[ox_auction_trade_message_at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> wire[at] = ox_auction_trade_message_record.price_long[ox_auction_trade_message_at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> wire[at] = ox_auction_trade_message_record.contracts[ox_auction_trade_message_at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Auction Trade Message off the wire, 32 bytes from where the cursor stands */
inline decode_ox_auction_trade_message(ox_auction_trade_message_record) {
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> ox_auction_trade_message_record.time_offset[ox_auction_trade_message_at] = wire[at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> ox_auction_trade_message_record.auction_id[ox_auction_trade_message_at] = wire[at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> ox_auction_trade_message_record.execution_id[ox_auction_trade_message_at] = wire[at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> ox_auction_trade_message_record.price_long[ox_auction_trade_message_at] = wire[at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> ox_auction_trade_message_record.contracts[ox_auction_trade_message_at] = wire[at]; at = at + 1; ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Auction Trade Message is what was written, byte for byte */
inline equal_ox_auction_trade_message(ox_auction_trade_message_read, ox_auction_trade_message_written) {
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> assert(ox_auction_trade_message_read.time_offset[ox_auction_trade_message_at] == ox_auction_trade_message_written.time_offset[ox_auction_trade_message_at]); ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> assert(ox_auction_trade_message_read.auction_id[ox_auction_trade_message_at] == ox_auction_trade_message_written.auction_id[ox_auction_trade_message_at]); ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> assert(ox_auction_trade_message_read.execution_id[ox_auction_trade_message_at] == ox_auction_trade_message_written.execution_id[ox_auction_trade_message_at]); ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 8 -> assert(ox_auction_trade_message_read.price_long[ox_auction_trade_message_at] == ox_auction_trade_message_written.price_long[ox_auction_trade_message_at]); ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  ox_auction_trade_message_at = 0;
  do
  :: ox_auction_trade_message_at < 4 -> assert(ox_auction_trade_message_read.contracts[ox_auction_trade_message_at] == ox_auction_trade_message_written.contracts[ox_auction_trade_message_at]); ox_auction_trade_message_at = ox_auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Soq Strike Range Update Message: 40 bytes ---------------------------- */

/* The SOQ Strike Range Update message is only available on the C1 Exchange. This message disseminates the minimum and maximum strike prices of the strike price range used to calculate the Special Opening Quote (SOQ) on a Volatility Settlement date. */
typedef OxSoqStrikeRangeUpdateMessage {
  byte time_offset[4];
  byte soq_identifier[20];
  byte lower_strike_price[8];
  byte upper_strike_price[8]
};

int ox_soq_strike_range_update_message_at;

/* every byte of Ox Soq Strike Range Update Message set to one value */
inline fill_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_record, ox_soq_strike_range_update_message_value) {
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 4 -> ox_soq_strike_range_update_message_record.time_offset[ox_soq_strike_range_update_message_at] = ox_soq_strike_range_update_message_value; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 20 -> ox_soq_strike_range_update_message_record.soq_identifier[ox_soq_strike_range_update_message_at] = ox_soq_strike_range_update_message_value; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> ox_soq_strike_range_update_message_record.lower_strike_price[ox_soq_strike_range_update_message_at] = ox_soq_strike_range_update_message_value; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> ox_soq_strike_range_update_message_record.upper_strike_price[ox_soq_strike_range_update_message_at] = ox_soq_strike_range_update_message_value; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Soq Strike Range Update Message set to where it lies, so a field read out of place says so */
inline ramp_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_record, ox_soq_strike_range_update_message_base) {
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 4 -> ox_soq_strike_range_update_message_record.time_offset[ox_soq_strike_range_update_message_at] = (ox_soq_strike_range_update_message_base + 0 + ox_soq_strike_range_update_message_at + 1) % 256; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 20 -> ox_soq_strike_range_update_message_record.soq_identifier[ox_soq_strike_range_update_message_at] = (ox_soq_strike_range_update_message_base + 4 + ox_soq_strike_range_update_message_at + 1) % 256; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> ox_soq_strike_range_update_message_record.lower_strike_price[ox_soq_strike_range_update_message_at] = (ox_soq_strike_range_update_message_base + 24 + ox_soq_strike_range_update_message_at + 1) % 256; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> ox_soq_strike_range_update_message_record.upper_strike_price[ox_soq_strike_range_update_message_at] = (ox_soq_strike_range_update_message_base + 32 + ox_soq_strike_range_update_message_at + 1) % 256; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Soq Strike Range Update Message to the wire, 40 bytes from where the cursor stands */
inline encode_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_record) {
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 4 -> wire[at] = ox_soq_strike_range_update_message_record.time_offset[ox_soq_strike_range_update_message_at]; at = at + 1; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 20 -> wire[at] = ox_soq_strike_range_update_message_record.soq_identifier[ox_soq_strike_range_update_message_at]; at = at + 1; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> wire[at] = ox_soq_strike_range_update_message_record.lower_strike_price[ox_soq_strike_range_update_message_at]; at = at + 1; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> wire[at] = ox_soq_strike_range_update_message_record.upper_strike_price[ox_soq_strike_range_update_message_at]; at = at + 1; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Soq Strike Range Update Message off the wire, 40 bytes from where the cursor stands */
inline decode_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_record) {
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 4 -> ox_soq_strike_range_update_message_record.time_offset[ox_soq_strike_range_update_message_at] = wire[at]; at = at + 1; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 20 -> ox_soq_strike_range_update_message_record.soq_identifier[ox_soq_strike_range_update_message_at] = wire[at]; at = at + 1; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> ox_soq_strike_range_update_message_record.lower_strike_price[ox_soq_strike_range_update_message_at] = wire[at]; at = at + 1; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> ox_soq_strike_range_update_message_record.upper_strike_price[ox_soq_strike_range_update_message_at] = wire[at]; at = at + 1; ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Soq Strike Range Update Message is what was written, byte for byte */
inline equal_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_read, ox_soq_strike_range_update_message_written) {
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 4 -> assert(ox_soq_strike_range_update_message_read.time_offset[ox_soq_strike_range_update_message_at] == ox_soq_strike_range_update_message_written.time_offset[ox_soq_strike_range_update_message_at]); ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 20 -> assert(ox_soq_strike_range_update_message_read.soq_identifier[ox_soq_strike_range_update_message_at] == ox_soq_strike_range_update_message_written.soq_identifier[ox_soq_strike_range_update_message_at]); ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> assert(ox_soq_strike_range_update_message_read.lower_strike_price[ox_soq_strike_range_update_message_at] == ox_soq_strike_range_update_message_written.lower_strike_price[ox_soq_strike_range_update_message_at]); ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  ox_soq_strike_range_update_message_at = 0;
  do
  :: ox_soq_strike_range_update_message_at < 8 -> assert(ox_soq_strike_range_update_message_read.upper_strike_price[ox_soq_strike_range_update_message_at] == ox_soq_strike_range_update_message_written.upper_strike_price[ox_soq_strike_range_update_message_at]); ox_soq_strike_range_update_message_at = ox_soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ox Constituent Symbol Mapping Message: 56 bytes ------------------------- */

/* The Constituent Symbol Mapping message is only available on the C1 Exchange. This message is used to communicate which options series are Constituent Series in a Volatility Settlement Special Opening Quote (SOQ). */
typedef OxConstituentSymbolMappingMessage {
  byte feed_symbol[6];
  byte osi_symbol[21];
  byte symbol_condition;
  byte underlying[8];
  byte soq_identifier[20]
};

int ox_constituent_symbol_mapping_message_at;

/* every byte of Ox Constituent Symbol Mapping Message set to one value */
inline fill_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_record, ox_constituent_symbol_mapping_message_value) {
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 6 -> ox_constituent_symbol_mapping_message_record.feed_symbol[ox_constituent_symbol_mapping_message_at] = ox_constituent_symbol_mapping_message_value; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 21 -> ox_constituent_symbol_mapping_message_record.osi_symbol[ox_constituent_symbol_mapping_message_at] = ox_constituent_symbol_mapping_message_value; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_record.symbol_condition = ox_constituent_symbol_mapping_message_value;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 8 -> ox_constituent_symbol_mapping_message_record.underlying[ox_constituent_symbol_mapping_message_at] = ox_constituent_symbol_mapping_message_value; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 20 -> ox_constituent_symbol_mapping_message_record.soq_identifier[ox_constituent_symbol_mapping_message_at] = ox_constituent_symbol_mapping_message_value; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ox Constituent Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_record, ox_constituent_symbol_mapping_message_base) {
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 6 -> ox_constituent_symbol_mapping_message_record.feed_symbol[ox_constituent_symbol_mapping_message_at] = (ox_constituent_symbol_mapping_message_base + 0 + ox_constituent_symbol_mapping_message_at + 1) % 256; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 21 -> ox_constituent_symbol_mapping_message_record.osi_symbol[ox_constituent_symbol_mapping_message_at] = (ox_constituent_symbol_mapping_message_base + 6 + ox_constituent_symbol_mapping_message_at + 1) % 256; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_record.symbol_condition = (ox_constituent_symbol_mapping_message_base + 27 + 1) % 256;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 8 -> ox_constituent_symbol_mapping_message_record.underlying[ox_constituent_symbol_mapping_message_at] = (ox_constituent_symbol_mapping_message_base + 28 + ox_constituent_symbol_mapping_message_at + 1) % 256; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 20 -> ox_constituent_symbol_mapping_message_record.soq_identifier[ox_constituent_symbol_mapping_message_at] = (ox_constituent_symbol_mapping_message_base + 36 + ox_constituent_symbol_mapping_message_at + 1) % 256; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Constituent Symbol Mapping Message to the wire, 56 bytes from where the cursor stands */
inline encode_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_record) {
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 6 -> wire[at] = ox_constituent_symbol_mapping_message_record.feed_symbol[ox_constituent_symbol_mapping_message_at]; at = at + 1; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 21 -> wire[at] = ox_constituent_symbol_mapping_message_record.osi_symbol[ox_constituent_symbol_mapping_message_at]; at = at + 1; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = ox_constituent_symbol_mapping_message_record.symbol_condition; at = at + 1;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 8 -> wire[at] = ox_constituent_symbol_mapping_message_record.underlying[ox_constituent_symbol_mapping_message_at]; at = at + 1; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 20 -> wire[at] = ox_constituent_symbol_mapping_message_record.soq_identifier[ox_constituent_symbol_mapping_message_at]; at = at + 1; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ox Constituent Symbol Mapping Message off the wire, 56 bytes from where the cursor stands */
inline decode_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_record) {
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 6 -> ox_constituent_symbol_mapping_message_record.feed_symbol[ox_constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 21 -> ox_constituent_symbol_mapping_message_record.osi_symbol[ox_constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_record.symbol_condition = wire[at]; at = at + 1;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 8 -> ox_constituent_symbol_mapping_message_record.underlying[ox_constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 20 -> ox_constituent_symbol_mapping_message_record.soq_identifier[ox_constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ox Constituent Symbol Mapping Message is what was written, byte for byte */
inline equal_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_read, ox_constituent_symbol_mapping_message_written) {
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 6 -> assert(ox_constituent_symbol_mapping_message_read.feed_symbol[ox_constituent_symbol_mapping_message_at] == ox_constituent_symbol_mapping_message_written.feed_symbol[ox_constituent_symbol_mapping_message_at]); ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 21 -> assert(ox_constituent_symbol_mapping_message_read.osi_symbol[ox_constituent_symbol_mapping_message_at] == ox_constituent_symbol_mapping_message_written.osi_symbol[ox_constituent_symbol_mapping_message_at]); ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(ox_constituent_symbol_mapping_message_read.symbol_condition == ox_constituent_symbol_mapping_message_written.symbol_condition);
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 8 -> assert(ox_constituent_symbol_mapping_message_read.underlying[ox_constituent_symbol_mapping_message_at] == ox_constituent_symbol_mapping_message_written.underlying[ox_constituent_symbol_mapping_message_at]); ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  ox_constituent_symbol_mapping_message_at = 0;
  do
  :: ox_constituent_symbol_mapping_message_at < 20 -> assert(ox_constituent_symbol_mapping_message_read.soq_identifier[ox_constituent_symbol_mapping_message_at] == ox_constituent_symbol_mapping_message_written.soq_identifier[ox_constituent_symbol_mapping_message_at]); ox_constituent_symbol_mapping_message_at = ox_constituent_symbol_mapping_message_at + 1
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

/* Ox Time Message: encoded, read back, and compared */
proctype check_ox_time_message() {
  OxTimeMessage ox_time_message_sent;
  OxTimeMessage ox_time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_time_message(ox_time_message_sent, 0)
  :: pattern == 1 -> fill_ox_time_message(ox_time_message_sent, 32)
  :: pattern == 2 -> fill_ox_time_message(ox_time_message_sent, 255)
  :: else -> ramp_ox_time_message(ox_time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_time_message(ox_time_message_sent);
    assert(at == 4);
    at = 0;
    decode_ox_time_message(ox_time_message_got);
    assert(at == 4);
    equal_ox_time_message(ox_time_message_got, ox_time_message_sent)
  }
}

/* Ox Unit Clear Message: encoded, read back, and compared */
proctype check_ox_unit_clear_message() {
  OxUnitClearMessage ox_unit_clear_message_sent;
  OxUnitClearMessage ox_unit_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_unit_clear_message(ox_unit_clear_message_sent, 0)
  :: pattern == 1 -> fill_ox_unit_clear_message(ox_unit_clear_message_sent, 32)
  :: pattern == 2 -> fill_ox_unit_clear_message(ox_unit_clear_message_sent, 255)
  :: else -> ramp_ox_unit_clear_message(ox_unit_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_unit_clear_message(ox_unit_clear_message_sent);
    assert(at == 4);
    at = 0;
    decode_ox_unit_clear_message(ox_unit_clear_message_got);
    assert(at == 4);
    equal_ox_unit_clear_message(ox_unit_clear_message_got, ox_unit_clear_message_sent)
  }
}

/* Ox Transaction Begin Message: encoded, read back, and compared */
proctype check_ox_transaction_begin_message() {
  OxTransactionBeginMessage ox_transaction_begin_message_sent;
  OxTransactionBeginMessage ox_transaction_begin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_transaction_begin_message(ox_transaction_begin_message_sent, 0)
  :: pattern == 1 -> fill_ox_transaction_begin_message(ox_transaction_begin_message_sent, 32)
  :: pattern == 2 -> fill_ox_transaction_begin_message(ox_transaction_begin_message_sent, 255)
  :: else -> ramp_ox_transaction_begin_message(ox_transaction_begin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_transaction_begin_message(ox_transaction_begin_message_sent);
    assert(at == 4);
    at = 0;
    decode_ox_transaction_begin_message(ox_transaction_begin_message_got);
    assert(at == 4);
    equal_ox_transaction_begin_message(ox_transaction_begin_message_got, ox_transaction_begin_message_sent)
  }
}

/* Ox Transaction End Message: encoded, read back, and compared */
proctype check_ox_transaction_end_message() {
  OxTransactionEndMessage ox_transaction_end_message_sent;
  OxTransactionEndMessage ox_transaction_end_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_transaction_end_message(ox_transaction_end_message_sent, 0)
  :: pattern == 1 -> fill_ox_transaction_end_message(ox_transaction_end_message_sent, 32)
  :: pattern == 2 -> fill_ox_transaction_end_message(ox_transaction_end_message_sent, 255)
  :: else -> ramp_ox_transaction_end_message(ox_transaction_end_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_transaction_end_message(ox_transaction_end_message_sent);
    assert(at == 4);
    at = 0;
    decode_ox_transaction_end_message(ox_transaction_end_message_got);
    assert(at == 4);
    equal_ox_transaction_end_message(ox_transaction_end_message_got, ox_transaction_end_message_sent)
  }
}

/* Ox Order Executed Message: encoded, read back, and compared */
proctype check_ox_order_executed_message() {
  OxOrderExecutedMessage ox_order_executed_message_sent;
  OxOrderExecutedMessage ox_order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_order_executed_message(ox_order_executed_message_sent, 0)
  :: pattern == 1 -> fill_ox_order_executed_message(ox_order_executed_message_sent, 32)
  :: pattern == 2 -> fill_ox_order_executed_message(ox_order_executed_message_sent, 255)
  :: else -> ramp_ox_order_executed_message(ox_order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_order_executed_message(ox_order_executed_message_sent);
    assert(at == 25);
    at = 0;
    decode_ox_order_executed_message(ox_order_executed_message_got);
    assert(at == 25);
    equal_ox_order_executed_message(ox_order_executed_message_got, ox_order_executed_message_sent)
  }
}

/* Ox Order Executed At Price Size Message: encoded, read back, and compared */
proctype check_ox_order_executed_at_price_size_message() {
  OxOrderExecutedAtPriceSizeMessage ox_order_executed_at_price_size_message_sent;
  OxOrderExecutedAtPriceSizeMessage ox_order_executed_at_price_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_sent, 0)
  :: pattern == 1 -> fill_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_sent, 32)
  :: pattern == 2 -> fill_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_sent, 255)
  :: else -> ramp_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_sent);
    assert(at == 37);
    at = 0;
    decode_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_got);
    assert(at == 37);
    equal_ox_order_executed_at_price_size_message(ox_order_executed_at_price_size_message_got, ox_order_executed_at_price_size_message_sent)
  }
}

/* Ox Reduce Size Long Message: encoded, read back, and compared */
proctype check_ox_reduce_size_long_message() {
  OxReduceSizeLongMessage ox_reduce_size_long_message_sent;
  OxReduceSizeLongMessage ox_reduce_size_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_reduce_size_long_message(ox_reduce_size_long_message_sent, 0)
  :: pattern == 1 -> fill_ox_reduce_size_long_message(ox_reduce_size_long_message_sent, 32)
  :: pattern == 2 -> fill_ox_reduce_size_long_message(ox_reduce_size_long_message_sent, 255)
  :: else -> ramp_ox_reduce_size_long_message(ox_reduce_size_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_reduce_size_long_message(ox_reduce_size_long_message_sent);
    assert(at == 16);
    at = 0;
    decode_ox_reduce_size_long_message(ox_reduce_size_long_message_got);
    assert(at == 16);
    equal_ox_reduce_size_long_message(ox_reduce_size_long_message_got, ox_reduce_size_long_message_sent)
  }
}

/* Ox Reduce Size Short Message: encoded, read back, and compared */
proctype check_ox_reduce_size_short_message() {
  OxReduceSizeShortMessage ox_reduce_size_short_message_sent;
  OxReduceSizeShortMessage ox_reduce_size_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_reduce_size_short_message(ox_reduce_size_short_message_sent, 0)
  :: pattern == 1 -> fill_ox_reduce_size_short_message(ox_reduce_size_short_message_sent, 32)
  :: pattern == 2 -> fill_ox_reduce_size_short_message(ox_reduce_size_short_message_sent, 255)
  :: else -> ramp_ox_reduce_size_short_message(ox_reduce_size_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_reduce_size_short_message(ox_reduce_size_short_message_sent);
    assert(at == 14);
    at = 0;
    decode_ox_reduce_size_short_message(ox_reduce_size_short_message_got);
    assert(at == 14);
    equal_ox_reduce_size_short_message(ox_reduce_size_short_message_got, ox_reduce_size_short_message_sent)
  }
}

/* Ox Delete Order Message: encoded, read back, and compared */
proctype check_ox_delete_order_message() {
  OxDeleteOrderMessage ox_delete_order_message_sent;
  OxDeleteOrderMessage ox_delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_delete_order_message(ox_delete_order_message_sent, 0)
  :: pattern == 1 -> fill_ox_delete_order_message(ox_delete_order_message_sent, 32)
  :: pattern == 2 -> fill_ox_delete_order_message(ox_delete_order_message_sent, 255)
  :: else -> ramp_ox_delete_order_message(ox_delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_delete_order_message(ox_delete_order_message_sent);
    assert(at == 12);
    at = 0;
    decode_ox_delete_order_message(ox_delete_order_message_got);
    assert(at == 12);
    equal_ox_delete_order_message(ox_delete_order_message_got, ox_delete_order_message_sent)
  }
}

/* Ox Trade Long Message: encoded, read back, and compared */
proctype check_ox_trade_long_message() {
  OxTradeLongMessage ox_trade_long_message_sent;
  OxTradeLongMessage ox_trade_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_trade_long_message(ox_trade_long_message_sent, 0)
  :: pattern == 1 -> fill_ox_trade_long_message(ox_trade_long_message_sent, 32)
  :: pattern == 2 -> fill_ox_trade_long_message(ox_trade_long_message_sent, 255)
  :: else -> ramp_ox_trade_long_message(ox_trade_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_trade_long_message(ox_trade_long_message_sent);
    assert(at == 40);
    at = 0;
    decode_ox_trade_long_message(ox_trade_long_message_got);
    assert(at == 40);
    equal_ox_trade_long_message(ox_trade_long_message_got, ox_trade_long_message_sent)
  }
}

/* Ox Trade Short Message: encoded, read back, and compared */
proctype check_ox_trade_short_message() {
  OxTradeShortMessage ox_trade_short_message_sent;
  OxTradeShortMessage ox_trade_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_trade_short_message(ox_trade_short_message_sent, 0)
  :: pattern == 1 -> fill_ox_trade_short_message(ox_trade_short_message_sent, 32)
  :: pattern == 2 -> fill_ox_trade_short_message(ox_trade_short_message_sent, 255)
  :: else -> ramp_ox_trade_short_message(ox_trade_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_trade_short_message(ox_trade_short_message_sent);
    assert(at == 32);
    at = 0;
    decode_ox_trade_short_message(ox_trade_short_message_got);
    assert(at == 32);
    equal_ox_trade_short_message(ox_trade_short_message_got, ox_trade_short_message_sent)
  }
}

/* Ox Trade Expanded Message: encoded, read back, and compared */
proctype check_ox_trade_expanded_message() {
  OxTradeExpandedMessage ox_trade_expanded_message_sent;
  OxTradeExpandedMessage ox_trade_expanded_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_trade_expanded_message(ox_trade_expanded_message_sent, 0)
  :: pattern == 1 -> fill_ox_trade_expanded_message(ox_trade_expanded_message_sent, 32)
  :: pattern == 2 -> fill_ox_trade_expanded_message(ox_trade_expanded_message_sent, 255)
  :: else -> ramp_ox_trade_expanded_message(ox_trade_expanded_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_trade_expanded_message(ox_trade_expanded_message_sent);
    assert(at == 42);
    at = 0;
    decode_ox_trade_expanded_message(ox_trade_expanded_message_got);
    assert(at == 42);
    equal_ox_trade_expanded_message(ox_trade_expanded_message_got, ox_trade_expanded_message_sent)
  }
}

/* Ox Trade Break Message: encoded, read back, and compared */
proctype check_ox_trade_break_message() {
  OxTradeBreakMessage ox_trade_break_message_sent;
  OxTradeBreakMessage ox_trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_trade_break_message(ox_trade_break_message_sent, 0)
  :: pattern == 1 -> fill_ox_trade_break_message(ox_trade_break_message_sent, 32)
  :: pattern == 2 -> fill_ox_trade_break_message(ox_trade_break_message_sent, 255)
  :: else -> ramp_ox_trade_break_message(ox_trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_trade_break_message(ox_trade_break_message_sent);
    assert(at == 12);
    at = 0;
    decode_ox_trade_break_message(ox_trade_break_message_got);
    assert(at == 12);
    equal_ox_trade_break_message(ox_trade_break_message_got, ox_trade_break_message_sent)
  }
}

/* Ox End Of Session: encoded, read back, and compared */
proctype check_ox_end_of_session() {
  OxEndOfSession ox_end_of_session_sent;
  OxEndOfSession ox_end_of_session_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_end_of_session(ox_end_of_session_sent, 0)
  :: pattern == 1 -> fill_ox_end_of_session(ox_end_of_session_sent, 32)
  :: pattern == 2 -> fill_ox_end_of_session(ox_end_of_session_sent, 255)
  :: else -> ramp_ox_end_of_session(ox_end_of_session_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_end_of_session(ox_end_of_session_sent);
    assert(at == 4);
    at = 0;
    decode_ox_end_of_session(ox_end_of_session_got);
    assert(at == 4);
    equal_ox_end_of_session(ox_end_of_session_got, ox_end_of_session_sent)
  }
}

/* Ox Symbol Mapping Message: encoded, read back, and compared */
proctype check_ox_symbol_mapping_message() {
  OxSymbolMappingMessage ox_symbol_mapping_message_sent;
  OxSymbolMappingMessage ox_symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_symbol_mapping_message(ox_symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_ox_symbol_mapping_message(ox_symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_ox_symbol_mapping_message(ox_symbol_mapping_message_sent, 255)
  :: else -> ramp_ox_symbol_mapping_message(ox_symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_symbol_mapping_message(ox_symbol_mapping_message_sent);
    assert(at == 36);
    at = 0;
    decode_ox_symbol_mapping_message(ox_symbol_mapping_message_got);
    assert(at == 36);
    equal_ox_symbol_mapping_message(ox_symbol_mapping_message_got, ox_symbol_mapping_message_sent)
  }
}

/* Ox Trading Status Message: encoded, read back, and compared */
proctype check_ox_trading_status_message() {
  OxTradingStatusMessage ox_trading_status_message_sent;
  OxTradingStatusMessage ox_trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_trading_status_message(ox_trading_status_message_sent, 0)
  :: pattern == 1 -> fill_ox_trading_status_message(ox_trading_status_message_sent, 32)
  :: pattern == 2 -> fill_ox_trading_status_message(ox_trading_status_message_sent, 255)
  :: else -> ramp_ox_trading_status_message(ox_trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_trading_status_message(ox_trading_status_message_sent);
    assert(at == 16);
    at = 0;
    decode_ox_trading_status_message(ox_trading_status_message_got);
    assert(at == 16);
    equal_ox_trading_status_message(ox_trading_status_message_got, ox_trading_status_message_sent)
  }
}

/* Ox Width Update Message: encoded, read back, and compared */
proctype check_ox_width_update_message() {
  OxWidthUpdateMessage ox_width_update_message_sent;
  OxWidthUpdateMessage ox_width_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_width_update_message(ox_width_update_message_sent, 0)
  :: pattern == 1 -> fill_ox_width_update_message(ox_width_update_message_sent, 32)
  :: pattern == 2 -> fill_ox_width_update_message(ox_width_update_message_sent, 255)
  :: else -> ramp_ox_width_update_message(ox_width_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_width_update_message(ox_width_update_message_sent);
    assert(at == 17);
    at = 0;
    decode_ox_width_update_message(ox_width_update_message_got);
    assert(at == 17);
    equal_ox_width_update_message(ox_width_update_message_got, ox_width_update_message_sent)
  }
}

/* Ox Options Auction Update Message: encoded, read back, and compared */
proctype check_ox_options_auction_update_message() {
  OxOptionsAuctionUpdateMessage ox_options_auction_update_message_sent;
  OxOptionsAuctionUpdateMessage ox_options_auction_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_options_auction_update_message(ox_options_auction_update_message_sent, 0)
  :: pattern == 1 -> fill_ox_options_auction_update_message(ox_options_auction_update_message_sent, 32)
  :: pattern == 2 -> fill_ox_options_auction_update_message(ox_options_auction_update_message_sent, 255)
  :: else -> ramp_ox_options_auction_update_message(ox_options_auction_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_options_auction_update_message(ox_options_auction_update_message_sent);
    assert(at == 62);
    at = 0;
    decode_ox_options_auction_update_message(ox_options_auction_update_message_got);
    assert(at == 62);
    equal_ox_options_auction_update_message(ox_options_auction_update_message_got, ox_options_auction_update_message_sent)
  }
}

/* Ox Auction Summary Message: encoded, read back, and compared */
proctype check_ox_auction_summary_message() {
  OxAuctionSummaryMessage ox_auction_summary_message_sent;
  OxAuctionSummaryMessage ox_auction_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_auction_summary_message(ox_auction_summary_message_sent, 0)
  :: pattern == 1 -> fill_ox_auction_summary_message(ox_auction_summary_message_sent, 32)
  :: pattern == 2 -> fill_ox_auction_summary_message(ox_auction_summary_message_sent, 255)
  :: else -> ramp_ox_auction_summary_message(ox_auction_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_auction_summary_message(ox_auction_summary_message_sent);
    assert(at == 25);
    at = 0;
    decode_ox_auction_summary_message(ox_auction_summary_message_got);
    assert(at == 25);
    equal_ox_auction_summary_message(ox_auction_summary_message_got, ox_auction_summary_message_sent)
  }
}

/* Ox Auction Notification Message: encoded, read back, and compared */
proctype check_ox_auction_notification_message() {
  OxAuctionNotificationMessage ox_auction_notification_message_sent;
  OxAuctionNotificationMessage ox_auction_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_auction_notification_message(ox_auction_notification_message_sent, 0)
  :: pattern == 1 -> fill_ox_auction_notification_message(ox_auction_notification_message_sent, 32)
  :: pattern == 2 -> fill_ox_auction_notification_message(ox_auction_notification_message_sent, 255)
  :: else -> ramp_ox_auction_notification_message(ox_auction_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_auction_notification_message(ox_auction_notification_message_sent);
    assert(at == 45);
    at = 0;
    decode_ox_auction_notification_message(ox_auction_notification_message_got);
    assert(at == 45);
    equal_ox_auction_notification_message(ox_auction_notification_message_got, ox_auction_notification_message_sent)
  }
}

/* Ox Auction Cancel Message: encoded, read back, and compared */
proctype check_ox_auction_cancel_message() {
  OxAuctionCancelMessage ox_auction_cancel_message_sent;
  OxAuctionCancelMessage ox_auction_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_auction_cancel_message(ox_auction_cancel_message_sent, 0)
  :: pattern == 1 -> fill_ox_auction_cancel_message(ox_auction_cancel_message_sent, 32)
  :: pattern == 2 -> fill_ox_auction_cancel_message(ox_auction_cancel_message_sent, 255)
  :: else -> ramp_ox_auction_cancel_message(ox_auction_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_auction_cancel_message(ox_auction_cancel_message_sent);
    assert(at == 12);
    at = 0;
    decode_ox_auction_cancel_message(ox_auction_cancel_message_got);
    assert(at == 12);
    equal_ox_auction_cancel_message(ox_auction_cancel_message_got, ox_auction_cancel_message_sent)
  }
}

/* Ox Auction Trade Message: encoded, read back, and compared */
proctype check_ox_auction_trade_message() {
  OxAuctionTradeMessage ox_auction_trade_message_sent;
  OxAuctionTradeMessage ox_auction_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_auction_trade_message(ox_auction_trade_message_sent, 0)
  :: pattern == 1 -> fill_ox_auction_trade_message(ox_auction_trade_message_sent, 32)
  :: pattern == 2 -> fill_ox_auction_trade_message(ox_auction_trade_message_sent, 255)
  :: else -> ramp_ox_auction_trade_message(ox_auction_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_auction_trade_message(ox_auction_trade_message_sent);
    assert(at == 32);
    at = 0;
    decode_ox_auction_trade_message(ox_auction_trade_message_got);
    assert(at == 32);
    equal_ox_auction_trade_message(ox_auction_trade_message_got, ox_auction_trade_message_sent)
  }
}

/* Ox Soq Strike Range Update Message: encoded, read back, and compared */
proctype check_ox_soq_strike_range_update_message() {
  OxSoqStrikeRangeUpdateMessage ox_soq_strike_range_update_message_sent;
  OxSoqStrikeRangeUpdateMessage ox_soq_strike_range_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_sent, 0)
  :: pattern == 1 -> fill_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_sent, 32)
  :: pattern == 2 -> fill_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_sent, 255)
  :: else -> ramp_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_sent);
    assert(at == 40);
    at = 0;
    decode_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_got);
    assert(at == 40);
    equal_ox_soq_strike_range_update_message(ox_soq_strike_range_update_message_got, ox_soq_strike_range_update_message_sent)
  }
}

/* Ox Constituent Symbol Mapping Message: encoded, read back, and compared */
proctype check_ox_constituent_symbol_mapping_message() {
  OxConstituentSymbolMappingMessage ox_constituent_symbol_mapping_message_sent;
  OxConstituentSymbolMappingMessage ox_constituent_symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_sent, 255)
  :: else -> ramp_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_sent);
    assert(at == 56);
    at = 0;
    decode_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_got);
    assert(at == 56);
    equal_ox_constituent_symbol_mapping_message(ox_constituent_symbol_mapping_message_got, ox_constituent_symbol_mapping_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_ox_time_message()
  :: run check_ox_unit_clear_message()
  :: run check_ox_transaction_begin_message()
  :: run check_ox_transaction_end_message()
  :: run check_ox_order_executed_message()
  :: run check_ox_order_executed_at_price_size_message()
  :: run check_ox_reduce_size_long_message()
  :: run check_ox_reduce_size_short_message()
  :: run check_ox_delete_order_message()
  :: run check_ox_trade_long_message()
  :: run check_ox_trade_short_message()
  :: run check_ox_trade_expanded_message()
  :: run check_ox_trade_break_message()
  :: run check_ox_end_of_session()
  :: run check_ox_symbol_mapping_message()
  :: run check_ox_trading_status_message()
  :: run check_ox_width_update_message()
  :: run check_ox_options_auction_update_message()
  :: run check_ox_auction_summary_message()
  :: run check_ox_auction_notification_message()
  :: run check_ox_auction_cancel_message()
  :: run check_ox_auction_trade_message()
  :: run check_ox_soq_strike_range_update_message()
  :: run check_ox_constituent_symbol_mapping_message()
  fi
}
