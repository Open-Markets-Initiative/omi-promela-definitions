/*
 * Japan Exchange Group Market By Order
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

/* ---- Packet Header: 26 bytes ------------------------------------------------- */

/* Jpx Flex 26 byte packet header */
typedef PacketHeader {
  byte multicast_group_number;
  byte number_of_system_reboots;
  byte sequence_number[4];
  byte issue_code[12];
  byte update_number[4];
  byte packet_number;
  byte total_number_of_packets;
  byte utility_flag;
  byte message_count
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_record.multicast_group_number = packet_header_value;
  packet_header_record.number_of_system_reboots = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 12 -> packet_header_record.issue_code[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.update_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.packet_number = packet_header_value;
  packet_header_record.total_number_of_packets = packet_header_value;
  packet_header_record.utility_flag = packet_header_value;
  packet_header_record.message_count = packet_header_value;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_record.multicast_group_number = (packet_header_base + 0 + 1) % 256;
  packet_header_record.number_of_system_reboots = (packet_header_base + 1 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 2 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 12 -> packet_header_record.issue_code[packet_header_at] = (packet_header_base + 6 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.update_number[packet_header_at] = (packet_header_base + 18 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.packet_number = (packet_header_base + 22 + 1) % 256;
  packet_header_record.total_number_of_packets = (packet_header_base + 23 + 1) % 256;
  packet_header_record.utility_flag = (packet_header_base + 24 + 1) % 256;
  packet_header_record.message_count = (packet_header_base + 25 + 1) % 256;
  skip
}

/* Packet Header to the wire, 26 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  wire[at] = packet_header_record.multicast_group_number; at = at + 1;
  wire[at] = packet_header_record.number_of_system_reboots; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 12 -> wire[at] = packet_header_record.issue_code[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.update_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.packet_number; at = at + 1;
  wire[at] = packet_header_record.total_number_of_packets; at = at + 1;
  wire[at] = packet_header_record.utility_flag; at = at + 1;
  wire[at] = packet_header_record.message_count; at = at + 1;
  skip
}

/* Packet Header off the wire, 26 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_record.multicast_group_number = wire[at]; at = at + 1;
  packet_header_record.number_of_system_reboots = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 12 -> packet_header_record.issue_code[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.update_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.packet_number = wire[at]; at = at + 1;
  packet_header_record.total_number_of_packets = wire[at]; at = at + 1;
  packet_header_record.utility_flag = wire[at]; at = at + 1;
  packet_header_record.message_count = wire[at]; at = at + 1;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  assert(packet_header_read.multicast_group_number == packet_header_written.multicast_group_number);
  assert(packet_header_read.number_of_system_reboots == packet_header_written.number_of_system_reboots);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 12 -> assert(packet_header_read.issue_code[packet_header_at] == packet_header_written.issue_code[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.update_number[packet_header_at] == packet_header_written.update_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.packet_number == packet_header_written.packet_number);
  assert(packet_header_read.total_number_of_packets == packet_header_written.total_number_of_packets);
  assert(packet_header_read.utility_flag == packet_header_written.utility_flag);
  assert(packet_header_read.message_count == packet_header_written.message_count);
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

/* Jpx Flex tag header carrying length prefix and message type discriminator */
typedef MessageHeader {
  byte tag_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.tag_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.tag_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.tag_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.tag_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.tag_length == message_header_written.tag_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Seconds Timestamp Message: 4 bytes -------------------------------------- */

/* Provides information about the time of processing on the Trading Server to the nearest second. Always delivered at the time the information is generated, except for Reset and Communication Control. Only one tag is delivered per process and stored at the top of the first packet. */
typedef SecondsTimestampMessage {
  byte time_seconds[4]
};

int seconds_timestamp_message_at;

/* every byte of Seconds Timestamp Message set to one value */
inline fill_seconds_timestamp_message(seconds_timestamp_message_record, seconds_timestamp_message_value) {
  seconds_timestamp_message_at = 0;
  do
  :: seconds_timestamp_message_at < 4 -> seconds_timestamp_message_record.time_seconds[seconds_timestamp_message_at] = seconds_timestamp_message_value; seconds_timestamp_message_at = seconds_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Seconds Timestamp Message set to where it lies, so a field read out of place says so */
inline ramp_seconds_timestamp_message(seconds_timestamp_message_record, seconds_timestamp_message_base) {
  seconds_timestamp_message_at = 0;
  do
  :: seconds_timestamp_message_at < 4 -> seconds_timestamp_message_record.time_seconds[seconds_timestamp_message_at] = (seconds_timestamp_message_base + 0 + seconds_timestamp_message_at + 1) % 256; seconds_timestamp_message_at = seconds_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Timestamp Message to the wire, 4 bytes from where the cursor stands */
inline encode_seconds_timestamp_message(seconds_timestamp_message_record) {
  seconds_timestamp_message_at = 0;
  do
  :: seconds_timestamp_message_at < 4 -> wire[at] = seconds_timestamp_message_record.time_seconds[seconds_timestamp_message_at]; at = at + 1; seconds_timestamp_message_at = seconds_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Timestamp Message off the wire, 4 bytes from where the cursor stands */
inline decode_seconds_timestamp_message(seconds_timestamp_message_record) {
  seconds_timestamp_message_at = 0;
  do
  :: seconds_timestamp_message_at < 4 -> seconds_timestamp_message_record.time_seconds[seconds_timestamp_message_at] = wire[at]; at = at + 1; seconds_timestamp_message_at = seconds_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Seconds Timestamp Message is what was written, byte for byte */
inline equal_seconds_timestamp_message(seconds_timestamp_message_read, seconds_timestamp_message_written) {
  seconds_timestamp_message_at = 0;
  do
  :: seconds_timestamp_message_at < 4 -> assert(seconds_timestamp_message_read.time_seconds[seconds_timestamp_message_at] == seconds_timestamp_message_written.time_seconds[seconds_timestamp_message_at]); seconds_timestamp_message_at = seconds_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 17 bytes ---------------------------------------- */

/* Provides information about the status of trading on a per-issue basis. Delivered when there is a change in the tag. */
typedef TradingStatusMessage {
  byte time_microseconds[4];
  byte market_status;
  byte status_flag[2];
  byte short_selling_status;
  byte pricing_method;
  byte book_center_price[8]
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_microseconds[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.market_status = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.status_flag[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.short_selling_status = trading_status_message_value;
  trading_status_message_record.pricing_method = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.book_center_price[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_microseconds[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.market_status = (trading_status_message_base + 4 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.status_flag[trading_status_message_at] = (trading_status_message_base + 5 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.short_selling_status = (trading_status_message_base + 7 + 1) % 256;
  trading_status_message_record.pricing_method = (trading_status_message_base + 8 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.book_center_price[trading_status_message_at] = (trading_status_message_base + 9 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message to the wire, 17 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.time_microseconds[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.market_status; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> wire[at] = trading_status_message_record.status_flag[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.short_selling_status; at = at + 1;
  wire[at] = trading_status_message_record.pricing_method; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.book_center_price[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message off the wire, 17 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_microseconds[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.market_status = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.status_flag[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.short_selling_status = wire[at]; at = at + 1;
  trading_status_message_record.pricing_method = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.book_center_price[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.time_microseconds[trading_status_message_at] == trading_status_message_written.time_microseconds[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.market_status == trading_status_message_written.market_status);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> assert(trading_status_message_read.status_flag[trading_status_message_at] == trading_status_message_written.status_flag[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.short_selling_status == trading_status_message_written.short_selling_status);
  assert(trading_status_message_read.pricing_method == trading_status_message_written.pricing_method);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.book_center_price[trading_status_message_at] == trading_status_message_written.book_center_price[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Summary Message: 45 bytes ------------------------------------- */

/* Provides summary information about execution. Delivered when an execution occurs. */
typedef ExecutionSummaryMessage {
  byte time_microseconds[4];
  byte triggered_side;
  byte total_volume[6];
  byte total_invalidation[6];
  byte last_price[8];
  byte match_id[4];
  byte best_offer[8];
  byte best_bid[8]
};

int execution_summary_message_at;

/* every byte of Execution Summary Message set to one value */
inline fill_execution_summary_message(execution_summary_message_record, execution_summary_message_value) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.time_microseconds[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_record.triggered_side = execution_summary_message_value;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> execution_summary_message_record.total_volume[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> execution_summary_message_record.total_invalidation[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.last_price[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.match_id[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.best_offer[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.best_bid[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Summary Message set to where it lies, so a field read out of place says so */
inline ramp_execution_summary_message(execution_summary_message_record, execution_summary_message_base) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.time_microseconds[execution_summary_message_at] = (execution_summary_message_base + 0 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_record.triggered_side = (execution_summary_message_base + 4 + 1) % 256;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> execution_summary_message_record.total_volume[execution_summary_message_at] = (execution_summary_message_base + 5 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> execution_summary_message_record.total_invalidation[execution_summary_message_at] = (execution_summary_message_base + 11 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.last_price[execution_summary_message_at] = (execution_summary_message_base + 17 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.match_id[execution_summary_message_at] = (execution_summary_message_base + 25 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.best_offer[execution_summary_message_at] = (execution_summary_message_base + 29 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.best_bid[execution_summary_message_at] = (execution_summary_message_base + 37 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary Message to the wire, 45 bytes from where the cursor stands */
inline encode_execution_summary_message(execution_summary_message_record) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> wire[at] = execution_summary_message_record.time_microseconds[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_summary_message_record.triggered_side; at = at + 1;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> wire[at] = execution_summary_message_record.total_volume[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> wire[at] = execution_summary_message_record.total_invalidation[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.last_price[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> wire[at] = execution_summary_message_record.match_id[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.best_offer[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.best_bid[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary Message off the wire, 45 bytes from where the cursor stands */
inline decode_execution_summary_message(execution_summary_message_record) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.time_microseconds[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_record.triggered_side = wire[at]; at = at + 1;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> execution_summary_message_record.total_volume[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> execution_summary_message_record.total_invalidation[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.last_price[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.match_id[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.best_offer[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.best_bid[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Summary Message is what was written, byte for byte */
inline equal_execution_summary_message(execution_summary_message_read, execution_summary_message_written) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> assert(execution_summary_message_read.time_microseconds[execution_summary_message_at] == execution_summary_message_written.time_microseconds[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  assert(execution_summary_message_read.triggered_side == execution_summary_message_written.triggered_side);
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> assert(execution_summary_message_read.total_volume[execution_summary_message_at] == execution_summary_message_written.total_volume[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> assert(execution_summary_message_read.total_invalidation[execution_summary_message_at] == execution_summary_message_written.total_invalidation[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.last_price[execution_summary_message_at] == execution_summary_message_written.last_price[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> assert(execution_summary_message_read.match_id[execution_summary_message_at] == execution_summary_message_written.match_id[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.best_offer[execution_summary_message_at] == execution_summary_message_written.best_offer[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.best_bid[execution_summary_message_at] == execution_summary_message_written.best_bid[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message: 25 bytes --------------------------------------------- */

/* Provides information about book registration. Delivered when a new order or modification order is registered. */
typedef AddOrderMessage {
  byte time_microseconds[4];
  byte order_id[4];
  byte side;
  byte quantity[6];
  byte price[8];
  byte order_condition;
  byte modification_flag
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.time_microseconds[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_condition = add_order_message_value;
  add_order_message_record.modification_flag = add_order_message_value;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.time_microseconds[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_id[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = (add_order_message_base + 8 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.quantity[add_order_message_at] = (add_order_message_base + 9 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 15 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_condition = (add_order_message_base + 23 + 1) % 256;
  add_order_message_record.modification_flag = (add_order_message_base + 24 + 1) % 256;
  skip
}

/* Add Order Message to the wire, 25 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.time_microseconds[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.order_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.side; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> wire[at] = add_order_message_record.quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.order_condition; at = at + 1;
  wire[at] = add_order_message_record.modification_flag; at = at + 1;
  skip
}

/* Add Order Message off the wire, 25 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.time_microseconds[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_condition = wire[at]; at = at + 1;
  add_order_message_record.modification_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.time_microseconds[add_order_message_at] == add_order_message_written.time_microseconds[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.order_id[add_order_message_at] == add_order_message_written.order_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.side == add_order_message_written.side);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> assert(add_order_message_read.quantity[add_order_message_at] == add_order_message_written.quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.order_condition == add_order_message_written.order_condition);
  assert(add_order_message_read.modification_flag == add_order_message_written.modification_flag);
  skip
}

/* ---- Order Executed Message: 19 bytes ---------------------------------------- */

/* Provides information about registered orders in case of Zaraba execution. Delivered when an execution occurs in Zaraba. */
typedef OrderExecutedMessage {
  byte time_microseconds[4];
  byte order_id[4];
  byte side;
  byte volume[6];
  byte match_id[4]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_microseconds[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.volume[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_microseconds[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = (order_executed_message_base + 8 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.volume[order_executed_message_at] = (order_executed_message_base + 9 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_id[order_executed_message_at] = (order_executed_message_base + 15 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 19 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.time_microseconds[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.side; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> wire[at] = order_executed_message_record.volume[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.match_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 19 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_microseconds[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.volume[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.time_microseconds[order_executed_message_at] == order_executed_message_written.time_microseconds[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.side == order_executed_message_written.side);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> assert(order_executed_message_read.volume[order_executed_message_at] == order_executed_message_written.volume[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.match_id[order_executed_message_at] == order_executed_message_written.match_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Message: 28 bytes ----------------------------- */

/* Provides information about registered orders in case of Itayose execution. Delivered when an execution occurs by the Itayose method or while an SQ or STQ is displayed. */
typedef OrderExecutedWithPriceMessage {
  byte time_microseconds[4];
  byte order_id[4];
  byte side;
  byte volume[6];
  byte match_id[4];
  byte execution_price[8];
  byte adopted_pricing_method
};

int order_executed_with_price_message_at;

/* every byte of Order Executed With Price Message set to one value */
inline fill_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_value) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.time_microseconds[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.order_id[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.side = order_executed_with_price_message_value;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> order_executed_with_price_message_record.volume[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_id[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.adopted_pricing_method = order_executed_with_price_message_value;
  skip
}

/* each byte of Order Executed With Price Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_base) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.time_microseconds[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 0 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.order_id[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 4 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.side = (order_executed_with_price_message_base + 8 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> order_executed_with_price_message_record.volume[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 9 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_id[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 15 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 19 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.adopted_pricing_method = (order_executed_with_price_message_base + 27 + 1) % 256;
  skip
}

/* Order Executed With Price Message to the wire, 28 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.time_microseconds[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.order_id[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.side; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> wire[at] = order_executed_with_price_message_record.volume[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.match_id[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.adopted_pricing_method; at = at + 1;
  skip
}

/* Order Executed With Price Message off the wire, 28 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.time_microseconds[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.order_id[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.side = wire[at]; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> order_executed_with_price_message_record.volume[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_id[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.adopted_pricing_method = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Executed With Price Message is what was written, byte for byte */
inline equal_order_executed_with_price_message(order_executed_with_price_message_read, order_executed_with_price_message_written) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.time_microseconds[order_executed_with_price_message_at] == order_executed_with_price_message_written.time_microseconds[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.order_id[order_executed_with_price_message_at] == order_executed_with_price_message_written.order_id[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.side == order_executed_with_price_message_written.side);
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> assert(order_executed_with_price_message_read.volume[order_executed_with_price_message_at] == order_executed_with_price_message_written.volume[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.match_id[order_executed_with_price_message_at] == order_executed_with_price_message_written.match_id[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.execution_price[order_executed_with_price_message_at] == order_executed_with_price_message_written.execution_price[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.adopted_pricing_method == order_executed_with_price_message_written.adopted_pricing_method);
  skip
}

/* ---- Order Delete Message: 10 bytes ------------------------------------------ */

/* Provides information about order deletion from the order book. Delivered when an order is deleted via a cancel order or a modification order or when a registered order expires. */
typedef OrderDeleteMessage {
  byte time_microseconds[4];
  byte order_id[4];
  byte side;
  byte modification_flag
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.time_microseconds[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.order_id[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_record.side = order_delete_message_value;
  order_delete_message_record.modification_flag = order_delete_message_value;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.time_microseconds[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.order_id[order_delete_message_at] = (order_delete_message_base + 4 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_record.side = (order_delete_message_base + 8 + 1) % 256;
  order_delete_message_record.modification_flag = (order_delete_message_base + 9 + 1) % 256;
  skip
}

/* Order Delete Message to the wire, 10 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.time_microseconds[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.order_id[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  wire[at] = order_delete_message_record.side; at = at + 1;
  wire[at] = order_delete_message_record.modification_flag; at = at + 1;
  skip
}

/* Order Delete Message off the wire, 10 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.time_microseconds[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.order_id[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_record.side = wire[at]; at = at + 1;
  order_delete_message_record.modification_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> assert(order_delete_message_read.time_microseconds[order_delete_message_at] == order_delete_message_written.time_microseconds[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> assert(order_delete_message_read.order_id[order_delete_message_at] == order_delete_message_written.order_id[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  assert(order_delete_message_read.side == order_delete_message_written.side);
  assert(order_delete_message_read.modification_flag == order_delete_message_written.modification_flag);
  skip
}

/* ---- Reset Message: 1 bytes -------------------------------------------------- */

/* A tag requesting the resetting (i.e. cancellation) of all distributed information. When the user receives this tag, the user must clear all valid A tags. */
typedef ResetMessage {
  byte reset_start_end_flag
};

/* every byte of Reset Message set to one value */
inline fill_reset_message(reset_message_record, reset_message_value) {
  reset_message_record.reset_start_end_flag = reset_message_value;
  skip
}

/* each byte of Reset Message set to where it lies, so a field read out of place says so */
inline ramp_reset_message(reset_message_record, reset_message_base) {
  reset_message_record.reset_start_end_flag = (reset_message_base + 0 + 1) % 256;
  skip
}

/* Reset Message to the wire, 1 bytes from where the cursor stands */
inline encode_reset_message(reset_message_record) {
  wire[at] = reset_message_record.reset_start_end_flag; at = at + 1;
  skip
}

/* Reset Message off the wire, 1 bytes from where the cursor stands */
inline decode_reset_message(reset_message_record) {
  reset_message_record.reset_start_end_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Reset Message is what was written, byte for byte */
inline equal_reset_message(reset_message_read, reset_message_written) {
  assert(reset_message_read.reset_start_end_flag == reset_message_written.reset_start_end_flag);
  skip
}

/* ---- Communication Control Message: 2 bytes ---------------------------------- */

/* Provides information about communication control. Delivered when communication starts and ends, and in between at minute intervals. */
typedef CommunicationControlMessage {
  byte test_mode_flag;
  byte communication_start_end_flag
};

/* every byte of Communication Control Message set to one value */
inline fill_communication_control_message(communication_control_message_record, communication_control_message_value) {
  communication_control_message_record.test_mode_flag = communication_control_message_value;
  communication_control_message_record.communication_start_end_flag = communication_control_message_value;
  skip
}

/* each byte of Communication Control Message set to where it lies, so a field read out of place says so */
inline ramp_communication_control_message(communication_control_message_record, communication_control_message_base) {
  communication_control_message_record.test_mode_flag = (communication_control_message_base + 0 + 1) % 256;
  communication_control_message_record.communication_start_end_flag = (communication_control_message_base + 1 + 1) % 256;
  skip
}

/* Communication Control Message to the wire, 2 bytes from where the cursor stands */
inline encode_communication_control_message(communication_control_message_record) {
  wire[at] = communication_control_message_record.test_mode_flag; at = at + 1;
  wire[at] = communication_control_message_record.communication_start_end_flag; at = at + 1;
  skip
}

/* Communication Control Message off the wire, 2 bytes from where the cursor stands */
inline decode_communication_control_message(communication_control_message_record) {
  communication_control_message_record.test_mode_flag = wire[at]; at = at + 1;
  communication_control_message_record.communication_start_end_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Communication Control Message is what was written, byte for byte */
inline equal_communication_control_message(communication_control_message_read, communication_control_message_written) {
  assert(communication_control_message_read.test_mode_flag == communication_control_message_written.test_mode_flag);
  assert(communication_control_message_read.communication_start_end_flag == communication_control_message_written.communication_start_end_flag);
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
    assert(at == 26);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 26);
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

/* Seconds Timestamp Message: encoded, read back, and compared */
proctype check_seconds_timestamp_message() {
  SecondsTimestampMessage seconds_timestamp_message_sent;
  SecondsTimestampMessage seconds_timestamp_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_seconds_timestamp_message(seconds_timestamp_message_sent, 0)
  :: pattern == 1 -> fill_seconds_timestamp_message(seconds_timestamp_message_sent, 32)
  :: pattern == 2 -> fill_seconds_timestamp_message(seconds_timestamp_message_sent, 255)
  :: else -> ramp_seconds_timestamp_message(seconds_timestamp_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_seconds_timestamp_message(seconds_timestamp_message_sent);
    assert(at == 4);
    at = 0;
    decode_seconds_timestamp_message(seconds_timestamp_message_got);
    assert(at == 4);
    equal_seconds_timestamp_message(seconds_timestamp_message_got, seconds_timestamp_message_sent)
  }
}

/* Trading Status Message: encoded, read back, and compared */
proctype check_trading_status_message() {
  TradingStatusMessage trading_status_message_sent;
  TradingStatusMessage trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_message(trading_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_message(trading_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_message(trading_status_message_sent, 255)
  :: else -> ramp_trading_status_message(trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_message(trading_status_message_sent);
    assert(at == 17);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 17);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Execution Summary Message: encoded, read back, and compared */
proctype check_execution_summary_message() {
  ExecutionSummaryMessage execution_summary_message_sent;
  ExecutionSummaryMessage execution_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_summary_message(execution_summary_message_sent, 0)
  :: pattern == 1 -> fill_execution_summary_message(execution_summary_message_sent, 32)
  :: pattern == 2 -> fill_execution_summary_message(execution_summary_message_sent, 255)
  :: else -> ramp_execution_summary_message(execution_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_summary_message(execution_summary_message_sent);
    assert(at == 45);
    at = 0;
    decode_execution_summary_message(execution_summary_message_got);
    assert(at == 45);
    equal_execution_summary_message(execution_summary_message_got, execution_summary_message_sent)
  }
}

/* Add Order Message: encoded, read back, and compared */
proctype check_add_order_message() {
  AddOrderMessage add_order_message_sent;
  AddOrderMessage add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message(add_order_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message(add_order_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message(add_order_message_sent, 255)
  :: else -> ramp_add_order_message(add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message(add_order_message_sent);
    assert(at == 25);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 25);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 19);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 19);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed With Price Message: encoded, read back, and compared */
proctype check_order_executed_with_price_message() {
  OrderExecutedWithPriceMessage order_executed_with_price_message_sent;
  OrderExecutedWithPriceMessage order_executed_with_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 255)
  :: else -> ramp_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_with_price_message(order_executed_with_price_message_sent);
    assert(at == 28);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 28);
    equal_order_executed_with_price_message(order_executed_with_price_message_got, order_executed_with_price_message_sent)
  }
}

/* Order Delete Message: encoded, read back, and compared */
proctype check_order_delete_message() {
  OrderDeleteMessage order_delete_message_sent;
  OrderDeleteMessage order_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete_message(order_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_delete_message(order_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_delete_message(order_delete_message_sent, 255)
  :: else -> ramp_order_delete_message(order_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete_message(order_delete_message_sent);
    assert(at == 10);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 10);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Reset Message: encoded, read back, and compared */
proctype check_reset_message() {
  ResetMessage reset_message_sent;
  ResetMessage reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_message(reset_message_sent, 0)
  :: pattern == 1 -> fill_reset_message(reset_message_sent, 32)
  :: pattern == 2 -> fill_reset_message(reset_message_sent, 255)
  :: else -> ramp_reset_message(reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_message(reset_message_sent);
    assert(at == 1);
    at = 0;
    decode_reset_message(reset_message_got);
    assert(at == 1);
    equal_reset_message(reset_message_got, reset_message_sent)
  }
}

/* Communication Control Message: encoded, read back, and compared */
proctype check_communication_control_message() {
  CommunicationControlMessage communication_control_message_sent;
  CommunicationControlMessage communication_control_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_communication_control_message(communication_control_message_sent, 0)
  :: pattern == 1 -> fill_communication_control_message(communication_control_message_sent, 32)
  :: pattern == 2 -> fill_communication_control_message(communication_control_message_sent, 255)
  :: else -> ramp_communication_control_message(communication_control_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_communication_control_message(communication_control_message_sent);
    assert(at == 2);
    at = 0;
    decode_communication_control_message(communication_control_message_got);
    assert(at == 2);
    equal_communication_control_message(communication_control_message_got, communication_control_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_seconds_timestamp_message()
  :: run check_trading_status_message()
  :: run check_execution_summary_message()
  :: run check_add_order_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_order_delete_message()
  :: run check_reset_message()
  :: run check_communication_control_message()
  fi
}
