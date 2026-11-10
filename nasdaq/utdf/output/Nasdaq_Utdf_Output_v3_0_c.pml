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
 *   - the dispatch that chooses a message by its type
 *   - a run counted by a field
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 173

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

/* Utp Mold Udp 64 Packet Header */
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

/* Utp Mold Udp 64 Message Header */
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

/* ---- Trade Report Message Short Form Message: 58 bytes ----------------------- */

/* Short-format Trade Report Message. To be retired with the Fractional Share Release on February 23, 2026. */
typedef TradeReportMessageShortFormMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_short[5];
  byte trade_id[8];
  byte trade_price_short[2];
  byte trade_volume_short[2];
  byte sale_condition[4];
  byte trade_through_exempt_flag;
  byte consolidated_price_change_indicator;
  byte participant_price_change_indicator
};

int trade_report_message_short_form_message_at;

/* every byte of Trade Report Message Short Form Message set to one value */
inline fill_trade_report_message_short_form_message(trade_report_message_short_form_message_record, trade_report_message_short_form_message_value) {
  trade_report_message_short_form_message_record.market_center_originator = trade_report_message_short_form_message_value;
  trade_report_message_short_form_message_record.sub_market_center_id = trade_report_message_short_form_message_value;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.sip_timestamp[trade_report_message_short_form_message_at] = trade_report_message_short_form_message_value; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.timestamp_1[trade_report_message_short_form_message_at] = trade_report_message_short_form_message_value; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.participant_token[trade_report_message_short_form_message_at] = trade_report_message_short_form_message_value; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.timestamp_2[trade_report_message_short_form_message_at] = trade_report_message_short_form_message_value; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 5 -> trade_report_message_short_form_message_record.symbol_short[trade_report_message_short_form_message_at] = trade_report_message_short_form_message_value; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.trade_id[trade_report_message_short_form_message_at] = trade_report_message_short_form_message_value; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> trade_report_message_short_form_message_record.trade_price_short[trade_report_message_short_form_message_at] = trade_report_message_short_form_message_value; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> trade_report_message_short_form_message_record.trade_volume_short[trade_report_message_short_form_message_at] = trade_report_message_short_form_message_value; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 4 -> trade_report_message_short_form_message_record.sale_condition[trade_report_message_short_form_message_at] = trade_report_message_short_form_message_value; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_record.trade_through_exempt_flag = trade_report_message_short_form_message_value;
  trade_report_message_short_form_message_record.consolidated_price_change_indicator = trade_report_message_short_form_message_value;
  trade_report_message_short_form_message_record.participant_price_change_indicator = trade_report_message_short_form_message_value;
  skip
}

/* each byte of Trade Report Message Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message_short_form_message(trade_report_message_short_form_message_record, trade_report_message_short_form_message_base) {
  trade_report_message_short_form_message_record.market_center_originator = (trade_report_message_short_form_message_base + 0 + 1) % 256;
  trade_report_message_short_form_message_record.sub_market_center_id = (trade_report_message_short_form_message_base + 1 + 1) % 256;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.sip_timestamp[trade_report_message_short_form_message_at] = (trade_report_message_short_form_message_base + 2 + trade_report_message_short_form_message_at + 1) % 256; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.timestamp_1[trade_report_message_short_form_message_at] = (trade_report_message_short_form_message_base + 10 + trade_report_message_short_form_message_at + 1) % 256; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.participant_token[trade_report_message_short_form_message_at] = (trade_report_message_short_form_message_base + 18 + trade_report_message_short_form_message_at + 1) % 256; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.timestamp_2[trade_report_message_short_form_message_at] = (trade_report_message_short_form_message_base + 26 + trade_report_message_short_form_message_at + 1) % 256; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 5 -> trade_report_message_short_form_message_record.symbol_short[trade_report_message_short_form_message_at] = (trade_report_message_short_form_message_base + 34 + trade_report_message_short_form_message_at + 1) % 256; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.trade_id[trade_report_message_short_form_message_at] = (trade_report_message_short_form_message_base + 39 + trade_report_message_short_form_message_at + 1) % 256; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> trade_report_message_short_form_message_record.trade_price_short[trade_report_message_short_form_message_at] = (trade_report_message_short_form_message_base + 47 + trade_report_message_short_form_message_at + 1) % 256; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> trade_report_message_short_form_message_record.trade_volume_short[trade_report_message_short_form_message_at] = (trade_report_message_short_form_message_base + 49 + trade_report_message_short_form_message_at + 1) % 256; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 4 -> trade_report_message_short_form_message_record.sale_condition[trade_report_message_short_form_message_at] = (trade_report_message_short_form_message_base + 51 + trade_report_message_short_form_message_at + 1) % 256; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_record.trade_through_exempt_flag = (trade_report_message_short_form_message_base + 55 + 1) % 256;
  trade_report_message_short_form_message_record.consolidated_price_change_indicator = (trade_report_message_short_form_message_base + 56 + 1) % 256;
  trade_report_message_short_form_message_record.participant_price_change_indicator = (trade_report_message_short_form_message_base + 57 + 1) % 256;
  skip
}

/* Trade Report Message Short Form Message to the wire, 58 bytes from where the cursor stands */
inline encode_trade_report_message_short_form_message(trade_report_message_short_form_message_record) {
  wire[at] = trade_report_message_short_form_message_record.market_center_originator; at = at + 1;
  wire[at] = trade_report_message_short_form_message_record.sub_market_center_id; at = at + 1;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> wire[at] = trade_report_message_short_form_message_record.sip_timestamp[trade_report_message_short_form_message_at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> wire[at] = trade_report_message_short_form_message_record.timestamp_1[trade_report_message_short_form_message_at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> wire[at] = trade_report_message_short_form_message_record.participant_token[trade_report_message_short_form_message_at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> wire[at] = trade_report_message_short_form_message_record.timestamp_2[trade_report_message_short_form_message_at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 5 -> wire[at] = trade_report_message_short_form_message_record.symbol_short[trade_report_message_short_form_message_at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> wire[at] = trade_report_message_short_form_message_record.trade_id[trade_report_message_short_form_message_at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> wire[at] = trade_report_message_short_form_message_record.trade_price_short[trade_report_message_short_form_message_at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> wire[at] = trade_report_message_short_form_message_record.trade_volume_short[trade_report_message_short_form_message_at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 4 -> wire[at] = trade_report_message_short_form_message_record.sale_condition[trade_report_message_short_form_message_at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_short_form_message_record.trade_through_exempt_flag; at = at + 1;
  wire[at] = trade_report_message_short_form_message_record.consolidated_price_change_indicator; at = at + 1;
  wire[at] = trade_report_message_short_form_message_record.participant_price_change_indicator; at = at + 1;
  skip
}

/* Trade Report Message Short Form Message off the wire, 58 bytes from where the cursor stands */
inline decode_trade_report_message_short_form_message(trade_report_message_short_form_message_record) {
  trade_report_message_short_form_message_record.market_center_originator = wire[at]; at = at + 1;
  trade_report_message_short_form_message_record.sub_market_center_id = wire[at]; at = at + 1;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.sip_timestamp[trade_report_message_short_form_message_at] = wire[at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.timestamp_1[trade_report_message_short_form_message_at] = wire[at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.participant_token[trade_report_message_short_form_message_at] = wire[at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.timestamp_2[trade_report_message_short_form_message_at] = wire[at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 5 -> trade_report_message_short_form_message_record.symbol_short[trade_report_message_short_form_message_at] = wire[at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> trade_report_message_short_form_message_record.trade_id[trade_report_message_short_form_message_at] = wire[at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> trade_report_message_short_form_message_record.trade_price_short[trade_report_message_short_form_message_at] = wire[at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> trade_report_message_short_form_message_record.trade_volume_short[trade_report_message_short_form_message_at] = wire[at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 4 -> trade_report_message_short_form_message_record.sale_condition[trade_report_message_short_form_message_at] = wire[at]; at = at + 1; trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_record.trade_through_exempt_flag = wire[at]; at = at + 1;
  trade_report_message_short_form_message_record.consolidated_price_change_indicator = wire[at]; at = at + 1;
  trade_report_message_short_form_message_record.participant_price_change_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Report Message Short Form Message is what was written, byte for byte */
inline equal_trade_report_message_short_form_message(trade_report_message_short_form_message_read, trade_report_message_short_form_message_written) {
  assert(trade_report_message_short_form_message_read.market_center_originator == trade_report_message_short_form_message_written.market_center_originator);
  assert(trade_report_message_short_form_message_read.sub_market_center_id == trade_report_message_short_form_message_written.sub_market_center_id);
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> assert(trade_report_message_short_form_message_read.sip_timestamp[trade_report_message_short_form_message_at] == trade_report_message_short_form_message_written.sip_timestamp[trade_report_message_short_form_message_at]); trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> assert(trade_report_message_short_form_message_read.timestamp_1[trade_report_message_short_form_message_at] == trade_report_message_short_form_message_written.timestamp_1[trade_report_message_short_form_message_at]); trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> assert(trade_report_message_short_form_message_read.participant_token[trade_report_message_short_form_message_at] == trade_report_message_short_form_message_written.participant_token[trade_report_message_short_form_message_at]); trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> assert(trade_report_message_short_form_message_read.timestamp_2[trade_report_message_short_form_message_at] == trade_report_message_short_form_message_written.timestamp_2[trade_report_message_short_form_message_at]); trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 5 -> assert(trade_report_message_short_form_message_read.symbol_short[trade_report_message_short_form_message_at] == trade_report_message_short_form_message_written.symbol_short[trade_report_message_short_form_message_at]); trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 8 -> assert(trade_report_message_short_form_message_read.trade_id[trade_report_message_short_form_message_at] == trade_report_message_short_form_message_written.trade_id[trade_report_message_short_form_message_at]); trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> assert(trade_report_message_short_form_message_read.trade_price_short[trade_report_message_short_form_message_at] == trade_report_message_short_form_message_written.trade_price_short[trade_report_message_short_form_message_at]); trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 2 -> assert(trade_report_message_short_form_message_read.trade_volume_short[trade_report_message_short_form_message_at] == trade_report_message_short_form_message_written.trade_volume_short[trade_report_message_short_form_message_at]); trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_short_form_message_at = 0;
  do
  :: trade_report_message_short_form_message_at < 4 -> assert(trade_report_message_short_form_message_read.sale_condition[trade_report_message_short_form_message_at] == trade_report_message_short_form_message_written.sale_condition[trade_report_message_short_form_message_at]); trade_report_message_short_form_message_at = trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_short_form_message_read.trade_through_exempt_flag == trade_report_message_short_form_message_written.trade_through_exempt_flag);
  assert(trade_report_message_short_form_message_read.consolidated_price_change_indicator == trade_report_message_short_form_message_written.consolidated_price_change_indicator);
  assert(trade_report_message_short_form_message_read.participant_price_change_indicator == trade_report_message_short_form_message_written.participant_price_change_indicator);
  skip
}

/* ---- Trade Report Message Long Form Message: 74 bytes ------------------------ */

/* Long-format Trade Report Message. To be retired with the Fractional Share Release on February 23, 2026. */
typedef TradeReportMessageLongFormMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_id[8];
  byte trade_price_long[8];
  byte trade_volume_long[4];
  byte sale_condition[4];
  byte trade_through_exempt_flag;
  byte sellers_sale_days[2];
  byte consolidated_price_change_indicator;
  byte participant_price_change_indicator
};

int trade_report_message_long_form_message_at;

/* every byte of Trade Report Message Long Form Message set to one value */
inline fill_trade_report_message_long_form_message(trade_report_message_long_form_message_record, trade_report_message_long_form_message_value) {
  trade_report_message_long_form_message_record.market_center_originator = trade_report_message_long_form_message_value;
  trade_report_message_long_form_message_record.sub_market_center_id = trade_report_message_long_form_message_value;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.sip_timestamp[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.timestamp_1[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.participant_token[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.timestamp_2[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 11 -> trade_report_message_long_form_message_record.symbol_long[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.trade_id[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.trade_price_long[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> trade_report_message_long_form_message_record.trade_volume_long[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> trade_report_message_long_form_message_record.sale_condition[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_record.trade_through_exempt_flag = trade_report_message_long_form_message_value;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 2 -> trade_report_message_long_form_message_record.sellers_sale_days[trade_report_message_long_form_message_at] = trade_report_message_long_form_message_value; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_record.consolidated_price_change_indicator = trade_report_message_long_form_message_value;
  trade_report_message_long_form_message_record.participant_price_change_indicator = trade_report_message_long_form_message_value;
  skip
}

/* each byte of Trade Report Message Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message_long_form_message(trade_report_message_long_form_message_record, trade_report_message_long_form_message_base) {
  trade_report_message_long_form_message_record.market_center_originator = (trade_report_message_long_form_message_base + 0 + 1) % 256;
  trade_report_message_long_form_message_record.sub_market_center_id = (trade_report_message_long_form_message_base + 1 + 1) % 256;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.sip_timestamp[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 2 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.timestamp_1[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 10 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.participant_token[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 18 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.timestamp_2[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 26 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 11 -> trade_report_message_long_form_message_record.symbol_long[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 34 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.trade_id[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 45 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.trade_price_long[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 53 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> trade_report_message_long_form_message_record.trade_volume_long[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 61 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> trade_report_message_long_form_message_record.sale_condition[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 65 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_record.trade_through_exempt_flag = (trade_report_message_long_form_message_base + 69 + 1) % 256;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 2 -> trade_report_message_long_form_message_record.sellers_sale_days[trade_report_message_long_form_message_at] = (trade_report_message_long_form_message_base + 70 + trade_report_message_long_form_message_at + 1) % 256; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_record.consolidated_price_change_indicator = (trade_report_message_long_form_message_base + 72 + 1) % 256;
  trade_report_message_long_form_message_record.participant_price_change_indicator = (trade_report_message_long_form_message_base + 73 + 1) % 256;
  skip
}

/* Trade Report Message Long Form Message to the wire, 74 bytes from where the cursor stands */
inline encode_trade_report_message_long_form_message(trade_report_message_long_form_message_record) {
  wire[at] = trade_report_message_long_form_message_record.market_center_originator; at = at + 1;
  wire[at] = trade_report_message_long_form_message_record.sub_market_center_id; at = at + 1;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> wire[at] = trade_report_message_long_form_message_record.sip_timestamp[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> wire[at] = trade_report_message_long_form_message_record.timestamp_1[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> wire[at] = trade_report_message_long_form_message_record.participant_token[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> wire[at] = trade_report_message_long_form_message_record.timestamp_2[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 11 -> wire[at] = trade_report_message_long_form_message_record.symbol_long[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> wire[at] = trade_report_message_long_form_message_record.trade_id[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> wire[at] = trade_report_message_long_form_message_record.trade_price_long[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> wire[at] = trade_report_message_long_form_message_record.trade_volume_long[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> wire[at] = trade_report_message_long_form_message_record.sale_condition[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_long_form_message_record.trade_through_exempt_flag; at = at + 1;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 2 -> wire[at] = trade_report_message_long_form_message_record.sellers_sale_days[trade_report_message_long_form_message_at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_long_form_message_record.consolidated_price_change_indicator; at = at + 1;
  wire[at] = trade_report_message_long_form_message_record.participant_price_change_indicator; at = at + 1;
  skip
}

/* Trade Report Message Long Form Message off the wire, 74 bytes from where the cursor stands */
inline decode_trade_report_message_long_form_message(trade_report_message_long_form_message_record) {
  trade_report_message_long_form_message_record.market_center_originator = wire[at]; at = at + 1;
  trade_report_message_long_form_message_record.sub_market_center_id = wire[at]; at = at + 1;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.sip_timestamp[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.timestamp_1[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.participant_token[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.timestamp_2[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 11 -> trade_report_message_long_form_message_record.symbol_long[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.trade_id[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> trade_report_message_long_form_message_record.trade_price_long[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> trade_report_message_long_form_message_record.trade_volume_long[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> trade_report_message_long_form_message_record.sale_condition[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_record.trade_through_exempt_flag = wire[at]; at = at + 1;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 2 -> trade_report_message_long_form_message_record.sellers_sale_days[trade_report_message_long_form_message_at] = wire[at]; at = at + 1; trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_record.consolidated_price_change_indicator = wire[at]; at = at + 1;
  trade_report_message_long_form_message_record.participant_price_change_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Report Message Long Form Message is what was written, byte for byte */
inline equal_trade_report_message_long_form_message(trade_report_message_long_form_message_read, trade_report_message_long_form_message_written) {
  assert(trade_report_message_long_form_message_read.market_center_originator == trade_report_message_long_form_message_written.market_center_originator);
  assert(trade_report_message_long_form_message_read.sub_market_center_id == trade_report_message_long_form_message_written.sub_market_center_id);
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> assert(trade_report_message_long_form_message_read.sip_timestamp[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.sip_timestamp[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> assert(trade_report_message_long_form_message_read.timestamp_1[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.timestamp_1[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> assert(trade_report_message_long_form_message_read.participant_token[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.participant_token[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> assert(trade_report_message_long_form_message_read.timestamp_2[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.timestamp_2[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 11 -> assert(trade_report_message_long_form_message_read.symbol_long[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.symbol_long[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> assert(trade_report_message_long_form_message_read.trade_id[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.trade_id[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 8 -> assert(trade_report_message_long_form_message_read.trade_price_long[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.trade_price_long[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> assert(trade_report_message_long_form_message_read.trade_volume_long[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.trade_volume_long[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 4 -> assert(trade_report_message_long_form_message_read.sale_condition[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.sale_condition[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_long_form_message_read.trade_through_exempt_flag == trade_report_message_long_form_message_written.trade_through_exempt_flag);
  trade_report_message_long_form_message_at = 0;
  do
  :: trade_report_message_long_form_message_at < 2 -> assert(trade_report_message_long_form_message_read.sellers_sale_days[trade_report_message_long_form_message_at] == trade_report_message_long_form_message_written.sellers_sale_days[trade_report_message_long_form_message_at]); trade_report_message_long_form_message_at = trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_long_form_message_read.consolidated_price_change_indicator == trade_report_message_long_form_message_written.consolidated_price_change_indicator);
  assert(trade_report_message_long_form_message_read.participant_price_change_indicator == trade_report_message_long_form_message_written.participant_price_change_indicator);
  skip
}

/* ---- Trade Cancel Error Message: 139 bytes ----------------------------------- */

/* Trade Cancel/Error Message. To be retired with the Fractional Share Release on February 23, 2026. */
typedef TradeCancelErrorMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_cancellation_type;
  byte original_trade_id[8];
  byte original_trade_price[8];
  byte original_volume_short[4];
  byte original_sale_condition[4];
  byte original_trade_through_exempt_flag;
  byte original_sellers_sale_days[2];
  byte consolidated_high_price[8];
  byte consolidated_low_price[8];
  byte consolidated_last_price[8];
  byte consolidated_volume[8];
  byte consolidated_price_change_indicator;
  byte consolidated_last_price_originator;
  byte market_participant_high_price[8];
  byte market_participant_low_price[8];
  byte market_participant_last_price[8];
  byte market_participant_volume[8]
};

int trade_cancel_error_message_at;

/* every byte of Trade Cancel Error Message set to one value */
inline fill_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_value) {
  trade_cancel_error_message_record.market_center_originator = trade_cancel_error_message_value;
  trade_cancel_error_message_record.sub_market_center_id = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.sip_timestamp[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_1[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.participant_token[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_2[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.symbol_long[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.trade_cancellation_type = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_id[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_volume_short[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_sale_condition[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.original_trade_through_exempt_flag = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.original_sellers_sale_days[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_high_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_low_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_last_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_volume[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.consolidated_price_change_indicator = trade_cancel_error_message_value;
  trade_cancel_error_message_record.consolidated_last_price_originator = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_high_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_low_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_last_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_volume[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_base) {
  trade_cancel_error_message_record.market_center_originator = (trade_cancel_error_message_base + 0 + 1) % 256;
  trade_cancel_error_message_record.sub_market_center_id = (trade_cancel_error_message_base + 1 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.sip_timestamp[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 2 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_1[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 10 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.participant_token[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 18 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_2[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 26 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.symbol_long[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 34 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.trade_cancellation_type = (trade_cancel_error_message_base + 45 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_id[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 46 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 54 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_volume_short[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 62 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_sale_condition[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 66 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.original_trade_through_exempt_flag = (trade_cancel_error_message_base + 70 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.original_sellers_sale_days[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 71 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_high_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 73 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_low_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 81 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_last_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 89 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_volume[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 97 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.consolidated_price_change_indicator = (trade_cancel_error_message_base + 105 + 1) % 256;
  trade_cancel_error_message_record.consolidated_last_price_originator = (trade_cancel_error_message_base + 106 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_high_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 107 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_low_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 115 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_last_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 123 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_volume[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 131 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error Message to the wire, 139 bytes from where the cursor stands */
inline encode_trade_cancel_error_message(trade_cancel_error_message_record) {
  wire[at] = trade_cancel_error_message_record.market_center_originator; at = at + 1;
  wire[at] = trade_cancel_error_message_record.sub_market_center_id; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.sip_timestamp[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.timestamp_1[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.participant_token[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.timestamp_2[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> wire[at] = trade_cancel_error_message_record.symbol_long[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.trade_cancellation_type; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.original_trade_id[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.original_volume_short[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.original_sale_condition[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.original_trade_through_exempt_flag; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> wire[at] = trade_cancel_error_message_record.original_sellers_sale_days[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.consolidated_high_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.consolidated_low_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.consolidated_last_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.consolidated_volume[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.consolidated_price_change_indicator; at = at + 1;
  wire[at] = trade_cancel_error_message_record.consolidated_last_price_originator; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.market_participant_high_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.market_participant_low_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.market_participant_last_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.market_participant_volume[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error Message off the wire, 139 bytes from where the cursor stands */
inline decode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_record.market_center_originator = wire[at]; at = at + 1;
  trade_cancel_error_message_record.sub_market_center_id = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.sip_timestamp[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_1[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.participant_token[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_2[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.symbol_long[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.trade_cancellation_type = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_id[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_volume_short[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_sale_condition[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.original_trade_through_exempt_flag = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.original_sellers_sale_days[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_high_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_low_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_last_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.consolidated_volume[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.consolidated_price_change_indicator = wire[at]; at = at + 1;
  trade_cancel_error_message_record.consolidated_last_price_originator = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_high_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_low_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_last_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.market_participant_volume[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Error Message is what was written, byte for byte */
inline equal_trade_cancel_error_message(trade_cancel_error_message_read, trade_cancel_error_message_written) {
  assert(trade_cancel_error_message_read.market_center_originator == trade_cancel_error_message_written.market_center_originator);
  assert(trade_cancel_error_message_read.sub_market_center_id == trade_cancel_error_message_written.sub_market_center_id);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.sip_timestamp[trade_cancel_error_message_at] == trade_cancel_error_message_written.sip_timestamp[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.timestamp_1[trade_cancel_error_message_at] == trade_cancel_error_message_written.timestamp_1[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.participant_token[trade_cancel_error_message_at] == trade_cancel_error_message_written.participant_token[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.timestamp_2[trade_cancel_error_message_at] == trade_cancel_error_message_written.timestamp_2[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> assert(trade_cancel_error_message_read.symbol_long[trade_cancel_error_message_at] == trade_cancel_error_message_written.symbol_long[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.trade_cancellation_type == trade_cancel_error_message_written.trade_cancellation_type);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.original_trade_id[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_id[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.original_trade_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.original_volume_short[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_volume_short[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.original_sale_condition[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_sale_condition[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.original_trade_through_exempt_flag == trade_cancel_error_message_written.original_trade_through_exempt_flag);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> assert(trade_cancel_error_message_read.original_sellers_sale_days[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_sellers_sale_days[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.consolidated_high_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.consolidated_high_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.consolidated_low_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.consolidated_low_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.consolidated_last_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.consolidated_last_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.consolidated_volume[trade_cancel_error_message_at] == trade_cancel_error_message_written.consolidated_volume[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.consolidated_price_change_indicator == trade_cancel_error_message_written.consolidated_price_change_indicator);
  assert(trade_cancel_error_message_read.consolidated_last_price_originator == trade_cancel_error_message_written.consolidated_last_price_originator);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.market_participant_high_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.market_participant_high_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.market_participant_low_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.market_participant_low_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.market_participant_last_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.market_participant_last_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.market_participant_volume[trade_cancel_error_message_at] == trade_cancel_error_message_written.market_participant_volume[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction Message: 165 bytes ------------------------------------- */

/* Trade Correction Message. To be retired with the Fractional Share Release on February 23, 2026. */
typedef TradeCorrectionMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte original_trade_id[8];
  byte original_trade_price[8];
  byte original_volume_short[4];
  byte original_sale_condition[4];
  byte original_trade_through_exempt_flag;
  byte original_sellers_sale_days[2];
  byte corrected_trade_id[8];
  byte corrected_trade_price[8];
  byte corrected_volume_short[4];
  byte corrected_sale_condition[4];
  byte corrected_trade_through_exempt_flag;
  byte corrected_sellers_sale_days[2];
  byte consolidated_high_price[8];
  byte consolidated_low_price[8];
  byte consolidated_last_price[8];
  byte consolidated_volume[8];
  byte consolidated_price_change_indicator;
  byte consolidated_last_price_originator;
  byte market_participant_high_price[8];
  byte market_participant_low_price[8];
  byte market_participant_last_price[8];
  byte market_participant_volume[8]
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_record.market_center_originator = trade_correction_message_value;
  trade_correction_message_record.sub_market_center_id = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.sip_timestamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_1[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.participant_token[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_2[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.symbol_long[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_volume_short[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_sale_condition[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.original_trade_through_exempt_flag = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.original_sellers_sale_days[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_volume_short[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.corrected_trade_through_exempt_flag = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.corrected_sellers_sale_days[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_high_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_low_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_last_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_volume[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.consolidated_price_change_indicator = trade_correction_message_value;
  trade_correction_message_record.consolidated_last_price_originator = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_high_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_low_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_last_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_volume[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_record.market_center_originator = (trade_correction_message_base + 0 + 1) % 256;
  trade_correction_message_record.sub_market_center_id = (trade_correction_message_base + 1 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.sip_timestamp[trade_correction_message_at] = (trade_correction_message_base + 2 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_1[trade_correction_message_at] = (trade_correction_message_base + 10 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.participant_token[trade_correction_message_at] = (trade_correction_message_base + 18 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_2[trade_correction_message_at] = (trade_correction_message_base + 26 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.symbol_long[trade_correction_message_at] = (trade_correction_message_base + 34 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = (trade_correction_message_base + 45 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = (trade_correction_message_base + 53 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_volume_short[trade_correction_message_at] = (trade_correction_message_base + 61 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_sale_condition[trade_correction_message_at] = (trade_correction_message_base + 65 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.original_trade_through_exempt_flag = (trade_correction_message_base + 69 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.original_sellers_sale_days[trade_correction_message_at] = (trade_correction_message_base + 70 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_id[trade_correction_message_at] = (trade_correction_message_base + 72 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = (trade_correction_message_base + 80 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_volume_short[trade_correction_message_at] = (trade_correction_message_base + 88 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition[trade_correction_message_at] = (trade_correction_message_base + 92 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.corrected_trade_through_exempt_flag = (trade_correction_message_base + 96 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.corrected_sellers_sale_days[trade_correction_message_at] = (trade_correction_message_base + 97 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_high_price[trade_correction_message_at] = (trade_correction_message_base + 99 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_low_price[trade_correction_message_at] = (trade_correction_message_base + 107 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_last_price[trade_correction_message_at] = (trade_correction_message_base + 115 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_volume[trade_correction_message_at] = (trade_correction_message_base + 123 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.consolidated_price_change_indicator = (trade_correction_message_base + 131 + 1) % 256;
  trade_correction_message_record.consolidated_last_price_originator = (trade_correction_message_base + 132 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_high_price[trade_correction_message_at] = (trade_correction_message_base + 133 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_low_price[trade_correction_message_at] = (trade_correction_message_base + 141 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_last_price[trade_correction_message_at] = (trade_correction_message_base + 149 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_volume[trade_correction_message_at] = (trade_correction_message_base + 157 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message to the wire, 165 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  wire[at] = trade_correction_message_record.market_center_originator; at = at + 1;
  wire[at] = trade_correction_message_record.sub_market_center_id; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.sip_timestamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.timestamp_1[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.participant_token[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.timestamp_2[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> wire[at] = trade_correction_message_record.symbol_long[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.original_trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.original_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_volume_short[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_sale_condition[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.original_trade_through_exempt_flag; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> wire[at] = trade_correction_message_record.original_sellers_sale_days[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.corrected_trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.corrected_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_volume_short[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_sale_condition[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.corrected_trade_through_exempt_flag; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> wire[at] = trade_correction_message_record.corrected_sellers_sale_days[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.consolidated_high_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.consolidated_low_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.consolidated_last_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.consolidated_volume[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.consolidated_price_change_indicator; at = at + 1;
  wire[at] = trade_correction_message_record.consolidated_last_price_originator; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.market_participant_high_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.market_participant_low_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.market_participant_last_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.market_participant_volume[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message off the wire, 165 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_record.market_center_originator = wire[at]; at = at + 1;
  trade_correction_message_record.sub_market_center_id = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.sip_timestamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_1[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.participant_token[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_2[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.symbol_long[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_volume_short[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_sale_condition[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.original_trade_through_exempt_flag = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.original_sellers_sale_days[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_volume_short[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.corrected_trade_through_exempt_flag = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.corrected_sellers_sale_days[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_high_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_low_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_last_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.consolidated_volume[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.consolidated_price_change_indicator = wire[at]; at = at + 1;
  trade_correction_message_record.consolidated_last_price_originator = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_high_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_low_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_last_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.market_participant_volume[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  assert(trade_correction_message_read.market_center_originator == trade_correction_message_written.market_center_originator);
  assert(trade_correction_message_read.sub_market_center_id == trade_correction_message_written.sub_market_center_id);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.sip_timestamp[trade_correction_message_at] == trade_correction_message_written.sip_timestamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.timestamp_1[trade_correction_message_at] == trade_correction_message_written.timestamp_1[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.participant_token[trade_correction_message_at] == trade_correction_message_written.participant_token[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.timestamp_2[trade_correction_message_at] == trade_correction_message_written.timestamp_2[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> assert(trade_correction_message_read.symbol_long[trade_correction_message_at] == trade_correction_message_written.symbol_long[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.original_trade_id[trade_correction_message_at] == trade_correction_message_written.original_trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.original_trade_price[trade_correction_message_at] == trade_correction_message_written.original_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_volume_short[trade_correction_message_at] == trade_correction_message_written.original_volume_short[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_sale_condition[trade_correction_message_at] == trade_correction_message_written.original_sale_condition[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.original_trade_through_exempt_flag == trade_correction_message_written.original_trade_through_exempt_flag);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> assert(trade_correction_message_read.original_sellers_sale_days[trade_correction_message_at] == trade_correction_message_written.original_sellers_sale_days[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.corrected_trade_id[trade_correction_message_at] == trade_correction_message_written.corrected_trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.corrected_trade_price[trade_correction_message_at] == trade_correction_message_written.corrected_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_volume_short[trade_correction_message_at] == trade_correction_message_written.corrected_volume_short[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_sale_condition[trade_correction_message_at] == trade_correction_message_written.corrected_sale_condition[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.corrected_trade_through_exempt_flag == trade_correction_message_written.corrected_trade_through_exempt_flag);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> assert(trade_correction_message_read.corrected_sellers_sale_days[trade_correction_message_at] == trade_correction_message_written.corrected_sellers_sale_days[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.consolidated_high_price[trade_correction_message_at] == trade_correction_message_written.consolidated_high_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.consolidated_low_price[trade_correction_message_at] == trade_correction_message_written.consolidated_low_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.consolidated_last_price[trade_correction_message_at] == trade_correction_message_written.consolidated_last_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.consolidated_volume[trade_correction_message_at] == trade_correction_message_written.consolidated_volume[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.consolidated_price_change_indicator == trade_correction_message_written.consolidated_price_change_indicator);
  assert(trade_correction_message_read.consolidated_last_price_originator == trade_correction_message_written.consolidated_last_price_originator);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.market_participant_high_price[trade_correction_message_at] == trade_correction_message_written.market_participant_high_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.market_participant_low_price[trade_correction_message_at] == trade_correction_message_written.market_participant_low_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.market_participant_last_price[trade_correction_message_at] == trade_correction_message_written.market_participant_last_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.market_participant_volume[trade_correction_message_at] == trade_correction_message_written.market_participant_volume[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Prior Day As Of Trade Message: 81 bytes --------------------------------- */

/* Prior Day As-Of Trade Message. To be retired with the Fractional Share Release on February 23, 2026. */
typedef PriorDayAsOfTradeMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_id[8];
  byte trade_price_long[8];
  byte trade_volume_long[4];
  byte sale_condition[4];
  byte trade_through_exempt_flag;
  byte sellers_sale_days[2];
  byte as_of_action;
  byte timestamp_of_trade[8]
};

int prior_day_as_of_trade_message_at;

/* every byte of Prior Day As Of Trade Message set to one value */
inline fill_prior_day_as_of_trade_message(prior_day_as_of_trade_message_record, prior_day_as_of_trade_message_value) {
  prior_day_as_of_trade_message_record.market_center_originator = prior_day_as_of_trade_message_value;
  prior_day_as_of_trade_message_record.sub_market_center_id = prior_day_as_of_trade_message_value;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.sip_timestamp[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.timestamp_1[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.participant_token[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.timestamp_2[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 11 -> prior_day_as_of_trade_message_record.symbol_long[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.trade_id[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.trade_price_long[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> prior_day_as_of_trade_message_record.trade_volume_long[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> prior_day_as_of_trade_message_record.sale_condition[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_record.trade_through_exempt_flag = prior_day_as_of_trade_message_value;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 2 -> prior_day_as_of_trade_message_record.sellers_sale_days[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_record.as_of_action = prior_day_as_of_trade_message_value;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.timestamp_of_trade[prior_day_as_of_trade_message_at] = prior_day_as_of_trade_message_value; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Prior Day As Of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_prior_day_as_of_trade_message(prior_day_as_of_trade_message_record, prior_day_as_of_trade_message_base) {
  prior_day_as_of_trade_message_record.market_center_originator = (prior_day_as_of_trade_message_base + 0 + 1) % 256;
  prior_day_as_of_trade_message_record.sub_market_center_id = (prior_day_as_of_trade_message_base + 1 + 1) % 256;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.sip_timestamp[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 2 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.timestamp_1[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 10 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.participant_token[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 18 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.timestamp_2[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 26 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 11 -> prior_day_as_of_trade_message_record.symbol_long[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 34 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.trade_id[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 45 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.trade_price_long[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 53 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> prior_day_as_of_trade_message_record.trade_volume_long[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 61 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> prior_day_as_of_trade_message_record.sale_condition[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 65 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_record.trade_through_exempt_flag = (prior_day_as_of_trade_message_base + 69 + 1) % 256;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 2 -> prior_day_as_of_trade_message_record.sellers_sale_days[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 70 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_record.as_of_action = (prior_day_as_of_trade_message_base + 72 + 1) % 256;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.timestamp_of_trade[prior_day_as_of_trade_message_at] = (prior_day_as_of_trade_message_base + 73 + prior_day_as_of_trade_message_at + 1) % 256; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Prior Day As Of Trade Message to the wire, 81 bytes from where the cursor stands */
inline encode_prior_day_as_of_trade_message(prior_day_as_of_trade_message_record) {
  wire[at] = prior_day_as_of_trade_message_record.market_center_originator; at = at + 1;
  wire[at] = prior_day_as_of_trade_message_record.sub_market_center_id; at = at + 1;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> wire[at] = prior_day_as_of_trade_message_record.sip_timestamp[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> wire[at] = prior_day_as_of_trade_message_record.timestamp_1[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> wire[at] = prior_day_as_of_trade_message_record.participant_token[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> wire[at] = prior_day_as_of_trade_message_record.timestamp_2[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 11 -> wire[at] = prior_day_as_of_trade_message_record.symbol_long[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> wire[at] = prior_day_as_of_trade_message_record.trade_id[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> wire[at] = prior_day_as_of_trade_message_record.trade_price_long[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> wire[at] = prior_day_as_of_trade_message_record.trade_volume_long[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> wire[at] = prior_day_as_of_trade_message_record.sale_condition[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_as_of_trade_message_record.trade_through_exempt_flag; at = at + 1;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 2 -> wire[at] = prior_day_as_of_trade_message_record.sellers_sale_days[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_as_of_trade_message_record.as_of_action; at = at + 1;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> wire[at] = prior_day_as_of_trade_message_record.timestamp_of_trade[prior_day_as_of_trade_message_at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Prior Day As Of Trade Message off the wire, 81 bytes from where the cursor stands */
inline decode_prior_day_as_of_trade_message(prior_day_as_of_trade_message_record) {
  prior_day_as_of_trade_message_record.market_center_originator = wire[at]; at = at + 1;
  prior_day_as_of_trade_message_record.sub_market_center_id = wire[at]; at = at + 1;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.sip_timestamp[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.timestamp_1[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.participant_token[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.timestamp_2[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 11 -> prior_day_as_of_trade_message_record.symbol_long[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.trade_id[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.trade_price_long[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> prior_day_as_of_trade_message_record.trade_volume_long[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> prior_day_as_of_trade_message_record.sale_condition[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_record.trade_through_exempt_flag = wire[at]; at = at + 1;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 2 -> prior_day_as_of_trade_message_record.sellers_sale_days[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_record.as_of_action = wire[at]; at = at + 1;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> prior_day_as_of_trade_message_record.timestamp_of_trade[prior_day_as_of_trade_message_at] = wire[at]; at = at + 1; prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Prior Day As Of Trade Message is what was written, byte for byte */
inline equal_prior_day_as_of_trade_message(prior_day_as_of_trade_message_read, prior_day_as_of_trade_message_written) {
  assert(prior_day_as_of_trade_message_read.market_center_originator == prior_day_as_of_trade_message_written.market_center_originator);
  assert(prior_day_as_of_trade_message_read.sub_market_center_id == prior_day_as_of_trade_message_written.sub_market_center_id);
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> assert(prior_day_as_of_trade_message_read.sip_timestamp[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.sip_timestamp[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> assert(prior_day_as_of_trade_message_read.timestamp_1[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.timestamp_1[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> assert(prior_day_as_of_trade_message_read.participant_token[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.participant_token[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> assert(prior_day_as_of_trade_message_read.timestamp_2[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.timestamp_2[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 11 -> assert(prior_day_as_of_trade_message_read.symbol_long[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.symbol_long[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> assert(prior_day_as_of_trade_message_read.trade_id[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.trade_id[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> assert(prior_day_as_of_trade_message_read.trade_price_long[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.trade_price_long[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> assert(prior_day_as_of_trade_message_read.trade_volume_long[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.trade_volume_long[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 4 -> assert(prior_day_as_of_trade_message_read.sale_condition[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.sale_condition[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  assert(prior_day_as_of_trade_message_read.trade_through_exempt_flag == prior_day_as_of_trade_message_written.trade_through_exempt_flag);
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 2 -> assert(prior_day_as_of_trade_message_read.sellers_sale_days[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.sellers_sale_days[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  assert(prior_day_as_of_trade_message_read.as_of_action == prior_day_as_of_trade_message_written.as_of_action);
  prior_day_as_of_trade_message_at = 0;
  do
  :: prior_day_as_of_trade_message_at < 8 -> assert(prior_day_as_of_trade_message_read.timestamp_of_trade[prior_day_as_of_trade_message_at] == prior_day_as_of_trade_message_written.timestamp_of_trade[prior_day_as_of_trade_message_at]); prior_day_as_of_trade_message_at = prior_day_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional Trade Report Message Short Form Message: 64 bytes ------------ */

/* Fractional Short-format Trade Report Message. Introduced with the Fractional Share Release on February 23, 2026. */
typedef FractionalTradeReportMessageShortFormMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_short[5];
  byte trade_id[8];
  byte trade_price_short[2];
  byte trade_volume[8];
  byte sale_condition[4];
  byte trade_through_exempt_flag;
  byte consolidated_price_change_indicator;
  byte participant_price_change_indicator
};

int fractional_trade_report_message_short_form_message_at;

/* every byte of Fractional Trade Report Message Short Form Message set to one value */
inline fill_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_record, fractional_trade_report_message_short_form_message_value) {
  fractional_trade_report_message_short_form_message_record.market_center_originator = fractional_trade_report_message_short_form_message_value;
  fractional_trade_report_message_short_form_message_record.sub_market_center_id = fractional_trade_report_message_short_form_message_value;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.sip_timestamp[fractional_trade_report_message_short_form_message_at] = fractional_trade_report_message_short_form_message_value; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.timestamp_1[fractional_trade_report_message_short_form_message_at] = fractional_trade_report_message_short_form_message_value; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.participant_token[fractional_trade_report_message_short_form_message_at] = fractional_trade_report_message_short_form_message_value; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.timestamp_2[fractional_trade_report_message_short_form_message_at] = fractional_trade_report_message_short_form_message_value; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 5 -> fractional_trade_report_message_short_form_message_record.symbol_short[fractional_trade_report_message_short_form_message_at] = fractional_trade_report_message_short_form_message_value; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.trade_id[fractional_trade_report_message_short_form_message_at] = fractional_trade_report_message_short_form_message_value; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 2 -> fractional_trade_report_message_short_form_message_record.trade_price_short[fractional_trade_report_message_short_form_message_at] = fractional_trade_report_message_short_form_message_value; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.trade_volume[fractional_trade_report_message_short_form_message_at] = fractional_trade_report_message_short_form_message_value; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 4 -> fractional_trade_report_message_short_form_message_record.sale_condition[fractional_trade_report_message_short_form_message_at] = fractional_trade_report_message_short_form_message_value; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_record.trade_through_exempt_flag = fractional_trade_report_message_short_form_message_value;
  fractional_trade_report_message_short_form_message_record.consolidated_price_change_indicator = fractional_trade_report_message_short_form_message_value;
  fractional_trade_report_message_short_form_message_record.participant_price_change_indicator = fractional_trade_report_message_short_form_message_value;
  skip
}

/* each byte of Fractional Trade Report Message Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_record, fractional_trade_report_message_short_form_message_base) {
  fractional_trade_report_message_short_form_message_record.market_center_originator = (fractional_trade_report_message_short_form_message_base + 0 + 1) % 256;
  fractional_trade_report_message_short_form_message_record.sub_market_center_id = (fractional_trade_report_message_short_form_message_base + 1 + 1) % 256;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.sip_timestamp[fractional_trade_report_message_short_form_message_at] = (fractional_trade_report_message_short_form_message_base + 2 + fractional_trade_report_message_short_form_message_at + 1) % 256; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.timestamp_1[fractional_trade_report_message_short_form_message_at] = (fractional_trade_report_message_short_form_message_base + 10 + fractional_trade_report_message_short_form_message_at + 1) % 256; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.participant_token[fractional_trade_report_message_short_form_message_at] = (fractional_trade_report_message_short_form_message_base + 18 + fractional_trade_report_message_short_form_message_at + 1) % 256; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.timestamp_2[fractional_trade_report_message_short_form_message_at] = (fractional_trade_report_message_short_form_message_base + 26 + fractional_trade_report_message_short_form_message_at + 1) % 256; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 5 -> fractional_trade_report_message_short_form_message_record.symbol_short[fractional_trade_report_message_short_form_message_at] = (fractional_trade_report_message_short_form_message_base + 34 + fractional_trade_report_message_short_form_message_at + 1) % 256; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.trade_id[fractional_trade_report_message_short_form_message_at] = (fractional_trade_report_message_short_form_message_base + 39 + fractional_trade_report_message_short_form_message_at + 1) % 256; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 2 -> fractional_trade_report_message_short_form_message_record.trade_price_short[fractional_trade_report_message_short_form_message_at] = (fractional_trade_report_message_short_form_message_base + 47 + fractional_trade_report_message_short_form_message_at + 1) % 256; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.trade_volume[fractional_trade_report_message_short_form_message_at] = (fractional_trade_report_message_short_form_message_base + 49 + fractional_trade_report_message_short_form_message_at + 1) % 256; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 4 -> fractional_trade_report_message_short_form_message_record.sale_condition[fractional_trade_report_message_short_form_message_at] = (fractional_trade_report_message_short_form_message_base + 57 + fractional_trade_report_message_short_form_message_at + 1) % 256; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_record.trade_through_exempt_flag = (fractional_trade_report_message_short_form_message_base + 61 + 1) % 256;
  fractional_trade_report_message_short_form_message_record.consolidated_price_change_indicator = (fractional_trade_report_message_short_form_message_base + 62 + 1) % 256;
  fractional_trade_report_message_short_form_message_record.participant_price_change_indicator = (fractional_trade_report_message_short_form_message_base + 63 + 1) % 256;
  skip
}

/* Fractional Trade Report Message Short Form Message to the wire, 64 bytes from where the cursor stands */
inline encode_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_record) {
  wire[at] = fractional_trade_report_message_short_form_message_record.market_center_originator; at = at + 1;
  wire[at] = fractional_trade_report_message_short_form_message_record.sub_market_center_id; at = at + 1;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> wire[at] = fractional_trade_report_message_short_form_message_record.sip_timestamp[fractional_trade_report_message_short_form_message_at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> wire[at] = fractional_trade_report_message_short_form_message_record.timestamp_1[fractional_trade_report_message_short_form_message_at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> wire[at] = fractional_trade_report_message_short_form_message_record.participant_token[fractional_trade_report_message_short_form_message_at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> wire[at] = fractional_trade_report_message_short_form_message_record.timestamp_2[fractional_trade_report_message_short_form_message_at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 5 -> wire[at] = fractional_trade_report_message_short_form_message_record.symbol_short[fractional_trade_report_message_short_form_message_at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> wire[at] = fractional_trade_report_message_short_form_message_record.trade_id[fractional_trade_report_message_short_form_message_at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 2 -> wire[at] = fractional_trade_report_message_short_form_message_record.trade_price_short[fractional_trade_report_message_short_form_message_at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> wire[at] = fractional_trade_report_message_short_form_message_record.trade_volume[fractional_trade_report_message_short_form_message_at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 4 -> wire[at] = fractional_trade_report_message_short_form_message_record.sale_condition[fractional_trade_report_message_short_form_message_at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_report_message_short_form_message_record.trade_through_exempt_flag; at = at + 1;
  wire[at] = fractional_trade_report_message_short_form_message_record.consolidated_price_change_indicator; at = at + 1;
  wire[at] = fractional_trade_report_message_short_form_message_record.participant_price_change_indicator; at = at + 1;
  skip
}

/* Fractional Trade Report Message Short Form Message off the wire, 64 bytes from where the cursor stands */
inline decode_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_record) {
  fractional_trade_report_message_short_form_message_record.market_center_originator = wire[at]; at = at + 1;
  fractional_trade_report_message_short_form_message_record.sub_market_center_id = wire[at]; at = at + 1;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.sip_timestamp[fractional_trade_report_message_short_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.timestamp_1[fractional_trade_report_message_short_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.participant_token[fractional_trade_report_message_short_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.timestamp_2[fractional_trade_report_message_short_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 5 -> fractional_trade_report_message_short_form_message_record.symbol_short[fractional_trade_report_message_short_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.trade_id[fractional_trade_report_message_short_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 2 -> fractional_trade_report_message_short_form_message_record.trade_price_short[fractional_trade_report_message_short_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> fractional_trade_report_message_short_form_message_record.trade_volume[fractional_trade_report_message_short_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 4 -> fractional_trade_report_message_short_form_message_record.sale_condition[fractional_trade_report_message_short_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_record.trade_through_exempt_flag = wire[at]; at = at + 1;
  fractional_trade_report_message_short_form_message_record.consolidated_price_change_indicator = wire[at]; at = at + 1;
  fractional_trade_report_message_short_form_message_record.participant_price_change_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Trade Report Message Short Form Message is what was written, byte for byte */
inline equal_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_read, fractional_trade_report_message_short_form_message_written) {
  assert(fractional_trade_report_message_short_form_message_read.market_center_originator == fractional_trade_report_message_short_form_message_written.market_center_originator);
  assert(fractional_trade_report_message_short_form_message_read.sub_market_center_id == fractional_trade_report_message_short_form_message_written.sub_market_center_id);
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> assert(fractional_trade_report_message_short_form_message_read.sip_timestamp[fractional_trade_report_message_short_form_message_at] == fractional_trade_report_message_short_form_message_written.sip_timestamp[fractional_trade_report_message_short_form_message_at]); fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> assert(fractional_trade_report_message_short_form_message_read.timestamp_1[fractional_trade_report_message_short_form_message_at] == fractional_trade_report_message_short_form_message_written.timestamp_1[fractional_trade_report_message_short_form_message_at]); fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> assert(fractional_trade_report_message_short_form_message_read.participant_token[fractional_trade_report_message_short_form_message_at] == fractional_trade_report_message_short_form_message_written.participant_token[fractional_trade_report_message_short_form_message_at]); fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> assert(fractional_trade_report_message_short_form_message_read.timestamp_2[fractional_trade_report_message_short_form_message_at] == fractional_trade_report_message_short_form_message_written.timestamp_2[fractional_trade_report_message_short_form_message_at]); fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 5 -> assert(fractional_trade_report_message_short_form_message_read.symbol_short[fractional_trade_report_message_short_form_message_at] == fractional_trade_report_message_short_form_message_written.symbol_short[fractional_trade_report_message_short_form_message_at]); fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> assert(fractional_trade_report_message_short_form_message_read.trade_id[fractional_trade_report_message_short_form_message_at] == fractional_trade_report_message_short_form_message_written.trade_id[fractional_trade_report_message_short_form_message_at]); fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 2 -> assert(fractional_trade_report_message_short_form_message_read.trade_price_short[fractional_trade_report_message_short_form_message_at] == fractional_trade_report_message_short_form_message_written.trade_price_short[fractional_trade_report_message_short_form_message_at]); fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 8 -> assert(fractional_trade_report_message_short_form_message_read.trade_volume[fractional_trade_report_message_short_form_message_at] == fractional_trade_report_message_short_form_message_written.trade_volume[fractional_trade_report_message_short_form_message_at]); fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_short_form_message_at = 0;
  do
  :: fractional_trade_report_message_short_form_message_at < 4 -> assert(fractional_trade_report_message_short_form_message_read.sale_condition[fractional_trade_report_message_short_form_message_at] == fractional_trade_report_message_short_form_message_written.sale_condition[fractional_trade_report_message_short_form_message_at]); fractional_trade_report_message_short_form_message_at = fractional_trade_report_message_short_form_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_report_message_short_form_message_read.trade_through_exempt_flag == fractional_trade_report_message_short_form_message_written.trade_through_exempt_flag);
  assert(fractional_trade_report_message_short_form_message_read.consolidated_price_change_indicator == fractional_trade_report_message_short_form_message_written.consolidated_price_change_indicator);
  assert(fractional_trade_report_message_short_form_message_read.participant_price_change_indicator == fractional_trade_report_message_short_form_message_written.participant_price_change_indicator);
  skip
}

/* ---- Fractional Trade Report Message Long Form Message: 78 bytes ------------- */

/* Fractional Long-format Trade Report Message. Introduced with the Fractional Share Release on February 23, 2026. */
typedef FractionalTradeReportMessageLongFormMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_id[8];
  byte trade_price_long[8];
  byte trade_volume[8];
  byte sale_condition[4];
  byte trade_through_exempt_flag;
  byte sellers_sale_days[2];
  byte consolidated_price_change_indicator;
  byte participant_price_change_indicator
};

int fractional_trade_report_message_long_form_message_at;

/* every byte of Fractional Trade Report Message Long Form Message set to one value */
inline fill_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_record, fractional_trade_report_message_long_form_message_value) {
  fractional_trade_report_message_long_form_message_record.market_center_originator = fractional_trade_report_message_long_form_message_value;
  fractional_trade_report_message_long_form_message_record.sub_market_center_id = fractional_trade_report_message_long_form_message_value;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.sip_timestamp[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.timestamp_1[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.participant_token[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.timestamp_2[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 11 -> fractional_trade_report_message_long_form_message_record.symbol_long[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.trade_id[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.trade_price_long[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.trade_volume[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 4 -> fractional_trade_report_message_long_form_message_record.sale_condition[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_record.trade_through_exempt_flag = fractional_trade_report_message_long_form_message_value;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 2 -> fractional_trade_report_message_long_form_message_record.sellers_sale_days[fractional_trade_report_message_long_form_message_at] = fractional_trade_report_message_long_form_message_value; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_record.consolidated_price_change_indicator = fractional_trade_report_message_long_form_message_value;
  fractional_trade_report_message_long_form_message_record.participant_price_change_indicator = fractional_trade_report_message_long_form_message_value;
  skip
}

/* each byte of Fractional Trade Report Message Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_record, fractional_trade_report_message_long_form_message_base) {
  fractional_trade_report_message_long_form_message_record.market_center_originator = (fractional_trade_report_message_long_form_message_base + 0 + 1) % 256;
  fractional_trade_report_message_long_form_message_record.sub_market_center_id = (fractional_trade_report_message_long_form_message_base + 1 + 1) % 256;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.sip_timestamp[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 2 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.timestamp_1[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 10 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.participant_token[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 18 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.timestamp_2[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 26 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 11 -> fractional_trade_report_message_long_form_message_record.symbol_long[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 34 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.trade_id[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 45 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.trade_price_long[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 53 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.trade_volume[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 61 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 4 -> fractional_trade_report_message_long_form_message_record.sale_condition[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 69 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_record.trade_through_exempt_flag = (fractional_trade_report_message_long_form_message_base + 73 + 1) % 256;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 2 -> fractional_trade_report_message_long_form_message_record.sellers_sale_days[fractional_trade_report_message_long_form_message_at] = (fractional_trade_report_message_long_form_message_base + 74 + fractional_trade_report_message_long_form_message_at + 1) % 256; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_record.consolidated_price_change_indicator = (fractional_trade_report_message_long_form_message_base + 76 + 1) % 256;
  fractional_trade_report_message_long_form_message_record.participant_price_change_indicator = (fractional_trade_report_message_long_form_message_base + 77 + 1) % 256;
  skip
}

/* Fractional Trade Report Message Long Form Message to the wire, 78 bytes from where the cursor stands */
inline encode_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_record) {
  wire[at] = fractional_trade_report_message_long_form_message_record.market_center_originator; at = at + 1;
  wire[at] = fractional_trade_report_message_long_form_message_record.sub_market_center_id; at = at + 1;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> wire[at] = fractional_trade_report_message_long_form_message_record.sip_timestamp[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> wire[at] = fractional_trade_report_message_long_form_message_record.timestamp_1[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> wire[at] = fractional_trade_report_message_long_form_message_record.participant_token[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> wire[at] = fractional_trade_report_message_long_form_message_record.timestamp_2[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 11 -> wire[at] = fractional_trade_report_message_long_form_message_record.symbol_long[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> wire[at] = fractional_trade_report_message_long_form_message_record.trade_id[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> wire[at] = fractional_trade_report_message_long_form_message_record.trade_price_long[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> wire[at] = fractional_trade_report_message_long_form_message_record.trade_volume[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 4 -> wire[at] = fractional_trade_report_message_long_form_message_record.sale_condition[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_report_message_long_form_message_record.trade_through_exempt_flag; at = at + 1;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 2 -> wire[at] = fractional_trade_report_message_long_form_message_record.sellers_sale_days[fractional_trade_report_message_long_form_message_at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_report_message_long_form_message_record.consolidated_price_change_indicator; at = at + 1;
  wire[at] = fractional_trade_report_message_long_form_message_record.participant_price_change_indicator; at = at + 1;
  skip
}

/* Fractional Trade Report Message Long Form Message off the wire, 78 bytes from where the cursor stands */
inline decode_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_record) {
  fractional_trade_report_message_long_form_message_record.market_center_originator = wire[at]; at = at + 1;
  fractional_trade_report_message_long_form_message_record.sub_market_center_id = wire[at]; at = at + 1;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.sip_timestamp[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.timestamp_1[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.participant_token[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.timestamp_2[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 11 -> fractional_trade_report_message_long_form_message_record.symbol_long[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.trade_id[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.trade_price_long[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> fractional_trade_report_message_long_form_message_record.trade_volume[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 4 -> fractional_trade_report_message_long_form_message_record.sale_condition[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_record.trade_through_exempt_flag = wire[at]; at = at + 1;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 2 -> fractional_trade_report_message_long_form_message_record.sellers_sale_days[fractional_trade_report_message_long_form_message_at] = wire[at]; at = at + 1; fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_record.consolidated_price_change_indicator = wire[at]; at = at + 1;
  fractional_trade_report_message_long_form_message_record.participant_price_change_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Trade Report Message Long Form Message is what was written, byte for byte */
inline equal_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_read, fractional_trade_report_message_long_form_message_written) {
  assert(fractional_trade_report_message_long_form_message_read.market_center_originator == fractional_trade_report_message_long_form_message_written.market_center_originator);
  assert(fractional_trade_report_message_long_form_message_read.sub_market_center_id == fractional_trade_report_message_long_form_message_written.sub_market_center_id);
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> assert(fractional_trade_report_message_long_form_message_read.sip_timestamp[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.sip_timestamp[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> assert(fractional_trade_report_message_long_form_message_read.timestamp_1[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.timestamp_1[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> assert(fractional_trade_report_message_long_form_message_read.participant_token[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.participant_token[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> assert(fractional_trade_report_message_long_form_message_read.timestamp_2[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.timestamp_2[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 11 -> assert(fractional_trade_report_message_long_form_message_read.symbol_long[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.symbol_long[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> assert(fractional_trade_report_message_long_form_message_read.trade_id[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.trade_id[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> assert(fractional_trade_report_message_long_form_message_read.trade_price_long[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.trade_price_long[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 8 -> assert(fractional_trade_report_message_long_form_message_read.trade_volume[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.trade_volume[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 4 -> assert(fractional_trade_report_message_long_form_message_read.sale_condition[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.sale_condition[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_report_message_long_form_message_read.trade_through_exempt_flag == fractional_trade_report_message_long_form_message_written.trade_through_exempt_flag);
  fractional_trade_report_message_long_form_message_at = 0;
  do
  :: fractional_trade_report_message_long_form_message_at < 2 -> assert(fractional_trade_report_message_long_form_message_read.sellers_sale_days[fractional_trade_report_message_long_form_message_at] == fractional_trade_report_message_long_form_message_written.sellers_sale_days[fractional_trade_report_message_long_form_message_at]); fractional_trade_report_message_long_form_message_at = fractional_trade_report_message_long_form_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_report_message_long_form_message_read.consolidated_price_change_indicator == fractional_trade_report_message_long_form_message_written.consolidated_price_change_indicator);
  assert(fractional_trade_report_message_long_form_message_read.participant_price_change_indicator == fractional_trade_report_message_long_form_message_written.participant_price_change_indicator);
  skip
}

/* ---- Fractional Trade Cancel Error Message: 143 bytes ------------------------ */

/* Fractional Trade Cancel/Error Message. Introduced with the Fractional Share Release on February 23, 2026. */
typedef FractionalTradeCancelErrorMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_cancellation_type;
  byte original_trade_id[8];
  byte original_trade_price[8];
  byte original_volume_long[8];
  byte original_sale_condition[4];
  byte original_trade_through_exempt_flag;
  byte original_sellers_sale_days[2];
  byte consolidated_high_price[8];
  byte consolidated_low_price[8];
  byte consolidated_last_price[8];
  byte consolidated_volume[8];
  byte consolidated_price_change_indicator;
  byte consolidated_last_price_originator;
  byte market_participant_high_price[8];
  byte market_participant_low_price[8];
  byte market_participant_last_price[8];
  byte market_participant_volume[8]
};

int fractional_trade_cancel_error_message_at;

/* every byte of Fractional Trade Cancel Error Message set to one value */
inline fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record, fractional_trade_cancel_error_message_value) {
  fractional_trade_cancel_error_message_record.market_center_originator = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_record.sub_market_center_id = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.sip_timestamp[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_1[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.participant_token[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_2[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> fractional_trade_cancel_error_message_record.symbol_long[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.trade_cancellation_type = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_trade_id[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_trade_price[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_volume_long[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.original_sale_condition[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.original_trade_through_exempt_flag = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> fractional_trade_cancel_error_message_record.original_sellers_sale_days[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_high_price[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_low_price[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_last_price[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_volume[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.consolidated_price_change_indicator = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_record.consolidated_last_price_originator = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_high_price[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_low_price[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_last_price[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_volume[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record, fractional_trade_cancel_error_message_base) {
  fractional_trade_cancel_error_message_record.market_center_originator = (fractional_trade_cancel_error_message_base + 0 + 1) % 256;
  fractional_trade_cancel_error_message_record.sub_market_center_id = (fractional_trade_cancel_error_message_base + 1 + 1) % 256;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.sip_timestamp[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 2 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_1[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 10 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.participant_token[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 18 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_2[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 26 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> fractional_trade_cancel_error_message_record.symbol_long[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 34 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.trade_cancellation_type = (fractional_trade_cancel_error_message_base + 45 + 1) % 256;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_trade_id[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 46 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_trade_price[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 54 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_volume_long[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 62 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.original_sale_condition[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 70 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.original_trade_through_exempt_flag = (fractional_trade_cancel_error_message_base + 74 + 1) % 256;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> fractional_trade_cancel_error_message_record.original_sellers_sale_days[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 75 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_high_price[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 77 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_low_price[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 85 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_last_price[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 93 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_volume[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 101 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.consolidated_price_change_indicator = (fractional_trade_cancel_error_message_base + 109 + 1) % 256;
  fractional_trade_cancel_error_message_record.consolidated_last_price_originator = (fractional_trade_cancel_error_message_base + 110 + 1) % 256;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_high_price[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 111 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_low_price[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 119 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_last_price[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 127 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_volume[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 135 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Cancel Error Message to the wire, 143 bytes from where the cursor stands */
inline encode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record) {
  wire[at] = fractional_trade_cancel_error_message_record.market_center_originator; at = at + 1;
  wire[at] = fractional_trade_cancel_error_message_record.sub_market_center_id; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.sip_timestamp[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.timestamp_1[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.participant_token[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.timestamp_2[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> wire[at] = fractional_trade_cancel_error_message_record.symbol_long[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_cancel_error_message_record.trade_cancellation_type; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.original_trade_id[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.original_trade_price[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.original_volume_long[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> wire[at] = fractional_trade_cancel_error_message_record.original_sale_condition[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_cancel_error_message_record.original_trade_through_exempt_flag; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> wire[at] = fractional_trade_cancel_error_message_record.original_sellers_sale_days[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.consolidated_high_price[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.consolidated_low_price[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.consolidated_last_price[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.consolidated_volume[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_cancel_error_message_record.consolidated_price_change_indicator; at = at + 1;
  wire[at] = fractional_trade_cancel_error_message_record.consolidated_last_price_originator; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.market_participant_high_price[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.market_participant_low_price[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.market_participant_last_price[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.market_participant_volume[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Cancel Error Message off the wire, 143 bytes from where the cursor stands */
inline decode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record) {
  fractional_trade_cancel_error_message_record.market_center_originator = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_record.sub_market_center_id = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.sip_timestamp[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_1[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.participant_token[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_2[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> fractional_trade_cancel_error_message_record.symbol_long[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.trade_cancellation_type = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_trade_id[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_trade_price[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_volume_long[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.original_sale_condition[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.original_trade_through_exempt_flag = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> fractional_trade_cancel_error_message_record.original_sellers_sale_days[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_high_price[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_low_price[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_last_price[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.consolidated_volume[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.consolidated_price_change_indicator = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_record.consolidated_last_price_originator = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_high_price[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_low_price[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_last_price[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.market_participant_volume[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional Trade Cancel Error Message is what was written, byte for byte */
inline equal_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_read, fractional_trade_cancel_error_message_written) {
  assert(fractional_trade_cancel_error_message_read.market_center_originator == fractional_trade_cancel_error_message_written.market_center_originator);
  assert(fractional_trade_cancel_error_message_read.sub_market_center_id == fractional_trade_cancel_error_message_written.sub_market_center_id);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.sip_timestamp[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.sip_timestamp[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.timestamp_1[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.timestamp_1[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.participant_token[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.participant_token[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.timestamp_2[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.timestamp_2[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> assert(fractional_trade_cancel_error_message_read.symbol_long[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.symbol_long[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_cancel_error_message_read.trade_cancellation_type == fractional_trade_cancel_error_message_written.trade_cancellation_type);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.original_trade_id[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.original_trade_id[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.original_trade_price[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.original_trade_price[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.original_volume_long[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.original_volume_long[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> assert(fractional_trade_cancel_error_message_read.original_sale_condition[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.original_sale_condition[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_cancel_error_message_read.original_trade_through_exempt_flag == fractional_trade_cancel_error_message_written.original_trade_through_exempt_flag);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> assert(fractional_trade_cancel_error_message_read.original_sellers_sale_days[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.original_sellers_sale_days[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.consolidated_high_price[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.consolidated_high_price[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.consolidated_low_price[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.consolidated_low_price[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.consolidated_last_price[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.consolidated_last_price[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.consolidated_volume[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.consolidated_volume[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_cancel_error_message_read.consolidated_price_change_indicator == fractional_trade_cancel_error_message_written.consolidated_price_change_indicator);
  assert(fractional_trade_cancel_error_message_read.consolidated_last_price_originator == fractional_trade_cancel_error_message_written.consolidated_last_price_originator);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.market_participant_high_price[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.market_participant_high_price[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.market_participant_low_price[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.market_participant_low_price[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.market_participant_last_price[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.market_participant_last_price[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.market_participant_volume[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.market_participant_volume[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional Trade Correction Message: 173 bytes -------------------------- */

/* Fractional Trade Correction Message. Introduced with the Fractional Share Release on February 23, 2026. */
typedef FractionalTradeCorrectionMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte original_trade_id[8];
  byte original_trade_price[8];
  byte original_volume_long[8];
  byte original_sale_condition[4];
  byte original_trade_through_exempt_flag;
  byte original_sellers_sale_days[2];
  byte corrected_trade_id[8];
  byte corrected_trade_price[8];
  byte corrected_volume_long[8];
  byte corrected_sale_condition[4];
  byte corrected_trade_through_exempt_flag;
  byte corrected_sellers_sale_days[2];
  byte consolidated_high_price[8];
  byte consolidated_low_price[8];
  byte consolidated_last_price[8];
  byte consolidated_volume[8];
  byte consolidated_price_change_indicator;
  byte consolidated_last_price_originator;
  byte market_participant_high_price[8];
  byte market_participant_low_price[8];
  byte market_participant_last_price[8];
  byte market_participant_volume[8]
};

int fractional_trade_correction_message_at;

/* every byte of Fractional Trade Correction Message set to one value */
inline fill_fractional_trade_correction_message(fractional_trade_correction_message_record, fractional_trade_correction_message_value) {
  fractional_trade_correction_message_record.market_center_originator = fractional_trade_correction_message_value;
  fractional_trade_correction_message_record.sub_market_center_id = fractional_trade_correction_message_value;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.sip_timestamp[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_1[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.participant_token[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_2[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.symbol_long[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_trade_id[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_trade_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_volume_long[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.original_sale_condition[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.original_trade_through_exempt_flag = fractional_trade_correction_message_value;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.original_sellers_sale_days[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_trade_id[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_trade_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_volume_long[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.corrected_sale_condition[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.corrected_trade_through_exempt_flag = fractional_trade_correction_message_value;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.corrected_sellers_sale_days[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_high_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_low_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_last_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_volume[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.consolidated_price_change_indicator = fractional_trade_correction_message_value;
  fractional_trade_correction_message_record.consolidated_last_price_originator = fractional_trade_correction_message_value;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_high_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_low_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_last_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_volume[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_trade_correction_message(fractional_trade_correction_message_record, fractional_trade_correction_message_base) {
  fractional_trade_correction_message_record.market_center_originator = (fractional_trade_correction_message_base + 0 + 1) % 256;
  fractional_trade_correction_message_record.sub_market_center_id = (fractional_trade_correction_message_base + 1 + 1) % 256;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.sip_timestamp[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 2 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_1[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 10 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.participant_token[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 18 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_2[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 26 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.symbol_long[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 34 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_trade_id[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 45 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_trade_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 53 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_volume_long[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 61 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.original_sale_condition[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 69 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.original_trade_through_exempt_flag = (fractional_trade_correction_message_base + 73 + 1) % 256;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.original_sellers_sale_days[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 74 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_trade_id[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 76 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_trade_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 84 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_volume_long[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 92 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.corrected_sale_condition[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 100 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.corrected_trade_through_exempt_flag = (fractional_trade_correction_message_base + 104 + 1) % 256;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.corrected_sellers_sale_days[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 105 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_high_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 107 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_low_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 115 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_last_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 123 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_volume[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 131 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.consolidated_price_change_indicator = (fractional_trade_correction_message_base + 139 + 1) % 256;
  fractional_trade_correction_message_record.consolidated_last_price_originator = (fractional_trade_correction_message_base + 140 + 1) % 256;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_high_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 141 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_low_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 149 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_last_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 157 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_volume[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 165 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Correction Message to the wire, 173 bytes from where the cursor stands */
inline encode_fractional_trade_correction_message(fractional_trade_correction_message_record) {
  wire[at] = fractional_trade_correction_message_record.market_center_originator; at = at + 1;
  wire[at] = fractional_trade_correction_message_record.sub_market_center_id; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.sip_timestamp[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.timestamp_1[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.participant_token[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.timestamp_2[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> wire[at] = fractional_trade_correction_message_record.symbol_long[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.original_trade_id[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.original_trade_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.original_volume_long[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> wire[at] = fractional_trade_correction_message_record.original_sale_condition[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_correction_message_record.original_trade_through_exempt_flag; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> wire[at] = fractional_trade_correction_message_record.original_sellers_sale_days[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.corrected_trade_id[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.corrected_trade_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.corrected_volume_long[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> wire[at] = fractional_trade_correction_message_record.corrected_sale_condition[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_correction_message_record.corrected_trade_through_exempt_flag; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> wire[at] = fractional_trade_correction_message_record.corrected_sellers_sale_days[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.consolidated_high_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.consolidated_low_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.consolidated_last_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.consolidated_volume[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_correction_message_record.consolidated_price_change_indicator; at = at + 1;
  wire[at] = fractional_trade_correction_message_record.consolidated_last_price_originator; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.market_participant_high_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.market_participant_low_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.market_participant_last_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.market_participant_volume[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Correction Message off the wire, 173 bytes from where the cursor stands */
inline decode_fractional_trade_correction_message(fractional_trade_correction_message_record) {
  fractional_trade_correction_message_record.market_center_originator = wire[at]; at = at + 1;
  fractional_trade_correction_message_record.sub_market_center_id = wire[at]; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.sip_timestamp[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_1[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.participant_token[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_2[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.symbol_long[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_trade_id[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_trade_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_volume_long[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.original_sale_condition[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.original_trade_through_exempt_flag = wire[at]; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.original_sellers_sale_days[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_trade_id[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_trade_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_volume_long[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.corrected_sale_condition[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.corrected_trade_through_exempt_flag = wire[at]; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.corrected_sellers_sale_days[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_high_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_low_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_last_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.consolidated_volume[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.consolidated_price_change_indicator = wire[at]; at = at + 1;
  fractional_trade_correction_message_record.consolidated_last_price_originator = wire[at]; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_high_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_low_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_last_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.market_participant_volume[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional Trade Correction Message is what was written, byte for byte */
inline equal_fractional_trade_correction_message(fractional_trade_correction_message_read, fractional_trade_correction_message_written) {
  assert(fractional_trade_correction_message_read.market_center_originator == fractional_trade_correction_message_written.market_center_originator);
  assert(fractional_trade_correction_message_read.sub_market_center_id == fractional_trade_correction_message_written.sub_market_center_id);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.sip_timestamp[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.sip_timestamp[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.timestamp_1[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.timestamp_1[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.participant_token[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.participant_token[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.timestamp_2[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.timestamp_2[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> assert(fractional_trade_correction_message_read.symbol_long[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.symbol_long[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.original_trade_id[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.original_trade_id[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.original_trade_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.original_trade_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.original_volume_long[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.original_volume_long[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> assert(fractional_trade_correction_message_read.original_sale_condition[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.original_sale_condition[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_correction_message_read.original_trade_through_exempt_flag == fractional_trade_correction_message_written.original_trade_through_exempt_flag);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> assert(fractional_trade_correction_message_read.original_sellers_sale_days[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.original_sellers_sale_days[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.corrected_trade_id[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.corrected_trade_id[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.corrected_trade_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.corrected_trade_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.corrected_volume_long[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.corrected_volume_long[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> assert(fractional_trade_correction_message_read.corrected_sale_condition[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.corrected_sale_condition[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_correction_message_read.corrected_trade_through_exempt_flag == fractional_trade_correction_message_written.corrected_trade_through_exempt_flag);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> assert(fractional_trade_correction_message_read.corrected_sellers_sale_days[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.corrected_sellers_sale_days[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.consolidated_high_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.consolidated_high_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.consolidated_low_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.consolidated_low_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.consolidated_last_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.consolidated_last_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.consolidated_volume[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.consolidated_volume[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_correction_message_read.consolidated_price_change_indicator == fractional_trade_correction_message_written.consolidated_price_change_indicator);
  assert(fractional_trade_correction_message_read.consolidated_last_price_originator == fractional_trade_correction_message_written.consolidated_last_price_originator);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.market_participant_high_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.market_participant_high_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.market_participant_low_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.market_participant_low_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.market_participant_last_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.market_participant_last_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.market_participant_volume[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.market_participant_volume[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional As Of Trade Message: 85 bytes -------------------------------- */

/* Fractional As-Of Trade Message. Introduced with the Fractional Share Release on February 23, 2026. */
typedef FractionalAsOfTradeMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_id[8];
  byte trade_price_long[8];
  byte trade_volume[8];
  byte sale_condition[4];
  byte trade_through_exempt_flag;
  byte sellers_sale_days[2];
  byte as_of_action;
  byte timestamp_of_trade[8]
};

int fractional_as_of_trade_message_at;

/* every byte of Fractional As Of Trade Message set to one value */
inline fill_fractional_as_of_trade_message(fractional_as_of_trade_message_record, fractional_as_of_trade_message_value) {
  fractional_as_of_trade_message_record.market_center_originator = fractional_as_of_trade_message_value;
  fractional_as_of_trade_message_record.sub_market_center_id = fractional_as_of_trade_message_value;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.sip_timestamp[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.timestamp_1[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.participant_token[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.timestamp_2[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 11 -> fractional_as_of_trade_message_record.symbol_long[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.trade_id[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.trade_price_long[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.trade_volume[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 4 -> fractional_as_of_trade_message_record.sale_condition[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_record.trade_through_exempt_flag = fractional_as_of_trade_message_value;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 2 -> fractional_as_of_trade_message_record.sellers_sale_days[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_record.as_of_action = fractional_as_of_trade_message_value;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.timestamp_of_trade[fractional_as_of_trade_message_at] = fractional_as_of_trade_message_value; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional As Of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_as_of_trade_message(fractional_as_of_trade_message_record, fractional_as_of_trade_message_base) {
  fractional_as_of_trade_message_record.market_center_originator = (fractional_as_of_trade_message_base + 0 + 1) % 256;
  fractional_as_of_trade_message_record.sub_market_center_id = (fractional_as_of_trade_message_base + 1 + 1) % 256;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.sip_timestamp[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 2 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.timestamp_1[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 10 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.participant_token[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 18 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.timestamp_2[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 26 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 11 -> fractional_as_of_trade_message_record.symbol_long[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 34 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.trade_id[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 45 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.trade_price_long[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 53 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.trade_volume[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 61 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 4 -> fractional_as_of_trade_message_record.sale_condition[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 69 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_record.trade_through_exempt_flag = (fractional_as_of_trade_message_base + 73 + 1) % 256;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 2 -> fractional_as_of_trade_message_record.sellers_sale_days[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 74 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_record.as_of_action = (fractional_as_of_trade_message_base + 76 + 1) % 256;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.timestamp_of_trade[fractional_as_of_trade_message_at] = (fractional_as_of_trade_message_base + 77 + fractional_as_of_trade_message_at + 1) % 256; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional As Of Trade Message to the wire, 85 bytes from where the cursor stands */
inline encode_fractional_as_of_trade_message(fractional_as_of_trade_message_record) {
  wire[at] = fractional_as_of_trade_message_record.market_center_originator; at = at + 1;
  wire[at] = fractional_as_of_trade_message_record.sub_market_center_id; at = at + 1;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> wire[at] = fractional_as_of_trade_message_record.sip_timestamp[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> wire[at] = fractional_as_of_trade_message_record.timestamp_1[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> wire[at] = fractional_as_of_trade_message_record.participant_token[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> wire[at] = fractional_as_of_trade_message_record.timestamp_2[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 11 -> wire[at] = fractional_as_of_trade_message_record.symbol_long[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> wire[at] = fractional_as_of_trade_message_record.trade_id[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> wire[at] = fractional_as_of_trade_message_record.trade_price_long[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> wire[at] = fractional_as_of_trade_message_record.trade_volume[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 4 -> wire[at] = fractional_as_of_trade_message_record.sale_condition[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_as_of_trade_message_record.trade_through_exempt_flag; at = at + 1;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 2 -> wire[at] = fractional_as_of_trade_message_record.sellers_sale_days[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_as_of_trade_message_record.as_of_action; at = at + 1;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> wire[at] = fractional_as_of_trade_message_record.timestamp_of_trade[fractional_as_of_trade_message_at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional As Of Trade Message off the wire, 85 bytes from where the cursor stands */
inline decode_fractional_as_of_trade_message(fractional_as_of_trade_message_record) {
  fractional_as_of_trade_message_record.market_center_originator = wire[at]; at = at + 1;
  fractional_as_of_trade_message_record.sub_market_center_id = wire[at]; at = at + 1;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.sip_timestamp[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.timestamp_1[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.participant_token[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.timestamp_2[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 11 -> fractional_as_of_trade_message_record.symbol_long[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.trade_id[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.trade_price_long[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.trade_volume[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 4 -> fractional_as_of_trade_message_record.sale_condition[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_record.trade_through_exempt_flag = wire[at]; at = at + 1;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 2 -> fractional_as_of_trade_message_record.sellers_sale_days[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_record.as_of_action = wire[at]; at = at + 1;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> fractional_as_of_trade_message_record.timestamp_of_trade[fractional_as_of_trade_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional As Of Trade Message is what was written, byte for byte */
inline equal_fractional_as_of_trade_message(fractional_as_of_trade_message_read, fractional_as_of_trade_message_written) {
  assert(fractional_as_of_trade_message_read.market_center_originator == fractional_as_of_trade_message_written.market_center_originator);
  assert(fractional_as_of_trade_message_read.sub_market_center_id == fractional_as_of_trade_message_written.sub_market_center_id);
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> assert(fractional_as_of_trade_message_read.sip_timestamp[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.sip_timestamp[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> assert(fractional_as_of_trade_message_read.timestamp_1[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.timestamp_1[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> assert(fractional_as_of_trade_message_read.participant_token[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.participant_token[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> assert(fractional_as_of_trade_message_read.timestamp_2[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.timestamp_2[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 11 -> assert(fractional_as_of_trade_message_read.symbol_long[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.symbol_long[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> assert(fractional_as_of_trade_message_read.trade_id[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.trade_id[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> assert(fractional_as_of_trade_message_read.trade_price_long[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.trade_price_long[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> assert(fractional_as_of_trade_message_read.trade_volume[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.trade_volume[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 4 -> assert(fractional_as_of_trade_message_read.sale_condition[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.sale_condition[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_as_of_trade_message_read.trade_through_exempt_flag == fractional_as_of_trade_message_written.trade_through_exempt_flag);
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 2 -> assert(fractional_as_of_trade_message_read.sellers_sale_days[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.sellers_sale_days[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_as_of_trade_message_read.as_of_action == fractional_as_of_trade_message_written.as_of_action);
  fractional_as_of_trade_message_at = 0;
  do
  :: fractional_as_of_trade_message_at < 8 -> assert(fractional_as_of_trade_message_read.timestamp_of_trade[fractional_as_of_trade_message_at] == fractional_as_of_trade_message_written.timestamp_of_trade[fractional_as_of_trade_message_at]); fractional_as_of_trade_message_at = fractional_as_of_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Sro Trading Action Message: 56 bytes ------------------------------ */

/* Informs subscribers of trading actions across all UTP participants */
typedef CrossSroTradingActionMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol_long[11];
  byte trading_action_code;
  byte trading_action_sequence_number[4];
  byte action_time[8];
  byte reason_for_the_trading_action[6]
};

int cross_sro_trading_action_message_at;

/* every byte of Cross Sro Trading Action Message set to one value */
inline fill_cross_sro_trading_action_message(cross_sro_trading_action_message_record, cross_sro_trading_action_message_value) {
  cross_sro_trading_action_message_record.market_center_originator = cross_sro_trading_action_message_value;
  cross_sro_trading_action_message_record.sub_market_center_id = cross_sro_trading_action_message_value;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.sip_timestamp[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.timestamp_1[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.participant_token[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
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
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.action_time[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> cross_sro_trading_action_message_record.reason_for_the_trading_action[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Sro Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_cross_sro_trading_action_message(cross_sro_trading_action_message_record, cross_sro_trading_action_message_base) {
  cross_sro_trading_action_message_record.market_center_originator = (cross_sro_trading_action_message_base + 0 + 1) % 256;
  cross_sro_trading_action_message_record.sub_market_center_id = (cross_sro_trading_action_message_base + 1 + 1) % 256;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.sip_timestamp[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 2 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.timestamp_1[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 10 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.participant_token[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 18 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
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
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.action_time[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 42 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> cross_sro_trading_action_message_record.reason_for_the_trading_action[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 50 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Sro Trading Action Message to the wire, 56 bytes from where the cursor stands */
inline encode_cross_sro_trading_action_message(cross_sro_trading_action_message_record) {
  wire[at] = cross_sro_trading_action_message_record.market_center_originator; at = at + 1;
  wire[at] = cross_sro_trading_action_message_record.sub_market_center_id; at = at + 1;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> wire[at] = cross_sro_trading_action_message_record.sip_timestamp[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> wire[at] = cross_sro_trading_action_message_record.timestamp_1[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> wire[at] = cross_sro_trading_action_message_record.participant_token[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
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
  :: cross_sro_trading_action_message_at < 8 -> wire[at] = cross_sro_trading_action_message_record.action_time[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> wire[at] = cross_sro_trading_action_message_record.reason_for_the_trading_action[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Sro Trading Action Message off the wire, 56 bytes from where the cursor stands */
inline decode_cross_sro_trading_action_message(cross_sro_trading_action_message_record) {
  cross_sro_trading_action_message_record.market_center_originator = wire[at]; at = at + 1;
  cross_sro_trading_action_message_record.sub_market_center_id = wire[at]; at = at + 1;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.sip_timestamp[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.timestamp_1[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.participant_token[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
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
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.action_time[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> cross_sro_trading_action_message_record.reason_for_the_trading_action[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Sro Trading Action Message is what was written, byte for byte */
inline equal_cross_sro_trading_action_message(cross_sro_trading_action_message_read, cross_sro_trading_action_message_written) {
  assert(cross_sro_trading_action_message_read.market_center_originator == cross_sro_trading_action_message_written.market_center_originator);
  assert(cross_sro_trading_action_message_read.sub_market_center_id == cross_sro_trading_action_message_written.sub_market_center_id);
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> assert(cross_sro_trading_action_message_read.sip_timestamp[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.sip_timestamp[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> assert(cross_sro_trading_action_message_read.timestamp_1[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.timestamp_1[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> assert(cross_sro_trading_action_message_read.participant_token[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.participant_token[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
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
  :: cross_sro_trading_action_message_at < 8 -> assert(cross_sro_trading_action_message_read.action_time[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.action_time[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> assert(cross_sro_trading_action_message_read.reason_for_the_trading_action[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.reason_for_the_trading_action[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Center Trading Action Message: 47 bytes -------------------------- */

/* Informs UTP data feed subscribers when a UTP participant invokes or releases a market center-specific trading halt */
typedef MarketCenterTradingActionMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol_long[11];
  byte trading_action_code;
  byte action_time[8];
  byte market_center_identifier
};

int market_center_trading_action_message_at;

/* every byte of Market Center Trading Action Message set to one value */
inline fill_market_center_trading_action_message(market_center_trading_action_message_record, market_center_trading_action_message_value) {
  market_center_trading_action_message_record.market_center_originator = market_center_trading_action_message_value;
  market_center_trading_action_message_record.sub_market_center_id = market_center_trading_action_message_value;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.sip_timestamp[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.participant_token[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.trading_action_code = market_center_trading_action_message_value;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_time[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.market_center_identifier = market_center_trading_action_message_value;
  skip
}

/* each byte of Market Center Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_market_center_trading_action_message(market_center_trading_action_message_record, market_center_trading_action_message_base) {
  market_center_trading_action_message_record.market_center_originator = (market_center_trading_action_message_base + 0 + 1) % 256;
  market_center_trading_action_message_record.sub_market_center_id = (market_center_trading_action_message_base + 1 + 1) % 256;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.sip_timestamp[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 2 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 10 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.participant_token[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 18 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 26 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.trading_action_code = (market_center_trading_action_message_base + 37 + 1) % 256;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_time[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 38 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.market_center_identifier = (market_center_trading_action_message_base + 46 + 1) % 256;
  skip
}

/* Market Center Trading Action Message to the wire, 47 bytes from where the cursor stands */
inline encode_market_center_trading_action_message(market_center_trading_action_message_record) {
  wire[at] = market_center_trading_action_message_record.market_center_originator; at = at + 1;
  wire[at] = market_center_trading_action_message_record.sub_market_center_id; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.sip_timestamp[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.participant_token[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> wire[at] = market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = market_center_trading_action_message_record.trading_action_code; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.action_time[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = market_center_trading_action_message_record.market_center_identifier; at = at + 1;
  skip
}

/* Market Center Trading Action Message off the wire, 47 bytes from where the cursor stands */
inline decode_market_center_trading_action_message(market_center_trading_action_message_record) {
  market_center_trading_action_message_record.market_center_originator = wire[at]; at = at + 1;
  market_center_trading_action_message_record.sub_market_center_id = wire[at]; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.sip_timestamp[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.participant_token[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.trading_action_code = wire[at]; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_time[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.market_center_identifier = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Center Trading Action Message is what was written, byte for byte */
inline equal_market_center_trading_action_message(market_center_trading_action_message_read, market_center_trading_action_message_written) {
  assert(market_center_trading_action_message_read.market_center_originator == market_center_trading_action_message_written.market_center_originator);
  assert(market_center_trading_action_message_read.sub_market_center_id == market_center_trading_action_message_written.sub_market_center_id);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.sip_timestamp[market_center_trading_action_message_at] == market_center_trading_action_message_written.sip_timestamp[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.timestamp_1[market_center_trading_action_message_at] == market_center_trading_action_message_written.timestamp_1[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.participant_token[market_center_trading_action_message_at] == market_center_trading_action_message_written.participant_token[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> assert(market_center_trading_action_message_read.symbol_long[market_center_trading_action_message_at] == market_center_trading_action_message_written.symbol_long[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  assert(market_center_trading_action_message_read.trading_action_code == market_center_trading_action_message_written.trading_action_code);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.action_time[market_center_trading_action_message_at] == market_center_trading_action_message_written.action_time[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  assert(market_center_trading_action_message_read.market_center_identifier == market_center_trading_action_message_written.market_center_identifier);
  skip
}

/* ---- Issue Symbol Directory Message: 87 bytes -------------------------------- */

/* Issue Symbol Directory Message providing reference data for NASDAQ-listed securities */
typedef IssueSymbolDirectoryMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
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
  issue_symbol_directory_message_record.market_center_originator = issue_symbol_directory_message_value;
  issue_symbol_directory_message_record.sub_market_center_id = issue_symbol_directory_message_value;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.sip_timestamp[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.timestamp_1[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.participant_token[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
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
  issue_symbol_directory_message_record.market_center_originator = (issue_symbol_directory_message_base + 0 + 1) % 256;
  issue_symbol_directory_message_record.sub_market_center_id = (issue_symbol_directory_message_base + 1 + 1) % 256;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.sip_timestamp[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 2 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.timestamp_1[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 10 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.participant_token[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 18 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
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
  wire[at] = issue_symbol_directory_message_record.market_center_originator; at = at + 1;
  wire[at] = issue_symbol_directory_message_record.sub_market_center_id; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> wire[at] = issue_symbol_directory_message_record.sip_timestamp[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> wire[at] = issue_symbol_directory_message_record.timestamp_1[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> wire[at] = issue_symbol_directory_message_record.participant_token[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
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
  issue_symbol_directory_message_record.market_center_originator = wire[at]; at = at + 1;
  issue_symbol_directory_message_record.sub_market_center_id = wire[at]; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.sip_timestamp[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.timestamp_1[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.participant_token[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
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
  assert(issue_symbol_directory_message_read.market_center_originator == issue_symbol_directory_message_written.market_center_originator);
  assert(issue_symbol_directory_message_read.sub_market_center_id == issue_symbol_directory_message_written.sub_market_center_id);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> assert(issue_symbol_directory_message_read.sip_timestamp[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.sip_timestamp[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> assert(issue_symbol_directory_message_read.timestamp_1[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.timestamp_1[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> assert(issue_symbol_directory_message_read.participant_token[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.participant_token[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
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

/* ---- Reg Sho Short Sale Price Test Restricted Indicator Message: 38 bytes ---- */

/* Reg SHO Restriction Indicator Message */
typedef RegShoShortSalePriceTestRestrictedIndicatorMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol_long[11];
  byte reg_sho_action
};

int reg_sho_short_sale_price_test_restricted_indicator_message_at;

/* every byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to one value */
inline fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_value) {
  reg_sho_short_sale_price_test_restricted_indicator_message_record.market_center_originator = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.sub_market_center_id = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  skip
}

/* each byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_base) {
  reg_sho_short_sale_price_test_restricted_indicator_message_record.market_center_originator = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 0 + 1) % 256;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.sub_market_center_id = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 1 + 1) % 256;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 2 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 10 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 18 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 26 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 37 + 1) % 256;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message to the wire, 38 bytes from where the cursor stands */
inline encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.market_center_originator; at = at + 1;
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.sub_market_center_id; at = at + 1;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message off the wire, 38 bytes from where the cursor stands */
inline decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  reg_sho_short_sale_price_test_restricted_indicator_message_record.market_center_originator = wire[at]; at = at + 1;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.sub_market_center_id = wire[at]; at = at + 1;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Short Sale Price Test Restricted Indicator Message is what was written, byte for byte */
inline equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_read, reg_sho_short_sale_price_test_restricted_indicator_message_written) {
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.market_center_originator == reg_sho_short_sale_price_test_restricted_indicator_message_written.market_center_originator);
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.sub_market_center_id == reg_sho_short_sale_price_test_restricted_indicator_message_written.sub_market_center_id);
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.reg_sho_action == reg_sho_short_sale_price_test_restricted_indicator_message_written.reg_sho_action);
  skip
}

/* ---- Limit Up Limit Down Price Band Message: 62 bytes ------------------------ */

/* LULD Price Band Message */
typedef LimitUpLimitDownPriceBandMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol_long[11];
  byte luld_price_band_indicator;
  byte luld_price_band_effective_time[8];
  byte limit_down_price[8];
  byte limit_up_price[8]
};

int limit_up_limit_down_price_band_message_at;

/* every byte of Limit Up Limit Down Price Band Message set to one value */
inline fill_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_record, limit_up_limit_down_price_band_message_value) {
  limit_up_limit_down_price_band_message_record.market_center_originator = limit_up_limit_down_price_band_message_value;
  limit_up_limit_down_price_band_message_record.sub_market_center_id = limit_up_limit_down_price_band_message_value;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.sip_timestamp[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.timestamp_1[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.participant_token[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> limit_up_limit_down_price_band_message_record.symbol_long[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_record.luld_price_band_indicator = limit_up_limit_down_price_band_message_value;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
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
  limit_up_limit_down_price_band_message_record.market_center_originator = (limit_up_limit_down_price_band_message_base + 0 + 1) % 256;
  limit_up_limit_down_price_band_message_record.sub_market_center_id = (limit_up_limit_down_price_band_message_base + 1 + 1) % 256;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.sip_timestamp[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 2 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.timestamp_1[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 10 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.participant_token[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 18 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> limit_up_limit_down_price_band_message_record.symbol_long[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 26 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_record.luld_price_band_indicator = (limit_up_limit_down_price_band_message_base + 37 + 1) % 256;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 38 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
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
  wire[at] = limit_up_limit_down_price_band_message_record.market_center_originator; at = at + 1;
  wire[at] = limit_up_limit_down_price_band_message_record.sub_market_center_id; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.sip_timestamp[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.timestamp_1[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.participant_token[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> wire[at] = limit_up_limit_down_price_band_message_record.symbol_long[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  wire[at] = limit_up_limit_down_price_band_message_record.luld_price_band_indicator; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
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
  limit_up_limit_down_price_band_message_record.market_center_originator = wire[at]; at = at + 1;
  limit_up_limit_down_price_band_message_record.sub_market_center_id = wire[at]; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.sip_timestamp[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.timestamp_1[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.participant_token[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> limit_up_limit_down_price_band_message_record.symbol_long[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_record.luld_price_band_indicator = wire[at]; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
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
  assert(limit_up_limit_down_price_band_message_read.market_center_originator == limit_up_limit_down_price_band_message_written.market_center_originator);
  assert(limit_up_limit_down_price_band_message_read.sub_market_center_id == limit_up_limit_down_price_band_message_written.sub_market_center_id);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.sip_timestamp[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.sip_timestamp[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.timestamp_1[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.timestamp_1[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.participant_token[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.participant_token[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> assert(limit_up_limit_down_price_band_message_read.symbol_long[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.symbol_long[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  assert(limit_up_limit_down_price_band_message_read.luld_price_band_indicator == limit_up_limit_down_price_band_message_written.luld_price_band_indicator);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
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

/* MWCB Decline Message */
typedef MarketWideCircuitBreakerDeclineLevelMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte mwcb_level_1[8];
  byte mwcb_level_2[8];
  byte mwcb_level_3[8]
};

int market_wide_circuit_breaker_decline_level_message_at;

/* every byte of Market Wide Circuit Breaker Decline Level Message set to one value */
inline fill_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_record, market_wide_circuit_breaker_decline_level_message_value) {
  market_wide_circuit_breaker_decline_level_message_record.market_center_originator = market_wide_circuit_breaker_decline_level_message_value;
  market_wide_circuit_breaker_decline_level_message_record.sub_market_center_id = market_wide_circuit_breaker_decline_level_message_value;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.timestamp_1[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.participant_token[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
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
  market_wide_circuit_breaker_decline_level_message_record.market_center_originator = (market_wide_circuit_breaker_decline_level_message_base + 0 + 1) % 256;
  market_wide_circuit_breaker_decline_level_message_record.sub_market_center_id = (market_wide_circuit_breaker_decline_level_message_base + 1 + 1) % 256;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 2 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.timestamp_1[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 10 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.participant_token[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 18 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
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
  wire[at] = market_wide_circuit_breaker_decline_level_message_record.market_center_originator; at = at + 1;
  wire[at] = market_wide_circuit_breaker_decline_level_message_record.sub_market_center_id; at = at + 1;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.timestamp_1[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.participant_token[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
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
  market_wide_circuit_breaker_decline_level_message_record.market_center_originator = wire[at]; at = at + 1;
  market_wide_circuit_breaker_decline_level_message_record.sub_market_center_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.timestamp_1[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.participant_token[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
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
  assert(market_wide_circuit_breaker_decline_level_message_read.market_center_originator == market_wide_circuit_breaker_decline_level_message_written.market_center_originator);
  assert(market_wide_circuit_breaker_decline_level_message_read.sub_market_center_id == market_wide_circuit_breaker_decline_level_message_written.sub_market_center_id);
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.timestamp_1[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.timestamp_1[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.participant_token[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.participant_token[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
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

/* MWCB Status Message */
typedef MarketWideCircuitBreakerStatusMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte mwcb_status_level_indicator
};

int market_wide_circuit_breaker_status_message_at;

/* every byte of Market Wide Circuit Breaker Status Message set to one value */
inline fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_value) {
  market_wide_circuit_breaker_status_message_record.market_center_originator = market_wide_circuit_breaker_status_message_value;
  market_wide_circuit_breaker_status_message_record.sub_market_center_id = market_wide_circuit_breaker_status_message_value;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.sip_timestamp[market_wide_circuit_breaker_status_message_at] = market_wide_circuit_breaker_status_message_value; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.timestamp_1[market_wide_circuit_breaker_status_message_at] = market_wide_circuit_breaker_status_message_value; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_token[market_wide_circuit_breaker_status_message_at] = market_wide_circuit_breaker_status_message_value; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.mwcb_status_level_indicator = market_wide_circuit_breaker_status_message_value;
  skip
}

/* each byte of Market Wide Circuit Breaker Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_base) {
  market_wide_circuit_breaker_status_message_record.market_center_originator = (market_wide_circuit_breaker_status_message_base + 0 + 1) % 256;
  market_wide_circuit_breaker_status_message_record.sub_market_center_id = (market_wide_circuit_breaker_status_message_base + 1 + 1) % 256;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.sip_timestamp[market_wide_circuit_breaker_status_message_at] = (market_wide_circuit_breaker_status_message_base + 2 + market_wide_circuit_breaker_status_message_at + 1) % 256; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.timestamp_1[market_wide_circuit_breaker_status_message_at] = (market_wide_circuit_breaker_status_message_base + 10 + market_wide_circuit_breaker_status_message_at + 1) % 256; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_token[market_wide_circuit_breaker_status_message_at] = (market_wide_circuit_breaker_status_message_base + 18 + market_wide_circuit_breaker_status_message_at + 1) % 256; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.mwcb_status_level_indicator = (market_wide_circuit_breaker_status_message_base + 26 + 1) % 256;
  skip
}

/* Market Wide Circuit Breaker Status Message to the wire, 27 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  wire[at] = market_wide_circuit_breaker_status_message_record.market_center_originator; at = at + 1;
  wire[at] = market_wide_circuit_breaker_status_message_record.sub_market_center_id; at = at + 1;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_status_message_record.sip_timestamp[market_wide_circuit_breaker_status_message_at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_status_message_record.timestamp_1[market_wide_circuit_breaker_status_message_at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_status_message_record.participant_token[market_wide_circuit_breaker_status_message_at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  wire[at] = market_wide_circuit_breaker_status_message_record.mwcb_status_level_indicator; at = at + 1;
  skip
}

/* Market Wide Circuit Breaker Status Message off the wire, 27 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  market_wide_circuit_breaker_status_message_record.market_center_originator = wire[at]; at = at + 1;
  market_wide_circuit_breaker_status_message_record.sub_market_center_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.sip_timestamp[market_wide_circuit_breaker_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.timestamp_1[market_wide_circuit_breaker_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_token[market_wide_circuit_breaker_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.mwcb_status_level_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Wide Circuit Breaker Status Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_read, market_wide_circuit_breaker_status_message_written) {
  assert(market_wide_circuit_breaker_status_message_read.market_center_originator == market_wide_circuit_breaker_status_message_written.market_center_originator);
  assert(market_wide_circuit_breaker_status_message_read.sub_market_center_id == market_wide_circuit_breaker_status_message_written.sub_market_center_id);
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> assert(market_wide_circuit_breaker_status_message_read.sip_timestamp[market_wide_circuit_breaker_status_message_at] == market_wide_circuit_breaker_status_message_written.sip_timestamp[market_wide_circuit_breaker_status_message_at]); market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> assert(market_wide_circuit_breaker_status_message_read.timestamp_1[market_wide_circuit_breaker_status_message_at] == market_wide_circuit_breaker_status_message_written.timestamp_1[market_wide_circuit_breaker_status_message_at]); market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> assert(market_wide_circuit_breaker_status_message_read.participant_token[market_wide_circuit_breaker_status_message_at] == market_wide_circuit_breaker_status_message_written.participant_token[market_wide_circuit_breaker_status_message_at]); market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  assert(market_wide_circuit_breaker_status_message_read.mwcb_status_level_indicator == market_wide_circuit_breaker_status_message_written.mwcb_status_level_indicator);
  skip
}

/* ---- Auction Collar Message: 66 bytes ---------------------------------------- */

/* Auction Collar Message */
typedef AuctionCollarMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
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
  auction_collar_message_record.market_center_originator = auction_collar_message_value;
  auction_collar_message_record.sub_market_center_id = auction_collar_message_value;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.sip_timestamp[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.timestamp_1[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.participant_token[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
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
  auction_collar_message_record.market_center_originator = (auction_collar_message_base + 0 + 1) % 256;
  auction_collar_message_record.sub_market_center_id = (auction_collar_message_base + 1 + 1) % 256;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.sip_timestamp[auction_collar_message_at] = (auction_collar_message_base + 2 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.timestamp_1[auction_collar_message_at] = (auction_collar_message_base + 10 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.participant_token[auction_collar_message_at] = (auction_collar_message_base + 18 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
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
  wire[at] = auction_collar_message_record.market_center_originator; at = at + 1;
  wire[at] = auction_collar_message_record.sub_market_center_id; at = at + 1;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.sip_timestamp[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.timestamp_1[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.participant_token[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
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
  auction_collar_message_record.market_center_originator = wire[at]; at = at + 1;
  auction_collar_message_record.sub_market_center_id = wire[at]; at = at + 1;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.sip_timestamp[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.timestamp_1[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.participant_token[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
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
  assert(auction_collar_message_read.market_center_originator == auction_collar_message_written.market_center_originator);
  assert(auction_collar_message_read.sub_market_center_id == auction_collar_message_written.sub_market_center_id);
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.sip_timestamp[auction_collar_message_at] == auction_collar_message_written.sip_timestamp[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.timestamp_1[auction_collar_message_at] == auction_collar_message_written.timestamp_1[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.participant_token[auction_collar_message_at] == auction_collar_message_written.participant_token[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
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

/* Signifies the beginning of each operational cycle for SIP Processing */
typedef StartOfDayMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int start_of_day_message_at;

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  start_of_day_message_record.market_center_originator = start_of_day_message_value;
  start_of_day_message_record.sub_market_center_id = start_of_day_message_value;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.sip_timestamp[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.timestamp_1[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_token[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  start_of_day_message_record.market_center_originator = (start_of_day_message_base + 0 + 1) % 256;
  start_of_day_message_record.sub_market_center_id = (start_of_day_message_base + 1 + 1) % 256;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.sip_timestamp[start_of_day_message_at] = (start_of_day_message_base + 2 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.timestamp_1[start_of_day_message_at] = (start_of_day_message_base + 10 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_token[start_of_day_message_at] = (start_of_day_message_base + 18 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message to the wire, 26 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  wire[at] = start_of_day_message_record.market_center_originator; at = at + 1;
  wire[at] = start_of_day_message_record.sub_market_center_id; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.sip_timestamp[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.timestamp_1[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.participant_token[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message off the wire, 26 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  start_of_day_message_record.market_center_originator = wire[at]; at = at + 1;
  start_of_day_message_record.sub_market_center_id = wire[at]; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.sip_timestamp[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.timestamp_1[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_token[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  assert(start_of_day_message_read.market_center_originator == start_of_day_message_written.market_center_originator);
  assert(start_of_day_message_read.sub_market_center_id == start_of_day_message_written.sub_market_center_id);
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.sip_timestamp[start_of_day_message_at] == start_of_day_message_written.sip_timestamp[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.timestamp_1[start_of_day_message_at] == start_of_day_message_written.timestamp_1[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.participant_token[start_of_day_message_at] == start_of_day_message_written.participant_token[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Day Message: 26 bytes -------------------------------------------- */

/* Signals the end of active message dissemination for the UTP SIP operational cycle */
typedef EndOfDayMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int end_of_day_message_at;

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  end_of_day_message_record.market_center_originator = end_of_day_message_value;
  end_of_day_message_record.sub_market_center_id = end_of_day_message_value;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.sip_timestamp[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.timestamp_1[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_token[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  end_of_day_message_record.market_center_originator = (end_of_day_message_base + 0 + 1) % 256;
  end_of_day_message_record.sub_market_center_id = (end_of_day_message_base + 1 + 1) % 256;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.sip_timestamp[end_of_day_message_at] = (end_of_day_message_base + 2 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.timestamp_1[end_of_day_message_at] = (end_of_day_message_base + 10 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_token[end_of_day_message_at] = (end_of_day_message_base + 18 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message to the wire, 26 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  wire[at] = end_of_day_message_record.market_center_originator; at = at + 1;
  wire[at] = end_of_day_message_record.sub_market_center_id; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.sip_timestamp[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.timestamp_1[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.participant_token[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message off the wire, 26 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  end_of_day_message_record.market_center_originator = wire[at]; at = at + 1;
  end_of_day_message_record.sub_market_center_id = wire[at]; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.sip_timestamp[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.timestamp_1[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_token[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  assert(end_of_day_message_read.market_center_originator == end_of_day_message_written.market_center_originator);
  assert(end_of_day_message_read.sub_market_center_id == end_of_day_message_written.sub_market_center_id);
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.sip_timestamp[end_of_day_message_at] == end_of_day_message_written.sip_timestamp[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.timestamp_1[end_of_day_message_at] == end_of_day_message_written.timestamp_1[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.participant_token[end_of_day_message_at] == end_of_day_message_written.participant_token[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Session Open Message: 26 bytes ----------------------------------- */

/* Signifies the opening of market systems */
typedef MarketSessionOpenMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int market_session_open_message_at;

/* every byte of Market Session Open Message set to one value */
inline fill_market_session_open_message(market_session_open_message_record, market_session_open_message_value) {
  market_session_open_message_record.market_center_originator = market_session_open_message_value;
  market_session_open_message_record.sub_market_center_id = market_session_open_message_value;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.sip_timestamp[market_session_open_message_at] = market_session_open_message_value; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.timestamp_1[market_session_open_message_at] = market_session_open_message_value; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.participant_token[market_session_open_message_at] = market_session_open_message_value; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Session Open Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_open_message(market_session_open_message_record, market_session_open_message_base) {
  market_session_open_message_record.market_center_originator = (market_session_open_message_base + 0 + 1) % 256;
  market_session_open_message_record.sub_market_center_id = (market_session_open_message_base + 1 + 1) % 256;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.sip_timestamp[market_session_open_message_at] = (market_session_open_message_base + 2 + market_session_open_message_at + 1) % 256; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.timestamp_1[market_session_open_message_at] = (market_session_open_message_base + 10 + market_session_open_message_at + 1) % 256; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.participant_token[market_session_open_message_at] = (market_session_open_message_base + 18 + market_session_open_message_at + 1) % 256; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Session Open Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_session_open_message(market_session_open_message_record) {
  wire[at] = market_session_open_message_record.market_center_originator; at = at + 1;
  wire[at] = market_session_open_message_record.sub_market_center_id; at = at + 1;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> wire[at] = market_session_open_message_record.sip_timestamp[market_session_open_message_at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> wire[at] = market_session_open_message_record.timestamp_1[market_session_open_message_at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> wire[at] = market_session_open_message_record.participant_token[market_session_open_message_at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Session Open Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_session_open_message(market_session_open_message_record) {
  market_session_open_message_record.market_center_originator = wire[at]; at = at + 1;
  market_session_open_message_record.sub_market_center_id = wire[at]; at = at + 1;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.sip_timestamp[market_session_open_message_at] = wire[at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.timestamp_1[market_session_open_message_at] = wire[at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.participant_token[market_session_open_message_at] = wire[at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Session Open Message is what was written, byte for byte */
inline equal_market_session_open_message(market_session_open_message_read, market_session_open_message_written) {
  assert(market_session_open_message_read.market_center_originator == market_session_open_message_written.market_center_originator);
  assert(market_session_open_message_read.sub_market_center_id == market_session_open_message_written.sub_market_center_id);
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> assert(market_session_open_message_read.sip_timestamp[market_session_open_message_at] == market_session_open_message_written.sip_timestamp[market_session_open_message_at]); market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> assert(market_session_open_message_read.timestamp_1[market_session_open_message_at] == market_session_open_message_written.timestamp_1[market_session_open_message_at]); market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> assert(market_session_open_message_read.participant_token[market_session_open_message_at] == market_session_open_message_written.participant_token[market_session_open_message_at]); market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Session Close Message: 26 bytes ---------------------------------- */

/* Signals the closing of market systems */
typedef MarketSessionCloseMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int market_session_close_message_at;

/* every byte of Market Session Close Message set to one value */
inline fill_market_session_close_message(market_session_close_message_record, market_session_close_message_value) {
  market_session_close_message_record.market_center_originator = market_session_close_message_value;
  market_session_close_message_record.sub_market_center_id = market_session_close_message_value;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.sip_timestamp[market_session_close_message_at] = market_session_close_message_value; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.timestamp_1[market_session_close_message_at] = market_session_close_message_value; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.participant_token[market_session_close_message_at] = market_session_close_message_value; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Session Close Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_close_message(market_session_close_message_record, market_session_close_message_base) {
  market_session_close_message_record.market_center_originator = (market_session_close_message_base + 0 + 1) % 256;
  market_session_close_message_record.sub_market_center_id = (market_session_close_message_base + 1 + 1) % 256;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.sip_timestamp[market_session_close_message_at] = (market_session_close_message_base + 2 + market_session_close_message_at + 1) % 256; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.timestamp_1[market_session_close_message_at] = (market_session_close_message_base + 10 + market_session_close_message_at + 1) % 256; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.participant_token[market_session_close_message_at] = (market_session_close_message_base + 18 + market_session_close_message_at + 1) % 256; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Session Close Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_session_close_message(market_session_close_message_record) {
  wire[at] = market_session_close_message_record.market_center_originator; at = at + 1;
  wire[at] = market_session_close_message_record.sub_market_center_id; at = at + 1;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> wire[at] = market_session_close_message_record.sip_timestamp[market_session_close_message_at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> wire[at] = market_session_close_message_record.timestamp_1[market_session_close_message_at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> wire[at] = market_session_close_message_record.participant_token[market_session_close_message_at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Session Close Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_session_close_message(market_session_close_message_record) {
  market_session_close_message_record.market_center_originator = wire[at]; at = at + 1;
  market_session_close_message_record.sub_market_center_id = wire[at]; at = at + 1;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.sip_timestamp[market_session_close_message_at] = wire[at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.timestamp_1[market_session_close_message_at] = wire[at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.participant_token[market_session_close_message_at] = wire[at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Session Close Message is what was written, byte for byte */
inline equal_market_session_close_message(market_session_close_message_read, market_session_close_message_written) {
  assert(market_session_close_message_read.market_center_originator == market_session_close_message_written.market_center_originator);
  assert(market_session_close_message_read.sub_market_center_id == market_session_close_message_written.sub_market_center_id);
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> assert(market_session_close_message_read.sip_timestamp[market_session_close_message_at] == market_session_close_message_written.sip_timestamp[market_session_close_message_at]); market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> assert(market_session_close_message_read.timestamp_1[market_session_close_message_at] == market_session_close_message_written.timestamp_1[market_session_close_message_at]); market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> assert(market_session_close_message_read.participant_token[market_session_close_message_at] == market_session_close_message_written.participant_token[market_session_close_message_at]); market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Transmissions Message: 26 bytes ---------------------------------- */

/* Signals that there will be no further transmissions for the day */
typedef EndOfTransmissionsMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int end_of_transmissions_message_at;

/* every byte of End Of Transmissions Message set to one value */
inline fill_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_value) {
  end_of_transmissions_message_record.market_center_originator = end_of_transmissions_message_value;
  end_of_transmissions_message_record.sub_market_center_id = end_of_transmissions_message_value;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.sip_timestamp[end_of_transmissions_message_at] = end_of_transmissions_message_value; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.timestamp_1[end_of_transmissions_message_at] = end_of_transmissions_message_value; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.participant_token[end_of_transmissions_message_at] = end_of_transmissions_message_value; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Transmissions Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_base) {
  end_of_transmissions_message_record.market_center_originator = (end_of_transmissions_message_base + 0 + 1) % 256;
  end_of_transmissions_message_record.sub_market_center_id = (end_of_transmissions_message_base + 1 + 1) % 256;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.sip_timestamp[end_of_transmissions_message_at] = (end_of_transmissions_message_base + 2 + end_of_transmissions_message_at + 1) % 256; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.timestamp_1[end_of_transmissions_message_at] = (end_of_transmissions_message_base + 10 + end_of_transmissions_message_at + 1) % 256; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.participant_token[end_of_transmissions_message_at] = (end_of_transmissions_message_base + 18 + end_of_transmissions_message_at + 1) % 256; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Transmissions Message to the wire, 26 bytes from where the cursor stands */
inline encode_end_of_transmissions_message(end_of_transmissions_message_record) {
  wire[at] = end_of_transmissions_message_record.market_center_originator; at = at + 1;
  wire[at] = end_of_transmissions_message_record.sub_market_center_id; at = at + 1;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> wire[at] = end_of_transmissions_message_record.sip_timestamp[end_of_transmissions_message_at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> wire[at] = end_of_transmissions_message_record.timestamp_1[end_of_transmissions_message_at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> wire[at] = end_of_transmissions_message_record.participant_token[end_of_transmissions_message_at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Transmissions Message off the wire, 26 bytes from where the cursor stands */
inline decode_end_of_transmissions_message(end_of_transmissions_message_record) {
  end_of_transmissions_message_record.market_center_originator = wire[at]; at = at + 1;
  end_of_transmissions_message_record.sub_market_center_id = wire[at]; at = at + 1;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.sip_timestamp[end_of_transmissions_message_at] = wire[at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.timestamp_1[end_of_transmissions_message_at] = wire[at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.participant_token[end_of_transmissions_message_at] = wire[at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Transmissions Message is what was written, byte for byte */
inline equal_end_of_transmissions_message(end_of_transmissions_message_read, end_of_transmissions_message_written) {
  assert(end_of_transmissions_message_read.market_center_originator == end_of_transmissions_message_written.market_center_originator);
  assert(end_of_transmissions_message_read.sub_market_center_id == end_of_transmissions_message_written.sub_market_center_id);
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> assert(end_of_transmissions_message_read.sip_timestamp[end_of_transmissions_message_at] == end_of_transmissions_message_written.sip_timestamp[end_of_transmissions_message_at]); end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> assert(end_of_transmissions_message_read.timestamp_1[end_of_transmissions_message_at] == end_of_transmissions_message_written.timestamp_1[end_of_transmissions_message_at]); end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> assert(end_of_transmissions_message_read.participant_token[end_of_transmissions_message_at] == end_of_transmissions_message_written.participant_token[end_of_transmissions_message_at]); end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Trade Reporting Message: 26 bytes -------------------------------- */

/* Signals that SIP has completed its trade entry eligibility and no further trade data will be accepted for the market session */
typedef EndOfTradeReportingMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int end_of_trade_reporting_message_at;

/* every byte of End Of Trade Reporting Message set to one value */
inline fill_end_of_trade_reporting_message(end_of_trade_reporting_message_record, end_of_trade_reporting_message_value) {
  end_of_trade_reporting_message_record.market_center_originator = end_of_trade_reporting_message_value;
  end_of_trade_reporting_message_record.sub_market_center_id = end_of_trade_reporting_message_value;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> end_of_trade_reporting_message_record.sip_timestamp[end_of_trade_reporting_message_at] = end_of_trade_reporting_message_value; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> end_of_trade_reporting_message_record.timestamp_1[end_of_trade_reporting_message_at] = end_of_trade_reporting_message_value; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> end_of_trade_reporting_message_record.participant_token[end_of_trade_reporting_message_at] = end_of_trade_reporting_message_value; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Trade Reporting Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_trade_reporting_message(end_of_trade_reporting_message_record, end_of_trade_reporting_message_base) {
  end_of_trade_reporting_message_record.market_center_originator = (end_of_trade_reporting_message_base + 0 + 1) % 256;
  end_of_trade_reporting_message_record.sub_market_center_id = (end_of_trade_reporting_message_base + 1 + 1) % 256;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> end_of_trade_reporting_message_record.sip_timestamp[end_of_trade_reporting_message_at] = (end_of_trade_reporting_message_base + 2 + end_of_trade_reporting_message_at + 1) % 256; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> end_of_trade_reporting_message_record.timestamp_1[end_of_trade_reporting_message_at] = (end_of_trade_reporting_message_base + 10 + end_of_trade_reporting_message_at + 1) % 256; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> end_of_trade_reporting_message_record.participant_token[end_of_trade_reporting_message_at] = (end_of_trade_reporting_message_base + 18 + end_of_trade_reporting_message_at + 1) % 256; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Trade Reporting Message to the wire, 26 bytes from where the cursor stands */
inline encode_end_of_trade_reporting_message(end_of_trade_reporting_message_record) {
  wire[at] = end_of_trade_reporting_message_record.market_center_originator; at = at + 1;
  wire[at] = end_of_trade_reporting_message_record.sub_market_center_id; at = at + 1;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> wire[at] = end_of_trade_reporting_message_record.sip_timestamp[end_of_trade_reporting_message_at]; at = at + 1; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> wire[at] = end_of_trade_reporting_message_record.timestamp_1[end_of_trade_reporting_message_at]; at = at + 1; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> wire[at] = end_of_trade_reporting_message_record.participant_token[end_of_trade_reporting_message_at]; at = at + 1; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Trade Reporting Message off the wire, 26 bytes from where the cursor stands */
inline decode_end_of_trade_reporting_message(end_of_trade_reporting_message_record) {
  end_of_trade_reporting_message_record.market_center_originator = wire[at]; at = at + 1;
  end_of_trade_reporting_message_record.sub_market_center_id = wire[at]; at = at + 1;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> end_of_trade_reporting_message_record.sip_timestamp[end_of_trade_reporting_message_at] = wire[at]; at = at + 1; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> end_of_trade_reporting_message_record.timestamp_1[end_of_trade_reporting_message_at] = wire[at]; at = at + 1; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> end_of_trade_reporting_message_record.participant_token[end_of_trade_reporting_message_at] = wire[at]; at = at + 1; end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Trade Reporting Message is what was written, byte for byte */
inline equal_end_of_trade_reporting_message(end_of_trade_reporting_message_read, end_of_trade_reporting_message_written) {
  assert(end_of_trade_reporting_message_read.market_center_originator == end_of_trade_reporting_message_written.market_center_originator);
  assert(end_of_trade_reporting_message_read.sub_market_center_id == end_of_trade_reporting_message_written.sub_market_center_id);
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> assert(end_of_trade_reporting_message_read.sip_timestamp[end_of_trade_reporting_message_at] == end_of_trade_reporting_message_written.sip_timestamp[end_of_trade_reporting_message_at]); end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> assert(end_of_trade_reporting_message_read.timestamp_1[end_of_trade_reporting_message_at] == end_of_trade_reporting_message_written.timestamp_1[end_of_trade_reporting_message_at]); end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  end_of_trade_reporting_message_at = 0;
  do
  :: end_of_trade_reporting_message_at < 8 -> assert(end_of_trade_reporting_message_read.participant_token[end_of_trade_reporting_message_at] == end_of_trade_reporting_message_written.participant_token[end_of_trade_reporting_message_at]); end_of_trade_reporting_message_at = end_of_trade_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Consolidated Last Sale Eligibility Message: 26 bytes ------------- */

/* Signals the closing of the trade-reporting window for consolidated last sale calculation eligibility. Generated 10 seconds after the market close message from the primary market */
typedef EndOfConsolidatedLastSaleEligibilityMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int end_of_consolidated_last_sale_eligibility_message_at;

/* every byte of End Of Consolidated Last Sale Eligibility Message set to one value */
inline fill_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_record, end_of_consolidated_last_sale_eligibility_message_value) {
  end_of_consolidated_last_sale_eligibility_message_record.market_center_originator = end_of_consolidated_last_sale_eligibility_message_value;
  end_of_consolidated_last_sale_eligibility_message_record.sub_market_center_id = end_of_consolidated_last_sale_eligibility_message_value;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> end_of_consolidated_last_sale_eligibility_message_record.sip_timestamp[end_of_consolidated_last_sale_eligibility_message_at] = end_of_consolidated_last_sale_eligibility_message_value; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> end_of_consolidated_last_sale_eligibility_message_record.timestamp_1[end_of_consolidated_last_sale_eligibility_message_at] = end_of_consolidated_last_sale_eligibility_message_value; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> end_of_consolidated_last_sale_eligibility_message_record.participant_token[end_of_consolidated_last_sale_eligibility_message_at] = end_of_consolidated_last_sale_eligibility_message_value; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Consolidated Last Sale Eligibility Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_record, end_of_consolidated_last_sale_eligibility_message_base) {
  end_of_consolidated_last_sale_eligibility_message_record.market_center_originator = (end_of_consolidated_last_sale_eligibility_message_base + 0 + 1) % 256;
  end_of_consolidated_last_sale_eligibility_message_record.sub_market_center_id = (end_of_consolidated_last_sale_eligibility_message_base + 1 + 1) % 256;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> end_of_consolidated_last_sale_eligibility_message_record.sip_timestamp[end_of_consolidated_last_sale_eligibility_message_at] = (end_of_consolidated_last_sale_eligibility_message_base + 2 + end_of_consolidated_last_sale_eligibility_message_at + 1) % 256; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> end_of_consolidated_last_sale_eligibility_message_record.timestamp_1[end_of_consolidated_last_sale_eligibility_message_at] = (end_of_consolidated_last_sale_eligibility_message_base + 10 + end_of_consolidated_last_sale_eligibility_message_at + 1) % 256; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> end_of_consolidated_last_sale_eligibility_message_record.participant_token[end_of_consolidated_last_sale_eligibility_message_at] = (end_of_consolidated_last_sale_eligibility_message_base + 18 + end_of_consolidated_last_sale_eligibility_message_at + 1) % 256; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Consolidated Last Sale Eligibility Message to the wire, 26 bytes from where the cursor stands */
inline encode_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_record) {
  wire[at] = end_of_consolidated_last_sale_eligibility_message_record.market_center_originator; at = at + 1;
  wire[at] = end_of_consolidated_last_sale_eligibility_message_record.sub_market_center_id; at = at + 1;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> wire[at] = end_of_consolidated_last_sale_eligibility_message_record.sip_timestamp[end_of_consolidated_last_sale_eligibility_message_at]; at = at + 1; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> wire[at] = end_of_consolidated_last_sale_eligibility_message_record.timestamp_1[end_of_consolidated_last_sale_eligibility_message_at]; at = at + 1; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> wire[at] = end_of_consolidated_last_sale_eligibility_message_record.participant_token[end_of_consolidated_last_sale_eligibility_message_at]; at = at + 1; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Consolidated Last Sale Eligibility Message off the wire, 26 bytes from where the cursor stands */
inline decode_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_record) {
  end_of_consolidated_last_sale_eligibility_message_record.market_center_originator = wire[at]; at = at + 1;
  end_of_consolidated_last_sale_eligibility_message_record.sub_market_center_id = wire[at]; at = at + 1;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> end_of_consolidated_last_sale_eligibility_message_record.sip_timestamp[end_of_consolidated_last_sale_eligibility_message_at] = wire[at]; at = at + 1; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> end_of_consolidated_last_sale_eligibility_message_record.timestamp_1[end_of_consolidated_last_sale_eligibility_message_at] = wire[at]; at = at + 1; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> end_of_consolidated_last_sale_eligibility_message_record.participant_token[end_of_consolidated_last_sale_eligibility_message_at] = wire[at]; at = at + 1; end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Consolidated Last Sale Eligibility Message is what was written, byte for byte */
inline equal_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_read, end_of_consolidated_last_sale_eligibility_message_written) {
  assert(end_of_consolidated_last_sale_eligibility_message_read.market_center_originator == end_of_consolidated_last_sale_eligibility_message_written.market_center_originator);
  assert(end_of_consolidated_last_sale_eligibility_message_read.sub_market_center_id == end_of_consolidated_last_sale_eligibility_message_written.sub_market_center_id);
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> assert(end_of_consolidated_last_sale_eligibility_message_read.sip_timestamp[end_of_consolidated_last_sale_eligibility_message_at] == end_of_consolidated_last_sale_eligibility_message_written.sip_timestamp[end_of_consolidated_last_sale_eligibility_message_at]); end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> assert(end_of_consolidated_last_sale_eligibility_message_read.timestamp_1[end_of_consolidated_last_sale_eligibility_message_at] == end_of_consolidated_last_sale_eligibility_message_written.timestamp_1[end_of_consolidated_last_sale_eligibility_message_at]); end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
  :: else -> break
  od;
  end_of_consolidated_last_sale_eligibility_message_at = 0;
  do
  :: end_of_consolidated_last_sale_eligibility_message_at < 8 -> assert(end_of_consolidated_last_sale_eligibility_message_read.participant_token[end_of_consolidated_last_sale_eligibility_message_at] == end_of_consolidated_last_sale_eligibility_message_written.participant_token[end_of_consolidated_last_sale_eligibility_message_at]); end_of_consolidated_last_sale_eligibility_message_at = end_of_consolidated_last_sale_eligibility_message_at + 1
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

/* Trade Report Message Short Form Message: encoded, read back, and compared */
proctype check_trade_report_message_short_form_message() {
  TradeReportMessageShortFormMessage trade_report_message_short_form_message_sent;
  TradeReportMessageShortFormMessage trade_report_message_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_message_short_form_message(trade_report_message_short_form_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_message_short_form_message(trade_report_message_short_form_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_message_short_form_message(trade_report_message_short_form_message_sent, 255)
  :: else -> ramp_trade_report_message_short_form_message(trade_report_message_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_message_short_form_message(trade_report_message_short_form_message_sent);
    assert(at == 58);
    at = 0;
    decode_trade_report_message_short_form_message(trade_report_message_short_form_message_got);
    assert(at == 58);
    equal_trade_report_message_short_form_message(trade_report_message_short_form_message_got, trade_report_message_short_form_message_sent)
  }
}

/* Trade Report Message Long Form Message: encoded, read back, and compared */
proctype check_trade_report_message_long_form_message() {
  TradeReportMessageLongFormMessage trade_report_message_long_form_message_sent;
  TradeReportMessageLongFormMessage trade_report_message_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_message_long_form_message(trade_report_message_long_form_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_message_long_form_message(trade_report_message_long_form_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_message_long_form_message(trade_report_message_long_form_message_sent, 255)
  :: else -> ramp_trade_report_message_long_form_message(trade_report_message_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_message_long_form_message(trade_report_message_long_form_message_sent);
    assert(at == 74);
    at = 0;
    decode_trade_report_message_long_form_message(trade_report_message_long_form_message_got);
    assert(at == 74);
    equal_trade_report_message_long_form_message(trade_report_message_long_form_message_got, trade_report_message_long_form_message_sent)
  }
}

/* Trade Cancel Error Message: encoded, read back, and compared */
proctype check_trade_cancel_error_message() {
  TradeCancelErrorMessage trade_cancel_error_message_sent;
  TradeCancelErrorMessage trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 255)
  :: else -> ramp_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_error_message(trade_cancel_error_message_sent);
    assert(at == 139);
    at = 0;
    decode_trade_cancel_error_message(trade_cancel_error_message_got);
    assert(at == 139);
    equal_trade_cancel_error_message(trade_cancel_error_message_got, trade_cancel_error_message_sent)
  }
}

/* Trade Correction Message: encoded, read back, and compared */
proctype check_trade_correction_message() {
  TradeCorrectionMessage trade_correction_message_sent;
  TradeCorrectionMessage trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correction_message(trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_trade_correction_message(trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_trade_correction_message(trade_correction_message_sent, 255)
  :: else -> ramp_trade_correction_message(trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correction_message(trade_correction_message_sent);
    assert(at == 165);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 165);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Prior Day As Of Trade Message: encoded, read back, and compared */
proctype check_prior_day_as_of_trade_message() {
  PriorDayAsOfTradeMessage prior_day_as_of_trade_message_sent;
  PriorDayAsOfTradeMessage prior_day_as_of_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prior_day_as_of_trade_message(prior_day_as_of_trade_message_sent, 0)
  :: pattern == 1 -> fill_prior_day_as_of_trade_message(prior_day_as_of_trade_message_sent, 32)
  :: pattern == 2 -> fill_prior_day_as_of_trade_message(prior_day_as_of_trade_message_sent, 255)
  :: else -> ramp_prior_day_as_of_trade_message(prior_day_as_of_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prior_day_as_of_trade_message(prior_day_as_of_trade_message_sent);
    assert(at == 81);
    at = 0;
    decode_prior_day_as_of_trade_message(prior_day_as_of_trade_message_got);
    assert(at == 81);
    equal_prior_day_as_of_trade_message(prior_day_as_of_trade_message_got, prior_day_as_of_trade_message_sent)
  }
}

/* Fractional Trade Report Message Short Form Message: encoded, read back, and compared */
proctype check_fractional_trade_report_message_short_form_message() {
  FractionalTradeReportMessageShortFormMessage fractional_trade_report_message_short_form_message_sent;
  FractionalTradeReportMessageShortFormMessage fractional_trade_report_message_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_sent, 0)
  :: pattern == 1 -> fill_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_sent, 32)
  :: pattern == 2 -> fill_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_sent, 255)
  :: else -> ramp_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_sent);
    assert(at == 64);
    at = 0;
    decode_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_got);
    assert(at == 64);
    equal_fractional_trade_report_message_short_form_message(fractional_trade_report_message_short_form_message_got, fractional_trade_report_message_short_form_message_sent)
  }
}

/* Fractional Trade Report Message Long Form Message: encoded, read back, and compared */
proctype check_fractional_trade_report_message_long_form_message() {
  FractionalTradeReportMessageLongFormMessage fractional_trade_report_message_long_form_message_sent;
  FractionalTradeReportMessageLongFormMessage fractional_trade_report_message_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_sent, 0)
  :: pattern == 1 -> fill_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_sent, 32)
  :: pattern == 2 -> fill_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_sent, 255)
  :: else -> ramp_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_sent);
    assert(at == 78);
    at = 0;
    decode_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_got);
    assert(at == 78);
    equal_fractional_trade_report_message_long_form_message(fractional_trade_report_message_long_form_message_got, fractional_trade_report_message_long_form_message_sent)
  }
}

/* Fractional Trade Cancel Error Message: encoded, read back, and compared */
proctype check_fractional_trade_cancel_error_message() {
  FractionalTradeCancelErrorMessage fractional_trade_cancel_error_message_sent;
  FractionalTradeCancelErrorMessage fractional_trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 255)
  :: else -> ramp_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent);
    assert(at == 143);
    at = 0;
    decode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_got);
    assert(at == 143);
    equal_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_got, fractional_trade_cancel_error_message_sent)
  }
}

/* Fractional Trade Correction Message: encoded, read back, and compared */
proctype check_fractional_trade_correction_message() {
  FractionalTradeCorrectionMessage fractional_trade_correction_message_sent;
  FractionalTradeCorrectionMessage fractional_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_trade_correction_message(fractional_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_fractional_trade_correction_message(fractional_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_fractional_trade_correction_message(fractional_trade_correction_message_sent, 255)
  :: else -> ramp_fractional_trade_correction_message(fractional_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_trade_correction_message(fractional_trade_correction_message_sent);
    assert(at == 173);
    at = 0;
    decode_fractional_trade_correction_message(fractional_trade_correction_message_got);
    assert(at == 173);
    equal_fractional_trade_correction_message(fractional_trade_correction_message_got, fractional_trade_correction_message_sent)
  }
}

/* Fractional As Of Trade Message: encoded, read back, and compared */
proctype check_fractional_as_of_trade_message() {
  FractionalAsOfTradeMessage fractional_as_of_trade_message_sent;
  FractionalAsOfTradeMessage fractional_as_of_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_as_of_trade_message(fractional_as_of_trade_message_sent, 0)
  :: pattern == 1 -> fill_fractional_as_of_trade_message(fractional_as_of_trade_message_sent, 32)
  :: pattern == 2 -> fill_fractional_as_of_trade_message(fractional_as_of_trade_message_sent, 255)
  :: else -> ramp_fractional_as_of_trade_message(fractional_as_of_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_as_of_trade_message(fractional_as_of_trade_message_sent);
    assert(at == 85);
    at = 0;
    decode_fractional_as_of_trade_message(fractional_as_of_trade_message_got);
    assert(at == 85);
    equal_fractional_as_of_trade_message(fractional_as_of_trade_message_got, fractional_as_of_trade_message_sent)
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

/* Reg Sho Short Sale Price Test Restricted Indicator Message: encoded, read back, and compared */
proctype check_reg_sho_short_sale_price_test_restricted_indicator_message() {
  RegShoShortSalePriceTestRestrictedIndicatorMessage reg_sho_short_sale_price_test_restricted_indicator_message_sent;
  RegShoShortSalePriceTestRestrictedIndicatorMessage reg_sho_short_sale_price_test_restricted_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  :: pattern == 1 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 32)
  :: pattern == 2 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 255)
  :: else -> ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent);
    assert(at == 38);
    at = 0;
    decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got);
    assert(at == 38);
    equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got, reg_sho_short_sale_price_test_restricted_indicator_message_sent)
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

/* End Of Trade Reporting Message: encoded, read back, and compared */
proctype check_end_of_trade_reporting_message() {
  EndOfTradeReportingMessage end_of_trade_reporting_message_sent;
  EndOfTradeReportingMessage end_of_trade_reporting_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_trade_reporting_message(end_of_trade_reporting_message_sent, 0)
  :: pattern == 1 -> fill_end_of_trade_reporting_message(end_of_trade_reporting_message_sent, 32)
  :: pattern == 2 -> fill_end_of_trade_reporting_message(end_of_trade_reporting_message_sent, 255)
  :: else -> ramp_end_of_trade_reporting_message(end_of_trade_reporting_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_trade_reporting_message(end_of_trade_reporting_message_sent);
    assert(at == 26);
    at = 0;
    decode_end_of_trade_reporting_message(end_of_trade_reporting_message_got);
    assert(at == 26);
    equal_end_of_trade_reporting_message(end_of_trade_reporting_message_got, end_of_trade_reporting_message_sent)
  }
}

/* End Of Consolidated Last Sale Eligibility Message: encoded, read back, and compared */
proctype check_end_of_consolidated_last_sale_eligibility_message() {
  EndOfConsolidatedLastSaleEligibilityMessage end_of_consolidated_last_sale_eligibility_message_sent;
  EndOfConsolidatedLastSaleEligibilityMessage end_of_consolidated_last_sale_eligibility_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_sent, 0)
  :: pattern == 1 -> fill_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_sent, 32)
  :: pattern == 2 -> fill_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_sent, 255)
  :: else -> ramp_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_sent);
    assert(at == 26);
    at = 0;
    decode_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_got);
    assert(at == 26);
    equal_end_of_consolidated_last_sale_eligibility_message(end_of_consolidated_last_sale_eligibility_message_got, end_of_consolidated_last_sale_eligibility_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_trade_report_message_short_form_message()
  :: run check_trade_report_message_long_form_message()
  :: run check_trade_cancel_error_message()
  :: run check_trade_correction_message()
  :: run check_prior_day_as_of_trade_message()
  :: run check_fractional_trade_report_message_short_form_message()
  :: run check_fractional_trade_report_message_long_form_message()
  :: run check_fractional_trade_cancel_error_message()
  :: run check_fractional_trade_correction_message()
  :: run check_fractional_as_of_trade_message()
  :: run check_cross_sro_trading_action_message()
  :: run check_market_center_trading_action_message()
  :: run check_issue_symbol_directory_message()
  :: run check_reg_sho_short_sale_price_test_restricted_indicator_message()
  :: run check_limit_up_limit_down_price_band_message()
  :: run check_market_wide_circuit_breaker_decline_level_message()
  :: run check_market_wide_circuit_breaker_status_message()
  :: run check_auction_collar_message()
  :: run check_start_of_day_message()
  :: run check_end_of_day_message()
  :: run check_market_session_open_message()
  :: run check_market_session_close_message()
  :: run check_end_of_transmissions_message()
  :: run check_end_of_trade_reporting_message()
  :: run check_end_of_consolidated_last_sale_eligibility_message()
  fi
}
