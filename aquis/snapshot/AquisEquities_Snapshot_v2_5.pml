/*
 * Aquis Exchange Aquis Market Data Snapshot
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
#define WIRE 19

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

/* ---- Snapshot Start Message: 14 bytes ---------------------------------------- */

/* A Snapshot Start message is published as the first message in a snapshot to identify the sequence number in the continuous stream that this snapshot relates to. It also states the number of securities being reported in this snapshot. */
typedef SnapshotStartMessage {
  byte stream_seq_no[4];
  byte security_count[2];
  byte timestamp[8]
};

int snapshot_start_message_at;

/* every byte of Snapshot Start Message set to one value */
inline fill_snapshot_start_message(snapshot_start_message_record, snapshot_start_message_value) {
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 4 -> snapshot_start_message_record.stream_seq_no[snapshot_start_message_at] = snapshot_start_message_value; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 2 -> snapshot_start_message_record.security_count[snapshot_start_message_at] = snapshot_start_message_value; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 8 -> snapshot_start_message_record.timestamp[snapshot_start_message_at] = snapshot_start_message_value; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Start Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_start_message(snapshot_start_message_record, snapshot_start_message_base) {
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 4 -> snapshot_start_message_record.stream_seq_no[snapshot_start_message_at] = (snapshot_start_message_base + 0 + snapshot_start_message_at + 1) % 256; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 2 -> snapshot_start_message_record.security_count[snapshot_start_message_at] = (snapshot_start_message_base + 4 + snapshot_start_message_at + 1) % 256; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 8 -> snapshot_start_message_record.timestamp[snapshot_start_message_at] = (snapshot_start_message_base + 6 + snapshot_start_message_at + 1) % 256; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Start Message to the wire, 14 bytes from where the cursor stands */
inline encode_snapshot_start_message(snapshot_start_message_record) {
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 4 -> wire[at] = snapshot_start_message_record.stream_seq_no[snapshot_start_message_at]; at = at + 1; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 2 -> wire[at] = snapshot_start_message_record.security_count[snapshot_start_message_at]; at = at + 1; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 8 -> wire[at] = snapshot_start_message_record.timestamp[snapshot_start_message_at]; at = at + 1; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Start Message off the wire, 14 bytes from where the cursor stands */
inline decode_snapshot_start_message(snapshot_start_message_record) {
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 4 -> snapshot_start_message_record.stream_seq_no[snapshot_start_message_at] = wire[at]; at = at + 1; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 2 -> snapshot_start_message_record.security_count[snapshot_start_message_at] = wire[at]; at = at + 1; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 8 -> snapshot_start_message_record.timestamp[snapshot_start_message_at] = wire[at]; at = at + 1; snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Start Message is what was written, byte for byte */
inline equal_snapshot_start_message(snapshot_start_message_read, snapshot_start_message_written) {
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 4 -> assert(snapshot_start_message_read.stream_seq_no[snapshot_start_message_at] == snapshot_start_message_written.stream_seq_no[snapshot_start_message_at]); snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 2 -> assert(snapshot_start_message_read.security_count[snapshot_start_message_at] == snapshot_start_message_written.security_count[snapshot_start_message_at]); snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  snapshot_start_message_at = 0;
  do
  :: snapshot_start_message_at < 8 -> assert(snapshot_start_message_read.timestamp[snapshot_start_message_at] == snapshot_start_message_written.timestamp[snapshot_start_message_at]); snapshot_start_message_at = snapshot_start_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Book Entry Message: 19 bytes -------------------------------------------- */

/* An appropriate number of Book Entry messages is published after each Book Status message to provide details of each order and allow the book to be built. */
typedef BookEntryMessage {
  byte security_id[2];
  byte side;
  byte quantity[4];
  byte price[8];
  byte order_ref[4]
};

int book_entry_message_at;

/* every byte of Book Entry Message set to one value */
inline fill_book_entry_message(book_entry_message_record, book_entry_message_value) {
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 2 -> book_entry_message_record.security_id[book_entry_message_at] = book_entry_message_value; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_record.side = book_entry_message_value;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> book_entry_message_record.quantity[book_entry_message_at] = book_entry_message_value; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 8 -> book_entry_message_record.price[book_entry_message_at] = book_entry_message_value; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> book_entry_message_record.order_ref[book_entry_message_at] = book_entry_message_value; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Book Entry Message set to where it lies, so a field read out of place says so */
inline ramp_book_entry_message(book_entry_message_record, book_entry_message_base) {
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 2 -> book_entry_message_record.security_id[book_entry_message_at] = (book_entry_message_base + 0 + book_entry_message_at + 1) % 256; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_record.side = (book_entry_message_base + 2 + 1) % 256;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> book_entry_message_record.quantity[book_entry_message_at] = (book_entry_message_base + 3 + book_entry_message_at + 1) % 256; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 8 -> book_entry_message_record.price[book_entry_message_at] = (book_entry_message_base + 7 + book_entry_message_at + 1) % 256; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> book_entry_message_record.order_ref[book_entry_message_at] = (book_entry_message_base + 15 + book_entry_message_at + 1) % 256; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Book Entry Message to the wire, 19 bytes from where the cursor stands */
inline encode_book_entry_message(book_entry_message_record) {
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 2 -> wire[at] = book_entry_message_record.security_id[book_entry_message_at]; at = at + 1; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  wire[at] = book_entry_message_record.side; at = at + 1;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> wire[at] = book_entry_message_record.quantity[book_entry_message_at]; at = at + 1; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 8 -> wire[at] = book_entry_message_record.price[book_entry_message_at]; at = at + 1; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> wire[at] = book_entry_message_record.order_ref[book_entry_message_at]; at = at + 1; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Book Entry Message off the wire, 19 bytes from where the cursor stands */
inline decode_book_entry_message(book_entry_message_record) {
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 2 -> book_entry_message_record.security_id[book_entry_message_at] = wire[at]; at = at + 1; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_record.side = wire[at]; at = at + 1;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> book_entry_message_record.quantity[book_entry_message_at] = wire[at]; at = at + 1; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 8 -> book_entry_message_record.price[book_entry_message_at] = wire[at]; at = at + 1; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> book_entry_message_record.order_ref[book_entry_message_at] = wire[at]; at = at + 1; book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Book Entry Message is what was written, byte for byte */
inline equal_book_entry_message(book_entry_message_read, book_entry_message_written) {
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 2 -> assert(book_entry_message_read.security_id[book_entry_message_at] == book_entry_message_written.security_id[book_entry_message_at]); book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  assert(book_entry_message_read.side == book_entry_message_written.side);
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> assert(book_entry_message_read.quantity[book_entry_message_at] == book_entry_message_written.quantity[book_entry_message_at]); book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 8 -> assert(book_entry_message_read.price[book_entry_message_at] == book_entry_message_written.price[book_entry_message_at]); book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  book_entry_message_at = 0;
  do
  :: book_entry_message_at < 4 -> assert(book_entry_message_read.order_ref[book_entry_message_at] == book_entry_message_written.order_ref[book_entry_message_at]); book_entry_message_at = book_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mac Book Entry Message: 19 bytes ---------------------------------------- */

/* During the MaC phase, Aquis will publish the volume of the 5 best bid and offer orders per security in chronological order using the MaC Book Entry Message. */
typedef MacBookEntryMessage {
  byte security_id[2];
  byte side;
  byte quantity[4];
  byte price[8];
  byte order_ref[4]
};

int mac_book_entry_message_at;

/* every byte of Mac Book Entry Message set to one value */
inline fill_mac_book_entry_message(mac_book_entry_message_record, mac_book_entry_message_value) {
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 2 -> mac_book_entry_message_record.security_id[mac_book_entry_message_at] = mac_book_entry_message_value; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_record.side = mac_book_entry_message_value;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> mac_book_entry_message_record.quantity[mac_book_entry_message_at] = mac_book_entry_message_value; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 8 -> mac_book_entry_message_record.price[mac_book_entry_message_at] = mac_book_entry_message_value; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> mac_book_entry_message_record.order_ref[mac_book_entry_message_at] = mac_book_entry_message_value; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mac Book Entry Message set to where it lies, so a field read out of place says so */
inline ramp_mac_book_entry_message(mac_book_entry_message_record, mac_book_entry_message_base) {
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 2 -> mac_book_entry_message_record.security_id[mac_book_entry_message_at] = (mac_book_entry_message_base + 0 + mac_book_entry_message_at + 1) % 256; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_record.side = (mac_book_entry_message_base + 2 + 1) % 256;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> mac_book_entry_message_record.quantity[mac_book_entry_message_at] = (mac_book_entry_message_base + 3 + mac_book_entry_message_at + 1) % 256; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 8 -> mac_book_entry_message_record.price[mac_book_entry_message_at] = (mac_book_entry_message_base + 7 + mac_book_entry_message_at + 1) % 256; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> mac_book_entry_message_record.order_ref[mac_book_entry_message_at] = (mac_book_entry_message_base + 15 + mac_book_entry_message_at + 1) % 256; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mac Book Entry Message to the wire, 19 bytes from where the cursor stands */
inline encode_mac_book_entry_message(mac_book_entry_message_record) {
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 2 -> wire[at] = mac_book_entry_message_record.security_id[mac_book_entry_message_at]; at = at + 1; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  wire[at] = mac_book_entry_message_record.side; at = at + 1;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> wire[at] = mac_book_entry_message_record.quantity[mac_book_entry_message_at]; at = at + 1; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 8 -> wire[at] = mac_book_entry_message_record.price[mac_book_entry_message_at]; at = at + 1; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> wire[at] = mac_book_entry_message_record.order_ref[mac_book_entry_message_at]; at = at + 1; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mac Book Entry Message off the wire, 19 bytes from where the cursor stands */
inline decode_mac_book_entry_message(mac_book_entry_message_record) {
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 2 -> mac_book_entry_message_record.security_id[mac_book_entry_message_at] = wire[at]; at = at + 1; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_record.side = wire[at]; at = at + 1;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> mac_book_entry_message_record.quantity[mac_book_entry_message_at] = wire[at]; at = at + 1; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 8 -> mac_book_entry_message_record.price[mac_book_entry_message_at] = wire[at]; at = at + 1; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> mac_book_entry_message_record.order_ref[mac_book_entry_message_at] = wire[at]; at = at + 1; mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mac Book Entry Message is what was written, byte for byte */
inline equal_mac_book_entry_message(mac_book_entry_message_read, mac_book_entry_message_written) {
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 2 -> assert(mac_book_entry_message_read.security_id[mac_book_entry_message_at] == mac_book_entry_message_written.security_id[mac_book_entry_message_at]); mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  assert(mac_book_entry_message_read.side == mac_book_entry_message_written.side);
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> assert(mac_book_entry_message_read.quantity[mac_book_entry_message_at] == mac_book_entry_message_written.quantity[mac_book_entry_message_at]); mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 8 -> assert(mac_book_entry_message_read.price[mac_book_entry_message_at] == mac_book_entry_message_written.price[mac_book_entry_message_at]); mac_book_entry_message_at = mac_book_entry_message_at + 1
  :: else -> break
  od;
  mac_book_entry_message_at = 0;
  do
  :: mac_book_entry_message_at < 4 -> assert(mac_book_entry_message_read.order_ref[mac_book_entry_message_at] == mac_book_entry_message_written.order_ref[mac_book_entry_message_at]); mac_book_entry_message_at = mac_book_entry_message_at + 1
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

/* Snapshot Start Message: encoded, read back, and compared */
proctype check_snapshot_start_message() {
  SnapshotStartMessage snapshot_start_message_sent;
  SnapshotStartMessage snapshot_start_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_start_message(snapshot_start_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_start_message(snapshot_start_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_start_message(snapshot_start_message_sent, 255)
  :: else -> ramp_snapshot_start_message(snapshot_start_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_start_message(snapshot_start_message_sent);
    assert(at == 14);
    at = 0;
    decode_snapshot_start_message(snapshot_start_message_got);
    assert(at == 14);
    equal_snapshot_start_message(snapshot_start_message_got, snapshot_start_message_sent)
  }
}

/* Book Entry Message: encoded, read back, and compared */
proctype check_book_entry_message() {
  BookEntryMessage book_entry_message_sent;
  BookEntryMessage book_entry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_book_entry_message(book_entry_message_sent, 0)
  :: pattern == 1 -> fill_book_entry_message(book_entry_message_sent, 32)
  :: pattern == 2 -> fill_book_entry_message(book_entry_message_sent, 255)
  :: else -> ramp_book_entry_message(book_entry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_book_entry_message(book_entry_message_sent);
    assert(at == 19);
    at = 0;
    decode_book_entry_message(book_entry_message_got);
    assert(at == 19);
    equal_book_entry_message(book_entry_message_got, book_entry_message_sent)
  }
}

/* Mac Book Entry Message: encoded, read back, and compared */
proctype check_mac_book_entry_message() {
  MacBookEntryMessage mac_book_entry_message_sent;
  MacBookEntryMessage mac_book_entry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mac_book_entry_message(mac_book_entry_message_sent, 0)
  :: pattern == 1 -> fill_mac_book_entry_message(mac_book_entry_message_sent, 32)
  :: pattern == 2 -> fill_mac_book_entry_message(mac_book_entry_message_sent, 255)
  :: else -> ramp_mac_book_entry_message(mac_book_entry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mac_book_entry_message(mac_book_entry_message_sent);
    assert(at == 19);
    at = 0;
    decode_mac_book_entry_message(mac_book_entry_message_got);
    assert(at == 19);
    equal_mac_book_entry_message(mac_book_entry_message_got, mac_book_entry_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_snapshot_start_message()
  :: run check_book_entry_message()
  :: run check_mac_book_entry_message()
  fi
}
