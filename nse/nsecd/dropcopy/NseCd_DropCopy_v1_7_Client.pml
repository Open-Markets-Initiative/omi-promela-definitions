/*
 * National Stock Exchange of India Ltd Drop Copy
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
 *   - a Composite rule
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 238

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 22 bytes ------------------------------------------------- */

/* Direct interface twenty two byte packet header */
typedef PacketHeader {
  byte packet_length[2];
  byte packet_sequence_number[4];
  byte checksum[16]
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
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> packet_header_record.checksum[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
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
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> packet_header_record.checksum[packet_header_at] = (packet_header_base + 6 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 22 bytes from where the cursor stands */
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
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> wire[at] = packet_header_record.checksum[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 22 bytes from where the cursor stands */
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
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> packet_header_record.checksum[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
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
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> assert(packet_header_read.checksum[packet_header_at] == packet_header_written.checksum[packet_header_at]); packet_header_at = packet_header_at + 1
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

/* ---- Signon In Message: 238 bytes -------------------------------------------- */

/* Logs the user on to the drop copy feed */
typedef SignonInMessage {
  byte user_id[4];
  byte reserved_8[8];
  byte password[12];
  byte reserved_4[4];
  byte reserved_38[38];
  byte broker_id[5];
  byte reserved_119[119];
  byte reserved_16[16];
  byte second_reserved_16[16];
  byte third_reserved_16[16]
};

int signon_in_message_at;

/* every byte of Signon In Message set to one value */
inline fill_signon_in_message(signon_in_message_record, signon_in_message_value) {
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> signon_in_message_record.user_id[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 8 -> signon_in_message_record.reserved_8[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 12 -> signon_in_message_record.password[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> signon_in_message_record.reserved_4[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 38 -> signon_in_message_record.reserved_38[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 5 -> signon_in_message_record.broker_id[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 119 -> signon_in_message_record.reserved_119[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> signon_in_message_record.reserved_16[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> signon_in_message_record.second_reserved_16[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> signon_in_message_record.third_reserved_16[signon_in_message_at] = signon_in_message_value; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Signon In Message set to where it lies, so a field read out of place says so */
inline ramp_signon_in_message(signon_in_message_record, signon_in_message_base) {
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> signon_in_message_record.user_id[signon_in_message_at] = (signon_in_message_base + 0 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 8 -> signon_in_message_record.reserved_8[signon_in_message_at] = (signon_in_message_base + 4 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 12 -> signon_in_message_record.password[signon_in_message_at] = (signon_in_message_base + 12 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> signon_in_message_record.reserved_4[signon_in_message_at] = (signon_in_message_base + 24 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 38 -> signon_in_message_record.reserved_38[signon_in_message_at] = (signon_in_message_base + 28 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 5 -> signon_in_message_record.broker_id[signon_in_message_at] = (signon_in_message_base + 66 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 119 -> signon_in_message_record.reserved_119[signon_in_message_at] = (signon_in_message_base + 71 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> signon_in_message_record.reserved_16[signon_in_message_at] = (signon_in_message_base + 190 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> signon_in_message_record.second_reserved_16[signon_in_message_at] = (signon_in_message_base + 206 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> signon_in_message_record.third_reserved_16[signon_in_message_at] = (signon_in_message_base + 222 + signon_in_message_at + 1) % 256; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Signon In Message to the wire, 238 bytes from where the cursor stands */
inline encode_signon_in_message(signon_in_message_record) {
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> wire[at] = signon_in_message_record.user_id[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 8 -> wire[at] = signon_in_message_record.reserved_8[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 12 -> wire[at] = signon_in_message_record.password[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> wire[at] = signon_in_message_record.reserved_4[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 38 -> wire[at] = signon_in_message_record.reserved_38[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 5 -> wire[at] = signon_in_message_record.broker_id[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 119 -> wire[at] = signon_in_message_record.reserved_119[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> wire[at] = signon_in_message_record.reserved_16[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> wire[at] = signon_in_message_record.second_reserved_16[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> wire[at] = signon_in_message_record.third_reserved_16[signon_in_message_at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Signon In Message off the wire, 238 bytes from where the cursor stands */
inline decode_signon_in_message(signon_in_message_record) {
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> signon_in_message_record.user_id[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 8 -> signon_in_message_record.reserved_8[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 12 -> signon_in_message_record.password[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> signon_in_message_record.reserved_4[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 38 -> signon_in_message_record.reserved_38[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 5 -> signon_in_message_record.broker_id[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 119 -> signon_in_message_record.reserved_119[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> signon_in_message_record.reserved_16[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> signon_in_message_record.second_reserved_16[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> signon_in_message_record.third_reserved_16[signon_in_message_at] = wire[at]; at = at + 1; signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Signon In Message is what was written, byte for byte */
inline equal_signon_in_message(signon_in_message_read, signon_in_message_written) {
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> assert(signon_in_message_read.user_id[signon_in_message_at] == signon_in_message_written.user_id[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 8 -> assert(signon_in_message_read.reserved_8[signon_in_message_at] == signon_in_message_written.reserved_8[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 12 -> assert(signon_in_message_read.password[signon_in_message_at] == signon_in_message_written.password[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 4 -> assert(signon_in_message_read.reserved_4[signon_in_message_at] == signon_in_message_written.reserved_4[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 38 -> assert(signon_in_message_read.reserved_38[signon_in_message_at] == signon_in_message_written.reserved_38[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 5 -> assert(signon_in_message_read.broker_id[signon_in_message_at] == signon_in_message_written.broker_id[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 119 -> assert(signon_in_message_read.reserved_119[signon_in_message_at] == signon_in_message_written.reserved_119[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> assert(signon_in_message_read.reserved_16[signon_in_message_at] == signon_in_message_written.reserved_16[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> assert(signon_in_message_read.second_reserved_16[signon_in_message_at] == signon_in_message_written.second_reserved_16[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
  :: else -> break
  od;
  signon_in_message_at = 0;
  do
  :: signon_in_message_at < 16 -> assert(signon_in_message_read.third_reserved_16[signon_in_message_at] == signon_in_message_written.third_reserved_16[signon_in_message_at]); signon_in_message_at = signon_in_message_at + 1
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
    assert(at == 22);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 22);
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

/* Signon In Message: encoded, read back, and compared */
proctype check_signon_in_message() {
  SignonInMessage signon_in_message_sent;
  SignonInMessage signon_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_signon_in_message(signon_in_message_sent, 0)
  :: pattern == 1 -> fill_signon_in_message(signon_in_message_sent, 32)
  :: pattern == 2 -> fill_signon_in_message(signon_in_message_sent, 255)
  :: else -> ramp_signon_in_message(signon_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_signon_in_message(signon_in_message_sent);
    assert(at == 238);
    at = 0;
    decode_signon_in_message(signon_in_message_got);
    assert(at == 238);
    equal_signon_in_message(signon_in_message_got, signon_in_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_signon_in_message()
  fi
}
