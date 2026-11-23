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
 *   - a run of a stated number of entries
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 194

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

/* ---- System Information In Message: 4 bytes ---------------------------------- */

/* Requests the system information of the trading system */
typedef SystemInformationInMessage {
  byte last_update_portfolio_time[4]
};

int system_information_in_message_at;

/* every byte of System Information In Message set to one value */
inline fill_system_information_in_message(system_information_in_message_record, system_information_in_message_value) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> system_information_in_message_record.last_update_portfolio_time[system_information_in_message_at] = system_information_in_message_value; system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Information In Message set to where it lies, so a field read out of place says so */
inline ramp_system_information_in_message(system_information_in_message_record, system_information_in_message_base) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> system_information_in_message_record.last_update_portfolio_time[system_information_in_message_at] = (system_information_in_message_base + 0 + system_information_in_message_at + 1) % 256; system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Information In Message to the wire, 4 bytes from where the cursor stands */
inline encode_system_information_in_message(system_information_in_message_record) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> wire[at] = system_information_in_message_record.last_update_portfolio_time[system_information_in_message_at]; at = at + 1; system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Information In Message off the wire, 4 bytes from where the cursor stands */
inline decode_system_information_in_message(system_information_in_message_record) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> system_information_in_message_record.last_update_portfolio_time[system_information_in_message_at] = wire[at]; at = at + 1; system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Information In Message is what was written, byte for byte */
inline equal_system_information_in_message(system_information_in_message_read, system_information_in_message_written) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> assert(system_information_in_message_read.last_update_portfolio_time[system_information_in_message_at] == system_information_in_message_written.last_update_portfolio_time[system_information_in_message_at]); system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Market Status: 8 bytes ----------------------------------------------- */

/* ST_MARKET_STATUS */
typedef StMarketStatus {
  byte normal[2];
  byte oddlot[2];
  byte spot[2];
  byte auction[2]
};

int st_market_status_at;

/* every byte of St Market Status set to one value */
inline fill_st_market_status(st_market_status_record, st_market_status_value) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.normal[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.oddlot[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.spot[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.auction[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_market_status(st_market_status_record, st_market_status_base) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.normal[st_market_status_at] = (st_market_status_base + 0 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.oddlot[st_market_status_at] = (st_market_status_base + 2 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.spot[st_market_status_at] = (st_market_status_base + 4 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.auction[st_market_status_at] = (st_market_status_base + 6 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_market_status(st_market_status_record) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.normal[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.oddlot[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.spot[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.auction[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_market_status(st_market_status_record) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.normal[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.oddlot[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.spot[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.auction[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Market Status is what was written, byte for byte */
inline equal_st_market_status(st_market_status_read, st_market_status_written) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.normal[st_market_status_at] == st_market_status_written.normal[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.oddlot[st_market_status_at] == st_market_status_written.oddlot[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.spot[st_market_status_at] == st_market_status_written.spot[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.auction[st_market_status_at] == st_market_status_written.auction[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Ex Market Status: 8 bytes -------------------------------------------- */

/* ST_EX_MARKET_STATUS */
typedef StExMarketStatus {
  byte normal[2];
  byte oddlot[2];
  byte spot[2];
  byte auction[2]
};

int st_ex_market_status_at;

/* every byte of St Ex Market Status set to one value */
inline fill_st_ex_market_status(st_ex_market_status_record, st_ex_market_status_value) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.normal[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.oddlot[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.spot[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.auction[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Ex Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_ex_market_status(st_ex_market_status_record, st_ex_market_status_base) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.normal[st_ex_market_status_at] = (st_ex_market_status_base + 0 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.oddlot[st_ex_market_status_at] = (st_ex_market_status_base + 2 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.spot[st_ex_market_status_at] = (st_ex_market_status_base + 4 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.auction[st_ex_market_status_at] = (st_ex_market_status_base + 6 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Ex Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_ex_market_status(st_ex_market_status_record) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.normal[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.oddlot[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.spot[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.auction[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Ex Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_ex_market_status(st_ex_market_status_record) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.normal[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.oddlot[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.spot[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.auction[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Ex Market Status is what was written, byte for byte */
inline equal_st_ex_market_status(st_ex_market_status_read, st_ex_market_status_written) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.normal[st_ex_market_status_at] == st_ex_market_status_written.normal[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.oddlot[st_ex_market_status_at] == st_ex_market_status_written.oddlot[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.spot[st_ex_market_status_at] == st_ex_market_status_written.spot[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.auction[st_ex_market_status_at] == st_ex_market_status_written.auction[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Pl Market Status: 8 bytes -------------------------------------------- */

/* ST_PL_MARKET_STATUS */
typedef StPlMarketStatus {
  byte normal[2];
  byte oddlot[2];
  byte spot[2];
  byte auction[2]
};

int st_pl_market_status_at;

/* every byte of St Pl Market Status set to one value */
inline fill_st_pl_market_status(st_pl_market_status_record, st_pl_market_status_value) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.normal[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.oddlot[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.spot[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.auction[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Pl Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_pl_market_status(st_pl_market_status_record, st_pl_market_status_base) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.normal[st_pl_market_status_at] = (st_pl_market_status_base + 0 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.oddlot[st_pl_market_status_at] = (st_pl_market_status_base + 2 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.spot[st_pl_market_status_at] = (st_pl_market_status_base + 4 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.auction[st_pl_market_status_at] = (st_pl_market_status_base + 6 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Pl Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_pl_market_status(st_pl_market_status_record) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.normal[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.oddlot[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.spot[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.auction[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Pl Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_pl_market_status(st_pl_market_status_record) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.normal[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.oddlot[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.spot[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.auction[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Pl Market Status is what was written, byte for byte */
inline equal_st_pl_market_status(st_pl_market_status_read, st_pl_market_status_written) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.normal[st_pl_market_status_at] == st_pl_market_status_written.normal[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.oddlot[st_pl_market_status_at] == st_pl_market_status_written.oddlot[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.spot[st_pl_market_status_at] == st_pl_market_status_written.spot[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.auction[st_pl_market_status_at] == st_pl_market_status_written.auction[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Local Database In Message: 42 bytes ------------------------------ */

/* Requests the local database download of securities, participants and open orders */
typedef UpdateLocalDatabaseInMessage {
  byte last_update_security_time[4];
  byte last_update_participant_time[4];
  byte last_update_instrument_time[4];
  byte last_update_index_time[4];
  byte request_for_open_orders;
  byte c_filler;
  StMarketStatus st_market_status;
  StExMarketStatus st_ex_market_status;
  StPlMarketStatus st_pl_market_status
};

int update_local_database_in_message_at;

/* every byte of Update Local Database In Message set to one value */
inline fill_update_local_database_in_message(update_local_database_in_message_record, update_local_database_in_message_value) {
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_security_time[update_local_database_in_message_at] = update_local_database_in_message_value; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_participant_time[update_local_database_in_message_at] = update_local_database_in_message_value; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_instrument_time[update_local_database_in_message_at] = update_local_database_in_message_value; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_index_time[update_local_database_in_message_at] = update_local_database_in_message_value; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_record.request_for_open_orders = update_local_database_in_message_value;
  update_local_database_in_message_record.c_filler = update_local_database_in_message_value;
  fill_st_market_status(update_local_database_in_message_record.st_market_status, update_local_database_in_message_value);
  fill_st_ex_market_status(update_local_database_in_message_record.st_ex_market_status, update_local_database_in_message_value);
  fill_st_pl_market_status(update_local_database_in_message_record.st_pl_market_status, update_local_database_in_message_value);
  skip
}

/* each byte of Update Local Database In Message set to where it lies, so a field read out of place says so */
inline ramp_update_local_database_in_message(update_local_database_in_message_record, update_local_database_in_message_base) {
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_security_time[update_local_database_in_message_at] = (update_local_database_in_message_base + 0 + update_local_database_in_message_at + 1) % 256; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_participant_time[update_local_database_in_message_at] = (update_local_database_in_message_base + 4 + update_local_database_in_message_at + 1) % 256; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_instrument_time[update_local_database_in_message_at] = (update_local_database_in_message_base + 8 + update_local_database_in_message_at + 1) % 256; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_index_time[update_local_database_in_message_at] = (update_local_database_in_message_base + 12 + update_local_database_in_message_at + 1) % 256; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_record.request_for_open_orders = (update_local_database_in_message_base + 16 + 1) % 256;
  update_local_database_in_message_record.c_filler = (update_local_database_in_message_base + 17 + 1) % 256;
  ramp_st_market_status(update_local_database_in_message_record.st_market_status, update_local_database_in_message_base + 18);
  ramp_st_ex_market_status(update_local_database_in_message_record.st_ex_market_status, update_local_database_in_message_base + 26);
  ramp_st_pl_market_status(update_local_database_in_message_record.st_pl_market_status, update_local_database_in_message_base + 34);
  skip
}

/* Update Local Database In Message to the wire, 42 bytes from where the cursor stands */
inline encode_update_local_database_in_message(update_local_database_in_message_record) {
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> wire[at] = update_local_database_in_message_record.last_update_security_time[update_local_database_in_message_at]; at = at + 1; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> wire[at] = update_local_database_in_message_record.last_update_participant_time[update_local_database_in_message_at]; at = at + 1; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> wire[at] = update_local_database_in_message_record.last_update_instrument_time[update_local_database_in_message_at]; at = at + 1; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> wire[at] = update_local_database_in_message_record.last_update_index_time[update_local_database_in_message_at]; at = at + 1; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  wire[at] = update_local_database_in_message_record.request_for_open_orders; at = at + 1;
  wire[at] = update_local_database_in_message_record.c_filler; at = at + 1;
  encode_st_market_status(update_local_database_in_message_record.st_market_status);
  encode_st_ex_market_status(update_local_database_in_message_record.st_ex_market_status);
  encode_st_pl_market_status(update_local_database_in_message_record.st_pl_market_status);
  skip
}

/* Update Local Database In Message off the wire, 42 bytes from where the cursor stands */
inline decode_update_local_database_in_message(update_local_database_in_message_record) {
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_security_time[update_local_database_in_message_at] = wire[at]; at = at + 1; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_participant_time[update_local_database_in_message_at] = wire[at]; at = at + 1; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_instrument_time[update_local_database_in_message_at] = wire[at]; at = at + 1; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> update_local_database_in_message_record.last_update_index_time[update_local_database_in_message_at] = wire[at]; at = at + 1; update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_record.request_for_open_orders = wire[at]; at = at + 1;
  update_local_database_in_message_record.c_filler = wire[at]; at = at + 1;
  decode_st_market_status(update_local_database_in_message_record.st_market_status);
  decode_st_ex_market_status(update_local_database_in_message_record.st_ex_market_status);
  decode_st_pl_market_status(update_local_database_in_message_record.st_pl_market_status);
  skip
}

/* what was read of Update Local Database In Message is what was written, byte for byte */
inline equal_update_local_database_in_message(update_local_database_in_message_read, update_local_database_in_message_written) {
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> assert(update_local_database_in_message_read.last_update_security_time[update_local_database_in_message_at] == update_local_database_in_message_written.last_update_security_time[update_local_database_in_message_at]); update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> assert(update_local_database_in_message_read.last_update_participant_time[update_local_database_in_message_at] == update_local_database_in_message_written.last_update_participant_time[update_local_database_in_message_at]); update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> assert(update_local_database_in_message_read.last_update_instrument_time[update_local_database_in_message_at] == update_local_database_in_message_written.last_update_instrument_time[update_local_database_in_message_at]); update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  update_local_database_in_message_at = 0;
  do
  :: update_local_database_in_message_at < 4 -> assert(update_local_database_in_message_read.last_update_index_time[update_local_database_in_message_at] == update_local_database_in_message_written.last_update_index_time[update_local_database_in_message_at]); update_local_database_in_message_at = update_local_database_in_message_at + 1
  :: else -> break
  od;
  assert(update_local_database_in_message_read.request_for_open_orders == update_local_database_in_message_written.request_for_open_orders);
  assert(update_local_database_in_message_read.c_filler == update_local_database_in_message_written.c_filler);
  equal_st_market_status(update_local_database_in_message_read.st_market_status, update_local_database_in_message_written.st_market_status);
  equal_st_ex_market_status(update_local_database_in_message_read.st_ex_market_status, update_local_database_in_message_written.st_ex_market_status);
  equal_st_pl_market_status(update_local_database_in_message_read.st_pl_market_status, update_local_database_in_message_written.st_pl_market_status);
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

/* ---- Trade Inquiry Body: 194 bytes ------------------------------------------- */

/* Trade Inquiry Body */
typedef TradeInquiryBody {
  byte token_no[4];
  ContractDesc contract_desc;
  byte fill_number[4];
  byte fill_quantity[4];
  byte fill_price[4];
  byte mkt_type;
  byte buy_open_close;
  byte new_volume[4];
  byte buy_broker_id[5];
  byte sell_broker_id[5];
  byte trader_id[4];
  byte requested_by;
  byte sell_open_close;
  byte buy_account_number[10];
  byte sell_account_number[10];
  byte buy_participant[12];
  byte sell_participant[12];
  byte reserved_2[2];
  byte buy_giveup_flag;
  byte sell_giveup_flag;
  byte reserved_80[80]
};

int trade_inquiry_body_at;

/* every byte of Trade Inquiry Body set to one value */
inline fill_trade_inquiry_body(trade_inquiry_body_record, trade_inquiry_body_value) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.token_no[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  fill_contract_desc(trade_inquiry_body_record.contract_desc, trade_inquiry_body_value);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_number[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_quantity[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_price[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.mkt_type = trade_inquiry_body_value;
  trade_inquiry_body_record.buy_open_close = trade_inquiry_body_value;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.new_volume[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.buy_broker_id[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.sell_broker_id[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.trader_id[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.requested_by = trade_inquiry_body_value;
  trade_inquiry_body_record.sell_open_close = trade_inquiry_body_value;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.buy_account_number[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.sell_account_number[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.buy_participant[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.sell_participant[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> trade_inquiry_body_record.reserved_2[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.buy_giveup_flag = trade_inquiry_body_value;
  trade_inquiry_body_record.sell_giveup_flag = trade_inquiry_body_value;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> trade_inquiry_body_record.reserved_80[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Inquiry Body set to where it lies, so a field read out of place says so */
inline ramp_trade_inquiry_body(trade_inquiry_body_record, trade_inquiry_body_base) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.token_no[trade_inquiry_body_at] = (trade_inquiry_body_base + 0 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  ramp_contract_desc(trade_inquiry_body_record.contract_desc, trade_inquiry_body_base + 4);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_number[trade_inquiry_body_at] = (trade_inquiry_body_base + 32 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_quantity[trade_inquiry_body_at] = (trade_inquiry_body_base + 36 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_price[trade_inquiry_body_at] = (trade_inquiry_body_base + 40 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.mkt_type = (trade_inquiry_body_base + 44 + 1) % 256;
  trade_inquiry_body_record.buy_open_close = (trade_inquiry_body_base + 45 + 1) % 256;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.new_volume[trade_inquiry_body_at] = (trade_inquiry_body_base + 46 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.buy_broker_id[trade_inquiry_body_at] = (trade_inquiry_body_base + 50 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.sell_broker_id[trade_inquiry_body_at] = (trade_inquiry_body_base + 55 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.trader_id[trade_inquiry_body_at] = (trade_inquiry_body_base + 60 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.requested_by = (trade_inquiry_body_base + 64 + 1) % 256;
  trade_inquiry_body_record.sell_open_close = (trade_inquiry_body_base + 65 + 1) % 256;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.buy_account_number[trade_inquiry_body_at] = (trade_inquiry_body_base + 66 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.sell_account_number[trade_inquiry_body_at] = (trade_inquiry_body_base + 76 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.buy_participant[trade_inquiry_body_at] = (trade_inquiry_body_base + 86 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.sell_participant[trade_inquiry_body_at] = (trade_inquiry_body_base + 98 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> trade_inquiry_body_record.reserved_2[trade_inquiry_body_at] = (trade_inquiry_body_base + 110 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.buy_giveup_flag = (trade_inquiry_body_base + 112 + 1) % 256;
  trade_inquiry_body_record.sell_giveup_flag = (trade_inquiry_body_base + 113 + 1) % 256;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> trade_inquiry_body_record.reserved_80[trade_inquiry_body_at] = (trade_inquiry_body_base + 114 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Inquiry Body to the wire, 194 bytes from where the cursor stands */
inline encode_trade_inquiry_body(trade_inquiry_body_record) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.token_no[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  encode_contract_desc(trade_inquiry_body_record.contract_desc);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.fill_number[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.fill_quantity[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.fill_price[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  wire[at] = trade_inquiry_body_record.mkt_type; at = at + 1;
  wire[at] = trade_inquiry_body_record.buy_open_close; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.new_volume[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> wire[at] = trade_inquiry_body_record.buy_broker_id[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> wire[at] = trade_inquiry_body_record.sell_broker_id[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.trader_id[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  wire[at] = trade_inquiry_body_record.requested_by; at = at + 1;
  wire[at] = trade_inquiry_body_record.sell_open_close; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> wire[at] = trade_inquiry_body_record.buy_account_number[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> wire[at] = trade_inquiry_body_record.sell_account_number[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> wire[at] = trade_inquiry_body_record.buy_participant[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> wire[at] = trade_inquiry_body_record.sell_participant[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> wire[at] = trade_inquiry_body_record.reserved_2[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  wire[at] = trade_inquiry_body_record.buy_giveup_flag; at = at + 1;
  wire[at] = trade_inquiry_body_record.sell_giveup_flag; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> wire[at] = trade_inquiry_body_record.reserved_80[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Inquiry Body off the wire, 194 bytes from where the cursor stands */
inline decode_trade_inquiry_body(trade_inquiry_body_record) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.token_no[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  decode_contract_desc(trade_inquiry_body_record.contract_desc);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_number[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_quantity[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_price[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.mkt_type = wire[at]; at = at + 1;
  trade_inquiry_body_record.buy_open_close = wire[at]; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.new_volume[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.buy_broker_id[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.sell_broker_id[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.trader_id[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.requested_by = wire[at]; at = at + 1;
  trade_inquiry_body_record.sell_open_close = wire[at]; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.buy_account_number[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.sell_account_number[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.buy_participant[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.sell_participant[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> trade_inquiry_body_record.reserved_2[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.buy_giveup_flag = wire[at]; at = at + 1;
  trade_inquiry_body_record.sell_giveup_flag = wire[at]; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> trade_inquiry_body_record.reserved_80[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Inquiry Body is what was written, byte for byte */
inline equal_trade_inquiry_body(trade_inquiry_body_read, trade_inquiry_body_written) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.token_no[trade_inquiry_body_at] == trade_inquiry_body_written.token_no[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  equal_contract_desc(trade_inquiry_body_read.contract_desc, trade_inquiry_body_written.contract_desc);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.fill_number[trade_inquiry_body_at] == trade_inquiry_body_written.fill_number[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.fill_quantity[trade_inquiry_body_at] == trade_inquiry_body_written.fill_quantity[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.fill_price[trade_inquiry_body_at] == trade_inquiry_body_written.fill_price[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  assert(trade_inquiry_body_read.mkt_type == trade_inquiry_body_written.mkt_type);
  assert(trade_inquiry_body_read.buy_open_close == trade_inquiry_body_written.buy_open_close);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.new_volume[trade_inquiry_body_at] == trade_inquiry_body_written.new_volume[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> assert(trade_inquiry_body_read.buy_broker_id[trade_inquiry_body_at] == trade_inquiry_body_written.buy_broker_id[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> assert(trade_inquiry_body_read.sell_broker_id[trade_inquiry_body_at] == trade_inquiry_body_written.sell_broker_id[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.trader_id[trade_inquiry_body_at] == trade_inquiry_body_written.trader_id[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  assert(trade_inquiry_body_read.requested_by == trade_inquiry_body_written.requested_by);
  assert(trade_inquiry_body_read.sell_open_close == trade_inquiry_body_written.sell_open_close);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> assert(trade_inquiry_body_read.buy_account_number[trade_inquiry_body_at] == trade_inquiry_body_written.buy_account_number[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> assert(trade_inquiry_body_read.sell_account_number[trade_inquiry_body_at] == trade_inquiry_body_written.sell_account_number[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> assert(trade_inquiry_body_read.buy_participant[trade_inquiry_body_at] == trade_inquiry_body_written.buy_participant[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> assert(trade_inquiry_body_read.sell_participant[trade_inquiry_body_at] == trade_inquiry_body_written.sell_participant[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> assert(trade_inquiry_body_read.reserved_2[trade_inquiry_body_at] == trade_inquiry_body_written.reserved_2[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  assert(trade_inquiry_body_read.buy_giveup_flag == trade_inquiry_body_written.buy_giveup_flag);
  assert(trade_inquiry_body_read.sell_giveup_flag == trade_inquiry_body_written.sell_giveup_flag);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> assert(trade_inquiry_body_read.reserved_80[trade_inquiry_body_at] == trade_inquiry_body_written.reserved_80[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Inquiry Message: 194 bytes ---------------------------------------- */

/* Trade modification and cancellation requests, including the negotiated large trade forms, carried in the shared trade structure */
typedef TradeInquiryMessage {
  TradeInquiryBody trade_inquiry_body
};

/* every byte of Trade Inquiry Message set to one value */
inline fill_trade_inquiry_message(trade_inquiry_message_record, trade_inquiry_message_value) {
  fill_trade_inquiry_body(trade_inquiry_message_record.trade_inquiry_body, trade_inquiry_message_value);
  skip
}

/* each byte of Trade Inquiry Message set to where it lies, so a field read out of place says so */
inline ramp_trade_inquiry_message(trade_inquiry_message_record, trade_inquiry_message_base) {
  ramp_trade_inquiry_body(trade_inquiry_message_record.trade_inquiry_body, trade_inquiry_message_base + 0);
  skip
}

/* Trade Inquiry Message to the wire, 194 bytes from where the cursor stands */
inline encode_trade_inquiry_message(trade_inquiry_message_record) {
  encode_trade_inquiry_body(trade_inquiry_message_record.trade_inquiry_body);
  skip
}

/* Trade Inquiry Message off the wire, 194 bytes from where the cursor stands */
inline decode_trade_inquiry_message(trade_inquiry_message_record) {
  decode_trade_inquiry_body(trade_inquiry_message_record.trade_inquiry_body);
  skip
}

/* what was read of Trade Inquiry Message is what was written, byte for byte */
inline equal_trade_inquiry_message(trade_inquiry_message_read, trade_inquiry_message_written) {
  equal_trade_inquiry_body(trade_inquiry_message_read.trade_inquiry_body, trade_inquiry_message_written.trade_inquiry_body);
  skip
}

/* ---- Gateway Router Request Message: 8 bytes --------------------------------- */

/* Asks the gateway router which gateway server to connect to */
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

/* ---- Secure Box Registration Request In Message: 2 bytes --------------------- */

/* Registers the box with the allocated gateway server */
typedef SecureBoxRegistrationRequestInMessage {
  byte box_id[2]
};

int secure_box_registration_request_in_message_at;

/* every byte of Secure Box Registration Request In Message set to one value */
inline fill_secure_box_registration_request_in_message(secure_box_registration_request_in_message_record, secure_box_registration_request_in_message_value) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> secure_box_registration_request_in_message_record.box_id[secure_box_registration_request_in_message_at] = secure_box_registration_request_in_message_value; secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Secure Box Registration Request In Message set to where it lies, so a field read out of place says so */
inline ramp_secure_box_registration_request_in_message(secure_box_registration_request_in_message_record, secure_box_registration_request_in_message_base) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> secure_box_registration_request_in_message_record.box_id[secure_box_registration_request_in_message_at] = (secure_box_registration_request_in_message_base + 0 + secure_box_registration_request_in_message_at + 1) % 256; secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Secure Box Registration Request In Message to the wire, 2 bytes from where the cursor stands */
inline encode_secure_box_registration_request_in_message(secure_box_registration_request_in_message_record) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> wire[at] = secure_box_registration_request_in_message_record.box_id[secure_box_registration_request_in_message_at]; at = at + 1; secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Secure Box Registration Request In Message off the wire, 2 bytes from where the cursor stands */
inline decode_secure_box_registration_request_in_message(secure_box_registration_request_in_message_record) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> secure_box_registration_request_in_message_record.box_id[secure_box_registration_request_in_message_at] = wire[at]; at = at + 1; secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Secure Box Registration Request In Message is what was written, byte for byte */
inline equal_secure_box_registration_request_in_message(secure_box_registration_request_in_message_read, secure_box_registration_request_in_message_written) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> assert(secure_box_registration_request_in_message_read.box_id[secure_box_registration_request_in_message_at] == secure_box_registration_request_in_message_written.box_id[secure_box_registration_request_in_message_at]); secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Box Sign On Request In Message: 20 bytes -------------------------------- */

/* Signs the box on to the allocated gateway server */
typedef BoxSignOnRequestInMessage {
  byte box_id[2];
  byte broker_id[5];
  byte reserved_5[5];
  byte session_key[8]
};

int box_sign_on_request_in_message_at;

/* every byte of Box Sign On Request In Message set to one value */
inline fill_box_sign_on_request_in_message(box_sign_on_request_in_message_record, box_sign_on_request_in_message_value) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> box_sign_on_request_in_message_record.box_id[box_sign_on_request_in_message_at] = box_sign_on_request_in_message_value; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.broker_id[box_sign_on_request_in_message_at] = box_sign_on_request_in_message_value; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.reserved_5[box_sign_on_request_in_message_at] = box_sign_on_request_in_message_value; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> box_sign_on_request_in_message_record.session_key[box_sign_on_request_in_message_at] = box_sign_on_request_in_message_value; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign On Request In Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_on_request_in_message(box_sign_on_request_in_message_record, box_sign_on_request_in_message_base) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> box_sign_on_request_in_message_record.box_id[box_sign_on_request_in_message_at] = (box_sign_on_request_in_message_base + 0 + box_sign_on_request_in_message_at + 1) % 256; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.broker_id[box_sign_on_request_in_message_at] = (box_sign_on_request_in_message_base + 2 + box_sign_on_request_in_message_at + 1) % 256; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.reserved_5[box_sign_on_request_in_message_at] = (box_sign_on_request_in_message_base + 7 + box_sign_on_request_in_message_at + 1) % 256; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> box_sign_on_request_in_message_record.session_key[box_sign_on_request_in_message_at] = (box_sign_on_request_in_message_base + 12 + box_sign_on_request_in_message_at + 1) % 256; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request In Message to the wire, 20 bytes from where the cursor stands */
inline encode_box_sign_on_request_in_message(box_sign_on_request_in_message_record) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> wire[at] = box_sign_on_request_in_message_record.box_id[box_sign_on_request_in_message_at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> wire[at] = box_sign_on_request_in_message_record.broker_id[box_sign_on_request_in_message_at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> wire[at] = box_sign_on_request_in_message_record.reserved_5[box_sign_on_request_in_message_at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> wire[at] = box_sign_on_request_in_message_record.session_key[box_sign_on_request_in_message_at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request In Message off the wire, 20 bytes from where the cursor stands */
inline decode_box_sign_on_request_in_message(box_sign_on_request_in_message_record) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> box_sign_on_request_in_message_record.box_id[box_sign_on_request_in_message_at] = wire[at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.broker_id[box_sign_on_request_in_message_at] = wire[at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.reserved_5[box_sign_on_request_in_message_at] = wire[at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> box_sign_on_request_in_message_record.session_key[box_sign_on_request_in_message_at] = wire[at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign On Request In Message is what was written, byte for byte */
inline equal_box_sign_on_request_in_message(box_sign_on_request_in_message_read, box_sign_on_request_in_message_written) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> assert(box_sign_on_request_in_message_read.box_id[box_sign_on_request_in_message_at] == box_sign_on_request_in_message_written.box_id[box_sign_on_request_in_message_at]); box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> assert(box_sign_on_request_in_message_read.broker_id[box_sign_on_request_in_message_at] == box_sign_on_request_in_message_written.broker_id[box_sign_on_request_in_message_at]); box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> assert(box_sign_on_request_in_message_read.reserved_5[box_sign_on_request_in_message_at] == box_sign_on_request_in_message_written.reserved_5[box_sign_on_request_in_message_at]); box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> assert(box_sign_on_request_in_message_read.session_key[box_sign_on_request_in_message_at] == box_sign_on_request_in_message_written.session_key[box_sign_on_request_in_message_at]); box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset User Password Message: 18 bytes ----------------------------------- */

/* Requests a reset of a user's password to the default */
typedef ResetUserPasswordMessage {
  byte user_id[4];
  byte reserved_14[14]
};

int reset_user_password_message_at;

/* every byte of Reset User Password Message set to one value */
inline fill_reset_user_password_message(reset_user_password_message_record, reset_user_password_message_value) {
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 4 -> reset_user_password_message_record.user_id[reset_user_password_message_at] = reset_user_password_message_value; reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 14 -> reset_user_password_message_record.reserved_14[reset_user_password_message_at] = reset_user_password_message_value; reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset User Password Message set to where it lies, so a field read out of place says so */
inline ramp_reset_user_password_message(reset_user_password_message_record, reset_user_password_message_base) {
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 4 -> reset_user_password_message_record.user_id[reset_user_password_message_at] = (reset_user_password_message_base + 0 + reset_user_password_message_at + 1) % 256; reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 14 -> reset_user_password_message_record.reserved_14[reset_user_password_message_at] = (reset_user_password_message_base + 4 + reset_user_password_message_at + 1) % 256; reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset User Password Message to the wire, 18 bytes from where the cursor stands */
inline encode_reset_user_password_message(reset_user_password_message_record) {
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 4 -> wire[at] = reset_user_password_message_record.user_id[reset_user_password_message_at]; at = at + 1; reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 14 -> wire[at] = reset_user_password_message_record.reserved_14[reset_user_password_message_at]; at = at + 1; reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset User Password Message off the wire, 18 bytes from where the cursor stands */
inline decode_reset_user_password_message(reset_user_password_message_record) {
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 4 -> reset_user_password_message_record.user_id[reset_user_password_message_at] = wire[at]; at = at + 1; reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 14 -> reset_user_password_message_record.reserved_14[reset_user_password_message_at] = wire[at]; at = at + 1; reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset User Password Message is what was written, byte for byte */
inline equal_reset_user_password_message(reset_user_password_message_read, reset_user_password_message_written) {
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 4 -> assert(reset_user_password_message_read.user_id[reset_user_password_message_at] == reset_user_password_message_written.user_id[reset_user_password_message_at]); reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  reset_user_password_message_at = 0;
  do
  :: reset_user_password_message_at < 14 -> assert(reset_user_password_message_read.reserved_14[reset_user_password_message_at] == reset_user_password_message_written.reserved_14[reset_user_password_message_at]); reset_user_password_message_at = reset_user_password_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Collateral User Status Change Request Message: 12 bytes ----------------- */

/* Enables or disables cancel on logout for a user */
typedef CollateralUserStatusChangeRequestMessage {
  byte user_id[4];
  byte col_user_bit;
  byte reserved_7[7]
};

int collateral_user_status_change_request_message_at;

/* every byte of Collateral User Status Change Request Message set to one value */
inline fill_collateral_user_status_change_request_message(collateral_user_status_change_request_message_record, collateral_user_status_change_request_message_value) {
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 4 -> collateral_user_status_change_request_message_record.user_id[collateral_user_status_change_request_message_at] = collateral_user_status_change_request_message_value; collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  collateral_user_status_change_request_message_record.col_user_bit = collateral_user_status_change_request_message_value;
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 7 -> collateral_user_status_change_request_message_record.reserved_7[collateral_user_status_change_request_message_at] = collateral_user_status_change_request_message_value; collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Collateral User Status Change Request Message set to where it lies, so a field read out of place says so */
inline ramp_collateral_user_status_change_request_message(collateral_user_status_change_request_message_record, collateral_user_status_change_request_message_base) {
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 4 -> collateral_user_status_change_request_message_record.user_id[collateral_user_status_change_request_message_at] = (collateral_user_status_change_request_message_base + 0 + collateral_user_status_change_request_message_at + 1) % 256; collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  collateral_user_status_change_request_message_record.col_user_bit = (collateral_user_status_change_request_message_base + 4 + 1) % 256;
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 7 -> collateral_user_status_change_request_message_record.reserved_7[collateral_user_status_change_request_message_at] = (collateral_user_status_change_request_message_base + 5 + collateral_user_status_change_request_message_at + 1) % 256; collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Collateral User Status Change Request Message to the wire, 12 bytes from where the cursor stands */
inline encode_collateral_user_status_change_request_message(collateral_user_status_change_request_message_record) {
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 4 -> wire[at] = collateral_user_status_change_request_message_record.user_id[collateral_user_status_change_request_message_at]; at = at + 1; collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  wire[at] = collateral_user_status_change_request_message_record.col_user_bit; at = at + 1;
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 7 -> wire[at] = collateral_user_status_change_request_message_record.reserved_7[collateral_user_status_change_request_message_at]; at = at + 1; collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Collateral User Status Change Request Message off the wire, 12 bytes from where the cursor stands */
inline decode_collateral_user_status_change_request_message(collateral_user_status_change_request_message_record) {
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 4 -> collateral_user_status_change_request_message_record.user_id[collateral_user_status_change_request_message_at] = wire[at]; at = at + 1; collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  collateral_user_status_change_request_message_record.col_user_bit = wire[at]; at = at + 1;
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 7 -> collateral_user_status_change_request_message_record.reserved_7[collateral_user_status_change_request_message_at] = wire[at]; at = at + 1; collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Collateral User Status Change Request Message is what was written, byte for byte */
inline equal_collateral_user_status_change_request_message(collateral_user_status_change_request_message_read, collateral_user_status_change_request_message_written) {
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 4 -> assert(collateral_user_status_change_request_message_read.user_id[collateral_user_status_change_request_message_at] == collateral_user_status_change_request_message_written.user_id[collateral_user_status_change_request_message_at]); collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  assert(collateral_user_status_change_request_message_read.col_user_bit == collateral_user_status_change_request_message_written.col_user_bit);
  collateral_user_status_change_request_message_at = 0;
  do
  :: collateral_user_status_change_request_message_at < 7 -> assert(collateral_user_status_change_request_message_read.reserved_7[collateral_user_status_change_request_message_at] == collateral_user_status_change_request_message_written.reserved_7[collateral_user_status_change_request_message_at]); collateral_user_status_change_request_message_at = collateral_user_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- User Trade Modify Cancel Status Change Request Message: 12 bytes -------- */

/* Enables or disables trade modification or, with Alpha Char TX, trade cancellation for a user */
typedef UserTradeModifyCancelStatusChangeRequestMessage {
  byte user_id[4];
  byte trd_mod_cxl_bit;
  byte reserved_7[7]
};

int user_trade_modify_cancel_status_change_request_message_at;

/* every byte of User Trade Modify Cancel Status Change Request Message set to one value */
inline fill_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_record, user_trade_modify_cancel_status_change_request_message_value) {
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 4 -> user_trade_modify_cancel_status_change_request_message_record.user_id[user_trade_modify_cancel_status_change_request_message_at] = user_trade_modify_cancel_status_change_request_message_value; user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  user_trade_modify_cancel_status_change_request_message_record.trd_mod_cxl_bit = user_trade_modify_cancel_status_change_request_message_value;
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 7 -> user_trade_modify_cancel_status_change_request_message_record.reserved_7[user_trade_modify_cancel_status_change_request_message_at] = user_trade_modify_cancel_status_change_request_message_value; user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Trade Modify Cancel Status Change Request Message set to where it lies, so a field read out of place says so */
inline ramp_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_record, user_trade_modify_cancel_status_change_request_message_base) {
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 4 -> user_trade_modify_cancel_status_change_request_message_record.user_id[user_trade_modify_cancel_status_change_request_message_at] = (user_trade_modify_cancel_status_change_request_message_base + 0 + user_trade_modify_cancel_status_change_request_message_at + 1) % 256; user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  user_trade_modify_cancel_status_change_request_message_record.trd_mod_cxl_bit = (user_trade_modify_cancel_status_change_request_message_base + 4 + 1) % 256;
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 7 -> user_trade_modify_cancel_status_change_request_message_record.reserved_7[user_trade_modify_cancel_status_change_request_message_at] = (user_trade_modify_cancel_status_change_request_message_base + 5 + user_trade_modify_cancel_status_change_request_message_at + 1) % 256; user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Trade Modify Cancel Status Change Request Message to the wire, 12 bytes from where the cursor stands */
inline encode_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_record) {
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 4 -> wire[at] = user_trade_modify_cancel_status_change_request_message_record.user_id[user_trade_modify_cancel_status_change_request_message_at]; at = at + 1; user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  wire[at] = user_trade_modify_cancel_status_change_request_message_record.trd_mod_cxl_bit; at = at + 1;
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 7 -> wire[at] = user_trade_modify_cancel_status_change_request_message_record.reserved_7[user_trade_modify_cancel_status_change_request_message_at]; at = at + 1; user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Trade Modify Cancel Status Change Request Message off the wire, 12 bytes from where the cursor stands */
inline decode_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_record) {
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 4 -> user_trade_modify_cancel_status_change_request_message_record.user_id[user_trade_modify_cancel_status_change_request_message_at] = wire[at]; at = at + 1; user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  user_trade_modify_cancel_status_change_request_message_record.trd_mod_cxl_bit = wire[at]; at = at + 1;
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 7 -> user_trade_modify_cancel_status_change_request_message_record.reserved_7[user_trade_modify_cancel_status_change_request_message_at] = wire[at]; at = at + 1; user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Trade Modify Cancel Status Change Request Message is what was written, byte for byte */
inline equal_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_read, user_trade_modify_cancel_status_change_request_message_written) {
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 4 -> assert(user_trade_modify_cancel_status_change_request_message_read.user_id[user_trade_modify_cancel_status_change_request_message_at] == user_trade_modify_cancel_status_change_request_message_written.user_id[user_trade_modify_cancel_status_change_request_message_at]); user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  assert(user_trade_modify_cancel_status_change_request_message_read.trd_mod_cxl_bit == user_trade_modify_cancel_status_change_request_message_written.trd_mod_cxl_bit);
  user_trade_modify_cancel_status_change_request_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_request_message_at < 7 -> assert(user_trade_modify_cancel_status_change_request_message_read.reserved_7[user_trade_modify_cancel_status_change_request_message_at] == user_trade_modify_cancel_status_change_request_message_written.reserved_7[user_trade_modify_cancel_status_change_request_message_at]); user_trade_modify_cancel_status_change_request_message_at = user_trade_modify_cancel_status_change_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- User Address Unlock Request Message: 74 bytes --------------------------- */

/* Requests that a locked user be unlocked */
typedef UserAddressUnlockRequestMessage {
  byte user_id[4];
  byte reserved_70[70]
};

int user_address_unlock_request_message_at;

/* every byte of User Address Unlock Request Message set to one value */
inline fill_user_address_unlock_request_message(user_address_unlock_request_message_record, user_address_unlock_request_message_value) {
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 4 -> user_address_unlock_request_message_record.user_id[user_address_unlock_request_message_at] = user_address_unlock_request_message_value; user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 70 -> user_address_unlock_request_message_record.reserved_70[user_address_unlock_request_message_at] = user_address_unlock_request_message_value; user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Address Unlock Request Message set to where it lies, so a field read out of place says so */
inline ramp_user_address_unlock_request_message(user_address_unlock_request_message_record, user_address_unlock_request_message_base) {
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 4 -> user_address_unlock_request_message_record.user_id[user_address_unlock_request_message_at] = (user_address_unlock_request_message_base + 0 + user_address_unlock_request_message_at + 1) % 256; user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 70 -> user_address_unlock_request_message_record.reserved_70[user_address_unlock_request_message_at] = (user_address_unlock_request_message_base + 4 + user_address_unlock_request_message_at + 1) % 256; user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Request Message to the wire, 74 bytes from where the cursor stands */
inline encode_user_address_unlock_request_message(user_address_unlock_request_message_record) {
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 4 -> wire[at] = user_address_unlock_request_message_record.user_id[user_address_unlock_request_message_at]; at = at + 1; user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 70 -> wire[at] = user_address_unlock_request_message_record.reserved_70[user_address_unlock_request_message_at]; at = at + 1; user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Request Message off the wire, 74 bytes from where the cursor stands */
inline decode_user_address_unlock_request_message(user_address_unlock_request_message_record) {
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 4 -> user_address_unlock_request_message_record.user_id[user_address_unlock_request_message_at] = wire[at]; at = at + 1; user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 70 -> user_address_unlock_request_message_record.reserved_70[user_address_unlock_request_message_at] = wire[at]; at = at + 1; user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Address Unlock Request Message is what was written, byte for byte */
inline equal_user_address_unlock_request_message(user_address_unlock_request_message_read, user_address_unlock_request_message_written) {
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 4 -> assert(user_address_unlock_request_message_read.user_id[user_address_unlock_request_message_at] == user_address_unlock_request_message_written.user_id[user_address_unlock_request_message_at]); user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  user_address_unlock_request_message_at = 0;
  do
  :: user_address_unlock_request_message_at < 70 -> assert(user_address_unlock_request_message_read.reserved_70[user_address_unlock_request_message_at] == user_address_unlock_request_message_written.reserved_70[user_address_unlock_request_message_at]); user_address_unlock_request_message_at = user_address_unlock_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Nlt Order Inquiry Request Message: 6 bytes ------------------------------ */

/* One time inquiry by a corporate manager for the negotiated large trade counter orders placed against the member */
typedef NltOrderInquiryRequestMessage {
  byte broker_id[5];
  byte reserved_1
};

int nlt_order_inquiry_request_message_at;

/* every byte of Nlt Order Inquiry Request Message set to one value */
inline fill_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_record, nlt_order_inquiry_request_message_value) {
  nlt_order_inquiry_request_message_at = 0;
  do
  :: nlt_order_inquiry_request_message_at < 5 -> nlt_order_inquiry_request_message_record.broker_id[nlt_order_inquiry_request_message_at] = nlt_order_inquiry_request_message_value; nlt_order_inquiry_request_message_at = nlt_order_inquiry_request_message_at + 1
  :: else -> break
  od;
  nlt_order_inquiry_request_message_record.reserved_1 = nlt_order_inquiry_request_message_value;
  skip
}

/* each byte of Nlt Order Inquiry Request Message set to where it lies, so a field read out of place says so */
inline ramp_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_record, nlt_order_inquiry_request_message_base) {
  nlt_order_inquiry_request_message_at = 0;
  do
  :: nlt_order_inquiry_request_message_at < 5 -> nlt_order_inquiry_request_message_record.broker_id[nlt_order_inquiry_request_message_at] = (nlt_order_inquiry_request_message_base + 0 + nlt_order_inquiry_request_message_at + 1) % 256; nlt_order_inquiry_request_message_at = nlt_order_inquiry_request_message_at + 1
  :: else -> break
  od;
  nlt_order_inquiry_request_message_record.reserved_1 = (nlt_order_inquiry_request_message_base + 5 + 1) % 256;
  skip
}

/* Nlt Order Inquiry Request Message to the wire, 6 bytes from where the cursor stands */
inline encode_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_record) {
  nlt_order_inquiry_request_message_at = 0;
  do
  :: nlt_order_inquiry_request_message_at < 5 -> wire[at] = nlt_order_inquiry_request_message_record.broker_id[nlt_order_inquiry_request_message_at]; at = at + 1; nlt_order_inquiry_request_message_at = nlt_order_inquiry_request_message_at + 1
  :: else -> break
  od;
  wire[at] = nlt_order_inquiry_request_message_record.reserved_1; at = at + 1;
  skip
}

/* Nlt Order Inquiry Request Message off the wire, 6 bytes from where the cursor stands */
inline decode_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_record) {
  nlt_order_inquiry_request_message_at = 0;
  do
  :: nlt_order_inquiry_request_message_at < 5 -> nlt_order_inquiry_request_message_record.broker_id[nlt_order_inquiry_request_message_at] = wire[at]; at = at + 1; nlt_order_inquiry_request_message_at = nlt_order_inquiry_request_message_at + 1
  :: else -> break
  od;
  nlt_order_inquiry_request_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Nlt Order Inquiry Request Message is what was written, byte for byte */
inline equal_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_read, nlt_order_inquiry_request_message_written) {
  nlt_order_inquiry_request_message_at = 0;
  do
  :: nlt_order_inquiry_request_message_at < 5 -> assert(nlt_order_inquiry_request_message_read.broker_id[nlt_order_inquiry_request_message_at] == nlt_order_inquiry_request_message_written.broker_id[nlt_order_inquiry_request_message_at]); nlt_order_inquiry_request_message_at = nlt_order_inquiry_request_message_at + 1
  :: else -> break
  od;
  assert(nlt_order_inquiry_request_message_read.reserved_1 == nlt_order_inquiry_request_message_written.reserved_1);
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

/* System Information In Message: encoded, read back, and compared */
proctype check_system_information_in_message() {
  SystemInformationInMessage system_information_in_message_sent;
  SystemInformationInMessage system_information_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_information_in_message(system_information_in_message_sent, 0)
  :: pattern == 1 -> fill_system_information_in_message(system_information_in_message_sent, 32)
  :: pattern == 2 -> fill_system_information_in_message(system_information_in_message_sent, 255)
  :: else -> ramp_system_information_in_message(system_information_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_information_in_message(system_information_in_message_sent);
    assert(at == 4);
    at = 0;
    decode_system_information_in_message(system_information_in_message_got);
    assert(at == 4);
    equal_system_information_in_message(system_information_in_message_got, system_information_in_message_sent)
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

/* Update Local Database In Message: encoded, read back, and compared */
proctype check_update_local_database_in_message() {
  UpdateLocalDatabaseInMessage update_local_database_in_message_sent;
  UpdateLocalDatabaseInMessage update_local_database_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_local_database_in_message(update_local_database_in_message_sent, 0)
  :: pattern == 1 -> fill_update_local_database_in_message(update_local_database_in_message_sent, 32)
  :: pattern == 2 -> fill_update_local_database_in_message(update_local_database_in_message_sent, 255)
  :: else -> ramp_update_local_database_in_message(update_local_database_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_local_database_in_message(update_local_database_in_message_sent);
    assert(at == 42);
    at = 0;
    decode_update_local_database_in_message(update_local_database_in_message_got);
    assert(at == 42);
    equal_update_local_database_in_message(update_local_database_in_message_got, update_local_database_in_message_sent)
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

/* Trade Inquiry Body: encoded, read back, and compared */
proctype check_trade_inquiry_body() {
  TradeInquiryBody trade_inquiry_body_sent;
  TradeInquiryBody trade_inquiry_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_inquiry_body(trade_inquiry_body_sent, 0)
  :: pattern == 1 -> fill_trade_inquiry_body(trade_inquiry_body_sent, 32)
  :: pattern == 2 -> fill_trade_inquiry_body(trade_inquiry_body_sent, 255)
  :: else -> ramp_trade_inquiry_body(trade_inquiry_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_inquiry_body(trade_inquiry_body_sent);
    assert(at == 194);
    at = 0;
    decode_trade_inquiry_body(trade_inquiry_body_got);
    assert(at == 194);
    equal_trade_inquiry_body(trade_inquiry_body_got, trade_inquiry_body_sent)
  }
}

/* Trade Inquiry Message: encoded, read back, and compared */
proctype check_trade_inquiry_message() {
  TradeInquiryMessage trade_inquiry_message_sent;
  TradeInquiryMessage trade_inquiry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_inquiry_message(trade_inquiry_message_sent, 0)
  :: pattern == 1 -> fill_trade_inquiry_message(trade_inquiry_message_sent, 32)
  :: pattern == 2 -> fill_trade_inquiry_message(trade_inquiry_message_sent, 255)
  :: else -> ramp_trade_inquiry_message(trade_inquiry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_inquiry_message(trade_inquiry_message_sent);
    assert(at == 194);
    at = 0;
    decode_trade_inquiry_message(trade_inquiry_message_got);
    assert(at == 194);
    equal_trade_inquiry_message(trade_inquiry_message_got, trade_inquiry_message_sent)
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

/* Secure Box Registration Request In Message: encoded, read back, and compared */
proctype check_secure_box_registration_request_in_message() {
  SecureBoxRegistrationRequestInMessage secure_box_registration_request_in_message_sent;
  SecureBoxRegistrationRequestInMessage secure_box_registration_request_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent, 0)
  :: pattern == 1 -> fill_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent, 32)
  :: pattern == 2 -> fill_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent, 255)
  :: else -> ramp_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent);
    assert(at == 2);
    at = 0;
    decode_secure_box_registration_request_in_message(secure_box_registration_request_in_message_got);
    assert(at == 2);
    equal_secure_box_registration_request_in_message(secure_box_registration_request_in_message_got, secure_box_registration_request_in_message_sent)
  }
}

/* Box Sign On Request In Message: encoded, read back, and compared */
proctype check_box_sign_on_request_in_message() {
  BoxSignOnRequestInMessage box_sign_on_request_in_message_sent;
  BoxSignOnRequestInMessage box_sign_on_request_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_on_request_in_message(box_sign_on_request_in_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_on_request_in_message(box_sign_on_request_in_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_on_request_in_message(box_sign_on_request_in_message_sent, 255)
  :: else -> ramp_box_sign_on_request_in_message(box_sign_on_request_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_on_request_in_message(box_sign_on_request_in_message_sent);
    assert(at == 20);
    at = 0;
    decode_box_sign_on_request_in_message(box_sign_on_request_in_message_got);
    assert(at == 20);
    equal_box_sign_on_request_in_message(box_sign_on_request_in_message_got, box_sign_on_request_in_message_sent)
  }
}

/* Reset User Password Message: encoded, read back, and compared */
proctype check_reset_user_password_message() {
  ResetUserPasswordMessage reset_user_password_message_sent;
  ResetUserPasswordMessage reset_user_password_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_user_password_message(reset_user_password_message_sent, 0)
  :: pattern == 1 -> fill_reset_user_password_message(reset_user_password_message_sent, 32)
  :: pattern == 2 -> fill_reset_user_password_message(reset_user_password_message_sent, 255)
  :: else -> ramp_reset_user_password_message(reset_user_password_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_user_password_message(reset_user_password_message_sent);
    assert(at == 18);
    at = 0;
    decode_reset_user_password_message(reset_user_password_message_got);
    assert(at == 18);
    equal_reset_user_password_message(reset_user_password_message_got, reset_user_password_message_sent)
  }
}

/* Collateral User Status Change Request Message: encoded, read back, and compared */
proctype check_collateral_user_status_change_request_message() {
  CollateralUserStatusChangeRequestMessage collateral_user_status_change_request_message_sent;
  CollateralUserStatusChangeRequestMessage collateral_user_status_change_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_collateral_user_status_change_request_message(collateral_user_status_change_request_message_sent, 0)
  :: pattern == 1 -> fill_collateral_user_status_change_request_message(collateral_user_status_change_request_message_sent, 32)
  :: pattern == 2 -> fill_collateral_user_status_change_request_message(collateral_user_status_change_request_message_sent, 255)
  :: else -> ramp_collateral_user_status_change_request_message(collateral_user_status_change_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_collateral_user_status_change_request_message(collateral_user_status_change_request_message_sent);
    assert(at == 12);
    at = 0;
    decode_collateral_user_status_change_request_message(collateral_user_status_change_request_message_got);
    assert(at == 12);
    equal_collateral_user_status_change_request_message(collateral_user_status_change_request_message_got, collateral_user_status_change_request_message_sent)
  }
}

/* User Trade Modify Cancel Status Change Request Message: encoded, read back, and compared */
proctype check_user_trade_modify_cancel_status_change_request_message() {
  UserTradeModifyCancelStatusChangeRequestMessage user_trade_modify_cancel_status_change_request_message_sent;
  UserTradeModifyCancelStatusChangeRequestMessage user_trade_modify_cancel_status_change_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_sent, 0)
  :: pattern == 1 -> fill_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_sent, 32)
  :: pattern == 2 -> fill_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_sent, 255)
  :: else -> ramp_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_sent);
    assert(at == 12);
    at = 0;
    decode_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_got);
    assert(at == 12);
    equal_user_trade_modify_cancel_status_change_request_message(user_trade_modify_cancel_status_change_request_message_got, user_trade_modify_cancel_status_change_request_message_sent)
  }
}

/* User Address Unlock Request Message: encoded, read back, and compared */
proctype check_user_address_unlock_request_message() {
  UserAddressUnlockRequestMessage user_address_unlock_request_message_sent;
  UserAddressUnlockRequestMessage user_address_unlock_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_address_unlock_request_message(user_address_unlock_request_message_sent, 0)
  :: pattern == 1 -> fill_user_address_unlock_request_message(user_address_unlock_request_message_sent, 32)
  :: pattern == 2 -> fill_user_address_unlock_request_message(user_address_unlock_request_message_sent, 255)
  :: else -> ramp_user_address_unlock_request_message(user_address_unlock_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_address_unlock_request_message(user_address_unlock_request_message_sent);
    assert(at == 74);
    at = 0;
    decode_user_address_unlock_request_message(user_address_unlock_request_message_got);
    assert(at == 74);
    equal_user_address_unlock_request_message(user_address_unlock_request_message_got, user_address_unlock_request_message_sent)
  }
}

/* Nlt Order Inquiry Request Message: encoded, read back, and compared */
proctype check_nlt_order_inquiry_request_message() {
  NltOrderInquiryRequestMessage nlt_order_inquiry_request_message_sent;
  NltOrderInquiryRequestMessage nlt_order_inquiry_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_sent, 0)
  :: pattern == 1 -> fill_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_sent, 32)
  :: pattern == 2 -> fill_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_sent, 255)
  :: else -> ramp_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_sent);
    assert(at == 6);
    at = 0;
    decode_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_got);
    assert(at == 6);
    equal_nlt_order_inquiry_request_message(nlt_order_inquiry_request_message_got, nlt_order_inquiry_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_information_in_message()
  :: run check_st_market_status()
  :: run check_st_ex_market_status()
  :: run check_st_pl_market_status()
  :: run check_update_local_database_in_message()
  :: run check_contract_desc()
  :: run check_trade_inquiry_body()
  :: run check_trade_inquiry_message()
  :: run check_gateway_router_request_message()
  :: run check_secure_box_registration_request_in_message()
  :: run check_box_sign_on_request_in_message()
  :: run check_reset_user_password_message()
  :: run check_collateral_user_status_change_request_message()
  :: run check_user_trade_modify_cancel_status_change_request_message()
  :: run check_user_address_unlock_request_message()
  :: run check_nlt_order_inquiry_request_message()
  fi
}
