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
 *   - the dispatch that chooses a message by its type
 *   - a Composite rule
 *   - a field read in bits
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 249

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

/* ---- Logon Error Body: 140 bytes --------------------------------------------- */

/* Logon Error Body */
typedef LogonErrorBody {
  SecInfo sec_info;
  byte error_message[128]
};

int logon_error_body_at;

/* every byte of Logon Error Body set to one value */
inline fill_logon_error_body(logon_error_body_record, logon_error_body_value) {
  fill_sec_info(logon_error_body_record.sec_info, logon_error_body_value);
  logon_error_body_at = 0;
  do
  :: logon_error_body_at < 128 -> logon_error_body_record.error_message[logon_error_body_at] = logon_error_body_value; logon_error_body_at = logon_error_body_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Error Body set to where it lies, so a field read out of place says so */
inline ramp_logon_error_body(logon_error_body_record, logon_error_body_base) {
  ramp_sec_info(logon_error_body_record.sec_info, logon_error_body_base + 0);
  logon_error_body_at = 0;
  do
  :: logon_error_body_at < 128 -> logon_error_body_record.error_message[logon_error_body_at] = (logon_error_body_base + 12 + logon_error_body_at + 1) % 256; logon_error_body_at = logon_error_body_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Error Body to the wire, 140 bytes from where the cursor stands */
inline encode_logon_error_body(logon_error_body_record) {
  encode_sec_info(logon_error_body_record.sec_info);
  logon_error_body_at = 0;
  do
  :: logon_error_body_at < 128 -> wire[at] = logon_error_body_record.error_message[logon_error_body_at]; at = at + 1; logon_error_body_at = logon_error_body_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Error Body off the wire, 140 bytes from where the cursor stands */
inline decode_logon_error_body(logon_error_body_record) {
  decode_sec_info(logon_error_body_record.sec_info);
  logon_error_body_at = 0;
  do
  :: logon_error_body_at < 128 -> logon_error_body_record.error_message[logon_error_body_at] = wire[at]; at = at + 1; logon_error_body_at = logon_error_body_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Error Body is what was written, byte for byte */
inline equal_logon_error_body(logon_error_body_read, logon_error_body_written) {
  equal_sec_info(logon_error_body_read.sec_info, logon_error_body_written.sec_info);
  logon_error_body_at = 0;
  do
  :: logon_error_body_at < 128 -> assert(logon_error_body_read.error_message[logon_error_body_at] == logon_error_body_written.error_message[logon_error_body_at]); logon_error_body_at = logon_error_body_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Local Database Header Message: 2 bytes --------------------------- */

/* Sent as UPDATE_LOCALDB_HEADER to signal that the local database download is starting */
typedef UpdateLocalDatabaseHeaderMessage {
  byte reserved_2[2]
};

int update_local_database_header_message_at;

/* every byte of Update Local Database Header Message set to one value */
inline fill_update_local_database_header_message(update_local_database_header_message_record, update_local_database_header_message_value) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> update_local_database_header_message_record.reserved_2[update_local_database_header_message_at] = update_local_database_header_message_value; update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Update Local Database Header Message set to where it lies, so a field read out of place says so */
inline ramp_update_local_database_header_message(update_local_database_header_message_record, update_local_database_header_message_base) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> update_local_database_header_message_record.reserved_2[update_local_database_header_message_at] = (update_local_database_header_message_base + 0 + update_local_database_header_message_at + 1) % 256; update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Header Message to the wire, 2 bytes from where the cursor stands */
inline encode_update_local_database_header_message(update_local_database_header_message_record) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> wire[at] = update_local_database_header_message_record.reserved_2[update_local_database_header_message_at]; at = at + 1; update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Header Message off the wire, 2 bytes from where the cursor stands */
inline decode_update_local_database_header_message(update_local_database_header_message_record) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> update_local_database_header_message_record.reserved_2[update_local_database_header_message_at] = wire[at]; at = at + 1; update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Update Local Database Header Message is what was written, byte for byte */
inline equal_update_local_database_header_message(update_local_database_header_message_read, update_local_database_header_message_written) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> assert(update_local_database_header_message_read.reserved_2[update_local_database_header_message_at] == update_local_database_header_message_written.reserved_2[update_local_database_header_message_at]); update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Local Database Trailer Message: 2 bytes -------------------------- */

/* Sent as UPDATE_LOCALDB_TRAILER to signal that the local database download is complete */
typedef UpdateLocalDatabaseTrailerMessage {
  byte reserved_2[2]
};

int update_local_database_trailer_message_at;

/* every byte of Update Local Database Trailer Message set to one value */
inline fill_update_local_database_trailer_message(update_local_database_trailer_message_record, update_local_database_trailer_message_value) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> update_local_database_trailer_message_record.reserved_2[update_local_database_trailer_message_at] = update_local_database_trailer_message_value; update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Update Local Database Trailer Message set to where it lies, so a field read out of place says so */
inline ramp_update_local_database_trailer_message(update_local_database_trailer_message_record, update_local_database_trailer_message_base) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> update_local_database_trailer_message_record.reserved_2[update_local_database_trailer_message_at] = (update_local_database_trailer_message_base + 0 + update_local_database_trailer_message_at + 1) % 256; update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Trailer Message to the wire, 2 bytes from where the cursor stands */
inline encode_update_local_database_trailer_message(update_local_database_trailer_message_record) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> wire[at] = update_local_database_trailer_message_record.reserved_2[update_local_database_trailer_message_at]; at = at + 1; update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Trailer Message off the wire, 2 bytes from where the cursor stands */
inline decode_update_local_database_trailer_message(update_local_database_trailer_message_record) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> update_local_database_trailer_message_record.reserved_2[update_local_database_trailer_message_at] = wire[at]; at = at + 1; update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Update Local Database Trailer Message is what was written, byte for byte */
inline equal_update_local_database_trailer_message(update_local_database_trailer_message_read, update_local_database_trailer_message_written) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> assert(update_local_database_trailer_message_read.reserved_2[update_local_database_trailer_message_at] == update_local_database_trailer_message_written.reserved_2[update_local_database_trailer_message_at]); update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancellation Requested Response Message: 74 bytes ----------------- */

/* Sent as TRADE_CANCEL_OUT to acknowledge that the request reached the trading system */
typedef TradeCancellationRequestedResponseMessage {
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

int trade_cancellation_requested_response_message_at;

/* every byte of Trade Cancellation Requested Response Message set to one value */
inline fill_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_record, trade_cancellation_requested_response_message_value) {
  fill_sec_info(trade_cancellation_requested_response_message_record.sec_info, trade_cancellation_requested_response_message_value);
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.reverse_leg_settl_date[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_fill_number[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_fill_qty[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_fill_price[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> trade_cancellation_requested_response_message_record.i_mkt_type[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_new_volume[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> trade_cancellation_requested_response_message_record.buy_participant_id[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> trade_cancellation_requested_response_message_record.sell_participant_id[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> trade_cancellation_requested_response_message_record.buy_broker_id[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> trade_cancellation_requested_response_message_record.sell_broker_id[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.trader_id[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> trade_cancellation_requested_response_message_record.requested_by[trade_cancellation_requested_response_message_at] = trade_cancellation_requested_response_message_value; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancellation Requested Response Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_record, trade_cancellation_requested_response_message_base) {
  ramp_sec_info(trade_cancellation_requested_response_message_record.sec_info, trade_cancellation_requested_response_message_base + 0);
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.reverse_leg_settl_date[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 12 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_fill_number[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 16 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_fill_qty[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 20 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_fill_price[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 24 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> trade_cancellation_requested_response_message_record.i_mkt_type[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 28 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_new_volume[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 30 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> trade_cancellation_requested_response_message_record.buy_participant_id[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 34 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> trade_cancellation_requested_response_message_record.sell_participant_id[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 46 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> trade_cancellation_requested_response_message_record.buy_broker_id[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 58 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> trade_cancellation_requested_response_message_record.sell_broker_id[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 63 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.trader_id[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 68 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> trade_cancellation_requested_response_message_record.requested_by[trade_cancellation_requested_response_message_at] = (trade_cancellation_requested_response_message_base + 72 + trade_cancellation_requested_response_message_at + 1) % 256; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Requested Response Message to the wire, 74 bytes from where the cursor stands */
inline encode_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_record) {
  encode_sec_info(trade_cancellation_requested_response_message_record.sec_info);
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> wire[at] = trade_cancellation_requested_response_message_record.reverse_leg_settl_date[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> wire[at] = trade_cancellation_requested_response_message_record.l_fill_number[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> wire[at] = trade_cancellation_requested_response_message_record.l_fill_qty[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> wire[at] = trade_cancellation_requested_response_message_record.l_fill_price[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> wire[at] = trade_cancellation_requested_response_message_record.i_mkt_type[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> wire[at] = trade_cancellation_requested_response_message_record.l_new_volume[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> wire[at] = trade_cancellation_requested_response_message_record.buy_participant_id[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> wire[at] = trade_cancellation_requested_response_message_record.sell_participant_id[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> wire[at] = trade_cancellation_requested_response_message_record.buy_broker_id[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> wire[at] = trade_cancellation_requested_response_message_record.sell_broker_id[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> wire[at] = trade_cancellation_requested_response_message_record.trader_id[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> wire[at] = trade_cancellation_requested_response_message_record.requested_by[trade_cancellation_requested_response_message_at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Requested Response Message off the wire, 74 bytes from where the cursor stands */
inline decode_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_record) {
  decode_sec_info(trade_cancellation_requested_response_message_record.sec_info);
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.reverse_leg_settl_date[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_fill_number[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_fill_qty[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_fill_price[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> trade_cancellation_requested_response_message_record.i_mkt_type[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.l_new_volume[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> trade_cancellation_requested_response_message_record.buy_participant_id[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> trade_cancellation_requested_response_message_record.sell_participant_id[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> trade_cancellation_requested_response_message_record.buy_broker_id[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> trade_cancellation_requested_response_message_record.sell_broker_id[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> trade_cancellation_requested_response_message_record.trader_id[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> trade_cancellation_requested_response_message_record.requested_by[trade_cancellation_requested_response_message_at] = wire[at]; at = at + 1; trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancellation Requested Response Message is what was written, byte for byte */
inline equal_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_read, trade_cancellation_requested_response_message_written) {
  equal_sec_info(trade_cancellation_requested_response_message_read.sec_info, trade_cancellation_requested_response_message_written.sec_info);
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> assert(trade_cancellation_requested_response_message_read.reverse_leg_settl_date[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.reverse_leg_settl_date[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> assert(trade_cancellation_requested_response_message_read.l_fill_number[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.l_fill_number[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> assert(trade_cancellation_requested_response_message_read.l_fill_qty[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.l_fill_qty[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> assert(trade_cancellation_requested_response_message_read.l_fill_price[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.l_fill_price[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> assert(trade_cancellation_requested_response_message_read.i_mkt_type[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.i_mkt_type[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> assert(trade_cancellation_requested_response_message_read.l_new_volume[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.l_new_volume[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> assert(trade_cancellation_requested_response_message_read.buy_participant_id[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.buy_participant_id[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 12 -> assert(trade_cancellation_requested_response_message_read.sell_participant_id[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.sell_participant_id[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> assert(trade_cancellation_requested_response_message_read.buy_broker_id[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.buy_broker_id[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 5 -> assert(trade_cancellation_requested_response_message_read.sell_broker_id[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.sell_broker_id[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 4 -> assert(trade_cancellation_requested_response_message_read.trader_id[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.trader_id[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  trade_cancellation_requested_response_message_at = 0;
  do
  :: trade_cancellation_requested_response_message_at < 2 -> assert(trade_cancellation_requested_response_message_read.requested_by[trade_cancellation_requested_response_message_at] == trade_cancellation_requested_response_message_written.requested_by[trade_cancellation_requested_response_message_at]); trade_cancellation_requested_response_message_at = trade_cancellation_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancellation Error Message: 74 bytes ------------------------------ */

/* Sent as TRADE_ERROR when an error is detected in the request */
typedef TradeCancellationErrorMessage {
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

int trade_cancellation_error_message_at;

/* every byte of Trade Cancellation Error Message set to one value */
inline fill_trade_cancellation_error_message(trade_cancellation_error_message_record, trade_cancellation_error_message_value) {
  fill_sec_info(trade_cancellation_error_message_record.sec_info, trade_cancellation_error_message_value);
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.reverse_leg_settl_date[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_fill_number[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_fill_qty[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_fill_price[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> trade_cancellation_error_message_record.i_mkt_type[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_new_volume[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> trade_cancellation_error_message_record.buy_participant_id[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> trade_cancellation_error_message_record.sell_participant_id[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> trade_cancellation_error_message_record.buy_broker_id[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> trade_cancellation_error_message_record.sell_broker_id[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.trader_id[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> trade_cancellation_error_message_record.requested_by[trade_cancellation_error_message_at] = trade_cancellation_error_message_value; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancellation Error Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancellation_error_message(trade_cancellation_error_message_record, trade_cancellation_error_message_base) {
  ramp_sec_info(trade_cancellation_error_message_record.sec_info, trade_cancellation_error_message_base + 0);
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.reverse_leg_settl_date[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 12 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_fill_number[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 16 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_fill_qty[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 20 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_fill_price[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 24 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> trade_cancellation_error_message_record.i_mkt_type[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 28 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_new_volume[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 30 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> trade_cancellation_error_message_record.buy_participant_id[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 34 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> trade_cancellation_error_message_record.sell_participant_id[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 46 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> trade_cancellation_error_message_record.buy_broker_id[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 58 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> trade_cancellation_error_message_record.sell_broker_id[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 63 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.trader_id[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 68 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> trade_cancellation_error_message_record.requested_by[trade_cancellation_error_message_at] = (trade_cancellation_error_message_base + 72 + trade_cancellation_error_message_at + 1) % 256; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Error Message to the wire, 74 bytes from where the cursor stands */
inline encode_trade_cancellation_error_message(trade_cancellation_error_message_record) {
  encode_sec_info(trade_cancellation_error_message_record.sec_info);
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> wire[at] = trade_cancellation_error_message_record.reverse_leg_settl_date[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> wire[at] = trade_cancellation_error_message_record.l_fill_number[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> wire[at] = trade_cancellation_error_message_record.l_fill_qty[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> wire[at] = trade_cancellation_error_message_record.l_fill_price[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> wire[at] = trade_cancellation_error_message_record.i_mkt_type[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> wire[at] = trade_cancellation_error_message_record.l_new_volume[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> wire[at] = trade_cancellation_error_message_record.buy_participant_id[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> wire[at] = trade_cancellation_error_message_record.sell_participant_id[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> wire[at] = trade_cancellation_error_message_record.buy_broker_id[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> wire[at] = trade_cancellation_error_message_record.sell_broker_id[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> wire[at] = trade_cancellation_error_message_record.trader_id[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> wire[at] = trade_cancellation_error_message_record.requested_by[trade_cancellation_error_message_at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Error Message off the wire, 74 bytes from where the cursor stands */
inline decode_trade_cancellation_error_message(trade_cancellation_error_message_record) {
  decode_sec_info(trade_cancellation_error_message_record.sec_info);
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.reverse_leg_settl_date[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_fill_number[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_fill_qty[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_fill_price[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> trade_cancellation_error_message_record.i_mkt_type[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.l_new_volume[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> trade_cancellation_error_message_record.buy_participant_id[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> trade_cancellation_error_message_record.sell_participant_id[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> trade_cancellation_error_message_record.buy_broker_id[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> trade_cancellation_error_message_record.sell_broker_id[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> trade_cancellation_error_message_record.trader_id[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> trade_cancellation_error_message_record.requested_by[trade_cancellation_error_message_at] = wire[at]; at = at + 1; trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancellation Error Message is what was written, byte for byte */
inline equal_trade_cancellation_error_message(trade_cancellation_error_message_read, trade_cancellation_error_message_written) {
  equal_sec_info(trade_cancellation_error_message_read.sec_info, trade_cancellation_error_message_written.sec_info);
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> assert(trade_cancellation_error_message_read.reverse_leg_settl_date[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.reverse_leg_settl_date[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> assert(trade_cancellation_error_message_read.l_fill_number[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.l_fill_number[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> assert(trade_cancellation_error_message_read.l_fill_qty[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.l_fill_qty[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> assert(trade_cancellation_error_message_read.l_fill_price[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.l_fill_price[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> assert(trade_cancellation_error_message_read.i_mkt_type[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.i_mkt_type[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> assert(trade_cancellation_error_message_read.l_new_volume[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.l_new_volume[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> assert(trade_cancellation_error_message_read.buy_participant_id[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.buy_participant_id[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 12 -> assert(trade_cancellation_error_message_read.sell_participant_id[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.sell_participant_id[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> assert(trade_cancellation_error_message_read.buy_broker_id[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.buy_broker_id[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 5 -> assert(trade_cancellation_error_message_read.sell_broker_id[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.sell_broker_id[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 4 -> assert(trade_cancellation_error_message_read.trader_id[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.trader_id[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  trade_cancellation_error_message_at = 0;
  do
  :: trade_cancellation_error_message_at < 2 -> assert(trade_cancellation_error_message_read.requested_by[trade_cancellation_error_message_at] == trade_cancellation_error_message_written.requested_by[trade_cancellation_error_message_at]); trade_cancellation_error_message_at = trade_cancellation_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Modification Requested Response Message: 74 bytes ----------------- */

/* Sent as TRADE_MOD_OUT; trade modification is currently not allowed */
typedef TradeModificationRequestedResponseMessage {
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

int trade_modification_requested_response_message_at;

/* every byte of Trade Modification Requested Response Message set to one value */
inline fill_trade_modification_requested_response_message(trade_modification_requested_response_message_record, trade_modification_requested_response_message_value) {
  fill_sec_info(trade_modification_requested_response_message_record.sec_info, trade_modification_requested_response_message_value);
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.reverse_leg_settl_date[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_fill_number[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_fill_qty[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_fill_price[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> trade_modification_requested_response_message_record.i_mkt_type[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_new_volume[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> trade_modification_requested_response_message_record.buy_participant_id[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> trade_modification_requested_response_message_record.sell_participant_id[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> trade_modification_requested_response_message_record.buy_broker_id[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> trade_modification_requested_response_message_record.sell_broker_id[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.trader_id[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> trade_modification_requested_response_message_record.requested_by[trade_modification_requested_response_message_at] = trade_modification_requested_response_message_value; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Modification Requested Response Message set to where it lies, so a field read out of place says so */
inline ramp_trade_modification_requested_response_message(trade_modification_requested_response_message_record, trade_modification_requested_response_message_base) {
  ramp_sec_info(trade_modification_requested_response_message_record.sec_info, trade_modification_requested_response_message_base + 0);
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.reverse_leg_settl_date[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 12 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_fill_number[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 16 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_fill_qty[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 20 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_fill_price[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 24 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> trade_modification_requested_response_message_record.i_mkt_type[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 28 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_new_volume[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 30 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> trade_modification_requested_response_message_record.buy_participant_id[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 34 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> trade_modification_requested_response_message_record.sell_participant_id[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 46 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> trade_modification_requested_response_message_record.buy_broker_id[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 58 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> trade_modification_requested_response_message_record.sell_broker_id[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 63 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.trader_id[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 68 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> trade_modification_requested_response_message_record.requested_by[trade_modification_requested_response_message_at] = (trade_modification_requested_response_message_base + 72 + trade_modification_requested_response_message_at + 1) % 256; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Modification Requested Response Message to the wire, 74 bytes from where the cursor stands */
inline encode_trade_modification_requested_response_message(trade_modification_requested_response_message_record) {
  encode_sec_info(trade_modification_requested_response_message_record.sec_info);
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> wire[at] = trade_modification_requested_response_message_record.reverse_leg_settl_date[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> wire[at] = trade_modification_requested_response_message_record.l_fill_number[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> wire[at] = trade_modification_requested_response_message_record.l_fill_qty[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> wire[at] = trade_modification_requested_response_message_record.l_fill_price[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> wire[at] = trade_modification_requested_response_message_record.i_mkt_type[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> wire[at] = trade_modification_requested_response_message_record.l_new_volume[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> wire[at] = trade_modification_requested_response_message_record.buy_participant_id[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> wire[at] = trade_modification_requested_response_message_record.sell_participant_id[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> wire[at] = trade_modification_requested_response_message_record.buy_broker_id[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> wire[at] = trade_modification_requested_response_message_record.sell_broker_id[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> wire[at] = trade_modification_requested_response_message_record.trader_id[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> wire[at] = trade_modification_requested_response_message_record.requested_by[trade_modification_requested_response_message_at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Modification Requested Response Message off the wire, 74 bytes from where the cursor stands */
inline decode_trade_modification_requested_response_message(trade_modification_requested_response_message_record) {
  decode_sec_info(trade_modification_requested_response_message_record.sec_info);
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.reverse_leg_settl_date[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_fill_number[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_fill_qty[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_fill_price[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> trade_modification_requested_response_message_record.i_mkt_type[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.l_new_volume[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> trade_modification_requested_response_message_record.buy_participant_id[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> trade_modification_requested_response_message_record.sell_participant_id[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> trade_modification_requested_response_message_record.buy_broker_id[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> trade_modification_requested_response_message_record.sell_broker_id[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> trade_modification_requested_response_message_record.trader_id[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> trade_modification_requested_response_message_record.requested_by[trade_modification_requested_response_message_at] = wire[at]; at = at + 1; trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Modification Requested Response Message is what was written, byte for byte */
inline equal_trade_modification_requested_response_message(trade_modification_requested_response_message_read, trade_modification_requested_response_message_written) {
  equal_sec_info(trade_modification_requested_response_message_read.sec_info, trade_modification_requested_response_message_written.sec_info);
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> assert(trade_modification_requested_response_message_read.reverse_leg_settl_date[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.reverse_leg_settl_date[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> assert(trade_modification_requested_response_message_read.l_fill_number[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.l_fill_number[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> assert(trade_modification_requested_response_message_read.l_fill_qty[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.l_fill_qty[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> assert(trade_modification_requested_response_message_read.l_fill_price[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.l_fill_price[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> assert(trade_modification_requested_response_message_read.i_mkt_type[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.i_mkt_type[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> assert(trade_modification_requested_response_message_read.l_new_volume[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.l_new_volume[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> assert(trade_modification_requested_response_message_read.buy_participant_id[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.buy_participant_id[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 12 -> assert(trade_modification_requested_response_message_read.sell_participant_id[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.sell_participant_id[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> assert(trade_modification_requested_response_message_read.buy_broker_id[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.buy_broker_id[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 5 -> assert(trade_modification_requested_response_message_read.sell_broker_id[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.sell_broker_id[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 4 -> assert(trade_modification_requested_response_message_read.trader_id[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.trader_id[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  trade_modification_requested_response_message_at = 0;
  do
  :: trade_modification_requested_response_message_at < 2 -> assert(trade_modification_requested_response_message_read.requested_by[trade_modification_requested_response_message_at] == trade_modification_requested_response_message_written.requested_by[trade_modification_requested_response_message_at]); trade_modification_requested_response_message_at = trade_modification_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Control Message To Trader Message: 249 bytes ---------------------------- */

/* Sent as CTRL_MSG_TO_TRADER for a message from NSE-Control to a particular user, and for a counter party's trade cancellation request */
typedef ControlMessageToTraderMessage {
  byte trader_id[4];
  byte action_code[3];
  byte reserved_1;
  byte msg_length[2];
  byte msg[239]
};

int control_message_to_trader_message_at;

/* every byte of Control Message To Trader Message set to one value */
inline fill_control_message_to_trader_message(control_message_to_trader_message_record, control_message_to_trader_message_value) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> control_message_to_trader_message_record.trader_id[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> control_message_to_trader_message_record.action_code[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_record.reserved_1 = control_message_to_trader_message_value;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.msg_length[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> control_message_to_trader_message_record.msg[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Control Message To Trader Message set to where it lies, so a field read out of place says so */
inline ramp_control_message_to_trader_message(control_message_to_trader_message_record, control_message_to_trader_message_base) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> control_message_to_trader_message_record.trader_id[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 0 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> control_message_to_trader_message_record.action_code[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 4 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_record.reserved_1 = (control_message_to_trader_message_base + 7 + 1) % 256;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.msg_length[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 8 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> control_message_to_trader_message_record.msg[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 10 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message To Trader Message to the wire, 249 bytes from where the cursor stands */
inline encode_control_message_to_trader_message(control_message_to_trader_message_record) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> wire[at] = control_message_to_trader_message_record.trader_id[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> wire[at] = control_message_to_trader_message_record.action_code[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  wire[at] = control_message_to_trader_message_record.reserved_1; at = at + 1;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> wire[at] = control_message_to_trader_message_record.msg_length[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> wire[at] = control_message_to_trader_message_record.msg[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message To Trader Message off the wire, 249 bytes from where the cursor stands */
inline decode_control_message_to_trader_message(control_message_to_trader_message_record) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> control_message_to_trader_message_record.trader_id[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> control_message_to_trader_message_record.action_code[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_record.reserved_1 = wire[at]; at = at + 1;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.msg_length[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> control_message_to_trader_message_record.msg[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Control Message To Trader Message is what was written, byte for byte */
inline equal_control_message_to_trader_message(control_message_to_trader_message_read, control_message_to_trader_message_written) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> assert(control_message_to_trader_message_read.trader_id[control_message_to_trader_message_at] == control_message_to_trader_message_written.trader_id[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> assert(control_message_to_trader_message_read.action_code[control_message_to_trader_message_at] == control_message_to_trader_message_written.action_code[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  assert(control_message_to_trader_message_read.reserved_1 == control_message_to_trader_message_written.reserved_1);
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> assert(control_message_to_trader_message_read.msg_length[control_message_to_trader_message_at] == control_message_to_trader_message_written.msg_length[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> assert(control_message_to_trader_message_read.msg[control_message_to_trader_message_at] == control_message_to_trader_message_written.msg[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Error Response Message: 140 bytes --------------------------------------- */

/* Sent as ERROR_RESPONSE_OUT when the Error Code of the header is not zero */
typedef ErrorResponseMessage {
  SecInfo sec_info;
  byte error_message[128]
};

int error_response_message_at;

/* every byte of Error Response Message set to one value */
inline fill_error_response_message(error_response_message_record, error_response_message_value) {
  fill_sec_info(error_response_message_record.sec_info, error_response_message_value);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> error_response_message_record.error_message[error_response_message_at] = error_response_message_value; error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Error Response Message set to where it lies, so a field read out of place says so */
inline ramp_error_response_message(error_response_message_record, error_response_message_base) {
  ramp_sec_info(error_response_message_record.sec_info, error_response_message_base + 0);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> error_response_message_record.error_message[error_response_message_at] = (error_response_message_base + 12 + error_response_message_at + 1) % 256; error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Error Response Message to the wire, 140 bytes from where the cursor stands */
inline encode_error_response_message(error_response_message_record) {
  encode_sec_info(error_response_message_record.sec_info);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> wire[at] = error_response_message_record.error_message[error_response_message_at]; at = at + 1; error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Error Response Message off the wire, 140 bytes from where the cursor stands */
inline decode_error_response_message(error_response_message_record) {
  decode_sec_info(error_response_message_record.sec_info);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> error_response_message_record.error_message[error_response_message_at] = wire[at]; at = at + 1; error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Error Response Message is what was written, byte for byte */
inline equal_error_response_message(error_response_message_read, error_response_message_written) {
  equal_sec_info(error_response_message_read.sec_info, error_response_message_written.sec_info);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> assert(error_response_message_read.error_message[error_response_message_at] == error_response_message_written.error_message[error_response_message_at]); error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gateway Router Response Message: 84 bytes ------------------------------- */

/* Sent as GR_RESPONSE with the allocated gateway server, its session key and the cryptographic key and vector */
typedef GatewayRouterResponseMessage {
  byte box_id[2];
  byte broker_id[5];
  byte filler;
  byte ip_address[16];
  byte port[4];
  byte session_key[8];
  byte cryptographic_key[32];
  byte cryptographic_iv_initialization_vector[16]
};

int gateway_router_response_message_at;

/* every byte of Gateway Router Response Message set to one value */
inline fill_gateway_router_response_message(gateway_router_response_message_record, gateway_router_response_message_value) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> gateway_router_response_message_record.box_id[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> gateway_router_response_message_record.broker_id[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_record.filler = gateway_router_response_message_value;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.ip_address[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> gateway_router_response_message_record.port[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> gateway_router_response_message_record.session_key[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> gateway_router_response_message_record.cryptographic_key[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.cryptographic_iv_initialization_vector[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Gateway Router Response Message set to where it lies, so a field read out of place says so */
inline ramp_gateway_router_response_message(gateway_router_response_message_record, gateway_router_response_message_base) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> gateway_router_response_message_record.box_id[gateway_router_response_message_at] = (gateway_router_response_message_base + 0 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> gateway_router_response_message_record.broker_id[gateway_router_response_message_at] = (gateway_router_response_message_base + 2 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_record.filler = (gateway_router_response_message_base + 7 + 1) % 256;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.ip_address[gateway_router_response_message_at] = (gateway_router_response_message_base + 8 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> gateway_router_response_message_record.port[gateway_router_response_message_at] = (gateway_router_response_message_base + 24 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> gateway_router_response_message_record.session_key[gateway_router_response_message_at] = (gateway_router_response_message_base + 28 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> gateway_router_response_message_record.cryptographic_key[gateway_router_response_message_at] = (gateway_router_response_message_base + 36 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.cryptographic_iv_initialization_vector[gateway_router_response_message_at] = (gateway_router_response_message_base + 68 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gateway Router Response Message to the wire, 84 bytes from where the cursor stands */
inline encode_gateway_router_response_message(gateway_router_response_message_record) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> wire[at] = gateway_router_response_message_record.box_id[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> wire[at] = gateway_router_response_message_record.broker_id[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  wire[at] = gateway_router_response_message_record.filler; at = at + 1;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> wire[at] = gateway_router_response_message_record.ip_address[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> wire[at] = gateway_router_response_message_record.port[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> wire[at] = gateway_router_response_message_record.session_key[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> wire[at] = gateway_router_response_message_record.cryptographic_key[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> wire[at] = gateway_router_response_message_record.cryptographic_iv_initialization_vector[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gateway Router Response Message off the wire, 84 bytes from where the cursor stands */
inline decode_gateway_router_response_message(gateway_router_response_message_record) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> gateway_router_response_message_record.box_id[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> gateway_router_response_message_record.broker_id[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_record.filler = wire[at]; at = at + 1;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.ip_address[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> gateway_router_response_message_record.port[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> gateway_router_response_message_record.session_key[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> gateway_router_response_message_record.cryptographic_key[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.cryptographic_iv_initialization_vector[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Gateway Router Response Message is what was written, byte for byte */
inline equal_gateway_router_response_message(gateway_router_response_message_read, gateway_router_response_message_written) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> assert(gateway_router_response_message_read.box_id[gateway_router_response_message_at] == gateway_router_response_message_written.box_id[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> assert(gateway_router_response_message_read.broker_id[gateway_router_response_message_at] == gateway_router_response_message_written.broker_id[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  assert(gateway_router_response_message_read.filler == gateway_router_response_message_written.filler);
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> assert(gateway_router_response_message_read.ip_address[gateway_router_response_message_at] == gateway_router_response_message_written.ip_address[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> assert(gateway_router_response_message_read.port[gateway_router_response_message_at] == gateway_router_response_message_written.port[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> assert(gateway_router_response_message_read.session_key[gateway_router_response_message_at] == gateway_router_response_message_written.session_key[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> assert(gateway_router_response_message_read.cryptographic_key[gateway_router_response_message_at] == gateway_router_response_message_written.cryptographic_key[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> assert(gateway_router_response_message_read.cryptographic_iv_initialization_vector[gateway_router_response_message_at] == gateway_router_response_message_written.cryptographic_iv_initialization_vector[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Box Sign On Response Message: 12 bytes ---------------------------------- */

/* Sent as BOX_SIGN_ON_REQUEST_OUT; an error terminates the box connection */
typedef BoxSignOnResponseMessage {
  byte box_id[2];
  byte reserved_10[10]
};

int box_sign_on_response_message_at;

/* every byte of Box Sign On Response Message set to one value */
inline fill_box_sign_on_response_message(box_sign_on_response_message_record, box_sign_on_response_message_value) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> box_sign_on_response_message_record.box_id[box_sign_on_response_message_at] = box_sign_on_response_message_value; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> box_sign_on_response_message_record.reserved_10[box_sign_on_response_message_at] = box_sign_on_response_message_value; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign On Response Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_on_response_message(box_sign_on_response_message_record, box_sign_on_response_message_base) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> box_sign_on_response_message_record.box_id[box_sign_on_response_message_at] = (box_sign_on_response_message_base + 0 + box_sign_on_response_message_at + 1) % 256; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> box_sign_on_response_message_record.reserved_10[box_sign_on_response_message_at] = (box_sign_on_response_message_base + 2 + box_sign_on_response_message_at + 1) % 256; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Response Message to the wire, 12 bytes from where the cursor stands */
inline encode_box_sign_on_response_message(box_sign_on_response_message_record) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> wire[at] = box_sign_on_response_message_record.box_id[box_sign_on_response_message_at]; at = at + 1; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> wire[at] = box_sign_on_response_message_record.reserved_10[box_sign_on_response_message_at]; at = at + 1; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Response Message off the wire, 12 bytes from where the cursor stands */
inline decode_box_sign_on_response_message(box_sign_on_response_message_record) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> box_sign_on_response_message_record.box_id[box_sign_on_response_message_at] = wire[at]; at = at + 1; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> box_sign_on_response_message_record.reserved_10[box_sign_on_response_message_at] = wire[at]; at = at + 1; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign On Response Message is what was written, byte for byte */
inline equal_box_sign_on_response_message(box_sign_on_response_message_read, box_sign_on_response_message_written) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> assert(box_sign_on_response_message_read.box_id[box_sign_on_response_message_at] == box_sign_on_response_message_written.box_id[box_sign_on_response_message_at]); box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> assert(box_sign_on_response_message_read.reserved_10[box_sign_on_response_message_at] == box_sign_on_response_message_written.reserved_10[box_sign_on_response_message_at]); box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Box Sign Off Message: 2 bytes ------------------------------------------- */

/* Sent as BOX_SIGN_OFF with an error code when the exchange terminates the connection */
typedef BoxSignOffMessage {
  byte box_id[2]
};

int box_sign_off_message_at;

/* every byte of Box Sign Off Message set to one value */
inline fill_box_sign_off_message(box_sign_off_message_record, box_sign_off_message_value) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> box_sign_off_message_record.box_id[box_sign_off_message_at] = box_sign_off_message_value; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign Off Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_off_message(box_sign_off_message_record, box_sign_off_message_base) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> box_sign_off_message_record.box_id[box_sign_off_message_at] = (box_sign_off_message_base + 0 + box_sign_off_message_at + 1) % 256; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign Off Message to the wire, 2 bytes from where the cursor stands */
inline encode_box_sign_off_message(box_sign_off_message_record) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> wire[at] = box_sign_off_message_record.box_id[box_sign_off_message_at]; at = at + 1; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign Off Message off the wire, 2 bytes from where the cursor stands */
inline decode_box_sign_off_message(box_sign_off_message_record) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> box_sign_off_message_record.box_id[box_sign_off_message_at] = wire[at]; at = at + 1; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign Off Message is what was written, byte for byte */
inline equal_box_sign_off_message(box_sign_off_message_read, box_sign_off_message_written) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> assert(box_sign_off_message_read.box_id[box_sign_off_message_at] == box_sign_off_message_written.box_id[box_sign_off_message_at]); box_sign_off_message_at = box_sign_off_message_at + 1
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

/* Logon Error Body: encoded, read back, and compared */
proctype check_logon_error_body() {
  LogonErrorBody logon_error_body_sent;
  LogonErrorBody logon_error_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_error_body(logon_error_body_sent, 0)
  :: pattern == 1 -> fill_logon_error_body(logon_error_body_sent, 32)
  :: pattern == 2 -> fill_logon_error_body(logon_error_body_sent, 255)
  :: else -> ramp_logon_error_body(logon_error_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_error_body(logon_error_body_sent);
    assert(at == 140);
    at = 0;
    decode_logon_error_body(logon_error_body_got);
    assert(at == 140);
    equal_logon_error_body(logon_error_body_got, logon_error_body_sent)
  }
}

/* Update Local Database Header Message: encoded, read back, and compared */
proctype check_update_local_database_header_message() {
  UpdateLocalDatabaseHeaderMessage update_local_database_header_message_sent;
  UpdateLocalDatabaseHeaderMessage update_local_database_header_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_local_database_header_message(update_local_database_header_message_sent, 0)
  :: pattern == 1 -> fill_update_local_database_header_message(update_local_database_header_message_sent, 32)
  :: pattern == 2 -> fill_update_local_database_header_message(update_local_database_header_message_sent, 255)
  :: else -> ramp_update_local_database_header_message(update_local_database_header_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_local_database_header_message(update_local_database_header_message_sent);
    assert(at == 2);
    at = 0;
    decode_update_local_database_header_message(update_local_database_header_message_got);
    assert(at == 2);
    equal_update_local_database_header_message(update_local_database_header_message_got, update_local_database_header_message_sent)
  }
}

/* Update Local Database Trailer Message: encoded, read back, and compared */
proctype check_update_local_database_trailer_message() {
  UpdateLocalDatabaseTrailerMessage update_local_database_trailer_message_sent;
  UpdateLocalDatabaseTrailerMessage update_local_database_trailer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_local_database_trailer_message(update_local_database_trailer_message_sent, 0)
  :: pattern == 1 -> fill_update_local_database_trailer_message(update_local_database_trailer_message_sent, 32)
  :: pattern == 2 -> fill_update_local_database_trailer_message(update_local_database_trailer_message_sent, 255)
  :: else -> ramp_update_local_database_trailer_message(update_local_database_trailer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_local_database_trailer_message(update_local_database_trailer_message_sent);
    assert(at == 2);
    at = 0;
    decode_update_local_database_trailer_message(update_local_database_trailer_message_got);
    assert(at == 2);
    equal_update_local_database_trailer_message(update_local_database_trailer_message_got, update_local_database_trailer_message_sent)
  }
}

/* Trade Cancellation Requested Response Message: encoded, read back, and compared */
proctype check_trade_cancellation_requested_response_message() {
  TradeCancellationRequestedResponseMessage trade_cancellation_requested_response_message_sent;
  TradeCancellationRequestedResponseMessage trade_cancellation_requested_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_sent, 255)
  :: else -> ramp_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_sent);
    assert(at == 74);
    at = 0;
    decode_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_got);
    assert(at == 74);
    equal_trade_cancellation_requested_response_message(trade_cancellation_requested_response_message_got, trade_cancellation_requested_response_message_sent)
  }
}

/* Trade Cancellation Error Message: encoded, read back, and compared */
proctype check_trade_cancellation_error_message() {
  TradeCancellationErrorMessage trade_cancellation_error_message_sent;
  TradeCancellationErrorMessage trade_cancellation_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancellation_error_message(trade_cancellation_error_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancellation_error_message(trade_cancellation_error_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancellation_error_message(trade_cancellation_error_message_sent, 255)
  :: else -> ramp_trade_cancellation_error_message(trade_cancellation_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancellation_error_message(trade_cancellation_error_message_sent);
    assert(at == 74);
    at = 0;
    decode_trade_cancellation_error_message(trade_cancellation_error_message_got);
    assert(at == 74);
    equal_trade_cancellation_error_message(trade_cancellation_error_message_got, trade_cancellation_error_message_sent)
  }
}

/* Trade Modification Requested Response Message: encoded, read back, and compared */
proctype check_trade_modification_requested_response_message() {
  TradeModificationRequestedResponseMessage trade_modification_requested_response_message_sent;
  TradeModificationRequestedResponseMessage trade_modification_requested_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_modification_requested_response_message(trade_modification_requested_response_message_sent, 0)
  :: pattern == 1 -> fill_trade_modification_requested_response_message(trade_modification_requested_response_message_sent, 32)
  :: pattern == 2 -> fill_trade_modification_requested_response_message(trade_modification_requested_response_message_sent, 255)
  :: else -> ramp_trade_modification_requested_response_message(trade_modification_requested_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_modification_requested_response_message(trade_modification_requested_response_message_sent);
    assert(at == 74);
    at = 0;
    decode_trade_modification_requested_response_message(trade_modification_requested_response_message_got);
    assert(at == 74);
    equal_trade_modification_requested_response_message(trade_modification_requested_response_message_got, trade_modification_requested_response_message_sent)
  }
}

/* Control Message To Trader Message: encoded, read back, and compared */
proctype check_control_message_to_trader_message() {
  ControlMessageToTraderMessage control_message_to_trader_message_sent;
  ControlMessageToTraderMessage control_message_to_trader_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_control_message_to_trader_message(control_message_to_trader_message_sent, 0)
  :: pattern == 1 -> fill_control_message_to_trader_message(control_message_to_trader_message_sent, 32)
  :: pattern == 2 -> fill_control_message_to_trader_message(control_message_to_trader_message_sent, 255)
  :: else -> ramp_control_message_to_trader_message(control_message_to_trader_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_control_message_to_trader_message(control_message_to_trader_message_sent);
    assert(at == 249);
    at = 0;
    decode_control_message_to_trader_message(control_message_to_trader_message_got);
    assert(at == 249);
    equal_control_message_to_trader_message(control_message_to_trader_message_got, control_message_to_trader_message_sent)
  }
}

/* Error Response Message: encoded, read back, and compared */
proctype check_error_response_message() {
  ErrorResponseMessage error_response_message_sent;
  ErrorResponseMessage error_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_error_response_message(error_response_message_sent, 0)
  :: pattern == 1 -> fill_error_response_message(error_response_message_sent, 32)
  :: pattern == 2 -> fill_error_response_message(error_response_message_sent, 255)
  :: else -> ramp_error_response_message(error_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_error_response_message(error_response_message_sent);
    assert(at == 140);
    at = 0;
    decode_error_response_message(error_response_message_got);
    assert(at == 140);
    equal_error_response_message(error_response_message_got, error_response_message_sent)
  }
}

/* Gateway Router Response Message: encoded, read back, and compared */
proctype check_gateway_router_response_message() {
  GatewayRouterResponseMessage gateway_router_response_message_sent;
  GatewayRouterResponseMessage gateway_router_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gateway_router_response_message(gateway_router_response_message_sent, 0)
  :: pattern == 1 -> fill_gateway_router_response_message(gateway_router_response_message_sent, 32)
  :: pattern == 2 -> fill_gateway_router_response_message(gateway_router_response_message_sent, 255)
  :: else -> ramp_gateway_router_response_message(gateway_router_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gateway_router_response_message(gateway_router_response_message_sent);
    assert(at == 84);
    at = 0;
    decode_gateway_router_response_message(gateway_router_response_message_got);
    assert(at == 84);
    equal_gateway_router_response_message(gateway_router_response_message_got, gateway_router_response_message_sent)
  }
}

/* Box Sign On Response Message: encoded, read back, and compared */
proctype check_box_sign_on_response_message() {
  BoxSignOnResponseMessage box_sign_on_response_message_sent;
  BoxSignOnResponseMessage box_sign_on_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_on_response_message(box_sign_on_response_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_on_response_message(box_sign_on_response_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_on_response_message(box_sign_on_response_message_sent, 255)
  :: else -> ramp_box_sign_on_response_message(box_sign_on_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_on_response_message(box_sign_on_response_message_sent);
    assert(at == 12);
    at = 0;
    decode_box_sign_on_response_message(box_sign_on_response_message_got);
    assert(at == 12);
    equal_box_sign_on_response_message(box_sign_on_response_message_got, box_sign_on_response_message_sent)
  }
}

/* Box Sign Off Message: encoded, read back, and compared */
proctype check_box_sign_off_message() {
  BoxSignOffMessage box_sign_off_message_sent;
  BoxSignOffMessage box_sign_off_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_off_message(box_sign_off_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_off_message(box_sign_off_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_off_message(box_sign_off_message_sent, 255)
  :: else -> ramp_box_sign_off_message(box_sign_off_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_off_message(box_sign_off_message_sent);
    assert(at == 2);
    at = 0;
    decode_box_sign_off_message(box_sign_off_message_got);
    assert(at == 2);
    equal_box_sign_off_message(box_sign_off_message_got, box_sign_off_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_sec_info()
  :: run check_logon_error_body()
  :: run check_update_local_database_header_message()
  :: run check_update_local_database_trailer_message()
  :: run check_trade_cancellation_requested_response_message()
  :: run check_trade_cancellation_error_message()
  :: run check_trade_modification_requested_response_message()
  :: run check_control_message_to_trader_message()
  :: run check_error_response_message()
  :: run check_gateway_router_response_message()
  :: run check_box_sign_on_response_message()
  :: run check_box_sign_off_message()
  fi
}
