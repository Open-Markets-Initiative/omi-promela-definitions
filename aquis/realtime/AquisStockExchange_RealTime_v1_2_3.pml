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
#define WIRE 36

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

/* ---- Order Add Message: 27 bytes --------------------------------------------- */

/* The Order Add message is published when order quantity is posted to the order book for a particular security. This message is only applicable to continuous trading. */
typedef OrderAddMessage {
  byte security_id[2];
  byte side;
  byte quantity[4];
  byte price[8];
  byte order_ref[4];
  byte timestamp[8]
};

int order_add_message_at;

/* every byte of Order Add Message set to one value */
inline fill_order_add_message(order_add_message_record, order_add_message_value) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.security_id[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.side = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.quantity[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.order_ref[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.timestamp[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Add Message set to where it lies, so a field read out of place says so */
inline ramp_order_add_message(order_add_message_record, order_add_message_base) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.security_id[order_add_message_at] = (order_add_message_base + 0 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.side = (order_add_message_base + 2 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.quantity[order_add_message_at] = (order_add_message_base + 3 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = (order_add_message_base + 7 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.order_ref[order_add_message_at] = (order_add_message_base + 15 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.timestamp[order_add_message_at] = (order_add_message_base + 19 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Add Message to the wire, 27 bytes from where the cursor stands */
inline encode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> wire[at] = order_add_message_record.security_id[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.side; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.quantity[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.price[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.order_ref[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.timestamp[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Add Message off the wire, 27 bytes from where the cursor stands */
inline decode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.security_id[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.side = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.quantity[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.order_ref[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.timestamp[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Add Message is what was written, byte for byte */
inline equal_order_add_message(order_add_message_read, order_add_message_written) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> assert(order_add_message_read.security_id[order_add_message_at] == order_add_message_written.security_id[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.side == order_add_message_written.side);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.quantity[order_add_message_at] == order_add_message_written.quantity[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.price[order_add_message_at] == order_add_message_written.price[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.order_ref[order_add_message_at] == order_add_message_written.order_ref[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.timestamp[order_add_message_at] == order_add_message_written.timestamp[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 14 bytes ------------------------------------------ */

/* The Order Cancel message is published when a visible order is removed from the book. This message is only applicable to continuous trading. */
typedef OrderCancelMessage {
  byte security_id[2];
  byte order_ref[4];
  byte timestamp[8]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.security_id[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_ref[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message(order_cancel_message_record, order_cancel_message_base) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.security_id[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_ref[order_cancel_message_at] = (order_cancel_message_base + 2 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = (order_cancel_message_base + 6 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 14 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> wire[at] = order_cancel_message_record.security_id[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.order_ref[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.timestamp[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 14 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.security_id[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_ref[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Message is what was written, byte for byte */
inline equal_order_cancel_message(order_cancel_message_read, order_cancel_message_written) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> assert(order_cancel_message_read.security_id[order_cancel_message_at] == order_cancel_message_written.security_id[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.order_ref[order_cancel_message_at] == order_cancel_message_written.order_ref[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.timestamp[order_cancel_message_at] == order_cancel_message_written.timestamp[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modify Message: 26 bytes ------------------------------------------ */

/* The Order Modify message is published when a visible order is modified by the client (change of price and/or quantity). The order reference number remains the same on order modification. This message is only applicable to continuous trading. */
typedef OrderModifyMessage {
  byte security_id[2];
  byte remaining_quantity[4];
  byte price[8];
  byte order_ref[4];
  byte timestamp[8]
};

int order_modify_message_at;

/* every byte of Order Modify Message set to one value */
inline fill_order_modify_message(order_modify_message_record, order_modify_message_value) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 2 -> order_modify_message_record.security_id[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.remaining_quantity[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.price[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.order_ref[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.timestamp[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modify Message set to where it lies, so a field read out of place says so */
inline ramp_order_modify_message(order_modify_message_record, order_modify_message_base) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 2 -> order_modify_message_record.security_id[order_modify_message_at] = (order_modify_message_base + 0 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.remaining_quantity[order_modify_message_at] = (order_modify_message_base + 2 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.price[order_modify_message_at] = (order_modify_message_base + 6 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.order_ref[order_modify_message_at] = (order_modify_message_base + 14 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.timestamp[order_modify_message_at] = (order_modify_message_base + 18 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modify Message to the wire, 26 bytes from where the cursor stands */
inline encode_order_modify_message(order_modify_message_record) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 2 -> wire[at] = order_modify_message_record.security_id[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> wire[at] = order_modify_message_record.remaining_quantity[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.price[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> wire[at] = order_modify_message_record.order_ref[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.timestamp[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modify Message off the wire, 26 bytes from where the cursor stands */
inline decode_order_modify_message(order_modify_message_record) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 2 -> order_modify_message_record.security_id[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.remaining_quantity[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.price[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.order_ref[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.timestamp[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modify Message is what was written, byte for byte */
inline equal_order_modify_message(order_modify_message_read, order_modify_message_written) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 2 -> assert(order_modify_message_read.security_id[order_modify_message_at] == order_modify_message_written.security_id[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> assert(order_modify_message_read.remaining_quantity[order_modify_message_at] == order_modify_message_written.remaining_quantity[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.price[order_modify_message_at] == order_modify_message_written.price[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> assert(order_modify_message_read.order_ref[order_modify_message_at] == order_modify_message_written.order_ref[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.timestamp[order_modify_message_at] == order_modify_message_written.timestamp[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Add Replace Message: 36 bytes ------------------------------------- */

/* The Quote Add/Replace message is published when a quote is available for a particular security. */
typedef QuoteAddReplaceMessage {
  byte trader_id[2];
  byte security_id[2];
  byte bid_quantity[4];
  byte bid_price[8];
  byte offer_quantity[4];
  byte offer_price[8];
  byte timestamp[8]
};

int quote_add_replace_message_at;

/* every byte of Quote Add Replace Message set to one value */
inline fill_quote_add_replace_message(quote_add_replace_message_record, quote_add_replace_message_value) {
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> quote_add_replace_message_record.trader_id[quote_add_replace_message_at] = quote_add_replace_message_value; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> quote_add_replace_message_record.security_id[quote_add_replace_message_at] = quote_add_replace_message_value; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> quote_add_replace_message_record.bid_quantity[quote_add_replace_message_at] = quote_add_replace_message_value; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> quote_add_replace_message_record.bid_price[quote_add_replace_message_at] = quote_add_replace_message_value; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> quote_add_replace_message_record.offer_quantity[quote_add_replace_message_at] = quote_add_replace_message_value; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> quote_add_replace_message_record.offer_price[quote_add_replace_message_at] = quote_add_replace_message_value; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> quote_add_replace_message_record.timestamp[quote_add_replace_message_at] = quote_add_replace_message_value; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Add Replace Message set to where it lies, so a field read out of place says so */
inline ramp_quote_add_replace_message(quote_add_replace_message_record, quote_add_replace_message_base) {
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> quote_add_replace_message_record.trader_id[quote_add_replace_message_at] = (quote_add_replace_message_base + 0 + quote_add_replace_message_at + 1) % 256; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> quote_add_replace_message_record.security_id[quote_add_replace_message_at] = (quote_add_replace_message_base + 2 + quote_add_replace_message_at + 1) % 256; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> quote_add_replace_message_record.bid_quantity[quote_add_replace_message_at] = (quote_add_replace_message_base + 4 + quote_add_replace_message_at + 1) % 256; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> quote_add_replace_message_record.bid_price[quote_add_replace_message_at] = (quote_add_replace_message_base + 8 + quote_add_replace_message_at + 1) % 256; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> quote_add_replace_message_record.offer_quantity[quote_add_replace_message_at] = (quote_add_replace_message_base + 16 + quote_add_replace_message_at + 1) % 256; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> quote_add_replace_message_record.offer_price[quote_add_replace_message_at] = (quote_add_replace_message_base + 20 + quote_add_replace_message_at + 1) % 256; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> quote_add_replace_message_record.timestamp[quote_add_replace_message_at] = (quote_add_replace_message_base + 28 + quote_add_replace_message_at + 1) % 256; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Add Replace Message to the wire, 36 bytes from where the cursor stands */
inline encode_quote_add_replace_message(quote_add_replace_message_record) {
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> wire[at] = quote_add_replace_message_record.trader_id[quote_add_replace_message_at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> wire[at] = quote_add_replace_message_record.security_id[quote_add_replace_message_at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> wire[at] = quote_add_replace_message_record.bid_quantity[quote_add_replace_message_at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> wire[at] = quote_add_replace_message_record.bid_price[quote_add_replace_message_at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> wire[at] = quote_add_replace_message_record.offer_quantity[quote_add_replace_message_at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> wire[at] = quote_add_replace_message_record.offer_price[quote_add_replace_message_at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> wire[at] = quote_add_replace_message_record.timestamp[quote_add_replace_message_at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Add Replace Message off the wire, 36 bytes from where the cursor stands */
inline decode_quote_add_replace_message(quote_add_replace_message_record) {
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> quote_add_replace_message_record.trader_id[quote_add_replace_message_at] = wire[at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> quote_add_replace_message_record.security_id[quote_add_replace_message_at] = wire[at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> quote_add_replace_message_record.bid_quantity[quote_add_replace_message_at] = wire[at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> quote_add_replace_message_record.bid_price[quote_add_replace_message_at] = wire[at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> quote_add_replace_message_record.offer_quantity[quote_add_replace_message_at] = wire[at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> quote_add_replace_message_record.offer_price[quote_add_replace_message_at] = wire[at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> quote_add_replace_message_record.timestamp[quote_add_replace_message_at] = wire[at]; at = at + 1; quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Add Replace Message is what was written, byte for byte */
inline equal_quote_add_replace_message(quote_add_replace_message_read, quote_add_replace_message_written) {
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> assert(quote_add_replace_message_read.trader_id[quote_add_replace_message_at] == quote_add_replace_message_written.trader_id[quote_add_replace_message_at]); quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 2 -> assert(quote_add_replace_message_read.security_id[quote_add_replace_message_at] == quote_add_replace_message_written.security_id[quote_add_replace_message_at]); quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> assert(quote_add_replace_message_read.bid_quantity[quote_add_replace_message_at] == quote_add_replace_message_written.bid_quantity[quote_add_replace_message_at]); quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> assert(quote_add_replace_message_read.bid_price[quote_add_replace_message_at] == quote_add_replace_message_written.bid_price[quote_add_replace_message_at]); quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 4 -> assert(quote_add_replace_message_read.offer_quantity[quote_add_replace_message_at] == quote_add_replace_message_written.offer_quantity[quote_add_replace_message_at]); quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> assert(quote_add_replace_message_read.offer_price[quote_add_replace_message_at] == quote_add_replace_message_written.offer_price[quote_add_replace_message_at]); quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  quote_add_replace_message_at = 0;
  do
  :: quote_add_replace_message_at < 8 -> assert(quote_add_replace_message_read.timestamp[quote_add_replace_message_at] == quote_add_replace_message_written.timestamp[quote_add_replace_message_at]); quote_add_replace_message_at = quote_add_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Cancel Message: 12 bytes ------------------------------------------ */

/* The Quote Cancel message is published when a quote is removed for a particular security. The quote may have been cancelled by the trading Member or by the Aquis support team or the market may have closed. */
typedef QuoteCancelMessage {
  byte trader_id[2];
  byte security_id[2];
  byte timestamp[8]
};

int quote_cancel_message_at;

/* every byte of Quote Cancel Message set to one value */
inline fill_quote_cancel_message(quote_cancel_message_record, quote_cancel_message_value) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> quote_cancel_message_record.trader_id[quote_cancel_message_at] = quote_cancel_message_value; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> quote_cancel_message_record.security_id[quote_cancel_message_at] = quote_cancel_message_value; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> quote_cancel_message_record.timestamp[quote_cancel_message_at] = quote_cancel_message_value; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_quote_cancel_message(quote_cancel_message_record, quote_cancel_message_base) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> quote_cancel_message_record.trader_id[quote_cancel_message_at] = (quote_cancel_message_base + 0 + quote_cancel_message_at + 1) % 256; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> quote_cancel_message_record.security_id[quote_cancel_message_at] = (quote_cancel_message_base + 2 + quote_cancel_message_at + 1) % 256; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> quote_cancel_message_record.timestamp[quote_cancel_message_at] = (quote_cancel_message_base + 4 + quote_cancel_message_at + 1) % 256; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Cancel Message to the wire, 12 bytes from where the cursor stands */
inline encode_quote_cancel_message(quote_cancel_message_record) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> wire[at] = quote_cancel_message_record.trader_id[quote_cancel_message_at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> wire[at] = quote_cancel_message_record.security_id[quote_cancel_message_at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> wire[at] = quote_cancel_message_record.timestamp[quote_cancel_message_at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Cancel Message off the wire, 12 bytes from where the cursor stands */
inline decode_quote_cancel_message(quote_cancel_message_record) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> quote_cancel_message_record.trader_id[quote_cancel_message_at] = wire[at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> quote_cancel_message_record.security_id[quote_cancel_message_at] = wire[at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> quote_cancel_message_record.timestamp[quote_cancel_message_at] = wire[at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Cancel Message is what was written, byte for byte */
inline equal_quote_cancel_message(quote_cancel_message_read, quote_cancel_message_written) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> assert(quote_cancel_message_read.trader_id[quote_cancel_message_at] == quote_cancel_message_written.trader_id[quote_cancel_message_at]); quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> assert(quote_cancel_message_read.security_id[quote_cancel_message_at] == quote_cancel_message_written.security_id[quote_cancel_message_at]); quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> assert(quote_cancel_message_read.timestamp[quote_cancel_message_at] == quote_cancel_message_written.timestamp[quote_cancel_message_at]); quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Statistics Message: 19 bytes ----------------------------------- */

/* The Security Statistics message is published to disseminate the opening and closing prices of a security. */
typedef SecurityStatisticsMessage {
  byte security_id[2];
  byte statistics_price[8];
  byte price_type;
  byte timestamp[8]
};

int security_statistics_message_at;

/* every byte of Security Statistics Message set to one value */
inline fill_security_statistics_message(security_statistics_message_record, security_statistics_message_value) {
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 2 -> security_statistics_message_record.security_id[security_statistics_message_at] = security_statistics_message_value; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> security_statistics_message_record.statistics_price[security_statistics_message_at] = security_statistics_message_value; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  security_statistics_message_record.price_type = security_statistics_message_value;
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> security_statistics_message_record.timestamp[security_statistics_message_at] = security_statistics_message_value; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_security_statistics_message(security_statistics_message_record, security_statistics_message_base) {
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 2 -> security_statistics_message_record.security_id[security_statistics_message_at] = (security_statistics_message_base + 0 + security_statistics_message_at + 1) % 256; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> security_statistics_message_record.statistics_price[security_statistics_message_at] = (security_statistics_message_base + 2 + security_statistics_message_at + 1) % 256; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  security_statistics_message_record.price_type = (security_statistics_message_base + 10 + 1) % 256;
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> security_statistics_message_record.timestamp[security_statistics_message_at] = (security_statistics_message_base + 11 + security_statistics_message_at + 1) % 256; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Statistics Message to the wire, 19 bytes from where the cursor stands */
inline encode_security_statistics_message(security_statistics_message_record) {
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 2 -> wire[at] = security_statistics_message_record.security_id[security_statistics_message_at]; at = at + 1; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> wire[at] = security_statistics_message_record.statistics_price[security_statistics_message_at]; at = at + 1; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = security_statistics_message_record.price_type; at = at + 1;
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> wire[at] = security_statistics_message_record.timestamp[security_statistics_message_at]; at = at + 1; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Statistics Message off the wire, 19 bytes from where the cursor stands */
inline decode_security_statistics_message(security_statistics_message_record) {
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 2 -> security_statistics_message_record.security_id[security_statistics_message_at] = wire[at]; at = at + 1; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> security_statistics_message_record.statistics_price[security_statistics_message_at] = wire[at]; at = at + 1; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  security_statistics_message_record.price_type = wire[at]; at = at + 1;
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> security_statistics_message_record.timestamp[security_statistics_message_at] = wire[at]; at = at + 1; security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Statistics Message is what was written, byte for byte */
inline equal_security_statistics_message(security_statistics_message_read, security_statistics_message_written) {
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 2 -> assert(security_statistics_message_read.security_id[security_statistics_message_at] == security_statistics_message_written.security_id[security_statistics_message_at]); security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> assert(security_statistics_message_read.statistics_price[security_statistics_message_at] == security_statistics_message_written.statistics_price[security_statistics_message_at]); security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  assert(security_statistics_message_read.price_type == security_statistics_message_written.price_type);
  security_statistics_message_at = 0;
  do
  :: security_statistics_message_at < 8 -> assert(security_statistics_message_read.timestamp[security_statistics_message_at] == security_statistics_message_written.timestamp[security_statistics_message_at]); security_statistics_message_at = security_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trader Definition Message: 18 bytes ------------------------------------- */

/* A series of Trader Definition messages are published pre-market to identify the quote originators. */
typedef TraderDefinitionMessage {
  byte trader_id[2];
  byte sender_id[16]
};

int trader_definition_message_at;

/* every byte of Trader Definition Message set to one value */
inline fill_trader_definition_message(trader_definition_message_record, trader_definition_message_value) {
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 2 -> trader_definition_message_record.trader_id[trader_definition_message_at] = trader_definition_message_value; trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 16 -> trader_definition_message_record.sender_id[trader_definition_message_at] = trader_definition_message_value; trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trader Definition Message set to where it lies, so a field read out of place says so */
inline ramp_trader_definition_message(trader_definition_message_record, trader_definition_message_base) {
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 2 -> trader_definition_message_record.trader_id[trader_definition_message_at] = (trader_definition_message_base + 0 + trader_definition_message_at + 1) % 256; trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 16 -> trader_definition_message_record.sender_id[trader_definition_message_at] = (trader_definition_message_base + 2 + trader_definition_message_at + 1) % 256; trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Definition Message to the wire, 18 bytes from where the cursor stands */
inline encode_trader_definition_message(trader_definition_message_record) {
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 2 -> wire[at] = trader_definition_message_record.trader_id[trader_definition_message_at]; at = at + 1; trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 16 -> wire[at] = trader_definition_message_record.sender_id[trader_definition_message_at]; at = at + 1; trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Definition Message off the wire, 18 bytes from where the cursor stands */
inline decode_trader_definition_message(trader_definition_message_record) {
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 2 -> trader_definition_message_record.trader_id[trader_definition_message_at] = wire[at]; at = at + 1; trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 16 -> trader_definition_message_record.sender_id[trader_definition_message_at] = wire[at]; at = at + 1; trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trader Definition Message is what was written, byte for byte */
inline equal_trader_definition_message(trader_definition_message_read, trader_definition_message_written) {
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 2 -> assert(trader_definition_message_read.trader_id[trader_definition_message_at] == trader_definition_message_written.trader_id[trader_definition_message_at]); trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  trader_definition_message_at = 0;
  do
  :: trader_definition_message_at < 16 -> assert(trader_definition_message_read.sender_id[trader_definition_message_at] == trader_definition_message_written.sender_id[trader_definition_message_at]); trader_definition_message_at = trader_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick Table Data Message: 27 bytes --------------------------------------- */

/* A series of Tick Table Data messages are published pre-market to specify the dynamic tick tables and static ticks that apply to the securities traded on AQSE. */
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

/* ---- Security Definition Message: 28 bytes ----------------------------------- */

/* A series of Security Definition messages are published pre-market to identify the securities traded on AQSE (those relevant to the particular feed e.g. Euronext securities). */
typedef SecurityDefinitionMessage {
  byte security_id[2];
  byte umtf[6];
  byte isin[12];
  byte currency[3];
  byte mic[4];
  byte tick_table_id
};

int security_definition_message_at;

/* every byte of Security Definition Message set to one value */
inline fill_security_definition_message(security_definition_message_record, security_definition_message_value) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> security_definition_message_record.security_id[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> security_definition_message_record.umtf[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> security_definition_message_record.isin[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> security_definition_message_record.currency[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.mic[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_record.tick_table_id = security_definition_message_value;
  skip
}

/* each byte of Security Definition Message set to where it lies, so a field read out of place says so */
inline ramp_security_definition_message(security_definition_message_record, security_definition_message_base) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> security_definition_message_record.security_id[security_definition_message_at] = (security_definition_message_base + 0 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> security_definition_message_record.umtf[security_definition_message_at] = (security_definition_message_base + 2 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> security_definition_message_record.isin[security_definition_message_at] = (security_definition_message_base + 8 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> security_definition_message_record.currency[security_definition_message_at] = (security_definition_message_base + 20 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.mic[security_definition_message_at] = (security_definition_message_base + 23 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_record.tick_table_id = (security_definition_message_base + 27 + 1) % 256;
  skip
}

/* Security Definition Message to the wire, 28 bytes from where the cursor stands */
inline encode_security_definition_message(security_definition_message_record) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> wire[at] = security_definition_message_record.security_id[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> wire[at] = security_definition_message_record.umtf[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> wire[at] = security_definition_message_record.isin[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> wire[at] = security_definition_message_record.currency[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> wire[at] = security_definition_message_record.mic[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_message_record.tick_table_id; at = at + 1;
  skip
}

/* Security Definition Message off the wire, 28 bytes from where the cursor stands */
inline decode_security_definition_message(security_definition_message_record) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> security_definition_message_record.security_id[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> security_definition_message_record.umtf[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> security_definition_message_record.isin[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> security_definition_message_record.currency[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.mic[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_record.tick_table_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Security Definition Message is what was written, byte for byte */
inline equal_security_definition_message(security_definition_message_read, security_definition_message_written) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> assert(security_definition_message_read.security_id[security_definition_message_at] == security_definition_message_written.security_id[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> assert(security_definition_message_read.umtf[security_definition_message_at] == security_definition_message_written.umtf[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> assert(security_definition_message_read.isin[security_definition_message_at] == security_definition_message_written.isin[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> assert(security_definition_message_read.currency[security_definition_message_at] == security_definition_message_written.currency[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> assert(security_definition_message_read.mic[security_definition_message_at] == security_definition_message_written.mic[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  assert(security_definition_message_read.tick_table_id == security_definition_message_written.tick_table_id);
  skip
}

/* ---- Aod Update Message: 22 bytes -------------------------------------------- */

/* During the AoD this message is used to publish the indicative price and indicative matched volume. The first AoD update message signals the start of an auction. */
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

/* Order Add Message: encoded, read back, and compared */
proctype check_order_add_message() {
  OrderAddMessage order_add_message_sent;
  OrderAddMessage order_add_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_add_message(order_add_message_sent, 0)
  :: pattern == 1 -> fill_order_add_message(order_add_message_sent, 32)
  :: pattern == 2 -> fill_order_add_message(order_add_message_sent, 255)
  :: else -> ramp_order_add_message(order_add_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_add_message(order_add_message_sent);
    assert(at == 27);
    at = 0;
    decode_order_add_message(order_add_message_got);
    assert(at == 27);
    equal_order_add_message(order_add_message_got, order_add_message_sent)
  }
}

/* Order Cancel Message: encoded, read back, and compared */
proctype check_order_cancel_message() {
  OrderCancelMessage order_cancel_message_sent;
  OrderCancelMessage order_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_message(order_cancel_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_message(order_cancel_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_message(order_cancel_message_sent, 255)
  :: else -> ramp_order_cancel_message(order_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_message(order_cancel_message_sent);
    assert(at == 14);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 14);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
  }
}

/* Order Modify Message: encoded, read back, and compared */
proctype check_order_modify_message() {
  OrderModifyMessage order_modify_message_sent;
  OrderModifyMessage order_modify_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modify_message(order_modify_message_sent, 0)
  :: pattern == 1 -> fill_order_modify_message(order_modify_message_sent, 32)
  :: pattern == 2 -> fill_order_modify_message(order_modify_message_sent, 255)
  :: else -> ramp_order_modify_message(order_modify_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modify_message(order_modify_message_sent);
    assert(at == 26);
    at = 0;
    decode_order_modify_message(order_modify_message_got);
    assert(at == 26);
    equal_order_modify_message(order_modify_message_got, order_modify_message_sent)
  }
}

/* Quote Add Replace Message: encoded, read back, and compared */
proctype check_quote_add_replace_message() {
  QuoteAddReplaceMessage quote_add_replace_message_sent;
  QuoteAddReplaceMessage quote_add_replace_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_add_replace_message(quote_add_replace_message_sent, 0)
  :: pattern == 1 -> fill_quote_add_replace_message(quote_add_replace_message_sent, 32)
  :: pattern == 2 -> fill_quote_add_replace_message(quote_add_replace_message_sent, 255)
  :: else -> ramp_quote_add_replace_message(quote_add_replace_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_add_replace_message(quote_add_replace_message_sent);
    assert(at == 36);
    at = 0;
    decode_quote_add_replace_message(quote_add_replace_message_got);
    assert(at == 36);
    equal_quote_add_replace_message(quote_add_replace_message_got, quote_add_replace_message_sent)
  }
}

/* Quote Cancel Message: encoded, read back, and compared */
proctype check_quote_cancel_message() {
  QuoteCancelMessage quote_cancel_message_sent;
  QuoteCancelMessage quote_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_cancel_message(quote_cancel_message_sent, 0)
  :: pattern == 1 -> fill_quote_cancel_message(quote_cancel_message_sent, 32)
  :: pattern == 2 -> fill_quote_cancel_message(quote_cancel_message_sent, 255)
  :: else -> ramp_quote_cancel_message(quote_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_cancel_message(quote_cancel_message_sent);
    assert(at == 12);
    at = 0;
    decode_quote_cancel_message(quote_cancel_message_got);
    assert(at == 12);
    equal_quote_cancel_message(quote_cancel_message_got, quote_cancel_message_sent)
  }
}

/* Security Statistics Message: encoded, read back, and compared */
proctype check_security_statistics_message() {
  SecurityStatisticsMessage security_statistics_message_sent;
  SecurityStatisticsMessage security_statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_statistics_message(security_statistics_message_sent, 0)
  :: pattern == 1 -> fill_security_statistics_message(security_statistics_message_sent, 32)
  :: pattern == 2 -> fill_security_statistics_message(security_statistics_message_sent, 255)
  :: else -> ramp_security_statistics_message(security_statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_statistics_message(security_statistics_message_sent);
    assert(at == 19);
    at = 0;
    decode_security_statistics_message(security_statistics_message_got);
    assert(at == 19);
    equal_security_statistics_message(security_statistics_message_got, security_statistics_message_sent)
  }
}

/* Trader Definition Message: encoded, read back, and compared */
proctype check_trader_definition_message() {
  TraderDefinitionMessage trader_definition_message_sent;
  TraderDefinitionMessage trader_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trader_definition_message(trader_definition_message_sent, 0)
  :: pattern == 1 -> fill_trader_definition_message(trader_definition_message_sent, 32)
  :: pattern == 2 -> fill_trader_definition_message(trader_definition_message_sent, 255)
  :: else -> ramp_trader_definition_message(trader_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trader_definition_message(trader_definition_message_sent);
    assert(at == 18);
    at = 0;
    decode_trader_definition_message(trader_definition_message_got);
    assert(at == 18);
    equal_trader_definition_message(trader_definition_message_got, trader_definition_message_sent)
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

/* Security Definition Message: encoded, read back, and compared */
proctype check_security_definition_message() {
  SecurityDefinitionMessage security_definition_message_sent;
  SecurityDefinitionMessage security_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_definition_message(security_definition_message_sent, 0)
  :: pattern == 1 -> fill_security_definition_message(security_definition_message_sent, 32)
  :: pattern == 2 -> fill_security_definition_message(security_definition_message_sent, 255)
  :: else -> ramp_security_definition_message(security_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_definition_message(security_definition_message_sent);
    assert(at == 28);
    at = 0;
    decode_security_definition_message(security_definition_message_got);
    assert(at == 28);
    equal_security_definition_message(security_definition_message_got, security_definition_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_order_add_message()
  :: run check_order_cancel_message()
  :: run check_order_modify_message()
  :: run check_quote_add_replace_message()
  :: run check_quote_cancel_message()
  :: run check_security_statistics_message()
  :: run check_trader_definition_message()
  :: run check_tick_table_data_message()
  :: run check_security_definition_message()
  :: run check_aod_update_message()
  fi
}
