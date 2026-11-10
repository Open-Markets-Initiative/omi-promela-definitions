/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Output
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
 *   - the dispatch that chooses a message by its type
 *   - a field present only on a condition
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 87

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

typedef PacketHeader {
  byte session[10];
  byte sequence_number[8];
  byte message_count[2]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = (packet_header_base + 18 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 20 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> wire[at] = packet_header_record.session[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.message_count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 20 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> assert(packet_header_read.session[packet_header_at] == packet_header_written.session[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.message_count[packet_header_at] == packet_header_written.message_count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 4 bytes ------------------------------------------------- */

/* Mold Udp Message Header */
typedef MessageHeader {
  byte message_length[2];
  byte version;
  byte message_category
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.version = message_header_value;
  message_header_record.message_category = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.version = (message_header_base + 2 + 1) % 256;
  message_header_record.message_category = (message_header_base + 3 + 1) % 256;
  skip
}

/* Message Header to the wire, 4 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.version; at = at + 1;
  wire[at] = message_header_record.message_category; at = at + 1;
  skip
}

/* Message Header off the wire, 4 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.version = wire[at]; at = at + 1;
  message_header_record.message_category = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.version == message_header_written.version);
  assert(message_header_read.message_category == message_header_written.message_category);
  skip
}

/* ---- Message Info: 26 bytes -------------------------------------------------- */

/* Message Info */
typedef MessageInfo {
  byte market_center_originator_id;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte participant_timestamp[8];
  byte participant_token[8]
};

int message_info_at;

/* every byte of Message Info set to one value */
inline fill_message_info(message_info_record, message_info_value) {
  message_info_record.market_center_originator_id = message_info_value;
  message_info_record.sub_market_center_id = message_info_value;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> message_info_record.sip_timestamp[message_info_at] = message_info_value; message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> message_info_record.participant_timestamp[message_info_at] = message_info_value; message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> message_info_record.participant_token[message_info_at] = message_info_value; message_info_at = message_info_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Info set to where it lies, so a field read out of place says so */
inline ramp_message_info(message_info_record, message_info_base) {
  message_info_record.market_center_originator_id = (message_info_base + 0 + 1) % 256;
  message_info_record.sub_market_center_id = (message_info_base + 1 + 1) % 256;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> message_info_record.sip_timestamp[message_info_at] = (message_info_base + 2 + message_info_at + 1) % 256; message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> message_info_record.participant_timestamp[message_info_at] = (message_info_base + 10 + message_info_at + 1) % 256; message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> message_info_record.participant_token[message_info_at] = (message_info_base + 18 + message_info_at + 1) % 256; message_info_at = message_info_at + 1
  :: else -> break
  od;
  skip
}

/* Message Info to the wire, 26 bytes from where the cursor stands */
inline encode_message_info(message_info_record) {
  wire[at] = message_info_record.market_center_originator_id; at = at + 1;
  wire[at] = message_info_record.sub_market_center_id; at = at + 1;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> wire[at] = message_info_record.sip_timestamp[message_info_at]; at = at + 1; message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> wire[at] = message_info_record.participant_timestamp[message_info_at]; at = at + 1; message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> wire[at] = message_info_record.participant_token[message_info_at]; at = at + 1; message_info_at = message_info_at + 1
  :: else -> break
  od;
  skip
}

/* Message Info off the wire, 26 bytes from where the cursor stands */
inline decode_message_info(message_info_record) {
  message_info_record.market_center_originator_id = wire[at]; at = at + 1;
  message_info_record.sub_market_center_id = wire[at]; at = at + 1;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> message_info_record.sip_timestamp[message_info_at] = wire[at]; at = at + 1; message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> message_info_record.participant_timestamp[message_info_at] = wire[at]; at = at + 1; message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> message_info_record.participant_token[message_info_at] = wire[at]; at = at + 1; message_info_at = message_info_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Info is what was written, byte for byte */
inline equal_message_info(message_info_read, message_info_written) {
  assert(message_info_read.market_center_originator_id == message_info_written.market_center_originator_id);
  assert(message_info_read.sub_market_center_id == message_info_written.sub_market_center_id);
  message_info_at = 0;
  do
  :: message_info_at < 8 -> assert(message_info_read.sip_timestamp[message_info_at] == message_info_written.sip_timestamp[message_info_at]); message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> assert(message_info_read.participant_timestamp[message_info_at] == message_info_written.participant_timestamp[message_info_at]); message_info_at = message_info_at + 1
  :: else -> break
  od;
  message_info_at = 0;
  do
  :: message_info_at < 8 -> assert(message_info_read.participant_token[message_info_at] == message_info_written.participant_token[message_info_at]); message_info_at = message_info_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Finra Adf Market Participant Quotation Message: 74 bytes ---------------- */

/* For FINRA quotes that do not affect the NBBO or FINRA BBO a FINRA ADF Market Participant Quotation Message will be sent. */
typedef FinraAdfMarketParticipantQuotationMessage {
  MessageInfo message_info;
  byte finra_timestamp[8];
  byte symbol_long[11];
  byte bid_price[8];
  byte bid_size[4];
  byte ask_price[8];
  byte ask_size[4];
  byte quote_condition;
  byte finra_market_participant[4]
};

int finra_adf_market_participant_quotation_message_at;

/* every byte of Finra Adf Market Participant Quotation Message set to one value */
inline fill_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_record, finra_adf_market_participant_quotation_message_value) {
  fill_message_info(finra_adf_market_participant_quotation_message_record.message_info, finra_adf_market_participant_quotation_message_value);
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> finra_adf_market_participant_quotation_message_record.finra_timestamp[finra_adf_market_participant_quotation_message_at] = finra_adf_market_participant_quotation_message_value; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 11 -> finra_adf_market_participant_quotation_message_record.symbol_long[finra_adf_market_participant_quotation_message_at] = finra_adf_market_participant_quotation_message_value; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> finra_adf_market_participant_quotation_message_record.bid_price[finra_adf_market_participant_quotation_message_at] = finra_adf_market_participant_quotation_message_value; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> finra_adf_market_participant_quotation_message_record.bid_size[finra_adf_market_participant_quotation_message_at] = finra_adf_market_participant_quotation_message_value; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> finra_adf_market_participant_quotation_message_record.ask_price[finra_adf_market_participant_quotation_message_at] = finra_adf_market_participant_quotation_message_value; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> finra_adf_market_participant_quotation_message_record.ask_size[finra_adf_market_participant_quotation_message_at] = finra_adf_market_participant_quotation_message_value; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_record.quote_condition = finra_adf_market_participant_quotation_message_value;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> finra_adf_market_participant_quotation_message_record.finra_market_participant[finra_adf_market_participant_quotation_message_at] = finra_adf_market_participant_quotation_message_value; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Finra Adf Market Participant Quotation Message set to where it lies, so a field read out of place says so */
inline ramp_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_record, finra_adf_market_participant_quotation_message_base) {
  ramp_message_info(finra_adf_market_participant_quotation_message_record.message_info, finra_adf_market_participant_quotation_message_base + 0);
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> finra_adf_market_participant_quotation_message_record.finra_timestamp[finra_adf_market_participant_quotation_message_at] = (finra_adf_market_participant_quotation_message_base + 26 + finra_adf_market_participant_quotation_message_at + 1) % 256; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 11 -> finra_adf_market_participant_quotation_message_record.symbol_long[finra_adf_market_participant_quotation_message_at] = (finra_adf_market_participant_quotation_message_base + 34 + finra_adf_market_participant_quotation_message_at + 1) % 256; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> finra_adf_market_participant_quotation_message_record.bid_price[finra_adf_market_participant_quotation_message_at] = (finra_adf_market_participant_quotation_message_base + 45 + finra_adf_market_participant_quotation_message_at + 1) % 256; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> finra_adf_market_participant_quotation_message_record.bid_size[finra_adf_market_participant_quotation_message_at] = (finra_adf_market_participant_quotation_message_base + 53 + finra_adf_market_participant_quotation_message_at + 1) % 256; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> finra_adf_market_participant_quotation_message_record.ask_price[finra_adf_market_participant_quotation_message_at] = (finra_adf_market_participant_quotation_message_base + 57 + finra_adf_market_participant_quotation_message_at + 1) % 256; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> finra_adf_market_participant_quotation_message_record.ask_size[finra_adf_market_participant_quotation_message_at] = (finra_adf_market_participant_quotation_message_base + 65 + finra_adf_market_participant_quotation_message_at + 1) % 256; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_record.quote_condition = (finra_adf_market_participant_quotation_message_base + 69 + 1) % 256;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> finra_adf_market_participant_quotation_message_record.finra_market_participant[finra_adf_market_participant_quotation_message_at] = (finra_adf_market_participant_quotation_message_base + 70 + finra_adf_market_participant_quotation_message_at + 1) % 256; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Adf Market Participant Quotation Message to the wire, 74 bytes from where the cursor stands */
inline encode_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_record) {
  encode_message_info(finra_adf_market_participant_quotation_message_record.message_info);
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> wire[at] = finra_adf_market_participant_quotation_message_record.finra_timestamp[finra_adf_market_participant_quotation_message_at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 11 -> wire[at] = finra_adf_market_participant_quotation_message_record.symbol_long[finra_adf_market_participant_quotation_message_at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> wire[at] = finra_adf_market_participant_quotation_message_record.bid_price[finra_adf_market_participant_quotation_message_at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> wire[at] = finra_adf_market_participant_quotation_message_record.bid_size[finra_adf_market_participant_quotation_message_at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> wire[at] = finra_adf_market_participant_quotation_message_record.ask_price[finra_adf_market_participant_quotation_message_at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> wire[at] = finra_adf_market_participant_quotation_message_record.ask_size[finra_adf_market_participant_quotation_message_at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = finra_adf_market_participant_quotation_message_record.quote_condition; at = at + 1;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> wire[at] = finra_adf_market_participant_quotation_message_record.finra_market_participant[finra_adf_market_participant_quotation_message_at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Adf Market Participant Quotation Message off the wire, 74 bytes from where the cursor stands */
inline decode_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_record) {
  decode_message_info(finra_adf_market_participant_quotation_message_record.message_info);
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> finra_adf_market_participant_quotation_message_record.finra_timestamp[finra_adf_market_participant_quotation_message_at] = wire[at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 11 -> finra_adf_market_participant_quotation_message_record.symbol_long[finra_adf_market_participant_quotation_message_at] = wire[at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> finra_adf_market_participant_quotation_message_record.bid_price[finra_adf_market_participant_quotation_message_at] = wire[at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> finra_adf_market_participant_quotation_message_record.bid_size[finra_adf_market_participant_quotation_message_at] = wire[at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> finra_adf_market_participant_quotation_message_record.ask_price[finra_adf_market_participant_quotation_message_at] = wire[at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> finra_adf_market_participant_quotation_message_record.ask_size[finra_adf_market_participant_quotation_message_at] = wire[at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_record.quote_condition = wire[at]; at = at + 1;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> finra_adf_market_participant_quotation_message_record.finra_market_participant[finra_adf_market_participant_quotation_message_at] = wire[at]; at = at + 1; finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Finra Adf Market Participant Quotation Message is what was written, byte for byte */
inline equal_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_read, finra_adf_market_participant_quotation_message_written) {
  equal_message_info(finra_adf_market_participant_quotation_message_read.message_info, finra_adf_market_participant_quotation_message_written.message_info);
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> assert(finra_adf_market_participant_quotation_message_read.finra_timestamp[finra_adf_market_participant_quotation_message_at] == finra_adf_market_participant_quotation_message_written.finra_timestamp[finra_adf_market_participant_quotation_message_at]); finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 11 -> assert(finra_adf_market_participant_quotation_message_read.symbol_long[finra_adf_market_participant_quotation_message_at] == finra_adf_market_participant_quotation_message_written.symbol_long[finra_adf_market_participant_quotation_message_at]); finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> assert(finra_adf_market_participant_quotation_message_read.bid_price[finra_adf_market_participant_quotation_message_at] == finra_adf_market_participant_quotation_message_written.bid_price[finra_adf_market_participant_quotation_message_at]); finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> assert(finra_adf_market_participant_quotation_message_read.bid_size[finra_adf_market_participant_quotation_message_at] == finra_adf_market_participant_quotation_message_written.bid_size[finra_adf_market_participant_quotation_message_at]); finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 8 -> assert(finra_adf_market_participant_quotation_message_read.ask_price[finra_adf_market_participant_quotation_message_at] == finra_adf_market_participant_quotation_message_written.ask_price[finra_adf_market_participant_quotation_message_at]); finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> assert(finra_adf_market_participant_quotation_message_read.ask_size[finra_adf_market_participant_quotation_message_at] == finra_adf_market_participant_quotation_message_written.ask_size[finra_adf_market_participant_quotation_message_at]); finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  assert(finra_adf_market_participant_quotation_message_read.quote_condition == finra_adf_market_participant_quotation_message_written.quote_condition);
  finra_adf_market_participant_quotation_message_at = 0;
  do
  :: finra_adf_market_participant_quotation_message_at < 4 -> assert(finra_adf_market_participant_quotation_message_read.finra_market_participant[finra_adf_market_participant_quotation_message_at] == finra_adf_market_participant_quotation_message_written.finra_market_participant[finra_adf_market_participant_quotation_message_at]); finra_adf_market_participant_quotation_message_at = finra_adf_market_participant_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Sro Trading Action Message: 56 bytes ------------------------------ */

/* This fixed format message will be used to inform subscribers of trading actions – such as halts, pauses, quotation resumptions and trading resumptions */
typedef CrossSroTradingActionMessage {
  MessageInfo message_info;
  byte symbol_long[11];
  byte trading_action_code;
  byte trading_action_sequence_number[4];
  byte action_timestamp[8];
  byte trading_action_reason[6]
};

int cross_sro_trading_action_message_at;

/* every byte of Cross Sro Trading Action Message set to one value */
inline fill_cross_sro_trading_action_message(cross_sro_trading_action_message_record, cross_sro_trading_action_message_value) {
  fill_message_info(cross_sro_trading_action_message_record.message_info, cross_sro_trading_action_message_value);
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> cross_sro_trading_action_message_record.symbol_long[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_record.trading_action_code = cross_sro_trading_action_message_value;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> cross_sro_trading_action_message_record.trading_action_sequence_number[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.action_timestamp[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> cross_sro_trading_action_message_record.trading_action_reason[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Sro Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_cross_sro_trading_action_message(cross_sro_trading_action_message_record, cross_sro_trading_action_message_base) {
  ramp_message_info(cross_sro_trading_action_message_record.message_info, cross_sro_trading_action_message_base + 0);
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> cross_sro_trading_action_message_record.symbol_long[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 26 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_record.trading_action_code = (cross_sro_trading_action_message_base + 37 + 1) % 256;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> cross_sro_trading_action_message_record.trading_action_sequence_number[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 38 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.action_timestamp[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 42 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> cross_sro_trading_action_message_record.trading_action_reason[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 50 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Sro Trading Action Message to the wire, 56 bytes from where the cursor stands */
inline encode_cross_sro_trading_action_message(cross_sro_trading_action_message_record) {
  encode_message_info(cross_sro_trading_action_message_record.message_info);
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> wire[at] = cross_sro_trading_action_message_record.symbol_long[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_sro_trading_action_message_record.trading_action_code; at = at + 1;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> wire[at] = cross_sro_trading_action_message_record.trading_action_sequence_number[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> wire[at] = cross_sro_trading_action_message_record.action_timestamp[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> wire[at] = cross_sro_trading_action_message_record.trading_action_reason[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Sro Trading Action Message off the wire, 56 bytes from where the cursor stands */
inline decode_cross_sro_trading_action_message(cross_sro_trading_action_message_record) {
  decode_message_info(cross_sro_trading_action_message_record.message_info);
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> cross_sro_trading_action_message_record.symbol_long[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_record.trading_action_code = wire[at]; at = at + 1;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> cross_sro_trading_action_message_record.trading_action_sequence_number[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.action_timestamp[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> cross_sro_trading_action_message_record.trading_action_reason[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Sro Trading Action Message is what was written, byte for byte */
inline equal_cross_sro_trading_action_message(cross_sro_trading_action_message_read, cross_sro_trading_action_message_written) {
  equal_message_info(cross_sro_trading_action_message_read.message_info, cross_sro_trading_action_message_written.message_info);
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> assert(cross_sro_trading_action_message_read.symbol_long[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.symbol_long[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  assert(cross_sro_trading_action_message_read.trading_action_code == cross_sro_trading_action_message_written.trading_action_code);
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> assert(cross_sro_trading_action_message_read.trading_action_sequence_number[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.trading_action_sequence_number[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> assert(cross_sro_trading_action_message_read.action_timestamp[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.action_timestamp[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> assert(cross_sro_trading_action_message_read.trading_action_reason[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.trading_action_reason[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Center Trading Action Message: 47 bytes -------------------------- */

/* This fixed format message will inform UTP data feed subscribers of when a UTP participant invokes or releases a market center-specific trading halt for a NASDAQ-listed security. */
typedef MarketCenterTradingActionMessage {
  MessageInfo message_info;
  byte symbol_long[11];
  byte trading_action_code;
  byte action_timestamp[8];
  byte market_center_identifier
};

int market_center_trading_action_message_at;

/* every byte of Market Center Trading Action Message set to one value */
inline fill_market_center_trading_action_message(market_center_trading_action_message_record, market_center_trading_action_message_value) {
  fill_message_info(market_center_trading_action_message_record.message_info, market_center_trading_action_message_value);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.trading_action_code = market_center_trading_action_message_value;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_timestamp[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.market_center_identifier = market_center_trading_action_message_value;
  skip
}

/* each byte of Market Center Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_market_center_trading_action_message(market_center_trading_action_message_record, market_center_trading_action_message_base) {
  ramp_message_info(market_center_trading_action_message_record.message_info, market_center_trading_action_message_base + 0);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 26 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.trading_action_code = (market_center_trading_action_message_base + 37 + 1) % 256;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_timestamp[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 38 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.market_center_identifier = (market_center_trading_action_message_base + 46 + 1) % 256;
  skip
}

/* Market Center Trading Action Message to the wire, 47 bytes from where the cursor stands */
inline encode_market_center_trading_action_message(market_center_trading_action_message_record) {
  encode_message_info(market_center_trading_action_message_record.message_info);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> wire[at] = market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = market_center_trading_action_message_record.trading_action_code; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.action_timestamp[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = market_center_trading_action_message_record.market_center_identifier; at = at + 1;
  skip
}

/* Market Center Trading Action Message off the wire, 47 bytes from where the cursor stands */
inline decode_market_center_trading_action_message(market_center_trading_action_message_record) {
  decode_message_info(market_center_trading_action_message_record.message_info);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.trading_action_code = wire[at]; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_timestamp[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.market_center_identifier = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Center Trading Action Message is what was written, byte for byte */
inline equal_market_center_trading_action_message(market_center_trading_action_message_read, market_center_trading_action_message_written) {
  equal_message_info(market_center_trading_action_message_read.message_info, market_center_trading_action_message_written.message_info);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> assert(market_center_trading_action_message_read.symbol_long[market_center_trading_action_message_at] == market_center_trading_action_message_written.symbol_long[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  assert(market_center_trading_action_message_read.trading_action_code == market_center_trading_action_message_written.trading_action_code);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.action_timestamp[market_center_trading_action_message_at] == market_center_trading_action_message_written.action_timestamp[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  assert(market_center_trading_action_message_read.market_center_identifier == market_center_trading_action_message_written.market_center_identifier);
  skip
}

/* ---- Issue Symbol Directory Message: 87 bytes -------------------------------- */

/* General Administrative */
typedef IssueSymbolDirectoryMessage {
  MessageInfo message_info;
  byte symbol_long[11];
  byte old_symbol[11];
  byte issue_name[30];
  byte issue_type;
  byte issue_subtype[2];
  byte market_tier;
  byte authenticity;
  byte short_sale_threshold_indicator;
  byte round_lot_size[2];
  byte financial_status_indicator
};

int issue_symbol_directory_message_at;

/* every byte of Issue Symbol Directory Message set to one value */
inline fill_issue_symbol_directory_message(issue_symbol_directory_message_record, issue_symbol_directory_message_value) {
  fill_message_info(issue_symbol_directory_message_record.message_info, issue_symbol_directory_message_value);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.symbol_long[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.old_symbol[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> issue_symbol_directory_message_record.issue_name[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.issue_type = issue_symbol_directory_message_value;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.issue_subtype[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.market_tier = issue_symbol_directory_message_value;
  issue_symbol_directory_message_record.authenticity = issue_symbol_directory_message_value;
  issue_symbol_directory_message_record.short_sale_threshold_indicator = issue_symbol_directory_message_value;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.round_lot_size[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.financial_status_indicator = issue_symbol_directory_message_value;
  skip
}

/* each byte of Issue Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_issue_symbol_directory_message(issue_symbol_directory_message_record, issue_symbol_directory_message_base) {
  ramp_message_info(issue_symbol_directory_message_record.message_info, issue_symbol_directory_message_base + 0);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.symbol_long[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 26 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.old_symbol[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 37 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> issue_symbol_directory_message_record.issue_name[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 48 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.issue_type = (issue_symbol_directory_message_base + 78 + 1) % 256;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.issue_subtype[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 79 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.market_tier = (issue_symbol_directory_message_base + 81 + 1) % 256;
  issue_symbol_directory_message_record.authenticity = (issue_symbol_directory_message_base + 82 + 1) % 256;
  issue_symbol_directory_message_record.short_sale_threshold_indicator = (issue_symbol_directory_message_base + 83 + 1) % 256;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.round_lot_size[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 84 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.financial_status_indicator = (issue_symbol_directory_message_base + 86 + 1) % 256;
  skip
}

/* Issue Symbol Directory Message to the wire, 87 bytes from where the cursor stands */
inline encode_issue_symbol_directory_message(issue_symbol_directory_message_record) {
  encode_message_info(issue_symbol_directory_message_record.message_info);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> wire[at] = issue_symbol_directory_message_record.symbol_long[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> wire[at] = issue_symbol_directory_message_record.old_symbol[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> wire[at] = issue_symbol_directory_message_record.issue_name[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_symbol_directory_message_record.issue_type; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> wire[at] = issue_symbol_directory_message_record.issue_subtype[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_symbol_directory_message_record.market_tier; at = at + 1;
  wire[at] = issue_symbol_directory_message_record.authenticity; at = at + 1;
  wire[at] = issue_symbol_directory_message_record.short_sale_threshold_indicator; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> wire[at] = issue_symbol_directory_message_record.round_lot_size[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_symbol_directory_message_record.financial_status_indicator; at = at + 1;
  skip
}

/* Issue Symbol Directory Message off the wire, 87 bytes from where the cursor stands */
inline decode_issue_symbol_directory_message(issue_symbol_directory_message_record) {
  decode_message_info(issue_symbol_directory_message_record.message_info);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.symbol_long[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.old_symbol[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> issue_symbol_directory_message_record.issue_name[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.issue_type = wire[at]; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.issue_subtype[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.market_tier = wire[at]; at = at + 1;
  issue_symbol_directory_message_record.authenticity = wire[at]; at = at + 1;
  issue_symbol_directory_message_record.short_sale_threshold_indicator = wire[at]; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.round_lot_size[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.financial_status_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Issue Symbol Directory Message is what was written, byte for byte */
inline equal_issue_symbol_directory_message(issue_symbol_directory_message_read, issue_symbol_directory_message_written) {
  equal_message_info(issue_symbol_directory_message_read.message_info, issue_symbol_directory_message_written.message_info);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> assert(issue_symbol_directory_message_read.symbol_long[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.symbol_long[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> assert(issue_symbol_directory_message_read.old_symbol[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.old_symbol[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> assert(issue_symbol_directory_message_read.issue_name[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.issue_name[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(issue_symbol_directory_message_read.issue_type == issue_symbol_directory_message_written.issue_type);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> assert(issue_symbol_directory_message_read.issue_subtype[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.issue_subtype[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(issue_symbol_directory_message_read.market_tier == issue_symbol_directory_message_written.market_tier);
  assert(issue_symbol_directory_message_read.authenticity == issue_symbol_directory_message_written.authenticity);
  assert(issue_symbol_directory_message_read.short_sale_threshold_indicator == issue_symbol_directory_message_written.short_sale_threshold_indicator);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> assert(issue_symbol_directory_message_read.round_lot_size[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.round_lot_size[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(issue_symbol_directory_message_read.financial_status_indicator == issue_symbol_directory_message_written.financial_status_indicator);
  skip
}

/* ---- Regulation Sho Short Sale Price Test Restricted Indicator Message: 32 bytes ---- */

/* Used to disseminate quotation data for NASDAQ listed securities */
typedef RegulationShoShortSalePriceTestRestrictedIndicatorMessage {
  MessageInfo message_info;
  byte symbol_short[5];
  byte reg_sho_action
};

int regulation_sho_short_sale_price_test_restricted_indicator_message_at;

/* every byte of Regulation Sho Short Sale Price Test Restricted Indicator Message set to one value */
inline fill_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_record, regulation_sho_short_sale_price_test_restricted_indicator_message_value) {
  fill_message_info(regulation_sho_short_sale_price_test_restricted_indicator_message_record.message_info, regulation_sho_short_sale_price_test_restricted_indicator_message_value);
  regulation_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: regulation_sho_short_sale_price_test_restricted_indicator_message_at < 5 -> regulation_sho_short_sale_price_test_restricted_indicator_message_record.symbol_short[regulation_sho_short_sale_price_test_restricted_indicator_message_at] = regulation_sho_short_sale_price_test_restricted_indicator_message_value; regulation_sho_short_sale_price_test_restricted_indicator_message_at = regulation_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  regulation_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = regulation_sho_short_sale_price_test_restricted_indicator_message_value;
  skip
}

/* each byte of Regulation Sho Short Sale Price Test Restricted Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_record, regulation_sho_short_sale_price_test_restricted_indicator_message_base) {
  ramp_message_info(regulation_sho_short_sale_price_test_restricted_indicator_message_record.message_info, regulation_sho_short_sale_price_test_restricted_indicator_message_base + 0);
  regulation_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: regulation_sho_short_sale_price_test_restricted_indicator_message_at < 5 -> regulation_sho_short_sale_price_test_restricted_indicator_message_record.symbol_short[regulation_sho_short_sale_price_test_restricted_indicator_message_at] = (regulation_sho_short_sale_price_test_restricted_indicator_message_base + 26 + regulation_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; regulation_sho_short_sale_price_test_restricted_indicator_message_at = regulation_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  regulation_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = (regulation_sho_short_sale_price_test_restricted_indicator_message_base + 31 + 1) % 256;
  skip
}

/* Regulation Sho Short Sale Price Test Restricted Indicator Message to the wire, 32 bytes from where the cursor stands */
inline encode_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_record) {
  encode_message_info(regulation_sho_short_sale_price_test_restricted_indicator_message_record.message_info);
  regulation_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: regulation_sho_short_sale_price_test_restricted_indicator_message_at < 5 -> wire[at] = regulation_sho_short_sale_price_test_restricted_indicator_message_record.symbol_short[regulation_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; regulation_sho_short_sale_price_test_restricted_indicator_message_at = regulation_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = regulation_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Regulation Sho Short Sale Price Test Restricted Indicator Message off the wire, 32 bytes from where the cursor stands */
inline decode_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_record) {
  decode_message_info(regulation_sho_short_sale_price_test_restricted_indicator_message_record.message_info);
  regulation_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: regulation_sho_short_sale_price_test_restricted_indicator_message_at < 5 -> regulation_sho_short_sale_price_test_restricted_indicator_message_record.symbol_short[regulation_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; regulation_sho_short_sale_price_test_restricted_indicator_message_at = regulation_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  regulation_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Regulation Sho Short Sale Price Test Restricted Indicator Message is what was written, byte for byte */
inline equal_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_read, regulation_sho_short_sale_price_test_restricted_indicator_message_written) {
  equal_message_info(regulation_sho_short_sale_price_test_restricted_indicator_message_read.message_info, regulation_sho_short_sale_price_test_restricted_indicator_message_written.message_info);
  regulation_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: regulation_sho_short_sale_price_test_restricted_indicator_message_at < 5 -> assert(regulation_sho_short_sale_price_test_restricted_indicator_message_read.symbol_short[regulation_sho_short_sale_price_test_restricted_indicator_message_at] == regulation_sho_short_sale_price_test_restricted_indicator_message_written.symbol_short[regulation_sho_short_sale_price_test_restricted_indicator_message_at]); regulation_sho_short_sale_price_test_restricted_indicator_message_at = regulation_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  assert(regulation_sho_short_sale_price_test_restricted_indicator_message_read.reg_sho_action == regulation_sho_short_sale_price_test_restricted_indicator_message_written.reg_sho_action);
  skip
}

/* ---- Limit Up Limit Down Price Band Message: 62 bytes ------------------------ */

/* Designed to prevent trades in individual NMS Stocks from occurring outside of specified Upper and Lower Limit Price Bands */
typedef LimitUpLimitDownPriceBandMessage {
  MessageInfo message_info;
  byte symbol_long[11];
  byte luld_price_band_indicator;
  byte luld_timestamp[8];
  byte limit_down_price[8];
  byte limit_up_price[8]
};

int limit_up_limit_down_price_band_message_at;

/* every byte of Limit Up Limit Down Price Band Message set to one value */
inline fill_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_record, limit_up_limit_down_price_band_message_value) {
  fill_message_info(limit_up_limit_down_price_band_message_record.message_info, limit_up_limit_down_price_band_message_value);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> limit_up_limit_down_price_band_message_record.symbol_long[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_record.luld_price_band_indicator = limit_up_limit_down_price_band_message_value;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.luld_timestamp[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_down_price[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_up_price[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Limit Up Limit Down Price Band Message set to where it lies, so a field read out of place says so */
inline ramp_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_record, limit_up_limit_down_price_band_message_base) {
  ramp_message_info(limit_up_limit_down_price_band_message_record.message_info, limit_up_limit_down_price_band_message_base + 0);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> limit_up_limit_down_price_band_message_record.symbol_long[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 26 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_record.luld_price_band_indicator = (limit_up_limit_down_price_band_message_base + 37 + 1) % 256;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.luld_timestamp[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 38 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_down_price[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 46 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_up_price[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 54 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* Limit Up Limit Down Price Band Message to the wire, 62 bytes from where the cursor stands */
inline encode_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_record) {
  encode_message_info(limit_up_limit_down_price_band_message_record.message_info);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> wire[at] = limit_up_limit_down_price_band_message_record.symbol_long[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  wire[at] = limit_up_limit_down_price_band_message_record.luld_price_band_indicator; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.luld_timestamp[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.limit_down_price[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.limit_up_price[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* Limit Up Limit Down Price Band Message off the wire, 62 bytes from where the cursor stands */
inline decode_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_record) {
  decode_message_info(limit_up_limit_down_price_band_message_record.message_info);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> limit_up_limit_down_price_band_message_record.symbol_long[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_record.luld_price_band_indicator = wire[at]; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.luld_timestamp[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_down_price[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_up_price[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Limit Up Limit Down Price Band Message is what was written, byte for byte */
inline equal_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_read, limit_up_limit_down_price_band_message_written) {
  equal_message_info(limit_up_limit_down_price_band_message_read.message_info, limit_up_limit_down_price_band_message_written.message_info);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> assert(limit_up_limit_down_price_band_message_read.symbol_long[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.symbol_long[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  assert(limit_up_limit_down_price_band_message_read.luld_price_band_indicator == limit_up_limit_down_price_band_message_written.luld_price_band_indicator);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.luld_timestamp[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.luld_timestamp[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.limit_down_price[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.limit_down_price[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.limit_up_price[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.limit_up_price[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Wide Circuit Breaker Decline Level Message: 50 bytes ------------- */

/* A Market Wide Circuit Breaker (MWCB) Level message will inform participants and the UTP data recipients what the daily MWCB breach points are set to for the current trading day */
typedef MarketWideCircuitBreakerDeclineLevelMessage {
  MessageInfo message_info;
  byte mwcb_level_1[8];
  byte mwcb_level_2[8];
  byte mwcb_level_3[8]
};

int market_wide_circuit_breaker_decline_level_message_at;

/* every byte of Market Wide Circuit Breaker Decline Level Message set to one value */
inline fill_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_record, market_wide_circuit_breaker_decline_level_message_value) {
  fill_message_info(market_wide_circuit_breaker_decline_level_message_record.message_info, market_wide_circuit_breaker_decline_level_message_value);
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Wide Circuit Breaker Decline Level Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_record, market_wide_circuit_breaker_decline_level_message_base) {
  ramp_message_info(market_wide_circuit_breaker_decline_level_message_record.message_info, market_wide_circuit_breaker_decline_level_message_base + 0);
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 26 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 34 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 42 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Wide Circuit Breaker Decline Level Message to the wire, 50 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_record) {
  encode_message_info(market_wide_circuit_breaker_decline_level_message_record.message_info);
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Wide Circuit Breaker Decline Level Message off the wire, 50 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_record) {
  decode_message_info(market_wide_circuit_breaker_decline_level_message_record.message_info);
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Wide Circuit Breaker Decline Level Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_read, market_wide_circuit_breaker_decline_level_message_written) {
  equal_message_info(market_wide_circuit_breaker_decline_level_message_read.message_info, market_wide_circuit_breaker_decline_level_message_written.message_info);
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Wide Circuit Breaker Status Message: 27 bytes -------------------- */

/* A Market Wide Circuit Breaker (MWCB) Status message will inform participants and the UTP data recipients when a MWCB has breached one of the established levels. */
typedef MarketWideCircuitBreakerStatusMessage {
  MessageInfo message_info;
  byte mwcb_status_level_indicator
};

/* every byte of Market Wide Circuit Breaker Status Message set to one value */
inline fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_value) {
  fill_message_info(market_wide_circuit_breaker_status_message_record.message_info, market_wide_circuit_breaker_status_message_value);
  market_wide_circuit_breaker_status_message_record.mwcb_status_level_indicator = market_wide_circuit_breaker_status_message_value;
  skip
}

/* each byte of Market Wide Circuit Breaker Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_base) {
  ramp_message_info(market_wide_circuit_breaker_status_message_record.message_info, market_wide_circuit_breaker_status_message_base + 0);
  market_wide_circuit_breaker_status_message_record.mwcb_status_level_indicator = (market_wide_circuit_breaker_status_message_base + 26 + 1) % 256;
  skip
}

/* Market Wide Circuit Breaker Status Message to the wire, 27 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  encode_message_info(market_wide_circuit_breaker_status_message_record.message_info);
  wire[at] = market_wide_circuit_breaker_status_message_record.mwcb_status_level_indicator; at = at + 1;
  skip
}

/* Market Wide Circuit Breaker Status Message off the wire, 27 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  decode_message_info(market_wide_circuit_breaker_status_message_record.message_info);
  market_wide_circuit_breaker_status_message_record.mwcb_status_level_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Wide Circuit Breaker Status Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_read, market_wide_circuit_breaker_status_message_written) {
  equal_message_info(market_wide_circuit_breaker_status_message_read.message_info, market_wide_circuit_breaker_status_message_written.message_info);
  assert(market_wide_circuit_breaker_status_message_read.mwcb_status_level_indicator == market_wide_circuit_breaker_status_message_written.mwcb_status_level_indicator);
  skip
}

/* ---- Auction Collar Message: 66 bytes ---------------------------------------- */

/* Primary markets using an automated reopening will calculate new Auction Collars, in compliance with rules around prices for re-opening, when applicable and publish this new Auction Collar Message */
typedef AuctionCollarMessage {
  MessageInfo message_info;
  byte symbol_long[11];
  byte trading_action_sequence_number[4];
  byte collar_reference_price[8];
  byte collar_up_price[8];
  byte collar_down_price[8];
  byte collar_extension_indicator
};

int auction_collar_message_at;

/* every byte of Auction Collar Message set to one value */
inline fill_auction_collar_message(auction_collar_message_record, auction_collar_message_value) {
  fill_message_info(auction_collar_message_record.message_info, auction_collar_message_value);
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> auction_collar_message_record.symbol_long[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> auction_collar_message_record.trading_action_sequence_number[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_reference_price[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_up_price[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_down_price[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_record.collar_extension_indicator = auction_collar_message_value;
  skip
}

/* each byte of Auction Collar Message set to where it lies, so a field read out of place says so */
inline ramp_auction_collar_message(auction_collar_message_record, auction_collar_message_base) {
  ramp_message_info(auction_collar_message_record.message_info, auction_collar_message_base + 0);
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> auction_collar_message_record.symbol_long[auction_collar_message_at] = (auction_collar_message_base + 26 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> auction_collar_message_record.trading_action_sequence_number[auction_collar_message_at] = (auction_collar_message_base + 37 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_reference_price[auction_collar_message_at] = (auction_collar_message_base + 41 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_up_price[auction_collar_message_at] = (auction_collar_message_base + 49 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_down_price[auction_collar_message_at] = (auction_collar_message_base + 57 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_record.collar_extension_indicator = (auction_collar_message_base + 65 + 1) % 256;
  skip
}

/* Auction Collar Message to the wire, 66 bytes from where the cursor stands */
inline encode_auction_collar_message(auction_collar_message_record) {
  encode_message_info(auction_collar_message_record.message_info);
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> wire[at] = auction_collar_message_record.symbol_long[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> wire[at] = auction_collar_message_record.trading_action_sequence_number[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.collar_reference_price[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.collar_up_price[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.collar_down_price[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_collar_message_record.collar_extension_indicator; at = at + 1;
  skip
}

/* Auction Collar Message off the wire, 66 bytes from where the cursor stands */
inline decode_auction_collar_message(auction_collar_message_record) {
  decode_message_info(auction_collar_message_record.message_info);
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> auction_collar_message_record.symbol_long[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> auction_collar_message_record.trading_action_sequence_number[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_reference_price[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_up_price[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_down_price[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_record.collar_extension_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Collar Message is what was written, byte for byte */
inline equal_auction_collar_message(auction_collar_message_read, auction_collar_message_written) {
  equal_message_info(auction_collar_message_read.message_info, auction_collar_message_written.message_info);
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> assert(auction_collar_message_read.symbol_long[auction_collar_message_at] == auction_collar_message_written.symbol_long[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> assert(auction_collar_message_read.trading_action_sequence_number[auction_collar_message_at] == auction_collar_message_written.trading_action_sequence_number[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.collar_reference_price[auction_collar_message_at] == auction_collar_message_written.collar_reference_price[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.collar_up_price[auction_collar_message_at] == auction_collar_message_written.collar_up_price[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.collar_down_price[auction_collar_message_at] == auction_collar_message_written.collar_down_price[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  assert(auction_collar_message_read.collar_extension_indicator == auction_collar_message_written.collar_extension_indicator);
  skip
}

/* ---- Start Of Day Message: 26 bytes ------------------------------------------ */

/* The Start of Day control message signifies the beginning of each operational cycle for SIP Processing */
typedef StartOfDayMessage {
  MessageInfo message_info
};

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  fill_message_info(start_of_day_message_record.message_info, start_of_day_message_value);
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  ramp_message_info(start_of_day_message_record.message_info, start_of_day_message_base + 0);
  skip
}

/* Start Of Day Message to the wire, 26 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  encode_message_info(start_of_day_message_record.message_info);
  skip
}

/* Start Of Day Message off the wire, 26 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  decode_message_info(start_of_day_message_record.message_info);
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  equal_message_info(start_of_day_message_read.message_info, start_of_day_message_written.message_info);
  skip
}

/* ---- End Of Day Message: 26 bytes -------------------------------------------- */

/* The End of Day control message signals the end of active message dissemination for the UTP SIP operational cycle */
typedef EndOfDayMessage {
  MessageInfo message_info
};

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  fill_message_info(end_of_day_message_record.message_info, end_of_day_message_value);
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  ramp_message_info(end_of_day_message_record.message_info, end_of_day_message_base + 0);
  skip
}

/* End Of Day Message to the wire, 26 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  encode_message_info(end_of_day_message_record.message_info);
  skip
}

/* End Of Day Message off the wire, 26 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  decode_message_info(end_of_day_message_record.message_info);
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  equal_message_info(end_of_day_message_read.message_info, end_of_day_message_written.message_info);
  skip
}

/* ---- Market Session Open Message: 26 bytes ----------------------------------- */

/* The Market Session Open Control Message signifies the opening of market systems for the session indicated in the Message Header */
typedef MarketSessionOpenMessage {
  MessageInfo message_info
};

/* every byte of Market Session Open Message set to one value */
inline fill_market_session_open_message(market_session_open_message_record, market_session_open_message_value) {
  fill_message_info(market_session_open_message_record.message_info, market_session_open_message_value);
  skip
}

/* each byte of Market Session Open Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_open_message(market_session_open_message_record, market_session_open_message_base) {
  ramp_message_info(market_session_open_message_record.message_info, market_session_open_message_base + 0);
  skip
}

/* Market Session Open Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_session_open_message(market_session_open_message_record) {
  encode_message_info(market_session_open_message_record.message_info);
  skip
}

/* Market Session Open Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_session_open_message(market_session_open_message_record) {
  decode_message_info(market_session_open_message_record.message_info);
  skip
}

/* what was read of Market Session Open Message is what was written, byte for byte */
inline equal_market_session_open_message(market_session_open_message_read, market_session_open_message_written) {
  equal_message_info(market_session_open_message_read.message_info, market_session_open_message_written.message_info);
  skip
}

/* ---- Market Session Close Message: 26 bytes ---------------------------------- */

/* The Session Close Control Message signals the closing of market systems for the session indicated in the Message Header */
typedef MarketSessionCloseMessage {
  MessageInfo message_info
};

/* every byte of Market Session Close Message set to one value */
inline fill_market_session_close_message(market_session_close_message_record, market_session_close_message_value) {
  fill_message_info(market_session_close_message_record.message_info, market_session_close_message_value);
  skip
}

/* each byte of Market Session Close Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_close_message(market_session_close_message_record, market_session_close_message_base) {
  ramp_message_info(market_session_close_message_record.message_info, market_session_close_message_base + 0);
  skip
}

/* Market Session Close Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_session_close_message(market_session_close_message_record) {
  encode_message_info(market_session_close_message_record.message_info);
  skip
}

/* Market Session Close Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_session_close_message(market_session_close_message_record) {
  decode_message_info(market_session_close_message_record.message_info);
  skip
}

/* what was read of Market Session Close Message is what was written, byte for byte */
inline equal_market_session_close_message(market_session_close_message_read, market_session_close_message_written) {
  equal_message_info(market_session_close_message_read.message_info, market_session_close_message_written.message_info);
  skip
}

/* ---- End Of Transmissions Message: 26 bytes ---------------------------------- */

/* The End of Transmissions Message signals that there will be no further transmissions of data sent through the UTP SIP line */
typedef EndOfTransmissionsMessage {
  MessageInfo message_info
};

/* every byte of End Of Transmissions Message set to one value */
inline fill_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_value) {
  fill_message_info(end_of_transmissions_message_record.message_info, end_of_transmissions_message_value);
  skip
}

/* each byte of End Of Transmissions Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_base) {
  ramp_message_info(end_of_transmissions_message_record.message_info, end_of_transmissions_message_base + 0);
  skip
}

/* End Of Transmissions Message to the wire, 26 bytes from where the cursor stands */
inline encode_end_of_transmissions_message(end_of_transmissions_message_record) {
  encode_message_info(end_of_transmissions_message_record.message_info);
  skip
}

/* End Of Transmissions Message off the wire, 26 bytes from where the cursor stands */
inline decode_end_of_transmissions_message(end_of_transmissions_message_record) {
  decode_message_info(end_of_transmissions_message_record.message_info);
  skip
}

/* what was read of End Of Transmissions Message is what was written, byte for byte */
inline equal_end_of_transmissions_message(end_of_transmissions_message_read, end_of_transmissions_message_written) {
  equal_message_info(end_of_transmissions_message_read.message_info, end_of_transmissions_message_written.message_info);
  skip
}

/* ---- Quote Wipe Out Message: 26 bytes ---------------------------------------- */

/* The Quote Wipe-Out message will be sent to indicate that a UTP Participant is experiencing a problem with their internal systems and, as a result, are not able to update their UTP BBO quotation information */
typedef QuoteWipeOutMessage {
  MessageInfo message_info
};

/* every byte of Quote Wipe Out Message set to one value */
inline fill_quote_wipe_out_message(quote_wipe_out_message_record, quote_wipe_out_message_value) {
  fill_message_info(quote_wipe_out_message_record.message_info, quote_wipe_out_message_value);
  skip
}

/* each byte of Quote Wipe Out Message set to where it lies, so a field read out of place says so */
inline ramp_quote_wipe_out_message(quote_wipe_out_message_record, quote_wipe_out_message_base) {
  ramp_message_info(quote_wipe_out_message_record.message_info, quote_wipe_out_message_base + 0);
  skip
}

/* Quote Wipe Out Message to the wire, 26 bytes from where the cursor stands */
inline encode_quote_wipe_out_message(quote_wipe_out_message_record) {
  encode_message_info(quote_wipe_out_message_record.message_info);
  skip
}

/* Quote Wipe Out Message off the wire, 26 bytes from where the cursor stands */
inline decode_quote_wipe_out_message(quote_wipe_out_message_record) {
  decode_message_info(quote_wipe_out_message_record.message_info);
  skip
}

/* what was read of Quote Wipe Out Message is what was written, byte for byte */
inline equal_quote_wipe_out_message(quote_wipe_out_message_read, quote_wipe_out_message_written) {
  equal_message_info(quote_wipe_out_message_read.message_info, quote_wipe_out_message_written.message_info);
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
    assert(at == 20);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 20);
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

/* Message Info: encoded, read back, and compared */
proctype check_message_info() {
  MessageInfo message_info_sent;
  MessageInfo message_info_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_info(message_info_sent, 0)
  :: pattern == 1 -> fill_message_info(message_info_sent, 32)
  :: pattern == 2 -> fill_message_info(message_info_sent, 255)
  :: else -> ramp_message_info(message_info_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_info(message_info_sent);
    assert(at == 26);
    at = 0;
    decode_message_info(message_info_got);
    assert(at == 26);
    equal_message_info(message_info_got, message_info_sent)
  }
}

/* Finra Adf Market Participant Quotation Message: encoded, read back, and compared */
proctype check_finra_adf_market_participant_quotation_message() {
  FinraAdfMarketParticipantQuotationMessage finra_adf_market_participant_quotation_message_sent;
  FinraAdfMarketParticipantQuotationMessage finra_adf_market_participant_quotation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_sent, 0)
  :: pattern == 1 -> fill_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_sent, 32)
  :: pattern == 2 -> fill_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_sent, 255)
  :: else -> ramp_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_sent);
    assert(at == 74);
    at = 0;
    decode_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_got);
    assert(at == 74);
    equal_finra_adf_market_participant_quotation_message(finra_adf_market_participant_quotation_message_got, finra_adf_market_participant_quotation_message_sent)
  }
}

/* Cross Sro Trading Action Message: encoded, read back, and compared */
proctype check_cross_sro_trading_action_message() {
  CrossSroTradingActionMessage cross_sro_trading_action_message_sent;
  CrossSroTradingActionMessage cross_sro_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_sro_trading_action_message(cross_sro_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_cross_sro_trading_action_message(cross_sro_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_cross_sro_trading_action_message(cross_sro_trading_action_message_sent, 255)
  :: else -> ramp_cross_sro_trading_action_message(cross_sro_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_sro_trading_action_message(cross_sro_trading_action_message_sent);
    assert(at == 56);
    at = 0;
    decode_cross_sro_trading_action_message(cross_sro_trading_action_message_got);
    assert(at == 56);
    equal_cross_sro_trading_action_message(cross_sro_trading_action_message_got, cross_sro_trading_action_message_sent)
  }
}

/* Market Center Trading Action Message: encoded, read back, and compared */
proctype check_market_center_trading_action_message() {
  MarketCenterTradingActionMessage market_center_trading_action_message_sent;
  MarketCenterTradingActionMessage market_center_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_center_trading_action_message(market_center_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_market_center_trading_action_message(market_center_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_market_center_trading_action_message(market_center_trading_action_message_sent, 255)
  :: else -> ramp_market_center_trading_action_message(market_center_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_center_trading_action_message(market_center_trading_action_message_sent);
    assert(at == 47);
    at = 0;
    decode_market_center_trading_action_message(market_center_trading_action_message_got);
    assert(at == 47);
    equal_market_center_trading_action_message(market_center_trading_action_message_got, market_center_trading_action_message_sent)
  }
}

/* Issue Symbol Directory Message: encoded, read back, and compared */
proctype check_issue_symbol_directory_message() {
  IssueSymbolDirectoryMessage issue_symbol_directory_message_sent;
  IssueSymbolDirectoryMessage issue_symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_issue_symbol_directory_message(issue_symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_issue_symbol_directory_message(issue_symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_issue_symbol_directory_message(issue_symbol_directory_message_sent, 255)
  :: else -> ramp_issue_symbol_directory_message(issue_symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_issue_symbol_directory_message(issue_symbol_directory_message_sent);
    assert(at == 87);
    at = 0;
    decode_issue_symbol_directory_message(issue_symbol_directory_message_got);
    assert(at == 87);
    equal_issue_symbol_directory_message(issue_symbol_directory_message_got, issue_symbol_directory_message_sent)
  }
}

/* Regulation Sho Short Sale Price Test Restricted Indicator Message: encoded, read back, and compared */
proctype check_regulation_sho_short_sale_price_test_restricted_indicator_message() {
  RegulationShoShortSalePriceTestRestrictedIndicatorMessage regulation_sho_short_sale_price_test_restricted_indicator_message_sent;
  RegulationShoShortSalePriceTestRestrictedIndicatorMessage regulation_sho_short_sale_price_test_restricted_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  :: pattern == 1 -> fill_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_sent, 32)
  :: pattern == 2 -> fill_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_sent, 255)
  :: else -> ramp_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_sent);
    assert(at == 32);
    at = 0;
    decode_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_got);
    assert(at == 32);
    equal_regulation_sho_short_sale_price_test_restricted_indicator_message(regulation_sho_short_sale_price_test_restricted_indicator_message_got, regulation_sho_short_sale_price_test_restricted_indicator_message_sent)
  }
}

/* Limit Up Limit Down Price Band Message: encoded, read back, and compared */
proctype check_limit_up_limit_down_price_band_message() {
  LimitUpLimitDownPriceBandMessage limit_up_limit_down_price_band_message_sent;
  LimitUpLimitDownPriceBandMessage limit_up_limit_down_price_band_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent, 0)
  :: pattern == 1 -> fill_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent, 32)
  :: pattern == 2 -> fill_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent, 255)
  :: else -> ramp_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent);
    assert(at == 62);
    at = 0;
    decode_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_got);
    assert(at == 62);
    equal_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_got, limit_up_limit_down_price_band_message_sent)
  }
}

/* Market Wide Circuit Breaker Decline Level Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_decline_level_message() {
  MarketWideCircuitBreakerDeclineLevelMessage market_wide_circuit_breaker_decline_level_message_sent;
  MarketWideCircuitBreakerDeclineLevelMessage market_wide_circuit_breaker_decline_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent);
    assert(at == 50);
    at = 0;
    decode_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_got);
    assert(at == 50);
    equal_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_got, market_wide_circuit_breaker_decline_level_message_sent)
  }
}

/* Market Wide Circuit Breaker Status Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_status_message() {
  MarketWideCircuitBreakerStatusMessage market_wide_circuit_breaker_status_message_sent;
  MarketWideCircuitBreakerStatusMessage market_wide_circuit_breaker_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent);
    assert(at == 27);
    at = 0;
    decode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_got);
    assert(at == 27);
    equal_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_got, market_wide_circuit_breaker_status_message_sent)
  }
}

/* Auction Collar Message: encoded, read back, and compared */
proctype check_auction_collar_message() {
  AuctionCollarMessage auction_collar_message_sent;
  AuctionCollarMessage auction_collar_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_collar_message(auction_collar_message_sent, 0)
  :: pattern == 1 -> fill_auction_collar_message(auction_collar_message_sent, 32)
  :: pattern == 2 -> fill_auction_collar_message(auction_collar_message_sent, 255)
  :: else -> ramp_auction_collar_message(auction_collar_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_collar_message(auction_collar_message_sent);
    assert(at == 66);
    at = 0;
    decode_auction_collar_message(auction_collar_message_got);
    assert(at == 66);
    equal_auction_collar_message(auction_collar_message_got, auction_collar_message_sent)
  }
}

/* Start Of Day Message: encoded, read back, and compared */
proctype check_start_of_day_message() {
  StartOfDayMessage start_of_day_message_sent;
  StartOfDayMessage start_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_day_message(start_of_day_message_sent, 0)
  :: pattern == 1 -> fill_start_of_day_message(start_of_day_message_sent, 32)
  :: pattern == 2 -> fill_start_of_day_message(start_of_day_message_sent, 255)
  :: else -> ramp_start_of_day_message(start_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_day_message(start_of_day_message_sent);
    assert(at == 26);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 26);
    equal_start_of_day_message(start_of_day_message_got, start_of_day_message_sent)
  }
}

/* End Of Day Message: encoded, read back, and compared */
proctype check_end_of_day_message() {
  EndOfDayMessage end_of_day_message_sent;
  EndOfDayMessage end_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_day_message(end_of_day_message_sent, 0)
  :: pattern == 1 -> fill_end_of_day_message(end_of_day_message_sent, 32)
  :: pattern == 2 -> fill_end_of_day_message(end_of_day_message_sent, 255)
  :: else -> ramp_end_of_day_message(end_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_day_message(end_of_day_message_sent);
    assert(at == 26);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 26);
    equal_end_of_day_message(end_of_day_message_got, end_of_day_message_sent)
  }
}

/* Market Session Open Message: encoded, read back, and compared */
proctype check_market_session_open_message() {
  MarketSessionOpenMessage market_session_open_message_sent;
  MarketSessionOpenMessage market_session_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_session_open_message(market_session_open_message_sent, 0)
  :: pattern == 1 -> fill_market_session_open_message(market_session_open_message_sent, 32)
  :: pattern == 2 -> fill_market_session_open_message(market_session_open_message_sent, 255)
  :: else -> ramp_market_session_open_message(market_session_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_session_open_message(market_session_open_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_session_open_message(market_session_open_message_got);
    assert(at == 26);
    equal_market_session_open_message(market_session_open_message_got, market_session_open_message_sent)
  }
}

/* Market Session Close Message: encoded, read back, and compared */
proctype check_market_session_close_message() {
  MarketSessionCloseMessage market_session_close_message_sent;
  MarketSessionCloseMessage market_session_close_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_session_close_message(market_session_close_message_sent, 0)
  :: pattern == 1 -> fill_market_session_close_message(market_session_close_message_sent, 32)
  :: pattern == 2 -> fill_market_session_close_message(market_session_close_message_sent, 255)
  :: else -> ramp_market_session_close_message(market_session_close_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_session_close_message(market_session_close_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_session_close_message(market_session_close_message_got);
    assert(at == 26);
    equal_market_session_close_message(market_session_close_message_got, market_session_close_message_sent)
  }
}

/* End Of Transmissions Message: encoded, read back, and compared */
proctype check_end_of_transmissions_message() {
  EndOfTransmissionsMessage end_of_transmissions_message_sent;
  EndOfTransmissionsMessage end_of_transmissions_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_transmissions_message(end_of_transmissions_message_sent, 0)
  :: pattern == 1 -> fill_end_of_transmissions_message(end_of_transmissions_message_sent, 32)
  :: pattern == 2 -> fill_end_of_transmissions_message(end_of_transmissions_message_sent, 255)
  :: else -> ramp_end_of_transmissions_message(end_of_transmissions_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_transmissions_message(end_of_transmissions_message_sent);
    assert(at == 26);
    at = 0;
    decode_end_of_transmissions_message(end_of_transmissions_message_got);
    assert(at == 26);
    equal_end_of_transmissions_message(end_of_transmissions_message_got, end_of_transmissions_message_sent)
  }
}

/* Quote Wipe Out Message: encoded, read back, and compared */
proctype check_quote_wipe_out_message() {
  QuoteWipeOutMessage quote_wipe_out_message_sent;
  QuoteWipeOutMessage quote_wipe_out_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_wipe_out_message(quote_wipe_out_message_sent, 0)
  :: pattern == 1 -> fill_quote_wipe_out_message(quote_wipe_out_message_sent, 32)
  :: pattern == 2 -> fill_quote_wipe_out_message(quote_wipe_out_message_sent, 255)
  :: else -> ramp_quote_wipe_out_message(quote_wipe_out_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_wipe_out_message(quote_wipe_out_message_sent);
    assert(at == 26);
    at = 0;
    decode_quote_wipe_out_message(quote_wipe_out_message_got);
    assert(at == 26);
    equal_quote_wipe_out_message(quote_wipe_out_message_got, quote_wipe_out_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_message_info()
  :: run check_finra_adf_market_participant_quotation_message()
  :: run check_cross_sro_trading_action_message()
  :: run check_market_center_trading_action_message()
  :: run check_issue_symbol_directory_message()
  :: run check_regulation_sho_short_sale_price_test_restricted_indicator_message()
  :: run check_limit_up_limit_down_price_band_message()
  :: run check_market_wide_circuit_breaker_decline_level_message()
  :: run check_market_wide_circuit_breaker_status_message()
  :: run check_auction_collar_message()
  :: run check_start_of_day_message()
  :: run check_end_of_day_message()
  :: run check_market_session_open_message()
  :: run check_market_session_close_message()
  :: run check_end_of_transmissions_message()
  :: run check_quote_wipe_out_message()
  fi
}
