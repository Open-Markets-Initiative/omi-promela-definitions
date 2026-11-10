/*
 * Hong Kong Exchanges and Clearing Orion Market Data Cash Index Refresh
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
#define WIRE 108

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* Omd packet header (no payload compression; byte 3 is Filler) */
typedef PacketHeader {
  byte pkt_size[2];
  byte msg_count;
  byte filler;
  byte seq_num[4];
  byte send_time[8]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = packet_header_value;
  packet_header_record.filler = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.filler = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.pkt_size[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.msg_count; at = at + 1;
  wire[at] = packet_header_record.filler; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.seq_num[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.send_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = wire[at]; at = at + 1;
  packet_header_record.filler = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.pkt_size[packet_header_at] == packet_header_written.pkt_size[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.msg_count == packet_header_written.msg_count);
  assert(packet_header_read.filler == packet_header_written.filler);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.seq_num[packet_header_at] == packet_header_written.seq_num[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.send_time[packet_header_at] == packet_header_written.send_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Msg Header: 4 bytes ----------------------------------------------------- */

/* Omd message header */
typedef MsgHeader {
  byte msg_size[2];
  byte msg_type[2]
};

int msg_header_at;

/* every byte of Msg Header set to one value */
inline fill_msg_header(msg_header_record, msg_header_value) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Msg Header set to where it lies, so a field read out of place says so */
inline ramp_msg_header(msg_header_record, msg_header_base) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = (msg_header_base + 0 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = (msg_header_base + 2 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header to the wire, 4 bytes from where the cursor stands */
inline encode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_size[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_type[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header off the wire, 4 bytes from where the cursor stands */
inline decode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Msg Header is what was written, byte for byte */
inline equal_msg_header(msg_header_read, msg_header_written) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_size[msg_header_at] == msg_header_written.msg_size[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_type[msg_header_at] == msg_header_written.msg_type[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Definition Message: 16 bytes -------------------------------------- */

/* The Index Definition message contains the static referential data for the given index and is generated at the start of the business day. May be re-disseminated during trading hours. */
typedef IndexDefinitionMessage {
  byte index_code[11];
  byte index_source;
  byte currency_code[3];
  byte filler_1
};

int index_definition_message_at;

/* every byte of Index Definition Message set to one value */
inline fill_index_definition_message(index_definition_message_record, index_definition_message_value) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> index_definition_message_record.index_code[index_definition_message_at] = index_definition_message_value; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.index_source = index_definition_message_value;
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> index_definition_message_record.currency_code[index_definition_message_at] = index_definition_message_value; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.filler_1 = index_definition_message_value;
  skip
}

/* each byte of Index Definition Message set to where it lies, so a field read out of place says so */
inline ramp_index_definition_message(index_definition_message_record, index_definition_message_base) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> index_definition_message_record.index_code[index_definition_message_at] = (index_definition_message_base + 0 + index_definition_message_at + 1) % 256; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.index_source = (index_definition_message_base + 11 + 1) % 256;
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> index_definition_message_record.currency_code[index_definition_message_at] = (index_definition_message_base + 12 + index_definition_message_at + 1) % 256; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.filler_1 = (index_definition_message_base + 15 + 1) % 256;
  skip
}

/* Index Definition Message to the wire, 16 bytes from where the cursor stands */
inline encode_index_definition_message(index_definition_message_record) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> wire[at] = index_definition_message_record.index_code[index_definition_message_at]; at = at + 1; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = index_definition_message_record.index_source; at = at + 1;
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> wire[at] = index_definition_message_record.currency_code[index_definition_message_at]; at = at + 1; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = index_definition_message_record.filler_1; at = at + 1;
  skip
}

/* Index Definition Message off the wire, 16 bytes from where the cursor stands */
inline decode_index_definition_message(index_definition_message_record) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> index_definition_message_record.index_code[index_definition_message_at] = wire[at]; at = at + 1; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.index_source = wire[at]; at = at + 1;
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> index_definition_message_record.currency_code[index_definition_message_at] = wire[at]; at = at + 1; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Index Definition Message is what was written, byte for byte */
inline equal_index_definition_message(index_definition_message_read, index_definition_message_written) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> assert(index_definition_message_read.index_code[index_definition_message_at] == index_definition_message_written.index_code[index_definition_message_at]); index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  assert(index_definition_message_read.index_source == index_definition_message_written.index_source);
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> assert(index_definition_message_read.currency_code[index_definition_message_at] == index_definition_message_written.currency_code[index_definition_message_at]); index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  assert(index_definition_message_read.filler_1 == index_definition_message_written.filler_1);
  skip
}

/* ---- Index Data Message: 108 bytes ------------------------------------------- */

/* The Index Data message contains all the real-time data for a given index. Fields may be populated with null values to indicate when an update is not provided. */
typedef IndexDataMessage {
  byte index_code[11];
  byte index_status;
  byte index_time[8];
  byte index_value[8];
  byte net_chg_prev_day[8];
  byte high_value[8];
  byte low_value[8];
  byte eas_value[8];
  byte index_turnover[8];
  byte opening_value[8];
  byte closing_value[8];
  byte previous_ses_close[8];
  byte index_volume[8];
  byte net_chg_prev_day_pct[4];
  byte exception;
  byte filler_3[3]
};

int index_data_message_at;

/* every byte of Index Data Message set to one value */
inline fill_index_data_message(index_data_message_record, index_data_message_value) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> index_data_message_record.index_code[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.index_status = index_data_message_value;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_time[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.net_chg_prev_day[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.high_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.low_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.eas_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_turnover[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.opening_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.closing_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.previous_ses_close[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_volume[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> index_data_message_record.net_chg_prev_day_pct[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.exception = index_data_message_value;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> index_data_message_record.filler_3[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Data Message set to where it lies, so a field read out of place says so */
inline ramp_index_data_message(index_data_message_record, index_data_message_base) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> index_data_message_record.index_code[index_data_message_at] = (index_data_message_base + 0 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.index_status = (index_data_message_base + 11 + 1) % 256;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_time[index_data_message_at] = (index_data_message_base + 12 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_value[index_data_message_at] = (index_data_message_base + 20 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.net_chg_prev_day[index_data_message_at] = (index_data_message_base + 28 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.high_value[index_data_message_at] = (index_data_message_base + 36 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.low_value[index_data_message_at] = (index_data_message_base + 44 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.eas_value[index_data_message_at] = (index_data_message_base + 52 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_turnover[index_data_message_at] = (index_data_message_base + 60 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.opening_value[index_data_message_at] = (index_data_message_base + 68 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.closing_value[index_data_message_at] = (index_data_message_base + 76 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.previous_ses_close[index_data_message_at] = (index_data_message_base + 84 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_volume[index_data_message_at] = (index_data_message_base + 92 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> index_data_message_record.net_chg_prev_day_pct[index_data_message_at] = (index_data_message_base + 100 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.exception = (index_data_message_base + 104 + 1) % 256;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> index_data_message_record.filler_3[index_data_message_at] = (index_data_message_base + 105 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Data Message to the wire, 108 bytes from where the cursor stands */
inline encode_index_data_message(index_data_message_record) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> wire[at] = index_data_message_record.index_code[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  wire[at] = index_data_message_record.index_status; at = at + 1;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.index_time[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.index_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.net_chg_prev_day[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.high_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.low_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.eas_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.index_turnover[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.opening_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.closing_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.previous_ses_close[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.index_volume[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> wire[at] = index_data_message_record.net_chg_prev_day_pct[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  wire[at] = index_data_message_record.exception; at = at + 1;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> wire[at] = index_data_message_record.filler_3[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Data Message off the wire, 108 bytes from where the cursor stands */
inline decode_index_data_message(index_data_message_record) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> index_data_message_record.index_code[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.index_status = wire[at]; at = at + 1;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_time[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.net_chg_prev_day[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.high_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.low_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.eas_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_turnover[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.opening_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.closing_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.previous_ses_close[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_volume[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> index_data_message_record.net_chg_prev_day_pct[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.exception = wire[at]; at = at + 1;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> index_data_message_record.filler_3[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Data Message is what was written, byte for byte */
inline equal_index_data_message(index_data_message_read, index_data_message_written) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> assert(index_data_message_read.index_code[index_data_message_at] == index_data_message_written.index_code[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  assert(index_data_message_read.index_status == index_data_message_written.index_status);
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.index_time[index_data_message_at] == index_data_message_written.index_time[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.index_value[index_data_message_at] == index_data_message_written.index_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.net_chg_prev_day[index_data_message_at] == index_data_message_written.net_chg_prev_day[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.high_value[index_data_message_at] == index_data_message_written.high_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.low_value[index_data_message_at] == index_data_message_written.low_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.eas_value[index_data_message_at] == index_data_message_written.eas_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.index_turnover[index_data_message_at] == index_data_message_written.index_turnover[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.opening_value[index_data_message_at] == index_data_message_written.opening_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.closing_value[index_data_message_at] == index_data_message_written.closing_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.previous_ses_close[index_data_message_at] == index_data_message_written.previous_ses_close[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.index_volume[index_data_message_at] == index_data_message_written.index_volume[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> assert(index_data_message_read.net_chg_prev_day_pct[index_data_message_at] == index_data_message_written.net_chg_prev_day_pct[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  assert(index_data_message_read.exception == index_data_message_written.exception);
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> assert(index_data_message_read.filler_3[index_data_message_at] == index_data_message_written.filler_3[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Complete Message: 4 bytes --------------------------------------- */

/* This message is published to mark the end of a refresh. */
typedef RefreshCompleteMessage {
  byte last_seq_num[4]
};

int refresh_complete_message_at;

/* every byte of Refresh Complete Message set to one value */
inline fill_refresh_complete_message(refresh_complete_message_record, refresh_complete_message_value) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = refresh_complete_message_value; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Complete Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_complete_message(refresh_complete_message_record, refresh_complete_message_base) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = (refresh_complete_message_base + 0 + refresh_complete_message_at + 1) % 256; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete Message to the wire, 4 bytes from where the cursor stands */
inline encode_refresh_complete_message(refresh_complete_message_record) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> wire[at] = refresh_complete_message_record.last_seq_num[refresh_complete_message_at]; at = at + 1; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete Message off the wire, 4 bytes from where the cursor stands */
inline decode_refresh_complete_message(refresh_complete_message_record) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = wire[at]; at = at + 1; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Complete Message is what was written, byte for byte */
inline equal_refresh_complete_message(refresh_complete_message_read, refresh_complete_message_written) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> assert(refresh_complete_message_read.last_seq_num[refresh_complete_message_at] == refresh_complete_message_written.last_seq_num[refresh_complete_message_at]); refresh_complete_message_at = refresh_complete_message_at + 1
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

/* Msg Header: encoded, read back, and compared */
proctype check_msg_header() {
  MsgHeader msg_header_sent;
  MsgHeader msg_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_msg_header(msg_header_sent, 0)
  :: pattern == 1 -> fill_msg_header(msg_header_sent, 32)
  :: pattern == 2 -> fill_msg_header(msg_header_sent, 255)
  :: else -> ramp_msg_header(msg_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_msg_header(msg_header_sent);
    assert(at == 4);
    at = 0;
    decode_msg_header(msg_header_got);
    assert(at == 4);
    equal_msg_header(msg_header_got, msg_header_sent)
  }
}

/* Index Definition Message: encoded, read back, and compared */
proctype check_index_definition_message() {
  IndexDefinitionMessage index_definition_message_sent;
  IndexDefinitionMessage index_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_definition_message(index_definition_message_sent, 0)
  :: pattern == 1 -> fill_index_definition_message(index_definition_message_sent, 32)
  :: pattern == 2 -> fill_index_definition_message(index_definition_message_sent, 255)
  :: else -> ramp_index_definition_message(index_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_definition_message(index_definition_message_sent);
    assert(at == 16);
    at = 0;
    decode_index_definition_message(index_definition_message_got);
    assert(at == 16);
    equal_index_definition_message(index_definition_message_got, index_definition_message_sent)
  }
}

/* Index Data Message: encoded, read back, and compared */
proctype check_index_data_message() {
  IndexDataMessage index_data_message_sent;
  IndexDataMessage index_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_data_message(index_data_message_sent, 0)
  :: pattern == 1 -> fill_index_data_message(index_data_message_sent, 32)
  :: pattern == 2 -> fill_index_data_message(index_data_message_sent, 255)
  :: else -> ramp_index_data_message(index_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_data_message(index_data_message_sent);
    assert(at == 108);
    at = 0;
    decode_index_data_message(index_data_message_got);
    assert(at == 108);
    equal_index_data_message(index_data_message_got, index_data_message_sent)
  }
}

/* Refresh Complete Message: encoded, read back, and compared */
proctype check_refresh_complete_message() {
  RefreshCompleteMessage refresh_complete_message_sent;
  RefreshCompleteMessage refresh_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_complete_message(refresh_complete_message_sent, 0)
  :: pattern == 1 -> fill_refresh_complete_message(refresh_complete_message_sent, 32)
  :: pattern == 2 -> fill_refresh_complete_message(refresh_complete_message_sent, 255)
  :: else -> ramp_refresh_complete_message(refresh_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_complete_message(refresh_complete_message_sent);
    assert(at == 4);
    at = 0;
    decode_refresh_complete_message(refresh_complete_message_got);
    assert(at == 4);
    equal_refresh_complete_message(refresh_complete_message_got, refresh_complete_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_msg_header()
  :: run check_index_definition_message()
  :: run check_index_data_message()
  :: run check_refresh_complete_message()
  fi
}
