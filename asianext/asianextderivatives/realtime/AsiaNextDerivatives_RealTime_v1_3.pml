/*
 * AsiaNext Real Time Market Data Feed
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
#define WIRE 37

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

/* ---- Sequence Number Reset Message: 4 bytes ---------------------------------- */

/* The Sequence Number Reset is published when AsiaNext initiates a seqNo reset. */
typedef SequenceNumberResetMessage {
  byte next_seq_no[4]
};

int sequence_number_reset_message_at;

/* every byte of Sequence Number Reset Message set to one value */
inline fill_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_value) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.next_seq_no[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Number Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_base) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.next_seq_no[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 0 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Number Reset Message to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> wire[at] = sequence_number_reset_message_record.next_seq_no[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Number Reset Message off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.next_seq_no[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Number Reset Message is what was written, byte for byte */
inline equal_sequence_number_reset_message(sequence_number_reset_message_read, sequence_number_reset_message_written) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> assert(sequence_number_reset_message_read.next_seq_no[sequence_number_reset_message_at] == sequence_number_reset_message_written.next_seq_no[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Add Message: 37 bytes --------------------------------------------- */

/* The Order Add message is published when order quantity is posted to the order book for a particular security. */
typedef OrderAddMessage {
  byte security_id[4];
  byte side;
  byte quantity[8];
  byte price[8];
  byte order_ref[8];
  byte timestamp[8]
};

int order_add_message_at;

/* every byte of Order Add Message set to one value */
inline fill_order_add_message(order_add_message_record, order_add_message_value) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.security_id[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.side = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.quantity[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.order_ref[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
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
  :: order_add_message_at < 4 -> order_add_message_record.security_id[order_add_message_at] = (order_add_message_base + 0 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.side = (order_add_message_base + 4 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.quantity[order_add_message_at] = (order_add_message_base + 5 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = (order_add_message_base + 13 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.order_ref[order_add_message_at] = (order_add_message_base + 21 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.timestamp[order_add_message_at] = (order_add_message_base + 29 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Add Message to the wire, 37 bytes from where the cursor stands */
inline encode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.security_id[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.side; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.quantity[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.price[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.order_ref[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.timestamp[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Add Message off the wire, 37 bytes from where the cursor stands */
inline decode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.security_id[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.side = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.quantity[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.order_ref[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
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
  :: order_add_message_at < 4 -> assert(order_add_message_read.security_id[order_add_message_at] == order_add_message_written.security_id[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.side == order_add_message_written.side);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.quantity[order_add_message_at] == order_add_message_written.quantity[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.price[order_add_message_at] == order_add_message_written.price[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.order_ref[order_add_message_at] == order_add_message_written.order_ref[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.timestamp[order_add_message_at] == order_add_message_written.timestamp[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 20 bytes ------------------------------------------ */

/* The Order Cancel message is published when a visible order is removed from the book. */
typedef OrderCancelMessage {
  byte security_id[4];
  byte order_ref[8];
  byte timestamp[8]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.security_id[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_ref[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 4 -> order_cancel_message_record.security_id[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_ref[order_cancel_message_at] = (order_cancel_message_base + 4 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = (order_cancel_message_base + 12 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 20 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.security_id[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.order_ref[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.timestamp[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 20 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.security_id[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_ref[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.security_id[order_cancel_message_at] == order_cancel_message_written.security_id[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.order_ref[order_cancel_message_at] == order_cancel_message_written.order_ref[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.timestamp[order_cancel_message_at] == order_cancel_message_written.timestamp[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modify Message: 36 bytes ------------------------------------------ */

/* The Order Modify message is published when a visible order is modified by the client (change of price and/or quantity). */
typedef OrderModifyMessage {
  byte security_id[4];
  byte quantity[8];
  byte price[8];
  byte order_ref[8];
  byte timestamp[8]
};

int order_modify_message_at;

/* every byte of Order Modify Message set to one value */
inline fill_order_modify_message(order_modify_message_record, order_modify_message_value) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.security_id[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.quantity[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.price[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.order_ref[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
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
  :: order_modify_message_at < 4 -> order_modify_message_record.security_id[order_modify_message_at] = (order_modify_message_base + 0 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.quantity[order_modify_message_at] = (order_modify_message_base + 4 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.price[order_modify_message_at] = (order_modify_message_base + 12 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.order_ref[order_modify_message_at] = (order_modify_message_base + 20 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.timestamp[order_modify_message_at] = (order_modify_message_base + 28 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modify Message to the wire, 36 bytes from where the cursor stands */
inline encode_order_modify_message(order_modify_message_record) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> wire[at] = order_modify_message_record.security_id[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.quantity[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.price[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.order_ref[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.timestamp[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modify Message off the wire, 36 bytes from where the cursor stands */
inline decode_order_modify_message(order_modify_message_record) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.security_id[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.quantity[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.price[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.order_ref[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
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
  :: order_modify_message_at < 4 -> assert(order_modify_message_read.security_id[order_modify_message_at] == order_modify_message_written.security_id[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.quantity[order_modify_message_at] == order_modify_message_written.quantity[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.price[order_modify_message_at] == order_modify_message_written.price[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.order_ref[order_modify_message_at] == order_modify_message_written.order_ref[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.timestamp[order_modify_message_at] == order_modify_message_written.timestamp[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick Table Data Message: 27 bytes --------------------------------------- */

/* A series of Tick Table Data messages are published to specify the dynamic tick tables and static ticks that apply to the securities traded on AsiaNext. */
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

/* ---- Contract Size Composite: 9 bytes ---------------------------------------- */

/* Contract size scaled at runtime by contractSizeDecimals */
typedef ContractSizeComposite {
  byte contract_size[8];
  byte contract_size_decimals
};

int contract_size_composite_at;

/* every byte of Contract Size Composite set to one value */
inline fill_contract_size_composite(contract_size_composite_record, contract_size_composite_value) {
  contract_size_composite_at = 0;
  do
  :: contract_size_composite_at < 8 -> contract_size_composite_record.contract_size[contract_size_composite_at] = contract_size_composite_value; contract_size_composite_at = contract_size_composite_at + 1
  :: else -> break
  od;
  contract_size_composite_record.contract_size_decimals = contract_size_composite_value;
  skip
}

/* each byte of Contract Size Composite set to where it lies, so a field read out of place says so */
inline ramp_contract_size_composite(contract_size_composite_record, contract_size_composite_base) {
  contract_size_composite_at = 0;
  do
  :: contract_size_composite_at < 8 -> contract_size_composite_record.contract_size[contract_size_composite_at] = (contract_size_composite_base + 0 + contract_size_composite_at + 1) % 256; contract_size_composite_at = contract_size_composite_at + 1
  :: else -> break
  od;
  contract_size_composite_record.contract_size_decimals = (contract_size_composite_base + 8 + 1) % 256;
  skip
}

/* Contract Size Composite to the wire, 9 bytes from where the cursor stands */
inline encode_contract_size_composite(contract_size_composite_record) {
  contract_size_composite_at = 0;
  do
  :: contract_size_composite_at < 8 -> wire[at] = contract_size_composite_record.contract_size[contract_size_composite_at]; at = at + 1; contract_size_composite_at = contract_size_composite_at + 1
  :: else -> break
  od;
  wire[at] = contract_size_composite_record.contract_size_decimals; at = at + 1;
  skip
}

/* Contract Size Composite off the wire, 9 bytes from where the cursor stands */
inline decode_contract_size_composite(contract_size_composite_record) {
  contract_size_composite_at = 0;
  do
  :: contract_size_composite_at < 8 -> contract_size_composite_record.contract_size[contract_size_composite_at] = wire[at]; at = at + 1; contract_size_composite_at = contract_size_composite_at + 1
  :: else -> break
  od;
  contract_size_composite_record.contract_size_decimals = wire[at]; at = at + 1;
  skip
}

/* what was read of Contract Size Composite is what was written, byte for byte */
inline equal_contract_size_composite(contract_size_composite_read, contract_size_composite_written) {
  contract_size_composite_at = 0;
  do
  :: contract_size_composite_at < 8 -> assert(contract_size_composite_read.contract_size[contract_size_composite_at] == contract_size_composite_written.contract_size[contract_size_composite_at]); contract_size_composite_at = contract_size_composite_at + 1
  :: else -> break
  od;
  assert(contract_size_composite_read.contract_size_decimals == contract_size_composite_written.contract_size_decimals);
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

/* Sequence Number Reset Message: encoded, read back, and compared */
proctype check_sequence_number_reset_message() {
  SequenceNumberResetMessage sequence_number_reset_message_sent;
  SequenceNumberResetMessage sequence_number_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 255)
  :: else -> ramp_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_number_reset_message(sequence_number_reset_message_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_number_reset_message(sequence_number_reset_message_got);
    assert(at == 4);
    equal_sequence_number_reset_message(sequence_number_reset_message_got, sequence_number_reset_message_sent)
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
    assert(at == 37);
    at = 0;
    decode_order_add_message(order_add_message_got);
    assert(at == 37);
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
    assert(at == 20);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 20);
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
    assert(at == 36);
    at = 0;
    decode_order_modify_message(order_modify_message_got);
    assert(at == 36);
    equal_order_modify_message(order_modify_message_got, order_modify_message_sent)
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

/* Contract Size Composite: encoded, read back, and compared */
proctype check_contract_size_composite() {
  ContractSizeComposite contract_size_composite_sent;
  ContractSizeComposite contract_size_composite_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_size_composite(contract_size_composite_sent, 0)
  :: pattern == 1 -> fill_contract_size_composite(contract_size_composite_sent, 32)
  :: pattern == 2 -> fill_contract_size_composite(contract_size_composite_sent, 255)
  :: else -> ramp_contract_size_composite(contract_size_composite_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_size_composite(contract_size_composite_sent);
    assert(at == 9);
    at = 0;
    decode_contract_size_composite(contract_size_composite_got);
    assert(at == 9);
    equal_contract_size_composite(contract_size_composite_got, contract_size_composite_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_sequence_number_reset_message()
  :: run check_order_add_message()
  :: run check_order_cancel_message()
  :: run check_order_modify_message()
  :: run check_tick_table_data_message()
  :: run check_lot_size_composite()
  :: run check_contract_size_composite()
  fi
}
