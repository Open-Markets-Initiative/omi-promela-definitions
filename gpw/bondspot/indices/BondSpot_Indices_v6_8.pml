/*
 * Giełda Papierów Wartościowych w Warszawie BondSpot Indices
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
 *   - a run of a stated number of entries
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 108

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* All messages are preceded by a common packet header format, which section 1.1 states for every Market Information message */
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

/* ---- Real Time Index Message: 108 bytes -------------------------------------- */

/* The real time index message handles the real-time characteristics of an index */
typedef RealTimeIndexMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte system_id[4];
  byte index_level[4];
  byte session_high[4];
  byte session_low[4];
  byte ind_index_opening_portfolio[4];
  byte percent_change_toi[4];
  byte pct_change_index_val_prev_session[4];
  byte pct_change_index_val_prev_year[4];
  byte toi[4];
  byte point_change[4];
  byte value_trading[8];
  byte index_value_bid[4];
  byte index_value_ask[4];
  byte mid_spread_index[4];
  byte difference_central_spread[4];
  byte num_of_active_instruments[2];
  byte num_of_instr_of_decreasing_qt[2];
  byte num_of_instr_of_increasing_qt[2];
  byte num_of_instr_of_unchanged_qt[2];
  byte source_time_micro_secs[2];
  byte level_scale_code;
  byte time_first_high[6];
  byte time_first_low[6];
  byte index_status_indicator[2];
  byte index_level_code;
  byte marker_percent_change_toi;
  byte marker_pct_chg_index_val_prev_sess;
  byte marker_pct_chg_index_val_prev_year;
  byte marker_point_change;
  byte marker_difference_central_spread;
  byte dissemination_frequency_marker
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
  :: real_time_index_message_at < 4 -> real_time_index_message_record.source_seq_num[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.system_id[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_level[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
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
  :: real_time_index_message_at < 4 -> real_time_index_message_record.ind_index_opening_portfolio[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.percent_change_toi[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.pct_change_index_val_prev_session[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.pct_change_index_val_prev_year[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.toi[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.point_change[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.value_trading[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_value_bid[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_value_ask[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.mid_spread_index[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.difference_central_spread[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_active_instruments[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_instr_of_decreasing_qt[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_instr_of_increasing_qt[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_instr_of_unchanged_qt[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.source_time_micro_secs[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.level_scale_code = real_time_index_message_value;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> real_time_index_message_record.time_first_high[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> real_time_index_message_record.time_first_low[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.index_status_indicator[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.index_level_code = real_time_index_message_value;
  real_time_index_message_record.marker_percent_change_toi = real_time_index_message_value;
  real_time_index_message_record.marker_pct_chg_index_val_prev_sess = real_time_index_message_value;
  real_time_index_message_record.marker_pct_chg_index_val_prev_year = real_time_index_message_value;
  real_time_index_message_record.marker_point_change = real_time_index_message_value;
  real_time_index_message_record.marker_difference_central_spread = real_time_index_message_value;
  real_time_index_message_record.dissemination_frequency_marker = real_time_index_message_value;
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
  :: real_time_index_message_at < 4 -> real_time_index_message_record.source_seq_num[real_time_index_message_at] = (real_time_index_message_base + 8 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.system_id[real_time_index_message_at] = (real_time_index_message_base + 12 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_level[real_time_index_message_at] = (real_time_index_message_base + 16 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.session_high[real_time_index_message_at] = (real_time_index_message_base + 20 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.session_low[real_time_index_message_at] = (real_time_index_message_base + 24 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.ind_index_opening_portfolio[real_time_index_message_at] = (real_time_index_message_base + 28 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.percent_change_toi[real_time_index_message_at] = (real_time_index_message_base + 32 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.pct_change_index_val_prev_session[real_time_index_message_at] = (real_time_index_message_base + 36 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.pct_change_index_val_prev_year[real_time_index_message_at] = (real_time_index_message_base + 40 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.toi[real_time_index_message_at] = (real_time_index_message_base + 44 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.point_change[real_time_index_message_at] = (real_time_index_message_base + 48 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.value_trading[real_time_index_message_at] = (real_time_index_message_base + 52 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_value_bid[real_time_index_message_at] = (real_time_index_message_base + 60 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_value_ask[real_time_index_message_at] = (real_time_index_message_base + 64 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.mid_spread_index[real_time_index_message_at] = (real_time_index_message_base + 68 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.difference_central_spread[real_time_index_message_at] = (real_time_index_message_base + 72 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_active_instruments[real_time_index_message_at] = (real_time_index_message_base + 76 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_instr_of_decreasing_qt[real_time_index_message_at] = (real_time_index_message_base + 78 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_instr_of_increasing_qt[real_time_index_message_at] = (real_time_index_message_base + 80 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_instr_of_unchanged_qt[real_time_index_message_at] = (real_time_index_message_base + 82 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.source_time_micro_secs[real_time_index_message_at] = (real_time_index_message_base + 84 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.level_scale_code = (real_time_index_message_base + 86 + 1) % 256;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> real_time_index_message_record.time_first_high[real_time_index_message_at] = (real_time_index_message_base + 87 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> real_time_index_message_record.time_first_low[real_time_index_message_at] = (real_time_index_message_base + 93 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.index_status_indicator[real_time_index_message_at] = (real_time_index_message_base + 99 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.index_level_code = (real_time_index_message_base + 101 + 1) % 256;
  real_time_index_message_record.marker_percent_change_toi = (real_time_index_message_base + 102 + 1) % 256;
  real_time_index_message_record.marker_pct_chg_index_val_prev_sess = (real_time_index_message_base + 103 + 1) % 256;
  real_time_index_message_record.marker_pct_chg_index_val_prev_year = (real_time_index_message_base + 104 + 1) % 256;
  real_time_index_message_record.marker_point_change = (real_time_index_message_base + 105 + 1) % 256;
  real_time_index_message_record.marker_difference_central_spread = (real_time_index_message_base + 106 + 1) % 256;
  real_time_index_message_record.dissemination_frequency_marker = (real_time_index_message_base + 107 + 1) % 256;
  skip
}

/* Real Time Index Message to the wire, 108 bytes from where the cursor stands */
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
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.source_seq_num[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.system_id[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.index_level[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
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
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.ind_index_opening_portfolio[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.percent_change_toi[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.pct_change_index_val_prev_session[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.pct_change_index_val_prev_year[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.toi[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.point_change[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> wire[at] = real_time_index_message_record.value_trading[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.index_value_bid[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.index_value_ask[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.mid_spread_index[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.difference_central_spread[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.num_of_active_instruments[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.num_of_instr_of_decreasing_qt[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.num_of_instr_of_increasing_qt[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.num_of_instr_of_unchanged_qt[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.source_time_micro_secs[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  wire[at] = real_time_index_message_record.level_scale_code; at = at + 1;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> wire[at] = real_time_index_message_record.time_first_high[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> wire[at] = real_time_index_message_record.time_first_low[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.index_status_indicator[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  wire[at] = real_time_index_message_record.index_level_code; at = at + 1;
  wire[at] = real_time_index_message_record.marker_percent_change_toi; at = at + 1;
  wire[at] = real_time_index_message_record.marker_pct_chg_index_val_prev_sess; at = at + 1;
  wire[at] = real_time_index_message_record.marker_pct_chg_index_val_prev_year; at = at + 1;
  wire[at] = real_time_index_message_record.marker_point_change; at = at + 1;
  wire[at] = real_time_index_message_record.marker_difference_central_spread; at = at + 1;
  wire[at] = real_time_index_message_record.dissemination_frequency_marker; at = at + 1;
  skip
}

/* Real Time Index Message off the wire, 108 bytes from where the cursor stands */
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
  :: real_time_index_message_at < 4 -> real_time_index_message_record.source_seq_num[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.system_id[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_level[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
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
  :: real_time_index_message_at < 4 -> real_time_index_message_record.ind_index_opening_portfolio[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.percent_change_toi[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.pct_change_index_val_prev_session[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.pct_change_index_val_prev_year[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.toi[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.point_change[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.value_trading[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_value_bid[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.index_value_ask[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.mid_spread_index[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.difference_central_spread[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_active_instruments[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_instr_of_decreasing_qt[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_instr_of_increasing_qt[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_of_instr_of_unchanged_qt[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.source_time_micro_secs[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.level_scale_code = wire[at]; at = at + 1;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> real_time_index_message_record.time_first_high[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> real_time_index_message_record.time_first_low[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.index_status_indicator[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.index_level_code = wire[at]; at = at + 1;
  real_time_index_message_record.marker_percent_change_toi = wire[at]; at = at + 1;
  real_time_index_message_record.marker_pct_chg_index_val_prev_sess = wire[at]; at = at + 1;
  real_time_index_message_record.marker_pct_chg_index_val_prev_year = wire[at]; at = at + 1;
  real_time_index_message_record.marker_point_change = wire[at]; at = at + 1;
  real_time_index_message_record.marker_difference_central_spread = wire[at]; at = at + 1;
  real_time_index_message_record.dissemination_frequency_marker = wire[at]; at = at + 1;
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
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.source_seq_num[real_time_index_message_at] == real_time_index_message_written.source_seq_num[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.system_id[real_time_index_message_at] == real_time_index_message_written.system_id[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.index_level[real_time_index_message_at] == real_time_index_message_written.index_level[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
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
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.ind_index_opening_portfolio[real_time_index_message_at] == real_time_index_message_written.ind_index_opening_portfolio[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.percent_change_toi[real_time_index_message_at] == real_time_index_message_written.percent_change_toi[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.pct_change_index_val_prev_session[real_time_index_message_at] == real_time_index_message_written.pct_change_index_val_prev_session[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.pct_change_index_val_prev_year[real_time_index_message_at] == real_time_index_message_written.pct_change_index_val_prev_year[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.toi[real_time_index_message_at] == real_time_index_message_written.toi[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.point_change[real_time_index_message_at] == real_time_index_message_written.point_change[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> assert(real_time_index_message_read.value_trading[real_time_index_message_at] == real_time_index_message_written.value_trading[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.index_value_bid[real_time_index_message_at] == real_time_index_message_written.index_value_bid[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.index_value_ask[real_time_index_message_at] == real_time_index_message_written.index_value_ask[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.mid_spread_index[real_time_index_message_at] == real_time_index_message_written.mid_spread_index[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.difference_central_spread[real_time_index_message_at] == real_time_index_message_written.difference_central_spread[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.num_of_active_instruments[real_time_index_message_at] == real_time_index_message_written.num_of_active_instruments[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.num_of_instr_of_decreasing_qt[real_time_index_message_at] == real_time_index_message_written.num_of_instr_of_decreasing_qt[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.num_of_instr_of_increasing_qt[real_time_index_message_at] == real_time_index_message_written.num_of_instr_of_increasing_qt[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.num_of_instr_of_unchanged_qt[real_time_index_message_at] == real_time_index_message_written.num_of_instr_of_unchanged_qt[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.source_time_micro_secs[real_time_index_message_at] == real_time_index_message_written.source_time_micro_secs[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  assert(real_time_index_message_read.level_scale_code == real_time_index_message_written.level_scale_code);
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> assert(real_time_index_message_read.time_first_high[real_time_index_message_at] == real_time_index_message_written.time_first_high[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 6 -> assert(real_time_index_message_read.time_first_low[real_time_index_message_at] == real_time_index_message_written.time_first_low[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.index_status_indicator[real_time_index_message_at] == real_time_index_message_written.index_status_indicator[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  assert(real_time_index_message_read.index_level_code == real_time_index_message_written.index_level_code);
  assert(real_time_index_message_read.marker_percent_change_toi == real_time_index_message_written.marker_percent_change_toi);
  assert(real_time_index_message_read.marker_pct_chg_index_val_prev_sess == real_time_index_message_written.marker_pct_chg_index_val_prev_sess);
  assert(real_time_index_message_read.marker_pct_chg_index_val_prev_year == real_time_index_message_written.marker_pct_chg_index_val_prev_year);
  assert(real_time_index_message_read.marker_point_change == real_time_index_message_written.marker_point_change);
  assert(real_time_index_message_read.marker_difference_central_spread == real_time_index_message_written.marker_difference_central_spread);
  assert(real_time_index_message_read.dissemination_frequency_marker == real_time_index_message_written.dissemination_frequency_marker);
  skip
}

/* ---- Index Summary Message: 100 bytes ---------------------------------------- */

/* The index summary message provides a summary of the data calculated in a stock index for a given day */
typedef IndexSummaryMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte system_id[4];
  byte closing_index_value[4];
  byte ind_opening_portfolio[4];
  byte opening_index_value[4];
  byte session_high[4];
  byte session_low[4];
  byte pct_chg_high_index_val_prev_session[4];
  byte pct_chg_low_index_val_prev_session[4];
  byte pct_change_index_val_prev_session[4];
  byte pct_change_index_val_prev_year[4];
  byte capitalisation_portfolio[4];
  byte index_adjustment_coefficient[4];
  byte source_time_micro_secs[2];
  byte level_scale_code;
  byte capitalisation_scale_code;
  byte index_adjustment_scale_code;
  byte time_closing[6];
  byte time_opening[6];
  byte time_full_opening[6];
  byte time_high[6];
  byte time_low[6];
  byte marker_high;
  byte marker_low;
  byte marker_closing_prev_session;
  byte marker_closing_prev_year;
  byte reserved_1
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
  :: index_summary_message_at < 4 -> index_summary_message_record.source_seq_num[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.system_id[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.closing_index_value[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.ind_opening_portfolio[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.opening_index_value[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.session_high[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.session_low[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_chg_high_index_val_prev_session[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_chg_low_index_val_prev_session[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_change_index_val_prev_session[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_change_index_val_prev_year[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.capitalisation_portfolio[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.index_adjustment_coefficient[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> index_summary_message_record.source_time_micro_secs[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.level_scale_code = index_summary_message_value;
  index_summary_message_record.capitalisation_scale_code = index_summary_message_value;
  index_summary_message_record.index_adjustment_scale_code = index_summary_message_value;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_closing[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_opening[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_full_opening[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_high[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_low[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.marker_high = index_summary_message_value;
  index_summary_message_record.marker_low = index_summary_message_value;
  index_summary_message_record.marker_closing_prev_session = index_summary_message_value;
  index_summary_message_record.marker_closing_prev_year = index_summary_message_value;
  index_summary_message_record.reserved_1 = index_summary_message_value;
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
  :: index_summary_message_at < 4 -> index_summary_message_record.source_seq_num[index_summary_message_at] = (index_summary_message_base + 8 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.system_id[index_summary_message_at] = (index_summary_message_base + 12 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.closing_index_value[index_summary_message_at] = (index_summary_message_base + 16 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.ind_opening_portfolio[index_summary_message_at] = (index_summary_message_base + 20 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.opening_index_value[index_summary_message_at] = (index_summary_message_base + 24 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.session_high[index_summary_message_at] = (index_summary_message_base + 28 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.session_low[index_summary_message_at] = (index_summary_message_base + 32 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_chg_high_index_val_prev_session[index_summary_message_at] = (index_summary_message_base + 36 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_chg_low_index_val_prev_session[index_summary_message_at] = (index_summary_message_base + 40 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_change_index_val_prev_session[index_summary_message_at] = (index_summary_message_base + 44 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_change_index_val_prev_year[index_summary_message_at] = (index_summary_message_base + 48 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.capitalisation_portfolio[index_summary_message_at] = (index_summary_message_base + 52 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.index_adjustment_coefficient[index_summary_message_at] = (index_summary_message_base + 56 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> index_summary_message_record.source_time_micro_secs[index_summary_message_at] = (index_summary_message_base + 60 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.level_scale_code = (index_summary_message_base + 62 + 1) % 256;
  index_summary_message_record.capitalisation_scale_code = (index_summary_message_base + 63 + 1) % 256;
  index_summary_message_record.index_adjustment_scale_code = (index_summary_message_base + 64 + 1) % 256;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_closing[index_summary_message_at] = (index_summary_message_base + 65 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_opening[index_summary_message_at] = (index_summary_message_base + 71 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_full_opening[index_summary_message_at] = (index_summary_message_base + 77 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_high[index_summary_message_at] = (index_summary_message_base + 83 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_low[index_summary_message_at] = (index_summary_message_base + 89 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.marker_high = (index_summary_message_base + 95 + 1) % 256;
  index_summary_message_record.marker_low = (index_summary_message_base + 96 + 1) % 256;
  index_summary_message_record.marker_closing_prev_session = (index_summary_message_base + 97 + 1) % 256;
  index_summary_message_record.marker_closing_prev_year = (index_summary_message_base + 98 + 1) % 256;
  index_summary_message_record.reserved_1 = (index_summary_message_base + 99 + 1) % 256;
  skip
}

/* Index Summary Message to the wire, 100 bytes from where the cursor stands */
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
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.source_seq_num[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.system_id[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.closing_index_value[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.ind_opening_portfolio[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.opening_index_value[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.session_high[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.session_low[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.pct_chg_high_index_val_prev_session[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.pct_chg_low_index_val_prev_session[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.pct_change_index_val_prev_session[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.pct_change_index_val_prev_year[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.capitalisation_portfolio[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.index_adjustment_coefficient[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> wire[at] = index_summary_message_record.source_time_micro_secs[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = index_summary_message_record.level_scale_code; at = at + 1;
  wire[at] = index_summary_message_record.capitalisation_scale_code; at = at + 1;
  wire[at] = index_summary_message_record.index_adjustment_scale_code; at = at + 1;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> wire[at] = index_summary_message_record.time_closing[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> wire[at] = index_summary_message_record.time_opening[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> wire[at] = index_summary_message_record.time_full_opening[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> wire[at] = index_summary_message_record.time_high[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> wire[at] = index_summary_message_record.time_low[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = index_summary_message_record.marker_high; at = at + 1;
  wire[at] = index_summary_message_record.marker_low; at = at + 1;
  wire[at] = index_summary_message_record.marker_closing_prev_session; at = at + 1;
  wire[at] = index_summary_message_record.marker_closing_prev_year; at = at + 1;
  wire[at] = index_summary_message_record.reserved_1; at = at + 1;
  skip
}

/* Index Summary Message off the wire, 100 bytes from where the cursor stands */
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
  :: index_summary_message_at < 4 -> index_summary_message_record.source_seq_num[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.system_id[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.closing_index_value[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.ind_opening_portfolio[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.opening_index_value[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.session_high[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.session_low[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_chg_high_index_val_prev_session[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_chg_low_index_val_prev_session[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_change_index_val_prev_session[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.pct_change_index_val_prev_year[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.capitalisation_portfolio[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.index_adjustment_coefficient[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> index_summary_message_record.source_time_micro_secs[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.level_scale_code = wire[at]; at = at + 1;
  index_summary_message_record.capitalisation_scale_code = wire[at]; at = at + 1;
  index_summary_message_record.index_adjustment_scale_code = wire[at]; at = at + 1;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_closing[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_opening[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_full_opening[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_high[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> index_summary_message_record.time_low[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.marker_high = wire[at]; at = at + 1;
  index_summary_message_record.marker_low = wire[at]; at = at + 1;
  index_summary_message_record.marker_closing_prev_session = wire[at]; at = at + 1;
  index_summary_message_record.marker_closing_prev_year = wire[at]; at = at + 1;
  index_summary_message_record.reserved_1 = wire[at]; at = at + 1;
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
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.source_seq_num[index_summary_message_at] == index_summary_message_written.source_seq_num[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.system_id[index_summary_message_at] == index_summary_message_written.system_id[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.closing_index_value[index_summary_message_at] == index_summary_message_written.closing_index_value[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.ind_opening_portfolio[index_summary_message_at] == index_summary_message_written.ind_opening_portfolio[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.opening_index_value[index_summary_message_at] == index_summary_message_written.opening_index_value[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.session_high[index_summary_message_at] == index_summary_message_written.session_high[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.session_low[index_summary_message_at] == index_summary_message_written.session_low[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.pct_chg_high_index_val_prev_session[index_summary_message_at] == index_summary_message_written.pct_chg_high_index_val_prev_session[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.pct_chg_low_index_val_prev_session[index_summary_message_at] == index_summary_message_written.pct_chg_low_index_val_prev_session[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.pct_change_index_val_prev_session[index_summary_message_at] == index_summary_message_written.pct_change_index_val_prev_session[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.pct_change_index_val_prev_year[index_summary_message_at] == index_summary_message_written.pct_change_index_val_prev_year[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.capitalisation_portfolio[index_summary_message_at] == index_summary_message_written.capitalisation_portfolio[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.index_adjustment_coefficient[index_summary_message_at] == index_summary_message_written.index_adjustment_coefficient[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 2 -> assert(index_summary_message_read.source_time_micro_secs[index_summary_message_at] == index_summary_message_written.source_time_micro_secs[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  assert(index_summary_message_read.level_scale_code == index_summary_message_written.level_scale_code);
  assert(index_summary_message_read.capitalisation_scale_code == index_summary_message_written.capitalisation_scale_code);
  assert(index_summary_message_read.index_adjustment_scale_code == index_summary_message_written.index_adjustment_scale_code);
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> assert(index_summary_message_read.time_closing[index_summary_message_at] == index_summary_message_written.time_closing[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> assert(index_summary_message_read.time_opening[index_summary_message_at] == index_summary_message_written.time_opening[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> assert(index_summary_message_read.time_full_opening[index_summary_message_at] == index_summary_message_written.time_full_opening[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> assert(index_summary_message_read.time_high[index_summary_message_at] == index_summary_message_written.time_high[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 6 -> assert(index_summary_message_read.time_low[index_summary_message_at] == index_summary_message_written.time_low[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  assert(index_summary_message_read.marker_high == index_summary_message_written.marker_high);
  assert(index_summary_message_read.marker_low == index_summary_message_written.marker_low);
  assert(index_summary_message_read.marker_closing_prev_session == index_summary_message_written.marker_closing_prev_session);
  assert(index_summary_message_read.marker_closing_prev_year == index_summary_message_written.marker_closing_prev_year);
  assert(index_summary_message_read.reserved_1 == index_summary_message_written.reserved_1);
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
    assert(at == 108);
    at = 0;
    decode_real_time_index_message(real_time_index_message_got);
    assert(at == 108);
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
    assert(at == 100);
    at = 0;
    decode_index_summary_message(index_summary_message_got);
    assert(at == 100);
    equal_index_summary_message(index_summary_message_got, index_summary_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_real_time_index_message()
  :: run check_index_summary_message()
  fi
}
