/*
 * Eurex Exchange Enhanced Order Book Interface
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
#define WIRE 64

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Eobi Header: 8 bytes ---------------------------------------------------- */

/* EOBI PacketHeader MessageHeaderComp (BodyLen + TemplateID + MsgSeqNum) — first 8 bytes of every Eurex T7 EOBI packet. */
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

/* Eurex Eobi Packet Header */
typedef PacketHeader {
  EobiHeader eobi_header;
  byte appl_seq_num[4];
  byte market_segment_id[4];
  byte partition_id;
  byte completion_indicator;
  byte appl_seq_reset_indicator;
  byte pad5[5];
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
  :: packet_header_at < 5 -> packet_header_record.pad5[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 5 -> packet_header_record.pad5[packet_header_at] = (packet_header_base + 19 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 5 -> wire[at] = packet_header_record.pad5[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 5 -> packet_header_record.pad5[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 5 -> assert(packet_header_read.pad5[packet_header_at] == packet_header_written.pad5[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.transact_time[packet_header_at] == packet_header_written.transact_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header Comp: 8 bytes -------------------------------------------- */

typedef MessageHeaderComp {
  byte body_len[2];
  byte template_id[2];
  byte msg_seq_num[4]
};

int message_header_comp_at;

/* every byte of Message Header Comp set to one value */
inline fill_message_header_comp(message_header_comp_record, message_header_comp_value) {
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> message_header_comp_record.body_len[message_header_comp_at] = message_header_comp_value; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> message_header_comp_record.template_id[message_header_comp_at] = message_header_comp_value; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 4 -> message_header_comp_record.msg_seq_num[message_header_comp_at] = message_header_comp_value; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header Comp set to where it lies, so a field read out of place says so */
inline ramp_message_header_comp(message_header_comp_record, message_header_comp_base) {
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> message_header_comp_record.body_len[message_header_comp_at] = (message_header_comp_base + 0 + message_header_comp_at + 1) % 256; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> message_header_comp_record.template_id[message_header_comp_at] = (message_header_comp_base + 2 + message_header_comp_at + 1) % 256; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 4 -> message_header_comp_record.msg_seq_num[message_header_comp_at] = (message_header_comp_base + 4 + message_header_comp_at + 1) % 256; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header Comp to the wire, 8 bytes from where the cursor stands */
inline encode_message_header_comp(message_header_comp_record) {
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> wire[at] = message_header_comp_record.body_len[message_header_comp_at]; at = at + 1; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> wire[at] = message_header_comp_record.template_id[message_header_comp_at]; at = at + 1; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 4 -> wire[at] = message_header_comp_record.msg_seq_num[message_header_comp_at]; at = at + 1; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header Comp off the wire, 8 bytes from where the cursor stands */
inline decode_message_header_comp(message_header_comp_record) {
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> message_header_comp_record.body_len[message_header_comp_at] = wire[at]; at = at + 1; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> message_header_comp_record.template_id[message_header_comp_at] = wire[at]; at = at + 1; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 4 -> message_header_comp_record.msg_seq_num[message_header_comp_at] = wire[at]; at = at + 1; message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header Comp is what was written, byte for byte */
inline equal_message_header_comp(message_header_comp_read, message_header_comp_written) {
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> assert(message_header_comp_read.body_len[message_header_comp_at] == message_header_comp_written.body_len[message_header_comp_at]); message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 2 -> assert(message_header_comp_read.template_id[message_header_comp_at] == message_header_comp_written.template_id[message_header_comp_at]); message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  message_header_comp_at = 0;
  do
  :: message_header_comp_at < 4 -> assert(message_header_comp_read.msg_seq_num[message_header_comp_at] == message_header_comp_written.msg_seq_num[message_header_comp_at]); message_header_comp_at = message_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Bbo: 32 bytes --------------------------------------------------- */

typedef AuctionBbo {
  byte transact_time[8];
  byte security_id[8];
  byte bid_px[8];
  byte offer_px[8]
};

int auction_bbo_at;

/* every byte of Auction Bbo set to one value */
inline fill_auction_bbo(auction_bbo_record, auction_bbo_value) {
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.transact_time[auction_bbo_at] = auction_bbo_value; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.security_id[auction_bbo_at] = auction_bbo_value; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.bid_px[auction_bbo_at] = auction_bbo_value; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.offer_px[auction_bbo_at] = auction_bbo_value; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Bbo set to where it lies, so a field read out of place says so */
inline ramp_auction_bbo(auction_bbo_record, auction_bbo_base) {
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.transact_time[auction_bbo_at] = (auction_bbo_base + 0 + auction_bbo_at + 1) % 256; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.security_id[auction_bbo_at] = (auction_bbo_base + 8 + auction_bbo_at + 1) % 256; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.bid_px[auction_bbo_at] = (auction_bbo_base + 16 + auction_bbo_at + 1) % 256; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.offer_px[auction_bbo_at] = (auction_bbo_base + 24 + auction_bbo_at + 1) % 256; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Bbo to the wire, 32 bytes from where the cursor stands */
inline encode_auction_bbo(auction_bbo_record) {
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> wire[at] = auction_bbo_record.transact_time[auction_bbo_at]; at = at + 1; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> wire[at] = auction_bbo_record.security_id[auction_bbo_at]; at = at + 1; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> wire[at] = auction_bbo_record.bid_px[auction_bbo_at]; at = at + 1; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> wire[at] = auction_bbo_record.offer_px[auction_bbo_at]; at = at + 1; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Bbo off the wire, 32 bytes from where the cursor stands */
inline decode_auction_bbo(auction_bbo_record) {
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.transact_time[auction_bbo_at] = wire[at]; at = at + 1; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.security_id[auction_bbo_at] = wire[at]; at = at + 1; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.bid_px[auction_bbo_at] = wire[at]; at = at + 1; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> auction_bbo_record.offer_px[auction_bbo_at] = wire[at]; at = at + 1; auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Bbo is what was written, byte for byte */
inline equal_auction_bbo(auction_bbo_read, auction_bbo_written) {
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> assert(auction_bbo_read.transact_time[auction_bbo_at] == auction_bbo_written.transact_time[auction_bbo_at]); auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> assert(auction_bbo_read.security_id[auction_bbo_at] == auction_bbo_written.security_id[auction_bbo_at]); auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> assert(auction_bbo_read.bid_px[auction_bbo_at] == auction_bbo_written.bid_px[auction_bbo_at]); auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  auction_bbo_at = 0;
  do
  :: auction_bbo_at < 8 -> assert(auction_bbo_read.offer_px[auction_bbo_at] == auction_bbo_written.offer_px[auction_bbo_at]); auction_bbo_at = auction_bbo_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Clearing Price: 24 bytes ---------------------------------------- */

typedef AuctionClearingPrice {
  byte transact_time[8];
  byte security_id[8];
  byte last_px[8]
};

int auction_clearing_price_at;

/* every byte of Auction Clearing Price set to one value */
inline fill_auction_clearing_price(auction_clearing_price_record, auction_clearing_price_value) {
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> auction_clearing_price_record.transact_time[auction_clearing_price_at] = auction_clearing_price_value; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> auction_clearing_price_record.security_id[auction_clearing_price_at] = auction_clearing_price_value; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> auction_clearing_price_record.last_px[auction_clearing_price_at] = auction_clearing_price_value; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Clearing Price set to where it lies, so a field read out of place says so */
inline ramp_auction_clearing_price(auction_clearing_price_record, auction_clearing_price_base) {
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> auction_clearing_price_record.transact_time[auction_clearing_price_at] = (auction_clearing_price_base + 0 + auction_clearing_price_at + 1) % 256; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> auction_clearing_price_record.security_id[auction_clearing_price_at] = (auction_clearing_price_base + 8 + auction_clearing_price_at + 1) % 256; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> auction_clearing_price_record.last_px[auction_clearing_price_at] = (auction_clearing_price_base + 16 + auction_clearing_price_at + 1) % 256; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Clearing Price to the wire, 24 bytes from where the cursor stands */
inline encode_auction_clearing_price(auction_clearing_price_record) {
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> wire[at] = auction_clearing_price_record.transact_time[auction_clearing_price_at]; at = at + 1; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> wire[at] = auction_clearing_price_record.security_id[auction_clearing_price_at]; at = at + 1; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> wire[at] = auction_clearing_price_record.last_px[auction_clearing_price_at]; at = at + 1; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Clearing Price off the wire, 24 bytes from where the cursor stands */
inline decode_auction_clearing_price(auction_clearing_price_record) {
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> auction_clearing_price_record.transact_time[auction_clearing_price_at] = wire[at]; at = at + 1; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> auction_clearing_price_record.security_id[auction_clearing_price_at] = wire[at]; at = at + 1; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> auction_clearing_price_record.last_px[auction_clearing_price_at] = wire[at]; at = at + 1; auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Clearing Price is what was written, byte for byte */
inline equal_auction_clearing_price(auction_clearing_price_read, auction_clearing_price_written) {
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> assert(auction_clearing_price_read.transact_time[auction_clearing_price_at] == auction_clearing_price_written.transact_time[auction_clearing_price_at]); auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> assert(auction_clearing_price_read.security_id[auction_clearing_price_at] == auction_clearing_price_written.security_id[auction_clearing_price_at]); auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  auction_clearing_price_at = 0;
  do
  :: auction_clearing_price_at < 8 -> assert(auction_clearing_price_read.last_px[auction_clearing_price_at] == auction_clearing_price_written.last_px[auction_clearing_price_at]); auction_clearing_price_at = auction_clearing_price_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Request: 24 bytes ------------------------------------------------- */

typedef CrossRequest {
  byte security_id[8];
  byte last_qty[4];
  byte pad4[4];
  byte transact_time[8]
};

int cross_request_at;

/* every byte of Cross Request set to one value */
inline fill_cross_request(cross_request_record, cross_request_value) {
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> cross_request_record.security_id[cross_request_at] = cross_request_value; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> cross_request_record.last_qty[cross_request_at] = cross_request_value; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> cross_request_record.pad4[cross_request_at] = cross_request_value; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> cross_request_record.transact_time[cross_request_at] = cross_request_value; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Request set to where it lies, so a field read out of place says so */
inline ramp_cross_request(cross_request_record, cross_request_base) {
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> cross_request_record.security_id[cross_request_at] = (cross_request_base + 0 + cross_request_at + 1) % 256; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> cross_request_record.last_qty[cross_request_at] = (cross_request_base + 8 + cross_request_at + 1) % 256; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> cross_request_record.pad4[cross_request_at] = (cross_request_base + 12 + cross_request_at + 1) % 256; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> cross_request_record.transact_time[cross_request_at] = (cross_request_base + 16 + cross_request_at + 1) % 256; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Request to the wire, 24 bytes from where the cursor stands */
inline encode_cross_request(cross_request_record) {
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> wire[at] = cross_request_record.security_id[cross_request_at]; at = at + 1; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> wire[at] = cross_request_record.last_qty[cross_request_at]; at = at + 1; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> wire[at] = cross_request_record.pad4[cross_request_at]; at = at + 1; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> wire[at] = cross_request_record.transact_time[cross_request_at]; at = at + 1; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Request off the wire, 24 bytes from where the cursor stands */
inline decode_cross_request(cross_request_record) {
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> cross_request_record.security_id[cross_request_at] = wire[at]; at = at + 1; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> cross_request_record.last_qty[cross_request_at] = wire[at]; at = at + 1; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> cross_request_record.pad4[cross_request_at] = wire[at]; at = at + 1; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> cross_request_record.transact_time[cross_request_at] = wire[at]; at = at + 1; cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Request is what was written, byte for byte */
inline equal_cross_request(cross_request_read, cross_request_written) {
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> assert(cross_request_read.security_id[cross_request_at] == cross_request_written.security_id[cross_request_at]); cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> assert(cross_request_read.last_qty[cross_request_at] == cross_request_written.last_qty[cross_request_at]); cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 4 -> assert(cross_request_read.pad4[cross_request_at] == cross_request_written.pad4[cross_request_at]); cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  cross_request_at = 0;
  do
  :: cross_request_at < 8 -> assert(cross_request_read.transact_time[cross_request_at] == cross_request_written.transact_time[cross_request_at]); cross_request_at = cross_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Summary: 56 bytes --------------------------------------------- */

typedef ExecutionSummary {
  byte security_id[8];
  byte aggressor_timestamp[8];
  byte request_time[8];
  byte exec_id[8];
  byte last_qty[4];
  byte aggressor_side;
  byte trade_condition;
  byte pad2[2];
  byte last_px[8];
  byte resting_hidden_qty[4];
  byte pad4[4]
};

int execution_summary_at;

/* every byte of Execution Summary set to one value */
inline fill_execution_summary(execution_summary_record, execution_summary_value) {
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.security_id[execution_summary_at] = execution_summary_value; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.aggressor_timestamp[execution_summary_at] = execution_summary_value; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.request_time[execution_summary_at] = execution_summary_value; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.exec_id[execution_summary_at] = execution_summary_value; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> execution_summary_record.last_qty[execution_summary_at] = execution_summary_value; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_record.aggressor_side = execution_summary_value;
  execution_summary_record.trade_condition = execution_summary_value;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 2 -> execution_summary_record.pad2[execution_summary_at] = execution_summary_value; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.last_px[execution_summary_at] = execution_summary_value; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> execution_summary_record.resting_hidden_qty[execution_summary_at] = execution_summary_value; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> execution_summary_record.pad4[execution_summary_at] = execution_summary_value; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Summary set to where it lies, so a field read out of place says so */
inline ramp_execution_summary(execution_summary_record, execution_summary_base) {
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.security_id[execution_summary_at] = (execution_summary_base + 0 + execution_summary_at + 1) % 256; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.aggressor_timestamp[execution_summary_at] = (execution_summary_base + 8 + execution_summary_at + 1) % 256; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.request_time[execution_summary_at] = (execution_summary_base + 16 + execution_summary_at + 1) % 256; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.exec_id[execution_summary_at] = (execution_summary_base + 24 + execution_summary_at + 1) % 256; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> execution_summary_record.last_qty[execution_summary_at] = (execution_summary_base + 32 + execution_summary_at + 1) % 256; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_record.aggressor_side = (execution_summary_base + 36 + 1) % 256;
  execution_summary_record.trade_condition = (execution_summary_base + 37 + 1) % 256;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 2 -> execution_summary_record.pad2[execution_summary_at] = (execution_summary_base + 38 + execution_summary_at + 1) % 256; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.last_px[execution_summary_at] = (execution_summary_base + 40 + execution_summary_at + 1) % 256; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> execution_summary_record.resting_hidden_qty[execution_summary_at] = (execution_summary_base + 48 + execution_summary_at + 1) % 256; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> execution_summary_record.pad4[execution_summary_at] = (execution_summary_base + 52 + execution_summary_at + 1) % 256; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary to the wire, 56 bytes from where the cursor stands */
inline encode_execution_summary(execution_summary_record) {
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> wire[at] = execution_summary_record.security_id[execution_summary_at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> wire[at] = execution_summary_record.aggressor_timestamp[execution_summary_at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> wire[at] = execution_summary_record.request_time[execution_summary_at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> wire[at] = execution_summary_record.exec_id[execution_summary_at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> wire[at] = execution_summary_record.last_qty[execution_summary_at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  wire[at] = execution_summary_record.aggressor_side; at = at + 1;
  wire[at] = execution_summary_record.trade_condition; at = at + 1;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 2 -> wire[at] = execution_summary_record.pad2[execution_summary_at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> wire[at] = execution_summary_record.last_px[execution_summary_at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> wire[at] = execution_summary_record.resting_hidden_qty[execution_summary_at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> wire[at] = execution_summary_record.pad4[execution_summary_at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary off the wire, 56 bytes from where the cursor stands */
inline decode_execution_summary(execution_summary_record) {
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.security_id[execution_summary_at] = wire[at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.aggressor_timestamp[execution_summary_at] = wire[at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.request_time[execution_summary_at] = wire[at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.exec_id[execution_summary_at] = wire[at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> execution_summary_record.last_qty[execution_summary_at] = wire[at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_record.aggressor_side = wire[at]; at = at + 1;
  execution_summary_record.trade_condition = wire[at]; at = at + 1;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 2 -> execution_summary_record.pad2[execution_summary_at] = wire[at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> execution_summary_record.last_px[execution_summary_at] = wire[at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> execution_summary_record.resting_hidden_qty[execution_summary_at] = wire[at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> execution_summary_record.pad4[execution_summary_at] = wire[at]; at = at + 1; execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Summary is what was written, byte for byte */
inline equal_execution_summary(execution_summary_read, execution_summary_written) {
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> assert(execution_summary_read.security_id[execution_summary_at] == execution_summary_written.security_id[execution_summary_at]); execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> assert(execution_summary_read.aggressor_timestamp[execution_summary_at] == execution_summary_written.aggressor_timestamp[execution_summary_at]); execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> assert(execution_summary_read.request_time[execution_summary_at] == execution_summary_written.request_time[execution_summary_at]); execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> assert(execution_summary_read.exec_id[execution_summary_at] == execution_summary_written.exec_id[execution_summary_at]); execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> assert(execution_summary_read.last_qty[execution_summary_at] == execution_summary_written.last_qty[execution_summary_at]); execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  assert(execution_summary_read.aggressor_side == execution_summary_written.aggressor_side);
  assert(execution_summary_read.trade_condition == execution_summary_written.trade_condition);
  execution_summary_at = 0;
  do
  :: execution_summary_at < 2 -> assert(execution_summary_read.pad2[execution_summary_at] == execution_summary_written.pad2[execution_summary_at]); execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 8 -> assert(execution_summary_read.last_px[execution_summary_at] == execution_summary_written.last_px[execution_summary_at]); execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> assert(execution_summary_read.resting_hidden_qty[execution_summary_at] == execution_summary_written.resting_hidden_qty[execution_summary_at]); execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  execution_summary_at = 0;
  do
  :: execution_summary_at < 4 -> assert(execution_summary_read.pad4[execution_summary_at] == execution_summary_written.pad4[execution_summary_at]); execution_summary_at = execution_summary_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Full Order Execution: 48 bytes ------------------------------------------ */

typedef FullOrderExecution {
  byte side;
  byte pad7[7];
  byte price[8];
  byte trd_reg_ts_time_priority[8];
  byte security_id[8];
  byte trd_match_id[4];
  byte last_qty[4];
  byte last_px[8]
};

int full_order_execution_at;

/* every byte of Full Order Execution set to one value */
inline fill_full_order_execution(full_order_execution_record, full_order_execution_value) {
  full_order_execution_record.side = full_order_execution_value;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 7 -> full_order_execution_record.pad7[full_order_execution_at] = full_order_execution_value; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.price[full_order_execution_at] = full_order_execution_value; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.trd_reg_ts_time_priority[full_order_execution_at] = full_order_execution_value; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.security_id[full_order_execution_at] = full_order_execution_value; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> full_order_execution_record.trd_match_id[full_order_execution_at] = full_order_execution_value; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> full_order_execution_record.last_qty[full_order_execution_at] = full_order_execution_value; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.last_px[full_order_execution_at] = full_order_execution_value; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Full Order Execution set to where it lies, so a field read out of place says so */
inline ramp_full_order_execution(full_order_execution_record, full_order_execution_base) {
  full_order_execution_record.side = (full_order_execution_base + 0 + 1) % 256;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 7 -> full_order_execution_record.pad7[full_order_execution_at] = (full_order_execution_base + 1 + full_order_execution_at + 1) % 256; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.price[full_order_execution_at] = (full_order_execution_base + 8 + full_order_execution_at + 1) % 256; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.trd_reg_ts_time_priority[full_order_execution_at] = (full_order_execution_base + 16 + full_order_execution_at + 1) % 256; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.security_id[full_order_execution_at] = (full_order_execution_base + 24 + full_order_execution_at + 1) % 256; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> full_order_execution_record.trd_match_id[full_order_execution_at] = (full_order_execution_base + 32 + full_order_execution_at + 1) % 256; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> full_order_execution_record.last_qty[full_order_execution_at] = (full_order_execution_base + 36 + full_order_execution_at + 1) % 256; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.last_px[full_order_execution_at] = (full_order_execution_base + 40 + full_order_execution_at + 1) % 256; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* Full Order Execution to the wire, 48 bytes from where the cursor stands */
inline encode_full_order_execution(full_order_execution_record) {
  wire[at] = full_order_execution_record.side; at = at + 1;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 7 -> wire[at] = full_order_execution_record.pad7[full_order_execution_at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> wire[at] = full_order_execution_record.price[full_order_execution_at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> wire[at] = full_order_execution_record.trd_reg_ts_time_priority[full_order_execution_at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> wire[at] = full_order_execution_record.security_id[full_order_execution_at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> wire[at] = full_order_execution_record.trd_match_id[full_order_execution_at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> wire[at] = full_order_execution_record.last_qty[full_order_execution_at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> wire[at] = full_order_execution_record.last_px[full_order_execution_at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* Full Order Execution off the wire, 48 bytes from where the cursor stands */
inline decode_full_order_execution(full_order_execution_record) {
  full_order_execution_record.side = wire[at]; at = at + 1;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 7 -> full_order_execution_record.pad7[full_order_execution_at] = wire[at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.price[full_order_execution_at] = wire[at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.trd_reg_ts_time_priority[full_order_execution_at] = wire[at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.security_id[full_order_execution_at] = wire[at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> full_order_execution_record.trd_match_id[full_order_execution_at] = wire[at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> full_order_execution_record.last_qty[full_order_execution_at] = wire[at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> full_order_execution_record.last_px[full_order_execution_at] = wire[at]; at = at + 1; full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Full Order Execution is what was written, byte for byte */
inline equal_full_order_execution(full_order_execution_read, full_order_execution_written) {
  assert(full_order_execution_read.side == full_order_execution_written.side);
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 7 -> assert(full_order_execution_read.pad7[full_order_execution_at] == full_order_execution_written.pad7[full_order_execution_at]); full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> assert(full_order_execution_read.price[full_order_execution_at] == full_order_execution_written.price[full_order_execution_at]); full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> assert(full_order_execution_read.trd_reg_ts_time_priority[full_order_execution_at] == full_order_execution_written.trd_reg_ts_time_priority[full_order_execution_at]); full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> assert(full_order_execution_read.security_id[full_order_execution_at] == full_order_execution_written.security_id[full_order_execution_at]); full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> assert(full_order_execution_read.trd_match_id[full_order_execution_at] == full_order_execution_written.trd_match_id[full_order_execution_at]); full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 4 -> assert(full_order_execution_read.last_qty[full_order_execution_at] == full_order_execution_written.last_qty[full_order_execution_at]); full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  full_order_execution_at = 0;
  do
  :: full_order_execution_at < 8 -> assert(full_order_execution_read.last_px[full_order_execution_at] == full_order_execution_written.last_px[full_order_execution_at]); full_order_execution_at = full_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat: 8 bytes ------------------------------------------------------ */

typedef Heartbeat {
  byte last_msg_seq_num_processed[4];
  byte pad4[4]
};

int heartbeat_at;

/* every byte of Heartbeat set to one value */
inline fill_heartbeat(heartbeat_record, heartbeat_value) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> heartbeat_record.last_msg_seq_num_processed[heartbeat_at] = heartbeat_value; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> heartbeat_record.pad4[heartbeat_at] = heartbeat_value; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat set to where it lies, so a field read out of place says so */
inline ramp_heartbeat(heartbeat_record, heartbeat_base) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> heartbeat_record.last_msg_seq_num_processed[heartbeat_at] = (heartbeat_base + 0 + heartbeat_at + 1) % 256; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> heartbeat_record.pad4[heartbeat_at] = (heartbeat_base + 4 + heartbeat_at + 1) % 256; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat to the wire, 8 bytes from where the cursor stands */
inline encode_heartbeat(heartbeat_record) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> wire[at] = heartbeat_record.last_msg_seq_num_processed[heartbeat_at]; at = at + 1; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> wire[at] = heartbeat_record.pad4[heartbeat_at]; at = at + 1; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat off the wire, 8 bytes from where the cursor stands */
inline decode_heartbeat(heartbeat_record) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> heartbeat_record.last_msg_seq_num_processed[heartbeat_at] = wire[at]; at = at + 1; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> heartbeat_record.pad4[heartbeat_at] = wire[at]; at = at + 1; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat is what was written, byte for byte */
inline equal_heartbeat(heartbeat_read, heartbeat_written) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> assert(heartbeat_read.last_msg_seq_num_processed[heartbeat_at] == heartbeat_written.last_msg_seq_num_processed[heartbeat_at]); heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> assert(heartbeat_read.pad4[heartbeat_at] == heartbeat_written.pad4[heartbeat_at]); heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument State Change: 24 bytes --------------------------------------- */

typedef InstrumentStateChange {
  byte security_id[8];
  byte security_status;
  byte security_trading_status;
  byte fast_market_indicator;
  byte pad5[5];
  byte transact_time[8]
};

int instrument_state_change_at;

/* every byte of Instrument State Change set to one value */
inline fill_instrument_state_change(instrument_state_change_record, instrument_state_change_value) {
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> instrument_state_change_record.security_id[instrument_state_change_at] = instrument_state_change_value; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_record.security_status = instrument_state_change_value;
  instrument_state_change_record.security_trading_status = instrument_state_change_value;
  instrument_state_change_record.fast_market_indicator = instrument_state_change_value;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 5 -> instrument_state_change_record.pad5[instrument_state_change_at] = instrument_state_change_value; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> instrument_state_change_record.transact_time[instrument_state_change_at] = instrument_state_change_value; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument State Change set to where it lies, so a field read out of place says so */
inline ramp_instrument_state_change(instrument_state_change_record, instrument_state_change_base) {
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> instrument_state_change_record.security_id[instrument_state_change_at] = (instrument_state_change_base + 0 + instrument_state_change_at + 1) % 256; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_record.security_status = (instrument_state_change_base + 8 + 1) % 256;
  instrument_state_change_record.security_trading_status = (instrument_state_change_base + 9 + 1) % 256;
  instrument_state_change_record.fast_market_indicator = (instrument_state_change_base + 10 + 1) % 256;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 5 -> instrument_state_change_record.pad5[instrument_state_change_at] = (instrument_state_change_base + 11 + instrument_state_change_at + 1) % 256; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> instrument_state_change_record.transact_time[instrument_state_change_at] = (instrument_state_change_base + 16 + instrument_state_change_at + 1) % 256; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument State Change to the wire, 24 bytes from where the cursor stands */
inline encode_instrument_state_change(instrument_state_change_record) {
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> wire[at] = instrument_state_change_record.security_id[instrument_state_change_at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  wire[at] = instrument_state_change_record.security_status; at = at + 1;
  wire[at] = instrument_state_change_record.security_trading_status; at = at + 1;
  wire[at] = instrument_state_change_record.fast_market_indicator; at = at + 1;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 5 -> wire[at] = instrument_state_change_record.pad5[instrument_state_change_at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> wire[at] = instrument_state_change_record.transact_time[instrument_state_change_at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument State Change off the wire, 24 bytes from where the cursor stands */
inline decode_instrument_state_change(instrument_state_change_record) {
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> instrument_state_change_record.security_id[instrument_state_change_at] = wire[at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_record.security_status = wire[at]; at = at + 1;
  instrument_state_change_record.security_trading_status = wire[at]; at = at + 1;
  instrument_state_change_record.fast_market_indicator = wire[at]; at = at + 1;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 5 -> instrument_state_change_record.pad5[instrument_state_change_at] = wire[at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> instrument_state_change_record.transact_time[instrument_state_change_at] = wire[at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument State Change is what was written, byte for byte */
inline equal_instrument_state_change(instrument_state_change_read, instrument_state_change_written) {
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> assert(instrument_state_change_read.security_id[instrument_state_change_at] == instrument_state_change_written.security_id[instrument_state_change_at]); instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  assert(instrument_state_change_read.security_status == instrument_state_change_written.security_status);
  assert(instrument_state_change_read.security_trading_status == instrument_state_change_written.security_trading_status);
  assert(instrument_state_change_read.fast_market_indicator == instrument_state_change_written.fast_market_indicator);
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 5 -> assert(instrument_state_change_read.pad5[instrument_state_change_at] == instrument_state_change_written.pad5[instrument_state_change_at]); instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 8 -> assert(instrument_state_change_read.transact_time[instrument_state_change_at] == instrument_state_change_written.transact_time[instrument_state_change_at]); instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Details Comp: 24 bytes -------------------------------------------- */

typedef OrderDetailsComp {
  byte trd_reg_ts_time_priority[8];
  byte display_qty[4];
  byte side;
  byte pad3[3];
  byte price[8]
};

int order_details_comp_at;

/* every byte of Order Details Comp set to one value */
inline fill_order_details_comp(order_details_comp_record, order_details_comp_value) {
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> order_details_comp_record.trd_reg_ts_time_priority[order_details_comp_at] = order_details_comp_value; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 4 -> order_details_comp_record.display_qty[order_details_comp_at] = order_details_comp_value; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_record.side = order_details_comp_value;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 3 -> order_details_comp_record.pad3[order_details_comp_at] = order_details_comp_value; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> order_details_comp_record.price[order_details_comp_at] = order_details_comp_value; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Details Comp set to where it lies, so a field read out of place says so */
inline ramp_order_details_comp(order_details_comp_record, order_details_comp_base) {
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> order_details_comp_record.trd_reg_ts_time_priority[order_details_comp_at] = (order_details_comp_base + 0 + order_details_comp_at + 1) % 256; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 4 -> order_details_comp_record.display_qty[order_details_comp_at] = (order_details_comp_base + 8 + order_details_comp_at + 1) % 256; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_record.side = (order_details_comp_base + 12 + 1) % 256;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 3 -> order_details_comp_record.pad3[order_details_comp_at] = (order_details_comp_base + 13 + order_details_comp_at + 1) % 256; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> order_details_comp_record.price[order_details_comp_at] = (order_details_comp_base + 16 + order_details_comp_at + 1) % 256; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Order Details Comp to the wire, 24 bytes from where the cursor stands */
inline encode_order_details_comp(order_details_comp_record) {
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> wire[at] = order_details_comp_record.trd_reg_ts_time_priority[order_details_comp_at]; at = at + 1; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 4 -> wire[at] = order_details_comp_record.display_qty[order_details_comp_at]; at = at + 1; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  wire[at] = order_details_comp_record.side; at = at + 1;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 3 -> wire[at] = order_details_comp_record.pad3[order_details_comp_at]; at = at + 1; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> wire[at] = order_details_comp_record.price[order_details_comp_at]; at = at + 1; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Order Details Comp off the wire, 24 bytes from where the cursor stands */
inline decode_order_details_comp(order_details_comp_record) {
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> order_details_comp_record.trd_reg_ts_time_priority[order_details_comp_at] = wire[at]; at = at + 1; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 4 -> order_details_comp_record.display_qty[order_details_comp_at] = wire[at]; at = at + 1; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_record.side = wire[at]; at = at + 1;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 3 -> order_details_comp_record.pad3[order_details_comp_at] = wire[at]; at = at + 1; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> order_details_comp_record.price[order_details_comp_at] = wire[at]; at = at + 1; order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Details Comp is what was written, byte for byte */
inline equal_order_details_comp(order_details_comp_read, order_details_comp_written) {
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> assert(order_details_comp_read.trd_reg_ts_time_priority[order_details_comp_at] == order_details_comp_written.trd_reg_ts_time_priority[order_details_comp_at]); order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 4 -> assert(order_details_comp_read.display_qty[order_details_comp_at] == order_details_comp_written.display_qty[order_details_comp_at]); order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  assert(order_details_comp_read.side == order_details_comp_written.side);
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 3 -> assert(order_details_comp_read.pad3[order_details_comp_at] == order_details_comp_written.pad3[order_details_comp_at]); order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  order_details_comp_at = 0;
  do
  :: order_details_comp_at < 8 -> assert(order_details_comp_read.price[order_details_comp_at] == order_details_comp_written.price[order_details_comp_at]); order_details_comp_at = order_details_comp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Add: 40 bytes ----------------------------------------------------- */

typedef OrderAdd {
  byte trd_reg_ts_time_in[8];
  byte security_id[8];
  OrderDetailsComp order_details_comp
};

int order_add_at;

/* every byte of Order Add set to one value */
inline fill_order_add(order_add_record, order_add_value) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.trd_reg_ts_time_in[order_add_at] = order_add_value; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.security_id[order_add_at] = order_add_value; order_add_at = order_add_at + 1
  :: else -> break
  od;
  fill_order_details_comp(order_add_record.order_details_comp, order_add_value);
  skip
}

/* each byte of Order Add set to where it lies, so a field read out of place says so */
inline ramp_order_add(order_add_record, order_add_base) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.trd_reg_ts_time_in[order_add_at] = (order_add_base + 0 + order_add_at + 1) % 256; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.security_id[order_add_at] = (order_add_base + 8 + order_add_at + 1) % 256; order_add_at = order_add_at + 1
  :: else -> break
  od;
  ramp_order_details_comp(order_add_record.order_details_comp, order_add_base + 16);
  skip
}

/* Order Add to the wire, 40 bytes from where the cursor stands */
inline encode_order_add(order_add_record) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> wire[at] = order_add_record.trd_reg_ts_time_in[order_add_at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> wire[at] = order_add_record.security_id[order_add_at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  encode_order_details_comp(order_add_record.order_details_comp);
  skip
}

/* Order Add off the wire, 40 bytes from where the cursor stands */
inline decode_order_add(order_add_record) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.trd_reg_ts_time_in[order_add_at] = wire[at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.security_id[order_add_at] = wire[at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  decode_order_details_comp(order_add_record.order_details_comp);
  skip
}

/* what was read of Order Add is what was written, byte for byte */
inline equal_order_add(order_add_read, order_add_written) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> assert(order_add_read.trd_reg_ts_time_in[order_add_at] == order_add_written.trd_reg_ts_time_in[order_add_at]); order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> assert(order_add_read.security_id[order_add_at] == order_add_written.security_id[order_add_at]); order_add_at = order_add_at + 1
  :: else -> break
  od;
  equal_order_details_comp(order_add_read.order_details_comp, order_add_written.order_details_comp);
  skip
}

/* ---- Order Delete: 48 bytes -------------------------------------------------- */

typedef OrderDelete {
  byte trd_reg_ts_time_in[8];
  byte transact_time[8];
  byte security_id[8];
  OrderDetailsComp order_details_comp
};

int order_delete_at;

/* every byte of Order Delete set to one value */
inline fill_order_delete(order_delete_record, order_delete_value) {
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> order_delete_record.trd_reg_ts_time_in[order_delete_at] = order_delete_value; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> order_delete_record.transact_time[order_delete_at] = order_delete_value; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> order_delete_record.security_id[order_delete_at] = order_delete_value; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  fill_order_details_comp(order_delete_record.order_details_comp, order_delete_value);
  skip
}

/* each byte of Order Delete set to where it lies, so a field read out of place says so */
inline ramp_order_delete(order_delete_record, order_delete_base) {
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> order_delete_record.trd_reg_ts_time_in[order_delete_at] = (order_delete_base + 0 + order_delete_at + 1) % 256; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> order_delete_record.transact_time[order_delete_at] = (order_delete_base + 8 + order_delete_at + 1) % 256; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> order_delete_record.security_id[order_delete_at] = (order_delete_base + 16 + order_delete_at + 1) % 256; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  ramp_order_details_comp(order_delete_record.order_details_comp, order_delete_base + 24);
  skip
}

/* Order Delete to the wire, 48 bytes from where the cursor stands */
inline encode_order_delete(order_delete_record) {
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> wire[at] = order_delete_record.trd_reg_ts_time_in[order_delete_at]; at = at + 1; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> wire[at] = order_delete_record.transact_time[order_delete_at]; at = at + 1; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> wire[at] = order_delete_record.security_id[order_delete_at]; at = at + 1; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  encode_order_details_comp(order_delete_record.order_details_comp);
  skip
}

/* Order Delete off the wire, 48 bytes from where the cursor stands */
inline decode_order_delete(order_delete_record) {
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> order_delete_record.trd_reg_ts_time_in[order_delete_at] = wire[at]; at = at + 1; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> order_delete_record.transact_time[order_delete_at] = wire[at]; at = at + 1; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> order_delete_record.security_id[order_delete_at] = wire[at]; at = at + 1; order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  decode_order_details_comp(order_delete_record.order_details_comp);
  skip
}

/* what was read of Order Delete is what was written, byte for byte */
inline equal_order_delete(order_delete_read, order_delete_written) {
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> assert(order_delete_read.trd_reg_ts_time_in[order_delete_at] == order_delete_written.trd_reg_ts_time_in[order_delete_at]); order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> assert(order_delete_read.transact_time[order_delete_at] == order_delete_written.transact_time[order_delete_at]); order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  order_delete_at = 0;
  do
  :: order_delete_at < 8 -> assert(order_delete_read.security_id[order_delete_at] == order_delete_written.security_id[order_delete_at]); order_delete_at = order_delete_at + 1
  :: else -> break
  od;
  equal_order_details_comp(order_delete_read.order_details_comp, order_delete_written.order_details_comp);
  skip
}

/* ---- Order Mass Delete: 16 bytes --------------------------------------------- */

typedef OrderMassDelete {
  byte security_id[8];
  byte transact_time[8]
};

int order_mass_delete_at;

/* every byte of Order Mass Delete set to one value */
inline fill_order_mass_delete(order_mass_delete_record, order_mass_delete_value) {
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> order_mass_delete_record.security_id[order_mass_delete_at] = order_mass_delete_value; order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> order_mass_delete_record.transact_time[order_mass_delete_at] = order_mass_delete_value; order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Mass Delete set to where it lies, so a field read out of place says so */
inline ramp_order_mass_delete(order_mass_delete_record, order_mass_delete_base) {
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> order_mass_delete_record.security_id[order_mass_delete_at] = (order_mass_delete_base + 0 + order_mass_delete_at + 1) % 256; order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> order_mass_delete_record.transact_time[order_mass_delete_at] = (order_mass_delete_base + 8 + order_mass_delete_at + 1) % 256; order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Delete to the wire, 16 bytes from where the cursor stands */
inline encode_order_mass_delete(order_mass_delete_record) {
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> wire[at] = order_mass_delete_record.security_id[order_mass_delete_at]; at = at + 1; order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> wire[at] = order_mass_delete_record.transact_time[order_mass_delete_at]; at = at + 1; order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Delete off the wire, 16 bytes from where the cursor stands */
inline decode_order_mass_delete(order_mass_delete_record) {
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> order_mass_delete_record.security_id[order_mass_delete_at] = wire[at]; at = at + 1; order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> order_mass_delete_record.transact_time[order_mass_delete_at] = wire[at]; at = at + 1; order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Mass Delete is what was written, byte for byte */
inline equal_order_mass_delete(order_mass_delete_read, order_mass_delete_written) {
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> assert(order_mass_delete_read.security_id[order_mass_delete_at] == order_mass_delete_written.security_id[order_mass_delete_at]); order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  order_mass_delete_at = 0;
  do
  :: order_mass_delete_at < 8 -> assert(order_mass_delete_read.transact_time[order_mass_delete_at] == order_mass_delete_written.transact_time[order_mass_delete_at]); order_mass_delete_at = order_mass_delete_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modify: 64 bytes -------------------------------------------------- */

typedef OrderModify {
  byte trd_reg_ts_time_in[8];
  byte trd_reg_ts_prev_time_priority[8];
  byte prev_price[8];
  byte prev_display_qty[4];
  byte pad4[4];
  byte security_id[8];
  OrderDetailsComp order_details_comp
};

int order_modify_at;

/* every byte of Order Modify set to one value */
inline fill_order_modify(order_modify_record, order_modify_value) {
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.trd_reg_ts_time_in[order_modify_at] = order_modify_value; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.trd_reg_ts_prev_time_priority[order_modify_at] = order_modify_value; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.prev_price[order_modify_at] = order_modify_value; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> order_modify_record.prev_display_qty[order_modify_at] = order_modify_value; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> order_modify_record.pad4[order_modify_at] = order_modify_value; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.security_id[order_modify_at] = order_modify_value; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  fill_order_details_comp(order_modify_record.order_details_comp, order_modify_value);
  skip
}

/* each byte of Order Modify set to where it lies, so a field read out of place says so */
inline ramp_order_modify(order_modify_record, order_modify_base) {
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.trd_reg_ts_time_in[order_modify_at] = (order_modify_base + 0 + order_modify_at + 1) % 256; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.trd_reg_ts_prev_time_priority[order_modify_at] = (order_modify_base + 8 + order_modify_at + 1) % 256; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.prev_price[order_modify_at] = (order_modify_base + 16 + order_modify_at + 1) % 256; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> order_modify_record.prev_display_qty[order_modify_at] = (order_modify_base + 24 + order_modify_at + 1) % 256; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> order_modify_record.pad4[order_modify_at] = (order_modify_base + 28 + order_modify_at + 1) % 256; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.security_id[order_modify_at] = (order_modify_base + 32 + order_modify_at + 1) % 256; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  ramp_order_details_comp(order_modify_record.order_details_comp, order_modify_base + 40);
  skip
}

/* Order Modify to the wire, 64 bytes from where the cursor stands */
inline encode_order_modify(order_modify_record) {
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> wire[at] = order_modify_record.trd_reg_ts_time_in[order_modify_at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> wire[at] = order_modify_record.trd_reg_ts_prev_time_priority[order_modify_at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> wire[at] = order_modify_record.prev_price[order_modify_at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> wire[at] = order_modify_record.prev_display_qty[order_modify_at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> wire[at] = order_modify_record.pad4[order_modify_at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> wire[at] = order_modify_record.security_id[order_modify_at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  encode_order_details_comp(order_modify_record.order_details_comp);
  skip
}

/* Order Modify off the wire, 64 bytes from where the cursor stands */
inline decode_order_modify(order_modify_record) {
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.trd_reg_ts_time_in[order_modify_at] = wire[at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.trd_reg_ts_prev_time_priority[order_modify_at] = wire[at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.prev_price[order_modify_at] = wire[at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> order_modify_record.prev_display_qty[order_modify_at] = wire[at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> order_modify_record.pad4[order_modify_at] = wire[at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> order_modify_record.security_id[order_modify_at] = wire[at]; at = at + 1; order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  decode_order_details_comp(order_modify_record.order_details_comp);
  skip
}

/* what was read of Order Modify is what was written, byte for byte */
inline equal_order_modify(order_modify_read, order_modify_written) {
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> assert(order_modify_read.trd_reg_ts_time_in[order_modify_at] == order_modify_written.trd_reg_ts_time_in[order_modify_at]); order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> assert(order_modify_read.trd_reg_ts_prev_time_priority[order_modify_at] == order_modify_written.trd_reg_ts_prev_time_priority[order_modify_at]); order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> assert(order_modify_read.prev_price[order_modify_at] == order_modify_written.prev_price[order_modify_at]); order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> assert(order_modify_read.prev_display_qty[order_modify_at] == order_modify_written.prev_display_qty[order_modify_at]); order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 4 -> assert(order_modify_read.pad4[order_modify_at] == order_modify_written.pad4[order_modify_at]); order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  order_modify_at = 0;
  do
  :: order_modify_at < 8 -> assert(order_modify_read.security_id[order_modify_at] == order_modify_written.security_id[order_modify_at]); order_modify_at = order_modify_at + 1
  :: else -> break
  od;
  equal_order_details_comp(order_modify_read.order_details_comp, order_modify_written.order_details_comp);
  skip
}

/* ---- Order Modify Same Prio: 56 bytes ---------------------------------------- */

typedef OrderModifySamePrio {
  byte trd_reg_ts_time_in[8];
  byte transact_time[8];
  byte prev_display_qty[4];
  byte pad4[4];
  byte security_id[8];
  OrderDetailsComp order_details_comp
};

int order_modify_same_prio_at;

/* every byte of Order Modify Same Prio set to one value */
inline fill_order_modify_same_prio(order_modify_same_prio_record, order_modify_same_prio_value) {
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> order_modify_same_prio_record.trd_reg_ts_time_in[order_modify_same_prio_at] = order_modify_same_prio_value; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> order_modify_same_prio_record.transact_time[order_modify_same_prio_at] = order_modify_same_prio_value; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> order_modify_same_prio_record.prev_display_qty[order_modify_same_prio_at] = order_modify_same_prio_value; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> order_modify_same_prio_record.pad4[order_modify_same_prio_at] = order_modify_same_prio_value; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> order_modify_same_prio_record.security_id[order_modify_same_prio_at] = order_modify_same_prio_value; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  fill_order_details_comp(order_modify_same_prio_record.order_details_comp, order_modify_same_prio_value);
  skip
}

/* each byte of Order Modify Same Prio set to where it lies, so a field read out of place says so */
inline ramp_order_modify_same_prio(order_modify_same_prio_record, order_modify_same_prio_base) {
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> order_modify_same_prio_record.trd_reg_ts_time_in[order_modify_same_prio_at] = (order_modify_same_prio_base + 0 + order_modify_same_prio_at + 1) % 256; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> order_modify_same_prio_record.transact_time[order_modify_same_prio_at] = (order_modify_same_prio_base + 8 + order_modify_same_prio_at + 1) % 256; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> order_modify_same_prio_record.prev_display_qty[order_modify_same_prio_at] = (order_modify_same_prio_base + 16 + order_modify_same_prio_at + 1) % 256; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> order_modify_same_prio_record.pad4[order_modify_same_prio_at] = (order_modify_same_prio_base + 20 + order_modify_same_prio_at + 1) % 256; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> order_modify_same_prio_record.security_id[order_modify_same_prio_at] = (order_modify_same_prio_base + 24 + order_modify_same_prio_at + 1) % 256; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  ramp_order_details_comp(order_modify_same_prio_record.order_details_comp, order_modify_same_prio_base + 32);
  skip
}

/* Order Modify Same Prio to the wire, 56 bytes from where the cursor stands */
inline encode_order_modify_same_prio(order_modify_same_prio_record) {
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> wire[at] = order_modify_same_prio_record.trd_reg_ts_time_in[order_modify_same_prio_at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> wire[at] = order_modify_same_prio_record.transact_time[order_modify_same_prio_at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> wire[at] = order_modify_same_prio_record.prev_display_qty[order_modify_same_prio_at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> wire[at] = order_modify_same_prio_record.pad4[order_modify_same_prio_at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> wire[at] = order_modify_same_prio_record.security_id[order_modify_same_prio_at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  encode_order_details_comp(order_modify_same_prio_record.order_details_comp);
  skip
}

/* Order Modify Same Prio off the wire, 56 bytes from where the cursor stands */
inline decode_order_modify_same_prio(order_modify_same_prio_record) {
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> order_modify_same_prio_record.trd_reg_ts_time_in[order_modify_same_prio_at] = wire[at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> order_modify_same_prio_record.transact_time[order_modify_same_prio_at] = wire[at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> order_modify_same_prio_record.prev_display_qty[order_modify_same_prio_at] = wire[at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> order_modify_same_prio_record.pad4[order_modify_same_prio_at] = wire[at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> order_modify_same_prio_record.security_id[order_modify_same_prio_at] = wire[at]; at = at + 1; order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  decode_order_details_comp(order_modify_same_prio_record.order_details_comp);
  skip
}

/* what was read of Order Modify Same Prio is what was written, byte for byte */
inline equal_order_modify_same_prio(order_modify_same_prio_read, order_modify_same_prio_written) {
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> assert(order_modify_same_prio_read.trd_reg_ts_time_in[order_modify_same_prio_at] == order_modify_same_prio_written.trd_reg_ts_time_in[order_modify_same_prio_at]); order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> assert(order_modify_same_prio_read.transact_time[order_modify_same_prio_at] == order_modify_same_prio_written.transact_time[order_modify_same_prio_at]); order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> assert(order_modify_same_prio_read.prev_display_qty[order_modify_same_prio_at] == order_modify_same_prio_written.prev_display_qty[order_modify_same_prio_at]); order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 4 -> assert(order_modify_same_prio_read.pad4[order_modify_same_prio_at] == order_modify_same_prio_written.pad4[order_modify_same_prio_at]); order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  order_modify_same_prio_at = 0;
  do
  :: order_modify_same_prio_at < 8 -> assert(order_modify_same_prio_read.security_id[order_modify_same_prio_at] == order_modify_same_prio_written.security_id[order_modify_same_prio_at]); order_modify_same_prio_at = order_modify_same_prio_at + 1
  :: else -> break
  od;
  equal_order_details_comp(order_modify_same_prio_read.order_details_comp, order_modify_same_prio_written.order_details_comp);
  skip
}

/* ---- Partial Order Execution: 48 bytes --------------------------------------- */

typedef PartialOrderExecution {
  byte side;
  byte pad7[7];
  byte price[8];
  byte trd_reg_ts_time_priority[8];
  byte security_id[8];
  byte trd_match_id[4];
  byte last_qty[4];
  byte last_px[8]
};

int partial_order_execution_at;

/* every byte of Partial Order Execution set to one value */
inline fill_partial_order_execution(partial_order_execution_record, partial_order_execution_value) {
  partial_order_execution_record.side = partial_order_execution_value;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 7 -> partial_order_execution_record.pad7[partial_order_execution_at] = partial_order_execution_value; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.price[partial_order_execution_at] = partial_order_execution_value; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.trd_reg_ts_time_priority[partial_order_execution_at] = partial_order_execution_value; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.security_id[partial_order_execution_at] = partial_order_execution_value; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> partial_order_execution_record.trd_match_id[partial_order_execution_at] = partial_order_execution_value; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> partial_order_execution_record.last_qty[partial_order_execution_at] = partial_order_execution_value; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.last_px[partial_order_execution_at] = partial_order_execution_value; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Partial Order Execution set to where it lies, so a field read out of place says so */
inline ramp_partial_order_execution(partial_order_execution_record, partial_order_execution_base) {
  partial_order_execution_record.side = (partial_order_execution_base + 0 + 1) % 256;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 7 -> partial_order_execution_record.pad7[partial_order_execution_at] = (partial_order_execution_base + 1 + partial_order_execution_at + 1) % 256; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.price[partial_order_execution_at] = (partial_order_execution_base + 8 + partial_order_execution_at + 1) % 256; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.trd_reg_ts_time_priority[partial_order_execution_at] = (partial_order_execution_base + 16 + partial_order_execution_at + 1) % 256; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.security_id[partial_order_execution_at] = (partial_order_execution_base + 24 + partial_order_execution_at + 1) % 256; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> partial_order_execution_record.trd_match_id[partial_order_execution_at] = (partial_order_execution_base + 32 + partial_order_execution_at + 1) % 256; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> partial_order_execution_record.last_qty[partial_order_execution_at] = (partial_order_execution_base + 36 + partial_order_execution_at + 1) % 256; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.last_px[partial_order_execution_at] = (partial_order_execution_base + 40 + partial_order_execution_at + 1) % 256; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* Partial Order Execution to the wire, 48 bytes from where the cursor stands */
inline encode_partial_order_execution(partial_order_execution_record) {
  wire[at] = partial_order_execution_record.side; at = at + 1;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 7 -> wire[at] = partial_order_execution_record.pad7[partial_order_execution_at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> wire[at] = partial_order_execution_record.price[partial_order_execution_at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> wire[at] = partial_order_execution_record.trd_reg_ts_time_priority[partial_order_execution_at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> wire[at] = partial_order_execution_record.security_id[partial_order_execution_at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> wire[at] = partial_order_execution_record.trd_match_id[partial_order_execution_at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> wire[at] = partial_order_execution_record.last_qty[partial_order_execution_at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> wire[at] = partial_order_execution_record.last_px[partial_order_execution_at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* Partial Order Execution off the wire, 48 bytes from where the cursor stands */
inline decode_partial_order_execution(partial_order_execution_record) {
  partial_order_execution_record.side = wire[at]; at = at + 1;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 7 -> partial_order_execution_record.pad7[partial_order_execution_at] = wire[at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.price[partial_order_execution_at] = wire[at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.trd_reg_ts_time_priority[partial_order_execution_at] = wire[at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.security_id[partial_order_execution_at] = wire[at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> partial_order_execution_record.trd_match_id[partial_order_execution_at] = wire[at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> partial_order_execution_record.last_qty[partial_order_execution_at] = wire[at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> partial_order_execution_record.last_px[partial_order_execution_at] = wire[at]; at = at + 1; partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Partial Order Execution is what was written, byte for byte */
inline equal_partial_order_execution(partial_order_execution_read, partial_order_execution_written) {
  assert(partial_order_execution_read.side == partial_order_execution_written.side);
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 7 -> assert(partial_order_execution_read.pad7[partial_order_execution_at] == partial_order_execution_written.pad7[partial_order_execution_at]); partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> assert(partial_order_execution_read.price[partial_order_execution_at] == partial_order_execution_written.price[partial_order_execution_at]); partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> assert(partial_order_execution_read.trd_reg_ts_time_priority[partial_order_execution_at] == partial_order_execution_written.trd_reg_ts_time_priority[partial_order_execution_at]); partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> assert(partial_order_execution_read.security_id[partial_order_execution_at] == partial_order_execution_written.security_id[partial_order_execution_at]); partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> assert(partial_order_execution_read.trd_match_id[partial_order_execution_at] == partial_order_execution_written.trd_match_id[partial_order_execution_at]); partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 4 -> assert(partial_order_execution_read.last_qty[partial_order_execution_at] == partial_order_execution_written.last_qty[partial_order_execution_at]); partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  partial_order_execution_at = 0;
  do
  :: partial_order_execution_at < 8 -> assert(partial_order_execution_read.last_px[partial_order_execution_at] == partial_order_execution_written.last_px[partial_order_execution_at]); partial_order_execution_at = partial_order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Product State Change: 16 bytes ------------------------------------------ */

typedef ProductStateChange {
  byte trading_session_id;
  byte trading_session_sub_id;
  byte trad_ses_status;
  byte fast_market_indicator;
  byte pad4[4];
  byte transact_time[8]
};

int product_state_change_at;

/* every byte of Product State Change set to one value */
inline fill_product_state_change(product_state_change_record, product_state_change_value) {
  product_state_change_record.trading_session_id = product_state_change_value;
  product_state_change_record.trading_session_sub_id = product_state_change_value;
  product_state_change_record.trad_ses_status = product_state_change_value;
  product_state_change_record.fast_market_indicator = product_state_change_value;
  product_state_change_at = 0;
  do
  :: product_state_change_at < 4 -> product_state_change_record.pad4[product_state_change_at] = product_state_change_value; product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  product_state_change_at = 0;
  do
  :: product_state_change_at < 8 -> product_state_change_record.transact_time[product_state_change_at] = product_state_change_value; product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Product State Change set to where it lies, so a field read out of place says so */
inline ramp_product_state_change(product_state_change_record, product_state_change_base) {
  product_state_change_record.trading_session_id = (product_state_change_base + 0 + 1) % 256;
  product_state_change_record.trading_session_sub_id = (product_state_change_base + 1 + 1) % 256;
  product_state_change_record.trad_ses_status = (product_state_change_base + 2 + 1) % 256;
  product_state_change_record.fast_market_indicator = (product_state_change_base + 3 + 1) % 256;
  product_state_change_at = 0;
  do
  :: product_state_change_at < 4 -> product_state_change_record.pad4[product_state_change_at] = (product_state_change_base + 4 + product_state_change_at + 1) % 256; product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  product_state_change_at = 0;
  do
  :: product_state_change_at < 8 -> product_state_change_record.transact_time[product_state_change_at] = (product_state_change_base + 8 + product_state_change_at + 1) % 256; product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* Product State Change to the wire, 16 bytes from where the cursor stands */
inline encode_product_state_change(product_state_change_record) {
  wire[at] = product_state_change_record.trading_session_id; at = at + 1;
  wire[at] = product_state_change_record.trading_session_sub_id; at = at + 1;
  wire[at] = product_state_change_record.trad_ses_status; at = at + 1;
  wire[at] = product_state_change_record.fast_market_indicator; at = at + 1;
  product_state_change_at = 0;
  do
  :: product_state_change_at < 4 -> wire[at] = product_state_change_record.pad4[product_state_change_at]; at = at + 1; product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  product_state_change_at = 0;
  do
  :: product_state_change_at < 8 -> wire[at] = product_state_change_record.transact_time[product_state_change_at]; at = at + 1; product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* Product State Change off the wire, 16 bytes from where the cursor stands */
inline decode_product_state_change(product_state_change_record) {
  product_state_change_record.trading_session_id = wire[at]; at = at + 1;
  product_state_change_record.trading_session_sub_id = wire[at]; at = at + 1;
  product_state_change_record.trad_ses_status = wire[at]; at = at + 1;
  product_state_change_record.fast_market_indicator = wire[at]; at = at + 1;
  product_state_change_at = 0;
  do
  :: product_state_change_at < 4 -> product_state_change_record.pad4[product_state_change_at] = wire[at]; at = at + 1; product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  product_state_change_at = 0;
  do
  :: product_state_change_at < 8 -> product_state_change_record.transact_time[product_state_change_at] = wire[at]; at = at + 1; product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Product State Change is what was written, byte for byte */
inline equal_product_state_change(product_state_change_read, product_state_change_written) {
  assert(product_state_change_read.trading_session_id == product_state_change_written.trading_session_id);
  assert(product_state_change_read.trading_session_sub_id == product_state_change_written.trading_session_sub_id);
  assert(product_state_change_read.trad_ses_status == product_state_change_written.trad_ses_status);
  assert(product_state_change_read.fast_market_indicator == product_state_change_written.fast_market_indicator);
  product_state_change_at = 0;
  do
  :: product_state_change_at < 4 -> assert(product_state_change_read.pad4[product_state_change_at] == product_state_change_written.pad4[product_state_change_at]); product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  product_state_change_at = 0;
  do
  :: product_state_change_at < 8 -> assert(product_state_change_read.transact_time[product_state_change_at] == product_state_change_written.transact_time[product_state_change_at]); product_state_change_at = product_state_change_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Product Summary: 8 bytes ------------------------------------------------ */

typedef ProductSummary {
  byte last_msg_seq_num_processed[4];
  byte trading_session_id;
  byte trading_session_sub_id;
  byte trad_ses_status;
  byte fast_market_indicator
};

int product_summary_at;

/* every byte of Product Summary set to one value */
inline fill_product_summary(product_summary_record, product_summary_value) {
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.last_msg_seq_num_processed[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.trading_session_id = product_summary_value;
  product_summary_record.trading_session_sub_id = product_summary_value;
  product_summary_record.trad_ses_status = product_summary_value;
  product_summary_record.fast_market_indicator = product_summary_value;
  skip
}

/* each byte of Product Summary set to where it lies, so a field read out of place says so */
inline ramp_product_summary(product_summary_record, product_summary_base) {
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.last_msg_seq_num_processed[product_summary_at] = (product_summary_base + 0 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.trading_session_id = (product_summary_base + 4 + 1) % 256;
  product_summary_record.trading_session_sub_id = (product_summary_base + 5 + 1) % 256;
  product_summary_record.trad_ses_status = (product_summary_base + 6 + 1) % 256;
  product_summary_record.fast_market_indicator = (product_summary_base + 7 + 1) % 256;
  skip
}

/* Product Summary to the wire, 8 bytes from where the cursor stands */
inline encode_product_summary(product_summary_record) {
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> wire[at] = product_summary_record.last_msg_seq_num_processed[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  wire[at] = product_summary_record.trading_session_id; at = at + 1;
  wire[at] = product_summary_record.trading_session_sub_id; at = at + 1;
  wire[at] = product_summary_record.trad_ses_status; at = at + 1;
  wire[at] = product_summary_record.fast_market_indicator; at = at + 1;
  skip
}

/* Product Summary off the wire, 8 bytes from where the cursor stands */
inline decode_product_summary(product_summary_record) {
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.last_msg_seq_num_processed[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.trading_session_id = wire[at]; at = at + 1;
  product_summary_record.trading_session_sub_id = wire[at]; at = at + 1;
  product_summary_record.trad_ses_status = wire[at]; at = at + 1;
  product_summary_record.fast_market_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Product Summary is what was written, byte for byte */
inline equal_product_summary(product_summary_read, product_summary_written) {
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> assert(product_summary_read.last_msg_seq_num_processed[product_summary_at] == product_summary_written.last_msg_seq_num_processed[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  assert(product_summary_read.trading_session_id == product_summary_written.trading_session_id);
  assert(product_summary_read.trading_session_sub_id == product_summary_written.trading_session_sub_id);
  assert(product_summary_read.trad_ses_status == product_summary_written.trad_ses_status);
  assert(product_summary_read.fast_market_indicator == product_summary_written.fast_market_indicator);
  skip
}

/* ---- Quote Request: 24 bytes ------------------------------------------------- */

typedef QuoteRequest {
  byte security_id[8];
  byte last_qty[4];
  byte side;
  byte pad3[3];
  byte transact_time[8]
};

int quote_request_at;

/* every byte of Quote Request set to one value */
inline fill_quote_request(quote_request_record, quote_request_value) {
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> quote_request_record.security_id[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.last_qty[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_record.side = quote_request_value;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> quote_request_record.pad3[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> quote_request_record.transact_time[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Request set to where it lies, so a field read out of place says so */
inline ramp_quote_request(quote_request_record, quote_request_base) {
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> quote_request_record.security_id[quote_request_at] = (quote_request_base + 0 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.last_qty[quote_request_at] = (quote_request_base + 8 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_record.side = (quote_request_base + 12 + 1) % 256;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> quote_request_record.pad3[quote_request_at] = (quote_request_base + 13 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> quote_request_record.transact_time[quote_request_at] = (quote_request_base + 16 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request to the wire, 24 bytes from where the cursor stands */
inline encode_quote_request(quote_request_record) {
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> wire[at] = quote_request_record.security_id[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> wire[at] = quote_request_record.last_qty[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  wire[at] = quote_request_record.side; at = at + 1;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> wire[at] = quote_request_record.pad3[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> wire[at] = quote_request_record.transact_time[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request off the wire, 24 bytes from where the cursor stands */
inline decode_quote_request(quote_request_record) {
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> quote_request_record.security_id[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.last_qty[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_record.side = wire[at]; at = at + 1;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> quote_request_record.pad3[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> quote_request_record.transact_time[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Request is what was written, byte for byte */
inline equal_quote_request(quote_request_read, quote_request_written) {
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> assert(quote_request_read.security_id[quote_request_at] == quote_request_written.security_id[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> assert(quote_request_read.last_qty[quote_request_at] == quote_request_written.last_qty[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  assert(quote_request_read.side == quote_request_written.side);
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> assert(quote_request_read.pad3[quote_request_at] == quote_request_written.pad3[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 8 -> assert(quote_request_read.transact_time[quote_request_at] == quote_request_written.transact_time[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Order: 24 bytes ------------------------------------------------ */

typedef SnapshotOrder {
  OrderDetailsComp order_details_comp
};

/* every byte of Snapshot Order set to one value */
inline fill_snapshot_order(snapshot_order_record, snapshot_order_value) {
  fill_order_details_comp(snapshot_order_record.order_details_comp, snapshot_order_value);
  skip
}

/* each byte of Snapshot Order set to where it lies, so a field read out of place says so */
inline ramp_snapshot_order(snapshot_order_record, snapshot_order_base) {
  ramp_order_details_comp(snapshot_order_record.order_details_comp, snapshot_order_base + 0);
  skip
}

/* Snapshot Order to the wire, 24 bytes from where the cursor stands */
inline encode_snapshot_order(snapshot_order_record) {
  encode_order_details_comp(snapshot_order_record.order_details_comp);
  skip
}

/* Snapshot Order off the wire, 24 bytes from where the cursor stands */
inline decode_snapshot_order(snapshot_order_record) {
  decode_order_details_comp(snapshot_order_record.order_details_comp);
  skip
}

/* what was read of Snapshot Order is what was written, byte for byte */
inline equal_snapshot_order(snapshot_order_read, snapshot_order_written) {
  equal_order_details_comp(snapshot_order_read.order_details_comp, snapshot_order_written.order_details_comp);
  skip
}

/* ---- Top Of Book: 32 bytes --------------------------------------------------- */

typedef TopOfBook {
  byte transact_time[8];
  byte security_id[8];
  byte bid_px[8];
  byte offer_px[8]
};

int top_of_book_at;

/* every byte of Top Of Book set to one value */
inline fill_top_of_book(top_of_book_record, top_of_book_value) {
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.transact_time[top_of_book_at] = top_of_book_value; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.security_id[top_of_book_at] = top_of_book_value; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.bid_px[top_of_book_at] = top_of_book_value; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.offer_px[top_of_book_at] = top_of_book_value; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Top Of Book set to where it lies, so a field read out of place says so */
inline ramp_top_of_book(top_of_book_record, top_of_book_base) {
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.transact_time[top_of_book_at] = (top_of_book_base + 0 + top_of_book_at + 1) % 256; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.security_id[top_of_book_at] = (top_of_book_base + 8 + top_of_book_at + 1) % 256; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.bid_px[top_of_book_at] = (top_of_book_base + 16 + top_of_book_at + 1) % 256; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.offer_px[top_of_book_at] = (top_of_book_base + 24 + top_of_book_at + 1) % 256; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book to the wire, 32 bytes from where the cursor stands */
inline encode_top_of_book(top_of_book_record) {
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> wire[at] = top_of_book_record.transact_time[top_of_book_at]; at = at + 1; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> wire[at] = top_of_book_record.security_id[top_of_book_at]; at = at + 1; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> wire[at] = top_of_book_record.bid_px[top_of_book_at]; at = at + 1; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> wire[at] = top_of_book_record.offer_px[top_of_book_at]; at = at + 1; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book off the wire, 32 bytes from where the cursor stands */
inline decode_top_of_book(top_of_book_record) {
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.transact_time[top_of_book_at] = wire[at]; at = at + 1; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.security_id[top_of_book_at] = wire[at]; at = at + 1; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.bid_px[top_of_book_at] = wire[at]; at = at + 1; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> top_of_book_record.offer_px[top_of_book_at] = wire[at]; at = at + 1; top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Top Of Book is what was written, byte for byte */
inline equal_top_of_book(top_of_book_read, top_of_book_written) {
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> assert(top_of_book_read.transact_time[top_of_book_at] == top_of_book_written.transact_time[top_of_book_at]); top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> assert(top_of_book_read.security_id[top_of_book_at] == top_of_book_written.security_id[top_of_book_at]); top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> assert(top_of_book_read.bid_px[top_of_book_at] == top_of_book_written.bid_px[top_of_book_at]); top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  top_of_book_at = 0;
  do
  :: top_of_book_at < 8 -> assert(top_of_book_read.offer_px[top_of_book_at] == top_of_book_written.offer_px[top_of_book_at]); top_of_book_at = top_of_book_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Report: 40 bytes -------------------------------------------------- */

typedef TradeReport {
  byte security_id[8];
  byte transact_time[8];
  byte trd_match_id[4];
  byte last_qty[4];
  byte last_px[8];
  byte match_type;
  byte match_sub_type;
  byte pad6[6]
};

int trade_report_at;

/* every byte of Trade Report set to one value */
inline fill_trade_report(trade_report_record, trade_report_value) {
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> trade_report_record.security_id[trade_report_at] = trade_report_value; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> trade_report_record.transact_time[trade_report_at] = trade_report_value; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> trade_report_record.trd_match_id[trade_report_at] = trade_report_value; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> trade_report_record.last_qty[trade_report_at] = trade_report_value; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> trade_report_record.last_px[trade_report_at] = trade_report_value; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_record.match_type = trade_report_value;
  trade_report_record.match_sub_type = trade_report_value;
  trade_report_at = 0;
  do
  :: trade_report_at < 6 -> trade_report_record.pad6[trade_report_at] = trade_report_value; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Report set to where it lies, so a field read out of place says so */
inline ramp_trade_report(trade_report_record, trade_report_base) {
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> trade_report_record.security_id[trade_report_at] = (trade_report_base + 0 + trade_report_at + 1) % 256; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> trade_report_record.transact_time[trade_report_at] = (trade_report_base + 8 + trade_report_at + 1) % 256; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> trade_report_record.trd_match_id[trade_report_at] = (trade_report_base + 16 + trade_report_at + 1) % 256; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> trade_report_record.last_qty[trade_report_at] = (trade_report_base + 20 + trade_report_at + 1) % 256; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> trade_report_record.last_px[trade_report_at] = (trade_report_base + 24 + trade_report_at + 1) % 256; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_record.match_type = (trade_report_base + 32 + 1) % 256;
  trade_report_record.match_sub_type = (trade_report_base + 33 + 1) % 256;
  trade_report_at = 0;
  do
  :: trade_report_at < 6 -> trade_report_record.pad6[trade_report_at] = (trade_report_base + 34 + trade_report_at + 1) % 256; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report to the wire, 40 bytes from where the cursor stands */
inline encode_trade_report(trade_report_record) {
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> wire[at] = trade_report_record.security_id[trade_report_at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> wire[at] = trade_report_record.transact_time[trade_report_at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> wire[at] = trade_report_record.trd_match_id[trade_report_at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> wire[at] = trade_report_record.last_qty[trade_report_at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> wire[at] = trade_report_record.last_px[trade_report_at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_record.match_type; at = at + 1;
  wire[at] = trade_report_record.match_sub_type; at = at + 1;
  trade_report_at = 0;
  do
  :: trade_report_at < 6 -> wire[at] = trade_report_record.pad6[trade_report_at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report off the wire, 40 bytes from where the cursor stands */
inline decode_trade_report(trade_report_record) {
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> trade_report_record.security_id[trade_report_at] = wire[at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> trade_report_record.transact_time[trade_report_at] = wire[at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> trade_report_record.trd_match_id[trade_report_at] = wire[at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> trade_report_record.last_qty[trade_report_at] = wire[at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> trade_report_record.last_px[trade_report_at] = wire[at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_record.match_type = wire[at]; at = at + 1;
  trade_report_record.match_sub_type = wire[at]; at = at + 1;
  trade_report_at = 0;
  do
  :: trade_report_at < 6 -> trade_report_record.pad6[trade_report_at] = wire[at]; at = at + 1; trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Report is what was written, byte for byte */
inline equal_trade_report(trade_report_read, trade_report_written) {
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> assert(trade_report_read.security_id[trade_report_at] == trade_report_written.security_id[trade_report_at]); trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> assert(trade_report_read.transact_time[trade_report_at] == trade_report_written.transact_time[trade_report_at]); trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> assert(trade_report_read.trd_match_id[trade_report_at] == trade_report_written.trd_match_id[trade_report_at]); trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 4 -> assert(trade_report_read.last_qty[trade_report_at] == trade_report_written.last_qty[trade_report_at]); trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  trade_report_at = 0;
  do
  :: trade_report_at < 8 -> assert(trade_report_read.last_px[trade_report_at] == trade_report_written.last_px[trade_report_at]); trade_report_at = trade_report_at + 1
  :: else -> break
  od;
  assert(trade_report_read.match_type == trade_report_written.match_type);
  assert(trade_report_read.match_sub_type == trade_report_written.match_sub_type);
  trade_report_at = 0;
  do
  :: trade_report_at < 6 -> assert(trade_report_read.pad6[trade_report_at] == trade_report_written.pad6[trade_report_at]); trade_report_at = trade_report_at + 1
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

/* Message Header Comp: encoded, read back, and compared */
proctype check_message_header_comp() {
  MessageHeaderComp message_header_comp_sent;
  MessageHeaderComp message_header_comp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_header_comp(message_header_comp_sent, 0)
  :: pattern == 1 -> fill_message_header_comp(message_header_comp_sent, 32)
  :: pattern == 2 -> fill_message_header_comp(message_header_comp_sent, 255)
  :: else -> ramp_message_header_comp(message_header_comp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_header_comp(message_header_comp_sent);
    assert(at == 8);
    at = 0;
    decode_message_header_comp(message_header_comp_got);
    assert(at == 8);
    equal_message_header_comp(message_header_comp_got, message_header_comp_sent)
  }
}

/* Auction Bbo: encoded, read back, and compared */
proctype check_auction_bbo() {
  AuctionBbo auction_bbo_sent;
  AuctionBbo auction_bbo_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_bbo(auction_bbo_sent, 0)
  :: pattern == 1 -> fill_auction_bbo(auction_bbo_sent, 32)
  :: pattern == 2 -> fill_auction_bbo(auction_bbo_sent, 255)
  :: else -> ramp_auction_bbo(auction_bbo_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_bbo(auction_bbo_sent);
    assert(at == 32);
    at = 0;
    decode_auction_bbo(auction_bbo_got);
    assert(at == 32);
    equal_auction_bbo(auction_bbo_got, auction_bbo_sent)
  }
}

/* Auction Clearing Price: encoded, read back, and compared */
proctype check_auction_clearing_price() {
  AuctionClearingPrice auction_clearing_price_sent;
  AuctionClearingPrice auction_clearing_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_clearing_price(auction_clearing_price_sent, 0)
  :: pattern == 1 -> fill_auction_clearing_price(auction_clearing_price_sent, 32)
  :: pattern == 2 -> fill_auction_clearing_price(auction_clearing_price_sent, 255)
  :: else -> ramp_auction_clearing_price(auction_clearing_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_clearing_price(auction_clearing_price_sent);
    assert(at == 24);
    at = 0;
    decode_auction_clearing_price(auction_clearing_price_got);
    assert(at == 24);
    equal_auction_clearing_price(auction_clearing_price_got, auction_clearing_price_sent)
  }
}

/* Cross Request: encoded, read back, and compared */
proctype check_cross_request() {
  CrossRequest cross_request_sent;
  CrossRequest cross_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_request(cross_request_sent, 0)
  :: pattern == 1 -> fill_cross_request(cross_request_sent, 32)
  :: pattern == 2 -> fill_cross_request(cross_request_sent, 255)
  :: else -> ramp_cross_request(cross_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_request(cross_request_sent);
    assert(at == 24);
    at = 0;
    decode_cross_request(cross_request_got);
    assert(at == 24);
    equal_cross_request(cross_request_got, cross_request_sent)
  }
}

/* Execution Summary: encoded, read back, and compared */
proctype check_execution_summary() {
  ExecutionSummary execution_summary_sent;
  ExecutionSummary execution_summary_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_summary(execution_summary_sent, 0)
  :: pattern == 1 -> fill_execution_summary(execution_summary_sent, 32)
  :: pattern == 2 -> fill_execution_summary(execution_summary_sent, 255)
  :: else -> ramp_execution_summary(execution_summary_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_summary(execution_summary_sent);
    assert(at == 56);
    at = 0;
    decode_execution_summary(execution_summary_got);
    assert(at == 56);
    equal_execution_summary(execution_summary_got, execution_summary_sent)
  }
}

/* Full Order Execution: encoded, read back, and compared */
proctype check_full_order_execution() {
  FullOrderExecution full_order_execution_sent;
  FullOrderExecution full_order_execution_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_full_order_execution(full_order_execution_sent, 0)
  :: pattern == 1 -> fill_full_order_execution(full_order_execution_sent, 32)
  :: pattern == 2 -> fill_full_order_execution(full_order_execution_sent, 255)
  :: else -> ramp_full_order_execution(full_order_execution_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_full_order_execution(full_order_execution_sent);
    assert(at == 48);
    at = 0;
    decode_full_order_execution(full_order_execution_got);
    assert(at == 48);
    equal_full_order_execution(full_order_execution_got, full_order_execution_sent)
  }
}

/* Heartbeat: encoded, read back, and compared */
proctype check_heartbeat() {
  Heartbeat heartbeat_sent;
  Heartbeat heartbeat_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat(heartbeat_sent, 0)
  :: pattern == 1 -> fill_heartbeat(heartbeat_sent, 32)
  :: pattern == 2 -> fill_heartbeat(heartbeat_sent, 255)
  :: else -> ramp_heartbeat(heartbeat_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat(heartbeat_sent);
    assert(at == 8);
    at = 0;
    decode_heartbeat(heartbeat_got);
    assert(at == 8);
    equal_heartbeat(heartbeat_got, heartbeat_sent)
  }
}

/* Instrument State Change: encoded, read back, and compared */
proctype check_instrument_state_change() {
  InstrumentStateChange instrument_state_change_sent;
  InstrumentStateChange instrument_state_change_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_state_change(instrument_state_change_sent, 0)
  :: pattern == 1 -> fill_instrument_state_change(instrument_state_change_sent, 32)
  :: pattern == 2 -> fill_instrument_state_change(instrument_state_change_sent, 255)
  :: else -> ramp_instrument_state_change(instrument_state_change_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_state_change(instrument_state_change_sent);
    assert(at == 24);
    at = 0;
    decode_instrument_state_change(instrument_state_change_got);
    assert(at == 24);
    equal_instrument_state_change(instrument_state_change_got, instrument_state_change_sent)
  }
}

/* Order Details Comp: encoded, read back, and compared */
proctype check_order_details_comp() {
  OrderDetailsComp order_details_comp_sent;
  OrderDetailsComp order_details_comp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_details_comp(order_details_comp_sent, 0)
  :: pattern == 1 -> fill_order_details_comp(order_details_comp_sent, 32)
  :: pattern == 2 -> fill_order_details_comp(order_details_comp_sent, 255)
  :: else -> ramp_order_details_comp(order_details_comp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_details_comp(order_details_comp_sent);
    assert(at == 24);
    at = 0;
    decode_order_details_comp(order_details_comp_got);
    assert(at == 24);
    equal_order_details_comp(order_details_comp_got, order_details_comp_sent)
  }
}

/* Order Add: encoded, read back, and compared */
proctype check_order_add() {
  OrderAdd order_add_sent;
  OrderAdd order_add_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_add(order_add_sent, 0)
  :: pattern == 1 -> fill_order_add(order_add_sent, 32)
  :: pattern == 2 -> fill_order_add(order_add_sent, 255)
  :: else -> ramp_order_add(order_add_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_add(order_add_sent);
    assert(at == 40);
    at = 0;
    decode_order_add(order_add_got);
    assert(at == 40);
    equal_order_add(order_add_got, order_add_sent)
  }
}

/* Order Delete: encoded, read back, and compared */
proctype check_order_delete() {
  OrderDelete order_delete_sent;
  OrderDelete order_delete_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete(order_delete_sent, 0)
  :: pattern == 1 -> fill_order_delete(order_delete_sent, 32)
  :: pattern == 2 -> fill_order_delete(order_delete_sent, 255)
  :: else -> ramp_order_delete(order_delete_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete(order_delete_sent);
    assert(at == 48);
    at = 0;
    decode_order_delete(order_delete_got);
    assert(at == 48);
    equal_order_delete(order_delete_got, order_delete_sent)
  }
}

/* Order Mass Delete: encoded, read back, and compared */
proctype check_order_mass_delete() {
  OrderMassDelete order_mass_delete_sent;
  OrderMassDelete order_mass_delete_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_delete(order_mass_delete_sent, 0)
  :: pattern == 1 -> fill_order_mass_delete(order_mass_delete_sent, 32)
  :: pattern == 2 -> fill_order_mass_delete(order_mass_delete_sent, 255)
  :: else -> ramp_order_mass_delete(order_mass_delete_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_delete(order_mass_delete_sent);
    assert(at == 16);
    at = 0;
    decode_order_mass_delete(order_mass_delete_got);
    assert(at == 16);
    equal_order_mass_delete(order_mass_delete_got, order_mass_delete_sent)
  }
}

/* Order Modify: encoded, read back, and compared */
proctype check_order_modify() {
  OrderModify order_modify_sent;
  OrderModify order_modify_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modify(order_modify_sent, 0)
  :: pattern == 1 -> fill_order_modify(order_modify_sent, 32)
  :: pattern == 2 -> fill_order_modify(order_modify_sent, 255)
  :: else -> ramp_order_modify(order_modify_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modify(order_modify_sent);
    assert(at == 64);
    at = 0;
    decode_order_modify(order_modify_got);
    assert(at == 64);
    equal_order_modify(order_modify_got, order_modify_sent)
  }
}

/* Order Modify Same Prio: encoded, read back, and compared */
proctype check_order_modify_same_prio() {
  OrderModifySamePrio order_modify_same_prio_sent;
  OrderModifySamePrio order_modify_same_prio_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modify_same_prio(order_modify_same_prio_sent, 0)
  :: pattern == 1 -> fill_order_modify_same_prio(order_modify_same_prio_sent, 32)
  :: pattern == 2 -> fill_order_modify_same_prio(order_modify_same_prio_sent, 255)
  :: else -> ramp_order_modify_same_prio(order_modify_same_prio_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modify_same_prio(order_modify_same_prio_sent);
    assert(at == 56);
    at = 0;
    decode_order_modify_same_prio(order_modify_same_prio_got);
    assert(at == 56);
    equal_order_modify_same_prio(order_modify_same_prio_got, order_modify_same_prio_sent)
  }
}

/* Partial Order Execution: encoded, read back, and compared */
proctype check_partial_order_execution() {
  PartialOrderExecution partial_order_execution_sent;
  PartialOrderExecution partial_order_execution_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_partial_order_execution(partial_order_execution_sent, 0)
  :: pattern == 1 -> fill_partial_order_execution(partial_order_execution_sent, 32)
  :: pattern == 2 -> fill_partial_order_execution(partial_order_execution_sent, 255)
  :: else -> ramp_partial_order_execution(partial_order_execution_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_partial_order_execution(partial_order_execution_sent);
    assert(at == 48);
    at = 0;
    decode_partial_order_execution(partial_order_execution_got);
    assert(at == 48);
    equal_partial_order_execution(partial_order_execution_got, partial_order_execution_sent)
  }
}

/* Product State Change: encoded, read back, and compared */
proctype check_product_state_change() {
  ProductStateChange product_state_change_sent;
  ProductStateChange product_state_change_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_product_state_change(product_state_change_sent, 0)
  :: pattern == 1 -> fill_product_state_change(product_state_change_sent, 32)
  :: pattern == 2 -> fill_product_state_change(product_state_change_sent, 255)
  :: else -> ramp_product_state_change(product_state_change_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_product_state_change(product_state_change_sent);
    assert(at == 16);
    at = 0;
    decode_product_state_change(product_state_change_got);
    assert(at == 16);
    equal_product_state_change(product_state_change_got, product_state_change_sent)
  }
}

/* Product Summary: encoded, read back, and compared */
proctype check_product_summary() {
  ProductSummary product_summary_sent;
  ProductSummary product_summary_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_product_summary(product_summary_sent, 0)
  :: pattern == 1 -> fill_product_summary(product_summary_sent, 32)
  :: pattern == 2 -> fill_product_summary(product_summary_sent, 255)
  :: else -> ramp_product_summary(product_summary_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_product_summary(product_summary_sent);
    assert(at == 8);
    at = 0;
    decode_product_summary(product_summary_got);
    assert(at == 8);
    equal_product_summary(product_summary_got, product_summary_sent)
  }
}

/* Quote Request: encoded, read back, and compared */
proctype check_quote_request() {
  QuoteRequest quote_request_sent;
  QuoteRequest quote_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_request(quote_request_sent, 0)
  :: pattern == 1 -> fill_quote_request(quote_request_sent, 32)
  :: pattern == 2 -> fill_quote_request(quote_request_sent, 255)
  :: else -> ramp_quote_request(quote_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_request(quote_request_sent);
    assert(at == 24);
    at = 0;
    decode_quote_request(quote_request_got);
    assert(at == 24);
    equal_quote_request(quote_request_got, quote_request_sent)
  }
}

/* Snapshot Order: encoded, read back, and compared */
proctype check_snapshot_order() {
  SnapshotOrder snapshot_order_sent;
  SnapshotOrder snapshot_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_order(snapshot_order_sent, 0)
  :: pattern == 1 -> fill_snapshot_order(snapshot_order_sent, 32)
  :: pattern == 2 -> fill_snapshot_order(snapshot_order_sent, 255)
  :: else -> ramp_snapshot_order(snapshot_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_order(snapshot_order_sent);
    assert(at == 24);
    at = 0;
    decode_snapshot_order(snapshot_order_got);
    assert(at == 24);
    equal_snapshot_order(snapshot_order_got, snapshot_order_sent)
  }
}

/* Top Of Book: encoded, read back, and compared */
proctype check_top_of_book() {
  TopOfBook top_of_book_sent;
  TopOfBook top_of_book_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_book(top_of_book_sent, 0)
  :: pattern == 1 -> fill_top_of_book(top_of_book_sent, 32)
  :: pattern == 2 -> fill_top_of_book(top_of_book_sent, 255)
  :: else -> ramp_top_of_book(top_of_book_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_book(top_of_book_sent);
    assert(at == 32);
    at = 0;
    decode_top_of_book(top_of_book_got);
    assert(at == 32);
    equal_top_of_book(top_of_book_got, top_of_book_sent)
  }
}

/* Trade Report: encoded, read back, and compared */
proctype check_trade_report() {
  TradeReport trade_report_sent;
  TradeReport trade_report_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report(trade_report_sent, 0)
  :: pattern == 1 -> fill_trade_report(trade_report_sent, 32)
  :: pattern == 2 -> fill_trade_report(trade_report_sent, 255)
  :: else -> ramp_trade_report(trade_report_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report(trade_report_sent);
    assert(at == 40);
    at = 0;
    decode_trade_report(trade_report_got);
    assert(at == 40);
    equal_trade_report(trade_report_got, trade_report_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_eobi_header()
  :: run check_packet_header()
  :: run check_message_header_comp()
  :: run check_auction_bbo()
  :: run check_auction_clearing_price()
  :: run check_cross_request()
  :: run check_execution_summary()
  :: run check_full_order_execution()
  :: run check_heartbeat()
  :: run check_instrument_state_change()
  :: run check_order_details_comp()
  :: run check_order_add()
  :: run check_order_delete()
  :: run check_order_mass_delete()
  :: run check_order_modify()
  :: run check_order_modify_same_prio()
  :: run check_partial_order_execution()
  :: run check_product_state_change()
  :: run check_product_summary()
  :: run check_quote_request()
  :: run check_snapshot_order()
  :: run check_top_of_book()
  :: run check_trade_report()
  fi
}
