/*
 * National Stock Exchange of India Ltd Order Entry
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
 *   - a run filling what frames it
 *   - a Integrity rule
 *   - a Composite rule
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 74

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 6 bytes -------------------------------------------------- */

/* Packet Length and Sequence number, the first six bytes of the direct interface's twenty two byte packet header; its last sixteen open each packet body branch */
typedef PacketHeader {
  byte packet_length[2];
  byte packet_sequence_number[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = (packet_header_base + 2 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 6 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.packet_sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 6 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_length[packet_header_at] == packet_header_written.packet_length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.packet_sequence_number[packet_header_at] == packet_header_written.packet_sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 40 bytes ------------------------------------------------ */

/* MESSAGE_HEADER */
typedef MessageHeader {
  byte transaction_code[2];
  byte log_time[4];
  byte alpha_char[2];
  byte trader_id[4];
  byte error_code[2];
  byte header_timestamp[8];
  byte time_stamp_1[8];
  byte time_stamp_2[8];
  byte message_length[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = (message_header_base + 12 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = (message_header_base + 14 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = (message_header_base + 22 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = (message_header_base + 30 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 38 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 40 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.transaction_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.log_time[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.alpha_char[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.trader_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.error_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.header_timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.time_stamp_1[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.time_stamp_2[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 40 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.transaction_code[message_header_at] == message_header_written.transaction_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.log_time[message_header_at] == message_header_written.log_time[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.alpha_char[message_header_at] == message_header_written.alpha_char[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.trader_id[message_header_at] == message_header_written.trader_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.error_code[message_header_at] == message_header_written.error_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.header_timestamp[message_header_at] == message_header_written.header_timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.time_stamp_1[message_header_at] == message_header_written.time_stamp_1[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.time_stamp_2[message_header_at] == message_header_written.time_stamp_2[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Local Database Request Message: 18 bytes ------------------------- */

/* Sent as UPDATE_LOCALDB_IN to request the local database download */
typedef UpdateLocalDatabaseRequestMessage {
  byte last_update_security_time[4];
  byte last_update_participant_time[4];
  byte request_for_open_orders;
  byte reserved_1;
  byte normal_market_status[2];
  byte odd_lot_market_status[2];
  byte spot_market_status[2];
  byte auction_market_status[2]
};

int update_local_database_request_message_at;

/* every byte of Update Local Database Request Message set to one value */
inline fill_update_local_database_request_message(update_local_database_request_message_record, update_local_database_request_message_value) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_security_time[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_participant_time[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_record.request_for_open_orders = update_local_database_request_message_value;
  update_local_database_request_message_record.reserved_1 = update_local_database_request_message_value;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.normal_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.odd_lot_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.spot_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.auction_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Update Local Database Request Message set to where it lies, so a field read out of place says so */
inline ramp_update_local_database_request_message(update_local_database_request_message_record, update_local_database_request_message_base) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_security_time[update_local_database_request_message_at] = (update_local_database_request_message_base + 0 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_participant_time[update_local_database_request_message_at] = (update_local_database_request_message_base + 4 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_record.request_for_open_orders = (update_local_database_request_message_base + 8 + 1) % 256;
  update_local_database_request_message_record.reserved_1 = (update_local_database_request_message_base + 9 + 1) % 256;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.normal_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 10 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.odd_lot_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 12 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.spot_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 14 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.auction_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 16 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Request Message to the wire, 18 bytes from where the cursor stands */
inline encode_update_local_database_request_message(update_local_database_request_message_record) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> wire[at] = update_local_database_request_message_record.last_update_security_time[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> wire[at] = update_local_database_request_message_record.last_update_participant_time[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  wire[at] = update_local_database_request_message_record.request_for_open_orders; at = at + 1;
  wire[at] = update_local_database_request_message_record.reserved_1; at = at + 1;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.normal_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.odd_lot_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.spot_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.auction_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Request Message off the wire, 18 bytes from where the cursor stands */
inline decode_update_local_database_request_message(update_local_database_request_message_record) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_security_time[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_participant_time[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_record.request_for_open_orders = wire[at]; at = at + 1;
  update_local_database_request_message_record.reserved_1 = wire[at]; at = at + 1;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.normal_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.odd_lot_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.spot_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.auction_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Update Local Database Request Message is what was written, byte for byte */
inline equal_update_local_database_request_message(update_local_database_request_message_read, update_local_database_request_message_written) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> assert(update_local_database_request_message_read.last_update_security_time[update_local_database_request_message_at] == update_local_database_request_message_written.last_update_security_time[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> assert(update_local_database_request_message_read.last_update_participant_time[update_local_database_request_message_at] == update_local_database_request_message_written.last_update_participant_time[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  assert(update_local_database_request_message_read.request_for_open_orders == update_local_database_request_message_written.request_for_open_orders);
  assert(update_local_database_request_message_read.reserved_1 == update_local_database_request_message_written.reserved_1);
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.normal_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.normal_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.odd_lot_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.odd_lot_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.spot_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.spot_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.auction_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.auction_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sec Info: 12 bytes ------------------------------------------------------ */

/* SEC_INFO */
typedef SecInfo {
  byte symbol[10];
  byte series[2]
};

int sec_info_at;

/* every byte of Sec Info set to one value */
inline fill_sec_info(sec_info_record, sec_info_value) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sec Info set to where it lies, so a field read out of place says so */
inline ramp_sec_info(sec_info_record, sec_info_base) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = (sec_info_base + 0 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = (sec_info_base + 10 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info to the wire, 12 bytes from where the cursor stands */
inline encode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> wire[at] = sec_info_record.symbol[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> wire[at] = sec_info_record.series[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info off the wire, 12 bytes from where the cursor stands */
inline decode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sec Info is what was written, byte for byte */
inline equal_sec_info(sec_info_read, sec_info_written) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> assert(sec_info_read.symbol[sec_info_at] == sec_info_written.symbol[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> assert(sec_info_read.series[sec_info_at] == sec_info_written.series[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancellation Request Message: 74 bytes ---------------------------- */

/* Sent as TRADE_CANCEL_IN to request cancellation of a trade */
typedef TradeCancellationRequestMessage {
  SecInfo sec_info;
  byte reverse_leg_settl_date[4];
  byte l_fill_number[4];
  byte l_fill_qty[4];
  byte l_fill_price[4];
  byte i_mkt_type[2];
  byte l_new_volume[4];
  byte buy_participant_id[12];
  byte sell_participant_id[12];
  byte buy_broker_id[5];
  byte sell_broker_id[5];
  byte trader_id[4];
  byte requested_by[2]
};

int trade_cancellation_request_message_at;

/* every byte of Trade Cancellation Request Message set to one value */
inline fill_trade_cancellation_request_message(trade_cancellation_request_message_record, trade_cancellation_request_message_value) {
  fill_sec_info(trade_cancellation_request_message_record.sec_info, trade_cancellation_request_message_value);
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.reverse_leg_settl_date[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_fill_number[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_fill_qty[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_fill_price[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> trade_cancellation_request_message_record.i_mkt_type[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_new_volume[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> trade_cancellation_request_message_record.buy_participant_id[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> trade_cancellation_request_message_record.sell_participant_id[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> trade_cancellation_request_message_record.buy_broker_id[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> trade_cancellation_request_message_record.sell_broker_id[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.trader_id[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> trade_cancellation_request_message_record.requested_by[trade_cancellation_request_message_at] = trade_cancellation_request_message_value; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancellation Request Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancellation_request_message(trade_cancellation_request_message_record, trade_cancellation_request_message_base) {
  ramp_sec_info(trade_cancellation_request_message_record.sec_info, trade_cancellation_request_message_base + 0);
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.reverse_leg_settl_date[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 12 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_fill_number[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 16 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_fill_qty[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 20 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_fill_price[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 24 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> trade_cancellation_request_message_record.i_mkt_type[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 28 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_new_volume[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 30 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> trade_cancellation_request_message_record.buy_participant_id[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 34 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> trade_cancellation_request_message_record.sell_participant_id[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 46 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> trade_cancellation_request_message_record.buy_broker_id[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 58 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> trade_cancellation_request_message_record.sell_broker_id[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 63 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.trader_id[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 68 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> trade_cancellation_request_message_record.requested_by[trade_cancellation_request_message_at] = (trade_cancellation_request_message_base + 72 + trade_cancellation_request_message_at + 1) % 256; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Request Message to the wire, 74 bytes from where the cursor stands */
inline encode_trade_cancellation_request_message(trade_cancellation_request_message_record) {
  encode_sec_info(trade_cancellation_request_message_record.sec_info);
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> wire[at] = trade_cancellation_request_message_record.reverse_leg_settl_date[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> wire[at] = trade_cancellation_request_message_record.l_fill_number[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> wire[at] = trade_cancellation_request_message_record.l_fill_qty[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> wire[at] = trade_cancellation_request_message_record.l_fill_price[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> wire[at] = trade_cancellation_request_message_record.i_mkt_type[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> wire[at] = trade_cancellation_request_message_record.l_new_volume[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> wire[at] = trade_cancellation_request_message_record.buy_participant_id[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> wire[at] = trade_cancellation_request_message_record.sell_participant_id[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> wire[at] = trade_cancellation_request_message_record.buy_broker_id[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> wire[at] = trade_cancellation_request_message_record.sell_broker_id[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> wire[at] = trade_cancellation_request_message_record.trader_id[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> wire[at] = trade_cancellation_request_message_record.requested_by[trade_cancellation_request_message_at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Request Message off the wire, 74 bytes from where the cursor stands */
inline decode_trade_cancellation_request_message(trade_cancellation_request_message_record) {
  decode_sec_info(trade_cancellation_request_message_record.sec_info);
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.reverse_leg_settl_date[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_fill_number[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_fill_qty[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_fill_price[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> trade_cancellation_request_message_record.i_mkt_type[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.l_new_volume[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> trade_cancellation_request_message_record.buy_participant_id[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> trade_cancellation_request_message_record.sell_participant_id[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> trade_cancellation_request_message_record.buy_broker_id[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> trade_cancellation_request_message_record.sell_broker_id[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> trade_cancellation_request_message_record.trader_id[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> trade_cancellation_request_message_record.requested_by[trade_cancellation_request_message_at] = wire[at]; at = at + 1; trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancellation Request Message is what was written, byte for byte */
inline equal_trade_cancellation_request_message(trade_cancellation_request_message_read, trade_cancellation_request_message_written) {
  equal_sec_info(trade_cancellation_request_message_read.sec_info, trade_cancellation_request_message_written.sec_info);
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> assert(trade_cancellation_request_message_read.reverse_leg_settl_date[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.reverse_leg_settl_date[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> assert(trade_cancellation_request_message_read.l_fill_number[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.l_fill_number[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> assert(trade_cancellation_request_message_read.l_fill_qty[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.l_fill_qty[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> assert(trade_cancellation_request_message_read.l_fill_price[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.l_fill_price[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> assert(trade_cancellation_request_message_read.i_mkt_type[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.i_mkt_type[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> assert(trade_cancellation_request_message_read.l_new_volume[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.l_new_volume[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> assert(trade_cancellation_request_message_read.buy_participant_id[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.buy_participant_id[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 12 -> assert(trade_cancellation_request_message_read.sell_participant_id[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.sell_participant_id[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> assert(trade_cancellation_request_message_read.buy_broker_id[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.buy_broker_id[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 5 -> assert(trade_cancellation_request_message_read.sell_broker_id[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.sell_broker_id[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 4 -> assert(trade_cancellation_request_message_read.trader_id[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.trader_id[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  trade_cancellation_request_message_at = 0;
  do
  :: trade_cancellation_request_message_at < 2 -> assert(trade_cancellation_request_message_read.requested_by[trade_cancellation_request_message_at] == trade_cancellation_request_message_written.requested_by[trade_cancellation_request_message_at]); trade_cancellation_request_message_at = trade_cancellation_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Modification Request Message: 74 bytes ---------------------------- */

/* Sent as TRADE_MOD_IN; trade modification is currently not allowed */
typedef TradeModificationRequestMessage {
  SecInfo sec_info;
  byte reverse_leg_settl_date[4];
  byte l_fill_number[4];
  byte l_fill_qty[4];
  byte l_fill_price[4];
  byte i_mkt_type[2];
  byte l_new_volume[4];
  byte buy_participant_id[12];
  byte sell_participant_id[12];
  byte buy_broker_id[5];
  byte sell_broker_id[5];
  byte trader_id[4];
  byte requested_by[2]
};

int trade_modification_request_message_at;

/* every byte of Trade Modification Request Message set to one value */
inline fill_trade_modification_request_message(trade_modification_request_message_record, trade_modification_request_message_value) {
  fill_sec_info(trade_modification_request_message_record.sec_info, trade_modification_request_message_value);
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.reverse_leg_settl_date[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_fill_number[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_fill_qty[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_fill_price[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> trade_modification_request_message_record.i_mkt_type[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_new_volume[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> trade_modification_request_message_record.buy_participant_id[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> trade_modification_request_message_record.sell_participant_id[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> trade_modification_request_message_record.buy_broker_id[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> trade_modification_request_message_record.sell_broker_id[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.trader_id[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> trade_modification_request_message_record.requested_by[trade_modification_request_message_at] = trade_modification_request_message_value; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Modification Request Message set to where it lies, so a field read out of place says so */
inline ramp_trade_modification_request_message(trade_modification_request_message_record, trade_modification_request_message_base) {
  ramp_sec_info(trade_modification_request_message_record.sec_info, trade_modification_request_message_base + 0);
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.reverse_leg_settl_date[trade_modification_request_message_at] = (trade_modification_request_message_base + 12 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_fill_number[trade_modification_request_message_at] = (trade_modification_request_message_base + 16 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_fill_qty[trade_modification_request_message_at] = (trade_modification_request_message_base + 20 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_fill_price[trade_modification_request_message_at] = (trade_modification_request_message_base + 24 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> trade_modification_request_message_record.i_mkt_type[trade_modification_request_message_at] = (trade_modification_request_message_base + 28 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_new_volume[trade_modification_request_message_at] = (trade_modification_request_message_base + 30 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> trade_modification_request_message_record.buy_participant_id[trade_modification_request_message_at] = (trade_modification_request_message_base + 34 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> trade_modification_request_message_record.sell_participant_id[trade_modification_request_message_at] = (trade_modification_request_message_base + 46 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> trade_modification_request_message_record.buy_broker_id[trade_modification_request_message_at] = (trade_modification_request_message_base + 58 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> trade_modification_request_message_record.sell_broker_id[trade_modification_request_message_at] = (trade_modification_request_message_base + 63 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.trader_id[trade_modification_request_message_at] = (trade_modification_request_message_base + 68 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> trade_modification_request_message_record.requested_by[trade_modification_request_message_at] = (trade_modification_request_message_base + 72 + trade_modification_request_message_at + 1) % 256; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Modification Request Message to the wire, 74 bytes from where the cursor stands */
inline encode_trade_modification_request_message(trade_modification_request_message_record) {
  encode_sec_info(trade_modification_request_message_record.sec_info);
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> wire[at] = trade_modification_request_message_record.reverse_leg_settl_date[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> wire[at] = trade_modification_request_message_record.l_fill_number[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> wire[at] = trade_modification_request_message_record.l_fill_qty[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> wire[at] = trade_modification_request_message_record.l_fill_price[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> wire[at] = trade_modification_request_message_record.i_mkt_type[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> wire[at] = trade_modification_request_message_record.l_new_volume[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> wire[at] = trade_modification_request_message_record.buy_participant_id[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> wire[at] = trade_modification_request_message_record.sell_participant_id[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> wire[at] = trade_modification_request_message_record.buy_broker_id[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> wire[at] = trade_modification_request_message_record.sell_broker_id[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> wire[at] = trade_modification_request_message_record.trader_id[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> wire[at] = trade_modification_request_message_record.requested_by[trade_modification_request_message_at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Modification Request Message off the wire, 74 bytes from where the cursor stands */
inline decode_trade_modification_request_message(trade_modification_request_message_record) {
  decode_sec_info(trade_modification_request_message_record.sec_info);
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.reverse_leg_settl_date[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_fill_number[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_fill_qty[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_fill_price[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> trade_modification_request_message_record.i_mkt_type[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.l_new_volume[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> trade_modification_request_message_record.buy_participant_id[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> trade_modification_request_message_record.sell_participant_id[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> trade_modification_request_message_record.buy_broker_id[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> trade_modification_request_message_record.sell_broker_id[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> trade_modification_request_message_record.trader_id[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> trade_modification_request_message_record.requested_by[trade_modification_request_message_at] = wire[at]; at = at + 1; trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Modification Request Message is what was written, byte for byte */
inline equal_trade_modification_request_message(trade_modification_request_message_read, trade_modification_request_message_written) {
  equal_sec_info(trade_modification_request_message_read.sec_info, trade_modification_request_message_written.sec_info);
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> assert(trade_modification_request_message_read.reverse_leg_settl_date[trade_modification_request_message_at] == trade_modification_request_message_written.reverse_leg_settl_date[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> assert(trade_modification_request_message_read.l_fill_number[trade_modification_request_message_at] == trade_modification_request_message_written.l_fill_number[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> assert(trade_modification_request_message_read.l_fill_qty[trade_modification_request_message_at] == trade_modification_request_message_written.l_fill_qty[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> assert(trade_modification_request_message_read.l_fill_price[trade_modification_request_message_at] == trade_modification_request_message_written.l_fill_price[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> assert(trade_modification_request_message_read.i_mkt_type[trade_modification_request_message_at] == trade_modification_request_message_written.i_mkt_type[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> assert(trade_modification_request_message_read.l_new_volume[trade_modification_request_message_at] == trade_modification_request_message_written.l_new_volume[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> assert(trade_modification_request_message_read.buy_participant_id[trade_modification_request_message_at] == trade_modification_request_message_written.buy_participant_id[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 12 -> assert(trade_modification_request_message_read.sell_participant_id[trade_modification_request_message_at] == trade_modification_request_message_written.sell_participant_id[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> assert(trade_modification_request_message_read.buy_broker_id[trade_modification_request_message_at] == trade_modification_request_message_written.buy_broker_id[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 5 -> assert(trade_modification_request_message_read.sell_broker_id[trade_modification_request_message_at] == trade_modification_request_message_written.sell_broker_id[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 4 -> assert(trade_modification_request_message_read.trader_id[trade_modification_request_message_at] == trade_modification_request_message_written.trader_id[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  trade_modification_request_message_at = 0;
  do
  :: trade_modification_request_message_at < 2 -> assert(trade_modification_request_message_read.requested_by[trade_modification_request_message_at] == trade_modification_request_message_written.requested_by[trade_modification_request_message_at]); trade_modification_request_message_at = trade_modification_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gateway Router Request Message: 8 bytes --------------------------------- */

/* Sent as GR_REQUEST to the gateway router over a TLS connection */
typedef GatewayRouterRequestMessage {
  byte box_id[2];
  byte broker_id[5];
  byte filler
};

int gateway_router_request_message_at;

/* every byte of Gateway Router Request Message set to one value */
inline fill_gateway_router_request_message(gateway_router_request_message_record, gateway_router_request_message_value) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> gateway_router_request_message_record.box_id[gateway_router_request_message_at] = gateway_router_request_message_value; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> gateway_router_request_message_record.broker_id[gateway_router_request_message_at] = gateway_router_request_message_value; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_record.filler = gateway_router_request_message_value;
  skip
}

/* each byte of Gateway Router Request Message set to where it lies, so a field read out of place says so */
inline ramp_gateway_router_request_message(gateway_router_request_message_record, gateway_router_request_message_base) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> gateway_router_request_message_record.box_id[gateway_router_request_message_at] = (gateway_router_request_message_base + 0 + gateway_router_request_message_at + 1) % 256; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> gateway_router_request_message_record.broker_id[gateway_router_request_message_at] = (gateway_router_request_message_base + 2 + gateway_router_request_message_at + 1) % 256; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_record.filler = (gateway_router_request_message_base + 7 + 1) % 256;
  skip
}

/* Gateway Router Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_gateway_router_request_message(gateway_router_request_message_record) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> wire[at] = gateway_router_request_message_record.box_id[gateway_router_request_message_at]; at = at + 1; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> wire[at] = gateway_router_request_message_record.broker_id[gateway_router_request_message_at]; at = at + 1; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  wire[at] = gateway_router_request_message_record.filler; at = at + 1;
  skip
}

/* Gateway Router Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_gateway_router_request_message(gateway_router_request_message_record) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> gateway_router_request_message_record.box_id[gateway_router_request_message_at] = wire[at]; at = at + 1; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> gateway_router_request_message_record.broker_id[gateway_router_request_message_at] = wire[at]; at = at + 1; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_record.filler = wire[at]; at = at + 1;
  skip
}

/* what was read of Gateway Router Request Message is what was written, byte for byte */
inline equal_gateway_router_request_message(gateway_router_request_message_read, gateway_router_request_message_written) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> assert(gateway_router_request_message_read.box_id[gateway_router_request_message_at] == gateway_router_request_message_written.box_id[gateway_router_request_message_at]); gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> assert(gateway_router_request_message_read.broker_id[gateway_router_request_message_at] == gateway_router_request_message_written.broker_id[gateway_router_request_message_at]); gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  assert(gateway_router_request_message_read.filler == gateway_router_request_message_written.filler);
  skip
}

/* ---- Secure Box Registration Request Message: 2 bytes ------------------------ */

/* Sent as SECURE_BOX_REGISTRATION_REQUEST_IN on the new connection to the allocated gateway server */
typedef SecureBoxRegistrationRequestMessage {
  byte box_id[2]
};

int secure_box_registration_request_message_at;

/* every byte of Secure Box Registration Request Message set to one value */
inline fill_secure_box_registration_request_message(secure_box_registration_request_message_record, secure_box_registration_request_message_value) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> secure_box_registration_request_message_record.box_id[secure_box_registration_request_message_at] = secure_box_registration_request_message_value; secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Secure Box Registration Request Message set to where it lies, so a field read out of place says so */
inline ramp_secure_box_registration_request_message(secure_box_registration_request_message_record, secure_box_registration_request_message_base) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> secure_box_registration_request_message_record.box_id[secure_box_registration_request_message_at] = (secure_box_registration_request_message_base + 0 + secure_box_registration_request_message_at + 1) % 256; secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Secure Box Registration Request Message to the wire, 2 bytes from where the cursor stands */
inline encode_secure_box_registration_request_message(secure_box_registration_request_message_record) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> wire[at] = secure_box_registration_request_message_record.box_id[secure_box_registration_request_message_at]; at = at + 1; secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Secure Box Registration Request Message off the wire, 2 bytes from where the cursor stands */
inline decode_secure_box_registration_request_message(secure_box_registration_request_message_record) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> secure_box_registration_request_message_record.box_id[secure_box_registration_request_message_at] = wire[at]; at = at + 1; secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Secure Box Registration Request Message is what was written, byte for byte */
inline equal_secure_box_registration_request_message(secure_box_registration_request_message_read, secure_box_registration_request_message_written) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> assert(secure_box_registration_request_message_read.box_id[secure_box_registration_request_message_at] == secure_box_registration_request_message_written.box_id[secure_box_registration_request_message_at]); secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Box Sign On Request Message: 20 bytes ----------------------------------- */

/* Sent as BOX_SIGN_ON_REQUEST_IN, the first encrypted message on the box connection */
typedef BoxSignOnRequestMessage {
  byte box_id[2];
  byte broker_id[5];
  byte reserved_5[5];
  byte session_key[8]
};

int box_sign_on_request_message_at;

/* every byte of Box Sign On Request Message set to one value */
inline fill_box_sign_on_request_message(box_sign_on_request_message_record, box_sign_on_request_message_value) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> box_sign_on_request_message_record.box_id[box_sign_on_request_message_at] = box_sign_on_request_message_value; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.broker_id[box_sign_on_request_message_at] = box_sign_on_request_message_value; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.reserved_5[box_sign_on_request_message_at] = box_sign_on_request_message_value; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> box_sign_on_request_message_record.session_key[box_sign_on_request_message_at] = box_sign_on_request_message_value; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign On Request Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_on_request_message(box_sign_on_request_message_record, box_sign_on_request_message_base) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> box_sign_on_request_message_record.box_id[box_sign_on_request_message_at] = (box_sign_on_request_message_base + 0 + box_sign_on_request_message_at + 1) % 256; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.broker_id[box_sign_on_request_message_at] = (box_sign_on_request_message_base + 2 + box_sign_on_request_message_at + 1) % 256; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.reserved_5[box_sign_on_request_message_at] = (box_sign_on_request_message_base + 7 + box_sign_on_request_message_at + 1) % 256; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> box_sign_on_request_message_record.session_key[box_sign_on_request_message_at] = (box_sign_on_request_message_base + 12 + box_sign_on_request_message_at + 1) % 256; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_box_sign_on_request_message(box_sign_on_request_message_record) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> wire[at] = box_sign_on_request_message_record.box_id[box_sign_on_request_message_at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> wire[at] = box_sign_on_request_message_record.broker_id[box_sign_on_request_message_at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> wire[at] = box_sign_on_request_message_record.reserved_5[box_sign_on_request_message_at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> wire[at] = box_sign_on_request_message_record.session_key[box_sign_on_request_message_at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_box_sign_on_request_message(box_sign_on_request_message_record) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> box_sign_on_request_message_record.box_id[box_sign_on_request_message_at] = wire[at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.broker_id[box_sign_on_request_message_at] = wire[at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.reserved_5[box_sign_on_request_message_at] = wire[at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> box_sign_on_request_message_record.session_key[box_sign_on_request_message_at] = wire[at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign On Request Message is what was written, byte for byte */
inline equal_box_sign_on_request_message(box_sign_on_request_message_read, box_sign_on_request_message_written) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> assert(box_sign_on_request_message_read.box_id[box_sign_on_request_message_at] == box_sign_on_request_message_written.box_id[box_sign_on_request_message_at]); box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> assert(box_sign_on_request_message_read.broker_id[box_sign_on_request_message_at] == box_sign_on_request_message_written.broker_id[box_sign_on_request_message_at]); box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> assert(box_sign_on_request_message_read.reserved_5[box_sign_on_request_message_at] == box_sign_on_request_message_written.reserved_5[box_sign_on_request_message_at]); box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> assert(box_sign_on_request_message_read.session_key[box_sign_on_request_message_at] == box_sign_on_request_message_written.session_key[box_sign_on_request_message_at]); box_sign_on_request_message_at = box_sign_on_request_message_at + 1
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
    assert(at == 6);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 6);
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
    assert(at == 40);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 40);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Update Local Database Request Message: encoded, read back, and compared */
proctype check_update_local_database_request_message() {
  UpdateLocalDatabaseRequestMessage update_local_database_request_message_sent;
  UpdateLocalDatabaseRequestMessage update_local_database_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_local_database_request_message(update_local_database_request_message_sent, 0)
  :: pattern == 1 -> fill_update_local_database_request_message(update_local_database_request_message_sent, 32)
  :: pattern == 2 -> fill_update_local_database_request_message(update_local_database_request_message_sent, 255)
  :: else -> ramp_update_local_database_request_message(update_local_database_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_local_database_request_message(update_local_database_request_message_sent);
    assert(at == 18);
    at = 0;
    decode_update_local_database_request_message(update_local_database_request_message_got);
    assert(at == 18);
    equal_update_local_database_request_message(update_local_database_request_message_got, update_local_database_request_message_sent)
  }
}

/* Sec Info: encoded, read back, and compared */
proctype check_sec_info() {
  SecInfo sec_info_sent;
  SecInfo sec_info_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sec_info(sec_info_sent, 0)
  :: pattern == 1 -> fill_sec_info(sec_info_sent, 32)
  :: pattern == 2 -> fill_sec_info(sec_info_sent, 255)
  :: else -> ramp_sec_info(sec_info_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sec_info(sec_info_sent);
    assert(at == 12);
    at = 0;
    decode_sec_info(sec_info_got);
    assert(at == 12);
    equal_sec_info(sec_info_got, sec_info_sent)
  }
}

/* Trade Cancellation Request Message: encoded, read back, and compared */
proctype check_trade_cancellation_request_message() {
  TradeCancellationRequestMessage trade_cancellation_request_message_sent;
  TradeCancellationRequestMessage trade_cancellation_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancellation_request_message(trade_cancellation_request_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancellation_request_message(trade_cancellation_request_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancellation_request_message(trade_cancellation_request_message_sent, 255)
  :: else -> ramp_trade_cancellation_request_message(trade_cancellation_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancellation_request_message(trade_cancellation_request_message_sent);
    assert(at == 74);
    at = 0;
    decode_trade_cancellation_request_message(trade_cancellation_request_message_got);
    assert(at == 74);
    equal_trade_cancellation_request_message(trade_cancellation_request_message_got, trade_cancellation_request_message_sent)
  }
}

/* Trade Modification Request Message: encoded, read back, and compared */
proctype check_trade_modification_request_message() {
  TradeModificationRequestMessage trade_modification_request_message_sent;
  TradeModificationRequestMessage trade_modification_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_modification_request_message(trade_modification_request_message_sent, 0)
  :: pattern == 1 -> fill_trade_modification_request_message(trade_modification_request_message_sent, 32)
  :: pattern == 2 -> fill_trade_modification_request_message(trade_modification_request_message_sent, 255)
  :: else -> ramp_trade_modification_request_message(trade_modification_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_modification_request_message(trade_modification_request_message_sent);
    assert(at == 74);
    at = 0;
    decode_trade_modification_request_message(trade_modification_request_message_got);
    assert(at == 74);
    equal_trade_modification_request_message(trade_modification_request_message_got, trade_modification_request_message_sent)
  }
}

/* Gateway Router Request Message: encoded, read back, and compared */
proctype check_gateway_router_request_message() {
  GatewayRouterRequestMessage gateway_router_request_message_sent;
  GatewayRouterRequestMessage gateway_router_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gateway_router_request_message(gateway_router_request_message_sent, 0)
  :: pattern == 1 -> fill_gateway_router_request_message(gateway_router_request_message_sent, 32)
  :: pattern == 2 -> fill_gateway_router_request_message(gateway_router_request_message_sent, 255)
  :: else -> ramp_gateway_router_request_message(gateway_router_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gateway_router_request_message(gateway_router_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_gateway_router_request_message(gateway_router_request_message_got);
    assert(at == 8);
    equal_gateway_router_request_message(gateway_router_request_message_got, gateway_router_request_message_sent)
  }
}

/* Secure Box Registration Request Message: encoded, read back, and compared */
proctype check_secure_box_registration_request_message() {
  SecureBoxRegistrationRequestMessage secure_box_registration_request_message_sent;
  SecureBoxRegistrationRequestMessage secure_box_registration_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_secure_box_registration_request_message(secure_box_registration_request_message_sent, 0)
  :: pattern == 1 -> fill_secure_box_registration_request_message(secure_box_registration_request_message_sent, 32)
  :: pattern == 2 -> fill_secure_box_registration_request_message(secure_box_registration_request_message_sent, 255)
  :: else -> ramp_secure_box_registration_request_message(secure_box_registration_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_secure_box_registration_request_message(secure_box_registration_request_message_sent);
    assert(at == 2);
    at = 0;
    decode_secure_box_registration_request_message(secure_box_registration_request_message_got);
    assert(at == 2);
    equal_secure_box_registration_request_message(secure_box_registration_request_message_got, secure_box_registration_request_message_sent)
  }
}

/* Box Sign On Request Message: encoded, read back, and compared */
proctype check_box_sign_on_request_message() {
  BoxSignOnRequestMessage box_sign_on_request_message_sent;
  BoxSignOnRequestMessage box_sign_on_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_on_request_message(box_sign_on_request_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_on_request_message(box_sign_on_request_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_on_request_message(box_sign_on_request_message_sent, 255)
  :: else -> ramp_box_sign_on_request_message(box_sign_on_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_on_request_message(box_sign_on_request_message_sent);
    assert(at == 20);
    at = 0;
    decode_box_sign_on_request_message(box_sign_on_request_message_got);
    assert(at == 20);
    equal_box_sign_on_request_message(box_sign_on_request_message_got, box_sign_on_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_update_local_database_request_message()
  :: run check_sec_info()
  :: run check_trade_cancellation_request_message()
  :: run check_trade_modification_request_message()
  :: run check_gateway_router_request_message()
  :: run check_secure_box_registration_request_message()
  :: run check_box_sign_on_request_message()
  fi
}
