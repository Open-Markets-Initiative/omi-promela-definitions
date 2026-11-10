/*
 * BSE Limited Enhanced Order Book Interface
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 72

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Eobi Header: 8 bytes ---------------------------------------------------- */

/* Body Len, Template Id, and Msg Seq Num opening the Packet Header */
typedef EobiHeader {
  byte body_len[2];
  byte template_id[2];
  byte msg_seq_num[4]
};

int eobi_header_at;

/* every byte of Eobi Header set to one value */
inline fill_eobi_header(eobi_header_record, eobi_header_value) {
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> eobi_header_record.body_len[eobi_header_at] = eobi_header_value; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> eobi_header_record.template_id[eobi_header_at] = eobi_header_value; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 4 -> eobi_header_record.msg_seq_num[eobi_header_at] = eobi_header_value; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eobi Header set to where it lies, so a field read out of place says so */
inline ramp_eobi_header(eobi_header_record, eobi_header_base) {
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> eobi_header_record.body_len[eobi_header_at] = (eobi_header_base + 0 + eobi_header_at + 1) % 256; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> eobi_header_record.template_id[eobi_header_at] = (eobi_header_base + 2 + eobi_header_at + 1) % 256; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 4 -> eobi_header_record.msg_seq_num[eobi_header_at] = (eobi_header_base + 4 + eobi_header_at + 1) % 256; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  skip
}

/* Eobi Header to the wire, 8 bytes from where the cursor stands */
inline encode_eobi_header(eobi_header_record) {
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> wire[at] = eobi_header_record.body_len[eobi_header_at]; at = at + 1; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> wire[at] = eobi_header_record.template_id[eobi_header_at]; at = at + 1; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 4 -> wire[at] = eobi_header_record.msg_seq_num[eobi_header_at]; at = at + 1; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  skip
}

/* Eobi Header off the wire, 8 bytes from where the cursor stands */
inline decode_eobi_header(eobi_header_record) {
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> eobi_header_record.body_len[eobi_header_at] = wire[at]; at = at + 1; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> eobi_header_record.template_id[eobi_header_at] = wire[at]; at = at + 1; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 4 -> eobi_header_record.msg_seq_num[eobi_header_at] = wire[at]; at = at + 1; eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eobi Header is what was written, byte for byte */
inline equal_eobi_header(eobi_header_read, eobi_header_written) {
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> assert(eobi_header_read.body_len[eobi_header_at] == eobi_header_written.body_len[eobi_header_at]); eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 2 -> assert(eobi_header_read.template_id[eobi_header_at] == eobi_header_written.template_id[eobi_header_at]); eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  eobi_header_at = 0;
  do
  :: eobi_header_at < 4 -> assert(eobi_header_read.msg_seq_num[eobi_header_at] == eobi_header_written.msg_seq_num[eobi_header_at]); eobi_header_at = eobi_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Packet Header: 32 bytes ------------------------------------------------- */

/* Technical header delivered in every Udp datagram, identifying the product, the partition, and the send time */
typedef PacketHeader {
  EobiHeader eobi_header;
  byte appl_seq_num[4];
  byte market_segment_id[4];
  byte partition_id;
  byte completion_indicator;
  byte appl_seq_reset_indicator;
  byte pad_5[5];
  byte transact_time[8]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  fill_eobi_header(packet_header_record.eobi_header, packet_header_value);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.appl_seq_num[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.market_segment_id[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.partition_id = packet_header_value;
  packet_header_record.completion_indicator = packet_header_value;
  packet_header_record.appl_seq_reset_indicator = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 5 -> packet_header_record.pad_5[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.transact_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  ramp_eobi_header(packet_header_record.eobi_header, packet_header_base + 0);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.appl_seq_num[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.market_segment_id[packet_header_at] = (packet_header_base + 12 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.partition_id = (packet_header_base + 16 + 1) % 256;
  packet_header_record.completion_indicator = (packet_header_base + 17 + 1) % 256;
  packet_header_record.appl_seq_reset_indicator = (packet_header_base + 18 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 5 -> packet_header_record.pad_5[packet_header_at] = (packet_header_base + 19 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.transact_time[packet_header_at] = (packet_header_base + 24 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 32 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  encode_eobi_header(packet_header_record.eobi_header);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.appl_seq_num[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.market_segment_id[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.partition_id; at = at + 1;
  wire[at] = packet_header_record.completion_indicator; at = at + 1;
  wire[at] = packet_header_record.appl_seq_reset_indicator; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 5 -> wire[at] = packet_header_record.pad_5[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.transact_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 32 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  decode_eobi_header(packet_header_record.eobi_header);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.appl_seq_num[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.market_segment_id[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.partition_id = wire[at]; at = at + 1;
  packet_header_record.completion_indicator = wire[at]; at = at + 1;
  packet_header_record.appl_seq_reset_indicator = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 5 -> packet_header_record.pad_5[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.transact_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  equal_eobi_header(packet_header_read.eobi_header, packet_header_written.eobi_header);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.appl_seq_num[packet_header_at] == packet_header_written.appl_seq_num[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.market_segment_id[packet_header_at] == packet_header_written.market_segment_id[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.partition_id == packet_header_written.partition_id);
  assert(packet_header_read.completion_indicator == packet_header_written.completion_indicator);
  assert(packet_header_read.appl_seq_reset_indicator == packet_header_written.appl_seq_reset_indicator);
  packet_header_at = 0;
  do
  :: packet_header_at < 5 -> assert(packet_header_read.pad_5[packet_header_at] == packet_header_written.pad_5[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.transact_time[packet_header_at] == packet_header_written.transact_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* Body Len, Template Id, and Msg Seq Num opening every message behind the Packet Header */
typedef MessageHeader {
  byte body_len[2];
  byte template_id[2];
  byte msg_seq_num[4]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.body_len[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.body_len[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 8 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.body_len[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.template_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.msg_seq_num[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 8 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.body_len[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.body_len[message_header_at] == message_header_written.body_len[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.template_id[message_header_at] == message_header_written.template_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.msg_seq_num[message_header_at] == message_header_written.msg_seq_num[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat Message: 8 bytes ---------------------------------------------- */

/* Published regularly when there is no activity on the snapshot or the incremental channel. */
typedef HeartbeatMessage {
  byte last_msg_seq_num_processed[4];
  byte pad_4[4]
};

int heartbeat_message_at;

/* every byte of Heartbeat Message set to one value */
inline fill_heartbeat_message(heartbeat_message_record, heartbeat_message_value) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.last_msg_seq_num_processed[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.pad_4[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_message(heartbeat_message_record, heartbeat_message_base) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.last_msg_seq_num_processed[heartbeat_message_at] = (heartbeat_message_base + 0 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.pad_4[heartbeat_message_at] = (heartbeat_message_base + 4 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message to the wire, 8 bytes from where the cursor stands */
inline encode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> wire[at] = heartbeat_message_record.last_msg_seq_num_processed[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> wire[at] = heartbeat_message_record.pad_4[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message off the wire, 8 bytes from where the cursor stands */
inline decode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.last_msg_seq_num_processed[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.pad_4[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Message is what was written, byte for byte */
inline equal_heartbeat_message(heartbeat_message_read, heartbeat_message_written) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> assert(heartbeat_message_read.last_msg_seq_num_processed[heartbeat_message_at] == heartbeat_message_written.last_msg_seq_num_processed[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> assert(heartbeat_message_read.pad_4[heartbeat_message_at] == heartbeat_message_written.pad_4[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Product Summary Message: 8 bytes ---------------------------------------- */

/* Published once each snapshot cycle, carrying attributes that are equal for all instruments in the product. */
typedef ProductSummaryMessage {
  byte last_msg_seq_num_processed[4];
  byte trading_session_id;
  byte trading_session_sub_id;
  byte trad_ses_status;
  byte fast_market_indicator
};

int product_summary_message_at;

/* every byte of Product Summary Message set to one value */
inline fill_product_summary_message(product_summary_message_record, product_summary_message_value) {
  product_summary_message_at = 0;
  do
  :: product_summary_message_at < 4 -> product_summary_message_record.last_msg_seq_num_processed[product_summary_message_at] = product_summary_message_value; product_summary_message_at = product_summary_message_at + 1
  :: else -> break
  od;
  product_summary_message_record.trading_session_id = product_summary_message_value;
  product_summary_message_record.trading_session_sub_id = product_summary_message_value;
  product_summary_message_record.trad_ses_status = product_summary_message_value;
  product_summary_message_record.fast_market_indicator = product_summary_message_value;
  skip
}

/* each byte of Product Summary Message set to where it lies, so a field read out of place says so */
inline ramp_product_summary_message(product_summary_message_record, product_summary_message_base) {
  product_summary_message_at = 0;
  do
  :: product_summary_message_at < 4 -> product_summary_message_record.last_msg_seq_num_processed[product_summary_message_at] = (product_summary_message_base + 0 + product_summary_message_at + 1) % 256; product_summary_message_at = product_summary_message_at + 1
  :: else -> break
  od;
  product_summary_message_record.trading_session_id = (product_summary_message_base + 4 + 1) % 256;
  product_summary_message_record.trading_session_sub_id = (product_summary_message_base + 5 + 1) % 256;
  product_summary_message_record.trad_ses_status = (product_summary_message_base + 6 + 1) % 256;
  product_summary_message_record.fast_market_indicator = (product_summary_message_base + 7 + 1) % 256;
  skip
}

/* Product Summary Message to the wire, 8 bytes from where the cursor stands */
inline encode_product_summary_message(product_summary_message_record) {
  product_summary_message_at = 0;
  do
  :: product_summary_message_at < 4 -> wire[at] = product_summary_message_record.last_msg_seq_num_processed[product_summary_message_at]; at = at + 1; product_summary_message_at = product_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = product_summary_message_record.trading_session_id; at = at + 1;
  wire[at] = product_summary_message_record.trading_session_sub_id; at = at + 1;
  wire[at] = product_summary_message_record.trad_ses_status; at = at + 1;
  wire[at] = product_summary_message_record.fast_market_indicator; at = at + 1;
  skip
}

/* Product Summary Message off the wire, 8 bytes from where the cursor stands */
inline decode_product_summary_message(product_summary_message_record) {
  product_summary_message_at = 0;
  do
  :: product_summary_message_at < 4 -> product_summary_message_record.last_msg_seq_num_processed[product_summary_message_at] = wire[at]; at = at + 1; product_summary_message_at = product_summary_message_at + 1
  :: else -> break
  od;
  product_summary_message_record.trading_session_id = wire[at]; at = at + 1;
  product_summary_message_record.trading_session_sub_id = wire[at]; at = at + 1;
  product_summary_message_record.trad_ses_status = wire[at]; at = at + 1;
  product_summary_message_record.fast_market_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Product Summary Message is what was written, byte for byte */
inline equal_product_summary_message(product_summary_message_read, product_summary_message_written) {
  product_summary_message_at = 0;
  do
  :: product_summary_message_at < 4 -> assert(product_summary_message_read.last_msg_seq_num_processed[product_summary_message_at] == product_summary_message_written.last_msg_seq_num_processed[product_summary_message_at]); product_summary_message_at = product_summary_message_at + 1
  :: else -> break
  od;
  assert(product_summary_message_read.trading_session_id == product_summary_message_written.trading_session_id);
  assert(product_summary_message_read.trading_session_sub_id == product_summary_message_written.trading_session_sub_id);
  assert(product_summary_message_read.trad_ses_status == product_summary_message_written.trad_ses_status);
  assert(product_summary_message_read.fast_market_indicator == product_summary_message_written.fast_market_indicator);
  skip
}

/* ---- Order Details: 32 bytes ------------------------------------------------- */

/* OrderDetails */
typedef OrderDetails {
  byte trd_reg_ts_time_priority[8];
  byte display_qty[8];
  byte side;
  byte pad_7[7];
  byte price[8]
};

int order_details_at;

/* every byte of Order Details set to one value */
inline fill_order_details(order_details_record, order_details_value) {
  order_details_at = 0;
  do
  :: order_details_at < 8 -> order_details_record.trd_reg_ts_time_priority[order_details_at] = order_details_value; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> order_details_record.display_qty[order_details_at] = order_details_value; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_record.side = order_details_value;
  order_details_at = 0;
  do
  :: order_details_at < 7 -> order_details_record.pad_7[order_details_at] = order_details_value; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> order_details_record.price[order_details_at] = order_details_value; order_details_at = order_details_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Details set to where it lies, so a field read out of place says so */
inline ramp_order_details(order_details_record, order_details_base) {
  order_details_at = 0;
  do
  :: order_details_at < 8 -> order_details_record.trd_reg_ts_time_priority[order_details_at] = (order_details_base + 0 + order_details_at + 1) % 256; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> order_details_record.display_qty[order_details_at] = (order_details_base + 8 + order_details_at + 1) % 256; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_record.side = (order_details_base + 16 + 1) % 256;
  order_details_at = 0;
  do
  :: order_details_at < 7 -> order_details_record.pad_7[order_details_at] = (order_details_base + 17 + order_details_at + 1) % 256; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> order_details_record.price[order_details_at] = (order_details_base + 24 + order_details_at + 1) % 256; order_details_at = order_details_at + 1
  :: else -> break
  od;
  skip
}

/* Order Details to the wire, 32 bytes from where the cursor stands */
inline encode_order_details(order_details_record) {
  order_details_at = 0;
  do
  :: order_details_at < 8 -> wire[at] = order_details_record.trd_reg_ts_time_priority[order_details_at]; at = at + 1; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> wire[at] = order_details_record.display_qty[order_details_at]; at = at + 1; order_details_at = order_details_at + 1
  :: else -> break
  od;
  wire[at] = order_details_record.side; at = at + 1;
  order_details_at = 0;
  do
  :: order_details_at < 7 -> wire[at] = order_details_record.pad_7[order_details_at]; at = at + 1; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> wire[at] = order_details_record.price[order_details_at]; at = at + 1; order_details_at = order_details_at + 1
  :: else -> break
  od;
  skip
}

/* Order Details off the wire, 32 bytes from where the cursor stands */
inline decode_order_details(order_details_record) {
  order_details_at = 0;
  do
  :: order_details_at < 8 -> order_details_record.trd_reg_ts_time_priority[order_details_at] = wire[at]; at = at + 1; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> order_details_record.display_qty[order_details_at] = wire[at]; at = at + 1; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_record.side = wire[at]; at = at + 1;
  order_details_at = 0;
  do
  :: order_details_at < 7 -> order_details_record.pad_7[order_details_at] = wire[at]; at = at + 1; order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> order_details_record.price[order_details_at] = wire[at]; at = at + 1; order_details_at = order_details_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Details is what was written, byte for byte */
inline equal_order_details(order_details_read, order_details_written) {
  order_details_at = 0;
  do
  :: order_details_at < 8 -> assert(order_details_read.trd_reg_ts_time_priority[order_details_at] == order_details_written.trd_reg_ts_time_priority[order_details_at]); order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> assert(order_details_read.display_qty[order_details_at] == order_details_written.display_qty[order_details_at]); order_details_at = order_details_at + 1
  :: else -> break
  od;
  assert(order_details_read.side == order_details_written.side);
  order_details_at = 0;
  do
  :: order_details_at < 7 -> assert(order_details_read.pad_7[order_details_at] == order_details_written.pad_7[order_details_at]); order_details_at = order_details_at + 1
  :: else -> break
  od;
  order_details_at = 0;
  do
  :: order_details_at < 8 -> assert(order_details_read.price[order_details_at] == order_details_written.price[order_details_at]); order_details_at = order_details_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Order Message: 32 bytes ---------------------------------------- */

/* Represents each individual order or quote in a snapshot cycle on the snapshot channel. */
typedef SnapshotOrderMessage {
  OrderDetails order_details
};

/* every byte of Snapshot Order Message set to one value */
inline fill_snapshot_order_message(snapshot_order_message_record, snapshot_order_message_value) {
  fill_order_details(snapshot_order_message_record.order_details, snapshot_order_message_value);
  skip
}

/* each byte of Snapshot Order Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_order_message(snapshot_order_message_record, snapshot_order_message_base) {
  ramp_order_details(snapshot_order_message_record.order_details, snapshot_order_message_base + 0);
  skip
}

/* Snapshot Order Message to the wire, 32 bytes from where the cursor stands */
inline encode_snapshot_order_message(snapshot_order_message_record) {
  encode_order_details(snapshot_order_message_record.order_details);
  skip
}

/* Snapshot Order Message off the wire, 32 bytes from where the cursor stands */
inline decode_snapshot_order_message(snapshot_order_message_record) {
  decode_order_details(snapshot_order_message_record.order_details);
  skip
}

/* what was read of Snapshot Order Message is what was written, byte for byte */
inline equal_snapshot_order_message(snapshot_order_message_read, snapshot_order_message_written) {
  equal_order_details(snapshot_order_message_read.order_details, snapshot_order_message_written.order_details);
  skip
}

/* ---- Auction Best Bid Offer Message: 32 bytes -------------------------------- */

/* Carries the best bid and offer of a non crossed order book during an auction call phase. */
typedef AuctionBestBidOfferMessage {
  byte transact_time[8];
  byte security_id[8];
  byte bid_px[8];
  byte offer_px[8]
};

int auction_best_bid_offer_message_at;

/* every byte of Auction Best Bid Offer Message set to one value */
inline fill_auction_best_bid_offer_message(auction_best_bid_offer_message_record, auction_best_bid_offer_message_value) {
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.transact_time[auction_best_bid_offer_message_at] = auction_best_bid_offer_message_value; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.security_id[auction_best_bid_offer_message_at] = auction_best_bid_offer_message_value; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.bid_px[auction_best_bid_offer_message_at] = auction_best_bid_offer_message_value; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.offer_px[auction_best_bid_offer_message_at] = auction_best_bid_offer_message_value; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Best Bid Offer Message set to where it lies, so a field read out of place says so */
inline ramp_auction_best_bid_offer_message(auction_best_bid_offer_message_record, auction_best_bid_offer_message_base) {
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.transact_time[auction_best_bid_offer_message_at] = (auction_best_bid_offer_message_base + 0 + auction_best_bid_offer_message_at + 1) % 256; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.security_id[auction_best_bid_offer_message_at] = (auction_best_bid_offer_message_base + 8 + auction_best_bid_offer_message_at + 1) % 256; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.bid_px[auction_best_bid_offer_message_at] = (auction_best_bid_offer_message_base + 16 + auction_best_bid_offer_message_at + 1) % 256; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.offer_px[auction_best_bid_offer_message_at] = (auction_best_bid_offer_message_base + 24 + auction_best_bid_offer_message_at + 1) % 256; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Best Bid Offer Message to the wire, 32 bytes from where the cursor stands */
inline encode_auction_best_bid_offer_message(auction_best_bid_offer_message_record) {
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> wire[at] = auction_best_bid_offer_message_record.transact_time[auction_best_bid_offer_message_at]; at = at + 1; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> wire[at] = auction_best_bid_offer_message_record.security_id[auction_best_bid_offer_message_at]; at = at + 1; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> wire[at] = auction_best_bid_offer_message_record.bid_px[auction_best_bid_offer_message_at]; at = at + 1; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> wire[at] = auction_best_bid_offer_message_record.offer_px[auction_best_bid_offer_message_at]; at = at + 1; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Best Bid Offer Message off the wire, 32 bytes from where the cursor stands */
inline decode_auction_best_bid_offer_message(auction_best_bid_offer_message_record) {
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.transact_time[auction_best_bid_offer_message_at] = wire[at]; at = at + 1; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.security_id[auction_best_bid_offer_message_at] = wire[at]; at = at + 1; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.bid_px[auction_best_bid_offer_message_at] = wire[at]; at = at + 1; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> auction_best_bid_offer_message_record.offer_px[auction_best_bid_offer_message_at] = wire[at]; at = at + 1; auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Best Bid Offer Message is what was written, byte for byte */
inline equal_auction_best_bid_offer_message(auction_best_bid_offer_message_read, auction_best_bid_offer_message_written) {
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> assert(auction_best_bid_offer_message_read.transact_time[auction_best_bid_offer_message_at] == auction_best_bid_offer_message_written.transact_time[auction_best_bid_offer_message_at]); auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> assert(auction_best_bid_offer_message_read.security_id[auction_best_bid_offer_message_at] == auction_best_bid_offer_message_written.security_id[auction_best_bid_offer_message_at]); auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> assert(auction_best_bid_offer_message_read.bid_px[auction_best_bid_offer_message_at] == auction_best_bid_offer_message_written.bid_px[auction_best_bid_offer_message_at]); auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  auction_best_bid_offer_message_at = 0;
  do
  :: auction_best_bid_offer_message_at < 8 -> assert(auction_best_bid_offer_message_read.offer_px[auction_best_bid_offer_message_at] == auction_best_bid_offer_message_written.offer_px[auction_best_bid_offer_message_at]); auction_best_bid_offer_message_at = auction_best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Clearing Price Message: 32 bytes -------------------------------- */

/* Published for a crossed order book in an auction, indicating the potential auction price. */
typedef AuctionClearingPriceMessage {
  byte transact_time[8];
  byte security_id[8];
  byte last_px[8];
  byte last_qty[8]
};

int auction_clearing_price_message_at;

/* every byte of Auction Clearing Price Message set to one value */
inline fill_auction_clearing_price_message(auction_clearing_price_message_record, auction_clearing_price_message_value) {
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.transact_time[auction_clearing_price_message_at] = auction_clearing_price_message_value; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.security_id[auction_clearing_price_message_at] = auction_clearing_price_message_value; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.last_px[auction_clearing_price_message_at] = auction_clearing_price_message_value; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.last_qty[auction_clearing_price_message_at] = auction_clearing_price_message_value; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Clearing Price Message set to where it lies, so a field read out of place says so */
inline ramp_auction_clearing_price_message(auction_clearing_price_message_record, auction_clearing_price_message_base) {
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.transact_time[auction_clearing_price_message_at] = (auction_clearing_price_message_base + 0 + auction_clearing_price_message_at + 1) % 256; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.security_id[auction_clearing_price_message_at] = (auction_clearing_price_message_base + 8 + auction_clearing_price_message_at + 1) % 256; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.last_px[auction_clearing_price_message_at] = (auction_clearing_price_message_base + 16 + auction_clearing_price_message_at + 1) % 256; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.last_qty[auction_clearing_price_message_at] = (auction_clearing_price_message_base + 24 + auction_clearing_price_message_at + 1) % 256; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Clearing Price Message to the wire, 32 bytes from where the cursor stands */
inline encode_auction_clearing_price_message(auction_clearing_price_message_record) {
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> wire[at] = auction_clearing_price_message_record.transact_time[auction_clearing_price_message_at]; at = at + 1; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> wire[at] = auction_clearing_price_message_record.security_id[auction_clearing_price_message_at]; at = at + 1; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> wire[at] = auction_clearing_price_message_record.last_px[auction_clearing_price_message_at]; at = at + 1; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> wire[at] = auction_clearing_price_message_record.last_qty[auction_clearing_price_message_at]; at = at + 1; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Clearing Price Message off the wire, 32 bytes from where the cursor stands */
inline decode_auction_clearing_price_message(auction_clearing_price_message_record) {
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.transact_time[auction_clearing_price_message_at] = wire[at]; at = at + 1; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.security_id[auction_clearing_price_message_at] = wire[at]; at = at + 1; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.last_px[auction_clearing_price_message_at] = wire[at]; at = at + 1; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> auction_clearing_price_message_record.last_qty[auction_clearing_price_message_at] = wire[at]; at = at + 1; auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Clearing Price Message is what was written, byte for byte */
inline equal_auction_clearing_price_message(auction_clearing_price_message_read, auction_clearing_price_message_written) {
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> assert(auction_clearing_price_message_read.transact_time[auction_clearing_price_message_at] == auction_clearing_price_message_written.transact_time[auction_clearing_price_message_at]); auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> assert(auction_clearing_price_message_read.security_id[auction_clearing_price_message_at] == auction_clearing_price_message_written.security_id[auction_clearing_price_message_at]); auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> assert(auction_clearing_price_message_read.last_px[auction_clearing_price_message_at] == auction_clearing_price_message_written.last_px[auction_clearing_price_message_at]); auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  auction_clearing_price_message_at = 0;
  do
  :: auction_clearing_price_message_at < 8 -> assert(auction_clearing_price_message_read.last_qty[auction_clearing_price_message_at] == auction_clearing_price_message_written.last_qty[auction_clearing_price_message_at]); auction_clearing_price_message_at = auction_clearing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Top Of Book Message: 32 bytes ------------------------------------------- */

/* Carries the best bid and offer of an order book outside continuous trading. */
typedef TopOfBookMessage {
  byte transact_time[8];
  byte security_id[8];
  byte bid_px[8];
  byte offer_px[8]
};

int top_of_book_message_at;

/* every byte of Top Of Book Message set to one value */
inline fill_top_of_book_message(top_of_book_message_record, top_of_book_message_value) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.transact_time[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.security_id[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.bid_px[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.offer_px[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Top Of Book Message set to where it lies, so a field read out of place says so */
inline ramp_top_of_book_message(top_of_book_message_record, top_of_book_message_base) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.transact_time[top_of_book_message_at] = (top_of_book_message_base + 0 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.security_id[top_of_book_message_at] = (top_of_book_message_base + 8 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.bid_px[top_of_book_message_at] = (top_of_book_message_base + 16 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.offer_px[top_of_book_message_at] = (top_of_book_message_base + 24 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book Message to the wire, 32 bytes from where the cursor stands */
inline encode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.transact_time[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.security_id[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.bid_px[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.offer_px[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book Message off the wire, 32 bytes from where the cursor stands */
inline decode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.transact_time[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.security_id[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.bid_px[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.offer_px[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Top Of Book Message is what was written, byte for byte */
inline equal_top_of_book_message(top_of_book_message_read, top_of_book_message_written) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.transact_time[top_of_book_message_at] == top_of_book_message_written.transact_time[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.security_id[top_of_book_message_at] == top_of_book_message_written.security_id[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.bid_px[top_of_book_message_at] == top_of_book_message_written.bid_px[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.offer_px[top_of_book_message_at] == top_of_book_message_written.offer_px[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Add Message: 48 bytes --------------------------------------------- */

/* Published for each new order that was entered in the order book. */
typedef OrderAddMessage {
  byte trd_reg_ts_time_in[8];
  byte security_id[8];
  OrderDetails order_details
};

int order_add_message_at;

/* every byte of Order Add Message set to one value */
inline fill_order_add_message(order_add_message_record, order_add_message_value) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.trd_reg_ts_time_in[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.security_id[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  fill_order_details(order_add_message_record.order_details, order_add_message_value);
  skip
}

/* each byte of Order Add Message set to where it lies, so a field read out of place says so */
inline ramp_order_add_message(order_add_message_record, order_add_message_base) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.trd_reg_ts_time_in[order_add_message_at] = (order_add_message_base + 0 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.security_id[order_add_message_at] = (order_add_message_base + 8 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  ramp_order_details(order_add_message_record.order_details, order_add_message_base + 16);
  skip
}

/* Order Add Message to the wire, 48 bytes from where the cursor stands */
inline encode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.trd_reg_ts_time_in[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.security_id[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  encode_order_details(order_add_message_record.order_details);
  skip
}

/* Order Add Message off the wire, 48 bytes from where the cursor stands */
inline decode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.trd_reg_ts_time_in[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.security_id[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  decode_order_details(order_add_message_record.order_details);
  skip
}

/* what was read of Order Add Message is what was written, byte for byte */
inline equal_order_add_message(order_add_message_read, order_add_message_written) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.trd_reg_ts_time_in[order_add_message_at] == order_add_message_written.trd_reg_ts_time_in[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.security_id[order_add_message_at] == order_add_message_written.security_id[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  equal_order_details(order_add_message_read.order_details, order_add_message_written.order_details);
  skip
}

/* ---- Order Modify Message: 72 bytes ------------------------------------------ */

/* Published if an existing order in the book is modified, whereby the new parameters might cause a change in time priority. */
typedef OrderModifyMessage {
  byte trd_reg_ts_time_in[8];
  byte trd_reg_ts_prev_time_priority[8];
  byte prev_price[8];
  byte prev_display_qty[8];
  byte security_id[8];
  OrderDetails order_details
};

int order_modify_message_at;

/* every byte of Order Modify Message set to one value */
inline fill_order_modify_message(order_modify_message_record, order_modify_message_value) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.trd_reg_ts_time_in[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.trd_reg_ts_prev_time_priority[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.prev_price[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.prev_display_qty[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.security_id[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  fill_order_details(order_modify_message_record.order_details, order_modify_message_value);
  skip
}

/* each byte of Order Modify Message set to where it lies, so a field read out of place says so */
inline ramp_order_modify_message(order_modify_message_record, order_modify_message_base) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.trd_reg_ts_time_in[order_modify_message_at] = (order_modify_message_base + 0 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.trd_reg_ts_prev_time_priority[order_modify_message_at] = (order_modify_message_base + 8 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.prev_price[order_modify_message_at] = (order_modify_message_base + 16 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.prev_display_qty[order_modify_message_at] = (order_modify_message_base + 24 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.security_id[order_modify_message_at] = (order_modify_message_base + 32 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  ramp_order_details(order_modify_message_record.order_details, order_modify_message_base + 40);
  skip
}

/* Order Modify Message to the wire, 72 bytes from where the cursor stands */
inline encode_order_modify_message(order_modify_message_record) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.trd_reg_ts_time_in[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.trd_reg_ts_prev_time_priority[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.prev_price[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.prev_display_qty[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.security_id[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  encode_order_details(order_modify_message_record.order_details);
  skip
}

/* Order Modify Message off the wire, 72 bytes from where the cursor stands */
inline decode_order_modify_message(order_modify_message_record) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.trd_reg_ts_time_in[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.trd_reg_ts_prev_time_priority[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.prev_price[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.prev_display_qty[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.security_id[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  decode_order_details(order_modify_message_record.order_details);
  skip
}

/* what was read of Order Modify Message is what was written, byte for byte */
inline equal_order_modify_message(order_modify_message_read, order_modify_message_written) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.trd_reg_ts_time_in[order_modify_message_at] == order_modify_message_written.trd_reg_ts_time_in[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.trd_reg_ts_prev_time_priority[order_modify_message_at] == order_modify_message_written.trd_reg_ts_prev_time_priority[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.prev_price[order_modify_message_at] == order_modify_message_written.prev_price[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.prev_display_qty[order_modify_message_at] == order_modify_message_written.prev_display_qty[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.security_id[order_modify_message_at] == order_modify_message_written.security_id[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  equal_order_details(order_modify_message_read.order_details, order_modify_message_written.order_details);
  skip
}

/* ---- Order Modify Same Priority Message: 64 bytes ---------------------------- */

/* Published if the time priority of an existing order is not changed. */
typedef OrderModifySamePriorityMessage {
  byte trd_reg_ts_time_in[8];
  byte transact_time[8];
  byte prev_display_qty[8];
  byte security_id[8];
  OrderDetails order_details
};

int order_modify_same_priority_message_at;

/* every byte of Order Modify Same Priority Message set to one value */
inline fill_order_modify_same_priority_message(order_modify_same_priority_message_record, order_modify_same_priority_message_value) {
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.trd_reg_ts_time_in[order_modify_same_priority_message_at] = order_modify_same_priority_message_value; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.transact_time[order_modify_same_priority_message_at] = order_modify_same_priority_message_value; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.prev_display_qty[order_modify_same_priority_message_at] = order_modify_same_priority_message_value; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.security_id[order_modify_same_priority_message_at] = order_modify_same_priority_message_value; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  fill_order_details(order_modify_same_priority_message_record.order_details, order_modify_same_priority_message_value);
  skip
}

/* each byte of Order Modify Same Priority Message set to where it lies, so a field read out of place says so */
inline ramp_order_modify_same_priority_message(order_modify_same_priority_message_record, order_modify_same_priority_message_base) {
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.trd_reg_ts_time_in[order_modify_same_priority_message_at] = (order_modify_same_priority_message_base + 0 + order_modify_same_priority_message_at + 1) % 256; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.transact_time[order_modify_same_priority_message_at] = (order_modify_same_priority_message_base + 8 + order_modify_same_priority_message_at + 1) % 256; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.prev_display_qty[order_modify_same_priority_message_at] = (order_modify_same_priority_message_base + 16 + order_modify_same_priority_message_at + 1) % 256; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.security_id[order_modify_same_priority_message_at] = (order_modify_same_priority_message_base + 24 + order_modify_same_priority_message_at + 1) % 256; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  ramp_order_details(order_modify_same_priority_message_record.order_details, order_modify_same_priority_message_base + 32);
  skip
}

/* Order Modify Same Priority Message to the wire, 64 bytes from where the cursor stands */
inline encode_order_modify_same_priority_message(order_modify_same_priority_message_record) {
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> wire[at] = order_modify_same_priority_message_record.trd_reg_ts_time_in[order_modify_same_priority_message_at]; at = at + 1; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> wire[at] = order_modify_same_priority_message_record.transact_time[order_modify_same_priority_message_at]; at = at + 1; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> wire[at] = order_modify_same_priority_message_record.prev_display_qty[order_modify_same_priority_message_at]; at = at + 1; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> wire[at] = order_modify_same_priority_message_record.security_id[order_modify_same_priority_message_at]; at = at + 1; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  encode_order_details(order_modify_same_priority_message_record.order_details);
  skip
}

/* Order Modify Same Priority Message off the wire, 64 bytes from where the cursor stands */
inline decode_order_modify_same_priority_message(order_modify_same_priority_message_record) {
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.trd_reg_ts_time_in[order_modify_same_priority_message_at] = wire[at]; at = at + 1; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.transact_time[order_modify_same_priority_message_at] = wire[at]; at = at + 1; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.prev_display_qty[order_modify_same_priority_message_at] = wire[at]; at = at + 1; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> order_modify_same_priority_message_record.security_id[order_modify_same_priority_message_at] = wire[at]; at = at + 1; order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  decode_order_details(order_modify_same_priority_message_record.order_details);
  skip
}

/* what was read of Order Modify Same Priority Message is what was written, byte for byte */
inline equal_order_modify_same_priority_message(order_modify_same_priority_message_read, order_modify_same_priority_message_written) {
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> assert(order_modify_same_priority_message_read.trd_reg_ts_time_in[order_modify_same_priority_message_at] == order_modify_same_priority_message_written.trd_reg_ts_time_in[order_modify_same_priority_message_at]); order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> assert(order_modify_same_priority_message_read.transact_time[order_modify_same_priority_message_at] == order_modify_same_priority_message_written.transact_time[order_modify_same_priority_message_at]); order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> assert(order_modify_same_priority_message_read.prev_display_qty[order_modify_same_priority_message_at] == order_modify_same_priority_message_written.prev_display_qty[order_modify_same_priority_message_at]); order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  order_modify_same_priority_message_at = 0;
  do
  :: order_modify_same_priority_message_at < 8 -> assert(order_modify_same_priority_message_read.security_id[order_modify_same_priority_message_at] == order_modify_same_priority_message_written.security_id[order_modify_same_priority_message_at]); order_modify_same_priority_message_at = order_modify_same_priority_message_at + 1
  :: else -> break
  od;
  equal_order_details(order_modify_same_priority_message_read.order_details, order_modify_same_priority_message_written.order_details);
  skip
}

/* ---- Order Delete Message: 56 bytes ------------------------------------------ */

/* Published whenever an existing order is deleted from the order book. */
typedef OrderDeleteMessage {
  byte trd_reg_ts_time_in[8];
  byte transact_time[8];
  byte security_id[8];
  OrderDetails order_details
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.trd_reg_ts_time_in[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.transact_time[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.security_id[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  fill_order_details(order_delete_message_record.order_details, order_delete_message_value);
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.trd_reg_ts_time_in[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.transact_time[order_delete_message_at] = (order_delete_message_base + 8 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.security_id[order_delete_message_at] = (order_delete_message_base + 16 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  ramp_order_details(order_delete_message_record.order_details, order_delete_message_base + 24);
  skip
}

/* Order Delete Message to the wire, 56 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.trd_reg_ts_time_in[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.transact_time[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.security_id[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  encode_order_details(order_delete_message_record.order_details);
  skip
}

/* Order Delete Message off the wire, 56 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.trd_reg_ts_time_in[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.transact_time[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.security_id[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  decode_order_details(order_delete_message_record.order_details);
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.trd_reg_ts_time_in[order_delete_message_at] == order_delete_message_written.trd_reg_ts_time_in[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.transact_time[order_delete_message_at] == order_delete_message_written.transact_time[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.security_id[order_delete_message_at] == order_delete_message_written.security_id[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  equal_order_details(order_delete_message_read.order_details, order_delete_message_written.order_details);
  skip
}

/* ---- Order Mass Delete Message: 16 bytes ------------------------------------- */

/* Published when the order book is expected to be emptied. */
typedef OrderMassDeleteMessage {
  byte security_id[8];
  byte transact_time[8]
};

int order_mass_delete_message_at;

/* every byte of Order Mass Delete Message set to one value */
inline fill_order_mass_delete_message(order_mass_delete_message_record, order_mass_delete_message_value) {
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> order_mass_delete_message_record.security_id[order_mass_delete_message_at] = order_mass_delete_message_value; order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> order_mass_delete_message_record.transact_time[order_mass_delete_message_at] = order_mass_delete_message_value; order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Mass Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_mass_delete_message(order_mass_delete_message_record, order_mass_delete_message_base) {
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> order_mass_delete_message_record.security_id[order_mass_delete_message_at] = (order_mass_delete_message_base + 0 + order_mass_delete_message_at + 1) % 256; order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> order_mass_delete_message_record.transact_time[order_mass_delete_message_at] = (order_mass_delete_message_base + 8 + order_mass_delete_message_at + 1) % 256; order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Delete Message to the wire, 16 bytes from where the cursor stands */
inline encode_order_mass_delete_message(order_mass_delete_message_record) {
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> wire[at] = order_mass_delete_message_record.security_id[order_mass_delete_message_at]; at = at + 1; order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> wire[at] = order_mass_delete_message_record.transact_time[order_mass_delete_message_at]; at = at + 1; order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Delete Message off the wire, 16 bytes from where the cursor stands */
inline decode_order_mass_delete_message(order_mass_delete_message_record) {
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> order_mass_delete_message_record.security_id[order_mass_delete_message_at] = wire[at]; at = at + 1; order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> order_mass_delete_message_record.transact_time[order_mass_delete_message_at] = wire[at]; at = at + 1; order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Mass Delete Message is what was written, byte for byte */
inline equal_order_mass_delete_message(order_mass_delete_message_read, order_mass_delete_message_written) {
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> assert(order_mass_delete_message_read.security_id[order_mass_delete_message_at] == order_mass_delete_message_written.security_id[order_mass_delete_message_at]); order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  order_mass_delete_message_at = 0;
  do
  :: order_mass_delete_message_at < 8 -> assert(order_mass_delete_message_read.transact_time[order_mass_delete_message_at] == order_mass_delete_message_written.transact_time[order_mass_delete_message_at]); order_mass_delete_message_at = order_mass_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Partial Order Execution Message: 56 bytes ------------------------------- */

/* Published whenever a visible order is partially executed at its displayed price. */
typedef PartialOrderExecutionMessage {
  byte side;
  byte pad_7[7];
  byte price[8];
  byte trd_reg_ts_time_priority[8];
  byte security_id[8];
  byte trd_match_id[4];
  byte pad_4[4];
  byte last_qty[8];
  byte last_px[8]
};

int partial_order_execution_message_at;

/* every byte of Partial Order Execution Message set to one value */
inline fill_partial_order_execution_message(partial_order_execution_message_record, partial_order_execution_message_value) {
  partial_order_execution_message_record.side = partial_order_execution_message_value;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 7 -> partial_order_execution_message_record.pad_7[partial_order_execution_message_at] = partial_order_execution_message_value; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.price[partial_order_execution_message_at] = partial_order_execution_message_value; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.trd_reg_ts_time_priority[partial_order_execution_message_at] = partial_order_execution_message_value; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.security_id[partial_order_execution_message_at] = partial_order_execution_message_value; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> partial_order_execution_message_record.trd_match_id[partial_order_execution_message_at] = partial_order_execution_message_value; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> partial_order_execution_message_record.pad_4[partial_order_execution_message_at] = partial_order_execution_message_value; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.last_qty[partial_order_execution_message_at] = partial_order_execution_message_value; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.last_px[partial_order_execution_message_at] = partial_order_execution_message_value; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Partial Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_partial_order_execution_message(partial_order_execution_message_record, partial_order_execution_message_base) {
  partial_order_execution_message_record.side = (partial_order_execution_message_base + 0 + 1) % 256;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 7 -> partial_order_execution_message_record.pad_7[partial_order_execution_message_at] = (partial_order_execution_message_base + 1 + partial_order_execution_message_at + 1) % 256; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.price[partial_order_execution_message_at] = (partial_order_execution_message_base + 8 + partial_order_execution_message_at + 1) % 256; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.trd_reg_ts_time_priority[partial_order_execution_message_at] = (partial_order_execution_message_base + 16 + partial_order_execution_message_at + 1) % 256; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.security_id[partial_order_execution_message_at] = (partial_order_execution_message_base + 24 + partial_order_execution_message_at + 1) % 256; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> partial_order_execution_message_record.trd_match_id[partial_order_execution_message_at] = (partial_order_execution_message_base + 32 + partial_order_execution_message_at + 1) % 256; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> partial_order_execution_message_record.pad_4[partial_order_execution_message_at] = (partial_order_execution_message_base + 36 + partial_order_execution_message_at + 1) % 256; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.last_qty[partial_order_execution_message_at] = (partial_order_execution_message_base + 40 + partial_order_execution_message_at + 1) % 256; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.last_px[partial_order_execution_message_at] = (partial_order_execution_message_base + 48 + partial_order_execution_message_at + 1) % 256; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Partial Order Execution Message to the wire, 56 bytes from where the cursor stands */
inline encode_partial_order_execution_message(partial_order_execution_message_record) {
  wire[at] = partial_order_execution_message_record.side; at = at + 1;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 7 -> wire[at] = partial_order_execution_message_record.pad_7[partial_order_execution_message_at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> wire[at] = partial_order_execution_message_record.price[partial_order_execution_message_at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> wire[at] = partial_order_execution_message_record.trd_reg_ts_time_priority[partial_order_execution_message_at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> wire[at] = partial_order_execution_message_record.security_id[partial_order_execution_message_at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> wire[at] = partial_order_execution_message_record.trd_match_id[partial_order_execution_message_at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> wire[at] = partial_order_execution_message_record.pad_4[partial_order_execution_message_at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> wire[at] = partial_order_execution_message_record.last_qty[partial_order_execution_message_at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> wire[at] = partial_order_execution_message_record.last_px[partial_order_execution_message_at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Partial Order Execution Message off the wire, 56 bytes from where the cursor stands */
inline decode_partial_order_execution_message(partial_order_execution_message_record) {
  partial_order_execution_message_record.side = wire[at]; at = at + 1;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 7 -> partial_order_execution_message_record.pad_7[partial_order_execution_message_at] = wire[at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.price[partial_order_execution_message_at] = wire[at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.trd_reg_ts_time_priority[partial_order_execution_message_at] = wire[at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.security_id[partial_order_execution_message_at] = wire[at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> partial_order_execution_message_record.trd_match_id[partial_order_execution_message_at] = wire[at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> partial_order_execution_message_record.pad_4[partial_order_execution_message_at] = wire[at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.last_qty[partial_order_execution_message_at] = wire[at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> partial_order_execution_message_record.last_px[partial_order_execution_message_at] = wire[at]; at = at + 1; partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Partial Order Execution Message is what was written, byte for byte */
inline equal_partial_order_execution_message(partial_order_execution_message_read, partial_order_execution_message_written) {
  assert(partial_order_execution_message_read.side == partial_order_execution_message_written.side);
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 7 -> assert(partial_order_execution_message_read.pad_7[partial_order_execution_message_at] == partial_order_execution_message_written.pad_7[partial_order_execution_message_at]); partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> assert(partial_order_execution_message_read.price[partial_order_execution_message_at] == partial_order_execution_message_written.price[partial_order_execution_message_at]); partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> assert(partial_order_execution_message_read.trd_reg_ts_time_priority[partial_order_execution_message_at] == partial_order_execution_message_written.trd_reg_ts_time_priority[partial_order_execution_message_at]); partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> assert(partial_order_execution_message_read.security_id[partial_order_execution_message_at] == partial_order_execution_message_written.security_id[partial_order_execution_message_at]); partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> assert(partial_order_execution_message_read.trd_match_id[partial_order_execution_message_at] == partial_order_execution_message_written.trd_match_id[partial_order_execution_message_at]); partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 4 -> assert(partial_order_execution_message_read.pad_4[partial_order_execution_message_at] == partial_order_execution_message_written.pad_4[partial_order_execution_message_at]); partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> assert(partial_order_execution_message_read.last_qty[partial_order_execution_message_at] == partial_order_execution_message_written.last_qty[partial_order_execution_message_at]); partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  partial_order_execution_message_at = 0;
  do
  :: partial_order_execution_message_at < 8 -> assert(partial_order_execution_message_read.last_px[partial_order_execution_message_at] == partial_order_execution_message_written.last_px[partial_order_execution_message_at]); partial_order_execution_message_at = partial_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Full Order Execution Message: 56 bytes ---------------------------------- */

/* Published whenever a visible order is fully executed at its displayed price. */
typedef FullOrderExecutionMessage {
  byte side;
  byte pad_7[7];
  byte price[8];
  byte trd_reg_ts_time_priority[8];
  byte security_id[8];
  byte trd_match_id[4];
  byte pad_4[4];
  byte last_qty[8];
  byte last_px[8]
};

int full_order_execution_message_at;

/* every byte of Full Order Execution Message set to one value */
inline fill_full_order_execution_message(full_order_execution_message_record, full_order_execution_message_value) {
  full_order_execution_message_record.side = full_order_execution_message_value;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 7 -> full_order_execution_message_record.pad_7[full_order_execution_message_at] = full_order_execution_message_value; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.price[full_order_execution_message_at] = full_order_execution_message_value; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.trd_reg_ts_time_priority[full_order_execution_message_at] = full_order_execution_message_value; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.security_id[full_order_execution_message_at] = full_order_execution_message_value; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> full_order_execution_message_record.trd_match_id[full_order_execution_message_at] = full_order_execution_message_value; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> full_order_execution_message_record.pad_4[full_order_execution_message_at] = full_order_execution_message_value; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.last_qty[full_order_execution_message_at] = full_order_execution_message_value; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.last_px[full_order_execution_message_at] = full_order_execution_message_value; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Full Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_full_order_execution_message(full_order_execution_message_record, full_order_execution_message_base) {
  full_order_execution_message_record.side = (full_order_execution_message_base + 0 + 1) % 256;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 7 -> full_order_execution_message_record.pad_7[full_order_execution_message_at] = (full_order_execution_message_base + 1 + full_order_execution_message_at + 1) % 256; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.price[full_order_execution_message_at] = (full_order_execution_message_base + 8 + full_order_execution_message_at + 1) % 256; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.trd_reg_ts_time_priority[full_order_execution_message_at] = (full_order_execution_message_base + 16 + full_order_execution_message_at + 1) % 256; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.security_id[full_order_execution_message_at] = (full_order_execution_message_base + 24 + full_order_execution_message_at + 1) % 256; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> full_order_execution_message_record.trd_match_id[full_order_execution_message_at] = (full_order_execution_message_base + 32 + full_order_execution_message_at + 1) % 256; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> full_order_execution_message_record.pad_4[full_order_execution_message_at] = (full_order_execution_message_base + 36 + full_order_execution_message_at + 1) % 256; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.last_qty[full_order_execution_message_at] = (full_order_execution_message_base + 40 + full_order_execution_message_at + 1) % 256; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.last_px[full_order_execution_message_at] = (full_order_execution_message_base + 48 + full_order_execution_message_at + 1) % 256; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Full Order Execution Message to the wire, 56 bytes from where the cursor stands */
inline encode_full_order_execution_message(full_order_execution_message_record) {
  wire[at] = full_order_execution_message_record.side; at = at + 1;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 7 -> wire[at] = full_order_execution_message_record.pad_7[full_order_execution_message_at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> wire[at] = full_order_execution_message_record.price[full_order_execution_message_at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> wire[at] = full_order_execution_message_record.trd_reg_ts_time_priority[full_order_execution_message_at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> wire[at] = full_order_execution_message_record.security_id[full_order_execution_message_at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> wire[at] = full_order_execution_message_record.trd_match_id[full_order_execution_message_at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> wire[at] = full_order_execution_message_record.pad_4[full_order_execution_message_at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> wire[at] = full_order_execution_message_record.last_qty[full_order_execution_message_at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> wire[at] = full_order_execution_message_record.last_px[full_order_execution_message_at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Full Order Execution Message off the wire, 56 bytes from where the cursor stands */
inline decode_full_order_execution_message(full_order_execution_message_record) {
  full_order_execution_message_record.side = wire[at]; at = at + 1;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 7 -> full_order_execution_message_record.pad_7[full_order_execution_message_at] = wire[at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.price[full_order_execution_message_at] = wire[at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.trd_reg_ts_time_priority[full_order_execution_message_at] = wire[at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.security_id[full_order_execution_message_at] = wire[at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> full_order_execution_message_record.trd_match_id[full_order_execution_message_at] = wire[at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> full_order_execution_message_record.pad_4[full_order_execution_message_at] = wire[at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.last_qty[full_order_execution_message_at] = wire[at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> full_order_execution_message_record.last_px[full_order_execution_message_at] = wire[at]; at = at + 1; full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Full Order Execution Message is what was written, byte for byte */
inline equal_full_order_execution_message(full_order_execution_message_read, full_order_execution_message_written) {
  assert(full_order_execution_message_read.side == full_order_execution_message_written.side);
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 7 -> assert(full_order_execution_message_read.pad_7[full_order_execution_message_at] == full_order_execution_message_written.pad_7[full_order_execution_message_at]); full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> assert(full_order_execution_message_read.price[full_order_execution_message_at] == full_order_execution_message_written.price[full_order_execution_message_at]); full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> assert(full_order_execution_message_read.trd_reg_ts_time_priority[full_order_execution_message_at] == full_order_execution_message_written.trd_reg_ts_time_priority[full_order_execution_message_at]); full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> assert(full_order_execution_message_read.security_id[full_order_execution_message_at] == full_order_execution_message_written.security_id[full_order_execution_message_at]); full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> assert(full_order_execution_message_read.trd_match_id[full_order_execution_message_at] == full_order_execution_message_written.trd_match_id[full_order_execution_message_at]); full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 4 -> assert(full_order_execution_message_read.pad_4[full_order_execution_message_at] == full_order_execution_message_written.pad_4[full_order_execution_message_at]); full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> assert(full_order_execution_message_read.last_qty[full_order_execution_message_at] == full_order_execution_message_written.last_qty[full_order_execution_message_at]); full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  full_order_execution_message_at = 0;
  do
  :: full_order_execution_message_at < 8 -> assert(full_order_execution_message_read.last_px[full_order_execution_message_at] == full_order_execution_message_written.last_px[full_order_execution_message_at]); full_order_execution_message_at = full_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Summary Message: 56 bytes ------------------------------------- */

/* Published whenever an incoming order is executed, carrying information on the execution of that incoming order. */
typedef ExecutionSummaryMessage {
  byte security_id[8];
  byte aggressor_timestamp[8];
  byte exec_id[8];
  byte last_qty[8];
  byte aggressor_side;
  byte trade_condition;
  byte pad_6[6];
  byte last_px[8];
  byte resting_hidden_qty[8]
};

int execution_summary_message_at;

/* every byte of Execution Summary Message set to one value */
inline fill_execution_summary_message(execution_summary_message_record, execution_summary_message_value) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.security_id[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.aggressor_timestamp[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.exec_id[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.last_qty[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_record.aggressor_side = execution_summary_message_value;
  execution_summary_message_record.trade_condition = execution_summary_message_value;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> execution_summary_message_record.pad_6[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.last_px[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.resting_hidden_qty[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Summary Message set to where it lies, so a field read out of place says so */
inline ramp_execution_summary_message(execution_summary_message_record, execution_summary_message_base) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.security_id[execution_summary_message_at] = (execution_summary_message_base + 0 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.aggressor_timestamp[execution_summary_message_at] = (execution_summary_message_base + 8 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.exec_id[execution_summary_message_at] = (execution_summary_message_base + 16 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.last_qty[execution_summary_message_at] = (execution_summary_message_base + 24 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_record.aggressor_side = (execution_summary_message_base + 32 + 1) % 256;
  execution_summary_message_record.trade_condition = (execution_summary_message_base + 33 + 1) % 256;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> execution_summary_message_record.pad_6[execution_summary_message_at] = (execution_summary_message_base + 34 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.last_px[execution_summary_message_at] = (execution_summary_message_base + 40 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.resting_hidden_qty[execution_summary_message_at] = (execution_summary_message_base + 48 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary Message to the wire, 56 bytes from where the cursor stands */
inline encode_execution_summary_message(execution_summary_message_record) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.security_id[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.aggressor_timestamp[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.exec_id[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.last_qty[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_summary_message_record.aggressor_side; at = at + 1;
  wire[at] = execution_summary_message_record.trade_condition; at = at + 1;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> wire[at] = execution_summary_message_record.pad_6[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.last_px[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.resting_hidden_qty[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary Message off the wire, 56 bytes from where the cursor stands */
inline decode_execution_summary_message(execution_summary_message_record) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.security_id[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.aggressor_timestamp[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.exec_id[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.last_qty[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_record.aggressor_side = wire[at]; at = at + 1;
  execution_summary_message_record.trade_condition = wire[at]; at = at + 1;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> execution_summary_message_record.pad_6[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.last_px[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.resting_hidden_qty[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Summary Message is what was written, byte for byte */
inline equal_execution_summary_message(execution_summary_message_read, execution_summary_message_written) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.security_id[execution_summary_message_at] == execution_summary_message_written.security_id[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.aggressor_timestamp[execution_summary_message_at] == execution_summary_message_written.aggressor_timestamp[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.exec_id[execution_summary_message_at] == execution_summary_message_written.exec_id[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.last_qty[execution_summary_message_at] == execution_summary_message_written.last_qty[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  assert(execution_summary_message_read.aggressor_side == execution_summary_message_written.aggressor_side);
  assert(execution_summary_message_read.trade_condition == execution_summary_message_written.trade_condition);
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 6 -> assert(execution_summary_message_read.pad_6[execution_summary_message_at] == execution_summary_message_written.pad_6[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.last_px[execution_summary_message_at] == execution_summary_message_written.last_px[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.resting_hidden_qty[execution_summary_message_at] == execution_summary_message_written.resting_hidden_qty[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Info Message: 40 bytes --------------------------------------- */

/* Published whenever there is a change in the daily price range of the instrument. */
typedef InstrumentInfoMessage {
  byte security_id[8];
  byte close_price[8];
  byte prev_close_price[8];
  byte upper_ckt_limit[8];
  byte lower_ckt_limit[8]
};

int instrument_info_message_at;

/* every byte of Instrument Info Message set to one value */
inline fill_instrument_info_message(instrument_info_message_record, instrument_info_message_value) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.security_id[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.close_price[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.prev_close_price[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.upper_ckt_limit[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.lower_ckt_limit[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Info Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_info_message(instrument_info_message_record, instrument_info_message_base) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.security_id[instrument_info_message_at] = (instrument_info_message_base + 0 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.close_price[instrument_info_message_at] = (instrument_info_message_base + 8 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.prev_close_price[instrument_info_message_at] = (instrument_info_message_base + 16 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.upper_ckt_limit[instrument_info_message_at] = (instrument_info_message_base + 24 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.lower_ckt_limit[instrument_info_message_at] = (instrument_info_message_base + 32 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Message to the wire, 40 bytes from where the cursor stands */
inline encode_instrument_info_message(instrument_info_message_record) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.security_id[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.close_price[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.prev_close_price[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.upper_ckt_limit[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.lower_ckt_limit[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Message off the wire, 40 bytes from where the cursor stands */
inline decode_instrument_info_message(instrument_info_message_record) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.security_id[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.close_price[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.prev_close_price[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.upper_ckt_limit[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.lower_ckt_limit[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Info Message is what was written, byte for byte */
inline equal_instrument_info_message(instrument_info_message_read, instrument_info_message_written) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.security_id[instrument_info_message_at] == instrument_info_message_written.security_id[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.close_price[instrument_info_message_at] == instrument_info_message_written.close_price[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.prev_close_price[instrument_info_message_at] == instrument_info_message_written.prev_close_price[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.upper_ckt_limit[instrument_info_message_at] == instrument_info_message_written.upper_ckt_limit[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.lower_ckt_limit[instrument_info_message_at] == instrument_info_message_written.lower_ckt_limit[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Lpp Range Message: 24 bytes --------------------------------------------- */

/* Published whenever there is a change in the limit price protection range of the instrument. */
typedef LppRangeMessage {
  byte security_id[8];
  byte upper_exec_limit[8];
  byte lower_exec_limit[8]
};

int lpp_range_message_at;

/* every byte of Lpp Range Message set to one value */
inline fill_lpp_range_message(lpp_range_message_record, lpp_range_message_value) {
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> lpp_range_message_record.security_id[lpp_range_message_at] = lpp_range_message_value; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> lpp_range_message_record.upper_exec_limit[lpp_range_message_at] = lpp_range_message_value; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> lpp_range_message_record.lower_exec_limit[lpp_range_message_at] = lpp_range_message_value; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Lpp Range Message set to where it lies, so a field read out of place says so */
inline ramp_lpp_range_message(lpp_range_message_record, lpp_range_message_base) {
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> lpp_range_message_record.security_id[lpp_range_message_at] = (lpp_range_message_base + 0 + lpp_range_message_at + 1) % 256; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> lpp_range_message_record.upper_exec_limit[lpp_range_message_at] = (lpp_range_message_base + 8 + lpp_range_message_at + 1) % 256; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> lpp_range_message_record.lower_exec_limit[lpp_range_message_at] = (lpp_range_message_base + 16 + lpp_range_message_at + 1) % 256; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  skip
}

/* Lpp Range Message to the wire, 24 bytes from where the cursor stands */
inline encode_lpp_range_message(lpp_range_message_record) {
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> wire[at] = lpp_range_message_record.security_id[lpp_range_message_at]; at = at + 1; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> wire[at] = lpp_range_message_record.upper_exec_limit[lpp_range_message_at]; at = at + 1; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> wire[at] = lpp_range_message_record.lower_exec_limit[lpp_range_message_at]; at = at + 1; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  skip
}

/* Lpp Range Message off the wire, 24 bytes from where the cursor stands */
inline decode_lpp_range_message(lpp_range_message_record) {
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> lpp_range_message_record.security_id[lpp_range_message_at] = wire[at]; at = at + 1; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> lpp_range_message_record.upper_exec_limit[lpp_range_message_at] = wire[at]; at = at + 1; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> lpp_range_message_record.lower_exec_limit[lpp_range_message_at] = wire[at]; at = at + 1; lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Lpp Range Message is what was written, byte for byte */
inline equal_lpp_range_message(lpp_range_message_read, lpp_range_message_written) {
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> assert(lpp_range_message_read.security_id[lpp_range_message_at] == lpp_range_message_written.security_id[lpp_range_message_at]); lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> assert(lpp_range_message_read.upper_exec_limit[lpp_range_message_at] == lpp_range_message_written.upper_exec_limit[lpp_range_message_at]); lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  lpp_range_message_at = 0;
  do
  :: lpp_range_message_at < 8 -> assert(lpp_range_message_read.lower_exec_limit[lpp_range_message_at] == lpp_range_message_written.lower_exec_limit[lpp_range_message_at]); lpp_range_message_at = lpp_range_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Product State Change Message: 16 bytes ---------------------------------- */

/* Provides updates on the trading state for all instruments in a particular product. */
typedef ProductStateChangeMessage {
  byte trading_session_id;
  byte trading_session_sub_id;
  byte trad_ses_status;
  byte fast_market_indicator;
  byte pad_4[4];
  byte transact_time[8]
};

int product_state_change_message_at;

/* every byte of Product State Change Message set to one value */
inline fill_product_state_change_message(product_state_change_message_record, product_state_change_message_value) {
  product_state_change_message_record.trading_session_id = product_state_change_message_value;
  product_state_change_message_record.trading_session_sub_id = product_state_change_message_value;
  product_state_change_message_record.trad_ses_status = product_state_change_message_value;
  product_state_change_message_record.fast_market_indicator = product_state_change_message_value;
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 4 -> product_state_change_message_record.pad_4[product_state_change_message_at] = product_state_change_message_value; product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 8 -> product_state_change_message_record.transact_time[product_state_change_message_at] = product_state_change_message_value; product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Product State Change Message set to where it lies, so a field read out of place says so */
inline ramp_product_state_change_message(product_state_change_message_record, product_state_change_message_base) {
  product_state_change_message_record.trading_session_id = (product_state_change_message_base + 0 + 1) % 256;
  product_state_change_message_record.trading_session_sub_id = (product_state_change_message_base + 1 + 1) % 256;
  product_state_change_message_record.trad_ses_status = (product_state_change_message_base + 2 + 1) % 256;
  product_state_change_message_record.fast_market_indicator = (product_state_change_message_base + 3 + 1) % 256;
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 4 -> product_state_change_message_record.pad_4[product_state_change_message_at] = (product_state_change_message_base + 4 + product_state_change_message_at + 1) % 256; product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 8 -> product_state_change_message_record.transact_time[product_state_change_message_at] = (product_state_change_message_base + 8 + product_state_change_message_at + 1) % 256; product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Product State Change Message to the wire, 16 bytes from where the cursor stands */
inline encode_product_state_change_message(product_state_change_message_record) {
  wire[at] = product_state_change_message_record.trading_session_id; at = at + 1;
  wire[at] = product_state_change_message_record.trading_session_sub_id; at = at + 1;
  wire[at] = product_state_change_message_record.trad_ses_status; at = at + 1;
  wire[at] = product_state_change_message_record.fast_market_indicator; at = at + 1;
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 4 -> wire[at] = product_state_change_message_record.pad_4[product_state_change_message_at]; at = at + 1; product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 8 -> wire[at] = product_state_change_message_record.transact_time[product_state_change_message_at]; at = at + 1; product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Product State Change Message off the wire, 16 bytes from where the cursor stands */
inline decode_product_state_change_message(product_state_change_message_record) {
  product_state_change_message_record.trading_session_id = wire[at]; at = at + 1;
  product_state_change_message_record.trading_session_sub_id = wire[at]; at = at + 1;
  product_state_change_message_record.trad_ses_status = wire[at]; at = at + 1;
  product_state_change_message_record.fast_market_indicator = wire[at]; at = at + 1;
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 4 -> product_state_change_message_record.pad_4[product_state_change_message_at] = wire[at]; at = at + 1; product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 8 -> product_state_change_message_record.transact_time[product_state_change_message_at] = wire[at]; at = at + 1; product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Product State Change Message is what was written, byte for byte */
inline equal_product_state_change_message(product_state_change_message_read, product_state_change_message_written) {
  assert(product_state_change_message_read.trading_session_id == product_state_change_message_written.trading_session_id);
  assert(product_state_change_message_read.trading_session_sub_id == product_state_change_message_written.trading_session_sub_id);
  assert(product_state_change_message_read.trad_ses_status == product_state_change_message_written.trad_ses_status);
  assert(product_state_change_message_read.fast_market_indicator == product_state_change_message_written.fast_market_indicator);
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 4 -> assert(product_state_change_message_read.pad_4[product_state_change_message_at] == product_state_change_message_written.pad_4[product_state_change_message_at]); product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  product_state_change_message_at = 0;
  do
  :: product_state_change_message_at < 8 -> assert(product_state_change_message_read.transact_time[product_state_change_message_at] == product_state_change_message_written.transact_time[product_state_change_message_at]); product_state_change_message_at = product_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument State Change Message: 24 bytes ------------------------------- */

/* Provides state information for a single instrument. */
typedef InstrumentStateChangeMessage {
  byte security_id[8];
  byte security_status;
  byte security_trading_status;
  byte fast_market_indicator;
  byte pad_5[5];
  byte transact_time[8]
};

int instrument_state_change_message_at;

/* every byte of Instrument State Change Message set to one value */
inline fill_instrument_state_change_message(instrument_state_change_message_record, instrument_state_change_message_value) {
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> instrument_state_change_message_record.security_id[instrument_state_change_message_at] = instrument_state_change_message_value; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  instrument_state_change_message_record.security_status = instrument_state_change_message_value;
  instrument_state_change_message_record.security_trading_status = instrument_state_change_message_value;
  instrument_state_change_message_record.fast_market_indicator = instrument_state_change_message_value;
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 5 -> instrument_state_change_message_record.pad_5[instrument_state_change_message_at] = instrument_state_change_message_value; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> instrument_state_change_message_record.transact_time[instrument_state_change_message_at] = instrument_state_change_message_value; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument State Change Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_state_change_message(instrument_state_change_message_record, instrument_state_change_message_base) {
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> instrument_state_change_message_record.security_id[instrument_state_change_message_at] = (instrument_state_change_message_base + 0 + instrument_state_change_message_at + 1) % 256; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  instrument_state_change_message_record.security_status = (instrument_state_change_message_base + 8 + 1) % 256;
  instrument_state_change_message_record.security_trading_status = (instrument_state_change_message_base + 9 + 1) % 256;
  instrument_state_change_message_record.fast_market_indicator = (instrument_state_change_message_base + 10 + 1) % 256;
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 5 -> instrument_state_change_message_record.pad_5[instrument_state_change_message_at] = (instrument_state_change_message_base + 11 + instrument_state_change_message_at + 1) % 256; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> instrument_state_change_message_record.transact_time[instrument_state_change_message_at] = (instrument_state_change_message_base + 16 + instrument_state_change_message_at + 1) % 256; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument State Change Message to the wire, 24 bytes from where the cursor stands */
inline encode_instrument_state_change_message(instrument_state_change_message_record) {
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> wire[at] = instrument_state_change_message_record.security_id[instrument_state_change_message_at]; at = at + 1; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_state_change_message_record.security_status; at = at + 1;
  wire[at] = instrument_state_change_message_record.security_trading_status; at = at + 1;
  wire[at] = instrument_state_change_message_record.fast_market_indicator; at = at + 1;
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 5 -> wire[at] = instrument_state_change_message_record.pad_5[instrument_state_change_message_at]; at = at + 1; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> wire[at] = instrument_state_change_message_record.transact_time[instrument_state_change_message_at]; at = at + 1; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument State Change Message off the wire, 24 bytes from where the cursor stands */
inline decode_instrument_state_change_message(instrument_state_change_message_record) {
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> instrument_state_change_message_record.security_id[instrument_state_change_message_at] = wire[at]; at = at + 1; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  instrument_state_change_message_record.security_status = wire[at]; at = at + 1;
  instrument_state_change_message_record.security_trading_status = wire[at]; at = at + 1;
  instrument_state_change_message_record.fast_market_indicator = wire[at]; at = at + 1;
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 5 -> instrument_state_change_message_record.pad_5[instrument_state_change_message_at] = wire[at]; at = at + 1; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> instrument_state_change_message_record.transact_time[instrument_state_change_message_at] = wire[at]; at = at + 1; instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument State Change Message is what was written, byte for byte */
inline equal_instrument_state_change_message(instrument_state_change_message_read, instrument_state_change_message_written) {
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> assert(instrument_state_change_message_read.security_id[instrument_state_change_message_at] == instrument_state_change_message_written.security_id[instrument_state_change_message_at]); instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  assert(instrument_state_change_message_read.security_status == instrument_state_change_message_written.security_status);
  assert(instrument_state_change_message_read.security_trading_status == instrument_state_change_message_written.security_trading_status);
  assert(instrument_state_change_message_read.fast_market_indicator == instrument_state_change_message_written.fast_market_indicator);
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 5 -> assert(instrument_state_change_message_read.pad_5[instrument_state_change_message_at] == instrument_state_change_message_written.pad_5[instrument_state_change_message_at]); instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  instrument_state_change_message_at = 0;
  do
  :: instrument_state_change_message_at < 8 -> assert(instrument_state_change_message_read.transact_time[instrument_state_change_message_at] == instrument_state_change_message_written.transact_time[instrument_state_change_message_at]); instrument_state_change_message_at = instrument_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Eobi Header: encoded, read back, and compared */
proctype check_eobi_header() {
  EobiHeader eobi_header_sent;
  EobiHeader eobi_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eobi_header(eobi_header_sent, 0)
  :: pattern == 1 -> fill_eobi_header(eobi_header_sent, 32)
  :: pattern == 2 -> fill_eobi_header(eobi_header_sent, 255)
  :: else -> ramp_eobi_header(eobi_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eobi_header(eobi_header_sent);
    assert(at == 8);
    at = 0;
    decode_eobi_header(eobi_header_got);
    assert(at == 8);
    equal_eobi_header(eobi_header_got, eobi_header_sent)
  }
}

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
    assert(at == 32);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 32);
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Heartbeat Message: encoded, read back, and compared */
proctype check_heartbeat_message() {
  HeartbeatMessage heartbeat_message_sent;
  HeartbeatMessage heartbeat_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_message(heartbeat_message_sent, 0)
  :: pattern == 1 -> fill_heartbeat_message(heartbeat_message_sent, 32)
  :: pattern == 2 -> fill_heartbeat_message(heartbeat_message_sent, 255)
  :: else -> ramp_heartbeat_message(heartbeat_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_message(heartbeat_message_sent);
    assert(at == 8);
    at = 0;
    decode_heartbeat_message(heartbeat_message_got);
    assert(at == 8);
    equal_heartbeat_message(heartbeat_message_got, heartbeat_message_sent)
  }
}

/* Product Summary Message: encoded, read back, and compared */
proctype check_product_summary_message() {
  ProductSummaryMessage product_summary_message_sent;
  ProductSummaryMessage product_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_product_summary_message(product_summary_message_sent, 0)
  :: pattern == 1 -> fill_product_summary_message(product_summary_message_sent, 32)
  :: pattern == 2 -> fill_product_summary_message(product_summary_message_sent, 255)
  :: else -> ramp_product_summary_message(product_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_product_summary_message(product_summary_message_sent);
    assert(at == 8);
    at = 0;
    decode_product_summary_message(product_summary_message_got);
    assert(at == 8);
    equal_product_summary_message(product_summary_message_got, product_summary_message_sent)
  }
}

/* Order Details: encoded, read back, and compared */
proctype check_order_details() {
  OrderDetails order_details_sent;
  OrderDetails order_details_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_details(order_details_sent, 0)
  :: pattern == 1 -> fill_order_details(order_details_sent, 32)
  :: pattern == 2 -> fill_order_details(order_details_sent, 255)
  :: else -> ramp_order_details(order_details_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_details(order_details_sent);
    assert(at == 32);
    at = 0;
    decode_order_details(order_details_got);
    assert(at == 32);
    equal_order_details(order_details_got, order_details_sent)
  }
}

/* Snapshot Order Message: encoded, read back, and compared */
proctype check_snapshot_order_message() {
  SnapshotOrderMessage snapshot_order_message_sent;
  SnapshotOrderMessage snapshot_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_order_message(snapshot_order_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_order_message(snapshot_order_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_order_message(snapshot_order_message_sent, 255)
  :: else -> ramp_snapshot_order_message(snapshot_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_order_message(snapshot_order_message_sent);
    assert(at == 32);
    at = 0;
    decode_snapshot_order_message(snapshot_order_message_got);
    assert(at == 32);
    equal_snapshot_order_message(snapshot_order_message_got, snapshot_order_message_sent)
  }
}

/* Auction Best Bid Offer Message: encoded, read back, and compared */
proctype check_auction_best_bid_offer_message() {
  AuctionBestBidOfferMessage auction_best_bid_offer_message_sent;
  AuctionBestBidOfferMessage auction_best_bid_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_best_bid_offer_message(auction_best_bid_offer_message_sent, 0)
  :: pattern == 1 -> fill_auction_best_bid_offer_message(auction_best_bid_offer_message_sent, 32)
  :: pattern == 2 -> fill_auction_best_bid_offer_message(auction_best_bid_offer_message_sent, 255)
  :: else -> ramp_auction_best_bid_offer_message(auction_best_bid_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_best_bid_offer_message(auction_best_bid_offer_message_sent);
    assert(at == 32);
    at = 0;
    decode_auction_best_bid_offer_message(auction_best_bid_offer_message_got);
    assert(at == 32);
    equal_auction_best_bid_offer_message(auction_best_bid_offer_message_got, auction_best_bid_offer_message_sent)
  }
}

/* Auction Clearing Price Message: encoded, read back, and compared */
proctype check_auction_clearing_price_message() {
  AuctionClearingPriceMessage auction_clearing_price_message_sent;
  AuctionClearingPriceMessage auction_clearing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_clearing_price_message(auction_clearing_price_message_sent, 0)
  :: pattern == 1 -> fill_auction_clearing_price_message(auction_clearing_price_message_sent, 32)
  :: pattern == 2 -> fill_auction_clearing_price_message(auction_clearing_price_message_sent, 255)
  :: else -> ramp_auction_clearing_price_message(auction_clearing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_clearing_price_message(auction_clearing_price_message_sent);
    assert(at == 32);
    at = 0;
    decode_auction_clearing_price_message(auction_clearing_price_message_got);
    assert(at == 32);
    equal_auction_clearing_price_message(auction_clearing_price_message_got, auction_clearing_price_message_sent)
  }
}

/* Top Of Book Message: encoded, read back, and compared */
proctype check_top_of_book_message() {
  TopOfBookMessage top_of_book_message_sent;
  TopOfBookMessage top_of_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_book_message(top_of_book_message_sent, 0)
  :: pattern == 1 -> fill_top_of_book_message(top_of_book_message_sent, 32)
  :: pattern == 2 -> fill_top_of_book_message(top_of_book_message_sent, 255)
  :: else -> ramp_top_of_book_message(top_of_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_book_message(top_of_book_message_sent);
    assert(at == 32);
    at = 0;
    decode_top_of_book_message(top_of_book_message_got);
    assert(at == 32);
    equal_top_of_book_message(top_of_book_message_got, top_of_book_message_sent)
  }
}

/* Order Add Message: encoded, read back, and compared */
proctype check_order_add_message() {
  OrderAddMessage order_add_message_sent;
  OrderAddMessage order_add_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_add_message(order_add_message_sent, 0)
  :: pattern == 1 -> fill_order_add_message(order_add_message_sent, 32)
  :: pattern == 2 -> fill_order_add_message(order_add_message_sent, 255)
  :: else -> ramp_order_add_message(order_add_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_add_message(order_add_message_sent);
    assert(at == 48);
    at = 0;
    decode_order_add_message(order_add_message_got);
    assert(at == 48);
    equal_order_add_message(order_add_message_got, order_add_message_sent)
  }
}

/* Order Modify Message: encoded, read back, and compared */
proctype check_order_modify_message() {
  OrderModifyMessage order_modify_message_sent;
  OrderModifyMessage order_modify_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modify_message(order_modify_message_sent, 0)
  :: pattern == 1 -> fill_order_modify_message(order_modify_message_sent, 32)
  :: pattern == 2 -> fill_order_modify_message(order_modify_message_sent, 255)
  :: else -> ramp_order_modify_message(order_modify_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modify_message(order_modify_message_sent);
    assert(at == 72);
    at = 0;
    decode_order_modify_message(order_modify_message_got);
    assert(at == 72);
    equal_order_modify_message(order_modify_message_got, order_modify_message_sent)
  }
}

/* Order Modify Same Priority Message: encoded, read back, and compared */
proctype check_order_modify_same_priority_message() {
  OrderModifySamePriorityMessage order_modify_same_priority_message_sent;
  OrderModifySamePriorityMessage order_modify_same_priority_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modify_same_priority_message(order_modify_same_priority_message_sent, 0)
  :: pattern == 1 -> fill_order_modify_same_priority_message(order_modify_same_priority_message_sent, 32)
  :: pattern == 2 -> fill_order_modify_same_priority_message(order_modify_same_priority_message_sent, 255)
  :: else -> ramp_order_modify_same_priority_message(order_modify_same_priority_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modify_same_priority_message(order_modify_same_priority_message_sent);
    assert(at == 64);
    at = 0;
    decode_order_modify_same_priority_message(order_modify_same_priority_message_got);
    assert(at == 64);
    equal_order_modify_same_priority_message(order_modify_same_priority_message_got, order_modify_same_priority_message_sent)
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
    assert(at == 56);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 56);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Order Mass Delete Message: encoded, read back, and compared */
proctype check_order_mass_delete_message() {
  OrderMassDeleteMessage order_mass_delete_message_sent;
  OrderMassDeleteMessage order_mass_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_delete_message(order_mass_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_mass_delete_message(order_mass_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_mass_delete_message(order_mass_delete_message_sent, 255)
  :: else -> ramp_order_mass_delete_message(order_mass_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_delete_message(order_mass_delete_message_sent);
    assert(at == 16);
    at = 0;
    decode_order_mass_delete_message(order_mass_delete_message_got);
    assert(at == 16);
    equal_order_mass_delete_message(order_mass_delete_message_got, order_mass_delete_message_sent)
  }
}

/* Partial Order Execution Message: encoded, read back, and compared */
proctype check_partial_order_execution_message() {
  PartialOrderExecutionMessage partial_order_execution_message_sent;
  PartialOrderExecutionMessage partial_order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_partial_order_execution_message(partial_order_execution_message_sent, 0)
  :: pattern == 1 -> fill_partial_order_execution_message(partial_order_execution_message_sent, 32)
  :: pattern == 2 -> fill_partial_order_execution_message(partial_order_execution_message_sent, 255)
  :: else -> ramp_partial_order_execution_message(partial_order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_partial_order_execution_message(partial_order_execution_message_sent);
    assert(at == 56);
    at = 0;
    decode_partial_order_execution_message(partial_order_execution_message_got);
    assert(at == 56);
    equal_partial_order_execution_message(partial_order_execution_message_got, partial_order_execution_message_sent)
  }
}

/* Full Order Execution Message: encoded, read back, and compared */
proctype check_full_order_execution_message() {
  FullOrderExecutionMessage full_order_execution_message_sent;
  FullOrderExecutionMessage full_order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_full_order_execution_message(full_order_execution_message_sent, 0)
  :: pattern == 1 -> fill_full_order_execution_message(full_order_execution_message_sent, 32)
  :: pattern == 2 -> fill_full_order_execution_message(full_order_execution_message_sent, 255)
  :: else -> ramp_full_order_execution_message(full_order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_full_order_execution_message(full_order_execution_message_sent);
    assert(at == 56);
    at = 0;
    decode_full_order_execution_message(full_order_execution_message_got);
    assert(at == 56);
    equal_full_order_execution_message(full_order_execution_message_got, full_order_execution_message_sent)
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
    assert(at == 56);
    at = 0;
    decode_execution_summary_message(execution_summary_message_got);
    assert(at == 56);
    equal_execution_summary_message(execution_summary_message_got, execution_summary_message_sent)
  }
}

/* Instrument Info Message: encoded, read back, and compared */
proctype check_instrument_info_message() {
  InstrumentInfoMessage instrument_info_message_sent;
  InstrumentInfoMessage instrument_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_info_message(instrument_info_message_sent, 0)
  :: pattern == 1 -> fill_instrument_info_message(instrument_info_message_sent, 32)
  :: pattern == 2 -> fill_instrument_info_message(instrument_info_message_sent, 255)
  :: else -> ramp_instrument_info_message(instrument_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_info_message(instrument_info_message_sent);
    assert(at == 40);
    at = 0;
    decode_instrument_info_message(instrument_info_message_got);
    assert(at == 40);
    equal_instrument_info_message(instrument_info_message_got, instrument_info_message_sent)
  }
}

/* Lpp Range Message: encoded, read back, and compared */
proctype check_lpp_range_message() {
  LppRangeMessage lpp_range_message_sent;
  LppRangeMessage lpp_range_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_lpp_range_message(lpp_range_message_sent, 0)
  :: pattern == 1 -> fill_lpp_range_message(lpp_range_message_sent, 32)
  :: pattern == 2 -> fill_lpp_range_message(lpp_range_message_sent, 255)
  :: else -> ramp_lpp_range_message(lpp_range_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_lpp_range_message(lpp_range_message_sent);
    assert(at == 24);
    at = 0;
    decode_lpp_range_message(lpp_range_message_got);
    assert(at == 24);
    equal_lpp_range_message(lpp_range_message_got, lpp_range_message_sent)
  }
}

/* Product State Change Message: encoded, read back, and compared */
proctype check_product_state_change_message() {
  ProductStateChangeMessage product_state_change_message_sent;
  ProductStateChangeMessage product_state_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_product_state_change_message(product_state_change_message_sent, 0)
  :: pattern == 1 -> fill_product_state_change_message(product_state_change_message_sent, 32)
  :: pattern == 2 -> fill_product_state_change_message(product_state_change_message_sent, 255)
  :: else -> ramp_product_state_change_message(product_state_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_product_state_change_message(product_state_change_message_sent);
    assert(at == 16);
    at = 0;
    decode_product_state_change_message(product_state_change_message_got);
    assert(at == 16);
    equal_product_state_change_message(product_state_change_message_got, product_state_change_message_sent)
  }
}

/* Instrument State Change Message: encoded, read back, and compared */
proctype check_instrument_state_change_message() {
  InstrumentStateChangeMessage instrument_state_change_message_sent;
  InstrumentStateChangeMessage instrument_state_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_state_change_message(instrument_state_change_message_sent, 0)
  :: pattern == 1 -> fill_instrument_state_change_message(instrument_state_change_message_sent, 32)
  :: pattern == 2 -> fill_instrument_state_change_message(instrument_state_change_message_sent, 255)
  :: else -> ramp_instrument_state_change_message(instrument_state_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_state_change_message(instrument_state_change_message_sent);
    assert(at == 24);
    at = 0;
    decode_instrument_state_change_message(instrument_state_change_message_got);
    assert(at == 24);
    equal_instrument_state_change_message(instrument_state_change_message_got, instrument_state_change_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_eobi_header()
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_heartbeat_message()
  :: run check_product_summary_message()
  :: run check_order_details()
  :: run check_snapshot_order_message()
  :: run check_auction_best_bid_offer_message()
  :: run check_auction_clearing_price_message()
  :: run check_top_of_book_message()
  :: run check_order_add_message()
  :: run check_order_modify_message()
  :: run check_order_modify_same_priority_message()
  :: run check_order_delete_message()
  :: run check_order_mass_delete_message()
  :: run check_partial_order_execution_message()
  :: run check_full_order_execution_message()
  :: run check_execution_summary_message()
  :: run check_instrument_info_message()
  :: run check_lpp_range_message()
  :: run check_product_state_change_message()
  :: run check_instrument_state_change_message()
  fi
}
