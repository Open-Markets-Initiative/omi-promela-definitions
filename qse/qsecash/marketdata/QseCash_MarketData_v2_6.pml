/*
 * Qatar Stock Exchange Qse Cash Market Data
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
 *   - a field filling what is left of what holds it
 *   - a run filling what frames it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 964

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* All messages contain a common packet header, so that a client implements line level protocol processing once and then develops parsing algorithms only for its choice of message */
typedef PacketHeader {
  byte packet_length[2];
  byte packet_type[2];
  byte packet_sequence_number[4];
  byte send_time[4];
  byte service_id[2];
  byte delivery_flag;
  byte number_msg_entries
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
  :: packet_header_at < 2 -> packet_header_record.packet_type[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.send_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.service_id[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = packet_header_value;
  packet_header_record.number_msg_entries = packet_header_value;
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
  :: packet_header_at < 2 -> packet_header_record.packet_type[packet_header_at] = (packet_header_base + 2 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.send_time[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.service_id[packet_header_at] = (packet_header_base + 12 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = (packet_header_base + 14 + 1) % 256;
  packet_header_record.number_msg_entries = (packet_header_base + 15 + 1) % 256;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_type[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.packet_sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.send_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.service_id[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.delivery_flag; at = at + 1;
  wire[at] = packet_header_record.number_msg_entries; at = at + 1;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_type[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.send_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.service_id[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = wire[at]; at = at + 1;
  packet_header_record.number_msg_entries = wire[at]; at = at + 1;
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
  :: packet_header_at < 2 -> assert(packet_header_read.packet_type[packet_header_at] == packet_header_written.packet_type[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.packet_sequence_number[packet_header_at] == packet_header_written.packet_sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.send_time[packet_header_at] == packet_header_written.send_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.service_id[packet_header_at] == packet_header_written.service_id[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.delivery_flag == packet_header_written.delivery_flag);
  assert(packet_header_read.number_msg_entries == packet_header_written.number_msg_entries);
  skip
}

/* ---- Message Header: 4 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_size[2];
  byte message_type[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 4 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_size[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 4 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_size[message_header_at] == message_header_written.message_size[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock State Change Message: 48 bytes ------------------------------------ */

/* A Stock State Change message is generated by the trading engines to announce a change in the state of an instrument. */
typedef StockStateChangeMessage {
  byte symbol_index[4];
  byte source_seq_num[4];
  byte source_time[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte filler_binary_int_2[2];
  byte start_date_halting[8];
  byte start_time_halting[6];
  byte prog_opening_time[6];
  byte order_entry_rejection;
  byte instrument_state;
  byte instrument_trading_status;
  byte halt_reason;
  byte action_affecting_state;
  byte instrument_state_tcs;
  byte period_side;
  byte filler_binary_int_1
};

int stock_state_change_message_at;

/* every byte of Stock State Change Message set to one value */
inline fill_stock_state_change_message(stock_state_change_message_record, stock_state_change_message_value) {
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.symbol_index[stock_state_change_message_at] = stock_state_change_message_value; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.source_seq_num[stock_state_change_message_at] = stock_state_change_message_value; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.source_time[stock_state_change_message_at] = stock_state_change_message_value; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.system_id[stock_state_change_message_at] = stock_state_change_message_value; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> stock_state_change_message_record.source_time_micro_secs[stock_state_change_message_at] = stock_state_change_message_value; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> stock_state_change_message_record.filler_binary_int_2[stock_state_change_message_at] = stock_state_change_message_value; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 8 -> stock_state_change_message_record.start_date_halting[stock_state_change_message_at] = stock_state_change_message_value; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> stock_state_change_message_record.start_time_halting[stock_state_change_message_at] = stock_state_change_message_value; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> stock_state_change_message_record.prog_opening_time[stock_state_change_message_at] = stock_state_change_message_value; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_record.order_entry_rejection = stock_state_change_message_value;
  stock_state_change_message_record.instrument_state = stock_state_change_message_value;
  stock_state_change_message_record.instrument_trading_status = stock_state_change_message_value;
  stock_state_change_message_record.halt_reason = stock_state_change_message_value;
  stock_state_change_message_record.action_affecting_state = stock_state_change_message_value;
  stock_state_change_message_record.instrument_state_tcs = stock_state_change_message_value;
  stock_state_change_message_record.period_side = stock_state_change_message_value;
  stock_state_change_message_record.filler_binary_int_1 = stock_state_change_message_value;
  skip
}

/* each byte of Stock State Change Message set to where it lies, so a field read out of place says so */
inline ramp_stock_state_change_message(stock_state_change_message_record, stock_state_change_message_base) {
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.symbol_index[stock_state_change_message_at] = (stock_state_change_message_base + 0 + stock_state_change_message_at + 1) % 256; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.source_seq_num[stock_state_change_message_at] = (stock_state_change_message_base + 4 + stock_state_change_message_at + 1) % 256; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.source_time[stock_state_change_message_at] = (stock_state_change_message_base + 8 + stock_state_change_message_at + 1) % 256; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.system_id[stock_state_change_message_at] = (stock_state_change_message_base + 12 + stock_state_change_message_at + 1) % 256; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> stock_state_change_message_record.source_time_micro_secs[stock_state_change_message_at] = (stock_state_change_message_base + 16 + stock_state_change_message_at + 1) % 256; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> stock_state_change_message_record.filler_binary_int_2[stock_state_change_message_at] = (stock_state_change_message_base + 18 + stock_state_change_message_at + 1) % 256; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 8 -> stock_state_change_message_record.start_date_halting[stock_state_change_message_at] = (stock_state_change_message_base + 20 + stock_state_change_message_at + 1) % 256; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> stock_state_change_message_record.start_time_halting[stock_state_change_message_at] = (stock_state_change_message_base + 28 + stock_state_change_message_at + 1) % 256; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> stock_state_change_message_record.prog_opening_time[stock_state_change_message_at] = (stock_state_change_message_base + 34 + stock_state_change_message_at + 1) % 256; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_record.order_entry_rejection = (stock_state_change_message_base + 40 + 1) % 256;
  stock_state_change_message_record.instrument_state = (stock_state_change_message_base + 41 + 1) % 256;
  stock_state_change_message_record.instrument_trading_status = (stock_state_change_message_base + 42 + 1) % 256;
  stock_state_change_message_record.halt_reason = (stock_state_change_message_base + 43 + 1) % 256;
  stock_state_change_message_record.action_affecting_state = (stock_state_change_message_base + 44 + 1) % 256;
  stock_state_change_message_record.instrument_state_tcs = (stock_state_change_message_base + 45 + 1) % 256;
  stock_state_change_message_record.period_side = (stock_state_change_message_base + 46 + 1) % 256;
  stock_state_change_message_record.filler_binary_int_1 = (stock_state_change_message_base + 47 + 1) % 256;
  skip
}

/* Stock State Change Message to the wire, 48 bytes from where the cursor stands */
inline encode_stock_state_change_message(stock_state_change_message_record) {
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> wire[at] = stock_state_change_message_record.symbol_index[stock_state_change_message_at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> wire[at] = stock_state_change_message_record.source_seq_num[stock_state_change_message_at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> wire[at] = stock_state_change_message_record.source_time[stock_state_change_message_at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> wire[at] = stock_state_change_message_record.system_id[stock_state_change_message_at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> wire[at] = stock_state_change_message_record.source_time_micro_secs[stock_state_change_message_at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> wire[at] = stock_state_change_message_record.filler_binary_int_2[stock_state_change_message_at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 8 -> wire[at] = stock_state_change_message_record.start_date_halting[stock_state_change_message_at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> wire[at] = stock_state_change_message_record.start_time_halting[stock_state_change_message_at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> wire[at] = stock_state_change_message_record.prog_opening_time[stock_state_change_message_at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_state_change_message_record.order_entry_rejection; at = at + 1;
  wire[at] = stock_state_change_message_record.instrument_state; at = at + 1;
  wire[at] = stock_state_change_message_record.instrument_trading_status; at = at + 1;
  wire[at] = stock_state_change_message_record.halt_reason; at = at + 1;
  wire[at] = stock_state_change_message_record.action_affecting_state; at = at + 1;
  wire[at] = stock_state_change_message_record.instrument_state_tcs; at = at + 1;
  wire[at] = stock_state_change_message_record.period_side; at = at + 1;
  wire[at] = stock_state_change_message_record.filler_binary_int_1; at = at + 1;
  skip
}

/* Stock State Change Message off the wire, 48 bytes from where the cursor stands */
inline decode_stock_state_change_message(stock_state_change_message_record) {
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.symbol_index[stock_state_change_message_at] = wire[at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.source_seq_num[stock_state_change_message_at] = wire[at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.source_time[stock_state_change_message_at] = wire[at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> stock_state_change_message_record.system_id[stock_state_change_message_at] = wire[at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> stock_state_change_message_record.source_time_micro_secs[stock_state_change_message_at] = wire[at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> stock_state_change_message_record.filler_binary_int_2[stock_state_change_message_at] = wire[at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 8 -> stock_state_change_message_record.start_date_halting[stock_state_change_message_at] = wire[at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> stock_state_change_message_record.start_time_halting[stock_state_change_message_at] = wire[at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> stock_state_change_message_record.prog_opening_time[stock_state_change_message_at] = wire[at]; at = at + 1; stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_record.order_entry_rejection = wire[at]; at = at + 1;
  stock_state_change_message_record.instrument_state = wire[at]; at = at + 1;
  stock_state_change_message_record.instrument_trading_status = wire[at]; at = at + 1;
  stock_state_change_message_record.halt_reason = wire[at]; at = at + 1;
  stock_state_change_message_record.action_affecting_state = wire[at]; at = at + 1;
  stock_state_change_message_record.instrument_state_tcs = wire[at]; at = at + 1;
  stock_state_change_message_record.period_side = wire[at]; at = at + 1;
  stock_state_change_message_record.filler_binary_int_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock State Change Message is what was written, byte for byte */
inline equal_stock_state_change_message(stock_state_change_message_read, stock_state_change_message_written) {
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> assert(stock_state_change_message_read.symbol_index[stock_state_change_message_at] == stock_state_change_message_written.symbol_index[stock_state_change_message_at]); stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> assert(stock_state_change_message_read.source_seq_num[stock_state_change_message_at] == stock_state_change_message_written.source_seq_num[stock_state_change_message_at]); stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> assert(stock_state_change_message_read.source_time[stock_state_change_message_at] == stock_state_change_message_written.source_time[stock_state_change_message_at]); stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 4 -> assert(stock_state_change_message_read.system_id[stock_state_change_message_at] == stock_state_change_message_written.system_id[stock_state_change_message_at]); stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> assert(stock_state_change_message_read.source_time_micro_secs[stock_state_change_message_at] == stock_state_change_message_written.source_time_micro_secs[stock_state_change_message_at]); stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 2 -> assert(stock_state_change_message_read.filler_binary_int_2[stock_state_change_message_at] == stock_state_change_message_written.filler_binary_int_2[stock_state_change_message_at]); stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 8 -> assert(stock_state_change_message_read.start_date_halting[stock_state_change_message_at] == stock_state_change_message_written.start_date_halting[stock_state_change_message_at]); stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> assert(stock_state_change_message_read.start_time_halting[stock_state_change_message_at] == stock_state_change_message_written.start_time_halting[stock_state_change_message_at]); stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  stock_state_change_message_at = 0;
  do
  :: stock_state_change_message_at < 6 -> assert(stock_state_change_message_read.prog_opening_time[stock_state_change_message_at] == stock_state_change_message_written.prog_opening_time[stock_state_change_message_at]); stock_state_change_message_at = stock_state_change_message_at + 1
  :: else -> break
  od;
  assert(stock_state_change_message_read.order_entry_rejection == stock_state_change_message_written.order_entry_rejection);
  assert(stock_state_change_message_read.instrument_state == stock_state_change_message_written.instrument_state);
  assert(stock_state_change_message_read.instrument_trading_status == stock_state_change_message_written.instrument_trading_status);
  assert(stock_state_change_message_read.halt_reason == stock_state_change_message_written.halt_reason);
  assert(stock_state_change_message_read.action_affecting_state == stock_state_change_message_written.action_affecting_state);
  assert(stock_state_change_message_read.instrument_state_tcs == stock_state_change_message_written.instrument_state_tcs);
  assert(stock_state_change_message_read.period_side == stock_state_change_message_written.period_side);
  assert(stock_state_change_message_read.filler_binary_int_1 == stock_state_change_message_written.filler_binary_int_1);
  skip
}

/* ---- Class State Change Message: 24 bytes ------------------------------------ */

/* A Class State Change message announces a change in the trading market phase of a class or instrument group, which instruments belonging to it inherit. */
typedef ClassStateChangeMessage {
  byte source_seq_num[4];
  byte source_time[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte instrument_group_code[3];
  byte instrument_group_state;
  byte session_type;
  byte filler_binary_int_1;
  byte class_state[4]
};

int class_state_change_message_at;

/* every byte of Class State Change Message set to one value */
inline fill_class_state_change_message(class_state_change_message_record, class_state_change_message_value) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_seq_num[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_time[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.system_id[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> class_state_change_message_record.source_time_micro_secs[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> class_state_change_message_record.instrument_group_code[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_record.instrument_group_state = class_state_change_message_value;
  class_state_change_message_record.session_type = class_state_change_message_value;
  class_state_change_message_record.filler_binary_int_1 = class_state_change_message_value;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.class_state[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Class State Change Message set to where it lies, so a field read out of place says so */
inline ramp_class_state_change_message(class_state_change_message_record, class_state_change_message_base) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_seq_num[class_state_change_message_at] = (class_state_change_message_base + 0 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_time[class_state_change_message_at] = (class_state_change_message_base + 4 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.system_id[class_state_change_message_at] = (class_state_change_message_base + 8 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> class_state_change_message_record.source_time_micro_secs[class_state_change_message_at] = (class_state_change_message_base + 12 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> class_state_change_message_record.instrument_group_code[class_state_change_message_at] = (class_state_change_message_base + 14 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_record.instrument_group_state = (class_state_change_message_base + 17 + 1) % 256;
  class_state_change_message_record.session_type = (class_state_change_message_base + 18 + 1) % 256;
  class_state_change_message_record.filler_binary_int_1 = (class_state_change_message_base + 19 + 1) % 256;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.class_state[class_state_change_message_at] = (class_state_change_message_base + 20 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Class State Change Message to the wire, 24 bytes from where the cursor stands */
inline encode_class_state_change_message(class_state_change_message_record) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> wire[at] = class_state_change_message_record.source_seq_num[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> wire[at] = class_state_change_message_record.source_time[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> wire[at] = class_state_change_message_record.system_id[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> wire[at] = class_state_change_message_record.source_time_micro_secs[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> wire[at] = class_state_change_message_record.instrument_group_code[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  wire[at] = class_state_change_message_record.instrument_group_state; at = at + 1;
  wire[at] = class_state_change_message_record.session_type; at = at + 1;
  wire[at] = class_state_change_message_record.filler_binary_int_1; at = at + 1;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> wire[at] = class_state_change_message_record.class_state[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Class State Change Message off the wire, 24 bytes from where the cursor stands */
inline decode_class_state_change_message(class_state_change_message_record) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_seq_num[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_time[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.system_id[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> class_state_change_message_record.source_time_micro_secs[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> class_state_change_message_record.instrument_group_code[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_record.instrument_group_state = wire[at]; at = at + 1;
  class_state_change_message_record.session_type = wire[at]; at = at + 1;
  class_state_change_message_record.filler_binary_int_1 = wire[at]; at = at + 1;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.class_state[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Class State Change Message is what was written, byte for byte */
inline equal_class_state_change_message(class_state_change_message_read, class_state_change_message_written) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> assert(class_state_change_message_read.source_seq_num[class_state_change_message_at] == class_state_change_message_written.source_seq_num[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> assert(class_state_change_message_read.source_time[class_state_change_message_at] == class_state_change_message_written.source_time[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> assert(class_state_change_message_read.system_id[class_state_change_message_at] == class_state_change_message_written.system_id[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> assert(class_state_change_message_read.source_time_micro_secs[class_state_change_message_at] == class_state_change_message_written.source_time_micro_secs[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> assert(class_state_change_message_read.instrument_group_code[class_state_change_message_at] == class_state_change_message_written.instrument_group_code[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  assert(class_state_change_message_read.instrument_group_state == class_state_change_message_written.instrument_group_state);
  assert(class_state_change_message_read.session_type == class_state_change_message_written.session_type);
  assert(class_state_change_message_read.filler_binary_int_1 == class_state_change_message_written.filler_binary_int_1);
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> assert(class_state_change_message_read.class_state[class_state_change_message_at] == class_state_change_message_written.class_state[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mail Message: 964 bytes ------------------------------------------------- */

/* A Mail message carries a free text notice broadcast to market participants. */
typedef MailMessage {
  byte source_seq_num[4];
  byte source_time[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte e_mail_msg_number[2];
  byte number_of_message[2];
  byte sequence_number[2];
  byte instrument_group_code[3];
  byte filler_ascii_str_1;
  byte priority_indicator;
  byte type_of_message;
  byte address_type[2];
  byte title[80];
  byte text[854];
  byte filler_ascii_str_2[2]
};

int mail_message_at;

/* every byte of Mail Message set to one value */
inline fill_mail_message(mail_message_record, mail_message_value) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_seq_num[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_time[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.system_id[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.source_time_micro_secs[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.e_mail_msg_number[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.number_of_message[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.sequence_number[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> mail_message_record.instrument_group_code[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_record.filler_ascii_str_1 = mail_message_value;
  mail_message_record.priority_indicator = mail_message_value;
  mail_message_record.type_of_message = mail_message_value;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.address_type[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> mail_message_record.title[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 854 -> mail_message_record.text[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.filler_ascii_str_2[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mail Message set to where it lies, so a field read out of place says so */
inline ramp_mail_message(mail_message_record, mail_message_base) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_seq_num[mail_message_at] = (mail_message_base + 0 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_time[mail_message_at] = (mail_message_base + 4 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.system_id[mail_message_at] = (mail_message_base + 8 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.source_time_micro_secs[mail_message_at] = (mail_message_base + 12 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.e_mail_msg_number[mail_message_at] = (mail_message_base + 14 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.number_of_message[mail_message_at] = (mail_message_base + 16 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.sequence_number[mail_message_at] = (mail_message_base + 18 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> mail_message_record.instrument_group_code[mail_message_at] = (mail_message_base + 20 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_record.filler_ascii_str_1 = (mail_message_base + 23 + 1) % 256;
  mail_message_record.priority_indicator = (mail_message_base + 24 + 1) % 256;
  mail_message_record.type_of_message = (mail_message_base + 25 + 1) % 256;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.address_type[mail_message_at] = (mail_message_base + 26 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> mail_message_record.title[mail_message_at] = (mail_message_base + 28 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 854 -> mail_message_record.text[mail_message_at] = (mail_message_base + 108 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.filler_ascii_str_2[mail_message_at] = (mail_message_base + 962 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mail Message to the wire, 964 bytes from where the cursor stands */
inline encode_mail_message(mail_message_record) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> wire[at] = mail_message_record.source_seq_num[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> wire[at] = mail_message_record.source_time[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> wire[at] = mail_message_record.system_id[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> wire[at] = mail_message_record.source_time_micro_secs[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> wire[at] = mail_message_record.e_mail_msg_number[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> wire[at] = mail_message_record.number_of_message[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> wire[at] = mail_message_record.sequence_number[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> wire[at] = mail_message_record.instrument_group_code[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  wire[at] = mail_message_record.filler_ascii_str_1; at = at + 1;
  wire[at] = mail_message_record.priority_indicator; at = at + 1;
  wire[at] = mail_message_record.type_of_message; at = at + 1;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> wire[at] = mail_message_record.address_type[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> wire[at] = mail_message_record.title[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 854 -> wire[at] = mail_message_record.text[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> wire[at] = mail_message_record.filler_ascii_str_2[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mail Message off the wire, 964 bytes from where the cursor stands */
inline decode_mail_message(mail_message_record) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_seq_num[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_time[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.system_id[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.source_time_micro_secs[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.e_mail_msg_number[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.number_of_message[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.sequence_number[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> mail_message_record.instrument_group_code[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_record.filler_ascii_str_1 = wire[at]; at = at + 1;
  mail_message_record.priority_indicator = wire[at]; at = at + 1;
  mail_message_record.type_of_message = wire[at]; at = at + 1;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.address_type[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> mail_message_record.title[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 854 -> mail_message_record.text[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.filler_ascii_str_2[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mail Message is what was written, byte for byte */
inline equal_mail_message(mail_message_read, mail_message_written) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> assert(mail_message_read.source_seq_num[mail_message_at] == mail_message_written.source_seq_num[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> assert(mail_message_read.source_time[mail_message_at] == mail_message_written.source_time[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> assert(mail_message_read.system_id[mail_message_at] == mail_message_written.system_id[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> assert(mail_message_read.source_time_micro_secs[mail_message_at] == mail_message_written.source_time_micro_secs[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> assert(mail_message_read.e_mail_msg_number[mail_message_at] == mail_message_written.e_mail_msg_number[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> assert(mail_message_read.number_of_message[mail_message_at] == mail_message_written.number_of_message[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> assert(mail_message_read.sequence_number[mail_message_at] == mail_message_written.sequence_number[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> assert(mail_message_read.instrument_group_code[mail_message_at] == mail_message_written.instrument_group_code[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  assert(mail_message_read.filler_ascii_str_1 == mail_message_written.filler_ascii_str_1);
  assert(mail_message_read.priority_indicator == mail_message_written.priority_indicator);
  assert(mail_message_read.type_of_message == mail_message_written.type_of_message);
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> assert(mail_message_read.address_type[mail_message_at] == mail_message_written.address_type[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> assert(mail_message_read.title[mail_message_at] == mail_message_written.title[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 854 -> assert(mail_message_read.text[mail_message_at] == mail_message_written.text[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> assert(mail_message_read.filler_ascii_str_2[mail_message_at] == mail_message_written.filler_ascii_str_2[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Matching Price Message: 32 bytes ----------------------------- */

/* An Indicative Matching Price message gives the price at which the instrument would open, were the opening to occur at this moment. */
typedef IndicativeMatchingPriceMessage {
  byte symbol_index[4];
  byte source_seq_num[4];
  byte source_time[4];
  byte im_price[4];
  byte variation[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte price_scale_code;
  byte variation_scale_code;
  byte im_volume[4]
};

int indicative_matching_price_message_at;

/* every byte of Indicative Matching Price Message set to one value */
inline fill_indicative_matching_price_message(indicative_matching_price_message_record, indicative_matching_price_message_value) {
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.symbol_index[indicative_matching_price_message_at] = indicative_matching_price_message_value; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.source_seq_num[indicative_matching_price_message_at] = indicative_matching_price_message_value; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.source_time[indicative_matching_price_message_at] = indicative_matching_price_message_value; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.im_price[indicative_matching_price_message_at] = indicative_matching_price_message_value; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.variation[indicative_matching_price_message_at] = indicative_matching_price_message_value; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.system_id[indicative_matching_price_message_at] = indicative_matching_price_message_value; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 2 -> indicative_matching_price_message_record.source_time_micro_secs[indicative_matching_price_message_at] = indicative_matching_price_message_value; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_record.price_scale_code = indicative_matching_price_message_value;
  indicative_matching_price_message_record.variation_scale_code = indicative_matching_price_message_value;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.im_volume[indicative_matching_price_message_at] = indicative_matching_price_message_value; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indicative Matching Price Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_matching_price_message(indicative_matching_price_message_record, indicative_matching_price_message_base) {
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.symbol_index[indicative_matching_price_message_at] = (indicative_matching_price_message_base + 0 + indicative_matching_price_message_at + 1) % 256; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.source_seq_num[indicative_matching_price_message_at] = (indicative_matching_price_message_base + 4 + indicative_matching_price_message_at + 1) % 256; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.source_time[indicative_matching_price_message_at] = (indicative_matching_price_message_base + 8 + indicative_matching_price_message_at + 1) % 256; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.im_price[indicative_matching_price_message_at] = (indicative_matching_price_message_base + 12 + indicative_matching_price_message_at + 1) % 256; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.variation[indicative_matching_price_message_at] = (indicative_matching_price_message_base + 16 + indicative_matching_price_message_at + 1) % 256; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.system_id[indicative_matching_price_message_at] = (indicative_matching_price_message_base + 20 + indicative_matching_price_message_at + 1) % 256; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 2 -> indicative_matching_price_message_record.source_time_micro_secs[indicative_matching_price_message_at] = (indicative_matching_price_message_base + 24 + indicative_matching_price_message_at + 1) % 256; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_record.price_scale_code = (indicative_matching_price_message_base + 26 + 1) % 256;
  indicative_matching_price_message_record.variation_scale_code = (indicative_matching_price_message_base + 27 + 1) % 256;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.im_volume[indicative_matching_price_message_at] = (indicative_matching_price_message_base + 28 + indicative_matching_price_message_at + 1) % 256; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Matching Price Message to the wire, 32 bytes from where the cursor stands */
inline encode_indicative_matching_price_message(indicative_matching_price_message_record) {
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> wire[at] = indicative_matching_price_message_record.symbol_index[indicative_matching_price_message_at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> wire[at] = indicative_matching_price_message_record.source_seq_num[indicative_matching_price_message_at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> wire[at] = indicative_matching_price_message_record.source_time[indicative_matching_price_message_at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> wire[at] = indicative_matching_price_message_record.im_price[indicative_matching_price_message_at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> wire[at] = indicative_matching_price_message_record.variation[indicative_matching_price_message_at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> wire[at] = indicative_matching_price_message_record.system_id[indicative_matching_price_message_at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 2 -> wire[at] = indicative_matching_price_message_record.source_time_micro_secs[indicative_matching_price_message_at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  wire[at] = indicative_matching_price_message_record.price_scale_code; at = at + 1;
  wire[at] = indicative_matching_price_message_record.variation_scale_code; at = at + 1;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> wire[at] = indicative_matching_price_message_record.im_volume[indicative_matching_price_message_at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Matching Price Message off the wire, 32 bytes from where the cursor stands */
inline decode_indicative_matching_price_message(indicative_matching_price_message_record) {
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.symbol_index[indicative_matching_price_message_at] = wire[at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.source_seq_num[indicative_matching_price_message_at] = wire[at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.source_time[indicative_matching_price_message_at] = wire[at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.im_price[indicative_matching_price_message_at] = wire[at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.variation[indicative_matching_price_message_at] = wire[at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.system_id[indicative_matching_price_message_at] = wire[at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 2 -> indicative_matching_price_message_record.source_time_micro_secs[indicative_matching_price_message_at] = wire[at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_record.price_scale_code = wire[at]; at = at + 1;
  indicative_matching_price_message_record.variation_scale_code = wire[at]; at = at + 1;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> indicative_matching_price_message_record.im_volume[indicative_matching_price_message_at] = wire[at]; at = at + 1; indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indicative Matching Price Message is what was written, byte for byte */
inline equal_indicative_matching_price_message(indicative_matching_price_message_read, indicative_matching_price_message_written) {
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> assert(indicative_matching_price_message_read.symbol_index[indicative_matching_price_message_at] == indicative_matching_price_message_written.symbol_index[indicative_matching_price_message_at]); indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> assert(indicative_matching_price_message_read.source_seq_num[indicative_matching_price_message_at] == indicative_matching_price_message_written.source_seq_num[indicative_matching_price_message_at]); indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> assert(indicative_matching_price_message_read.source_time[indicative_matching_price_message_at] == indicative_matching_price_message_written.source_time[indicative_matching_price_message_at]); indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> assert(indicative_matching_price_message_read.im_price[indicative_matching_price_message_at] == indicative_matching_price_message_written.im_price[indicative_matching_price_message_at]); indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> assert(indicative_matching_price_message_read.variation[indicative_matching_price_message_at] == indicative_matching_price_message_written.variation[indicative_matching_price_message_at]); indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> assert(indicative_matching_price_message_read.system_id[indicative_matching_price_message_at] == indicative_matching_price_message_written.system_id[indicative_matching_price_message_at]); indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 2 -> assert(indicative_matching_price_message_read.source_time_micro_secs[indicative_matching_price_message_at] == indicative_matching_price_message_written.source_time_micro_secs[indicative_matching_price_message_at]); indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  assert(indicative_matching_price_message_read.price_scale_code == indicative_matching_price_message_written.price_scale_code);
  assert(indicative_matching_price_message_read.variation_scale_code == indicative_matching_price_message_written.variation_scale_code);
  indicative_matching_price_message_at = 0;
  do
  :: indicative_matching_price_message_at < 4 -> assert(indicative_matching_price_message_read.im_volume[indicative_matching_price_message_at] == indicative_matching_price_message_written.im_volume[indicative_matching_price_message_at]); indicative_matching_price_message_at = indicative_matching_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Collars Message: 32 bytes ----------------------------------------------- */

/* A Collars message gives the upper and lower price thresholds beyond which an instrument is reserved. */
typedef CollarsMessage {
  byte symbol_index[4];
  byte source_seq_num[4];
  byte source_time[4];
  byte high_collar[4];
  byte low_collar[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte high_scale_code;
  byte low_scale_code;
  byte collar_type;
  byte filler_ascii_str_3[3]
};

int collars_message_at;

/* every byte of Collars Message set to one value */
inline fill_collars_message(collars_message_record, collars_message_value) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.symbol_index[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_seq_num[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_time[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.high_collar[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.low_collar[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.system_id[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> collars_message_record.source_time_micro_secs[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_record.high_scale_code = collars_message_value;
  collars_message_record.low_scale_code = collars_message_value;
  collars_message_record.collar_type = collars_message_value;
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> collars_message_record.filler_ascii_str_3[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Collars Message set to where it lies, so a field read out of place says so */
inline ramp_collars_message(collars_message_record, collars_message_base) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.symbol_index[collars_message_at] = (collars_message_base + 0 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_seq_num[collars_message_at] = (collars_message_base + 4 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_time[collars_message_at] = (collars_message_base + 8 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.high_collar[collars_message_at] = (collars_message_base + 12 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.low_collar[collars_message_at] = (collars_message_base + 16 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.system_id[collars_message_at] = (collars_message_base + 20 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> collars_message_record.source_time_micro_secs[collars_message_at] = (collars_message_base + 24 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_record.high_scale_code = (collars_message_base + 26 + 1) % 256;
  collars_message_record.low_scale_code = (collars_message_base + 27 + 1) % 256;
  collars_message_record.collar_type = (collars_message_base + 28 + 1) % 256;
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> collars_message_record.filler_ascii_str_3[collars_message_at] = (collars_message_base + 29 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* Collars Message to the wire, 32 bytes from where the cursor stands */
inline encode_collars_message(collars_message_record) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.symbol_index[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.source_seq_num[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.source_time[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.high_collar[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.low_collar[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.system_id[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> wire[at] = collars_message_record.source_time_micro_secs[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  wire[at] = collars_message_record.high_scale_code; at = at + 1;
  wire[at] = collars_message_record.low_scale_code; at = at + 1;
  wire[at] = collars_message_record.collar_type; at = at + 1;
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> wire[at] = collars_message_record.filler_ascii_str_3[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* Collars Message off the wire, 32 bytes from where the cursor stands */
inline decode_collars_message(collars_message_record) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.symbol_index[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_seq_num[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_time[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.high_collar[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.low_collar[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.system_id[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> collars_message_record.source_time_micro_secs[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_record.high_scale_code = wire[at]; at = at + 1;
  collars_message_record.low_scale_code = wire[at]; at = at + 1;
  collars_message_record.collar_type = wire[at]; at = at + 1;
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> collars_message_record.filler_ascii_str_3[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Collars Message is what was written, byte for byte */
inline equal_collars_message(collars_message_read, collars_message_written) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.symbol_index[collars_message_at] == collars_message_written.symbol_index[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.source_seq_num[collars_message_at] == collars_message_written.source_seq_num[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.source_time[collars_message_at] == collars_message_written.source_time[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.high_collar[collars_message_at] == collars_message_written.high_collar[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.low_collar[collars_message_at] == collars_message_written.low_collar[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.system_id[collars_message_at] == collars_message_written.system_id[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> assert(collars_message_read.source_time_micro_secs[collars_message_at] == collars_message_written.source_time_micro_secs[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  assert(collars_message_read.high_scale_code == collars_message_written.high_scale_code);
  assert(collars_message_read.low_scale_code == collars_message_written.low_scale_code);
  assert(collars_message_read.collar_type == collars_message_written.collar_type);
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> assert(collars_message_read.filler_ascii_str_3[collars_message_at] == collars_message_written.filler_ascii_str_3[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Session Timetable Message: 80 bytes ------------------------------------- */

/* A Session Timetable message gives the timetable of the trading session for a group of instruments. */
typedef SessionTimetableMessage {
  byte source_seq_num[4];
  byte source_time[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte instrument_group_code[3];
  byte session_type;
  byte time_pre_opening_1[6];
  byte time_opening_1[6];
  byte time_closing_1[6];
  byte time_pre_opening_2[6];
  byte time_opening_2[6];
  byte time_closing_2[6];
  byte time_pre_opening_3[6];
  byte time_opening_3[6];
  byte time_closing_3[6];
  byte eod_time[6];
  byte filler_ascii_str_2[2]
};

int session_timetable_message_at;

/* every byte of Session Timetable Message set to one value */
inline fill_session_timetable_message(session_timetable_message_record, session_timetable_message_value) {
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> session_timetable_message_record.source_seq_num[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> session_timetable_message_record.source_time[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> session_timetable_message_record.system_id[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> session_timetable_message_record.source_time_micro_secs[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 3 -> session_timetable_message_record.instrument_group_code[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_record.session_type = session_timetable_message_value;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_pre_opening_1[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_opening_1[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_closing_1[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_pre_opening_2[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_opening_2[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_closing_2[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_pre_opening_3[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_opening_3[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_closing_3[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.eod_time[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> session_timetable_message_record.filler_ascii_str_2[session_timetable_message_at] = session_timetable_message_value; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Session Timetable Message set to where it lies, so a field read out of place says so */
inline ramp_session_timetable_message(session_timetable_message_record, session_timetable_message_base) {
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> session_timetable_message_record.source_seq_num[session_timetable_message_at] = (session_timetable_message_base + 0 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> session_timetable_message_record.source_time[session_timetable_message_at] = (session_timetable_message_base + 4 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> session_timetable_message_record.system_id[session_timetable_message_at] = (session_timetable_message_base + 8 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> session_timetable_message_record.source_time_micro_secs[session_timetable_message_at] = (session_timetable_message_base + 12 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 3 -> session_timetable_message_record.instrument_group_code[session_timetable_message_at] = (session_timetable_message_base + 14 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_record.session_type = (session_timetable_message_base + 17 + 1) % 256;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_pre_opening_1[session_timetable_message_at] = (session_timetable_message_base + 18 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_opening_1[session_timetable_message_at] = (session_timetable_message_base + 24 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_closing_1[session_timetable_message_at] = (session_timetable_message_base + 30 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_pre_opening_2[session_timetable_message_at] = (session_timetable_message_base + 36 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_opening_2[session_timetable_message_at] = (session_timetable_message_base + 42 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_closing_2[session_timetable_message_at] = (session_timetable_message_base + 48 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_pre_opening_3[session_timetable_message_at] = (session_timetable_message_base + 54 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_opening_3[session_timetable_message_at] = (session_timetable_message_base + 60 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_closing_3[session_timetable_message_at] = (session_timetable_message_base + 66 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.eod_time[session_timetable_message_at] = (session_timetable_message_base + 72 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> session_timetable_message_record.filler_ascii_str_2[session_timetable_message_at] = (session_timetable_message_base + 78 + session_timetable_message_at + 1) % 256; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  skip
}

/* Session Timetable Message to the wire, 80 bytes from where the cursor stands */
inline encode_session_timetable_message(session_timetable_message_record) {
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> wire[at] = session_timetable_message_record.source_seq_num[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> wire[at] = session_timetable_message_record.source_time[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> wire[at] = session_timetable_message_record.system_id[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> wire[at] = session_timetable_message_record.source_time_micro_secs[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 3 -> wire[at] = session_timetable_message_record.instrument_group_code[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  wire[at] = session_timetable_message_record.session_type; at = at + 1;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.time_pre_opening_1[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.time_opening_1[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.time_closing_1[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.time_pre_opening_2[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.time_opening_2[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.time_closing_2[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.time_pre_opening_3[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.time_opening_3[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.time_closing_3[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> wire[at] = session_timetable_message_record.eod_time[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> wire[at] = session_timetable_message_record.filler_ascii_str_2[session_timetable_message_at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  skip
}

/* Session Timetable Message off the wire, 80 bytes from where the cursor stands */
inline decode_session_timetable_message(session_timetable_message_record) {
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> session_timetable_message_record.source_seq_num[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> session_timetable_message_record.source_time[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> session_timetable_message_record.system_id[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> session_timetable_message_record.source_time_micro_secs[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 3 -> session_timetable_message_record.instrument_group_code[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_record.session_type = wire[at]; at = at + 1;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_pre_opening_1[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_opening_1[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_closing_1[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_pre_opening_2[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_opening_2[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_closing_2[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_pre_opening_3[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_opening_3[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.time_closing_3[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> session_timetable_message_record.eod_time[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> session_timetable_message_record.filler_ascii_str_2[session_timetable_message_at] = wire[at]; at = at + 1; session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Session Timetable Message is what was written, byte for byte */
inline equal_session_timetable_message(session_timetable_message_read, session_timetable_message_written) {
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> assert(session_timetable_message_read.source_seq_num[session_timetable_message_at] == session_timetable_message_written.source_seq_num[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> assert(session_timetable_message_read.source_time[session_timetable_message_at] == session_timetable_message_written.source_time[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 4 -> assert(session_timetable_message_read.system_id[session_timetable_message_at] == session_timetable_message_written.system_id[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> assert(session_timetable_message_read.source_time_micro_secs[session_timetable_message_at] == session_timetable_message_written.source_time_micro_secs[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 3 -> assert(session_timetable_message_read.instrument_group_code[session_timetable_message_at] == session_timetable_message_written.instrument_group_code[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  assert(session_timetable_message_read.session_type == session_timetable_message_written.session_type);
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.time_pre_opening_1[session_timetable_message_at] == session_timetable_message_written.time_pre_opening_1[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.time_opening_1[session_timetable_message_at] == session_timetable_message_written.time_opening_1[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.time_closing_1[session_timetable_message_at] == session_timetable_message_written.time_closing_1[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.time_pre_opening_2[session_timetable_message_at] == session_timetable_message_written.time_pre_opening_2[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.time_opening_2[session_timetable_message_at] == session_timetable_message_written.time_opening_2[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.time_closing_2[session_timetable_message_at] == session_timetable_message_written.time_closing_2[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.time_pre_opening_3[session_timetable_message_at] == session_timetable_message_written.time_pre_opening_3[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.time_opening_3[session_timetable_message_at] == session_timetable_message_written.time_opening_3[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.time_closing_3[session_timetable_message_at] == session_timetable_message_written.time_closing_3[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 6 -> assert(session_timetable_message_read.eod_time[session_timetable_message_at] == session_timetable_message_written.eod_time[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  session_timetable_message_at = 0;
  do
  :: session_timetable_message_at < 2 -> assert(session_timetable_message_read.filler_ascii_str_2[session_timetable_message_at] == session_timetable_message_written.filler_ascii_str_2[session_timetable_message_at]); session_timetable_message_at = session_timetable_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Global Market Activity Summary Message: 30 bytes ------------------------ */

/* A Global Market Activity Summary message provides an overall summary of the global market activity. This message is used only at Qatar Exchange. */
typedef GlobalMarketActivitySummaryMessage {
  byte source_seq_num[4];
  byte source_time[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte nb_trades[4];
  byte qty_shares[4];
  byte amount_traded[4];
  byte price_scale_code;
  byte filler_ascii_str_3[3]
};

int global_market_activity_summary_message_at;

/* every byte of Global Market Activity Summary Message set to one value */
inline fill_global_market_activity_summary_message(global_market_activity_summary_message_record, global_market_activity_summary_message_value) {
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.source_seq_num[global_market_activity_summary_message_at] = global_market_activity_summary_message_value; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.source_time[global_market_activity_summary_message_at] = global_market_activity_summary_message_value; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.system_id[global_market_activity_summary_message_at] = global_market_activity_summary_message_value; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 2 -> global_market_activity_summary_message_record.source_time_micro_secs[global_market_activity_summary_message_at] = global_market_activity_summary_message_value; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.nb_trades[global_market_activity_summary_message_at] = global_market_activity_summary_message_value; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.qty_shares[global_market_activity_summary_message_at] = global_market_activity_summary_message_value; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.amount_traded[global_market_activity_summary_message_at] = global_market_activity_summary_message_value; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_record.price_scale_code = global_market_activity_summary_message_value;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 3 -> global_market_activity_summary_message_record.filler_ascii_str_3[global_market_activity_summary_message_at] = global_market_activity_summary_message_value; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Global Market Activity Summary Message set to where it lies, so a field read out of place says so */
inline ramp_global_market_activity_summary_message(global_market_activity_summary_message_record, global_market_activity_summary_message_base) {
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.source_seq_num[global_market_activity_summary_message_at] = (global_market_activity_summary_message_base + 0 + global_market_activity_summary_message_at + 1) % 256; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.source_time[global_market_activity_summary_message_at] = (global_market_activity_summary_message_base + 4 + global_market_activity_summary_message_at + 1) % 256; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.system_id[global_market_activity_summary_message_at] = (global_market_activity_summary_message_base + 8 + global_market_activity_summary_message_at + 1) % 256; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 2 -> global_market_activity_summary_message_record.source_time_micro_secs[global_market_activity_summary_message_at] = (global_market_activity_summary_message_base + 12 + global_market_activity_summary_message_at + 1) % 256; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.nb_trades[global_market_activity_summary_message_at] = (global_market_activity_summary_message_base + 14 + global_market_activity_summary_message_at + 1) % 256; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.qty_shares[global_market_activity_summary_message_at] = (global_market_activity_summary_message_base + 18 + global_market_activity_summary_message_at + 1) % 256; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.amount_traded[global_market_activity_summary_message_at] = (global_market_activity_summary_message_base + 22 + global_market_activity_summary_message_at + 1) % 256; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_record.price_scale_code = (global_market_activity_summary_message_base + 26 + 1) % 256;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 3 -> global_market_activity_summary_message_record.filler_ascii_str_3[global_market_activity_summary_message_at] = (global_market_activity_summary_message_base + 27 + global_market_activity_summary_message_at + 1) % 256; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Global Market Activity Summary Message to the wire, 30 bytes from where the cursor stands */
inline encode_global_market_activity_summary_message(global_market_activity_summary_message_record) {
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> wire[at] = global_market_activity_summary_message_record.source_seq_num[global_market_activity_summary_message_at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> wire[at] = global_market_activity_summary_message_record.source_time[global_market_activity_summary_message_at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> wire[at] = global_market_activity_summary_message_record.system_id[global_market_activity_summary_message_at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 2 -> wire[at] = global_market_activity_summary_message_record.source_time_micro_secs[global_market_activity_summary_message_at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> wire[at] = global_market_activity_summary_message_record.nb_trades[global_market_activity_summary_message_at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> wire[at] = global_market_activity_summary_message_record.qty_shares[global_market_activity_summary_message_at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> wire[at] = global_market_activity_summary_message_record.amount_traded[global_market_activity_summary_message_at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = global_market_activity_summary_message_record.price_scale_code; at = at + 1;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 3 -> wire[at] = global_market_activity_summary_message_record.filler_ascii_str_3[global_market_activity_summary_message_at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Global Market Activity Summary Message off the wire, 30 bytes from where the cursor stands */
inline decode_global_market_activity_summary_message(global_market_activity_summary_message_record) {
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.source_seq_num[global_market_activity_summary_message_at] = wire[at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.source_time[global_market_activity_summary_message_at] = wire[at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.system_id[global_market_activity_summary_message_at] = wire[at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 2 -> global_market_activity_summary_message_record.source_time_micro_secs[global_market_activity_summary_message_at] = wire[at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.nb_trades[global_market_activity_summary_message_at] = wire[at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.qty_shares[global_market_activity_summary_message_at] = wire[at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> global_market_activity_summary_message_record.amount_traded[global_market_activity_summary_message_at] = wire[at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_record.price_scale_code = wire[at]; at = at + 1;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 3 -> global_market_activity_summary_message_record.filler_ascii_str_3[global_market_activity_summary_message_at] = wire[at]; at = at + 1; global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Global Market Activity Summary Message is what was written, byte for byte */
inline equal_global_market_activity_summary_message(global_market_activity_summary_message_read, global_market_activity_summary_message_written) {
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> assert(global_market_activity_summary_message_read.source_seq_num[global_market_activity_summary_message_at] == global_market_activity_summary_message_written.source_seq_num[global_market_activity_summary_message_at]); global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> assert(global_market_activity_summary_message_read.source_time[global_market_activity_summary_message_at] == global_market_activity_summary_message_written.source_time[global_market_activity_summary_message_at]); global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> assert(global_market_activity_summary_message_read.system_id[global_market_activity_summary_message_at] == global_market_activity_summary_message_written.system_id[global_market_activity_summary_message_at]); global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 2 -> assert(global_market_activity_summary_message_read.source_time_micro_secs[global_market_activity_summary_message_at] == global_market_activity_summary_message_written.source_time_micro_secs[global_market_activity_summary_message_at]); global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> assert(global_market_activity_summary_message_read.nb_trades[global_market_activity_summary_message_at] == global_market_activity_summary_message_written.nb_trades[global_market_activity_summary_message_at]); global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> assert(global_market_activity_summary_message_read.qty_shares[global_market_activity_summary_message_at] == global_market_activity_summary_message_written.qty_shares[global_market_activity_summary_message_at]); global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 4 -> assert(global_market_activity_summary_message_read.amount_traded[global_market_activity_summary_message_at] == global_market_activity_summary_message_written.amount_traded[global_market_activity_summary_message_at]); global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  assert(global_market_activity_summary_message_read.price_scale_code == global_market_activity_summary_message_written.price_scale_code);
  global_market_activity_summary_message_at = 0;
  do
  :: global_market_activity_summary_message_at < 3 -> assert(global_market_activity_summary_message_read.filler_ascii_str_3[global_market_activity_summary_message_at] == global_market_activity_summary_message_written.filler_ascii_str_3[global_market_activity_summary_message_at]); global_market_activity_summary_message_at = global_market_activity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Referential Message: 4 bytes -------------------------------------- */

/* A Start Referential message marks the beginning of the broadcast of the reference data. */
typedef StartReferentialMessage {
  byte indicator;
  byte filler_ascii_str_3[3]
};

int start_referential_message_at;

/* every byte of Start Referential Message set to one value */
inline fill_start_referential_message(start_referential_message_record, start_referential_message_value) {
  start_referential_message_record.indicator = start_referential_message_value;
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> start_referential_message_record.filler_ascii_str_3[start_referential_message_at] = start_referential_message_value; start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Referential Message set to where it lies, so a field read out of place says so */
inline ramp_start_referential_message(start_referential_message_record, start_referential_message_base) {
  start_referential_message_record.indicator = (start_referential_message_base + 0 + 1) % 256;
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> start_referential_message_record.filler_ascii_str_3[start_referential_message_at] = (start_referential_message_base + 1 + start_referential_message_at + 1) % 256; start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Referential Message to the wire, 4 bytes from where the cursor stands */
inline encode_start_referential_message(start_referential_message_record) {
  wire[at] = start_referential_message_record.indicator; at = at + 1;
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> wire[at] = start_referential_message_record.filler_ascii_str_3[start_referential_message_at]; at = at + 1; start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Referential Message off the wire, 4 bytes from where the cursor stands */
inline decode_start_referential_message(start_referential_message_record) {
  start_referential_message_record.indicator = wire[at]; at = at + 1;
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> start_referential_message_record.filler_ascii_str_3[start_referential_message_at] = wire[at]; at = at + 1; start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Referential Message is what was written, byte for byte */
inline equal_start_referential_message(start_referential_message_read, start_referential_message_written) {
  assert(start_referential_message_read.indicator == start_referential_message_written.indicator);
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> assert(start_referential_message_read.filler_ascii_str_3[start_referential_message_at] == start_referential_message_written.filler_ascii_str_3[start_referential_message_at]); start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Referential Message: 4 bytes ---------------------------------------- */

/* An End Referential message marks the end of the broadcast of the reference data. */
typedef EndReferentialMessage {
  byte indicator;
  byte filler_ascii_str_3[3]
};

int end_referential_message_at;

/* every byte of End Referential Message set to one value */
inline fill_end_referential_message(end_referential_message_record, end_referential_message_value) {
  end_referential_message_record.indicator = end_referential_message_value;
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> end_referential_message_record.filler_ascii_str_3[end_referential_message_at] = end_referential_message_value; end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Referential Message set to where it lies, so a field read out of place says so */
inline ramp_end_referential_message(end_referential_message_record, end_referential_message_base) {
  end_referential_message_record.indicator = (end_referential_message_base + 0 + 1) % 256;
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> end_referential_message_record.filler_ascii_str_3[end_referential_message_at] = (end_referential_message_base + 1 + end_referential_message_at + 1) % 256; end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Referential Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_referential_message(end_referential_message_record) {
  wire[at] = end_referential_message_record.indicator; at = at + 1;
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> wire[at] = end_referential_message_record.filler_ascii_str_3[end_referential_message_at]; at = at + 1; end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Referential Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_referential_message(end_referential_message_record) {
  end_referential_message_record.indicator = wire[at]; at = at + 1;
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> end_referential_message_record.filler_ascii_str_3[end_referential_message_at] = wire[at]; at = at + 1; end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Referential Message is what was written, byte for byte */
inline equal_end_referential_message(end_referential_message_read, end_referential_message_written) {
  assert(end_referential_message_read.indicator == end_referential_message_written.indicator);
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> assert(end_referential_message_read.filler_ascii_str_3[end_referential_message_at] == end_referential_message_written.filler_ascii_str_3[end_referential_message_at]); end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Referential Message: 492 bytes ------------------------------------------ */

/* A Referential message carries the characteristics of an instrument, including its standard identifiers, trading parameters and reference prices. */
typedef ReferentialMessage {
  byte symbol_index[4];
  byte source_seq_num[4];
  byte source_time[4];
  byte last_adj_price[4];
  byte system_id[4];
  byte prev_volume_traded[4];
  byte fix_price_tick[4];
  byte source_time_micro_secs[2];
  byte stock_exchange_code[2];
  byte type_of_instrument[2];
  byte event_date[8];
  byte instrument_name[18];
  byte period_indicator;
  byte type_of_market_admission;
  byte issuing_country_code[3];
  byte trading_currency[3];
  byte instrument_group_code[3];
  byte instrument_category;
  byte instrument_code[12];
  byte date_of_last_trade[8];
  byte underlying_repo_isin_code[12];
  byte repo_expiry_date[8];
  byte first_settlement_date[8];
  byte type_of_derivatives;
  byte bic_depositary[11];
  byte icb[4];
  byte mic[4];
  byte underlying_wisin_code[12];
  byte depositary_list[25];
  byte main_depositary[5];
  byte type_of_corporate_event[2];
  byte time_lag_euronext_utc[5];
  byte time_lag_mi_fid_reg_utc[5];
  byte cfi[6];
  byte quantity_notation[4];
  byte index_set_of_var_price_tick[2];
  byte market_feed_code[2];
  byte mic_list[24];
  byte industry_code[4];
  byte industry_text[100];
  byte financial_market_code[3];
  byte us_indicators[7];
  byte filler_ascii_str_2[2];
  byte prev_day_capital_traded[8];
  byte nom_mkt_price[8];
  byte lot_size[8];
  byte number_instrument_circ[8];
  byte shares_out[8];
  byte auth_shares[8];
  byte heading_number[2];
  byte section_number;
  byte repo_indicator;
  byte last_adj_price_scale_code;
  byte type_of_unit_exp;
  byte market_indicator;
  byte prev_day_capital_traded_scale_code;
  byte tax_code;
  byte nom_mkdt_price_scale_code;
  byte lot_size_scale_code;
  byte fix_price_tick_scale_code;
  byte mnemo[5];
  byte trading_code[12];
  byte filler_ascii_str_3[3];
  byte strike_price[4];
  byte strike_currency[3];
  byte strike_scale_code;
  byte currency_coef[4];
  byte currency_coef_scale_code;
  byte trading_currency_indicator;
  byte strike_currency_indicator;
  byte market_segment[2];
  byte algo;
  byte local_name[30];
  byte small_trade[4];
  byte filler_binary_int_12[12]
};

int referential_message_at;

/* every byte of Referential Message set to one value */
inline fill_referential_message(referential_message_record, referential_message_value) {
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.symbol_index[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.source_seq_num[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.source_time[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.last_adj_price[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.system_id[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.prev_volume_traded[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.fix_price_tick[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.source_time_micro_secs[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.stock_exchange_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.type_of_instrument[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.event_date[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 18 -> referential_message_record.instrument_name[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.period_indicator = referential_message_value;
  referential_message_record.type_of_market_admission = referential_message_value;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.issuing_country_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.trading_currency[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.instrument_group_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.instrument_category = referential_message_value;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.instrument_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.date_of_last_trade[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.underlying_repo_isin_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.repo_expiry_date[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.first_settlement_date[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.type_of_derivatives = referential_message_value;
  referential_message_at = 0;
  do
  :: referential_message_at < 11 -> referential_message_record.bic_depositary[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.icb[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.mic[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.underlying_wisin_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 25 -> referential_message_record.depositary_list[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.main_depositary[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.type_of_corporate_event[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.time_lag_euronext_utc[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.time_lag_mi_fid_reg_utc[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 6 -> referential_message_record.cfi[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.quantity_notation[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.index_set_of_var_price_tick[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.market_feed_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 24 -> referential_message_record.mic_list[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.industry_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 100 -> referential_message_record.industry_text[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.financial_market_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 7 -> referential_message_record.us_indicators[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.filler_ascii_str_2[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.prev_day_capital_traded[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.nom_mkt_price[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.lot_size[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.number_instrument_circ[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.shares_out[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.auth_shares[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.heading_number[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.section_number = referential_message_value;
  referential_message_record.repo_indicator = referential_message_value;
  referential_message_record.last_adj_price_scale_code = referential_message_value;
  referential_message_record.type_of_unit_exp = referential_message_value;
  referential_message_record.market_indicator = referential_message_value;
  referential_message_record.prev_day_capital_traded_scale_code = referential_message_value;
  referential_message_record.tax_code = referential_message_value;
  referential_message_record.nom_mkdt_price_scale_code = referential_message_value;
  referential_message_record.lot_size_scale_code = referential_message_value;
  referential_message_record.fix_price_tick_scale_code = referential_message_value;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.mnemo[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.trading_code[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.filler_ascii_str_3[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.strike_price[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.strike_currency[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.strike_scale_code = referential_message_value;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.currency_coef[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.currency_coef_scale_code = referential_message_value;
  referential_message_record.trading_currency_indicator = referential_message_value;
  referential_message_record.strike_currency_indicator = referential_message_value;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.market_segment[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.algo = referential_message_value;
  referential_message_at = 0;
  do
  :: referential_message_at < 30 -> referential_message_record.local_name[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.small_trade[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.filler_binary_int_12[referential_message_at] = referential_message_value; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Referential Message set to where it lies, so a field read out of place says so */
inline ramp_referential_message(referential_message_record, referential_message_base) {
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.symbol_index[referential_message_at] = (referential_message_base + 0 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.source_seq_num[referential_message_at] = (referential_message_base + 4 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.source_time[referential_message_at] = (referential_message_base + 8 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.last_adj_price[referential_message_at] = (referential_message_base + 12 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.system_id[referential_message_at] = (referential_message_base + 16 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.prev_volume_traded[referential_message_at] = (referential_message_base + 20 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.fix_price_tick[referential_message_at] = (referential_message_base + 24 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.source_time_micro_secs[referential_message_at] = (referential_message_base + 28 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.stock_exchange_code[referential_message_at] = (referential_message_base + 30 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.type_of_instrument[referential_message_at] = (referential_message_base + 32 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.event_date[referential_message_at] = (referential_message_base + 34 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 18 -> referential_message_record.instrument_name[referential_message_at] = (referential_message_base + 42 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.period_indicator = (referential_message_base + 60 + 1) % 256;
  referential_message_record.type_of_market_admission = (referential_message_base + 61 + 1) % 256;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.issuing_country_code[referential_message_at] = (referential_message_base + 62 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.trading_currency[referential_message_at] = (referential_message_base + 65 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.instrument_group_code[referential_message_at] = (referential_message_base + 68 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.instrument_category = (referential_message_base + 71 + 1) % 256;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.instrument_code[referential_message_at] = (referential_message_base + 72 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.date_of_last_trade[referential_message_at] = (referential_message_base + 84 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.underlying_repo_isin_code[referential_message_at] = (referential_message_base + 92 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.repo_expiry_date[referential_message_at] = (referential_message_base + 104 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.first_settlement_date[referential_message_at] = (referential_message_base + 112 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.type_of_derivatives = (referential_message_base + 120 + 1) % 256;
  referential_message_at = 0;
  do
  :: referential_message_at < 11 -> referential_message_record.bic_depositary[referential_message_at] = (referential_message_base + 121 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.icb[referential_message_at] = (referential_message_base + 132 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.mic[referential_message_at] = (referential_message_base + 136 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.underlying_wisin_code[referential_message_at] = (referential_message_base + 140 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 25 -> referential_message_record.depositary_list[referential_message_at] = (referential_message_base + 152 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.main_depositary[referential_message_at] = (referential_message_base + 177 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.type_of_corporate_event[referential_message_at] = (referential_message_base + 182 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.time_lag_euronext_utc[referential_message_at] = (referential_message_base + 184 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.time_lag_mi_fid_reg_utc[referential_message_at] = (referential_message_base + 189 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 6 -> referential_message_record.cfi[referential_message_at] = (referential_message_base + 194 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.quantity_notation[referential_message_at] = (referential_message_base + 200 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.index_set_of_var_price_tick[referential_message_at] = (referential_message_base + 204 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.market_feed_code[referential_message_at] = (referential_message_base + 206 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 24 -> referential_message_record.mic_list[referential_message_at] = (referential_message_base + 208 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.industry_code[referential_message_at] = (referential_message_base + 232 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 100 -> referential_message_record.industry_text[referential_message_at] = (referential_message_base + 236 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.financial_market_code[referential_message_at] = (referential_message_base + 336 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 7 -> referential_message_record.us_indicators[referential_message_at] = (referential_message_base + 339 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.filler_ascii_str_2[referential_message_at] = (referential_message_base + 346 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.prev_day_capital_traded[referential_message_at] = (referential_message_base + 348 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.nom_mkt_price[referential_message_at] = (referential_message_base + 356 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.lot_size[referential_message_at] = (referential_message_base + 364 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.number_instrument_circ[referential_message_at] = (referential_message_base + 372 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.shares_out[referential_message_at] = (referential_message_base + 380 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.auth_shares[referential_message_at] = (referential_message_base + 388 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.heading_number[referential_message_at] = (referential_message_base + 396 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.section_number = (referential_message_base + 398 + 1) % 256;
  referential_message_record.repo_indicator = (referential_message_base + 399 + 1) % 256;
  referential_message_record.last_adj_price_scale_code = (referential_message_base + 400 + 1) % 256;
  referential_message_record.type_of_unit_exp = (referential_message_base + 401 + 1) % 256;
  referential_message_record.market_indicator = (referential_message_base + 402 + 1) % 256;
  referential_message_record.prev_day_capital_traded_scale_code = (referential_message_base + 403 + 1) % 256;
  referential_message_record.tax_code = (referential_message_base + 404 + 1) % 256;
  referential_message_record.nom_mkdt_price_scale_code = (referential_message_base + 405 + 1) % 256;
  referential_message_record.lot_size_scale_code = (referential_message_base + 406 + 1) % 256;
  referential_message_record.fix_price_tick_scale_code = (referential_message_base + 407 + 1) % 256;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.mnemo[referential_message_at] = (referential_message_base + 408 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.trading_code[referential_message_at] = (referential_message_base + 413 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.filler_ascii_str_3[referential_message_at] = (referential_message_base + 425 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.strike_price[referential_message_at] = (referential_message_base + 428 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.strike_currency[referential_message_at] = (referential_message_base + 432 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.strike_scale_code = (referential_message_base + 435 + 1) % 256;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.currency_coef[referential_message_at] = (referential_message_base + 436 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.currency_coef_scale_code = (referential_message_base + 440 + 1) % 256;
  referential_message_record.trading_currency_indicator = (referential_message_base + 441 + 1) % 256;
  referential_message_record.strike_currency_indicator = (referential_message_base + 442 + 1) % 256;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.market_segment[referential_message_at] = (referential_message_base + 443 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.algo = (referential_message_base + 445 + 1) % 256;
  referential_message_at = 0;
  do
  :: referential_message_at < 30 -> referential_message_record.local_name[referential_message_at] = (referential_message_base + 446 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.small_trade[referential_message_at] = (referential_message_base + 476 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.filler_binary_int_12[referential_message_at] = (referential_message_base + 480 + referential_message_at + 1) % 256; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* Referential Message to the wire, 492 bytes from where the cursor stands */
inline encode_referential_message(referential_message_record) {
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.symbol_index[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.source_seq_num[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.source_time[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.last_adj_price[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.system_id[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.prev_volume_traded[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.fix_price_tick[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> wire[at] = referential_message_record.source_time_micro_secs[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> wire[at] = referential_message_record.stock_exchange_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> wire[at] = referential_message_record.type_of_instrument[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.event_date[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 18 -> wire[at] = referential_message_record.instrument_name[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  wire[at] = referential_message_record.period_indicator; at = at + 1;
  wire[at] = referential_message_record.type_of_market_admission; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> wire[at] = referential_message_record.issuing_country_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> wire[at] = referential_message_record.trading_currency[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> wire[at] = referential_message_record.instrument_group_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  wire[at] = referential_message_record.instrument_category; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> wire[at] = referential_message_record.instrument_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.date_of_last_trade[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> wire[at] = referential_message_record.underlying_repo_isin_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.repo_expiry_date[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.first_settlement_date[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  wire[at] = referential_message_record.type_of_derivatives; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 11 -> wire[at] = referential_message_record.bic_depositary[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.icb[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.mic[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> wire[at] = referential_message_record.underlying_wisin_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 25 -> wire[at] = referential_message_record.depositary_list[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> wire[at] = referential_message_record.main_depositary[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> wire[at] = referential_message_record.type_of_corporate_event[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> wire[at] = referential_message_record.time_lag_euronext_utc[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> wire[at] = referential_message_record.time_lag_mi_fid_reg_utc[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 6 -> wire[at] = referential_message_record.cfi[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.quantity_notation[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> wire[at] = referential_message_record.index_set_of_var_price_tick[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> wire[at] = referential_message_record.market_feed_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 24 -> wire[at] = referential_message_record.mic_list[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.industry_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 100 -> wire[at] = referential_message_record.industry_text[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> wire[at] = referential_message_record.financial_market_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 7 -> wire[at] = referential_message_record.us_indicators[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> wire[at] = referential_message_record.filler_ascii_str_2[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.prev_day_capital_traded[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.nom_mkt_price[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.lot_size[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.number_instrument_circ[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.shares_out[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> wire[at] = referential_message_record.auth_shares[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> wire[at] = referential_message_record.heading_number[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  wire[at] = referential_message_record.section_number; at = at + 1;
  wire[at] = referential_message_record.repo_indicator; at = at + 1;
  wire[at] = referential_message_record.last_adj_price_scale_code; at = at + 1;
  wire[at] = referential_message_record.type_of_unit_exp; at = at + 1;
  wire[at] = referential_message_record.market_indicator; at = at + 1;
  wire[at] = referential_message_record.prev_day_capital_traded_scale_code; at = at + 1;
  wire[at] = referential_message_record.tax_code; at = at + 1;
  wire[at] = referential_message_record.nom_mkdt_price_scale_code; at = at + 1;
  wire[at] = referential_message_record.lot_size_scale_code; at = at + 1;
  wire[at] = referential_message_record.fix_price_tick_scale_code; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> wire[at] = referential_message_record.mnemo[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> wire[at] = referential_message_record.trading_code[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> wire[at] = referential_message_record.filler_ascii_str_3[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.strike_price[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> wire[at] = referential_message_record.strike_currency[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  wire[at] = referential_message_record.strike_scale_code; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.currency_coef[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  wire[at] = referential_message_record.currency_coef_scale_code; at = at + 1;
  wire[at] = referential_message_record.trading_currency_indicator; at = at + 1;
  wire[at] = referential_message_record.strike_currency_indicator; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> wire[at] = referential_message_record.market_segment[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  wire[at] = referential_message_record.algo; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 30 -> wire[at] = referential_message_record.local_name[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> wire[at] = referential_message_record.small_trade[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> wire[at] = referential_message_record.filler_binary_int_12[referential_message_at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* Referential Message off the wire, 492 bytes from where the cursor stands */
inline decode_referential_message(referential_message_record) {
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.symbol_index[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.source_seq_num[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.source_time[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.last_adj_price[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.system_id[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.prev_volume_traded[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.fix_price_tick[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.source_time_micro_secs[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.stock_exchange_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.type_of_instrument[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.event_date[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 18 -> referential_message_record.instrument_name[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.period_indicator = wire[at]; at = at + 1;
  referential_message_record.type_of_market_admission = wire[at]; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.issuing_country_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.trading_currency[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.instrument_group_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.instrument_category = wire[at]; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.instrument_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.date_of_last_trade[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.underlying_repo_isin_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.repo_expiry_date[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.first_settlement_date[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.type_of_derivatives = wire[at]; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 11 -> referential_message_record.bic_depositary[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.icb[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.mic[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.underlying_wisin_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 25 -> referential_message_record.depositary_list[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.main_depositary[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.type_of_corporate_event[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.time_lag_euronext_utc[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.time_lag_mi_fid_reg_utc[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 6 -> referential_message_record.cfi[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.quantity_notation[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.index_set_of_var_price_tick[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.market_feed_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 24 -> referential_message_record.mic_list[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.industry_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 100 -> referential_message_record.industry_text[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.financial_market_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 7 -> referential_message_record.us_indicators[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.filler_ascii_str_2[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.prev_day_capital_traded[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.nom_mkt_price[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.lot_size[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.number_instrument_circ[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.shares_out[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> referential_message_record.auth_shares[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.heading_number[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.section_number = wire[at]; at = at + 1;
  referential_message_record.repo_indicator = wire[at]; at = at + 1;
  referential_message_record.last_adj_price_scale_code = wire[at]; at = at + 1;
  referential_message_record.type_of_unit_exp = wire[at]; at = at + 1;
  referential_message_record.market_indicator = wire[at]; at = at + 1;
  referential_message_record.prev_day_capital_traded_scale_code = wire[at]; at = at + 1;
  referential_message_record.tax_code = wire[at]; at = at + 1;
  referential_message_record.nom_mkdt_price_scale_code = wire[at]; at = at + 1;
  referential_message_record.lot_size_scale_code = wire[at]; at = at + 1;
  referential_message_record.fix_price_tick_scale_code = wire[at]; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> referential_message_record.mnemo[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.trading_code[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.filler_ascii_str_3[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.strike_price[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> referential_message_record.strike_currency[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.strike_scale_code = wire[at]; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.currency_coef[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.currency_coef_scale_code = wire[at]; at = at + 1;
  referential_message_record.trading_currency_indicator = wire[at]; at = at + 1;
  referential_message_record.strike_currency_indicator = wire[at]; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> referential_message_record.market_segment[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_record.algo = wire[at]; at = at + 1;
  referential_message_at = 0;
  do
  :: referential_message_at < 30 -> referential_message_record.local_name[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> referential_message_record.small_trade[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> referential_message_record.filler_binary_int_12[referential_message_at] = wire[at]; at = at + 1; referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Referential Message is what was written, byte for byte */
inline equal_referential_message(referential_message_read, referential_message_written) {
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.symbol_index[referential_message_at] == referential_message_written.symbol_index[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.source_seq_num[referential_message_at] == referential_message_written.source_seq_num[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.source_time[referential_message_at] == referential_message_written.source_time[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.last_adj_price[referential_message_at] == referential_message_written.last_adj_price[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.system_id[referential_message_at] == referential_message_written.system_id[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.prev_volume_traded[referential_message_at] == referential_message_written.prev_volume_traded[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.fix_price_tick[referential_message_at] == referential_message_written.fix_price_tick[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> assert(referential_message_read.source_time_micro_secs[referential_message_at] == referential_message_written.source_time_micro_secs[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> assert(referential_message_read.stock_exchange_code[referential_message_at] == referential_message_written.stock_exchange_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> assert(referential_message_read.type_of_instrument[referential_message_at] == referential_message_written.type_of_instrument[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.event_date[referential_message_at] == referential_message_written.event_date[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 18 -> assert(referential_message_read.instrument_name[referential_message_at] == referential_message_written.instrument_name[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  assert(referential_message_read.period_indicator == referential_message_written.period_indicator);
  assert(referential_message_read.type_of_market_admission == referential_message_written.type_of_market_admission);
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> assert(referential_message_read.issuing_country_code[referential_message_at] == referential_message_written.issuing_country_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> assert(referential_message_read.trading_currency[referential_message_at] == referential_message_written.trading_currency[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> assert(referential_message_read.instrument_group_code[referential_message_at] == referential_message_written.instrument_group_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  assert(referential_message_read.instrument_category == referential_message_written.instrument_category);
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> assert(referential_message_read.instrument_code[referential_message_at] == referential_message_written.instrument_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.date_of_last_trade[referential_message_at] == referential_message_written.date_of_last_trade[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> assert(referential_message_read.underlying_repo_isin_code[referential_message_at] == referential_message_written.underlying_repo_isin_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.repo_expiry_date[referential_message_at] == referential_message_written.repo_expiry_date[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.first_settlement_date[referential_message_at] == referential_message_written.first_settlement_date[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  assert(referential_message_read.type_of_derivatives == referential_message_written.type_of_derivatives);
  referential_message_at = 0;
  do
  :: referential_message_at < 11 -> assert(referential_message_read.bic_depositary[referential_message_at] == referential_message_written.bic_depositary[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.icb[referential_message_at] == referential_message_written.icb[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.mic[referential_message_at] == referential_message_written.mic[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> assert(referential_message_read.underlying_wisin_code[referential_message_at] == referential_message_written.underlying_wisin_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 25 -> assert(referential_message_read.depositary_list[referential_message_at] == referential_message_written.depositary_list[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> assert(referential_message_read.main_depositary[referential_message_at] == referential_message_written.main_depositary[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> assert(referential_message_read.type_of_corporate_event[referential_message_at] == referential_message_written.type_of_corporate_event[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> assert(referential_message_read.time_lag_euronext_utc[referential_message_at] == referential_message_written.time_lag_euronext_utc[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> assert(referential_message_read.time_lag_mi_fid_reg_utc[referential_message_at] == referential_message_written.time_lag_mi_fid_reg_utc[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 6 -> assert(referential_message_read.cfi[referential_message_at] == referential_message_written.cfi[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.quantity_notation[referential_message_at] == referential_message_written.quantity_notation[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> assert(referential_message_read.index_set_of_var_price_tick[referential_message_at] == referential_message_written.index_set_of_var_price_tick[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> assert(referential_message_read.market_feed_code[referential_message_at] == referential_message_written.market_feed_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 24 -> assert(referential_message_read.mic_list[referential_message_at] == referential_message_written.mic_list[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.industry_code[referential_message_at] == referential_message_written.industry_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 100 -> assert(referential_message_read.industry_text[referential_message_at] == referential_message_written.industry_text[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> assert(referential_message_read.financial_market_code[referential_message_at] == referential_message_written.financial_market_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 7 -> assert(referential_message_read.us_indicators[referential_message_at] == referential_message_written.us_indicators[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> assert(referential_message_read.filler_ascii_str_2[referential_message_at] == referential_message_written.filler_ascii_str_2[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.prev_day_capital_traded[referential_message_at] == referential_message_written.prev_day_capital_traded[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.nom_mkt_price[referential_message_at] == referential_message_written.nom_mkt_price[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.lot_size[referential_message_at] == referential_message_written.lot_size[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.number_instrument_circ[referential_message_at] == referential_message_written.number_instrument_circ[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.shares_out[referential_message_at] == referential_message_written.shares_out[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 8 -> assert(referential_message_read.auth_shares[referential_message_at] == referential_message_written.auth_shares[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> assert(referential_message_read.heading_number[referential_message_at] == referential_message_written.heading_number[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  assert(referential_message_read.section_number == referential_message_written.section_number);
  assert(referential_message_read.repo_indicator == referential_message_written.repo_indicator);
  assert(referential_message_read.last_adj_price_scale_code == referential_message_written.last_adj_price_scale_code);
  assert(referential_message_read.type_of_unit_exp == referential_message_written.type_of_unit_exp);
  assert(referential_message_read.market_indicator == referential_message_written.market_indicator);
  assert(referential_message_read.prev_day_capital_traded_scale_code == referential_message_written.prev_day_capital_traded_scale_code);
  assert(referential_message_read.tax_code == referential_message_written.tax_code);
  assert(referential_message_read.nom_mkdt_price_scale_code == referential_message_written.nom_mkdt_price_scale_code);
  assert(referential_message_read.lot_size_scale_code == referential_message_written.lot_size_scale_code);
  assert(referential_message_read.fix_price_tick_scale_code == referential_message_written.fix_price_tick_scale_code);
  referential_message_at = 0;
  do
  :: referential_message_at < 5 -> assert(referential_message_read.mnemo[referential_message_at] == referential_message_written.mnemo[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> assert(referential_message_read.trading_code[referential_message_at] == referential_message_written.trading_code[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> assert(referential_message_read.filler_ascii_str_3[referential_message_at] == referential_message_written.filler_ascii_str_3[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.strike_price[referential_message_at] == referential_message_written.strike_price[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 3 -> assert(referential_message_read.strike_currency[referential_message_at] == referential_message_written.strike_currency[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  assert(referential_message_read.strike_scale_code == referential_message_written.strike_scale_code);
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.currency_coef[referential_message_at] == referential_message_written.currency_coef[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  assert(referential_message_read.currency_coef_scale_code == referential_message_written.currency_coef_scale_code);
  assert(referential_message_read.trading_currency_indicator == referential_message_written.trading_currency_indicator);
  assert(referential_message_read.strike_currency_indicator == referential_message_written.strike_currency_indicator);
  referential_message_at = 0;
  do
  :: referential_message_at < 2 -> assert(referential_message_read.market_segment[referential_message_at] == referential_message_written.market_segment[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  assert(referential_message_read.algo == referential_message_written.algo);
  referential_message_at = 0;
  do
  :: referential_message_at < 30 -> assert(referential_message_read.local_name[referential_message_at] == referential_message_written.local_name[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 4 -> assert(referential_message_read.small_trade[referential_message_at] == referential_message_written.small_trade[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  referential_message_at = 0;
  do
  :: referential_message_at < 12 -> assert(referential_message_read.filler_binary_int_12[referential_message_at] == referential_message_written.filler_binary_int_12[referential_message_at]); referential_message_at = referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Creation Message: 40 bytes ---------------------------------------- */

/* A Trade Creation message announces a trade that has just been created in the trading engine. */
typedef TradeCreationMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte trade_id_number[4];
  byte quote_link_id[4];
  byte source_seq_num[4];
  byte price[4];
  byte volume[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte small_trade_indicator;
  byte trad_cond_2;
  byte trad_cond_3;
  byte trade_origin;
  byte opening_trade_indicator;
  byte price_scale_code
};

int trade_creation_message_at;

/* every byte of Trade Creation Message set to one value */
inline fill_trade_creation_message(trade_creation_message_record, trade_creation_message_value) {
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.symbol_index[trade_creation_message_at] = trade_creation_message_value; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.source_time[trade_creation_message_at] = trade_creation_message_value; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.trade_id_number[trade_creation_message_at] = trade_creation_message_value; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.quote_link_id[trade_creation_message_at] = trade_creation_message_value; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.source_seq_num[trade_creation_message_at] = trade_creation_message_value; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.price[trade_creation_message_at] = trade_creation_message_value; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.volume[trade_creation_message_at] = trade_creation_message_value; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.system_id[trade_creation_message_at] = trade_creation_message_value; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 2 -> trade_creation_message_record.source_time_micro_secs[trade_creation_message_at] = trade_creation_message_value; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_record.small_trade_indicator = trade_creation_message_value;
  trade_creation_message_record.trad_cond_2 = trade_creation_message_value;
  trade_creation_message_record.trad_cond_3 = trade_creation_message_value;
  trade_creation_message_record.trade_origin = trade_creation_message_value;
  trade_creation_message_record.opening_trade_indicator = trade_creation_message_value;
  trade_creation_message_record.price_scale_code = trade_creation_message_value;
  skip
}

/* each byte of Trade Creation Message set to where it lies, so a field read out of place says so */
inline ramp_trade_creation_message(trade_creation_message_record, trade_creation_message_base) {
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.symbol_index[trade_creation_message_at] = (trade_creation_message_base + 0 + trade_creation_message_at + 1) % 256; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.source_time[trade_creation_message_at] = (trade_creation_message_base + 4 + trade_creation_message_at + 1) % 256; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.trade_id_number[trade_creation_message_at] = (trade_creation_message_base + 8 + trade_creation_message_at + 1) % 256; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.quote_link_id[trade_creation_message_at] = (trade_creation_message_base + 12 + trade_creation_message_at + 1) % 256; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.source_seq_num[trade_creation_message_at] = (trade_creation_message_base + 16 + trade_creation_message_at + 1) % 256; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.price[trade_creation_message_at] = (trade_creation_message_base + 20 + trade_creation_message_at + 1) % 256; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.volume[trade_creation_message_at] = (trade_creation_message_base + 24 + trade_creation_message_at + 1) % 256; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.system_id[trade_creation_message_at] = (trade_creation_message_base + 28 + trade_creation_message_at + 1) % 256; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 2 -> trade_creation_message_record.source_time_micro_secs[trade_creation_message_at] = (trade_creation_message_base + 32 + trade_creation_message_at + 1) % 256; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_record.small_trade_indicator = (trade_creation_message_base + 34 + 1) % 256;
  trade_creation_message_record.trad_cond_2 = (trade_creation_message_base + 35 + 1) % 256;
  trade_creation_message_record.trad_cond_3 = (trade_creation_message_base + 36 + 1) % 256;
  trade_creation_message_record.trade_origin = (trade_creation_message_base + 37 + 1) % 256;
  trade_creation_message_record.opening_trade_indicator = (trade_creation_message_base + 38 + 1) % 256;
  trade_creation_message_record.price_scale_code = (trade_creation_message_base + 39 + 1) % 256;
  skip
}

/* Trade Creation Message to the wire, 40 bytes from where the cursor stands */
inline encode_trade_creation_message(trade_creation_message_record) {
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> wire[at] = trade_creation_message_record.symbol_index[trade_creation_message_at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> wire[at] = trade_creation_message_record.source_time[trade_creation_message_at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> wire[at] = trade_creation_message_record.trade_id_number[trade_creation_message_at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> wire[at] = trade_creation_message_record.quote_link_id[trade_creation_message_at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> wire[at] = trade_creation_message_record.source_seq_num[trade_creation_message_at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> wire[at] = trade_creation_message_record.price[trade_creation_message_at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> wire[at] = trade_creation_message_record.volume[trade_creation_message_at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> wire[at] = trade_creation_message_record.system_id[trade_creation_message_at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 2 -> wire[at] = trade_creation_message_record.source_time_micro_secs[trade_creation_message_at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_creation_message_record.small_trade_indicator; at = at + 1;
  wire[at] = trade_creation_message_record.trad_cond_2; at = at + 1;
  wire[at] = trade_creation_message_record.trad_cond_3; at = at + 1;
  wire[at] = trade_creation_message_record.trade_origin; at = at + 1;
  wire[at] = trade_creation_message_record.opening_trade_indicator; at = at + 1;
  wire[at] = trade_creation_message_record.price_scale_code; at = at + 1;
  skip
}

/* Trade Creation Message off the wire, 40 bytes from where the cursor stands */
inline decode_trade_creation_message(trade_creation_message_record) {
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.symbol_index[trade_creation_message_at] = wire[at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.source_time[trade_creation_message_at] = wire[at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.trade_id_number[trade_creation_message_at] = wire[at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.quote_link_id[trade_creation_message_at] = wire[at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.source_seq_num[trade_creation_message_at] = wire[at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.price[trade_creation_message_at] = wire[at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.volume[trade_creation_message_at] = wire[at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> trade_creation_message_record.system_id[trade_creation_message_at] = wire[at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 2 -> trade_creation_message_record.source_time_micro_secs[trade_creation_message_at] = wire[at]; at = at + 1; trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_record.small_trade_indicator = wire[at]; at = at + 1;
  trade_creation_message_record.trad_cond_2 = wire[at]; at = at + 1;
  trade_creation_message_record.trad_cond_3 = wire[at]; at = at + 1;
  trade_creation_message_record.trade_origin = wire[at]; at = at + 1;
  trade_creation_message_record.opening_trade_indicator = wire[at]; at = at + 1;
  trade_creation_message_record.price_scale_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Creation Message is what was written, byte for byte */
inline equal_trade_creation_message(trade_creation_message_read, trade_creation_message_written) {
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> assert(trade_creation_message_read.symbol_index[trade_creation_message_at] == trade_creation_message_written.symbol_index[trade_creation_message_at]); trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> assert(trade_creation_message_read.source_time[trade_creation_message_at] == trade_creation_message_written.source_time[trade_creation_message_at]); trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> assert(trade_creation_message_read.trade_id_number[trade_creation_message_at] == trade_creation_message_written.trade_id_number[trade_creation_message_at]); trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> assert(trade_creation_message_read.quote_link_id[trade_creation_message_at] == trade_creation_message_written.quote_link_id[trade_creation_message_at]); trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> assert(trade_creation_message_read.source_seq_num[trade_creation_message_at] == trade_creation_message_written.source_seq_num[trade_creation_message_at]); trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> assert(trade_creation_message_read.price[trade_creation_message_at] == trade_creation_message_written.price[trade_creation_message_at]); trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> assert(trade_creation_message_read.volume[trade_creation_message_at] == trade_creation_message_written.volume[trade_creation_message_at]); trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 4 -> assert(trade_creation_message_read.system_id[trade_creation_message_at] == trade_creation_message_written.system_id[trade_creation_message_at]); trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  trade_creation_message_at = 0;
  do
  :: trade_creation_message_at < 2 -> assert(trade_creation_message_read.source_time_micro_secs[trade_creation_message_at] == trade_creation_message_written.source_time_micro_secs[trade_creation_message_at]); trade_creation_message_at = trade_creation_message_at + 1
  :: else -> break
  od;
  assert(trade_creation_message_read.small_trade_indicator == trade_creation_message_written.small_trade_indicator);
  assert(trade_creation_message_read.trad_cond_2 == trade_creation_message_written.trad_cond_2);
  assert(trade_creation_message_read.trad_cond_3 == trade_creation_message_written.trad_cond_3);
  assert(trade_creation_message_read.trade_origin == trade_creation_message_written.trade_origin);
  assert(trade_creation_message_read.opening_trade_indicator == trade_creation_message_written.opening_trade_indicator);
  assert(trade_creation_message_read.price_scale_code == trade_creation_message_written.price_scale_code);
  skip
}

/* ---- Trade Cancellation Message: 24 bytes ------------------------------------ */

/* A Trade Cancellation message announces the cancellation of a trade previously published. */
typedef TradeCancellationMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte original_trade_id_number[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte filler_binary_int_2[2]
};

int trade_cancellation_message_at;

/* every byte of Trade Cancellation Message set to one value */
inline fill_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_value) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.symbol_index[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.source_time[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.source_seq_num[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.original_trade_id_number[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.system_id[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.source_time_micro_secs[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.filler_binary_int_2[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_base) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.symbol_index[trade_cancellation_message_at] = (trade_cancellation_message_base + 0 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.source_time[trade_cancellation_message_at] = (trade_cancellation_message_base + 4 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.source_seq_num[trade_cancellation_message_at] = (trade_cancellation_message_base + 8 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.original_trade_id_number[trade_cancellation_message_at] = (trade_cancellation_message_base + 12 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.system_id[trade_cancellation_message_at] = (trade_cancellation_message_base + 16 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.source_time_micro_secs[trade_cancellation_message_at] = (trade_cancellation_message_base + 20 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.filler_binary_int_2[trade_cancellation_message_at] = (trade_cancellation_message_base + 22 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message to the wire, 24 bytes from where the cursor stands */
inline encode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.symbol_index[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.source_time[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.source_seq_num[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.original_trade_id_number[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.system_id[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> wire[at] = trade_cancellation_message_record.source_time_micro_secs[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> wire[at] = trade_cancellation_message_record.filler_binary_int_2[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message off the wire, 24 bytes from where the cursor stands */
inline decode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.symbol_index[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.source_time[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.source_seq_num[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.original_trade_id_number[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.system_id[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.source_time_micro_secs[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.filler_binary_int_2[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancellation Message is what was written, byte for byte */
inline equal_trade_cancellation_message(trade_cancellation_message_read, trade_cancellation_message_written) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.symbol_index[trade_cancellation_message_at] == trade_cancellation_message_written.symbol_index[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.source_time[trade_cancellation_message_at] == trade_cancellation_message_written.source_time[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.source_seq_num[trade_cancellation_message_at] == trade_cancellation_message_written.source_seq_num[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.original_trade_id_number[trade_cancellation_message_at] == trade_cancellation_message_written.original_trade_id_number[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.system_id[trade_cancellation_message_at] == trade_cancellation_message_written.system_id[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> assert(trade_cancellation_message_read.source_time_micro_secs[trade_cancellation_message_at] == trade_cancellation_message_written.source_time_micro_secs[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> assert(trade_cancellation_message_read.filler_binary_int_2[trade_cancellation_message_at] == trade_cancellation_message_written.filler_binary_int_2[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Full Information Message: 60 bytes -------------------------------- */

/* A Trade Full Information message carries a trade along with the cumulated statistics of the instrument for the trading day. */
typedef TradeFullInformationMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte trade_id_number[4];
  byte quote_link_id[4];
  byte source_seq_num[4];
  byte price[4];
  byte volume[4];
  byte cumulative_quantity[4];
  byte highest_price[4];
  byte lowest_price[4];
  byte variation_last_price[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte filler_binary_int_2[2];
  byte small_trade_indicator;
  byte trad_cond_2;
  byte trad_cond_3;
  byte trade_origin;
  byte tick_direction;
  byte opening_trade_indicator;
  byte variation_scale_code;
  byte price_scale_code
};

int trade_full_information_message_at;

/* every byte of Trade Full Information Message set to one value */
inline fill_trade_full_information_message(trade_full_information_message_record, trade_full_information_message_value) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.symbol_index[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_time[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.trade_id_number[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.quote_link_id[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_seq_num[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.price[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.volume[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.cumulative_quantity[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.highest_price[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.lowest_price[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.variation_last_price[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.system_id[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> trade_full_information_message_record.source_time_micro_secs[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> trade_full_information_message_record.filler_binary_int_2[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.small_trade_indicator = trade_full_information_message_value;
  trade_full_information_message_record.trad_cond_2 = trade_full_information_message_value;
  trade_full_information_message_record.trad_cond_3 = trade_full_information_message_value;
  trade_full_information_message_record.trade_origin = trade_full_information_message_value;
  trade_full_information_message_record.tick_direction = trade_full_information_message_value;
  trade_full_information_message_record.opening_trade_indicator = trade_full_information_message_value;
  trade_full_information_message_record.variation_scale_code = trade_full_information_message_value;
  trade_full_information_message_record.price_scale_code = trade_full_information_message_value;
  skip
}

/* each byte of Trade Full Information Message set to where it lies, so a field read out of place says so */
inline ramp_trade_full_information_message(trade_full_information_message_record, trade_full_information_message_base) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.symbol_index[trade_full_information_message_at] = (trade_full_information_message_base + 0 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_time[trade_full_information_message_at] = (trade_full_information_message_base + 4 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.trade_id_number[trade_full_information_message_at] = (trade_full_information_message_base + 8 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.quote_link_id[trade_full_information_message_at] = (trade_full_information_message_base + 12 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_seq_num[trade_full_information_message_at] = (trade_full_information_message_base + 16 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.price[trade_full_information_message_at] = (trade_full_information_message_base + 20 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.volume[trade_full_information_message_at] = (trade_full_information_message_base + 24 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.cumulative_quantity[trade_full_information_message_at] = (trade_full_information_message_base + 28 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.highest_price[trade_full_information_message_at] = (trade_full_information_message_base + 32 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.lowest_price[trade_full_information_message_at] = (trade_full_information_message_base + 36 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.variation_last_price[trade_full_information_message_at] = (trade_full_information_message_base + 40 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.system_id[trade_full_information_message_at] = (trade_full_information_message_base + 44 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> trade_full_information_message_record.source_time_micro_secs[trade_full_information_message_at] = (trade_full_information_message_base + 48 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> trade_full_information_message_record.filler_binary_int_2[trade_full_information_message_at] = (trade_full_information_message_base + 50 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.small_trade_indicator = (trade_full_information_message_base + 52 + 1) % 256;
  trade_full_information_message_record.trad_cond_2 = (trade_full_information_message_base + 53 + 1) % 256;
  trade_full_information_message_record.trad_cond_3 = (trade_full_information_message_base + 54 + 1) % 256;
  trade_full_information_message_record.trade_origin = (trade_full_information_message_base + 55 + 1) % 256;
  trade_full_information_message_record.tick_direction = (trade_full_information_message_base + 56 + 1) % 256;
  trade_full_information_message_record.opening_trade_indicator = (trade_full_information_message_base + 57 + 1) % 256;
  trade_full_information_message_record.variation_scale_code = (trade_full_information_message_base + 58 + 1) % 256;
  trade_full_information_message_record.price_scale_code = (trade_full_information_message_base + 59 + 1) % 256;
  skip
}

/* Trade Full Information Message to the wire, 60 bytes from where the cursor stands */
inline encode_trade_full_information_message(trade_full_information_message_record) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.symbol_index[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.source_time[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.trade_id_number[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.quote_link_id[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.source_seq_num[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.price[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.volume[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.cumulative_quantity[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.highest_price[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.lowest_price[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.variation_last_price[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.system_id[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> wire[at] = trade_full_information_message_record.source_time_micro_secs[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> wire[at] = trade_full_information_message_record.filler_binary_int_2[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_full_information_message_record.small_trade_indicator; at = at + 1;
  wire[at] = trade_full_information_message_record.trad_cond_2; at = at + 1;
  wire[at] = trade_full_information_message_record.trad_cond_3; at = at + 1;
  wire[at] = trade_full_information_message_record.trade_origin; at = at + 1;
  wire[at] = trade_full_information_message_record.tick_direction; at = at + 1;
  wire[at] = trade_full_information_message_record.opening_trade_indicator; at = at + 1;
  wire[at] = trade_full_information_message_record.variation_scale_code; at = at + 1;
  wire[at] = trade_full_information_message_record.price_scale_code; at = at + 1;
  skip
}

/* Trade Full Information Message off the wire, 60 bytes from where the cursor stands */
inline decode_trade_full_information_message(trade_full_information_message_record) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.symbol_index[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_time[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.trade_id_number[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.quote_link_id[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_seq_num[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.price[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.volume[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.cumulative_quantity[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.highest_price[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.lowest_price[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.variation_last_price[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.system_id[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> trade_full_information_message_record.source_time_micro_secs[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> trade_full_information_message_record.filler_binary_int_2[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.small_trade_indicator = wire[at]; at = at + 1;
  trade_full_information_message_record.trad_cond_2 = wire[at]; at = at + 1;
  trade_full_information_message_record.trad_cond_3 = wire[at]; at = at + 1;
  trade_full_information_message_record.trade_origin = wire[at]; at = at + 1;
  trade_full_information_message_record.tick_direction = wire[at]; at = at + 1;
  trade_full_information_message_record.opening_trade_indicator = wire[at]; at = at + 1;
  trade_full_information_message_record.variation_scale_code = wire[at]; at = at + 1;
  trade_full_information_message_record.price_scale_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Full Information Message is what was written, byte for byte */
inline equal_trade_full_information_message(trade_full_information_message_read, trade_full_information_message_written) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.symbol_index[trade_full_information_message_at] == trade_full_information_message_written.symbol_index[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.source_time[trade_full_information_message_at] == trade_full_information_message_written.source_time[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.trade_id_number[trade_full_information_message_at] == trade_full_information_message_written.trade_id_number[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.quote_link_id[trade_full_information_message_at] == trade_full_information_message_written.quote_link_id[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.source_seq_num[trade_full_information_message_at] == trade_full_information_message_written.source_seq_num[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.price[trade_full_information_message_at] == trade_full_information_message_written.price[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.volume[trade_full_information_message_at] == trade_full_information_message_written.volume[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.cumulative_quantity[trade_full_information_message_at] == trade_full_information_message_written.cumulative_quantity[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.highest_price[trade_full_information_message_at] == trade_full_information_message_written.highest_price[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.lowest_price[trade_full_information_message_at] == trade_full_information_message_written.lowest_price[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.variation_last_price[trade_full_information_message_at] == trade_full_information_message_written.variation_last_price[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.system_id[trade_full_information_message_at] == trade_full_information_message_written.system_id[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> assert(trade_full_information_message_read.source_time_micro_secs[trade_full_information_message_at] == trade_full_information_message_written.source_time_micro_secs[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> assert(trade_full_information_message_read.filler_binary_int_2[trade_full_information_message_at] == trade_full_information_message_written.filler_binary_int_2[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  assert(trade_full_information_message_read.small_trade_indicator == trade_full_information_message_written.small_trade_indicator);
  assert(trade_full_information_message_read.trad_cond_2 == trade_full_information_message_written.trad_cond_2);
  assert(trade_full_information_message_read.trad_cond_3 == trade_full_information_message_written.trad_cond_3);
  assert(trade_full_information_message_read.trade_origin == trade_full_information_message_written.trade_origin);
  assert(trade_full_information_message_read.tick_direction == trade_full_information_message_written.tick_direction);
  assert(trade_full_information_message_read.opening_trade_indicator == trade_full_information_message_written.opening_trade_indicator);
  assert(trade_full_information_message_read.variation_scale_code == trade_full_information_message_written.variation_scale_code);
  assert(trade_full_information_message_read.price_scale_code == trade_full_information_message_written.price_scale_code);
  skip
}

/* ---- Price Update Message: 40 bytes ------------------------------------------ */

/* A Price Update message updates the statistics of an instrument without carrying a new trade. */
typedef PriceUpdateMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte price[4];
  byte highest_price[4];
  byte lowest_price[4];
  byte variation_last_price[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte type_of_price[2];
  byte filler_binary_int_2[2];
  byte price_scale_code;
  byte variation_scale_code
};

int price_update_message_at;

/* every byte of Price Update Message set to one value */
inline fill_price_update_message(price_update_message_record, price_update_message_value) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.symbol_index[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_time[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_seq_num[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.price[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.highest_price[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.lowest_price[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.variation_last_price[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.system_id[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.source_time_micro_secs[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.type_of_price[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.filler_binary_int_2[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_record.price_scale_code = price_update_message_value;
  price_update_message_record.variation_scale_code = price_update_message_value;
  skip
}

/* each byte of Price Update Message set to where it lies, so a field read out of place says so */
inline ramp_price_update_message(price_update_message_record, price_update_message_base) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.symbol_index[price_update_message_at] = (price_update_message_base + 0 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_time[price_update_message_at] = (price_update_message_base + 4 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_seq_num[price_update_message_at] = (price_update_message_base + 8 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.price[price_update_message_at] = (price_update_message_base + 12 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.highest_price[price_update_message_at] = (price_update_message_base + 16 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.lowest_price[price_update_message_at] = (price_update_message_base + 20 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.variation_last_price[price_update_message_at] = (price_update_message_base + 24 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.system_id[price_update_message_at] = (price_update_message_base + 28 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.source_time_micro_secs[price_update_message_at] = (price_update_message_base + 32 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.type_of_price[price_update_message_at] = (price_update_message_base + 34 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.filler_binary_int_2[price_update_message_at] = (price_update_message_base + 36 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_record.price_scale_code = (price_update_message_base + 38 + 1) % 256;
  price_update_message_record.variation_scale_code = (price_update_message_base + 39 + 1) % 256;
  skip
}

/* Price Update Message to the wire, 40 bytes from where the cursor stands */
inline encode_price_update_message(price_update_message_record) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.symbol_index[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.source_time[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.source_seq_num[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.price[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.highest_price[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.lowest_price[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.variation_last_price[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.system_id[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> wire[at] = price_update_message_record.source_time_micro_secs[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> wire[at] = price_update_message_record.type_of_price[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> wire[at] = price_update_message_record.filler_binary_int_2[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  wire[at] = price_update_message_record.price_scale_code; at = at + 1;
  wire[at] = price_update_message_record.variation_scale_code; at = at + 1;
  skip
}

/* Price Update Message off the wire, 40 bytes from where the cursor stands */
inline decode_price_update_message(price_update_message_record) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.symbol_index[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_time[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_seq_num[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.price[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.highest_price[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.lowest_price[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.variation_last_price[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.system_id[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.source_time_micro_secs[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.type_of_price[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.filler_binary_int_2[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_record.price_scale_code = wire[at]; at = at + 1;
  price_update_message_record.variation_scale_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Price Update Message is what was written, byte for byte */
inline equal_price_update_message(price_update_message_read, price_update_message_written) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.symbol_index[price_update_message_at] == price_update_message_written.symbol_index[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.source_time[price_update_message_at] == price_update_message_written.source_time[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.source_seq_num[price_update_message_at] == price_update_message_written.source_seq_num[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.price[price_update_message_at] == price_update_message_written.price[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.highest_price[price_update_message_at] == price_update_message_written.highest_price[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.lowest_price[price_update_message_at] == price_update_message_written.lowest_price[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.variation_last_price[price_update_message_at] == price_update_message_written.variation_last_price[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.system_id[price_update_message_at] == price_update_message_written.system_id[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> assert(price_update_message_read.source_time_micro_secs[price_update_message_at] == price_update_message_written.source_time_micro_secs[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> assert(price_update_message_read.type_of_price[price_update_message_at] == price_update_message_written.type_of_price[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> assert(price_update_message_read.filler_binary_int_2[price_update_message_at] == price_update_message_written.filler_binary_int_2[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  assert(price_update_message_read.price_scale_code == price_update_message_written.price_scale_code);
  assert(price_update_message_read.variation_scale_code == price_update_message_written.variation_scale_code);
  skip
}

/* ---- Auction Summary Message: 48 bytes --------------------------------------- */

/* An Auction Summary message summarises the trades resulting from an auction. */
typedef AuctionSummaryMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte first_price[4];
  byte last_price[4];
  byte highest_price[4];
  byte lowest_price[4];
  byte cumulative_quantity[4];
  byte variation[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte type_of_last_price[2];
  byte tick_direction;
  byte instrument_valuation_price;
  byte price_scale_code;
  byte variation_scale_code
};

int auction_summary_message_at;

/* every byte of Auction Summary Message set to one value */
inline fill_auction_summary_message(auction_summary_message_record, auction_summary_message_value) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.symbol_index[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.source_time[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.source_seq_num[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.first_price[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.last_price[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.highest_price[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.lowest_price[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.cumulative_quantity[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.variation[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.system_id[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> auction_summary_message_record.source_time_micro_secs[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> auction_summary_message_record.type_of_last_price[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.tick_direction = auction_summary_message_value;
  auction_summary_message_record.instrument_valuation_price = auction_summary_message_value;
  auction_summary_message_record.price_scale_code = auction_summary_message_value;
  auction_summary_message_record.variation_scale_code = auction_summary_message_value;
  skip
}

/* each byte of Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_auction_summary_message(auction_summary_message_record, auction_summary_message_base) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.symbol_index[auction_summary_message_at] = (auction_summary_message_base + 0 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.source_time[auction_summary_message_at] = (auction_summary_message_base + 4 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.source_seq_num[auction_summary_message_at] = (auction_summary_message_base + 8 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.first_price[auction_summary_message_at] = (auction_summary_message_base + 12 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.last_price[auction_summary_message_at] = (auction_summary_message_base + 16 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.highest_price[auction_summary_message_at] = (auction_summary_message_base + 20 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.lowest_price[auction_summary_message_at] = (auction_summary_message_base + 24 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.cumulative_quantity[auction_summary_message_at] = (auction_summary_message_base + 28 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.variation[auction_summary_message_at] = (auction_summary_message_base + 32 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.system_id[auction_summary_message_at] = (auction_summary_message_base + 36 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> auction_summary_message_record.source_time_micro_secs[auction_summary_message_at] = (auction_summary_message_base + 40 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> auction_summary_message_record.type_of_last_price[auction_summary_message_at] = (auction_summary_message_base + 42 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.tick_direction = (auction_summary_message_base + 44 + 1) % 256;
  auction_summary_message_record.instrument_valuation_price = (auction_summary_message_base + 45 + 1) % 256;
  auction_summary_message_record.price_scale_code = (auction_summary_message_base + 46 + 1) % 256;
  auction_summary_message_record.variation_scale_code = (auction_summary_message_base + 47 + 1) % 256;
  skip
}

/* Auction Summary Message to the wire, 48 bytes from where the cursor stands */
inline encode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.symbol_index[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.source_time[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.source_seq_num[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.first_price[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.last_price[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.highest_price[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.lowest_price[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.cumulative_quantity[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.variation[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.system_id[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> wire[at] = auction_summary_message_record.source_time_micro_secs[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> wire[at] = auction_summary_message_record.type_of_last_price[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_message_record.tick_direction; at = at + 1;
  wire[at] = auction_summary_message_record.instrument_valuation_price; at = at + 1;
  wire[at] = auction_summary_message_record.price_scale_code; at = at + 1;
  wire[at] = auction_summary_message_record.variation_scale_code; at = at + 1;
  skip
}

/* Auction Summary Message off the wire, 48 bytes from where the cursor stands */
inline decode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.symbol_index[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.source_time[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.source_seq_num[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.first_price[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.last_price[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.highest_price[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.lowest_price[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.cumulative_quantity[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.variation[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.system_id[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> auction_summary_message_record.source_time_micro_secs[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> auction_summary_message_record.type_of_last_price[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.tick_direction = wire[at]; at = at + 1;
  auction_summary_message_record.instrument_valuation_price = wire[at]; at = at + 1;
  auction_summary_message_record.price_scale_code = wire[at]; at = at + 1;
  auction_summary_message_record.variation_scale_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Summary Message is what was written, byte for byte */
inline equal_auction_summary_message(auction_summary_message_read, auction_summary_message_written) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.symbol_index[auction_summary_message_at] == auction_summary_message_written.symbol_index[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.source_time[auction_summary_message_at] == auction_summary_message_written.source_time[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.source_seq_num[auction_summary_message_at] == auction_summary_message_written.source_seq_num[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.first_price[auction_summary_message_at] == auction_summary_message_written.first_price[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.last_price[auction_summary_message_at] == auction_summary_message_written.last_price[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.highest_price[auction_summary_message_at] == auction_summary_message_written.highest_price[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.lowest_price[auction_summary_message_at] == auction_summary_message_written.lowest_price[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.cumulative_quantity[auction_summary_message_at] == auction_summary_message_written.cumulative_quantity[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.variation[auction_summary_message_at] == auction_summary_message_written.variation[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.system_id[auction_summary_message_at] == auction_summary_message_written.system_id[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> assert(auction_summary_message_read.source_time_micro_secs[auction_summary_message_at] == auction_summary_message_written.source_time_micro_secs[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 2 -> assert(auction_summary_message_read.type_of_last_price[auction_summary_message_at] == auction_summary_message_written.type_of_last_price[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  assert(auction_summary_message_read.tick_direction == auction_summary_message_written.tick_direction);
  assert(auction_summary_message_read.instrument_valuation_price == auction_summary_message_written.instrument_valuation_price);
  assert(auction_summary_message_read.price_scale_code == auction_summary_message_written.price_scale_code);
  assert(auction_summary_message_read.variation_scale_code == auction_summary_message_written.variation_scale_code);
  skip
}

/* ---- Vwap Closing Price Message: 44 bytes ------------------------------------ */

/* A VWAP - Closing Price message contains the real time Volume-Weighted Average Price for an instrument together with the current closing price. This message is used exclusively at Qatar Exchange. */
typedef VwapClosingPriceMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte sending_indicator[2];
  byte closing_price_rule[2];
  byte closing_price[4];
  byte adjusted_closing_price[4];
  byte nb_trades[4];
  byte qty_shares[4];
  byte amount_traded[4];
  byte system_id[4];
  byte price_scale_code;
  byte filler_ascii_str_3[3]
};

int vwap_closing_price_message_at;

/* every byte of Vwap Closing Price Message set to one value */
inline fill_vwap_closing_price_message(vwap_closing_price_message_record, vwap_closing_price_message_value) {
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.symbol_index[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.source_time[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.source_seq_num[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> vwap_closing_price_message_record.sending_indicator[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> vwap_closing_price_message_record.closing_price_rule[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.closing_price[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.adjusted_closing_price[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.nb_trades[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.qty_shares[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.amount_traded[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.system_id[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_record.price_scale_code = vwap_closing_price_message_value;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 3 -> vwap_closing_price_message_record.filler_ascii_str_3[vwap_closing_price_message_at] = vwap_closing_price_message_value; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Vwap Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_vwap_closing_price_message(vwap_closing_price_message_record, vwap_closing_price_message_base) {
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.symbol_index[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 0 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.source_time[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 4 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.source_seq_num[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 8 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> vwap_closing_price_message_record.sending_indicator[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 12 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> vwap_closing_price_message_record.closing_price_rule[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 14 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.closing_price[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 16 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.adjusted_closing_price[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 20 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.nb_trades[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 24 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.qty_shares[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 28 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.amount_traded[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 32 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.system_id[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 36 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_record.price_scale_code = (vwap_closing_price_message_base + 40 + 1) % 256;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 3 -> vwap_closing_price_message_record.filler_ascii_str_3[vwap_closing_price_message_at] = (vwap_closing_price_message_base + 41 + vwap_closing_price_message_at + 1) % 256; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Vwap Closing Price Message to the wire, 44 bytes from where the cursor stands */
inline encode_vwap_closing_price_message(vwap_closing_price_message_record) {
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> wire[at] = vwap_closing_price_message_record.symbol_index[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> wire[at] = vwap_closing_price_message_record.source_time[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> wire[at] = vwap_closing_price_message_record.source_seq_num[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> wire[at] = vwap_closing_price_message_record.sending_indicator[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> wire[at] = vwap_closing_price_message_record.closing_price_rule[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> wire[at] = vwap_closing_price_message_record.closing_price[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> wire[at] = vwap_closing_price_message_record.adjusted_closing_price[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> wire[at] = vwap_closing_price_message_record.nb_trades[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> wire[at] = vwap_closing_price_message_record.qty_shares[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> wire[at] = vwap_closing_price_message_record.amount_traded[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> wire[at] = vwap_closing_price_message_record.system_id[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = vwap_closing_price_message_record.price_scale_code; at = at + 1;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 3 -> wire[at] = vwap_closing_price_message_record.filler_ascii_str_3[vwap_closing_price_message_at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Vwap Closing Price Message off the wire, 44 bytes from where the cursor stands */
inline decode_vwap_closing_price_message(vwap_closing_price_message_record) {
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.symbol_index[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.source_time[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.source_seq_num[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> vwap_closing_price_message_record.sending_indicator[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> vwap_closing_price_message_record.closing_price_rule[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.closing_price[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.adjusted_closing_price[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.nb_trades[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.qty_shares[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.amount_traded[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> vwap_closing_price_message_record.system_id[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_record.price_scale_code = wire[at]; at = at + 1;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 3 -> vwap_closing_price_message_record.filler_ascii_str_3[vwap_closing_price_message_at] = wire[at]; at = at + 1; vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Vwap Closing Price Message is what was written, byte for byte */
inline equal_vwap_closing_price_message(vwap_closing_price_message_read, vwap_closing_price_message_written) {
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> assert(vwap_closing_price_message_read.symbol_index[vwap_closing_price_message_at] == vwap_closing_price_message_written.symbol_index[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> assert(vwap_closing_price_message_read.source_time[vwap_closing_price_message_at] == vwap_closing_price_message_written.source_time[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> assert(vwap_closing_price_message_read.source_seq_num[vwap_closing_price_message_at] == vwap_closing_price_message_written.source_seq_num[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> assert(vwap_closing_price_message_read.sending_indicator[vwap_closing_price_message_at] == vwap_closing_price_message_written.sending_indicator[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 2 -> assert(vwap_closing_price_message_read.closing_price_rule[vwap_closing_price_message_at] == vwap_closing_price_message_written.closing_price_rule[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> assert(vwap_closing_price_message_read.closing_price[vwap_closing_price_message_at] == vwap_closing_price_message_written.closing_price[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> assert(vwap_closing_price_message_read.adjusted_closing_price[vwap_closing_price_message_at] == vwap_closing_price_message_written.adjusted_closing_price[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> assert(vwap_closing_price_message_read.nb_trades[vwap_closing_price_message_at] == vwap_closing_price_message_written.nb_trades[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> assert(vwap_closing_price_message_read.qty_shares[vwap_closing_price_message_at] == vwap_closing_price_message_written.qty_shares[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> assert(vwap_closing_price_message_read.amount_traded[vwap_closing_price_message_at] == vwap_closing_price_message_written.amount_traded[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 4 -> assert(vwap_closing_price_message_read.system_id[vwap_closing_price_message_at] == vwap_closing_price_message_written.system_id[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  assert(vwap_closing_price_message_read.price_scale_code == vwap_closing_price_message_written.price_scale_code);
  vwap_closing_price_message_at = 0;
  do
  :: vwap_closing_price_message_at < 3 -> assert(vwap_closing_price_message_read.filler_ascii_str_3[vwap_closing_price_message_at] == vwap_closing_price_message_written.filler_ascii_str_3[vwap_closing_price_message_at]); vwap_closing_price_message_at = vwap_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quotes Message: 48 bytes ------------------------------------------------ */

/* A Quotes message carries the best limits of the order book for an instrument. */
typedef QuotesMessage {
  byte symbol_index[4];
  byte source_seq_num[4];
  byte source_time[4];
  byte quote_link_id[4];
  byte ask_price[4];
  byte ask_size[4];
  byte bid_price[4];
  byte bid_size[4];
  byte system_id[4];
  byte number_ask_orders[2];
  byte number_bid_orders[2];
  byte source_time_micro_secs[2];
  byte type_of_ask_price;
  byte type_of_bid_price;
  byte quote_condition;
  byte quote_number;
  byte price_scale_code;
  byte filler_ascii_str_1
};

int quotes_message_at;

/* every byte of Quotes Message set to one value */
inline fill_quotes_message(quotes_message_record, quotes_message_value) {
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.symbol_index[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.source_seq_num[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.source_time[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.quote_link_id[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.ask_price[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.ask_size[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.bid_price[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.bid_size[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.system_id[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> quotes_message_record.number_ask_orders[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> quotes_message_record.number_bid_orders[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> quotes_message_record.source_time_micro_secs[quotes_message_at] = quotes_message_value; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_record.type_of_ask_price = quotes_message_value;
  quotes_message_record.type_of_bid_price = quotes_message_value;
  quotes_message_record.quote_condition = quotes_message_value;
  quotes_message_record.quote_number = quotes_message_value;
  quotes_message_record.price_scale_code = quotes_message_value;
  quotes_message_record.filler_ascii_str_1 = quotes_message_value;
  skip
}

/* each byte of Quotes Message set to where it lies, so a field read out of place says so */
inline ramp_quotes_message(quotes_message_record, quotes_message_base) {
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.symbol_index[quotes_message_at] = (quotes_message_base + 0 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.source_seq_num[quotes_message_at] = (quotes_message_base + 4 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.source_time[quotes_message_at] = (quotes_message_base + 8 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.quote_link_id[quotes_message_at] = (quotes_message_base + 12 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.ask_price[quotes_message_at] = (quotes_message_base + 16 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.ask_size[quotes_message_at] = (quotes_message_base + 20 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.bid_price[quotes_message_at] = (quotes_message_base + 24 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.bid_size[quotes_message_at] = (quotes_message_base + 28 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.system_id[quotes_message_at] = (quotes_message_base + 32 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> quotes_message_record.number_ask_orders[quotes_message_at] = (quotes_message_base + 36 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> quotes_message_record.number_bid_orders[quotes_message_at] = (quotes_message_base + 38 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> quotes_message_record.source_time_micro_secs[quotes_message_at] = (quotes_message_base + 40 + quotes_message_at + 1) % 256; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_record.type_of_ask_price = (quotes_message_base + 42 + 1) % 256;
  quotes_message_record.type_of_bid_price = (quotes_message_base + 43 + 1) % 256;
  quotes_message_record.quote_condition = (quotes_message_base + 44 + 1) % 256;
  quotes_message_record.quote_number = (quotes_message_base + 45 + 1) % 256;
  quotes_message_record.price_scale_code = (quotes_message_base + 46 + 1) % 256;
  quotes_message_record.filler_ascii_str_1 = (quotes_message_base + 47 + 1) % 256;
  skip
}

/* Quotes Message to the wire, 48 bytes from where the cursor stands */
inline encode_quotes_message(quotes_message_record) {
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> wire[at] = quotes_message_record.symbol_index[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> wire[at] = quotes_message_record.source_seq_num[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> wire[at] = quotes_message_record.source_time[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> wire[at] = quotes_message_record.quote_link_id[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> wire[at] = quotes_message_record.ask_price[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> wire[at] = quotes_message_record.ask_size[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> wire[at] = quotes_message_record.bid_price[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> wire[at] = quotes_message_record.bid_size[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> wire[at] = quotes_message_record.system_id[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> wire[at] = quotes_message_record.number_ask_orders[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> wire[at] = quotes_message_record.number_bid_orders[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> wire[at] = quotes_message_record.source_time_micro_secs[quotes_message_at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  wire[at] = quotes_message_record.type_of_ask_price; at = at + 1;
  wire[at] = quotes_message_record.type_of_bid_price; at = at + 1;
  wire[at] = quotes_message_record.quote_condition; at = at + 1;
  wire[at] = quotes_message_record.quote_number; at = at + 1;
  wire[at] = quotes_message_record.price_scale_code; at = at + 1;
  wire[at] = quotes_message_record.filler_ascii_str_1; at = at + 1;
  skip
}

/* Quotes Message off the wire, 48 bytes from where the cursor stands */
inline decode_quotes_message(quotes_message_record) {
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.symbol_index[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.source_seq_num[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.source_time[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.quote_link_id[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.ask_price[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.ask_size[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.bid_price[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.bid_size[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> quotes_message_record.system_id[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> quotes_message_record.number_ask_orders[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> quotes_message_record.number_bid_orders[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> quotes_message_record.source_time_micro_secs[quotes_message_at] = wire[at]; at = at + 1; quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_record.type_of_ask_price = wire[at]; at = at + 1;
  quotes_message_record.type_of_bid_price = wire[at]; at = at + 1;
  quotes_message_record.quote_condition = wire[at]; at = at + 1;
  quotes_message_record.quote_number = wire[at]; at = at + 1;
  quotes_message_record.price_scale_code = wire[at]; at = at + 1;
  quotes_message_record.filler_ascii_str_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Quotes Message is what was written, byte for byte */
inline equal_quotes_message(quotes_message_read, quotes_message_written) {
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> assert(quotes_message_read.symbol_index[quotes_message_at] == quotes_message_written.symbol_index[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> assert(quotes_message_read.source_seq_num[quotes_message_at] == quotes_message_written.source_seq_num[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> assert(quotes_message_read.source_time[quotes_message_at] == quotes_message_written.source_time[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> assert(quotes_message_read.quote_link_id[quotes_message_at] == quotes_message_written.quote_link_id[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> assert(quotes_message_read.ask_price[quotes_message_at] == quotes_message_written.ask_price[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> assert(quotes_message_read.ask_size[quotes_message_at] == quotes_message_written.ask_size[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> assert(quotes_message_read.bid_price[quotes_message_at] == quotes_message_written.bid_price[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> assert(quotes_message_read.bid_size[quotes_message_at] == quotes_message_written.bid_size[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 4 -> assert(quotes_message_read.system_id[quotes_message_at] == quotes_message_written.system_id[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> assert(quotes_message_read.number_ask_orders[quotes_message_at] == quotes_message_written.number_ask_orders[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> assert(quotes_message_read.number_bid_orders[quotes_message_at] == quotes_message_written.number_bid_orders[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  quotes_message_at = 0;
  do
  :: quotes_message_at < 2 -> assert(quotes_message_read.source_time_micro_secs[quotes_message_at] == quotes_message_written.source_time_micro_secs[quotes_message_at]); quotes_message_at = quotes_message_at + 1
  :: else -> break
  od;
  assert(quotes_message_read.type_of_ask_price == quotes_message_written.type_of_ask_price);
  assert(quotes_message_read.type_of_bid_price == quotes_message_written.type_of_bid_price);
  assert(quotes_message_read.quote_condition == quotes_message_written.quote_condition);
  assert(quotes_message_read.quote_number == quotes_message_written.quote_number);
  assert(quotes_message_read.price_scale_code == quotes_message_written.price_scale_code);
  assert(quotes_message_read.filler_ascii_str_1 == quotes_message_written.filler_ascii_str_1);
  skip
}

/* ---- Order Update Market Sheet Message: 60 bytes ----------------------------- */

/* An Order Update message carries a single order of the market sheet, so that the order book of an instrument may be rebuilt and maintained. */
typedef OrderUpdateMarketSheetMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte price[4];
  byte aggregated_volume[4];
  byte volume[4];
  byte link_id[4];
  byte order_id[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte number_orders[2];
  byte side;
  byte order_type;
  byte action_type;
  byte price_scale_code;
  byte order_date[4];
  byte order_priority_date[4];
  byte order_priority_time[4];
  byte order_priority_micro_secs[2];
  byte order_origin;
  byte filler_binary_int_1
};

int order_update_market_sheet_message_at;

/* every byte of Order Update Market Sheet Message set to one value */
inline fill_order_update_market_sheet_message(order_update_market_sheet_message_record, order_update_market_sheet_message_value) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.symbol_index[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_time[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_seq_num[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.price[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.aggregated_volume[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.volume[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.link_id[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_id[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.system_id[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.source_time_micro_secs[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.number_orders[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.side = order_update_market_sheet_message_value;
  order_update_market_sheet_message_record.order_type = order_update_market_sheet_message_value;
  order_update_market_sheet_message_record.action_type = order_update_market_sheet_message_value;
  order_update_market_sheet_message_record.price_scale_code = order_update_market_sheet_message_value;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_date[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_date[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_time[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.order_priority_micro_secs[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.order_origin = order_update_market_sheet_message_value;
  order_update_market_sheet_message_record.filler_binary_int_1 = order_update_market_sheet_message_value;
  skip
}

/* each byte of Order Update Market Sheet Message set to where it lies, so a field read out of place says so */
inline ramp_order_update_market_sheet_message(order_update_market_sheet_message_record, order_update_market_sheet_message_base) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.symbol_index[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 0 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_time[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 4 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_seq_num[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 8 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.price[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 12 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.aggregated_volume[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 16 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.volume[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 20 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.link_id[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 24 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_id[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 28 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.system_id[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 32 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.source_time_micro_secs[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 36 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.number_orders[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 38 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.side = (order_update_market_sheet_message_base + 40 + 1) % 256;
  order_update_market_sheet_message_record.order_type = (order_update_market_sheet_message_base + 41 + 1) % 256;
  order_update_market_sheet_message_record.action_type = (order_update_market_sheet_message_base + 42 + 1) % 256;
  order_update_market_sheet_message_record.price_scale_code = (order_update_market_sheet_message_base + 43 + 1) % 256;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_date[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 44 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_date[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 48 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_time[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 52 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.order_priority_micro_secs[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 56 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.order_origin = (order_update_market_sheet_message_base + 58 + 1) % 256;
  order_update_market_sheet_message_record.filler_binary_int_1 = (order_update_market_sheet_message_base + 59 + 1) % 256;
  skip
}

/* Order Update Market Sheet Message to the wire, 60 bytes from where the cursor stands */
inline encode_order_update_market_sheet_message(order_update_market_sheet_message_record) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.symbol_index[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.source_time[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.source_seq_num[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.price[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.aggregated_volume[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.volume[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.link_id[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.order_id[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.system_id[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> wire[at] = order_update_market_sheet_message_record.source_time_micro_secs[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> wire[at] = order_update_market_sheet_message_record.number_orders[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  wire[at] = order_update_market_sheet_message_record.side; at = at + 1;
  wire[at] = order_update_market_sheet_message_record.order_type; at = at + 1;
  wire[at] = order_update_market_sheet_message_record.action_type; at = at + 1;
  wire[at] = order_update_market_sheet_message_record.price_scale_code; at = at + 1;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.order_date[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.order_priority_date[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.order_priority_time[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> wire[at] = order_update_market_sheet_message_record.order_priority_micro_secs[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  wire[at] = order_update_market_sheet_message_record.order_origin; at = at + 1;
  wire[at] = order_update_market_sheet_message_record.filler_binary_int_1; at = at + 1;
  skip
}

/* Order Update Market Sheet Message off the wire, 60 bytes from where the cursor stands */
inline decode_order_update_market_sheet_message(order_update_market_sheet_message_record) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.symbol_index[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_time[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_seq_num[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.price[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.aggregated_volume[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.volume[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.link_id[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_id[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.system_id[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.source_time_micro_secs[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.number_orders[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.side = wire[at]; at = at + 1;
  order_update_market_sheet_message_record.order_type = wire[at]; at = at + 1;
  order_update_market_sheet_message_record.action_type = wire[at]; at = at + 1;
  order_update_market_sheet_message_record.price_scale_code = wire[at]; at = at + 1;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_date[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_date[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_time[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.order_priority_micro_secs[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.order_origin = wire[at]; at = at + 1;
  order_update_market_sheet_message_record.filler_binary_int_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Update Market Sheet Message is what was written, byte for byte */
inline equal_order_update_market_sheet_message(order_update_market_sheet_message_read, order_update_market_sheet_message_written) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.symbol_index[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.symbol_index[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.source_time[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.source_time[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.source_seq_num[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.source_seq_num[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.price[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.price[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.aggregated_volume[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.aggregated_volume[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.volume[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.volume[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.link_id[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.link_id[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.order_id[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_id[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.system_id[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.system_id[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> assert(order_update_market_sheet_message_read.source_time_micro_secs[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.source_time_micro_secs[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> assert(order_update_market_sheet_message_read.number_orders[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.number_orders[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  assert(order_update_market_sheet_message_read.side == order_update_market_sheet_message_written.side);
  assert(order_update_market_sheet_message_read.order_type == order_update_market_sheet_message_written.order_type);
  assert(order_update_market_sheet_message_read.action_type == order_update_market_sheet_message_written.action_type);
  assert(order_update_market_sheet_message_read.price_scale_code == order_update_market_sheet_message_written.price_scale_code);
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.order_date[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_date[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.order_priority_date[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_priority_date[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.order_priority_time[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_priority_time[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> assert(order_update_market_sheet_message_read.order_priority_micro_secs[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_priority_micro_secs[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  assert(order_update_market_sheet_message_read.order_origin == order_update_market_sheet_message_written.order_origin);
  assert(order_update_market_sheet_message_read.filler_binary_int_1 == order_update_market_sheet_message_written.filler_binary_int_1);
  skip
}

/* ---- Orderbook Retransmission Delimiter Message: 12 bytes -------------------- */

/* An Orderbook Retransmission Delimiter message delimits the retransmission of a market sheet, so that the order book is cleaned before the orders that follow are applied. */
typedef OrderbookRetransmissionDelimiterMessage {
  byte source_time[4];
  byte source_seq_num[4];
  byte trading_engine_id[2];
  byte instance_id;
  byte retransmission_indicator
};

int orderbook_retransmission_delimiter_message_at;

/* every byte of Orderbook Retransmission Delimiter Message set to one value */
inline fill_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_record, orderbook_retransmission_delimiter_message_value) {
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> orderbook_retransmission_delimiter_message_record.source_time[orderbook_retransmission_delimiter_message_at] = orderbook_retransmission_delimiter_message_value; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> orderbook_retransmission_delimiter_message_record.source_seq_num[orderbook_retransmission_delimiter_message_at] = orderbook_retransmission_delimiter_message_value; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 2 -> orderbook_retransmission_delimiter_message_record.trading_engine_id[orderbook_retransmission_delimiter_message_at] = orderbook_retransmission_delimiter_message_value; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_record.instance_id = orderbook_retransmission_delimiter_message_value;
  orderbook_retransmission_delimiter_message_record.retransmission_indicator = orderbook_retransmission_delimiter_message_value;
  skip
}

/* each byte of Orderbook Retransmission Delimiter Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_record, orderbook_retransmission_delimiter_message_base) {
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> orderbook_retransmission_delimiter_message_record.source_time[orderbook_retransmission_delimiter_message_at] = (orderbook_retransmission_delimiter_message_base + 0 + orderbook_retransmission_delimiter_message_at + 1) % 256; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> orderbook_retransmission_delimiter_message_record.source_seq_num[orderbook_retransmission_delimiter_message_at] = (orderbook_retransmission_delimiter_message_base + 4 + orderbook_retransmission_delimiter_message_at + 1) % 256; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 2 -> orderbook_retransmission_delimiter_message_record.trading_engine_id[orderbook_retransmission_delimiter_message_at] = (orderbook_retransmission_delimiter_message_base + 8 + orderbook_retransmission_delimiter_message_at + 1) % 256; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_record.instance_id = (orderbook_retransmission_delimiter_message_base + 10 + 1) % 256;
  orderbook_retransmission_delimiter_message_record.retransmission_indicator = (orderbook_retransmission_delimiter_message_base + 11 + 1) % 256;
  skip
}

/* Orderbook Retransmission Delimiter Message to the wire, 12 bytes from where the cursor stands */
inline encode_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_record) {
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> wire[at] = orderbook_retransmission_delimiter_message_record.source_time[orderbook_retransmission_delimiter_message_at]; at = at + 1; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> wire[at] = orderbook_retransmission_delimiter_message_record.source_seq_num[orderbook_retransmission_delimiter_message_at]; at = at + 1; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 2 -> wire[at] = orderbook_retransmission_delimiter_message_record.trading_engine_id[orderbook_retransmission_delimiter_message_at]; at = at + 1; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_retransmission_delimiter_message_record.instance_id; at = at + 1;
  wire[at] = orderbook_retransmission_delimiter_message_record.retransmission_indicator; at = at + 1;
  skip
}

/* Orderbook Retransmission Delimiter Message off the wire, 12 bytes from where the cursor stands */
inline decode_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_record) {
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> orderbook_retransmission_delimiter_message_record.source_time[orderbook_retransmission_delimiter_message_at] = wire[at]; at = at + 1; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> orderbook_retransmission_delimiter_message_record.source_seq_num[orderbook_retransmission_delimiter_message_at] = wire[at]; at = at + 1; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 2 -> orderbook_retransmission_delimiter_message_record.trading_engine_id[orderbook_retransmission_delimiter_message_at] = wire[at]; at = at + 1; orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_record.instance_id = wire[at]; at = at + 1;
  orderbook_retransmission_delimiter_message_record.retransmission_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Orderbook Retransmission Delimiter Message is what was written, byte for byte */
inline equal_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_read, orderbook_retransmission_delimiter_message_written) {
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> assert(orderbook_retransmission_delimiter_message_read.source_time[orderbook_retransmission_delimiter_message_at] == orderbook_retransmission_delimiter_message_written.source_time[orderbook_retransmission_delimiter_message_at]); orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 4 -> assert(orderbook_retransmission_delimiter_message_read.source_seq_num[orderbook_retransmission_delimiter_message_at] == orderbook_retransmission_delimiter_message_written.source_seq_num[orderbook_retransmission_delimiter_message_at]); orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  orderbook_retransmission_delimiter_message_at = 0;
  do
  :: orderbook_retransmission_delimiter_message_at < 2 -> assert(orderbook_retransmission_delimiter_message_read.trading_engine_id[orderbook_retransmission_delimiter_message_at] == orderbook_retransmission_delimiter_message_written.trading_engine_id[orderbook_retransmission_delimiter_message_at]); orderbook_retransmission_delimiter_message_at = orderbook_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  assert(orderbook_retransmission_delimiter_message_read.instance_id == orderbook_retransmission_delimiter_message_written.instance_id);
  assert(orderbook_retransmission_delimiter_message_read.retransmission_indicator == orderbook_retransmission_delimiter_message_written.retransmission_indicator);
  skip
}

/* ---- Real Time Index Message: 48 bytes --------------------------------------- */

/* A Real Time Index message carries the current level of an index. */
typedef RealTimeIndexMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte index_level[4];
  byte forerunner_level[4];
  byte session_high[4];
  byte session_low[4];
  byte percentage_of_capitalization[4];
  byte variation_from_previous_days_price[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte num_of_securities_quoted[2];
  byte index_level_code;
  byte type_of_level;
  byte level_scale_code;
  byte percentage_scale_code;
  byte variation_scale_code;
  byte rebroadcast_indicator;
  byte filler_ascii_str_2[2]
};

int real_time_index_message_at;

/* every byte of Real Time Index Message set to one value */
inline fill_real_time_index_message(real_time_index_message_record, real_time_index_message_value) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.symbol_index[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.source_time[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_level[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.forerunner_level[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.session_high[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.session_low[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.percentage_of_capitalization[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.variation_from_previous_days_price[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.system_id[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.source_time_micro_secs[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_securities_quoted[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.index_level_code = real_time_index_message_value;
  real_time_index_message_record.type_of_level = real_time_index_message_value;
  real_time_index_message_record.level_scale_code = real_time_index_message_value;
  real_time_index_message_record.percentage_scale_code = real_time_index_message_value;
  real_time_index_message_record.variation_scale_code = real_time_index_message_value;
  real_time_index_message_record.rebroadcast_indicator = real_time_index_message_value;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.filler_ascii_str_2[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Real Time Index Message set to where it lies, so a field read out of place says so */
inline ramp_real_time_index_message(real_time_index_message_record, real_time_index_message_base) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.symbol_index[real_time_index_message_at] = (real_time_index_message_base + 0 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.source_time[real_time_index_message_at] = (real_time_index_message_base + 4 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_level[real_time_index_message_at] = (real_time_index_message_base + 8 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.forerunner_level[real_time_index_message_at] = (real_time_index_message_base + 12 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.session_high[real_time_index_message_at] = (real_time_index_message_base + 16 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.session_low[real_time_index_message_at] = (real_time_index_message_base + 20 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.percentage_of_capitalization[real_time_index_message_at] = (real_time_index_message_base + 24 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.variation_from_previous_days_price[real_time_index_message_at] = (real_time_index_message_base + 28 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.system_id[real_time_index_message_at] = (real_time_index_message_base + 32 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.source_time_micro_secs[real_time_index_message_at] = (real_time_index_message_base + 36 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_securities_quoted[real_time_index_message_at] = (real_time_index_message_base + 38 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.index_level_code = (real_time_index_message_base + 40 + 1) % 256;
  real_time_index_message_record.type_of_level = (real_time_index_message_base + 41 + 1) % 256;
  real_time_index_message_record.level_scale_code = (real_time_index_message_base + 42 + 1) % 256;
  real_time_index_message_record.percentage_scale_code = (real_time_index_message_base + 43 + 1) % 256;
  real_time_index_message_record.variation_scale_code = (real_time_index_message_base + 44 + 1) % 256;
  real_time_index_message_record.rebroadcast_indicator = (real_time_index_message_base + 45 + 1) % 256;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.filler_ascii_str_2[real_time_index_message_at] = (real_time_index_message_base + 46 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Real Time Index Message to the wire, 48 bytes from where the cursor stands */
inline encode_real_time_index_message(real_time_index_message_record) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.symbol_index[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.source_time[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.index_level[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.forerunner_level[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.session_high[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.session_low[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.percentage_of_capitalization[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.variation_from_previous_days_price[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.system_id[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.source_time_micro_secs[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.num_of_securities_quoted[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  wire[at] = real_time_index_message_record.index_level_code; at = at + 1;
  wire[at] = real_time_index_message_record.type_of_level; at = at + 1;
  wire[at] = real_time_index_message_record.level_scale_code; at = at + 1;
  wire[at] = real_time_index_message_record.percentage_scale_code; at = at + 1;
  wire[at] = real_time_index_message_record.variation_scale_code; at = at + 1;
  wire[at] = real_time_index_message_record.rebroadcast_indicator; at = at + 1;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.filler_ascii_str_2[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Real Time Index Message off the wire, 48 bytes from where the cursor stands */
inline decode_real_time_index_message(real_time_index_message_record) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.symbol_index[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.source_time[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_level[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.forerunner_level[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.session_high[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.session_low[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.percentage_of_capitalization[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.variation_from_previous_days_price[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.system_id[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.source_time_micro_secs[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_securities_quoted[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.index_level_code = wire[at]; at = at + 1;
  real_time_index_message_record.type_of_level = wire[at]; at = at + 1;
  real_time_index_message_record.level_scale_code = wire[at]; at = at + 1;
  real_time_index_message_record.percentage_scale_code = wire[at]; at = at + 1;
  real_time_index_message_record.variation_scale_code = wire[at]; at = at + 1;
  real_time_index_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.filler_ascii_str_2[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Real Time Index Message is what was written, byte for byte */
inline equal_real_time_index_message(real_time_index_message_read, real_time_index_message_written) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.symbol_index[real_time_index_message_at] == real_time_index_message_written.symbol_index[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.source_time[real_time_index_message_at] == real_time_index_message_written.source_time[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.index_level[real_time_index_message_at] == real_time_index_message_written.index_level[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.forerunner_level[real_time_index_message_at] == real_time_index_message_written.forerunner_level[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.session_high[real_time_index_message_at] == real_time_index_message_written.session_high[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.session_low[real_time_index_message_at] == real_time_index_message_written.session_low[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.percentage_of_capitalization[real_time_index_message_at] == real_time_index_message_written.percentage_of_capitalization[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.variation_from_previous_days_price[real_time_index_message_at] == real_time_index_message_written.variation_from_previous_days_price[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.system_id[real_time_index_message_at] == real_time_index_message_written.system_id[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.source_time_micro_secs[real_time_index_message_at] == real_time_index_message_written.source_time_micro_secs[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.num_of_securities_quoted[real_time_index_message_at] == real_time_index_message_written.num_of_securities_quoted[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  assert(real_time_index_message_read.index_level_code == real_time_index_message_written.index_level_code);
  assert(real_time_index_message_read.type_of_level == real_time_index_message_written.type_of_level);
  assert(real_time_index_message_read.level_scale_code == real_time_index_message_written.level_scale_code);
  assert(real_time_index_message_read.percentage_scale_code == real_time_index_message_written.percentage_scale_code);
  assert(real_time_index_message_read.variation_scale_code == real_time_index_message_written.variation_scale_code);
  assert(real_time_index_message_read.rebroadcast_indicator == real_time_index_message_written.rebroadcast_indicator);
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.filler_ascii_str_2[real_time_index_message_at] == real_time_index_message_written.filler_ascii_str_2[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Summary Message: 88 bytes ----------------------------------------- */

/* An Index Summary message gives the summary of an index for the trading day. */
typedef IndexSummaryMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte preliminary_opening_level[4];
  byte preliminary_opening_time[4];
  byte first_level[4];
  byte first_time[4];
  byte opening_reference_level[4];
  byte opening_reference_time[4];
  byte closing_reference_level[4];
  byte closing_reference_time[4];
  byte percent_variation_prev_clos[4];
  byte high_level[4];
  byte high_time[4];
  byte low_level[4];
  byte low_time[4];
  byte clearing_level[4];
  byte clearing_time[4];
  byte liquidation_level[4];
  byte liquidation_time[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte type_of_level;
  byte level_scale_code;
  byte variation_scale_code;
  byte filler_ascii_str_3[3]
};

int index_summary_message_at;

/* every byte of Index Summary Message set to one value */
inline fill_index_summary_message(index_summary_message_record, index_summary_message_value) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.symbol_index[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.source_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.preliminary_opening_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.preliminary_opening_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.first_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.first_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.opening_reference_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.opening_reference_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.closing_reference_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.closing_reference_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.percent_variation_prev_clos[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.high_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.high_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.low_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.low_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.clearing_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.clearing_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.liquidation_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.liquidation_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.system_id[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> index_summary_message_record.source_time_micro_secs[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.type_of_level = index_summary_message_value;
  index_summary_message_record.level_scale_code = index_summary_message_value;
  index_summary_message_record.variation_scale_code = index_summary_message_value;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 3 -> index_summary_message_record.filler_ascii_str_3[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Summary Message set to where it lies, so a field read out of place says so */
inline ramp_index_summary_message(index_summary_message_record, index_summary_message_base) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.symbol_index[index_summary_message_at] = (index_summary_message_base + 0 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.source_time[index_summary_message_at] = (index_summary_message_base + 4 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.preliminary_opening_level[index_summary_message_at] = (index_summary_message_base + 8 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.preliminary_opening_time[index_summary_message_at] = (index_summary_message_base + 12 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.first_level[index_summary_message_at] = (index_summary_message_base + 16 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.first_time[index_summary_message_at] = (index_summary_message_base + 20 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.opening_reference_level[index_summary_message_at] = (index_summary_message_base + 24 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.opening_reference_time[index_summary_message_at] = (index_summary_message_base + 28 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.closing_reference_level[index_summary_message_at] = (index_summary_message_base + 32 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.closing_reference_time[index_summary_message_at] = (index_summary_message_base + 36 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.percent_variation_prev_clos[index_summary_message_at] = (index_summary_message_base + 40 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.high_level[index_summary_message_at] = (index_summary_message_base + 44 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.high_time[index_summary_message_at] = (index_summary_message_base + 48 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.low_level[index_summary_message_at] = (index_summary_message_base + 52 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.low_time[index_summary_message_at] = (index_summary_message_base + 56 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.clearing_level[index_summary_message_at] = (index_summary_message_base + 60 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.clearing_time[index_summary_message_at] = (index_summary_message_base + 64 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.liquidation_level[index_summary_message_at] = (index_summary_message_base + 68 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.liquidation_time[index_summary_message_at] = (index_summary_message_base + 72 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.system_id[index_summary_message_at] = (index_summary_message_base + 76 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> index_summary_message_record.source_time_micro_secs[index_summary_message_at] = (index_summary_message_base + 80 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.type_of_level = (index_summary_message_base + 82 + 1) % 256;
  index_summary_message_record.level_scale_code = (index_summary_message_base + 83 + 1) % 256;
  index_summary_message_record.variation_scale_code = (index_summary_message_base + 84 + 1) % 256;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 3 -> index_summary_message_record.filler_ascii_str_3[index_summary_message_at] = (index_summary_message_base + 85 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Summary Message to the wire, 88 bytes from where the cursor stands */
inline encode_index_summary_message(index_summary_message_record) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.symbol_index[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.source_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.preliminary_opening_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.preliminary_opening_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.first_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.first_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.opening_reference_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.opening_reference_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.closing_reference_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.closing_reference_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.percent_variation_prev_clos[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.high_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.high_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.low_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.low_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.clearing_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.clearing_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.liquidation_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.liquidation_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.system_id[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> wire[at] = index_summary_message_record.source_time_micro_secs[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = index_summary_message_record.type_of_level; at = at + 1;
  wire[at] = index_summary_message_record.level_scale_code; at = at + 1;
  wire[at] = index_summary_message_record.variation_scale_code; at = at + 1;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 3 -> wire[at] = index_summary_message_record.filler_ascii_str_3[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Summary Message off the wire, 88 bytes from where the cursor stands */
inline decode_index_summary_message(index_summary_message_record) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.symbol_index[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.source_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.preliminary_opening_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.preliminary_opening_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.first_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.first_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.opening_reference_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.opening_reference_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.closing_reference_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.closing_reference_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.percent_variation_prev_clos[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.high_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.high_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.low_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.low_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.clearing_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.clearing_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.liquidation_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.liquidation_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.system_id[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> index_summary_message_record.source_time_micro_secs[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.type_of_level = wire[at]; at = at + 1;
  index_summary_message_record.level_scale_code = wire[at]; at = at + 1;
  index_summary_message_record.variation_scale_code = wire[at]; at = at + 1;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 3 -> index_summary_message_record.filler_ascii_str_3[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Summary Message is what was written, byte for byte */
inline equal_index_summary_message(index_summary_message_read, index_summary_message_written) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.symbol_index[index_summary_message_at] == index_summary_message_written.symbol_index[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.source_time[index_summary_message_at] == index_summary_message_written.source_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.preliminary_opening_level[index_summary_message_at] == index_summary_message_written.preliminary_opening_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.preliminary_opening_time[index_summary_message_at] == index_summary_message_written.preliminary_opening_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.first_level[index_summary_message_at] == index_summary_message_written.first_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.first_time[index_summary_message_at] == index_summary_message_written.first_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.opening_reference_level[index_summary_message_at] == index_summary_message_written.opening_reference_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.opening_reference_time[index_summary_message_at] == index_summary_message_written.opening_reference_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.closing_reference_level[index_summary_message_at] == index_summary_message_written.closing_reference_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.closing_reference_time[index_summary_message_at] == index_summary_message_written.closing_reference_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.percent_variation_prev_clos[index_summary_message_at] == index_summary_message_written.percent_variation_prev_clos[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.high_level[index_summary_message_at] == index_summary_message_written.high_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.high_time[index_summary_message_at] == index_summary_message_written.high_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.low_level[index_summary_message_at] == index_summary_message_written.low_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.low_time[index_summary_message_at] == index_summary_message_written.low_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.clearing_level[index_summary_message_at] == index_summary_message_written.clearing_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.clearing_time[index_summary_message_at] == index_summary_message_written.clearing_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.liquidation_level[index_summary_message_at] == index_summary_message_written.liquidation_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.liquidation_time[index_summary_message_at] == index_summary_message_written.liquidation_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.system_id[index_summary_message_at] == index_summary_message_written.system_id[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> assert(index_summary_message_read.source_time_micro_secs[index_summary_message_at] == index_summary_message_written.source_time_micro_secs[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  assert(index_summary_message_read.type_of_level == index_summary_message_written.type_of_level);
  assert(index_summary_message_read.level_scale_code == index_summary_message_written.level_scale_code);
  assert(index_summary_message_read.variation_scale_code == index_summary_message_written.variation_scale_code);
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 3 -> assert(index_summary_message_read.filler_ascii_str_3[index_summary_message_at] == index_summary_message_written.filler_ascii_str_3[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Composition Message: 48 bytes ------------------------------------- */

/* An Index Composition message transmits one instrument making up an index, its weight and its adjustment coefficient. */
typedef IndexCompositionMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte instrument_weight[4];
  byte instrument_factor[4];
  byte previous_close[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte number_of_conponents[2];
  byte instrument_id_of_component[12];
  byte mnemo[5];
  byte index_frequency;
  byte price_scale_code;
  byte level_scale_code
};

int index_composition_message_at;

/* every byte of Index Composition Message set to one value */
inline fill_index_composition_message(index_composition_message_record, index_composition_message_value) {
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.symbol_index[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.source_time[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.instrument_weight[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.instrument_factor[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.previous_close[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.system_id[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> index_composition_message_record.source_time_micro_secs[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> index_composition_message_record.number_of_conponents[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 12 -> index_composition_message_record.instrument_id_of_component[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 5 -> index_composition_message_record.mnemo[index_composition_message_at] = index_composition_message_value; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_record.index_frequency = index_composition_message_value;
  index_composition_message_record.price_scale_code = index_composition_message_value;
  index_composition_message_record.level_scale_code = index_composition_message_value;
  skip
}

/* each byte of Index Composition Message set to where it lies, so a field read out of place says so */
inline ramp_index_composition_message(index_composition_message_record, index_composition_message_base) {
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.symbol_index[index_composition_message_at] = (index_composition_message_base + 0 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.source_time[index_composition_message_at] = (index_composition_message_base + 4 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.instrument_weight[index_composition_message_at] = (index_composition_message_base + 8 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.instrument_factor[index_composition_message_at] = (index_composition_message_base + 12 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.previous_close[index_composition_message_at] = (index_composition_message_base + 16 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.system_id[index_composition_message_at] = (index_composition_message_base + 20 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> index_composition_message_record.source_time_micro_secs[index_composition_message_at] = (index_composition_message_base + 24 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> index_composition_message_record.number_of_conponents[index_composition_message_at] = (index_composition_message_base + 26 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 12 -> index_composition_message_record.instrument_id_of_component[index_composition_message_at] = (index_composition_message_base + 28 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 5 -> index_composition_message_record.mnemo[index_composition_message_at] = (index_composition_message_base + 40 + index_composition_message_at + 1) % 256; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_record.index_frequency = (index_composition_message_base + 45 + 1) % 256;
  index_composition_message_record.price_scale_code = (index_composition_message_base + 46 + 1) % 256;
  index_composition_message_record.level_scale_code = (index_composition_message_base + 47 + 1) % 256;
  skip
}

/* Index Composition Message to the wire, 48 bytes from where the cursor stands */
inline encode_index_composition_message(index_composition_message_record) {
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> wire[at] = index_composition_message_record.symbol_index[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> wire[at] = index_composition_message_record.source_time[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> wire[at] = index_composition_message_record.instrument_weight[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> wire[at] = index_composition_message_record.instrument_factor[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> wire[at] = index_composition_message_record.previous_close[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> wire[at] = index_composition_message_record.system_id[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> wire[at] = index_composition_message_record.source_time_micro_secs[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> wire[at] = index_composition_message_record.number_of_conponents[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 12 -> wire[at] = index_composition_message_record.instrument_id_of_component[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 5 -> wire[at] = index_composition_message_record.mnemo[index_composition_message_at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  wire[at] = index_composition_message_record.index_frequency; at = at + 1;
  wire[at] = index_composition_message_record.price_scale_code; at = at + 1;
  wire[at] = index_composition_message_record.level_scale_code; at = at + 1;
  skip
}

/* Index Composition Message off the wire, 48 bytes from where the cursor stands */
inline decode_index_composition_message(index_composition_message_record) {
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.symbol_index[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.source_time[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.instrument_weight[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.instrument_factor[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.previous_close[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> index_composition_message_record.system_id[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> index_composition_message_record.source_time_micro_secs[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> index_composition_message_record.number_of_conponents[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 12 -> index_composition_message_record.instrument_id_of_component[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 5 -> index_composition_message_record.mnemo[index_composition_message_at] = wire[at]; at = at + 1; index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_record.index_frequency = wire[at]; at = at + 1;
  index_composition_message_record.price_scale_code = wire[at]; at = at + 1;
  index_composition_message_record.level_scale_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Index Composition Message is what was written, byte for byte */
inline equal_index_composition_message(index_composition_message_read, index_composition_message_written) {
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> assert(index_composition_message_read.symbol_index[index_composition_message_at] == index_composition_message_written.symbol_index[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> assert(index_composition_message_read.source_time[index_composition_message_at] == index_composition_message_written.source_time[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> assert(index_composition_message_read.instrument_weight[index_composition_message_at] == index_composition_message_written.instrument_weight[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> assert(index_composition_message_read.instrument_factor[index_composition_message_at] == index_composition_message_written.instrument_factor[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> assert(index_composition_message_read.previous_close[index_composition_message_at] == index_composition_message_written.previous_close[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 4 -> assert(index_composition_message_read.system_id[index_composition_message_at] == index_composition_message_written.system_id[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> assert(index_composition_message_read.source_time_micro_secs[index_composition_message_at] == index_composition_message_written.source_time_micro_secs[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 2 -> assert(index_composition_message_read.number_of_conponents[index_composition_message_at] == index_composition_message_written.number_of_conponents[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 12 -> assert(index_composition_message_read.instrument_id_of_component[index_composition_message_at] == index_composition_message_written.instrument_id_of_component[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  index_composition_message_at = 0;
  do
  :: index_composition_message_at < 5 -> assert(index_composition_message_read.mnemo[index_composition_message_at] == index_composition_message_written.mnemo[index_composition_message_at]); index_composition_message_at = index_composition_message_at + 1
  :: else -> break
  od;
  assert(index_composition_message_read.index_frequency == index_composition_message_written.index_frequency);
  assert(index_composition_message_read.price_scale_code == index_composition_message_written.price_scale_code);
  assert(index_composition_message_read.level_scale_code == index_composition_message_written.level_scale_code);
  skip
}

/* ---- Start Refresh Message: 4 bytes ------------------------------------------ */

/* A refresh cycle begins with a Start Refresh message on the multicast channels. */
typedef StartRefreshMessage {
  byte last_seq_num[4]
};

int start_refresh_message_at;

/* every byte of Start Refresh Message set to one value */
inline fill_start_refresh_message(start_refresh_message_record, start_refresh_message_value) {
  start_refresh_message_at = 0;
  do
  :: start_refresh_message_at < 4 -> start_refresh_message_record.last_seq_num[start_refresh_message_at] = start_refresh_message_value; start_refresh_message_at = start_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Refresh Message set to where it lies, so a field read out of place says so */
inline ramp_start_refresh_message(start_refresh_message_record, start_refresh_message_base) {
  start_refresh_message_at = 0;
  do
  :: start_refresh_message_at < 4 -> start_refresh_message_record.last_seq_num[start_refresh_message_at] = (start_refresh_message_base + 0 + start_refresh_message_at + 1) % 256; start_refresh_message_at = start_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Refresh Message to the wire, 4 bytes from where the cursor stands */
inline encode_start_refresh_message(start_refresh_message_record) {
  start_refresh_message_at = 0;
  do
  :: start_refresh_message_at < 4 -> wire[at] = start_refresh_message_record.last_seq_num[start_refresh_message_at]; at = at + 1; start_refresh_message_at = start_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Refresh Message off the wire, 4 bytes from where the cursor stands */
inline decode_start_refresh_message(start_refresh_message_record) {
  start_refresh_message_at = 0;
  do
  :: start_refresh_message_at < 4 -> start_refresh_message_record.last_seq_num[start_refresh_message_at] = wire[at]; at = at + 1; start_refresh_message_at = start_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Refresh Message is what was written, byte for byte */
inline equal_start_refresh_message(start_refresh_message_read, start_refresh_message_written) {
  start_refresh_message_at = 0;
  do
  :: start_refresh_message_at < 4 -> assert(start_refresh_message_read.last_seq_num[start_refresh_message_at] == start_refresh_message_written.last_seq_num[start_refresh_message_at]); start_refresh_message_at = start_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Refresh Message: 4 bytes -------------------------------------------- */

/* A refresh cycle ends with an End Refresh message on the multicast channels. */
typedef EndRefreshMessage {
  byte last_seq_num[4]
};

int end_refresh_message_at;

/* every byte of End Refresh Message set to one value */
inline fill_end_refresh_message(end_refresh_message_record, end_refresh_message_value) {
  end_refresh_message_at = 0;
  do
  :: end_refresh_message_at < 4 -> end_refresh_message_record.last_seq_num[end_refresh_message_at] = end_refresh_message_value; end_refresh_message_at = end_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Refresh Message set to where it lies, so a field read out of place says so */
inline ramp_end_refresh_message(end_refresh_message_record, end_refresh_message_base) {
  end_refresh_message_at = 0;
  do
  :: end_refresh_message_at < 4 -> end_refresh_message_record.last_seq_num[end_refresh_message_at] = (end_refresh_message_base + 0 + end_refresh_message_at + 1) % 256; end_refresh_message_at = end_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Refresh Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_refresh_message(end_refresh_message_record) {
  end_refresh_message_at = 0;
  do
  :: end_refresh_message_at < 4 -> wire[at] = end_refresh_message_record.last_seq_num[end_refresh_message_at]; at = at + 1; end_refresh_message_at = end_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Refresh Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_refresh_message(end_refresh_message_record) {
  end_refresh_message_at = 0;
  do
  :: end_refresh_message_at < 4 -> end_refresh_message_record.last_seq_num[end_refresh_message_at] = wire[at]; at = at + 1; end_refresh_message_at = end_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Refresh Message is what was written, byte for byte */
inline equal_end_refresh_message(end_refresh_message_read, end_refresh_message_written) {
  end_refresh_message_at = 0;
  do
  :: end_refresh_message_at < 4 -> assert(end_refresh_message_read.last_seq_num[end_refresh_message_at] == end_refresh_message_written.last_seq_num[end_refresh_message_at]); end_refresh_message_at = end_refresh_message_at + 1
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
    assert(at == 16);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 16);
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
    assert(at == 4);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 4);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Stock State Change Message: encoded, read back, and compared */
proctype check_stock_state_change_message() {
  StockStateChangeMessage stock_state_change_message_sent;
  StockStateChangeMessage stock_state_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_state_change_message(stock_state_change_message_sent, 0)
  :: pattern == 1 -> fill_stock_state_change_message(stock_state_change_message_sent, 32)
  :: pattern == 2 -> fill_stock_state_change_message(stock_state_change_message_sent, 255)
  :: else -> ramp_stock_state_change_message(stock_state_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_state_change_message(stock_state_change_message_sent);
    assert(at == 48);
    at = 0;
    decode_stock_state_change_message(stock_state_change_message_got);
    assert(at == 48);
    equal_stock_state_change_message(stock_state_change_message_got, stock_state_change_message_sent)
  }
}

/* Class State Change Message: encoded, read back, and compared */
proctype check_class_state_change_message() {
  ClassStateChangeMessage class_state_change_message_sent;
  ClassStateChangeMessage class_state_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_class_state_change_message(class_state_change_message_sent, 0)
  :: pattern == 1 -> fill_class_state_change_message(class_state_change_message_sent, 32)
  :: pattern == 2 -> fill_class_state_change_message(class_state_change_message_sent, 255)
  :: else -> ramp_class_state_change_message(class_state_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_class_state_change_message(class_state_change_message_sent);
    assert(at == 24);
    at = 0;
    decode_class_state_change_message(class_state_change_message_got);
    assert(at == 24);
    equal_class_state_change_message(class_state_change_message_got, class_state_change_message_sent)
  }
}

/* Mail Message: encoded, read back, and compared */
proctype check_mail_message() {
  MailMessage mail_message_sent;
  MailMessage mail_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mail_message(mail_message_sent, 0)
  :: pattern == 1 -> fill_mail_message(mail_message_sent, 32)
  :: pattern == 2 -> fill_mail_message(mail_message_sent, 255)
  :: else -> ramp_mail_message(mail_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mail_message(mail_message_sent);
    assert(at == 964);
    at = 0;
    decode_mail_message(mail_message_got);
    assert(at == 964);
    equal_mail_message(mail_message_got, mail_message_sent)
  }
}

/* Indicative Matching Price Message: encoded, read back, and compared */
proctype check_indicative_matching_price_message() {
  IndicativeMatchingPriceMessage indicative_matching_price_message_sent;
  IndicativeMatchingPriceMessage indicative_matching_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_matching_price_message(indicative_matching_price_message_sent, 0)
  :: pattern == 1 -> fill_indicative_matching_price_message(indicative_matching_price_message_sent, 32)
  :: pattern == 2 -> fill_indicative_matching_price_message(indicative_matching_price_message_sent, 255)
  :: else -> ramp_indicative_matching_price_message(indicative_matching_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_matching_price_message(indicative_matching_price_message_sent);
    assert(at == 32);
    at = 0;
    decode_indicative_matching_price_message(indicative_matching_price_message_got);
    assert(at == 32);
    equal_indicative_matching_price_message(indicative_matching_price_message_got, indicative_matching_price_message_sent)
  }
}

/* Collars Message: encoded, read back, and compared */
proctype check_collars_message() {
  CollarsMessage collars_message_sent;
  CollarsMessage collars_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_collars_message(collars_message_sent, 0)
  :: pattern == 1 -> fill_collars_message(collars_message_sent, 32)
  :: pattern == 2 -> fill_collars_message(collars_message_sent, 255)
  :: else -> ramp_collars_message(collars_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_collars_message(collars_message_sent);
    assert(at == 32);
    at = 0;
    decode_collars_message(collars_message_got);
    assert(at == 32);
    equal_collars_message(collars_message_got, collars_message_sent)
  }
}

/* Session Timetable Message: encoded, read back, and compared */
proctype check_session_timetable_message() {
  SessionTimetableMessage session_timetable_message_sent;
  SessionTimetableMessage session_timetable_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_session_timetable_message(session_timetable_message_sent, 0)
  :: pattern == 1 -> fill_session_timetable_message(session_timetable_message_sent, 32)
  :: pattern == 2 -> fill_session_timetable_message(session_timetable_message_sent, 255)
  :: else -> ramp_session_timetable_message(session_timetable_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_session_timetable_message(session_timetable_message_sent);
    assert(at == 80);
    at = 0;
    decode_session_timetable_message(session_timetable_message_got);
    assert(at == 80);
    equal_session_timetable_message(session_timetable_message_got, session_timetable_message_sent)
  }
}

/* Global Market Activity Summary Message: encoded, read back, and compared */
proctype check_global_market_activity_summary_message() {
  GlobalMarketActivitySummaryMessage global_market_activity_summary_message_sent;
  GlobalMarketActivitySummaryMessage global_market_activity_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_global_market_activity_summary_message(global_market_activity_summary_message_sent, 0)
  :: pattern == 1 -> fill_global_market_activity_summary_message(global_market_activity_summary_message_sent, 32)
  :: pattern == 2 -> fill_global_market_activity_summary_message(global_market_activity_summary_message_sent, 255)
  :: else -> ramp_global_market_activity_summary_message(global_market_activity_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_global_market_activity_summary_message(global_market_activity_summary_message_sent);
    assert(at == 30);
    at = 0;
    decode_global_market_activity_summary_message(global_market_activity_summary_message_got);
    assert(at == 30);
    equal_global_market_activity_summary_message(global_market_activity_summary_message_got, global_market_activity_summary_message_sent)
  }
}

/* Start Referential Message: encoded, read back, and compared */
proctype check_start_referential_message() {
  StartReferentialMessage start_referential_message_sent;
  StartReferentialMessage start_referential_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_referential_message(start_referential_message_sent, 0)
  :: pattern == 1 -> fill_start_referential_message(start_referential_message_sent, 32)
  :: pattern == 2 -> fill_start_referential_message(start_referential_message_sent, 255)
  :: else -> ramp_start_referential_message(start_referential_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_referential_message(start_referential_message_sent);
    assert(at == 4);
    at = 0;
    decode_start_referential_message(start_referential_message_got);
    assert(at == 4);
    equal_start_referential_message(start_referential_message_got, start_referential_message_sent)
  }
}

/* End Referential Message: encoded, read back, and compared */
proctype check_end_referential_message() {
  EndReferentialMessage end_referential_message_sent;
  EndReferentialMessage end_referential_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_referential_message(end_referential_message_sent, 0)
  :: pattern == 1 -> fill_end_referential_message(end_referential_message_sent, 32)
  :: pattern == 2 -> fill_end_referential_message(end_referential_message_sent, 255)
  :: else -> ramp_end_referential_message(end_referential_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_referential_message(end_referential_message_sent);
    assert(at == 4);
    at = 0;
    decode_end_referential_message(end_referential_message_got);
    assert(at == 4);
    equal_end_referential_message(end_referential_message_got, end_referential_message_sent)
  }
}

/* Referential Message: encoded, read back, and compared */
proctype check_referential_message() {
  ReferentialMessage referential_message_sent;
  ReferentialMessage referential_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_referential_message(referential_message_sent, 0)
  :: pattern == 1 -> fill_referential_message(referential_message_sent, 32)
  :: pattern == 2 -> fill_referential_message(referential_message_sent, 255)
  :: else -> ramp_referential_message(referential_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_referential_message(referential_message_sent);
    assert(at == 492);
    at = 0;
    decode_referential_message(referential_message_got);
    assert(at == 492);
    equal_referential_message(referential_message_got, referential_message_sent)
  }
}

/* Trade Creation Message: encoded, read back, and compared */
proctype check_trade_creation_message() {
  TradeCreationMessage trade_creation_message_sent;
  TradeCreationMessage trade_creation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_creation_message(trade_creation_message_sent, 0)
  :: pattern == 1 -> fill_trade_creation_message(trade_creation_message_sent, 32)
  :: pattern == 2 -> fill_trade_creation_message(trade_creation_message_sent, 255)
  :: else -> ramp_trade_creation_message(trade_creation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_creation_message(trade_creation_message_sent);
    assert(at == 40);
    at = 0;
    decode_trade_creation_message(trade_creation_message_got);
    assert(at == 40);
    equal_trade_creation_message(trade_creation_message_got, trade_creation_message_sent)
  }
}

/* Trade Cancellation Message: encoded, read back, and compared */
proctype check_trade_cancellation_message() {
  TradeCancellationMessage trade_cancellation_message_sent;
  TradeCancellationMessage trade_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 255)
  :: else -> ramp_trade_cancellation_message(trade_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancellation_message(trade_cancellation_message_sent);
    assert(at == 24);
    at = 0;
    decode_trade_cancellation_message(trade_cancellation_message_got);
    assert(at == 24);
    equal_trade_cancellation_message(trade_cancellation_message_got, trade_cancellation_message_sent)
  }
}

/* Trade Full Information Message: encoded, read back, and compared */
proctype check_trade_full_information_message() {
  TradeFullInformationMessage trade_full_information_message_sent;
  TradeFullInformationMessage trade_full_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_full_information_message(trade_full_information_message_sent, 0)
  :: pattern == 1 -> fill_trade_full_information_message(trade_full_information_message_sent, 32)
  :: pattern == 2 -> fill_trade_full_information_message(trade_full_information_message_sent, 255)
  :: else -> ramp_trade_full_information_message(trade_full_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_full_information_message(trade_full_information_message_sent);
    assert(at == 60);
    at = 0;
    decode_trade_full_information_message(trade_full_information_message_got);
    assert(at == 60);
    equal_trade_full_information_message(trade_full_information_message_got, trade_full_information_message_sent)
  }
}

/* Price Update Message: encoded, read back, and compared */
proctype check_price_update_message() {
  PriceUpdateMessage price_update_message_sent;
  PriceUpdateMessage price_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_update_message(price_update_message_sent, 0)
  :: pattern == 1 -> fill_price_update_message(price_update_message_sent, 32)
  :: pattern == 2 -> fill_price_update_message(price_update_message_sent, 255)
  :: else -> ramp_price_update_message(price_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_update_message(price_update_message_sent);
    assert(at == 40);
    at = 0;
    decode_price_update_message(price_update_message_got);
    assert(at == 40);
    equal_price_update_message(price_update_message_got, price_update_message_sent)
  }
}

/* Auction Summary Message: encoded, read back, and compared */
proctype check_auction_summary_message() {
  AuctionSummaryMessage auction_summary_message_sent;
  AuctionSummaryMessage auction_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_summary_message(auction_summary_message_sent, 0)
  :: pattern == 1 -> fill_auction_summary_message(auction_summary_message_sent, 32)
  :: pattern == 2 -> fill_auction_summary_message(auction_summary_message_sent, 255)
  :: else -> ramp_auction_summary_message(auction_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_summary_message(auction_summary_message_sent);
    assert(at == 48);
    at = 0;
    decode_auction_summary_message(auction_summary_message_got);
    assert(at == 48);
    equal_auction_summary_message(auction_summary_message_got, auction_summary_message_sent)
  }
}

/* Vwap Closing Price Message: encoded, read back, and compared */
proctype check_vwap_closing_price_message() {
  VwapClosingPriceMessage vwap_closing_price_message_sent;
  VwapClosingPriceMessage vwap_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vwap_closing_price_message(vwap_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_vwap_closing_price_message(vwap_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_vwap_closing_price_message(vwap_closing_price_message_sent, 255)
  :: else -> ramp_vwap_closing_price_message(vwap_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vwap_closing_price_message(vwap_closing_price_message_sent);
    assert(at == 44);
    at = 0;
    decode_vwap_closing_price_message(vwap_closing_price_message_got);
    assert(at == 44);
    equal_vwap_closing_price_message(vwap_closing_price_message_got, vwap_closing_price_message_sent)
  }
}

/* Quotes Message: encoded, read back, and compared */
proctype check_quotes_message() {
  QuotesMessage quotes_message_sent;
  QuotesMessage quotes_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quotes_message(quotes_message_sent, 0)
  :: pattern == 1 -> fill_quotes_message(quotes_message_sent, 32)
  :: pattern == 2 -> fill_quotes_message(quotes_message_sent, 255)
  :: else -> ramp_quotes_message(quotes_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quotes_message(quotes_message_sent);
    assert(at == 48);
    at = 0;
    decode_quotes_message(quotes_message_got);
    assert(at == 48);
    equal_quotes_message(quotes_message_got, quotes_message_sent)
  }
}

/* Order Update Market Sheet Message: encoded, read back, and compared */
proctype check_order_update_market_sheet_message() {
  OrderUpdateMarketSheetMessage order_update_market_sheet_message_sent;
  OrderUpdateMarketSheetMessage order_update_market_sheet_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_update_market_sheet_message(order_update_market_sheet_message_sent, 0)
  :: pattern == 1 -> fill_order_update_market_sheet_message(order_update_market_sheet_message_sent, 32)
  :: pattern == 2 -> fill_order_update_market_sheet_message(order_update_market_sheet_message_sent, 255)
  :: else -> ramp_order_update_market_sheet_message(order_update_market_sheet_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_update_market_sheet_message(order_update_market_sheet_message_sent);
    assert(at == 60);
    at = 0;
    decode_order_update_market_sheet_message(order_update_market_sheet_message_got);
    assert(at == 60);
    equal_order_update_market_sheet_message(order_update_market_sheet_message_got, order_update_market_sheet_message_sent)
  }
}

/* Orderbook Retransmission Delimiter Message: encoded, read back, and compared */
proctype check_orderbook_retransmission_delimiter_message() {
  OrderbookRetransmissionDelimiterMessage orderbook_retransmission_delimiter_message_sent;
  OrderbookRetransmissionDelimiterMessage orderbook_retransmission_delimiter_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_sent, 255)
  :: else -> ramp_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_sent);
    assert(at == 12);
    at = 0;
    decode_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_got);
    assert(at == 12);
    equal_orderbook_retransmission_delimiter_message(orderbook_retransmission_delimiter_message_got, orderbook_retransmission_delimiter_message_sent)
  }
}

/* Real Time Index Message: encoded, read back, and compared */
proctype check_real_time_index_message() {
  RealTimeIndexMessage real_time_index_message_sent;
  RealTimeIndexMessage real_time_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_real_time_index_message(real_time_index_message_sent, 0)
  :: pattern == 1 -> fill_real_time_index_message(real_time_index_message_sent, 32)
  :: pattern == 2 -> fill_real_time_index_message(real_time_index_message_sent, 255)
  :: else -> ramp_real_time_index_message(real_time_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_real_time_index_message(real_time_index_message_sent);
    assert(at == 48);
    at = 0;
    decode_real_time_index_message(real_time_index_message_got);
    assert(at == 48);
    equal_real_time_index_message(real_time_index_message_got, real_time_index_message_sent)
  }
}

/* Index Summary Message: encoded, read back, and compared */
proctype check_index_summary_message() {
  IndexSummaryMessage index_summary_message_sent;
  IndexSummaryMessage index_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_summary_message(index_summary_message_sent, 0)
  :: pattern == 1 -> fill_index_summary_message(index_summary_message_sent, 32)
  :: pattern == 2 -> fill_index_summary_message(index_summary_message_sent, 255)
  :: else -> ramp_index_summary_message(index_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_summary_message(index_summary_message_sent);
    assert(at == 88);
    at = 0;
    decode_index_summary_message(index_summary_message_got);
    assert(at == 88);
    equal_index_summary_message(index_summary_message_got, index_summary_message_sent)
  }
}

/* Index Composition Message: encoded, read back, and compared */
proctype check_index_composition_message() {
  IndexCompositionMessage index_composition_message_sent;
  IndexCompositionMessage index_composition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_composition_message(index_composition_message_sent, 0)
  :: pattern == 1 -> fill_index_composition_message(index_composition_message_sent, 32)
  :: pattern == 2 -> fill_index_composition_message(index_composition_message_sent, 255)
  :: else -> ramp_index_composition_message(index_composition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_composition_message(index_composition_message_sent);
    assert(at == 48);
    at = 0;
    decode_index_composition_message(index_composition_message_got);
    assert(at == 48);
    equal_index_composition_message(index_composition_message_got, index_composition_message_sent)
  }
}

/* Start Refresh Message: encoded, read back, and compared */
proctype check_start_refresh_message() {
  StartRefreshMessage start_refresh_message_sent;
  StartRefreshMessage start_refresh_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_refresh_message(start_refresh_message_sent, 0)
  :: pattern == 1 -> fill_start_refresh_message(start_refresh_message_sent, 32)
  :: pattern == 2 -> fill_start_refresh_message(start_refresh_message_sent, 255)
  :: else -> ramp_start_refresh_message(start_refresh_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_refresh_message(start_refresh_message_sent);
    assert(at == 4);
    at = 0;
    decode_start_refresh_message(start_refresh_message_got);
    assert(at == 4);
    equal_start_refresh_message(start_refresh_message_got, start_refresh_message_sent)
  }
}

/* End Refresh Message: encoded, read back, and compared */
proctype check_end_refresh_message() {
  EndRefreshMessage end_refresh_message_sent;
  EndRefreshMessage end_refresh_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_refresh_message(end_refresh_message_sent, 0)
  :: pattern == 1 -> fill_end_refresh_message(end_refresh_message_sent, 32)
  :: pattern == 2 -> fill_end_refresh_message(end_refresh_message_sent, 255)
  :: else -> ramp_end_refresh_message(end_refresh_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_refresh_message(end_refresh_message_sent);
    assert(at == 4);
    at = 0;
    decode_end_refresh_message(end_refresh_message_got);
    assert(at == 4);
    equal_end_refresh_message(end_refresh_message_got, end_refresh_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_stock_state_change_message()
  :: run check_class_state_change_message()
  :: run check_mail_message()
  :: run check_indicative_matching_price_message()
  :: run check_collars_message()
  :: run check_session_timetable_message()
  :: run check_global_market_activity_summary_message()
  :: run check_start_referential_message()
  :: run check_end_referential_message()
  :: run check_referential_message()
  :: run check_trade_creation_message()
  :: run check_trade_cancellation_message()
  :: run check_trade_full_information_message()
  :: run check_price_update_message()
  :: run check_auction_summary_message()
  :: run check_vwap_closing_price_message()
  :: run check_quotes_message()
  :: run check_order_update_market_sheet_message()
  :: run check_orderbook_retransmission_delimiter_message()
  :: run check_real_time_index_message()
  :: run check_index_summary_message()
  :: run check_index_composition_message()
  :: run check_start_refresh_message()
  :: run check_end_refresh_message()
  fi
}
