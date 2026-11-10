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
 *   - a Composite rule
 *   - a field read in bits
 *   - the dispatch that chooses a message by its type
 *   - a length prefix framing what follows
 *   - a run of a stated number of entries
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

/* ---- Sign Off Request Out Message: 149 bytes --------------------------------- */

/* Breaks the virtual circuit between the host and the front end */
typedef SignOffRequestOutMessage {
  byte user_id[4];
  byte reserved_145[145]
};

int sign_off_request_out_message_at;

/* every byte of Sign Off Request Out Message set to one value */
inline fill_sign_off_request_out_message(sign_off_request_out_message_record, sign_off_request_out_message_value) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> sign_off_request_out_message_record.user_id[sign_off_request_out_message_at] = sign_off_request_out_message_value; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> sign_off_request_out_message_record.reserved_145[sign_off_request_out_message_at] = sign_off_request_out_message_value; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sign Off Request Out Message set to where it lies, so a field read out of place says so */
inline ramp_sign_off_request_out_message(sign_off_request_out_message_record, sign_off_request_out_message_base) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> sign_off_request_out_message_record.user_id[sign_off_request_out_message_at] = (sign_off_request_out_message_base + 0 + sign_off_request_out_message_at + 1) % 256; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> sign_off_request_out_message_record.reserved_145[sign_off_request_out_message_at] = (sign_off_request_out_message_base + 4 + sign_off_request_out_message_at + 1) % 256; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sign Off Request Out Message to the wire, 149 bytes from where the cursor stands */
inline encode_sign_off_request_out_message(sign_off_request_out_message_record) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> wire[at] = sign_off_request_out_message_record.user_id[sign_off_request_out_message_at]; at = at + 1; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> wire[at] = sign_off_request_out_message_record.reserved_145[sign_off_request_out_message_at]; at = at + 1; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sign Off Request Out Message off the wire, 149 bytes from where the cursor stands */
inline decode_sign_off_request_out_message(sign_off_request_out_message_record) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> sign_off_request_out_message_record.user_id[sign_off_request_out_message_at] = wire[at]; at = at + 1; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> sign_off_request_out_message_record.reserved_145[sign_off_request_out_message_at] = wire[at]; at = at + 1; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sign Off Request Out Message is what was written, byte for byte */
inline equal_sign_off_request_out_message(sign_off_request_out_message_read, sign_off_request_out_message_written) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> assert(sign_off_request_out_message_read.user_id[sign_off_request_out_message_at] == sign_off_request_out_message_written.user_id[sign_off_request_out_message_at]); sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> assert(sign_off_request_out_message_read.reserved_145[sign_off_request_out_message_at] == sign_off_request_out_message_written.reserved_145[sign_off_request_out_message_at]); sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Market Status: 8 bytes ----------------------------------------------- */

/* ST_MARKET_STATUS */
typedef StMarketStatus {
  byte market_status_normal[2];
  byte market_status_oddlot[2];
  byte market_status_spot[2];
  byte market_status_auction[2]
};

int st_market_status_at;

/* every byte of St Market Status set to one value */
inline fill_st_market_status(st_market_status_record, st_market_status_value) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_normal[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_oddlot[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_spot[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_auction[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_market_status(st_market_status_record, st_market_status_base) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_normal[st_market_status_at] = (st_market_status_base + 0 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_oddlot[st_market_status_at] = (st_market_status_base + 2 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_spot[st_market_status_at] = (st_market_status_base + 4 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_auction[st_market_status_at] = (st_market_status_base + 6 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_market_status(st_market_status_record) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.market_status_normal[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.market_status_oddlot[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.market_status_spot[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.market_status_auction[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_market_status(st_market_status_record) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_normal[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_oddlot[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_spot[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.market_status_auction[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Market Status is what was written, byte for byte */
inline equal_st_market_status(st_market_status_read, st_market_status_written) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.market_status_normal[st_market_status_at] == st_market_status_written.market_status_normal[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.market_status_oddlot[st_market_status_at] == st_market_status_written.market_status_oddlot[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.market_status_spot[st_market_status_at] == st_market_status_written.market_status_spot[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.market_status_auction[st_market_status_at] == st_market_status_written.market_status_auction[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Ex Market Status: 8 bytes -------------------------------------------- */

/* ST_EX_MARKET_STATUS */
typedef StExMarketStatus {
  byte ex_market_status_normal[2];
  byte ex_market_status_oddlot[2];
  byte ex_market_status_spot[2];
  byte ex_market_status_auction[2]
};

int st_ex_market_status_at;

/* every byte of St Ex Market Status set to one value */
inline fill_st_ex_market_status(st_ex_market_status_record, st_ex_market_status_value) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_normal[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_oddlot[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_spot[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_auction[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Ex Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_ex_market_status(st_ex_market_status_record, st_ex_market_status_base) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_normal[st_ex_market_status_at] = (st_ex_market_status_base + 0 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_oddlot[st_ex_market_status_at] = (st_ex_market_status_base + 2 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_spot[st_ex_market_status_at] = (st_ex_market_status_base + 4 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_auction[st_ex_market_status_at] = (st_ex_market_status_base + 6 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Ex Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_ex_market_status(st_ex_market_status_record) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.ex_market_status_normal[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.ex_market_status_oddlot[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.ex_market_status_spot[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.ex_market_status_auction[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Ex Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_ex_market_status(st_ex_market_status_record) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_normal[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_oddlot[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_spot[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.ex_market_status_auction[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Ex Market Status is what was written, byte for byte */
inline equal_st_ex_market_status(st_ex_market_status_read, st_ex_market_status_written) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.ex_market_status_normal[st_ex_market_status_at] == st_ex_market_status_written.ex_market_status_normal[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.ex_market_status_oddlot[st_ex_market_status_at] == st_ex_market_status_written.ex_market_status_oddlot[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.ex_market_status_spot[st_ex_market_status_at] == st_ex_market_status_written.ex_market_status_spot[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.ex_market_status_auction[st_ex_market_status_at] == st_ex_market_status_written.ex_market_status_auction[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Pl Market Status: 8 bytes -------------------------------------------- */

/* ST_PL_MARKET_STATUS */
typedef StPlMarketStatus {
  byte pl_market_status_normal[2];
  byte pl_market_status_oddlot[2];
  byte pl_market_status_spot[2];
  byte pl_market_status_auction[2]
};

int st_pl_market_status_at;

/* every byte of St Pl Market Status set to one value */
inline fill_st_pl_market_status(st_pl_market_status_record, st_pl_market_status_value) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_normal[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_oddlot[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_spot[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_auction[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Pl Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_pl_market_status(st_pl_market_status_record, st_pl_market_status_base) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_normal[st_pl_market_status_at] = (st_pl_market_status_base + 0 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_oddlot[st_pl_market_status_at] = (st_pl_market_status_base + 2 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_spot[st_pl_market_status_at] = (st_pl_market_status_base + 4 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_auction[st_pl_market_status_at] = (st_pl_market_status_base + 6 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Pl Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_pl_market_status(st_pl_market_status_record) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.pl_market_status_normal[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.pl_market_status_oddlot[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.pl_market_status_spot[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.pl_market_status_auction[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Pl Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_pl_market_status(st_pl_market_status_record) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_normal[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_oddlot[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_spot[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.pl_market_status_auction[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Pl Market Status is what was written, byte for byte */
inline equal_st_pl_market_status(st_pl_market_status_read, st_pl_market_status_written) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.pl_market_status_normal[st_pl_market_status_at] == st_pl_market_status_written.pl_market_status_normal[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.pl_market_status_oddlot[st_pl_market_status_at] == st_pl_market_status_written.pl_market_status_oddlot[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.pl_market_status_spot[st_pl_market_status_at] == st_pl_market_status_written.pl_market_status_spot[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.pl_market_status_auction[st_pl_market_status_at] == st_pl_market_status_written.pl_market_status_auction[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Existing Encryption Tail: 16 bytes -------------------------------------- */

/* Initialisation vector used by the existing encryption */
typedef ExistingEncryptionTail {
  byte cryptographic_iv[16]
};

int existing_encryption_tail_at;

/* every byte of Existing Encryption Tail set to one value */
inline fill_existing_encryption_tail(existing_encryption_tail_record, existing_encryption_tail_value) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> existing_encryption_tail_record.cryptographic_iv[existing_encryption_tail_at] = existing_encryption_tail_value; existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Existing Encryption Tail set to where it lies, so a field read out of place says so */
inline ramp_existing_encryption_tail(existing_encryption_tail_record, existing_encryption_tail_base) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> existing_encryption_tail_record.cryptographic_iv[existing_encryption_tail_at] = (existing_encryption_tail_base + 0 + existing_encryption_tail_at + 1) % 256; existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* Existing Encryption Tail to the wire, 16 bytes from where the cursor stands */
inline encode_existing_encryption_tail(existing_encryption_tail_record) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> wire[at] = existing_encryption_tail_record.cryptographic_iv[existing_encryption_tail_at]; at = at + 1; existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* Existing Encryption Tail off the wire, 16 bytes from where the cursor stands */
inline decode_existing_encryption_tail(existing_encryption_tail_record) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> existing_encryption_tail_record.cryptographic_iv[existing_encryption_tail_at] = wire[at]; at = at + 1; existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Existing Encryption Tail is what was written, byte for byte */
inline equal_existing_encryption_tail(existing_encryption_tail_read, existing_encryption_tail_written) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> assert(existing_encryption_tail_read.cryptographic_iv[existing_encryption_tail_at] == existing_encryption_tail_written.cryptographic_iv[existing_encryption_tail_at]); existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Encryption Tail: 28 bytes ------------------------------------------- */

/* Initialisation vectors used by the new authenticated encryption */
typedef NewEncryptionTail {
  byte static_cryptographic_iv[8];
  byte dynamic_cryptographic_iv[8];
  byte cryptographic_additional_key[12]
};

int new_encryption_tail_at;

/* every byte of New Encryption Tail set to one value */
inline fill_new_encryption_tail(new_encryption_tail_record, new_encryption_tail_value) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.static_cryptographic_iv[new_encryption_tail_at] = new_encryption_tail_value; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.dynamic_cryptographic_iv[new_encryption_tail_at] = new_encryption_tail_value; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> new_encryption_tail_record.cryptographic_additional_key[new_encryption_tail_at] = new_encryption_tail_value; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Encryption Tail set to where it lies, so a field read out of place says so */
inline ramp_new_encryption_tail(new_encryption_tail_record, new_encryption_tail_base) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.static_cryptographic_iv[new_encryption_tail_at] = (new_encryption_tail_base + 0 + new_encryption_tail_at + 1) % 256; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.dynamic_cryptographic_iv[new_encryption_tail_at] = (new_encryption_tail_base + 8 + new_encryption_tail_at + 1) % 256; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> new_encryption_tail_record.cryptographic_additional_key[new_encryption_tail_at] = (new_encryption_tail_base + 16 + new_encryption_tail_at + 1) % 256; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* New Encryption Tail to the wire, 28 bytes from where the cursor stands */
inline encode_new_encryption_tail(new_encryption_tail_record) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> wire[at] = new_encryption_tail_record.static_cryptographic_iv[new_encryption_tail_at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> wire[at] = new_encryption_tail_record.dynamic_cryptographic_iv[new_encryption_tail_at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> wire[at] = new_encryption_tail_record.cryptographic_additional_key[new_encryption_tail_at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* New Encryption Tail off the wire, 28 bytes from where the cursor stands */
inline decode_new_encryption_tail(new_encryption_tail_record) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.static_cryptographic_iv[new_encryption_tail_at] = wire[at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.dynamic_cryptographic_iv[new_encryption_tail_at] = wire[at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> new_encryption_tail_record.cryptographic_additional_key[new_encryption_tail_at] = wire[at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Encryption Tail is what was written, byte for byte */
inline equal_new_encryption_tail(new_encryption_tail_read, new_encryption_tail_written) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> assert(new_encryption_tail_read.static_cryptographic_iv[new_encryption_tail_at] == new_encryption_tail_written.static_cryptographic_iv[new_encryption_tail_at]); new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> assert(new_encryption_tail_read.dynamic_cryptographic_iv[new_encryption_tail_at] == new_encryption_tail_written.dynamic_cryptographic_iv[new_encryption_tail_at]); new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> assert(new_encryption_tail_read.cryptographic_additional_key[new_encryption_tail_at] == new_encryption_tail_written.cryptographic_additional_key[new_encryption_tail_at]); new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Local Database Header Message: 2 bytes --------------------------- */

/* Opens the local database download */
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

/* Closes the local database download */
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

/* ---- Inner Header: 40 bytes -------------------------------------------------- */

/* INNER_MESSAGE_HEADER */
typedef InnerHeader {
  byte inner_trader_id[4];
  byte inner_log_time[4];
  byte inner_alpha_char[2];
  byte inner_transaction_code[2];
  byte inner_error_code[2];
  byte inner_timestamp[8];
  byte inner_time_stamp_1[8];
  byte inner_time_stamp_2[8];
  byte inner_message_length[2]
};

int inner_header_at;

/* every byte of Inner Header set to one value */
inline fill_inner_header(inner_header_record, inner_header_value) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_trader_id[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_log_time[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_alpha_char[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_transaction_code[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_error_code[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_timestamp[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_1[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_2[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_message_length[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Inner Header set to where it lies, so a field read out of place says so */
inline ramp_inner_header(inner_header_record, inner_header_base) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_trader_id[inner_header_at] = (inner_header_base + 0 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_log_time[inner_header_at] = (inner_header_base + 4 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_alpha_char[inner_header_at] = (inner_header_base + 8 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_transaction_code[inner_header_at] = (inner_header_base + 10 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_error_code[inner_header_at] = (inner_header_base + 12 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_timestamp[inner_header_at] = (inner_header_base + 14 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_1[inner_header_at] = (inner_header_base + 22 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_2[inner_header_at] = (inner_header_base + 30 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_message_length[inner_header_at] = (inner_header_base + 38 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  skip
}

/* Inner Header to the wire, 40 bytes from where the cursor stands */
inline encode_inner_header(inner_header_record) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> wire[at] = inner_header_record.inner_trader_id[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> wire[at] = inner_header_record.inner_log_time[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> wire[at] = inner_header_record.inner_alpha_char[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> wire[at] = inner_header_record.inner_transaction_code[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> wire[at] = inner_header_record.inner_error_code[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> wire[at] = inner_header_record.inner_timestamp[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> wire[at] = inner_header_record.inner_time_stamp_1[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> wire[at] = inner_header_record.inner_time_stamp_2[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> wire[at] = inner_header_record.inner_message_length[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  skip
}

/* Inner Header off the wire, 40 bytes from where the cursor stands */
inline decode_inner_header(inner_header_record) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_trader_id[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_log_time[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_alpha_char[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_transaction_code[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_error_code[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_timestamp[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_1[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_2[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_message_length[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Inner Header is what was written, byte for byte */
inline equal_inner_header(inner_header_read, inner_header_written) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> assert(inner_header_read.inner_trader_id[inner_header_at] == inner_header_written.inner_trader_id[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> assert(inner_header_read.inner_log_time[inner_header_at] == inner_header_written.inner_log_time[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> assert(inner_header_read.inner_alpha_char[inner_header_at] == inner_header_written.inner_alpha_char[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> assert(inner_header_read.inner_transaction_code[inner_header_at] == inner_header_written.inner_transaction_code[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> assert(inner_header_read.inner_error_code[inner_header_at] == inner_header_written.inner_error_code[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> assert(inner_header_read.inner_timestamp[inner_header_at] == inner_header_written.inner_timestamp[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> assert(inner_header_read.inner_time_stamp_1[inner_header_at] == inner_header_written.inner_time_stamp_1[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> assert(inner_header_read.inner_time_stamp_2[inner_header_at] == inner_header_written.inner_time_stamp_2[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> assert(inner_header_read.inner_message_length[inner_header_at] == inner_header_written.inner_message_length[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Contract Desc: 28 bytes ------------------------------------------------- */

/* CONTRACT_DESC */
typedef ContractDesc {
  byte instrument_name[6];
  byte symbol[10];
  byte expiry_date[4];
  byte strike_price[4];
  byte option_type[2];
  byte ca_level[2]
};

int contract_desc_at;

/* every byte of Contract Desc set to one value */
inline fill_contract_desc(contract_desc_record, contract_desc_value) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> contract_desc_record.instrument_name[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> contract_desc_record.symbol[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.expiry_date[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.strike_price[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.option_type[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.ca_level[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Contract Desc set to where it lies, so a field read out of place says so */
inline ramp_contract_desc(contract_desc_record, contract_desc_base) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> contract_desc_record.instrument_name[contract_desc_at] = (contract_desc_base + 0 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> contract_desc_record.symbol[contract_desc_at] = (contract_desc_base + 6 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.expiry_date[contract_desc_at] = (contract_desc_base + 16 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.strike_price[contract_desc_at] = (contract_desc_base + 20 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.option_type[contract_desc_at] = (contract_desc_base + 24 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.ca_level[contract_desc_at] = (contract_desc_base + 26 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Desc to the wire, 28 bytes from where the cursor stands */
inline encode_contract_desc(contract_desc_record) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> wire[at] = contract_desc_record.instrument_name[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> wire[at] = contract_desc_record.symbol[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> wire[at] = contract_desc_record.expiry_date[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> wire[at] = contract_desc_record.strike_price[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> wire[at] = contract_desc_record.option_type[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> wire[at] = contract_desc_record.ca_level[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Desc off the wire, 28 bytes from where the cursor stands */
inline decode_contract_desc(contract_desc_record) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> contract_desc_record.instrument_name[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> contract_desc_record.symbol[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.expiry_date[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.strike_price[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.option_type[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.ca_level[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Contract Desc is what was written, byte for byte */
inline equal_contract_desc(contract_desc_read, contract_desc_written) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> assert(contract_desc_read.instrument_name[contract_desc_at] == contract_desc_written.instrument_name[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> assert(contract_desc_read.symbol[contract_desc_at] == contract_desc_written.symbol[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> assert(contract_desc_read.expiry_date[contract_desc_at] == contract_desc_written.expiry_date[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> assert(contract_desc_read.strike_price[contract_desc_at] == contract_desc_written.strike_price[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> assert(contract_desc_read.option_type[contract_desc_at] == contract_desc_written.option_type[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> assert(contract_desc_read.ca_level[contract_desc_at] == contract_desc_written.ca_level[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Control Message To Trader Message: 249 bytes ---------------------------- */

/* Interactive message sent to the trader from Nse Control */
typedef ControlMessageToTraderMessage {
  byte trader_id[4];
  byte action_code[3];
  byte reserved_1;
  byte broad_cast_message_length[2];
  byte broad_cast_message[239]
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
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.broad_cast_message_length[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> control_message_to_trader_message_record.broad_cast_message[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
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
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.broad_cast_message_length[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 8 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> control_message_to_trader_message_record.broad_cast_message[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 10 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
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
  :: control_message_to_trader_message_at < 2 -> wire[at] = control_message_to_trader_message_record.broad_cast_message_length[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> wire[at] = control_message_to_trader_message_record.broad_cast_message[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
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
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.broad_cast_message_length[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> control_message_to_trader_message_record.broad_cast_message[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
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
  :: control_message_to_trader_message_at < 2 -> assert(control_message_to_trader_message_read.broad_cast_message_length[control_message_to_trader_message_at] == control_message_to_trader_message_written.broad_cast_message_length[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> assert(control_message_to_trader_message_read.broad_cast_message[control_message_to_trader_message_at] == control_message_to_trader_message_written.broad_cast_message[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Report Header Body: 67 bytes -------------------------------------------- */

/* Report Header Body */
typedef ReportHeaderBody {
  byte org_scope;
  byte report_date[4];
  byte user_type[2];
  byte broker_id[5];
  byte firm_name[25];
  byte trader_number[4];
  byte trader_name[26]
};

int report_header_body_at;

/* every byte of Report Header Body set to one value */
inline fill_report_header_body(report_header_body_record, report_header_body_value) {
  report_header_body_record.org_scope = report_header_body_value;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.report_date[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> report_header_body_record.user_type[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> report_header_body_record.broker_id[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> report_header_body_record.firm_name[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.trader_number[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> report_header_body_record.trader_name[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Report Header Body set to where it lies, so a field read out of place says so */
inline ramp_report_header_body(report_header_body_record, report_header_body_base) {
  report_header_body_record.org_scope = (report_header_body_base + 0 + 1) % 256;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.report_date[report_header_body_at] = (report_header_body_base + 1 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> report_header_body_record.user_type[report_header_body_at] = (report_header_body_base + 5 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> report_header_body_record.broker_id[report_header_body_at] = (report_header_body_base + 7 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> report_header_body_record.firm_name[report_header_body_at] = (report_header_body_base + 12 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.trader_number[report_header_body_at] = (report_header_body_base + 37 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> report_header_body_record.trader_name[report_header_body_at] = (report_header_body_base + 41 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Report Header Body to the wire, 67 bytes from where the cursor stands */
inline encode_report_header_body(report_header_body_record) {
  wire[at] = report_header_body_record.org_scope; at = at + 1;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> wire[at] = report_header_body_record.report_date[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> wire[at] = report_header_body_record.user_type[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> wire[at] = report_header_body_record.broker_id[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> wire[at] = report_header_body_record.firm_name[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> wire[at] = report_header_body_record.trader_number[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> wire[at] = report_header_body_record.trader_name[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Report Header Body off the wire, 67 bytes from where the cursor stands */
inline decode_report_header_body(report_header_body_record) {
  report_header_body_record.org_scope = wire[at]; at = at + 1;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.report_date[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> report_header_body_record.user_type[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> report_header_body_record.broker_id[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> report_header_body_record.firm_name[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.trader_number[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> report_header_body_record.trader_name[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Report Header Body is what was written, byte for byte */
inline equal_report_header_body(report_header_body_read, report_header_body_written) {
  assert(report_header_body_read.org_scope == report_header_body_written.org_scope);
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> assert(report_header_body_read.report_date[report_header_body_at] == report_header_body_written.report_date[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> assert(report_header_body_read.user_type[report_header_body_at] == report_header_body_written.user_type[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> assert(report_header_body_read.broker_id[report_header_body_at] == report_header_body_written.broker_id[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> assert(report_header_body_read.firm_name[report_header_body_at] == report_header_body_written.firm_name[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> assert(report_header_body_read.trader_number[report_header_body_at] == report_header_body_written.trader_number[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> assert(report_header_body_read.trader_name[report_header_body_at] == report_header_body_written.trader_name[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Report Trailer Body: 5 bytes -------------------------------------------- */

/* Report Trailer Body */
typedef ReportTrailerBody {
  byte number_of_packets[4];
  byte reserved_1
};

int report_trailer_body_at;

/* every byte of Report Trailer Body set to one value */
inline fill_report_trailer_body(report_trailer_body_record, report_trailer_body_value) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> report_trailer_body_record.number_of_packets[report_trailer_body_at] = report_trailer_body_value; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  report_trailer_body_record.reserved_1 = report_trailer_body_value;
  skip
}

/* each byte of Report Trailer Body set to where it lies, so a field read out of place says so */
inline ramp_report_trailer_body(report_trailer_body_record, report_trailer_body_base) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> report_trailer_body_record.number_of_packets[report_trailer_body_at] = (report_trailer_body_base + 0 + report_trailer_body_at + 1) % 256; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  report_trailer_body_record.reserved_1 = (report_trailer_body_base + 4 + 1) % 256;
  skip
}

/* Report Trailer Body to the wire, 5 bytes from where the cursor stands */
inline encode_report_trailer_body(report_trailer_body_record) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> wire[at] = report_trailer_body_record.number_of_packets[report_trailer_body_at]; at = at + 1; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  wire[at] = report_trailer_body_record.reserved_1; at = at + 1;
  skip
}

/* Report Trailer Body off the wire, 5 bytes from where the cursor stands */
inline decode_report_trailer_body(report_trailer_body_record) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> report_trailer_body_record.number_of_packets[report_trailer_body_at] = wire[at]; at = at + 1; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  report_trailer_body_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Report Trailer Body is what was written, byte for byte */
inline equal_report_trailer_body(report_trailer_body_read, report_trailer_body_written) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> assert(report_trailer_body_read.number_of_packets[report_trailer_body_at] == report_trailer_body_written.number_of_packets[report_trailer_body_at]); report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  assert(report_trailer_body_read.reserved_1 == report_trailer_body_written.reserved_1);
  skip
}

/* ---- Mkt Index: 10 bytes ----------------------------------------------------- */

/* MKT_INDEX */
typedef MktIndex {
  byte market_opening_index[2];
  byte market_high_index[2];
  byte market_low_index[2];
  byte market_closing_index[2];
  byte market_start_index[2]
};

int mkt_index_at;

/* every byte of Mkt Index set to one value */
inline fill_mkt_index(mkt_index_record, mkt_index_value) {
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_opening_index[mkt_index_at] = mkt_index_value; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_high_index[mkt_index_at] = mkt_index_value; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_low_index[mkt_index_at] = mkt_index_value; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_closing_index[mkt_index_at] = mkt_index_value; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_start_index[mkt_index_at] = mkt_index_value; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mkt Index set to where it lies, so a field read out of place says so */
inline ramp_mkt_index(mkt_index_record, mkt_index_base) {
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_opening_index[mkt_index_at] = (mkt_index_base + 0 + mkt_index_at + 1) % 256; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_high_index[mkt_index_at] = (mkt_index_base + 2 + mkt_index_at + 1) % 256; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_low_index[mkt_index_at] = (mkt_index_base + 4 + mkt_index_at + 1) % 256; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_closing_index[mkt_index_at] = (mkt_index_base + 6 + mkt_index_at + 1) % 256; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_start_index[mkt_index_at] = (mkt_index_base + 8 + mkt_index_at + 1) % 256; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  skip
}

/* Mkt Index to the wire, 10 bytes from where the cursor stands */
inline encode_mkt_index(mkt_index_record) {
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> wire[at] = mkt_index_record.market_opening_index[mkt_index_at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> wire[at] = mkt_index_record.market_high_index[mkt_index_at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> wire[at] = mkt_index_record.market_low_index[mkt_index_at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> wire[at] = mkt_index_record.market_closing_index[mkt_index_at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> wire[at] = mkt_index_record.market_start_index[mkt_index_at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  skip
}

/* Mkt Index off the wire, 10 bytes from where the cursor stands */
inline decode_mkt_index(mkt_index_record) {
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_opening_index[mkt_index_at] = wire[at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_high_index[mkt_index_at] = wire[at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_low_index[mkt_index_at] = wire[at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_closing_index[mkt_index_at] = wire[at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> mkt_index_record.market_start_index[mkt_index_at] = wire[at]; at = at + 1; mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mkt Index is what was written, byte for byte */
inline equal_mkt_index(mkt_index_read, mkt_index_written) {
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> assert(mkt_index_read.market_opening_index[mkt_index_at] == mkt_index_written.market_opening_index[mkt_index_at]); mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> assert(mkt_index_read.market_high_index[mkt_index_at] == mkt_index_written.market_high_index[mkt_index_at]); mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> assert(mkt_index_read.market_low_index[mkt_index_at] == mkt_index_written.market_low_index[mkt_index_at]); mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> assert(mkt_index_read.market_closing_index[mkt_index_at] == mkt_index_written.market_closing_index[mkt_index_at]); mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  mkt_index_at = 0;
  do
  :: mkt_index_at < 2 -> assert(mkt_index_read.market_start_index[mkt_index_at] == mkt_index_written.market_start_index[mkt_index_at]); mkt_index_at = mkt_index_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Index Report Message: 26 bytes ----------------------------------- */

/* Bhavcopy market index report */
typedef MarketIndexReportMessage {
  byte message_type;
  byte index_name[15];
  MktIndex mkt_index
};

int market_index_report_message_at;

/* every byte of Market Index Report Message set to one value */
inline fill_market_index_report_message(market_index_report_message_record, market_index_report_message_value) {
  market_index_report_message_record.message_type = market_index_report_message_value;
  market_index_report_message_at = 0;
  do
  :: market_index_report_message_at < 15 -> market_index_report_message_record.index_name[market_index_report_message_at] = market_index_report_message_value; market_index_report_message_at = market_index_report_message_at + 1
  :: else -> break
  od;
  fill_mkt_index(market_index_report_message_record.mkt_index, market_index_report_message_value);
  skip
}

/* each byte of Market Index Report Message set to where it lies, so a field read out of place says so */
inline ramp_market_index_report_message(market_index_report_message_record, market_index_report_message_base) {
  market_index_report_message_record.message_type = (market_index_report_message_base + 0 + 1) % 256;
  market_index_report_message_at = 0;
  do
  :: market_index_report_message_at < 15 -> market_index_report_message_record.index_name[market_index_report_message_at] = (market_index_report_message_base + 1 + market_index_report_message_at + 1) % 256; market_index_report_message_at = market_index_report_message_at + 1
  :: else -> break
  od;
  ramp_mkt_index(market_index_report_message_record.mkt_index, market_index_report_message_base + 16);
  skip
}

/* Market Index Report Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_index_report_message(market_index_report_message_record) {
  wire[at] = market_index_report_message_record.message_type; at = at + 1;
  market_index_report_message_at = 0;
  do
  :: market_index_report_message_at < 15 -> wire[at] = market_index_report_message_record.index_name[market_index_report_message_at]; at = at + 1; market_index_report_message_at = market_index_report_message_at + 1
  :: else -> break
  od;
  encode_mkt_index(market_index_report_message_record.mkt_index);
  skip
}

/* Market Index Report Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_index_report_message(market_index_report_message_record) {
  market_index_report_message_record.message_type = wire[at]; at = at + 1;
  market_index_report_message_at = 0;
  do
  :: market_index_report_message_at < 15 -> market_index_report_message_record.index_name[market_index_report_message_at] = wire[at]; at = at + 1; market_index_report_message_at = market_index_report_message_at + 1
  :: else -> break
  od;
  decode_mkt_index(market_index_report_message_record.mkt_index);
  skip
}

/* what was read of Market Index Report Message is what was written, byte for byte */
inline equal_market_index_report_message(market_index_report_message_read, market_index_report_message_written) {
  assert(market_index_report_message_read.message_type == market_index_report_message_written.message_type);
  market_index_report_message_at = 0;
  do
  :: market_index_report_message_at < 15 -> assert(market_index_report_message_read.index_name[market_index_report_message_at] == market_index_report_message_written.index_name[market_index_report_message_at]); market_index_report_message_at = market_index_report_message_at + 1
  :: else -> break
  od;
  equal_mkt_index(market_index_report_message_read.mkt_index, market_index_report_message_written.mkt_index);
  skip
}

/* ---- Spread Report Header Body: 67 bytes ------------------------------------- */

/* Spread Report Header Body */
typedef SpreadReportHeaderBody {
  byte org_scope;
  byte report_date[4];
  byte user_type[2];
  byte broker_number[5];
  byte broker_name[25];
  byte trader_number[4];
  byte trader_name[26]
};

int spread_report_header_body_at;

/* every byte of Spread Report Header Body set to one value */
inline fill_spread_report_header_body(spread_report_header_body_record, spread_report_header_body_value) {
  spread_report_header_body_record.org_scope = spread_report_header_body_value;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.report_date[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> spread_report_header_body_record.user_type[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> spread_report_header_body_record.broker_number[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> spread_report_header_body_record.broker_name[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.trader_number[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> spread_report_header_body_record.trader_name[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spread Report Header Body set to where it lies, so a field read out of place says so */
inline ramp_spread_report_header_body(spread_report_header_body_record, spread_report_header_body_base) {
  spread_report_header_body_record.org_scope = (spread_report_header_body_base + 0 + 1) % 256;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.report_date[spread_report_header_body_at] = (spread_report_header_body_base + 1 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> spread_report_header_body_record.user_type[spread_report_header_body_at] = (spread_report_header_body_base + 5 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> spread_report_header_body_record.broker_number[spread_report_header_body_at] = (spread_report_header_body_base + 7 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> spread_report_header_body_record.broker_name[spread_report_header_body_at] = (spread_report_header_body_base + 12 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.trader_number[spread_report_header_body_at] = (spread_report_header_body_base + 37 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> spread_report_header_body_record.trader_name[spread_report_header_body_at] = (spread_report_header_body_base + 41 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Report Header Body to the wire, 67 bytes from where the cursor stands */
inline encode_spread_report_header_body(spread_report_header_body_record) {
  wire[at] = spread_report_header_body_record.org_scope; at = at + 1;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> wire[at] = spread_report_header_body_record.report_date[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> wire[at] = spread_report_header_body_record.user_type[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> wire[at] = spread_report_header_body_record.broker_number[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> wire[at] = spread_report_header_body_record.broker_name[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> wire[at] = spread_report_header_body_record.trader_number[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> wire[at] = spread_report_header_body_record.trader_name[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Report Header Body off the wire, 67 bytes from where the cursor stands */
inline decode_spread_report_header_body(spread_report_header_body_record) {
  spread_report_header_body_record.org_scope = wire[at]; at = at + 1;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.report_date[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> spread_report_header_body_record.user_type[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> spread_report_header_body_record.broker_number[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> spread_report_header_body_record.broker_name[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.trader_number[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> spread_report_header_body_record.trader_name[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spread Report Header Body is what was written, byte for byte */
inline equal_spread_report_header_body(spread_report_header_body_read, spread_report_header_body_written) {
  assert(spread_report_header_body_read.org_scope == spread_report_header_body_written.org_scope);
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> assert(spread_report_header_body_read.report_date[spread_report_header_body_at] == spread_report_header_body_written.report_date[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> assert(spread_report_header_body_read.user_type[spread_report_header_body_at] == spread_report_header_body_written.user_type[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> assert(spread_report_header_body_read.broker_number[spread_report_header_body_at] == spread_report_header_body_written.broker_number[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> assert(spread_report_header_body_read.broker_name[spread_report_header_body_at] == spread_report_header_body_written.broker_name[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> assert(spread_report_header_body_read.trader_number[spread_report_header_body_at] == spread_report_header_body_written.trader_number[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> assert(spread_report_header_body_read.trader_name[spread_report_header_body_at] == spread_report_header_body_written.trader_name[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Details: 98 bytes ------------------------------------------------- */

/* INDEX_DETAILS */
typedef IndexDetails {
  byte token[4];
  byte name[50];
  byte open[4];
  byte high[4];
  byte low[4];
  byte last[4];
  byte close[4];
  byte prev_close[4];
  byte life_high[4];
  byte life_low[4];
  byte filler_4[4];
  byte filler_2[4];
  byte filler_3[4]
};

int index_details_at;

/* every byte of Index Details set to one value */
inline fill_index_details(index_details_record, index_details_value) {
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.token[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 50 -> index_details_record.name[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.open[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.high[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.low[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.last[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.close[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.prev_close[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.life_high[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.life_low[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.filler_4[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.filler_2[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.filler_3[index_details_at] = index_details_value; index_details_at = index_details_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Details set to where it lies, so a field read out of place says so */
inline ramp_index_details(index_details_record, index_details_base) {
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.token[index_details_at] = (index_details_base + 0 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 50 -> index_details_record.name[index_details_at] = (index_details_base + 4 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.open[index_details_at] = (index_details_base + 54 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.high[index_details_at] = (index_details_base + 58 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.low[index_details_at] = (index_details_base + 62 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.last[index_details_at] = (index_details_base + 66 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.close[index_details_at] = (index_details_base + 70 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.prev_close[index_details_at] = (index_details_base + 74 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.life_high[index_details_at] = (index_details_base + 78 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.life_low[index_details_at] = (index_details_base + 82 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.filler_4[index_details_at] = (index_details_base + 86 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.filler_2[index_details_at] = (index_details_base + 90 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.filler_3[index_details_at] = (index_details_base + 94 + index_details_at + 1) % 256; index_details_at = index_details_at + 1
  :: else -> break
  od;
  skip
}

/* Index Details to the wire, 98 bytes from where the cursor stands */
inline encode_index_details(index_details_record) {
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.token[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 50 -> wire[at] = index_details_record.name[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.open[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.high[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.low[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.last[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.close[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.prev_close[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.life_high[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.life_low[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.filler_4[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.filler_2[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> wire[at] = index_details_record.filler_3[index_details_at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  skip
}

/* Index Details off the wire, 98 bytes from where the cursor stands */
inline decode_index_details(index_details_record) {
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.token[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 50 -> index_details_record.name[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.open[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.high[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.low[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.last[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.close[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.prev_close[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.life_high[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.life_low[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.filler_4[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.filler_2[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> index_details_record.filler_3[index_details_at] = wire[at]; at = at + 1; index_details_at = index_details_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Details is what was written, byte for byte */
inline equal_index_details(index_details_read, index_details_written) {
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.token[index_details_at] == index_details_written.token[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 50 -> assert(index_details_read.name[index_details_at] == index_details_written.name[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.open[index_details_at] == index_details_written.open[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.high[index_details_at] == index_details_written.high[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.low[index_details_at] == index_details_written.low[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.last[index_details_at] == index_details_written.last[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.close[index_details_at] == index_details_written.close[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.prev_close[index_details_at] == index_details_written.prev_close[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.life_high[index_details_at] == index_details_written.life_high[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.life_low[index_details_at] == index_details_written.life_low[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.filler_4[index_details_at] == index_details_written.filler_4[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.filler_2[index_details_at] == index_details_written.filler_2[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  index_details_at = 0;
  do
  :: index_details_at < 4 -> assert(index_details_read.filler_3[index_details_at] == index_details_written.filler_3[index_details_at]); index_details_at = index_details_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Global Indices Message: 98 bytes ---------------------------------------- */

/* Carries the values of a global index */
typedef GlobalIndicesMessage {
  IndexDetails index_details
};

/* every byte of Global Indices Message set to one value */
inline fill_global_indices_message(global_indices_message_record, global_indices_message_value) {
  fill_index_details(global_indices_message_record.index_details, global_indices_message_value);
  skip
}

/* each byte of Global Indices Message set to where it lies, so a field read out of place says so */
inline ramp_global_indices_message(global_indices_message_record, global_indices_message_base) {
  ramp_index_details(global_indices_message_record.index_details, global_indices_message_base + 0);
  skip
}

/* Global Indices Message to the wire, 98 bytes from where the cursor stands */
inline encode_global_indices_message(global_indices_message_record) {
  encode_index_details(global_indices_message_record.index_details);
  skip
}

/* Global Indices Message off the wire, 98 bytes from where the cursor stands */
inline decode_global_indices_message(global_indices_message_record) {
  decode_index_details(global_indices_message_record.index_details);
  skip
}

/* what was read of Global Indices Message is what was written, byte for byte */
inline equal_global_indices_message(global_indices_message_read, global_indices_message_written) {
  equal_index_details(global_indices_message_read.index_details, global_indices_message_written.index_details);
  skip
}

/* ---- Box Sign On Request Out Message: 12 bytes ------------------------------- */

/* Confirms the box sign on */
typedef BoxSignOnRequestOutMessage {
  byte box_id[2];
  byte reserved_10[10]
};

int box_sign_on_request_out_message_at;

/* every byte of Box Sign On Request Out Message set to one value */
inline fill_box_sign_on_request_out_message(box_sign_on_request_out_message_record, box_sign_on_request_out_message_value) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> box_sign_on_request_out_message_record.box_id[box_sign_on_request_out_message_at] = box_sign_on_request_out_message_value; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> box_sign_on_request_out_message_record.reserved_10[box_sign_on_request_out_message_at] = box_sign_on_request_out_message_value; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign On Request Out Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_on_request_out_message(box_sign_on_request_out_message_record, box_sign_on_request_out_message_base) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> box_sign_on_request_out_message_record.box_id[box_sign_on_request_out_message_at] = (box_sign_on_request_out_message_base + 0 + box_sign_on_request_out_message_at + 1) % 256; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> box_sign_on_request_out_message_record.reserved_10[box_sign_on_request_out_message_at] = (box_sign_on_request_out_message_base + 2 + box_sign_on_request_out_message_at + 1) % 256; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request Out Message to the wire, 12 bytes from where the cursor stands */
inline encode_box_sign_on_request_out_message(box_sign_on_request_out_message_record) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> wire[at] = box_sign_on_request_out_message_record.box_id[box_sign_on_request_out_message_at]; at = at + 1; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> wire[at] = box_sign_on_request_out_message_record.reserved_10[box_sign_on_request_out_message_at]; at = at + 1; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request Out Message off the wire, 12 bytes from where the cursor stands */
inline decode_box_sign_on_request_out_message(box_sign_on_request_out_message_record) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> box_sign_on_request_out_message_record.box_id[box_sign_on_request_out_message_at] = wire[at]; at = at + 1; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> box_sign_on_request_out_message_record.reserved_10[box_sign_on_request_out_message_at] = wire[at]; at = at + 1; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign On Request Out Message is what was written, byte for byte */
inline equal_box_sign_on_request_out_message(box_sign_on_request_out_message_read, box_sign_on_request_out_message_written) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> assert(box_sign_on_request_out_message_read.box_id[box_sign_on_request_out_message_at] == box_sign_on_request_out_message_written.box_id[box_sign_on_request_out_message_at]); box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> assert(box_sign_on_request_out_message_read.reserved_10[box_sign_on_request_out_message_at] == box_sign_on_request_out_message_written.reserved_10[box_sign_on_request_out_message_at]); box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Contingency Broadcast Message: 204 bytes -------------------------------- */

/* Signals the start or end of an outage on one or all matching engine streams */
typedef ContingencyBroadcastMessage {
  byte stream_number[2];
  byte status[2];
  byte reserved_200[200]
};

int contingency_broadcast_message_at;

/* every byte of Contingency Broadcast Message set to one value */
inline fill_contingency_broadcast_message(contingency_broadcast_message_record, contingency_broadcast_message_value) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at] = contingency_broadcast_message_value; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.status[contingency_broadcast_message_at] = contingency_broadcast_message_value; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at] = contingency_broadcast_message_value; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Contingency Broadcast Message set to where it lies, so a field read out of place says so */
inline ramp_contingency_broadcast_message(contingency_broadcast_message_record, contingency_broadcast_message_base) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at] = (contingency_broadcast_message_base + 0 + contingency_broadcast_message_at + 1) % 256; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.status[contingency_broadcast_message_at] = (contingency_broadcast_message_base + 2 + contingency_broadcast_message_at + 1) % 256; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at] = (contingency_broadcast_message_base + 4 + contingency_broadcast_message_at + 1) % 256; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* Contingency Broadcast Message to the wire, 204 bytes from where the cursor stands */
inline encode_contingency_broadcast_message(contingency_broadcast_message_record) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> wire[at] = contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> wire[at] = contingency_broadcast_message_record.status[contingency_broadcast_message_at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> wire[at] = contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* Contingency Broadcast Message off the wire, 204 bytes from where the cursor stands */
inline decode_contingency_broadcast_message(contingency_broadcast_message_record) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at] = wire[at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.status[contingency_broadcast_message_at] = wire[at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at] = wire[at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Contingency Broadcast Message is what was written, byte for byte */
inline equal_contingency_broadcast_message(contingency_broadcast_message_read, contingency_broadcast_message_written) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> assert(contingency_broadcast_message_read.stream_number[contingency_broadcast_message_at] == contingency_broadcast_message_written.stream_number[contingency_broadcast_message_at]); contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> assert(contingency_broadcast_message_read.status[contingency_broadcast_message_at] == contingency_broadcast_message_written.status[contingency_broadcast_message_at]); contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> assert(contingency_broadcast_message_read.reserved_200[contingency_broadcast_message_at] == contingency_broadcast_message_written.reserved_200[contingency_broadcast_message_at]); contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Collateral User Status Change Response Message: 6 bytes ----------------- */

/* Confirms the collateral status change */
typedef CollateralUserStatusChangeResponseMessage {
  byte user_id[4];
  byte col_user_bit;
  byte reserved_1
};

int collateral_user_status_change_response_message_at;

/* every byte of Collateral User Status Change Response Message set to one value */
inline fill_collateral_user_status_change_response_message(collateral_user_status_change_response_message_record, collateral_user_status_change_response_message_value) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> collateral_user_status_change_response_message_record.user_id[collateral_user_status_change_response_message_at] = collateral_user_status_change_response_message_value; collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  collateral_user_status_change_response_message_record.col_user_bit = collateral_user_status_change_response_message_value;
  collateral_user_status_change_response_message_record.reserved_1 = collateral_user_status_change_response_message_value;
  skip
}

/* each byte of Collateral User Status Change Response Message set to where it lies, so a field read out of place says so */
inline ramp_collateral_user_status_change_response_message(collateral_user_status_change_response_message_record, collateral_user_status_change_response_message_base) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> collateral_user_status_change_response_message_record.user_id[collateral_user_status_change_response_message_at] = (collateral_user_status_change_response_message_base + 0 + collateral_user_status_change_response_message_at + 1) % 256; collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  collateral_user_status_change_response_message_record.col_user_bit = (collateral_user_status_change_response_message_base + 4 + 1) % 256;
  collateral_user_status_change_response_message_record.reserved_1 = (collateral_user_status_change_response_message_base + 5 + 1) % 256;
  skip
}

/* Collateral User Status Change Response Message to the wire, 6 bytes from where the cursor stands */
inline encode_collateral_user_status_change_response_message(collateral_user_status_change_response_message_record) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> wire[at] = collateral_user_status_change_response_message_record.user_id[collateral_user_status_change_response_message_at]; at = at + 1; collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  wire[at] = collateral_user_status_change_response_message_record.col_user_bit; at = at + 1;
  wire[at] = collateral_user_status_change_response_message_record.reserved_1; at = at + 1;
  skip
}

/* Collateral User Status Change Response Message off the wire, 6 bytes from where the cursor stands */
inline decode_collateral_user_status_change_response_message(collateral_user_status_change_response_message_record) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> collateral_user_status_change_response_message_record.user_id[collateral_user_status_change_response_message_at] = wire[at]; at = at + 1; collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  collateral_user_status_change_response_message_record.col_user_bit = wire[at]; at = at + 1;
  collateral_user_status_change_response_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Collateral User Status Change Response Message is what was written, byte for byte */
inline equal_collateral_user_status_change_response_message(collateral_user_status_change_response_message_read, collateral_user_status_change_response_message_written) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> assert(collateral_user_status_change_response_message_read.user_id[collateral_user_status_change_response_message_at] == collateral_user_status_change_response_message_written.user_id[collateral_user_status_change_response_message_at]); collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  assert(collateral_user_status_change_response_message_read.col_user_bit == collateral_user_status_change_response_message_written.col_user_bit);
  assert(collateral_user_status_change_response_message_read.reserved_1 == collateral_user_status_change_response_message_written.reserved_1);
  skip
}

/* ---- User Trade Modify Cancel Status Change Response Message: 6 bytes -------- */

/* Confirms the trade modify and cancel permission change */
typedef UserTradeModifyCancelStatusChangeResponseMessage {
  byte user_id[4];
  byte trd_mod_cxl_bit;
  byte reserved_1
};

int user_trade_modify_cancel_status_change_response_message_at;

/* every byte of User Trade Modify Cancel Status Change Response Message set to one value */
inline fill_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_record, user_trade_modify_cancel_status_change_response_message_value) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> user_trade_modify_cancel_status_change_response_message_record.user_id[user_trade_modify_cancel_status_change_response_message_at] = user_trade_modify_cancel_status_change_response_message_value; user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  user_trade_modify_cancel_status_change_response_message_record.trd_mod_cxl_bit = user_trade_modify_cancel_status_change_response_message_value;
  user_trade_modify_cancel_status_change_response_message_record.reserved_1 = user_trade_modify_cancel_status_change_response_message_value;
  skip
}

/* each byte of User Trade Modify Cancel Status Change Response Message set to where it lies, so a field read out of place says so */
inline ramp_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_record, user_trade_modify_cancel_status_change_response_message_base) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> user_trade_modify_cancel_status_change_response_message_record.user_id[user_trade_modify_cancel_status_change_response_message_at] = (user_trade_modify_cancel_status_change_response_message_base + 0 + user_trade_modify_cancel_status_change_response_message_at + 1) % 256; user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  user_trade_modify_cancel_status_change_response_message_record.trd_mod_cxl_bit = (user_trade_modify_cancel_status_change_response_message_base + 4 + 1) % 256;
  user_trade_modify_cancel_status_change_response_message_record.reserved_1 = (user_trade_modify_cancel_status_change_response_message_base + 5 + 1) % 256;
  skip
}

/* User Trade Modify Cancel Status Change Response Message to the wire, 6 bytes from where the cursor stands */
inline encode_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_record) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> wire[at] = user_trade_modify_cancel_status_change_response_message_record.user_id[user_trade_modify_cancel_status_change_response_message_at]; at = at + 1; user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  wire[at] = user_trade_modify_cancel_status_change_response_message_record.trd_mod_cxl_bit; at = at + 1;
  wire[at] = user_trade_modify_cancel_status_change_response_message_record.reserved_1; at = at + 1;
  skip
}

/* User Trade Modify Cancel Status Change Response Message off the wire, 6 bytes from where the cursor stands */
inline decode_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_record) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> user_trade_modify_cancel_status_change_response_message_record.user_id[user_trade_modify_cancel_status_change_response_message_at] = wire[at]; at = at + 1; user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  user_trade_modify_cancel_status_change_response_message_record.trd_mod_cxl_bit = wire[at]; at = at + 1;
  user_trade_modify_cancel_status_change_response_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of User Trade Modify Cancel Status Change Response Message is what was written, byte for byte */
inline equal_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_read, user_trade_modify_cancel_status_change_response_message_written) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> assert(user_trade_modify_cancel_status_change_response_message_read.user_id[user_trade_modify_cancel_status_change_response_message_at] == user_trade_modify_cancel_status_change_response_message_written.user_id[user_trade_modify_cancel_status_change_response_message_at]); user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  assert(user_trade_modify_cancel_status_change_response_message_read.trd_mod_cxl_bit == user_trade_modify_cancel_status_change_response_message_written.trd_mod_cxl_bit);
  assert(user_trade_modify_cancel_status_change_response_message_read.reserved_1 == user_trade_modify_cancel_status_change_response_message_written.reserved_1);
  skip
}

/* ---- User Address Unlock Confirm Message: 40 bytes --------------------------- */

/* Confirms that the unlock request was received */
typedef UserAddressUnlockConfirmMessage {
  byte user_id[4];
  byte reserved_36[36]
};

int user_address_unlock_confirm_message_at;

/* every byte of User Address Unlock Confirm Message set to one value */
inline fill_user_address_unlock_confirm_message(user_address_unlock_confirm_message_record, user_address_unlock_confirm_message_value) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> user_address_unlock_confirm_message_record.user_id[user_address_unlock_confirm_message_at] = user_address_unlock_confirm_message_value; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> user_address_unlock_confirm_message_record.reserved_36[user_address_unlock_confirm_message_at] = user_address_unlock_confirm_message_value; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Address Unlock Confirm Message set to where it lies, so a field read out of place says so */
inline ramp_user_address_unlock_confirm_message(user_address_unlock_confirm_message_record, user_address_unlock_confirm_message_base) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> user_address_unlock_confirm_message_record.user_id[user_address_unlock_confirm_message_at] = (user_address_unlock_confirm_message_base + 0 + user_address_unlock_confirm_message_at + 1) % 256; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> user_address_unlock_confirm_message_record.reserved_36[user_address_unlock_confirm_message_at] = (user_address_unlock_confirm_message_base + 4 + user_address_unlock_confirm_message_at + 1) % 256; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Confirm Message to the wire, 40 bytes from where the cursor stands */
inline encode_user_address_unlock_confirm_message(user_address_unlock_confirm_message_record) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> wire[at] = user_address_unlock_confirm_message_record.user_id[user_address_unlock_confirm_message_at]; at = at + 1; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> wire[at] = user_address_unlock_confirm_message_record.reserved_36[user_address_unlock_confirm_message_at]; at = at + 1; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Confirm Message off the wire, 40 bytes from where the cursor stands */
inline decode_user_address_unlock_confirm_message(user_address_unlock_confirm_message_record) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> user_address_unlock_confirm_message_record.user_id[user_address_unlock_confirm_message_at] = wire[at]; at = at + 1; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> user_address_unlock_confirm_message_record.reserved_36[user_address_unlock_confirm_message_at] = wire[at]; at = at + 1; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Address Unlock Confirm Message is what was written, byte for byte */
inline equal_user_address_unlock_confirm_message(user_address_unlock_confirm_message_read, user_address_unlock_confirm_message_written) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> assert(user_address_unlock_confirm_message_read.user_id[user_address_unlock_confirm_message_at] == user_address_unlock_confirm_message_written.user_id[user_address_unlock_confirm_message_at]); user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> assert(user_address_unlock_confirm_message_read.reserved_36[user_address_unlock_confirm_message_at] == user_address_unlock_confirm_message_written.reserved_36[user_address_unlock_confirm_message_at]); user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- User Address Unlock Approve Message: 40 bytes --------------------------- */

/* Approves the unlock of a user address */
typedef UserAddressUnlockApproveMessage {
  byte user_id[4];
  byte reserved_36[36]
};

int user_address_unlock_approve_message_at;

/* every byte of User Address Unlock Approve Message set to one value */
inline fill_user_address_unlock_approve_message(user_address_unlock_approve_message_record, user_address_unlock_approve_message_value) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> user_address_unlock_approve_message_record.user_id[user_address_unlock_approve_message_at] = user_address_unlock_approve_message_value; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> user_address_unlock_approve_message_record.reserved_36[user_address_unlock_approve_message_at] = user_address_unlock_approve_message_value; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Address Unlock Approve Message set to where it lies, so a field read out of place says so */
inline ramp_user_address_unlock_approve_message(user_address_unlock_approve_message_record, user_address_unlock_approve_message_base) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> user_address_unlock_approve_message_record.user_id[user_address_unlock_approve_message_at] = (user_address_unlock_approve_message_base + 0 + user_address_unlock_approve_message_at + 1) % 256; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> user_address_unlock_approve_message_record.reserved_36[user_address_unlock_approve_message_at] = (user_address_unlock_approve_message_base + 4 + user_address_unlock_approve_message_at + 1) % 256; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Approve Message to the wire, 40 bytes from where the cursor stands */
inline encode_user_address_unlock_approve_message(user_address_unlock_approve_message_record) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> wire[at] = user_address_unlock_approve_message_record.user_id[user_address_unlock_approve_message_at]; at = at + 1; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> wire[at] = user_address_unlock_approve_message_record.reserved_36[user_address_unlock_approve_message_at]; at = at + 1; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Approve Message off the wire, 40 bytes from where the cursor stands */
inline decode_user_address_unlock_approve_message(user_address_unlock_approve_message_record) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> user_address_unlock_approve_message_record.user_id[user_address_unlock_approve_message_at] = wire[at]; at = at + 1; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> user_address_unlock_approve_message_record.reserved_36[user_address_unlock_approve_message_at] = wire[at]; at = at + 1; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Address Unlock Approve Message is what was written, byte for byte */
inline equal_user_address_unlock_approve_message(user_address_unlock_approve_message_read, user_address_unlock_approve_message_written) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> assert(user_address_unlock_approve_message_read.user_id[user_address_unlock_approve_message_at] == user_address_unlock_approve_message_written.user_id[user_address_unlock_approve_message_at]); user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> assert(user_address_unlock_approve_message_read.reserved_36[user_address_unlock_approve_message_at] == user_address_unlock_approve_message_written.reserved_36[user_address_unlock_approve_message_at]); user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
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

/* Sign Off Request Out Message: encoded, read back, and compared */
proctype check_sign_off_request_out_message() {
  SignOffRequestOutMessage sign_off_request_out_message_sent;
  SignOffRequestOutMessage sign_off_request_out_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sign_off_request_out_message(sign_off_request_out_message_sent, 0)
  :: pattern == 1 -> fill_sign_off_request_out_message(sign_off_request_out_message_sent, 32)
  :: pattern == 2 -> fill_sign_off_request_out_message(sign_off_request_out_message_sent, 255)
  :: else -> ramp_sign_off_request_out_message(sign_off_request_out_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sign_off_request_out_message(sign_off_request_out_message_sent);
    assert(at == 149);
    at = 0;
    decode_sign_off_request_out_message(sign_off_request_out_message_got);
    assert(at == 149);
    equal_sign_off_request_out_message(sign_off_request_out_message_got, sign_off_request_out_message_sent)
  }
}

/* St Market Status: encoded, read back, and compared */
proctype check_st_market_status() {
  StMarketStatus st_market_status_sent;
  StMarketStatus st_market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_market_status(st_market_status_sent, 0)
  :: pattern == 1 -> fill_st_market_status(st_market_status_sent, 32)
  :: pattern == 2 -> fill_st_market_status(st_market_status_sent, 255)
  :: else -> ramp_st_market_status(st_market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_market_status(st_market_status_sent);
    assert(at == 8);
    at = 0;
    decode_st_market_status(st_market_status_got);
    assert(at == 8);
    equal_st_market_status(st_market_status_got, st_market_status_sent)
  }
}

/* St Ex Market Status: encoded, read back, and compared */
proctype check_st_ex_market_status() {
  StExMarketStatus st_ex_market_status_sent;
  StExMarketStatus st_ex_market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_ex_market_status(st_ex_market_status_sent, 0)
  :: pattern == 1 -> fill_st_ex_market_status(st_ex_market_status_sent, 32)
  :: pattern == 2 -> fill_st_ex_market_status(st_ex_market_status_sent, 255)
  :: else -> ramp_st_ex_market_status(st_ex_market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_ex_market_status(st_ex_market_status_sent);
    assert(at == 8);
    at = 0;
    decode_st_ex_market_status(st_ex_market_status_got);
    assert(at == 8);
    equal_st_ex_market_status(st_ex_market_status_got, st_ex_market_status_sent)
  }
}

/* St Pl Market Status: encoded, read back, and compared */
proctype check_st_pl_market_status() {
  StPlMarketStatus st_pl_market_status_sent;
  StPlMarketStatus st_pl_market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_pl_market_status(st_pl_market_status_sent, 0)
  :: pattern == 1 -> fill_st_pl_market_status(st_pl_market_status_sent, 32)
  :: pattern == 2 -> fill_st_pl_market_status(st_pl_market_status_sent, 255)
  :: else -> ramp_st_pl_market_status(st_pl_market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_pl_market_status(st_pl_market_status_sent);
    assert(at == 8);
    at = 0;
    decode_st_pl_market_status(st_pl_market_status_got);
    assert(at == 8);
    equal_st_pl_market_status(st_pl_market_status_got, st_pl_market_status_sent)
  }
}

/* Existing Encryption Tail: encoded, read back, and compared */
proctype check_existing_encryption_tail() {
  ExistingEncryptionTail existing_encryption_tail_sent;
  ExistingEncryptionTail existing_encryption_tail_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_existing_encryption_tail(existing_encryption_tail_sent, 0)
  :: pattern == 1 -> fill_existing_encryption_tail(existing_encryption_tail_sent, 32)
  :: pattern == 2 -> fill_existing_encryption_tail(existing_encryption_tail_sent, 255)
  :: else -> ramp_existing_encryption_tail(existing_encryption_tail_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_existing_encryption_tail(existing_encryption_tail_sent);
    assert(at == 16);
    at = 0;
    decode_existing_encryption_tail(existing_encryption_tail_got);
    assert(at == 16);
    equal_existing_encryption_tail(existing_encryption_tail_got, existing_encryption_tail_sent)
  }
}

/* New Encryption Tail: encoded, read back, and compared */
proctype check_new_encryption_tail() {
  NewEncryptionTail new_encryption_tail_sent;
  NewEncryptionTail new_encryption_tail_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_encryption_tail(new_encryption_tail_sent, 0)
  :: pattern == 1 -> fill_new_encryption_tail(new_encryption_tail_sent, 32)
  :: pattern == 2 -> fill_new_encryption_tail(new_encryption_tail_sent, 255)
  :: else -> ramp_new_encryption_tail(new_encryption_tail_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_encryption_tail(new_encryption_tail_sent);
    assert(at == 28);
    at = 0;
    decode_new_encryption_tail(new_encryption_tail_got);
    assert(at == 28);
    equal_new_encryption_tail(new_encryption_tail_got, new_encryption_tail_sent)
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

/* Inner Header: encoded, read back, and compared */
proctype check_inner_header() {
  InnerHeader inner_header_sent;
  InnerHeader inner_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_inner_header(inner_header_sent, 0)
  :: pattern == 1 -> fill_inner_header(inner_header_sent, 32)
  :: pattern == 2 -> fill_inner_header(inner_header_sent, 255)
  :: else -> ramp_inner_header(inner_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_inner_header(inner_header_sent);
    assert(at == 40);
    at = 0;
    decode_inner_header(inner_header_got);
    assert(at == 40);
    equal_inner_header(inner_header_got, inner_header_sent)
  }
}

/* Contract Desc: encoded, read back, and compared */
proctype check_contract_desc() {
  ContractDesc contract_desc_sent;
  ContractDesc contract_desc_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_desc(contract_desc_sent, 0)
  :: pattern == 1 -> fill_contract_desc(contract_desc_sent, 32)
  :: pattern == 2 -> fill_contract_desc(contract_desc_sent, 255)
  :: else -> ramp_contract_desc(contract_desc_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_desc(contract_desc_sent);
    assert(at == 28);
    at = 0;
    decode_contract_desc(contract_desc_got);
    assert(at == 28);
    equal_contract_desc(contract_desc_got, contract_desc_sent)
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

/* Report Header Body: encoded, read back, and compared */
proctype check_report_header_body() {
  ReportHeaderBody report_header_body_sent;
  ReportHeaderBody report_header_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_report_header_body(report_header_body_sent, 0)
  :: pattern == 1 -> fill_report_header_body(report_header_body_sent, 32)
  :: pattern == 2 -> fill_report_header_body(report_header_body_sent, 255)
  :: else -> ramp_report_header_body(report_header_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_report_header_body(report_header_body_sent);
    assert(at == 67);
    at = 0;
    decode_report_header_body(report_header_body_got);
    assert(at == 67);
    equal_report_header_body(report_header_body_got, report_header_body_sent)
  }
}

/* Report Trailer Body: encoded, read back, and compared */
proctype check_report_trailer_body() {
  ReportTrailerBody report_trailer_body_sent;
  ReportTrailerBody report_trailer_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_report_trailer_body(report_trailer_body_sent, 0)
  :: pattern == 1 -> fill_report_trailer_body(report_trailer_body_sent, 32)
  :: pattern == 2 -> fill_report_trailer_body(report_trailer_body_sent, 255)
  :: else -> ramp_report_trailer_body(report_trailer_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_report_trailer_body(report_trailer_body_sent);
    assert(at == 5);
    at = 0;
    decode_report_trailer_body(report_trailer_body_got);
    assert(at == 5);
    equal_report_trailer_body(report_trailer_body_got, report_trailer_body_sent)
  }
}

/* Mkt Index: encoded, read back, and compared */
proctype check_mkt_index() {
  MktIndex mkt_index_sent;
  MktIndex mkt_index_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mkt_index(mkt_index_sent, 0)
  :: pattern == 1 -> fill_mkt_index(mkt_index_sent, 32)
  :: pattern == 2 -> fill_mkt_index(mkt_index_sent, 255)
  :: else -> ramp_mkt_index(mkt_index_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mkt_index(mkt_index_sent);
    assert(at == 10);
    at = 0;
    decode_mkt_index(mkt_index_got);
    assert(at == 10);
    equal_mkt_index(mkt_index_got, mkt_index_sent)
  }
}

/* Market Index Report Message: encoded, read back, and compared */
proctype check_market_index_report_message() {
  MarketIndexReportMessage market_index_report_message_sent;
  MarketIndexReportMessage market_index_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_index_report_message(market_index_report_message_sent, 0)
  :: pattern == 1 -> fill_market_index_report_message(market_index_report_message_sent, 32)
  :: pattern == 2 -> fill_market_index_report_message(market_index_report_message_sent, 255)
  :: else -> ramp_market_index_report_message(market_index_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_index_report_message(market_index_report_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_index_report_message(market_index_report_message_got);
    assert(at == 26);
    equal_market_index_report_message(market_index_report_message_got, market_index_report_message_sent)
  }
}

/* Spread Report Header Body: encoded, read back, and compared */
proctype check_spread_report_header_body() {
  SpreadReportHeaderBody spread_report_header_body_sent;
  SpreadReportHeaderBody spread_report_header_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spread_report_header_body(spread_report_header_body_sent, 0)
  :: pattern == 1 -> fill_spread_report_header_body(spread_report_header_body_sent, 32)
  :: pattern == 2 -> fill_spread_report_header_body(spread_report_header_body_sent, 255)
  :: else -> ramp_spread_report_header_body(spread_report_header_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spread_report_header_body(spread_report_header_body_sent);
    assert(at == 67);
    at = 0;
    decode_spread_report_header_body(spread_report_header_body_got);
    assert(at == 67);
    equal_spread_report_header_body(spread_report_header_body_got, spread_report_header_body_sent)
  }
}

/* Index Details: encoded, read back, and compared */
proctype check_index_details() {
  IndexDetails index_details_sent;
  IndexDetails index_details_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_details(index_details_sent, 0)
  :: pattern == 1 -> fill_index_details(index_details_sent, 32)
  :: pattern == 2 -> fill_index_details(index_details_sent, 255)
  :: else -> ramp_index_details(index_details_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_details(index_details_sent);
    assert(at == 98);
    at = 0;
    decode_index_details(index_details_got);
    assert(at == 98);
    equal_index_details(index_details_got, index_details_sent)
  }
}

/* Global Indices Message: encoded, read back, and compared */
proctype check_global_indices_message() {
  GlobalIndicesMessage global_indices_message_sent;
  GlobalIndicesMessage global_indices_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_global_indices_message(global_indices_message_sent, 0)
  :: pattern == 1 -> fill_global_indices_message(global_indices_message_sent, 32)
  :: pattern == 2 -> fill_global_indices_message(global_indices_message_sent, 255)
  :: else -> ramp_global_indices_message(global_indices_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_global_indices_message(global_indices_message_sent);
    assert(at == 98);
    at = 0;
    decode_global_indices_message(global_indices_message_got);
    assert(at == 98);
    equal_global_indices_message(global_indices_message_got, global_indices_message_sent)
  }
}

/* Box Sign On Request Out Message: encoded, read back, and compared */
proctype check_box_sign_on_request_out_message() {
  BoxSignOnRequestOutMessage box_sign_on_request_out_message_sent;
  BoxSignOnRequestOutMessage box_sign_on_request_out_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_on_request_out_message(box_sign_on_request_out_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_on_request_out_message(box_sign_on_request_out_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_on_request_out_message(box_sign_on_request_out_message_sent, 255)
  :: else -> ramp_box_sign_on_request_out_message(box_sign_on_request_out_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_on_request_out_message(box_sign_on_request_out_message_sent);
    assert(at == 12);
    at = 0;
    decode_box_sign_on_request_out_message(box_sign_on_request_out_message_got);
    assert(at == 12);
    equal_box_sign_on_request_out_message(box_sign_on_request_out_message_got, box_sign_on_request_out_message_sent)
  }
}

/* Contingency Broadcast Message: encoded, read back, and compared */
proctype check_contingency_broadcast_message() {
  ContingencyBroadcastMessage contingency_broadcast_message_sent;
  ContingencyBroadcastMessage contingency_broadcast_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contingency_broadcast_message(contingency_broadcast_message_sent, 0)
  :: pattern == 1 -> fill_contingency_broadcast_message(contingency_broadcast_message_sent, 32)
  :: pattern == 2 -> fill_contingency_broadcast_message(contingency_broadcast_message_sent, 255)
  :: else -> ramp_contingency_broadcast_message(contingency_broadcast_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contingency_broadcast_message(contingency_broadcast_message_sent);
    assert(at == 204);
    at = 0;
    decode_contingency_broadcast_message(contingency_broadcast_message_got);
    assert(at == 204);
    equal_contingency_broadcast_message(contingency_broadcast_message_got, contingency_broadcast_message_sent)
  }
}

/* Collateral User Status Change Response Message: encoded, read back, and compared */
proctype check_collateral_user_status_change_response_message() {
  CollateralUserStatusChangeResponseMessage collateral_user_status_change_response_message_sent;
  CollateralUserStatusChangeResponseMessage collateral_user_status_change_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent, 0)
  :: pattern == 1 -> fill_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent, 32)
  :: pattern == 2 -> fill_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent, 255)
  :: else -> ramp_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent);
    assert(at == 6);
    at = 0;
    decode_collateral_user_status_change_response_message(collateral_user_status_change_response_message_got);
    assert(at == 6);
    equal_collateral_user_status_change_response_message(collateral_user_status_change_response_message_got, collateral_user_status_change_response_message_sent)
  }
}

/* User Trade Modify Cancel Status Change Response Message: encoded, read back, and compared */
proctype check_user_trade_modify_cancel_status_change_response_message() {
  UserTradeModifyCancelStatusChangeResponseMessage user_trade_modify_cancel_status_change_response_message_sent;
  UserTradeModifyCancelStatusChangeResponseMessage user_trade_modify_cancel_status_change_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent, 0)
  :: pattern == 1 -> fill_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent, 32)
  :: pattern == 2 -> fill_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent, 255)
  :: else -> ramp_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent);
    assert(at == 6);
    at = 0;
    decode_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_got);
    assert(at == 6);
    equal_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_got, user_trade_modify_cancel_status_change_response_message_sent)
  }
}

/* User Address Unlock Confirm Message: encoded, read back, and compared */
proctype check_user_address_unlock_confirm_message() {
  UserAddressUnlockConfirmMessage user_address_unlock_confirm_message_sent;
  UserAddressUnlockConfirmMessage user_address_unlock_confirm_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent, 0)
  :: pattern == 1 -> fill_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent, 32)
  :: pattern == 2 -> fill_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent, 255)
  :: else -> ramp_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent);
    assert(at == 40);
    at = 0;
    decode_user_address_unlock_confirm_message(user_address_unlock_confirm_message_got);
    assert(at == 40);
    equal_user_address_unlock_confirm_message(user_address_unlock_confirm_message_got, user_address_unlock_confirm_message_sent)
  }
}

/* User Address Unlock Approve Message: encoded, read back, and compared */
proctype check_user_address_unlock_approve_message() {
  UserAddressUnlockApproveMessage user_address_unlock_approve_message_sent;
  UserAddressUnlockApproveMessage user_address_unlock_approve_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_address_unlock_approve_message(user_address_unlock_approve_message_sent, 0)
  :: pattern == 1 -> fill_user_address_unlock_approve_message(user_address_unlock_approve_message_sent, 32)
  :: pattern == 2 -> fill_user_address_unlock_approve_message(user_address_unlock_approve_message_sent, 255)
  :: else -> ramp_user_address_unlock_approve_message(user_address_unlock_approve_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_address_unlock_approve_message(user_address_unlock_approve_message_sent);
    assert(at == 40);
    at = 0;
    decode_user_address_unlock_approve_message(user_address_unlock_approve_message_got);
    assert(at == 40);
    equal_user_address_unlock_approve_message(user_address_unlock_approve_message_got, user_address_unlock_approve_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_sign_off_request_out_message()
  :: run check_st_market_status()
  :: run check_st_ex_market_status()
  :: run check_st_pl_market_status()
  :: run check_existing_encryption_tail()
  :: run check_new_encryption_tail()
  :: run check_update_local_database_header_message()
  :: run check_update_local_database_trailer_message()
  :: run check_inner_header()
  :: run check_contract_desc()
  :: run check_control_message_to_trader_message()
  :: run check_report_header_body()
  :: run check_report_trailer_body()
  :: run check_mkt_index()
  :: run check_market_index_report_message()
  :: run check_spread_report_header_body()
  :: run check_index_details()
  :: run check_global_indices_message()
  :: run check_box_sign_on_request_out_message()
  :: run check_contingency_broadcast_message()
  :: run check_collateral_user_status_change_response_message()
  :: run check_user_trade_modify_cancel_status_change_response_message()
  :: run check_user_address_unlock_confirm_message()
  :: run check_user_address_unlock_approve_message()
  fi
}
