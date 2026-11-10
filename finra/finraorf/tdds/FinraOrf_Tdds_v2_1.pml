/*
 * Financial Industry Regulatory Authority Trade Data Dissemination Service
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
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 216

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

typedef PacketHeader {
  byte session[10];
  byte sequence[8];
  byte count[2]
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
  :: packet_header_at < 8 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.count[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 8 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.count[packet_header_at] = (packet_header_base + 18 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 8 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.count[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 8 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.count[packet_header_at] == packet_header_written.count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mold Udp64: 3 bytes ----------------------------------------------------- */

/* Mold Udp64 Dfi Message Header */
typedef MoldUdp64 {
  byte length[2];
  byte message_category
};

int mold_udp64_at;

/* every byte of Mold Udp64 set to one value */
inline fill_mold_udp64(mold_udp64_record, mold_udp64_value) {
  mold_udp64_at = 0;
  do
  :: mold_udp64_at < 2 -> mold_udp64_record.length[mold_udp64_at] = mold_udp64_value; mold_udp64_at = mold_udp64_at + 1
  :: else -> break
  od;
  mold_udp64_record.message_category = mold_udp64_value;
  skip
}

/* each byte of Mold Udp64 set to where it lies, so a field read out of place says so */
inline ramp_mold_udp64(mold_udp64_record, mold_udp64_base) {
  mold_udp64_at = 0;
  do
  :: mold_udp64_at < 2 -> mold_udp64_record.length[mold_udp64_at] = (mold_udp64_base + 0 + mold_udp64_at + 1) % 256; mold_udp64_at = mold_udp64_at + 1
  :: else -> break
  od;
  mold_udp64_record.message_category = (mold_udp64_base + 2 + 1) % 256;
  skip
}

/* Mold Udp64 to the wire, 3 bytes from where the cursor stands */
inline encode_mold_udp64(mold_udp64_record) {
  mold_udp64_at = 0;
  do
  :: mold_udp64_at < 2 -> wire[at] = mold_udp64_record.length[mold_udp64_at]; at = at + 1; mold_udp64_at = mold_udp64_at + 1
  :: else -> break
  od;
  wire[at] = mold_udp64_record.message_category; at = at + 1;
  skip
}

/* Mold Udp64 off the wire, 3 bytes from where the cursor stands */
inline decode_mold_udp64(mold_udp64_record) {
  mold_udp64_at = 0;
  do
  :: mold_udp64_at < 2 -> mold_udp64_record.length[mold_udp64_at] = wire[at]; at = at + 1; mold_udp64_at = mold_udp64_at + 1
  :: else -> break
  od;
  mold_udp64_record.message_category = wire[at]; at = at + 1;
  skip
}

/* what was read of Mold Udp64 is what was written, byte for byte */
inline equal_mold_udp64(mold_udp64_read, mold_udp64_written) {
  mold_udp64_at = 0;
  do
  :: mold_udp64_at < 2 -> assert(mold_udp64_read.length[mold_udp64_at] == mold_udp64_written.length[mold_udp64_at]); mold_udp64_at = mold_udp64_at + 1
  :: else -> break
  od;
  assert(mold_udp64_read.message_category == mold_udp64_written.message_category);
  skip
}

/* ---- Datetime: 23 bytes ------------------------------------------------------ */

/* Datetime */
typedef Datetime {
  byte year[4];
  byte month[2];
  byte day[2];
  byte hour[2];
  byte minute[2];
  byte second[2];
  byte fractional_second[9]
};

int datetime_at;

/* every byte of Datetime set to one value */
inline fill_datetime(datetime_record, datetime_value) {
  datetime_at = 0;
  do
  :: datetime_at < 4 -> datetime_record.year[datetime_at] = datetime_value; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.month[datetime_at] = datetime_value; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.day[datetime_at] = datetime_value; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.hour[datetime_at] = datetime_value; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.minute[datetime_at] = datetime_value; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.second[datetime_at] = datetime_value; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 9 -> datetime_record.fractional_second[datetime_at] = datetime_value; datetime_at = datetime_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Datetime set to where it lies, so a field read out of place says so */
inline ramp_datetime(datetime_record, datetime_base) {
  datetime_at = 0;
  do
  :: datetime_at < 4 -> datetime_record.year[datetime_at] = (datetime_base + 0 + datetime_at + 1) % 256; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.month[datetime_at] = (datetime_base + 4 + datetime_at + 1) % 256; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.day[datetime_at] = (datetime_base + 6 + datetime_at + 1) % 256; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.hour[datetime_at] = (datetime_base + 8 + datetime_at + 1) % 256; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.minute[datetime_at] = (datetime_base + 10 + datetime_at + 1) % 256; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.second[datetime_at] = (datetime_base + 12 + datetime_at + 1) % 256; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 9 -> datetime_record.fractional_second[datetime_at] = (datetime_base + 14 + datetime_at + 1) % 256; datetime_at = datetime_at + 1
  :: else -> break
  od;
  skip
}

/* Datetime to the wire, 23 bytes from where the cursor stands */
inline encode_datetime(datetime_record) {
  datetime_at = 0;
  do
  :: datetime_at < 4 -> wire[at] = datetime_record.year[datetime_at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> wire[at] = datetime_record.month[datetime_at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> wire[at] = datetime_record.day[datetime_at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> wire[at] = datetime_record.hour[datetime_at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> wire[at] = datetime_record.minute[datetime_at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> wire[at] = datetime_record.second[datetime_at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 9 -> wire[at] = datetime_record.fractional_second[datetime_at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  skip
}

/* Datetime off the wire, 23 bytes from where the cursor stands */
inline decode_datetime(datetime_record) {
  datetime_at = 0;
  do
  :: datetime_at < 4 -> datetime_record.year[datetime_at] = wire[at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.month[datetime_at] = wire[at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.day[datetime_at] = wire[at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.hour[datetime_at] = wire[at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.minute[datetime_at] = wire[at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.second[datetime_at] = wire[at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 9 -> datetime_record.fractional_second[datetime_at] = wire[at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Datetime is what was written, byte for byte */
inline equal_datetime(datetime_read, datetime_written) {
  datetime_at = 0;
  do
  :: datetime_at < 4 -> assert(datetime_read.year[datetime_at] == datetime_written.year[datetime_at]); datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> assert(datetime_read.month[datetime_at] == datetime_written.month[datetime_at]); datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> assert(datetime_read.day[datetime_at] == datetime_written.day[datetime_at]); datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> assert(datetime_read.hour[datetime_at] == datetime_written.hour[datetime_at]); datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> assert(datetime_read.minute[datetime_at] == datetime_written.minute[datetime_at]); datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 2 -> assert(datetime_read.second[datetime_at] == datetime_written.second[datetime_at]); datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_at = 0;
  do
  :: datetime_at < 9 -> assert(datetime_read.fractional_second[datetime_at] == datetime_written.fractional_second[datetime_at]); datetime_at = datetime_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 33 bytes ------------------------------------------------ */

/* Message Header */
typedef MessageHeader {
  byte trade_identifier[8];
  byte market_center_originator_id[2];
  Datetime datetime
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.trade_identifier[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.market_center_originator_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  fill_datetime(message_header_record.datetime, message_header_value);
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.trade_identifier[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.market_center_originator_id[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  ramp_datetime(message_header_record.datetime, message_header_base + 10);
  skip
}

/* Message Header to the wire, 33 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.trade_identifier[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.market_center_originator_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  encode_datetime(message_header_record.datetime);
  skip
}

/* Message Header off the wire, 33 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.trade_identifier[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.market_center_originator_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  decode_datetime(message_header_record.datetime);
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.trade_identifier[message_header_at] == message_header_written.trade_identifier[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.market_center_originator_id[message_header_at] == message_header_written.market_center_originator_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  equal_datetime(message_header_read.datetime, message_header_written.datetime);
  skip
}

/* ---- Trade Report Short Form Message: 53 bytes ------------------------------- */

/* Economized trade report */
typedef TradeReportShortFormMessage {
  MessageHeader message_header;
  byte security_symbol_short[5];
  byte sale_condition_level_1;
  byte trade_price_denominator;
  byte trade_price_short[6];
  byte report_volume_short[6];
  byte price_change_indicator
};

int trade_report_short_form_message_at;

/* every byte of Trade Report Short Form Message set to one value */
inline fill_trade_report_short_form_message(trade_report_short_form_message_record, trade_report_short_form_message_value) {
  fill_message_header(trade_report_short_form_message_record.message_header, trade_report_short_form_message_value);
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 5 -> trade_report_short_form_message_record.security_symbol_short[trade_report_short_form_message_at] = trade_report_short_form_message_value; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_record.sale_condition_level_1 = trade_report_short_form_message_value;
  trade_report_short_form_message_record.trade_price_denominator = trade_report_short_form_message_value;
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> trade_report_short_form_message_record.trade_price_short[trade_report_short_form_message_at] = trade_report_short_form_message_value; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> trade_report_short_form_message_record.report_volume_short[trade_report_short_form_message_at] = trade_report_short_form_message_value; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_record.price_change_indicator = trade_report_short_form_message_value;
  skip
}

/* each byte of Trade Report Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_short_form_message(trade_report_short_form_message_record, trade_report_short_form_message_base) {
  ramp_message_header(trade_report_short_form_message_record.message_header, trade_report_short_form_message_base + 0);
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 5 -> trade_report_short_form_message_record.security_symbol_short[trade_report_short_form_message_at] = (trade_report_short_form_message_base + 33 + trade_report_short_form_message_at + 1) % 256; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_record.sale_condition_level_1 = (trade_report_short_form_message_base + 38 + 1) % 256;
  trade_report_short_form_message_record.trade_price_denominator = (trade_report_short_form_message_base + 39 + 1) % 256;
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> trade_report_short_form_message_record.trade_price_short[trade_report_short_form_message_at] = (trade_report_short_form_message_base + 40 + trade_report_short_form_message_at + 1) % 256; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> trade_report_short_form_message_record.report_volume_short[trade_report_short_form_message_at] = (trade_report_short_form_message_base + 46 + trade_report_short_form_message_at + 1) % 256; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_record.price_change_indicator = (trade_report_short_form_message_base + 52 + 1) % 256;
  skip
}

/* Trade Report Short Form Message to the wire, 53 bytes from where the cursor stands */
inline encode_trade_report_short_form_message(trade_report_short_form_message_record) {
  encode_message_header(trade_report_short_form_message_record.message_header);
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 5 -> wire[at] = trade_report_short_form_message_record.security_symbol_short[trade_report_short_form_message_at]; at = at + 1; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_short_form_message_record.sale_condition_level_1; at = at + 1;
  wire[at] = trade_report_short_form_message_record.trade_price_denominator; at = at + 1;
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> wire[at] = trade_report_short_form_message_record.trade_price_short[trade_report_short_form_message_at]; at = at + 1; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> wire[at] = trade_report_short_form_message_record.report_volume_short[trade_report_short_form_message_at]; at = at + 1; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_short_form_message_record.price_change_indicator; at = at + 1;
  skip
}

/* Trade Report Short Form Message off the wire, 53 bytes from where the cursor stands */
inline decode_trade_report_short_form_message(trade_report_short_form_message_record) {
  decode_message_header(trade_report_short_form_message_record.message_header);
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 5 -> trade_report_short_form_message_record.security_symbol_short[trade_report_short_form_message_at] = wire[at]; at = at + 1; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_record.sale_condition_level_1 = wire[at]; at = at + 1;
  trade_report_short_form_message_record.trade_price_denominator = wire[at]; at = at + 1;
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> trade_report_short_form_message_record.trade_price_short[trade_report_short_form_message_at] = wire[at]; at = at + 1; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> trade_report_short_form_message_record.report_volume_short[trade_report_short_form_message_at] = wire[at]; at = at + 1; trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_record.price_change_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Report Short Form Message is what was written, byte for byte */
inline equal_trade_report_short_form_message(trade_report_short_form_message_read, trade_report_short_form_message_written) {
  equal_message_header(trade_report_short_form_message_read.message_header, trade_report_short_form_message_written.message_header);
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 5 -> assert(trade_report_short_form_message_read.security_symbol_short[trade_report_short_form_message_at] == trade_report_short_form_message_written.security_symbol_short[trade_report_short_form_message_at]); trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  assert(trade_report_short_form_message_read.sale_condition_level_1 == trade_report_short_form_message_written.sale_condition_level_1);
  assert(trade_report_short_form_message_read.trade_price_denominator == trade_report_short_form_message_written.trade_price_denominator);
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> assert(trade_report_short_form_message_read.trade_price_short[trade_report_short_form_message_at] == trade_report_short_form_message_written.trade_price_short[trade_report_short_form_message_at]); trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  trade_report_short_form_message_at = 0;
  do
  :: trade_report_short_form_message_at < 6 -> assert(trade_report_short_form_message_read.report_volume_short[trade_report_short_form_message_at] == trade_report_short_form_message_written.report_volume_short[trade_report_short_form_message_at]); trade_report_short_form_message_at = trade_report_short_form_message_at + 1
  :: else -> break
  od;
  assert(trade_report_short_form_message_read.price_change_indicator == trade_report_short_form_message_written.price_change_indicator);
  skip
}

/* ---- Original Dissemination Date: 8 bytes ------------------------------------ */

/* Original Dissemination Date */
typedef OriginalDisseminationDate {
  byte year[4];
  byte month[2];
  byte day[2]
};

int original_dissemination_date_at;

/* every byte of Original Dissemination Date set to one value */
inline fill_original_dissemination_date(original_dissemination_date_record, original_dissemination_date_value) {
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 4 -> original_dissemination_date_record.year[original_dissemination_date_at] = original_dissemination_date_value; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> original_dissemination_date_record.month[original_dissemination_date_at] = original_dissemination_date_value; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> original_dissemination_date_record.day[original_dissemination_date_at] = original_dissemination_date_value; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Original Dissemination Date set to where it lies, so a field read out of place says so */
inline ramp_original_dissemination_date(original_dissemination_date_record, original_dissemination_date_base) {
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 4 -> original_dissemination_date_record.year[original_dissemination_date_at] = (original_dissemination_date_base + 0 + original_dissemination_date_at + 1) % 256; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> original_dissemination_date_record.month[original_dissemination_date_at] = (original_dissemination_date_base + 4 + original_dissemination_date_at + 1) % 256; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> original_dissemination_date_record.day[original_dissemination_date_at] = (original_dissemination_date_base + 6 + original_dissemination_date_at + 1) % 256; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  skip
}

/* Original Dissemination Date to the wire, 8 bytes from where the cursor stands */
inline encode_original_dissemination_date(original_dissemination_date_record) {
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 4 -> wire[at] = original_dissemination_date_record.year[original_dissemination_date_at]; at = at + 1; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> wire[at] = original_dissemination_date_record.month[original_dissemination_date_at]; at = at + 1; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> wire[at] = original_dissemination_date_record.day[original_dissemination_date_at]; at = at + 1; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  skip
}

/* Original Dissemination Date off the wire, 8 bytes from where the cursor stands */
inline decode_original_dissemination_date(original_dissemination_date_record) {
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 4 -> original_dissemination_date_record.year[original_dissemination_date_at] = wire[at]; at = at + 1; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> original_dissemination_date_record.month[original_dissemination_date_at] = wire[at]; at = at + 1; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> original_dissemination_date_record.day[original_dissemination_date_at] = wire[at]; at = at + 1; original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Original Dissemination Date is what was written, byte for byte */
inline equal_original_dissemination_date(original_dissemination_date_read, original_dissemination_date_written) {
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 4 -> assert(original_dissemination_date_read.year[original_dissemination_date_at] == original_dissemination_date_written.year[original_dissemination_date_at]); original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> assert(original_dissemination_date_read.month[original_dissemination_date_at] == original_dissemination_date_written.month[original_dissemination_date_at]); original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  original_dissemination_date_at = 0;
  do
  :: original_dissemination_date_at < 2 -> assert(original_dissemination_date_read.day[original_dissemination_date_at] == original_dissemination_date_written.day[original_dissemination_date_at]); original_dissemination_date_at = original_dissemination_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Datetime: 23 bytes -------------------------------------------- */

/* Execution Datetime */
typedef ExecutionDatetime {
  byte year[4];
  byte month[2];
  byte day[2];
  byte hour[2];
  byte minute[2];
  byte second[2];
  byte fractional_second[9]
};

int execution_datetime_at;

/* every byte of Execution Datetime set to one value */
inline fill_execution_datetime(execution_datetime_record, execution_datetime_value) {
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 4 -> execution_datetime_record.year[execution_datetime_at] = execution_datetime_value; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.month[execution_datetime_at] = execution_datetime_value; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.day[execution_datetime_at] = execution_datetime_value; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.hour[execution_datetime_at] = execution_datetime_value; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.minute[execution_datetime_at] = execution_datetime_value; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.second[execution_datetime_at] = execution_datetime_value; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 9 -> execution_datetime_record.fractional_second[execution_datetime_at] = execution_datetime_value; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Datetime set to where it lies, so a field read out of place says so */
inline ramp_execution_datetime(execution_datetime_record, execution_datetime_base) {
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 4 -> execution_datetime_record.year[execution_datetime_at] = (execution_datetime_base + 0 + execution_datetime_at + 1) % 256; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.month[execution_datetime_at] = (execution_datetime_base + 4 + execution_datetime_at + 1) % 256; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.day[execution_datetime_at] = (execution_datetime_base + 6 + execution_datetime_at + 1) % 256; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.hour[execution_datetime_at] = (execution_datetime_base + 8 + execution_datetime_at + 1) % 256; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.minute[execution_datetime_at] = (execution_datetime_base + 10 + execution_datetime_at + 1) % 256; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.second[execution_datetime_at] = (execution_datetime_base + 12 + execution_datetime_at + 1) % 256; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 9 -> execution_datetime_record.fractional_second[execution_datetime_at] = (execution_datetime_base + 14 + execution_datetime_at + 1) % 256; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Datetime to the wire, 23 bytes from where the cursor stands */
inline encode_execution_datetime(execution_datetime_record) {
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 4 -> wire[at] = execution_datetime_record.year[execution_datetime_at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> wire[at] = execution_datetime_record.month[execution_datetime_at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> wire[at] = execution_datetime_record.day[execution_datetime_at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> wire[at] = execution_datetime_record.hour[execution_datetime_at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> wire[at] = execution_datetime_record.minute[execution_datetime_at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> wire[at] = execution_datetime_record.second[execution_datetime_at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 9 -> wire[at] = execution_datetime_record.fractional_second[execution_datetime_at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Datetime off the wire, 23 bytes from where the cursor stands */
inline decode_execution_datetime(execution_datetime_record) {
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 4 -> execution_datetime_record.year[execution_datetime_at] = wire[at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.month[execution_datetime_at] = wire[at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.day[execution_datetime_at] = wire[at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.hour[execution_datetime_at] = wire[at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.minute[execution_datetime_at] = wire[at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> execution_datetime_record.second[execution_datetime_at] = wire[at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 9 -> execution_datetime_record.fractional_second[execution_datetime_at] = wire[at]; at = at + 1; execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Datetime is what was written, byte for byte */
inline equal_execution_datetime(execution_datetime_read, execution_datetime_written) {
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 4 -> assert(execution_datetime_read.year[execution_datetime_at] == execution_datetime_written.year[execution_datetime_at]); execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> assert(execution_datetime_read.month[execution_datetime_at] == execution_datetime_written.month[execution_datetime_at]); execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> assert(execution_datetime_read.day[execution_datetime_at] == execution_datetime_written.day[execution_datetime_at]); execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> assert(execution_datetime_read.hour[execution_datetime_at] == execution_datetime_written.hour[execution_datetime_at]); execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> assert(execution_datetime_read.minute[execution_datetime_at] == execution_datetime_written.minute[execution_datetime_at]); execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 2 -> assert(execution_datetime_read.second[execution_datetime_at] == execution_datetime_written.second[execution_datetime_at]); execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  execution_datetime_at = 0;
  do
  :: execution_datetime_at < 9 -> assert(execution_datetime_read.fractional_second[execution_datetime_at] == execution_datetime_written.fractional_second[execution_datetime_at]); execution_datetime_at = execution_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Information: 55 bytes --------------------------------------------- */

/* Trade Information */
typedef TradeInformation {
  byte report_volume[8];
  byte trade_price_denominator;
  byte trade_price[12];
  byte currency[3];
  byte as_of_indicator;
  ExecutionDatetime execution_datetime;
  byte sale_condition_level_1;
  byte sale_condition_level_2;
  byte sale_condition_level_3;
  byte sale_condition_level_4;
  byte sellers_sale_days[2];
  byte price_change_indicator
};

int trade_information_at;

/* every byte of Trade Information set to one value */
inline fill_trade_information(trade_information_record, trade_information_value) {
  trade_information_at = 0;
  do
  :: trade_information_at < 8 -> trade_information_record.report_volume[trade_information_at] = trade_information_value; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.trade_price_denominator = trade_information_value;
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> trade_information_record.trade_price[trade_information_at] = trade_information_value; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 3 -> trade_information_record.currency[trade_information_at] = trade_information_value; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.as_of_indicator = trade_information_value;
  fill_execution_datetime(trade_information_record.execution_datetime, trade_information_value);
  trade_information_record.sale_condition_level_1 = trade_information_value;
  trade_information_record.sale_condition_level_2 = trade_information_value;
  trade_information_record.sale_condition_level_3 = trade_information_value;
  trade_information_record.sale_condition_level_4 = trade_information_value;
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> trade_information_record.sellers_sale_days[trade_information_at] = trade_information_value; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.price_change_indicator = trade_information_value;
  skip
}

/* each byte of Trade Information set to where it lies, so a field read out of place says so */
inline ramp_trade_information(trade_information_record, trade_information_base) {
  trade_information_at = 0;
  do
  :: trade_information_at < 8 -> trade_information_record.report_volume[trade_information_at] = (trade_information_base + 0 + trade_information_at + 1) % 256; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.trade_price_denominator = (trade_information_base + 8 + 1) % 256;
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> trade_information_record.trade_price[trade_information_at] = (trade_information_base + 9 + trade_information_at + 1) % 256; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 3 -> trade_information_record.currency[trade_information_at] = (trade_information_base + 21 + trade_information_at + 1) % 256; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.as_of_indicator = (trade_information_base + 24 + 1) % 256;
  ramp_execution_datetime(trade_information_record.execution_datetime, trade_information_base + 25);
  trade_information_record.sale_condition_level_1 = (trade_information_base + 48 + 1) % 256;
  trade_information_record.sale_condition_level_2 = (trade_information_base + 49 + 1) % 256;
  trade_information_record.sale_condition_level_3 = (trade_information_base + 50 + 1) % 256;
  trade_information_record.sale_condition_level_4 = (trade_information_base + 51 + 1) % 256;
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> trade_information_record.sellers_sale_days[trade_information_at] = (trade_information_base + 52 + trade_information_at + 1) % 256; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.price_change_indicator = (trade_information_base + 54 + 1) % 256;
  skip
}

/* Trade Information to the wire, 55 bytes from where the cursor stands */
inline encode_trade_information(trade_information_record) {
  trade_information_at = 0;
  do
  :: trade_information_at < 8 -> wire[at] = trade_information_record.report_volume[trade_information_at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_information_record.trade_price_denominator; at = at + 1;
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> wire[at] = trade_information_record.trade_price[trade_information_at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 3 -> wire[at] = trade_information_record.currency[trade_information_at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_information_record.as_of_indicator; at = at + 1;
  encode_execution_datetime(trade_information_record.execution_datetime);
  wire[at] = trade_information_record.sale_condition_level_1; at = at + 1;
  wire[at] = trade_information_record.sale_condition_level_2; at = at + 1;
  wire[at] = trade_information_record.sale_condition_level_3; at = at + 1;
  wire[at] = trade_information_record.sale_condition_level_4; at = at + 1;
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> wire[at] = trade_information_record.sellers_sale_days[trade_information_at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_information_record.price_change_indicator; at = at + 1;
  skip
}

/* Trade Information off the wire, 55 bytes from where the cursor stands */
inline decode_trade_information(trade_information_record) {
  trade_information_at = 0;
  do
  :: trade_information_at < 8 -> trade_information_record.report_volume[trade_information_at] = wire[at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.trade_price_denominator = wire[at]; at = at + 1;
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> trade_information_record.trade_price[trade_information_at] = wire[at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 3 -> trade_information_record.currency[trade_information_at] = wire[at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.as_of_indicator = wire[at]; at = at + 1;
  decode_execution_datetime(trade_information_record.execution_datetime);
  trade_information_record.sale_condition_level_1 = wire[at]; at = at + 1;
  trade_information_record.sale_condition_level_2 = wire[at]; at = at + 1;
  trade_information_record.sale_condition_level_3 = wire[at]; at = at + 1;
  trade_information_record.sale_condition_level_4 = wire[at]; at = at + 1;
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> trade_information_record.sellers_sale_days[trade_information_at] = wire[at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.price_change_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Information is what was written, byte for byte */
inline equal_trade_information(trade_information_read, trade_information_written) {
  trade_information_at = 0;
  do
  :: trade_information_at < 8 -> assert(trade_information_read.report_volume[trade_information_at] == trade_information_written.report_volume[trade_information_at]); trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  assert(trade_information_read.trade_price_denominator == trade_information_written.trade_price_denominator);
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> assert(trade_information_read.trade_price[trade_information_at] == trade_information_written.trade_price[trade_information_at]); trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 3 -> assert(trade_information_read.currency[trade_information_at] == trade_information_written.currency[trade_information_at]); trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  assert(trade_information_read.as_of_indicator == trade_information_written.as_of_indicator);
  equal_execution_datetime(trade_information_read.execution_datetime, trade_information_written.execution_datetime);
  assert(trade_information_read.sale_condition_level_1 == trade_information_written.sale_condition_level_1);
  assert(trade_information_read.sale_condition_level_2 == trade_information_written.sale_condition_level_2);
  assert(trade_information_read.sale_condition_level_3 == trade_information_written.sale_condition_level_3);
  assert(trade_information_read.sale_condition_level_4 == trade_information_written.sale_condition_level_4);
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> assert(trade_information_read.sellers_sale_days[trade_information_at] == trade_information_written.sellers_sale_days[trade_information_at]); trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  assert(trade_information_read.price_change_indicator == trade_information_written.price_change_indicator);
  skip
}

/* ---- Trade Report Long Form Message: 110 bytes ------------------------------- */

/* Complete trade report */
typedef TradeReportLongFormMessage {
  MessageHeader message_header;
  byte security_symbol[14];
  OriginalDisseminationDate original_dissemination_date;
  TradeInformation trade_information
};

int trade_report_long_form_message_at;

/* every byte of Trade Report Long Form Message set to one value */
inline fill_trade_report_long_form_message(trade_report_long_form_message_record, trade_report_long_form_message_value) {
  fill_message_header(trade_report_long_form_message_record.message_header, trade_report_long_form_message_value);
  trade_report_long_form_message_at = 0;
  do
  :: trade_report_long_form_message_at < 14 -> trade_report_long_form_message_record.security_symbol[trade_report_long_form_message_at] = trade_report_long_form_message_value; trade_report_long_form_message_at = trade_report_long_form_message_at + 1
  :: else -> break
  od;
  fill_original_dissemination_date(trade_report_long_form_message_record.original_dissemination_date, trade_report_long_form_message_value);
  fill_trade_information(trade_report_long_form_message_record.trade_information, trade_report_long_form_message_value);
  skip
}

/* each byte of Trade Report Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_long_form_message(trade_report_long_form_message_record, trade_report_long_form_message_base) {
  ramp_message_header(trade_report_long_form_message_record.message_header, trade_report_long_form_message_base + 0);
  trade_report_long_form_message_at = 0;
  do
  :: trade_report_long_form_message_at < 14 -> trade_report_long_form_message_record.security_symbol[trade_report_long_form_message_at] = (trade_report_long_form_message_base + 33 + trade_report_long_form_message_at + 1) % 256; trade_report_long_form_message_at = trade_report_long_form_message_at + 1
  :: else -> break
  od;
  ramp_original_dissemination_date(trade_report_long_form_message_record.original_dissemination_date, trade_report_long_form_message_base + 47);
  ramp_trade_information(trade_report_long_form_message_record.trade_information, trade_report_long_form_message_base + 55);
  skip
}

/* Trade Report Long Form Message to the wire, 110 bytes from where the cursor stands */
inline encode_trade_report_long_form_message(trade_report_long_form_message_record) {
  encode_message_header(trade_report_long_form_message_record.message_header);
  trade_report_long_form_message_at = 0;
  do
  :: trade_report_long_form_message_at < 14 -> wire[at] = trade_report_long_form_message_record.security_symbol[trade_report_long_form_message_at]; at = at + 1; trade_report_long_form_message_at = trade_report_long_form_message_at + 1
  :: else -> break
  od;
  encode_original_dissemination_date(trade_report_long_form_message_record.original_dissemination_date);
  encode_trade_information(trade_report_long_form_message_record.trade_information);
  skip
}

/* Trade Report Long Form Message off the wire, 110 bytes from where the cursor stands */
inline decode_trade_report_long_form_message(trade_report_long_form_message_record) {
  decode_message_header(trade_report_long_form_message_record.message_header);
  trade_report_long_form_message_at = 0;
  do
  :: trade_report_long_form_message_at < 14 -> trade_report_long_form_message_record.security_symbol[trade_report_long_form_message_at] = wire[at]; at = at + 1; trade_report_long_form_message_at = trade_report_long_form_message_at + 1
  :: else -> break
  od;
  decode_original_dissemination_date(trade_report_long_form_message_record.original_dissemination_date);
  decode_trade_information(trade_report_long_form_message_record.trade_information);
  skip
}

/* what was read of Trade Report Long Form Message is what was written, byte for byte */
inline equal_trade_report_long_form_message(trade_report_long_form_message_read, trade_report_long_form_message_written) {
  equal_message_header(trade_report_long_form_message_read.message_header, trade_report_long_form_message_written.message_header);
  trade_report_long_form_message_at = 0;
  do
  :: trade_report_long_form_message_at < 14 -> assert(trade_report_long_form_message_read.security_symbol[trade_report_long_form_message_at] == trade_report_long_form_message_written.security_symbol[trade_report_long_form_message_at]); trade_report_long_form_message_at = trade_report_long_form_message_at + 1
  :: else -> break
  od;
  equal_original_dissemination_date(trade_report_long_form_message_read.original_dissemination_date, trade_report_long_form_message_written.original_dissemination_date);
  equal_trade_information(trade_report_long_form_message_read.trade_information, trade_report_long_form_message_written.trade_information);
  skip
}

/* ---- Original Trade Information: 54 bytes ------------------------------------ */

/* Original Trade Information */
typedef OriginalTradeInformation {
  byte report_volume[8];
  byte trade_price_denominator;
  byte trade_price[12];
  byte currency[3];
  byte as_of_indicator;
  ExecutionDatetime execution_datetime;
  byte sale_condition_level_1;
  byte sale_condition_level_2;
  byte sale_condition_level_3;
  byte sale_condition_level_4;
  byte sellers_sale_days[2]
};

int original_trade_information_at;

/* every byte of Original Trade Information set to one value */
inline fill_original_trade_information(original_trade_information_record, original_trade_information_value) {
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 8 -> original_trade_information_record.report_volume[original_trade_information_at] = original_trade_information_value; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.trade_price_denominator = original_trade_information_value;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> original_trade_information_record.trade_price[original_trade_information_at] = original_trade_information_value; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 3 -> original_trade_information_record.currency[original_trade_information_at] = original_trade_information_value; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.as_of_indicator = original_trade_information_value;
  fill_execution_datetime(original_trade_information_record.execution_datetime, original_trade_information_value);
  original_trade_information_record.sale_condition_level_1 = original_trade_information_value;
  original_trade_information_record.sale_condition_level_2 = original_trade_information_value;
  original_trade_information_record.sale_condition_level_3 = original_trade_information_value;
  original_trade_information_record.sale_condition_level_4 = original_trade_information_value;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> original_trade_information_record.sellers_sale_days[original_trade_information_at] = original_trade_information_value; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Original Trade Information set to where it lies, so a field read out of place says so */
inline ramp_original_trade_information(original_trade_information_record, original_trade_information_base) {
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 8 -> original_trade_information_record.report_volume[original_trade_information_at] = (original_trade_information_base + 0 + original_trade_information_at + 1) % 256; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.trade_price_denominator = (original_trade_information_base + 8 + 1) % 256;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> original_trade_information_record.trade_price[original_trade_information_at] = (original_trade_information_base + 9 + original_trade_information_at + 1) % 256; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 3 -> original_trade_information_record.currency[original_trade_information_at] = (original_trade_information_base + 21 + original_trade_information_at + 1) % 256; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.as_of_indicator = (original_trade_information_base + 24 + 1) % 256;
  ramp_execution_datetime(original_trade_information_record.execution_datetime, original_trade_information_base + 25);
  original_trade_information_record.sale_condition_level_1 = (original_trade_information_base + 48 + 1) % 256;
  original_trade_information_record.sale_condition_level_2 = (original_trade_information_base + 49 + 1) % 256;
  original_trade_information_record.sale_condition_level_3 = (original_trade_information_base + 50 + 1) % 256;
  original_trade_information_record.sale_condition_level_4 = (original_trade_information_base + 51 + 1) % 256;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> original_trade_information_record.sellers_sale_days[original_trade_information_at] = (original_trade_information_base + 52 + original_trade_information_at + 1) % 256; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* Original Trade Information to the wire, 54 bytes from where the cursor stands */
inline encode_original_trade_information(original_trade_information_record) {
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 8 -> wire[at] = original_trade_information_record.report_volume[original_trade_information_at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = original_trade_information_record.trade_price_denominator; at = at + 1;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> wire[at] = original_trade_information_record.trade_price[original_trade_information_at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 3 -> wire[at] = original_trade_information_record.currency[original_trade_information_at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = original_trade_information_record.as_of_indicator; at = at + 1;
  encode_execution_datetime(original_trade_information_record.execution_datetime);
  wire[at] = original_trade_information_record.sale_condition_level_1; at = at + 1;
  wire[at] = original_trade_information_record.sale_condition_level_2; at = at + 1;
  wire[at] = original_trade_information_record.sale_condition_level_3; at = at + 1;
  wire[at] = original_trade_information_record.sale_condition_level_4; at = at + 1;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> wire[at] = original_trade_information_record.sellers_sale_days[original_trade_information_at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* Original Trade Information off the wire, 54 bytes from where the cursor stands */
inline decode_original_trade_information(original_trade_information_record) {
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 8 -> original_trade_information_record.report_volume[original_trade_information_at] = wire[at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.trade_price_denominator = wire[at]; at = at + 1;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> original_trade_information_record.trade_price[original_trade_information_at] = wire[at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 3 -> original_trade_information_record.currency[original_trade_information_at] = wire[at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.as_of_indicator = wire[at]; at = at + 1;
  decode_execution_datetime(original_trade_information_record.execution_datetime);
  original_trade_information_record.sale_condition_level_1 = wire[at]; at = at + 1;
  original_trade_information_record.sale_condition_level_2 = wire[at]; at = at + 1;
  original_trade_information_record.sale_condition_level_3 = wire[at]; at = at + 1;
  original_trade_information_record.sale_condition_level_4 = wire[at]; at = at + 1;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> original_trade_information_record.sellers_sale_days[original_trade_information_at] = wire[at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Original Trade Information is what was written, byte for byte */
inline equal_original_trade_information(original_trade_information_read, original_trade_information_written) {
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 8 -> assert(original_trade_information_read.report_volume[original_trade_information_at] == original_trade_information_written.report_volume[original_trade_information_at]); original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  assert(original_trade_information_read.trade_price_denominator == original_trade_information_written.trade_price_denominator);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> assert(original_trade_information_read.trade_price[original_trade_information_at] == original_trade_information_written.trade_price[original_trade_information_at]); original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 3 -> assert(original_trade_information_read.currency[original_trade_information_at] == original_trade_information_written.currency[original_trade_information_at]); original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  assert(original_trade_information_read.as_of_indicator == original_trade_information_written.as_of_indicator);
  equal_execution_datetime(original_trade_information_read.execution_datetime, original_trade_information_written.execution_datetime);
  assert(original_trade_information_read.sale_condition_level_1 == original_trade_information_written.sale_condition_level_1);
  assert(original_trade_information_read.sale_condition_level_2 == original_trade_information_written.sale_condition_level_2);
  assert(original_trade_information_read.sale_condition_level_3 == original_trade_information_written.sale_condition_level_3);
  assert(original_trade_information_read.sale_condition_level_4 == original_trade_information_written.sale_condition_level_4);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> assert(original_trade_information_read.sellers_sale_days[original_trade_information_at] == original_trade_information_written.sellers_sale_days[original_trade_information_at]); original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Summary Information: 52 bytes ------------------------------------- */

/* Trade Summary Information */
typedef TradeSummaryInformation {
  byte high_price_denominator;
  byte high_price[12];
  byte low_price_denominator;
  byte low_price[12];
  byte last_sale_price_denominator;
  byte last_sale_price[12];
  byte last_sale_price_market_center;
  byte total_security_volume[11];
  byte price_change_indicator
};

int trade_summary_information_at;

/* every byte of Trade Summary Information set to one value */
inline fill_trade_summary_information(trade_summary_information_record, trade_summary_information_value) {
  trade_summary_information_record.high_price_denominator = trade_summary_information_value;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> trade_summary_information_record.high_price[trade_summary_information_at] = trade_summary_information_value; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.low_price_denominator = trade_summary_information_value;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> trade_summary_information_record.low_price[trade_summary_information_at] = trade_summary_information_value; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.last_sale_price_denominator = trade_summary_information_value;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> trade_summary_information_record.last_sale_price[trade_summary_information_at] = trade_summary_information_value; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.last_sale_price_market_center = trade_summary_information_value;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.total_security_volume[trade_summary_information_at] = trade_summary_information_value; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.price_change_indicator = trade_summary_information_value;
  skip
}

/* each byte of Trade Summary Information set to where it lies, so a field read out of place says so */
inline ramp_trade_summary_information(trade_summary_information_record, trade_summary_information_base) {
  trade_summary_information_record.high_price_denominator = (trade_summary_information_base + 0 + 1) % 256;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> trade_summary_information_record.high_price[trade_summary_information_at] = (trade_summary_information_base + 1 + trade_summary_information_at + 1) % 256; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.low_price_denominator = (trade_summary_information_base + 13 + 1) % 256;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> trade_summary_information_record.low_price[trade_summary_information_at] = (trade_summary_information_base + 14 + trade_summary_information_at + 1) % 256; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.last_sale_price_denominator = (trade_summary_information_base + 26 + 1) % 256;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> trade_summary_information_record.last_sale_price[trade_summary_information_at] = (trade_summary_information_base + 27 + trade_summary_information_at + 1) % 256; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.last_sale_price_market_center = (trade_summary_information_base + 39 + 1) % 256;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.total_security_volume[trade_summary_information_at] = (trade_summary_information_base + 40 + trade_summary_information_at + 1) % 256; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.price_change_indicator = (trade_summary_information_base + 51 + 1) % 256;
  skip
}

/* Trade Summary Information to the wire, 52 bytes from where the cursor stands */
inline encode_trade_summary_information(trade_summary_information_record) {
  wire[at] = trade_summary_information_record.high_price_denominator; at = at + 1;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> wire[at] = trade_summary_information_record.high_price[trade_summary_information_at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_summary_information_record.low_price_denominator; at = at + 1;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> wire[at] = trade_summary_information_record.low_price[trade_summary_information_at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_summary_information_record.last_sale_price_denominator; at = at + 1;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> wire[at] = trade_summary_information_record.last_sale_price[trade_summary_information_at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_summary_information_record.last_sale_price_market_center; at = at + 1;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> wire[at] = trade_summary_information_record.total_security_volume[trade_summary_information_at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_summary_information_record.price_change_indicator; at = at + 1;
  skip
}

/* Trade Summary Information off the wire, 52 bytes from where the cursor stands */
inline decode_trade_summary_information(trade_summary_information_record) {
  trade_summary_information_record.high_price_denominator = wire[at]; at = at + 1;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> trade_summary_information_record.high_price[trade_summary_information_at] = wire[at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.low_price_denominator = wire[at]; at = at + 1;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> trade_summary_information_record.low_price[trade_summary_information_at] = wire[at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.last_sale_price_denominator = wire[at]; at = at + 1;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> trade_summary_information_record.last_sale_price[trade_summary_information_at] = wire[at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.last_sale_price_market_center = wire[at]; at = at + 1;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.total_security_volume[trade_summary_information_at] = wire[at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.price_change_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Summary Information is what was written, byte for byte */
inline equal_trade_summary_information(trade_summary_information_read, trade_summary_information_written) {
  assert(trade_summary_information_read.high_price_denominator == trade_summary_information_written.high_price_denominator);
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> assert(trade_summary_information_read.high_price[trade_summary_information_at] == trade_summary_information_written.high_price[trade_summary_information_at]); trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  assert(trade_summary_information_read.low_price_denominator == trade_summary_information_written.low_price_denominator);
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> assert(trade_summary_information_read.low_price[trade_summary_information_at] == trade_summary_information_written.low_price[trade_summary_information_at]); trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  assert(trade_summary_information_read.last_sale_price_denominator == trade_summary_information_written.last_sale_price_denominator);
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 12 -> assert(trade_summary_information_read.last_sale_price[trade_summary_information_at] == trade_summary_information_written.last_sale_price[trade_summary_information_at]); trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  assert(trade_summary_information_read.last_sale_price_market_center == trade_summary_information_written.last_sale_price_market_center);
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> assert(trade_summary_information_read.total_security_volume[trade_summary_information_at] == trade_summary_information_written.total_security_volume[trade_summary_information_at]); trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  assert(trade_summary_information_read.price_change_indicator == trade_summary_information_written.price_change_indicator);
  skip
}

/* ---- Trade Cancel Error Message: 162 bytes ----------------------------------- */

/* This message is used to notify TDDS customers if a trade report entered during the current business day, or up to the past three business days, has been canceled */
typedef TradeCancelErrorMessage {
  MessageHeader message_header;
  byte security_symbol[14];
  OriginalDisseminationDate original_dissemination_date;
  byte report_function;
  OriginalTradeInformation original_trade_information;
  TradeSummaryInformation trade_summary_information
};

int trade_cancel_error_message_at;

/* every byte of Trade Cancel Error Message set to one value */
inline fill_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_value) {
  fill_message_header(trade_cancel_error_message_record.message_header, trade_cancel_error_message_value);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 14 -> trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fill_original_dissemination_date(trade_cancel_error_message_record.original_dissemination_date, trade_cancel_error_message_value);
  trade_cancel_error_message_record.report_function = trade_cancel_error_message_value;
  fill_original_trade_information(trade_cancel_error_message_record.original_trade_information, trade_cancel_error_message_value);
  fill_trade_summary_information(trade_cancel_error_message_record.trade_summary_information, trade_cancel_error_message_value);
  skip
}

/* each byte of Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_base) {
  ramp_message_header(trade_cancel_error_message_record.message_header, trade_cancel_error_message_base + 0);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 14 -> trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 33 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  ramp_original_dissemination_date(trade_cancel_error_message_record.original_dissemination_date, trade_cancel_error_message_base + 47);
  trade_cancel_error_message_record.report_function = (trade_cancel_error_message_base + 55 + 1) % 256;
  ramp_original_trade_information(trade_cancel_error_message_record.original_trade_information, trade_cancel_error_message_base + 56);
  ramp_trade_summary_information(trade_cancel_error_message_record.trade_summary_information, trade_cancel_error_message_base + 110);
  skip
}

/* Trade Cancel Error Message to the wire, 162 bytes from where the cursor stands */
inline encode_trade_cancel_error_message(trade_cancel_error_message_record) {
  encode_message_header(trade_cancel_error_message_record.message_header);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 14 -> wire[at] = trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  encode_original_dissemination_date(trade_cancel_error_message_record.original_dissemination_date);
  wire[at] = trade_cancel_error_message_record.report_function; at = at + 1;
  encode_original_trade_information(trade_cancel_error_message_record.original_trade_information);
  encode_trade_summary_information(trade_cancel_error_message_record.trade_summary_information);
  skip
}

/* Trade Cancel Error Message off the wire, 162 bytes from where the cursor stands */
inline decode_trade_cancel_error_message(trade_cancel_error_message_record) {
  decode_message_header(trade_cancel_error_message_record.message_header);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 14 -> trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  decode_original_dissemination_date(trade_cancel_error_message_record.original_dissemination_date);
  trade_cancel_error_message_record.report_function = wire[at]; at = at + 1;
  decode_original_trade_information(trade_cancel_error_message_record.original_trade_information);
  decode_trade_summary_information(trade_cancel_error_message_record.trade_summary_information);
  skip
}

/* what was read of Trade Cancel Error Message is what was written, byte for byte */
inline equal_trade_cancel_error_message(trade_cancel_error_message_read, trade_cancel_error_message_written) {
  equal_message_header(trade_cancel_error_message_read.message_header, trade_cancel_error_message_written.message_header);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 14 -> assert(trade_cancel_error_message_read.security_symbol[trade_cancel_error_message_at] == trade_cancel_error_message_written.security_symbol[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  equal_original_dissemination_date(trade_cancel_error_message_read.original_dissemination_date, trade_cancel_error_message_written.original_dissemination_date);
  assert(trade_cancel_error_message_read.report_function == trade_cancel_error_message_written.report_function);
  equal_original_trade_information(trade_cancel_error_message_read.original_trade_information, trade_cancel_error_message_written.original_trade_information);
  equal_trade_summary_information(trade_cancel_error_message_read.trade_summary_information, trade_cancel_error_message_written.trade_summary_information);
  skip
}

/* ---- Corrected Trade Information: 54 bytes ----------------------------------- */

/* Corrected Trade Information */
typedef CorrectedTradeInformation {
  byte report_volume[8];
  byte trade_price_denominator;
  byte trade_price[12];
  byte currency[3];
  byte as_of_indicator;
  ExecutionDatetime execution_datetime;
  byte sale_condition_level_1;
  byte sale_condition_level_2;
  byte sale_condition_level_3;
  byte sale_condition_level_4;
  byte sellers_sale_days[2]
};

int corrected_trade_information_at;

/* every byte of Corrected Trade Information set to one value */
inline fill_corrected_trade_information(corrected_trade_information_record, corrected_trade_information_value) {
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 8 -> corrected_trade_information_record.report_volume[corrected_trade_information_at] = corrected_trade_information_value; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_record.trade_price_denominator = corrected_trade_information_value;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 12 -> corrected_trade_information_record.trade_price[corrected_trade_information_at] = corrected_trade_information_value; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 3 -> corrected_trade_information_record.currency[corrected_trade_information_at] = corrected_trade_information_value; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_record.as_of_indicator = corrected_trade_information_value;
  fill_execution_datetime(corrected_trade_information_record.execution_datetime, corrected_trade_information_value);
  corrected_trade_information_record.sale_condition_level_1 = corrected_trade_information_value;
  corrected_trade_information_record.sale_condition_level_2 = corrected_trade_information_value;
  corrected_trade_information_record.sale_condition_level_3 = corrected_trade_information_value;
  corrected_trade_information_record.sale_condition_level_4 = corrected_trade_information_value;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 2 -> corrected_trade_information_record.sellers_sale_days[corrected_trade_information_at] = corrected_trade_information_value; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Corrected Trade Information set to where it lies, so a field read out of place says so */
inline ramp_corrected_trade_information(corrected_trade_information_record, corrected_trade_information_base) {
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 8 -> corrected_trade_information_record.report_volume[corrected_trade_information_at] = (corrected_trade_information_base + 0 + corrected_trade_information_at + 1) % 256; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_record.trade_price_denominator = (corrected_trade_information_base + 8 + 1) % 256;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 12 -> corrected_trade_information_record.trade_price[corrected_trade_information_at] = (corrected_trade_information_base + 9 + corrected_trade_information_at + 1) % 256; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 3 -> corrected_trade_information_record.currency[corrected_trade_information_at] = (corrected_trade_information_base + 21 + corrected_trade_information_at + 1) % 256; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_record.as_of_indicator = (corrected_trade_information_base + 24 + 1) % 256;
  ramp_execution_datetime(corrected_trade_information_record.execution_datetime, corrected_trade_information_base + 25);
  corrected_trade_information_record.sale_condition_level_1 = (corrected_trade_information_base + 48 + 1) % 256;
  corrected_trade_information_record.sale_condition_level_2 = (corrected_trade_information_base + 49 + 1) % 256;
  corrected_trade_information_record.sale_condition_level_3 = (corrected_trade_information_base + 50 + 1) % 256;
  corrected_trade_information_record.sale_condition_level_4 = (corrected_trade_information_base + 51 + 1) % 256;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 2 -> corrected_trade_information_record.sellers_sale_days[corrected_trade_information_at] = (corrected_trade_information_base + 52 + corrected_trade_information_at + 1) % 256; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* Corrected Trade Information to the wire, 54 bytes from where the cursor stands */
inline encode_corrected_trade_information(corrected_trade_information_record) {
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 8 -> wire[at] = corrected_trade_information_record.report_volume[corrected_trade_information_at]; at = at + 1; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = corrected_trade_information_record.trade_price_denominator; at = at + 1;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 12 -> wire[at] = corrected_trade_information_record.trade_price[corrected_trade_information_at]; at = at + 1; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 3 -> wire[at] = corrected_trade_information_record.currency[corrected_trade_information_at]; at = at + 1; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = corrected_trade_information_record.as_of_indicator; at = at + 1;
  encode_execution_datetime(corrected_trade_information_record.execution_datetime);
  wire[at] = corrected_trade_information_record.sale_condition_level_1; at = at + 1;
  wire[at] = corrected_trade_information_record.sale_condition_level_2; at = at + 1;
  wire[at] = corrected_trade_information_record.sale_condition_level_3; at = at + 1;
  wire[at] = corrected_trade_information_record.sale_condition_level_4; at = at + 1;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 2 -> wire[at] = corrected_trade_information_record.sellers_sale_days[corrected_trade_information_at]; at = at + 1; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* Corrected Trade Information off the wire, 54 bytes from where the cursor stands */
inline decode_corrected_trade_information(corrected_trade_information_record) {
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 8 -> corrected_trade_information_record.report_volume[corrected_trade_information_at] = wire[at]; at = at + 1; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_record.trade_price_denominator = wire[at]; at = at + 1;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 12 -> corrected_trade_information_record.trade_price[corrected_trade_information_at] = wire[at]; at = at + 1; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 3 -> corrected_trade_information_record.currency[corrected_trade_information_at] = wire[at]; at = at + 1; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_record.as_of_indicator = wire[at]; at = at + 1;
  decode_execution_datetime(corrected_trade_information_record.execution_datetime);
  corrected_trade_information_record.sale_condition_level_1 = wire[at]; at = at + 1;
  corrected_trade_information_record.sale_condition_level_2 = wire[at]; at = at + 1;
  corrected_trade_information_record.sale_condition_level_3 = wire[at]; at = at + 1;
  corrected_trade_information_record.sale_condition_level_4 = wire[at]; at = at + 1;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 2 -> corrected_trade_information_record.sellers_sale_days[corrected_trade_information_at] = wire[at]; at = at + 1; corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Corrected Trade Information is what was written, byte for byte */
inline equal_corrected_trade_information(corrected_trade_information_read, corrected_trade_information_written) {
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 8 -> assert(corrected_trade_information_read.report_volume[corrected_trade_information_at] == corrected_trade_information_written.report_volume[corrected_trade_information_at]); corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  assert(corrected_trade_information_read.trade_price_denominator == corrected_trade_information_written.trade_price_denominator);
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 12 -> assert(corrected_trade_information_read.trade_price[corrected_trade_information_at] == corrected_trade_information_written.trade_price[corrected_trade_information_at]); corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 3 -> assert(corrected_trade_information_read.currency[corrected_trade_information_at] == corrected_trade_information_written.currency[corrected_trade_information_at]); corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  assert(corrected_trade_information_read.as_of_indicator == corrected_trade_information_written.as_of_indicator);
  equal_execution_datetime(corrected_trade_information_read.execution_datetime, corrected_trade_information_written.execution_datetime);
  assert(corrected_trade_information_read.sale_condition_level_1 == corrected_trade_information_written.sale_condition_level_1);
  assert(corrected_trade_information_read.sale_condition_level_2 == corrected_trade_information_written.sale_condition_level_2);
  assert(corrected_trade_information_read.sale_condition_level_3 == corrected_trade_information_written.sale_condition_level_3);
  assert(corrected_trade_information_read.sale_condition_level_4 == corrected_trade_information_written.sale_condition_level_4);
  corrected_trade_information_at = 0;
  do
  :: corrected_trade_information_at < 2 -> assert(corrected_trade_information_read.sellers_sale_days[corrected_trade_information_at] == corrected_trade_information_written.sellers_sale_days[corrected_trade_information_at]); corrected_trade_information_at = corrected_trade_information_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction Message: 216 bytes ------------------------------------- */

/* Used to notify TDDS customers if a trade report entered during the current business day, or up to the past three business days, has been modified */
typedef TradeCorrectionMessage {
  MessageHeader message_header;
  byte security_symbol[14];
  OriginalDisseminationDate original_dissemination_date;
  byte report_function;
  OriginalTradeInformation original_trade_information;
  CorrectedTradeInformation corrected_trade_information;
  TradeSummaryInformation trade_summary_information
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  fill_message_header(trade_correction_message_record.message_header, trade_correction_message_value);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> trade_correction_message_record.security_symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  fill_original_dissemination_date(trade_correction_message_record.original_dissemination_date, trade_correction_message_value);
  trade_correction_message_record.report_function = trade_correction_message_value;
  fill_original_trade_information(trade_correction_message_record.original_trade_information, trade_correction_message_value);
  fill_corrected_trade_information(trade_correction_message_record.corrected_trade_information, trade_correction_message_value);
  fill_trade_summary_information(trade_correction_message_record.trade_summary_information, trade_correction_message_value);
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  ramp_message_header(trade_correction_message_record.message_header, trade_correction_message_base + 0);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> trade_correction_message_record.security_symbol[trade_correction_message_at] = (trade_correction_message_base + 33 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_original_dissemination_date(trade_correction_message_record.original_dissemination_date, trade_correction_message_base + 47);
  trade_correction_message_record.report_function = (trade_correction_message_base + 55 + 1) % 256;
  ramp_original_trade_information(trade_correction_message_record.original_trade_information, trade_correction_message_base + 56);
  ramp_corrected_trade_information(trade_correction_message_record.corrected_trade_information, trade_correction_message_base + 110);
  ramp_trade_summary_information(trade_correction_message_record.trade_summary_information, trade_correction_message_base + 164);
  skip
}

/* Trade Correction Message to the wire, 216 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  encode_message_header(trade_correction_message_record.message_header);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> wire[at] = trade_correction_message_record.security_symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  encode_original_dissemination_date(trade_correction_message_record.original_dissemination_date);
  wire[at] = trade_correction_message_record.report_function; at = at + 1;
  encode_original_trade_information(trade_correction_message_record.original_trade_information);
  encode_corrected_trade_information(trade_correction_message_record.corrected_trade_information);
  encode_trade_summary_information(trade_correction_message_record.trade_summary_information);
  skip
}

/* Trade Correction Message off the wire, 216 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  decode_message_header(trade_correction_message_record.message_header);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> trade_correction_message_record.security_symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  decode_original_dissemination_date(trade_correction_message_record.original_dissemination_date);
  trade_correction_message_record.report_function = wire[at]; at = at + 1;
  decode_original_trade_information(trade_correction_message_record.original_trade_information);
  decode_corrected_trade_information(trade_correction_message_record.corrected_trade_information);
  decode_trade_summary_information(trade_correction_message_record.trade_summary_information);
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  equal_message_header(trade_correction_message_read.message_header, trade_correction_message_written.message_header);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> assert(trade_correction_message_read.security_symbol[trade_correction_message_at] == trade_correction_message_written.security_symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  equal_original_dissemination_date(trade_correction_message_read.original_dissemination_date, trade_correction_message_written.original_dissemination_date);
  assert(trade_correction_message_read.report_function == trade_correction_message_written.report_function);
  equal_original_trade_information(trade_correction_message_read.original_trade_information, trade_correction_message_written.original_trade_information);
  equal_corrected_trade_information(trade_correction_message_read.corrected_trade_information, trade_correction_message_written.corrected_trade_information);
  equal_trade_summary_information(trade_correction_message_read.trade_summary_information, trade_correction_message_written.trade_summary_information);
  skip
}

/* ---- Closing Trade Summary Report Message: 114 bytes ------------------------- */

/* The closing trade summary will reflect the daily high, low, and closing prices as well as the total volume for the security */
typedef ClosingTradeSummaryReportMessage {
  MessageHeader message_header;
  byte security_symbol[14];
  byte daily_high_price_denominator;
  byte daily_high_price[12];
  byte daily_low_price_denominator;
  byte daily_low_price[12];
  byte closing_price_market_center;
  byte closing_price_denominator;
  byte closing_price[12];
  byte reserved_1;
  byte net_change_denominator;
  byte net_change_amount[10];
  byte net_change_direction;
  byte currency[3];
  byte total_security_volume[11]
};

int closing_trade_summary_report_message_at;

/* every byte of Closing Trade Summary Report Message set to one value */
inline fill_closing_trade_summary_report_message(closing_trade_summary_report_message_record, closing_trade_summary_report_message_value) {
  fill_message_header(closing_trade_summary_report_message_record.message_header, closing_trade_summary_report_message_value);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 14 -> closing_trade_summary_report_message_record.security_symbol[closing_trade_summary_report_message_at] = closing_trade_summary_report_message_value; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.daily_high_price_denominator = closing_trade_summary_report_message_value;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> closing_trade_summary_report_message_record.daily_high_price[closing_trade_summary_report_message_at] = closing_trade_summary_report_message_value; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.daily_low_price_denominator = closing_trade_summary_report_message_value;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> closing_trade_summary_report_message_record.daily_low_price[closing_trade_summary_report_message_at] = closing_trade_summary_report_message_value; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.closing_price_market_center = closing_trade_summary_report_message_value;
  closing_trade_summary_report_message_record.closing_price_denominator = closing_trade_summary_report_message_value;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> closing_trade_summary_report_message_record.closing_price[closing_trade_summary_report_message_at] = closing_trade_summary_report_message_value; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.reserved_1 = closing_trade_summary_report_message_value;
  closing_trade_summary_report_message_record.net_change_denominator = closing_trade_summary_report_message_value;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 10 -> closing_trade_summary_report_message_record.net_change_amount[closing_trade_summary_report_message_at] = closing_trade_summary_report_message_value; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.net_change_direction = closing_trade_summary_report_message_value;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 3 -> closing_trade_summary_report_message_record.currency[closing_trade_summary_report_message_at] = closing_trade_summary_report_message_value; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 11 -> closing_trade_summary_report_message_record.total_security_volume[closing_trade_summary_report_message_at] = closing_trade_summary_report_message_value; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Closing Trade Summary Report Message set to where it lies, so a field read out of place says so */
inline ramp_closing_trade_summary_report_message(closing_trade_summary_report_message_record, closing_trade_summary_report_message_base) {
  ramp_message_header(closing_trade_summary_report_message_record.message_header, closing_trade_summary_report_message_base + 0);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 14 -> closing_trade_summary_report_message_record.security_symbol[closing_trade_summary_report_message_at] = (closing_trade_summary_report_message_base + 33 + closing_trade_summary_report_message_at + 1) % 256; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.daily_high_price_denominator = (closing_trade_summary_report_message_base + 47 + 1) % 256;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> closing_trade_summary_report_message_record.daily_high_price[closing_trade_summary_report_message_at] = (closing_trade_summary_report_message_base + 48 + closing_trade_summary_report_message_at + 1) % 256; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.daily_low_price_denominator = (closing_trade_summary_report_message_base + 60 + 1) % 256;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> closing_trade_summary_report_message_record.daily_low_price[closing_trade_summary_report_message_at] = (closing_trade_summary_report_message_base + 61 + closing_trade_summary_report_message_at + 1) % 256; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.closing_price_market_center = (closing_trade_summary_report_message_base + 73 + 1) % 256;
  closing_trade_summary_report_message_record.closing_price_denominator = (closing_trade_summary_report_message_base + 74 + 1) % 256;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> closing_trade_summary_report_message_record.closing_price[closing_trade_summary_report_message_at] = (closing_trade_summary_report_message_base + 75 + closing_trade_summary_report_message_at + 1) % 256; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.reserved_1 = (closing_trade_summary_report_message_base + 87 + 1) % 256;
  closing_trade_summary_report_message_record.net_change_denominator = (closing_trade_summary_report_message_base + 88 + 1) % 256;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 10 -> closing_trade_summary_report_message_record.net_change_amount[closing_trade_summary_report_message_at] = (closing_trade_summary_report_message_base + 89 + closing_trade_summary_report_message_at + 1) % 256; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.net_change_direction = (closing_trade_summary_report_message_base + 99 + 1) % 256;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 3 -> closing_trade_summary_report_message_record.currency[closing_trade_summary_report_message_at] = (closing_trade_summary_report_message_base + 100 + closing_trade_summary_report_message_at + 1) % 256; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 11 -> closing_trade_summary_report_message_record.total_security_volume[closing_trade_summary_report_message_at] = (closing_trade_summary_report_message_base + 103 + closing_trade_summary_report_message_at + 1) % 256; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Trade Summary Report Message to the wire, 114 bytes from where the cursor stands */
inline encode_closing_trade_summary_report_message(closing_trade_summary_report_message_record) {
  encode_message_header(closing_trade_summary_report_message_record.message_header);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 14 -> wire[at] = closing_trade_summary_report_message_record.security_symbol[closing_trade_summary_report_message_at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  wire[at] = closing_trade_summary_report_message_record.daily_high_price_denominator; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> wire[at] = closing_trade_summary_report_message_record.daily_high_price[closing_trade_summary_report_message_at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  wire[at] = closing_trade_summary_report_message_record.daily_low_price_denominator; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> wire[at] = closing_trade_summary_report_message_record.daily_low_price[closing_trade_summary_report_message_at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  wire[at] = closing_trade_summary_report_message_record.closing_price_market_center; at = at + 1;
  wire[at] = closing_trade_summary_report_message_record.closing_price_denominator; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> wire[at] = closing_trade_summary_report_message_record.closing_price[closing_trade_summary_report_message_at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  wire[at] = closing_trade_summary_report_message_record.reserved_1; at = at + 1;
  wire[at] = closing_trade_summary_report_message_record.net_change_denominator; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 10 -> wire[at] = closing_trade_summary_report_message_record.net_change_amount[closing_trade_summary_report_message_at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  wire[at] = closing_trade_summary_report_message_record.net_change_direction; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 3 -> wire[at] = closing_trade_summary_report_message_record.currency[closing_trade_summary_report_message_at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 11 -> wire[at] = closing_trade_summary_report_message_record.total_security_volume[closing_trade_summary_report_message_at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Trade Summary Report Message off the wire, 114 bytes from where the cursor stands */
inline decode_closing_trade_summary_report_message(closing_trade_summary_report_message_record) {
  decode_message_header(closing_trade_summary_report_message_record.message_header);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 14 -> closing_trade_summary_report_message_record.security_symbol[closing_trade_summary_report_message_at] = wire[at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.daily_high_price_denominator = wire[at]; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> closing_trade_summary_report_message_record.daily_high_price[closing_trade_summary_report_message_at] = wire[at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.daily_low_price_denominator = wire[at]; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> closing_trade_summary_report_message_record.daily_low_price[closing_trade_summary_report_message_at] = wire[at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.closing_price_market_center = wire[at]; at = at + 1;
  closing_trade_summary_report_message_record.closing_price_denominator = wire[at]; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> closing_trade_summary_report_message_record.closing_price[closing_trade_summary_report_message_at] = wire[at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.reserved_1 = wire[at]; at = at + 1;
  closing_trade_summary_report_message_record.net_change_denominator = wire[at]; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 10 -> closing_trade_summary_report_message_record.net_change_amount[closing_trade_summary_report_message_at] = wire[at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_record.net_change_direction = wire[at]; at = at + 1;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 3 -> closing_trade_summary_report_message_record.currency[closing_trade_summary_report_message_at] = wire[at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 11 -> closing_trade_summary_report_message_record.total_security_volume[closing_trade_summary_report_message_at] = wire[at]; at = at + 1; closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Closing Trade Summary Report Message is what was written, byte for byte */
inline equal_closing_trade_summary_report_message(closing_trade_summary_report_message_read, closing_trade_summary_report_message_written) {
  equal_message_header(closing_trade_summary_report_message_read.message_header, closing_trade_summary_report_message_written.message_header);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 14 -> assert(closing_trade_summary_report_message_read.security_symbol[closing_trade_summary_report_message_at] == closing_trade_summary_report_message_written.security_symbol[closing_trade_summary_report_message_at]); closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  assert(closing_trade_summary_report_message_read.daily_high_price_denominator == closing_trade_summary_report_message_written.daily_high_price_denominator);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> assert(closing_trade_summary_report_message_read.daily_high_price[closing_trade_summary_report_message_at] == closing_trade_summary_report_message_written.daily_high_price[closing_trade_summary_report_message_at]); closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  assert(closing_trade_summary_report_message_read.daily_low_price_denominator == closing_trade_summary_report_message_written.daily_low_price_denominator);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> assert(closing_trade_summary_report_message_read.daily_low_price[closing_trade_summary_report_message_at] == closing_trade_summary_report_message_written.daily_low_price[closing_trade_summary_report_message_at]); closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  assert(closing_trade_summary_report_message_read.closing_price_market_center == closing_trade_summary_report_message_written.closing_price_market_center);
  assert(closing_trade_summary_report_message_read.closing_price_denominator == closing_trade_summary_report_message_written.closing_price_denominator);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 12 -> assert(closing_trade_summary_report_message_read.closing_price[closing_trade_summary_report_message_at] == closing_trade_summary_report_message_written.closing_price[closing_trade_summary_report_message_at]); closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  assert(closing_trade_summary_report_message_read.reserved_1 == closing_trade_summary_report_message_written.reserved_1);
  assert(closing_trade_summary_report_message_read.net_change_denominator == closing_trade_summary_report_message_written.net_change_denominator);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 10 -> assert(closing_trade_summary_report_message_read.net_change_amount[closing_trade_summary_report_message_at] == closing_trade_summary_report_message_written.net_change_amount[closing_trade_summary_report_message_at]); closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  assert(closing_trade_summary_report_message_read.net_change_direction == closing_trade_summary_report_message_written.net_change_direction);
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 3 -> assert(closing_trade_summary_report_message_read.currency[closing_trade_summary_report_message_at] == closing_trade_summary_report_message_written.currency[closing_trade_summary_report_message_at]); closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  closing_trade_summary_report_message_at = 0;
  do
  :: closing_trade_summary_report_message_at < 11 -> assert(closing_trade_summary_report_message_read.total_security_volume[closing_trade_summary_report_message_at] == closing_trade_summary_report_message_written.total_security_volume[closing_trade_summary_report_message_at]); closing_trade_summary_report_message_at = closing_trade_summary_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Action Datetime: 23 bytes ----------------------------------------------- */

/* Action Datetime */
typedef ActionDatetime {
  byte year[4];
  byte month[2];
  byte day[2];
  byte hour[2];
  byte minute[2];
  byte second[2];
  byte fractional_second[9]
};

int action_datetime_at;

/* every byte of Action Datetime set to one value */
inline fill_action_datetime(action_datetime_record, action_datetime_value) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 4 -> action_datetime_record.year[action_datetime_at] = action_datetime_value; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.month[action_datetime_at] = action_datetime_value; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.day[action_datetime_at] = action_datetime_value; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.hour[action_datetime_at] = action_datetime_value; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.minute[action_datetime_at] = action_datetime_value; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.second[action_datetime_at] = action_datetime_value; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 9 -> action_datetime_record.fractional_second[action_datetime_at] = action_datetime_value; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Action Datetime set to where it lies, so a field read out of place says so */
inline ramp_action_datetime(action_datetime_record, action_datetime_base) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 4 -> action_datetime_record.year[action_datetime_at] = (action_datetime_base + 0 + action_datetime_at + 1) % 256; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.month[action_datetime_at] = (action_datetime_base + 4 + action_datetime_at + 1) % 256; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.day[action_datetime_at] = (action_datetime_base + 6 + action_datetime_at + 1) % 256; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.hour[action_datetime_at] = (action_datetime_base + 8 + action_datetime_at + 1) % 256; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.minute[action_datetime_at] = (action_datetime_base + 10 + action_datetime_at + 1) % 256; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.second[action_datetime_at] = (action_datetime_base + 12 + action_datetime_at + 1) % 256; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 9 -> action_datetime_record.fractional_second[action_datetime_at] = (action_datetime_base + 14 + action_datetime_at + 1) % 256; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* Action Datetime to the wire, 23 bytes from where the cursor stands */
inline encode_action_datetime(action_datetime_record) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 4 -> wire[at] = action_datetime_record.year[action_datetime_at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> wire[at] = action_datetime_record.month[action_datetime_at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> wire[at] = action_datetime_record.day[action_datetime_at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> wire[at] = action_datetime_record.hour[action_datetime_at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> wire[at] = action_datetime_record.minute[action_datetime_at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> wire[at] = action_datetime_record.second[action_datetime_at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 9 -> wire[at] = action_datetime_record.fractional_second[action_datetime_at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* Action Datetime off the wire, 23 bytes from where the cursor stands */
inline decode_action_datetime(action_datetime_record) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 4 -> action_datetime_record.year[action_datetime_at] = wire[at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.month[action_datetime_at] = wire[at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.day[action_datetime_at] = wire[at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.hour[action_datetime_at] = wire[at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.minute[action_datetime_at] = wire[at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.second[action_datetime_at] = wire[at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 9 -> action_datetime_record.fractional_second[action_datetime_at] = wire[at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Action Datetime is what was written, byte for byte */
inline equal_action_datetime(action_datetime_read, action_datetime_written) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 4 -> assert(action_datetime_read.year[action_datetime_at] == action_datetime_written.year[action_datetime_at]); action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> assert(action_datetime_read.month[action_datetime_at] == action_datetime_written.month[action_datetime_at]); action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> assert(action_datetime_read.day[action_datetime_at] == action_datetime_written.day[action_datetime_at]); action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> assert(action_datetime_read.hour[action_datetime_at] == action_datetime_written.hour[action_datetime_at]); action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> assert(action_datetime_read.minute[action_datetime_at] == action_datetime_written.minute[action_datetime_at]); action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> assert(action_datetime_read.second[action_datetime_at] == action_datetime_written.second[action_datetime_at]); action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_at = 0;
  do
  :: action_datetime_at < 9 -> assert(action_datetime_read.fractional_second[action_datetime_at] == action_datetime_written.fractional_second[action_datetime_at]); action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Action Message: 77 bytes ---------------------------------------- */

/* FINRA will disseminate this message to inform customers of trading actions, such as halts or trading resumptions which affect individual OTCBB or Other OTC securities */
typedef TradingActionMessage {
  MessageHeader message_header;
  byte security_symbol[14];
  byte action;
  ActionDatetime action_datetime;
  byte trading_action_reason_code[6]
};

int trading_action_message_at;

/* every byte of Trading Action Message set to one value */
inline fill_trading_action_message(trading_action_message_record, trading_action_message_value) {
  fill_message_header(trading_action_message_record.message_header, trading_action_message_value);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 14 -> trading_action_message_record.security_symbol[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.action = trading_action_message_value;
  fill_action_datetime(trading_action_message_record.action_datetime, trading_action_message_value);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.trading_action_reason_code[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_trading_action_message(trading_action_message_record, trading_action_message_base) {
  ramp_message_header(trading_action_message_record.message_header, trading_action_message_base + 0);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 14 -> trading_action_message_record.security_symbol[trading_action_message_at] = (trading_action_message_base + 33 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.action = (trading_action_message_base + 47 + 1) % 256;
  ramp_action_datetime(trading_action_message_record.action_datetime, trading_action_message_base + 48);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.trading_action_reason_code[trading_action_message_at] = (trading_action_message_base + 71 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message to the wire, 77 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
  encode_message_header(trading_action_message_record.message_header);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 14 -> wire[at] = trading_action_message_record.security_symbol[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_action_message_record.action; at = at + 1;
  encode_action_datetime(trading_action_message_record.action_datetime);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> wire[at] = trading_action_message_record.trading_action_reason_code[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message off the wire, 77 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
  decode_message_header(trading_action_message_record.message_header);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 14 -> trading_action_message_record.security_symbol[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.action = wire[at]; at = at + 1;
  decode_action_datetime(trading_action_message_record.action_datetime);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.trading_action_reason_code[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Action Message is what was written, byte for byte */
inline equal_trading_action_message(trading_action_message_read, trading_action_message_written) {
  equal_message_header(trading_action_message_read.message_header, trading_action_message_written.message_header);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 14 -> assert(trading_action_message_read.security_symbol[trading_action_message_at] == trading_action_message_written.security_symbol[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  assert(trading_action_message_read.action == trading_action_message_written.action);
  equal_action_datetime(trading_action_message_read.action_datetime, trading_action_message_written.action_datetime);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> assert(trading_action_message_read.trading_action_reason_code[trading_action_message_at] == trading_action_message_written.trading_action_reason_code[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Wide Circuit Breaker Event Message: 63 bytes --------------------- */

/* FINRA will disseminate this message to inform customers of an extraordinary market event trading action or a market wide circuit breaker event which will affect all security symbols for either OTCBB, Other OTC or both OTCBB and Other OTC market places */
typedef MarketWideCircuitBreakerEventMessage {
  MessageHeader message_header;
  byte action;
  ActionDatetime action_datetime;
  byte market_wide_circuit_breaker_reason_code[6]
};

int market_wide_circuit_breaker_event_message_at;

/* every byte of Market Wide Circuit Breaker Event Message set to one value */
inline fill_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_record, market_wide_circuit_breaker_event_message_value) {
  fill_message_header(market_wide_circuit_breaker_event_message_record.message_header, market_wide_circuit_breaker_event_message_value);
  market_wide_circuit_breaker_event_message_record.action = market_wide_circuit_breaker_event_message_value;
  fill_action_datetime(market_wide_circuit_breaker_event_message_record.action_datetime, market_wide_circuit_breaker_event_message_value);
  market_wide_circuit_breaker_event_message_at = 0;
  do
  :: market_wide_circuit_breaker_event_message_at < 6 -> market_wide_circuit_breaker_event_message_record.market_wide_circuit_breaker_reason_code[market_wide_circuit_breaker_event_message_at] = market_wide_circuit_breaker_event_message_value; market_wide_circuit_breaker_event_message_at = market_wide_circuit_breaker_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Wide Circuit Breaker Event Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_record, market_wide_circuit_breaker_event_message_base) {
  ramp_message_header(market_wide_circuit_breaker_event_message_record.message_header, market_wide_circuit_breaker_event_message_base + 0);
  market_wide_circuit_breaker_event_message_record.action = (market_wide_circuit_breaker_event_message_base + 33 + 1) % 256;
  ramp_action_datetime(market_wide_circuit_breaker_event_message_record.action_datetime, market_wide_circuit_breaker_event_message_base + 34);
  market_wide_circuit_breaker_event_message_at = 0;
  do
  :: market_wide_circuit_breaker_event_message_at < 6 -> market_wide_circuit_breaker_event_message_record.market_wide_circuit_breaker_reason_code[market_wide_circuit_breaker_event_message_at] = (market_wide_circuit_breaker_event_message_base + 57 + market_wide_circuit_breaker_event_message_at + 1) % 256; market_wide_circuit_breaker_event_message_at = market_wide_circuit_breaker_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Wide Circuit Breaker Event Message to the wire, 63 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_record) {
  encode_message_header(market_wide_circuit_breaker_event_message_record.message_header);
  wire[at] = market_wide_circuit_breaker_event_message_record.action; at = at + 1;
  encode_action_datetime(market_wide_circuit_breaker_event_message_record.action_datetime);
  market_wide_circuit_breaker_event_message_at = 0;
  do
  :: market_wide_circuit_breaker_event_message_at < 6 -> wire[at] = market_wide_circuit_breaker_event_message_record.market_wide_circuit_breaker_reason_code[market_wide_circuit_breaker_event_message_at]; at = at + 1; market_wide_circuit_breaker_event_message_at = market_wide_circuit_breaker_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Wide Circuit Breaker Event Message off the wire, 63 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_record) {
  decode_message_header(market_wide_circuit_breaker_event_message_record.message_header);
  market_wide_circuit_breaker_event_message_record.action = wire[at]; at = at + 1;
  decode_action_datetime(market_wide_circuit_breaker_event_message_record.action_datetime);
  market_wide_circuit_breaker_event_message_at = 0;
  do
  :: market_wide_circuit_breaker_event_message_at < 6 -> market_wide_circuit_breaker_event_message_record.market_wide_circuit_breaker_reason_code[market_wide_circuit_breaker_event_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_event_message_at = market_wide_circuit_breaker_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Wide Circuit Breaker Event Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_read, market_wide_circuit_breaker_event_message_written) {
  equal_message_header(market_wide_circuit_breaker_event_message_read.message_header, market_wide_circuit_breaker_event_message_written.message_header);
  assert(market_wide_circuit_breaker_event_message_read.action == market_wide_circuit_breaker_event_message_written.action);
  equal_action_datetime(market_wide_circuit_breaker_event_message_read.action_datetime, market_wide_circuit_breaker_event_message_written.action_datetime);
  market_wide_circuit_breaker_event_message_at = 0;
  do
  :: market_wide_circuit_breaker_event_message_at < 6 -> assert(market_wide_circuit_breaker_event_message_read.market_wide_circuit_breaker_reason_code[market_wide_circuit_breaker_event_message_at] == market_wide_circuit_breaker_event_message_written.market_wide_circuit_breaker_reason_code[market_wide_circuit_breaker_event_message_at]); market_wide_circuit_breaker_event_message_at = market_wide_circuit_breaker_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Day Message: 33 bytes ------------------------------------------ */

/* The Start of Day control message signifies the beginning of each operational cycle for TDDS processing */
typedef StartOfDayMessage {
  MessageHeader message_header
};

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  fill_message_header(start_of_day_message_record.message_header, start_of_day_message_value);
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  ramp_message_header(start_of_day_message_record.message_header, start_of_day_message_base + 0);
  skip
}

/* Start Of Day Message to the wire, 33 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  encode_message_header(start_of_day_message_record.message_header);
  skip
}

/* Start Of Day Message off the wire, 33 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  decode_message_header(start_of_day_message_record.message_header);
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  equal_message_header(start_of_day_message_read.message_header, start_of_day_message_written.message_header);
  skip
}

/* ---- End Of Day Message: 33 bytes -------------------------------------------- */

/* The End of Day control message signals the end of active message dissemination for the TDDS operational cycle */
typedef EndOfDayMessage {
  MessageHeader message_header
};

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  fill_message_header(end_of_day_message_record.message_header, end_of_day_message_value);
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  ramp_message_header(end_of_day_message_record.message_header, end_of_day_message_base + 0);
  skip
}

/* End Of Day Message to the wire, 33 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  encode_message_header(end_of_day_message_record.message_header);
  skip
}

/* End Of Day Message off the wire, 33 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  decode_message_header(end_of_day_message_record.message_header);
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  equal_message_header(end_of_day_message_read.message_header, end_of_day_message_written.message_header);
  skip
}

/* ---- Market Session Open Message: 33 bytes ----------------------------------- */

/* The Market Session Open Control Message signifies the opening of FINRA’s market systems for the session indicated in the Message Header */
typedef MarketSessionOpenMessage {
  MessageHeader message_header
};

/* every byte of Market Session Open Message set to one value */
inline fill_market_session_open_message(market_session_open_message_record, market_session_open_message_value) {
  fill_message_header(market_session_open_message_record.message_header, market_session_open_message_value);
  skip
}

/* each byte of Market Session Open Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_open_message(market_session_open_message_record, market_session_open_message_base) {
  ramp_message_header(market_session_open_message_record.message_header, market_session_open_message_base + 0);
  skip
}

/* Market Session Open Message to the wire, 33 bytes from where the cursor stands */
inline encode_market_session_open_message(market_session_open_message_record) {
  encode_message_header(market_session_open_message_record.message_header);
  skip
}

/* Market Session Open Message off the wire, 33 bytes from where the cursor stands */
inline decode_market_session_open_message(market_session_open_message_record) {
  decode_message_header(market_session_open_message_record.message_header);
  skip
}

/* what was read of Market Session Open Message is what was written, byte for byte */
inline equal_market_session_open_message(market_session_open_message_read, market_session_open_message_written) {
  equal_message_header(market_session_open_message_read.message_header, market_session_open_message_written.message_header);
  skip
}

/* ---- Market Session Close Message: 33 bytes ---------------------------------- */

/* The Session Close Control Message signals the closing of FINRA’s market systems for the session indicated in the Message Header */
typedef MarketSessionCloseMessage {
  MessageHeader message_header
};

/* every byte of Market Session Close Message set to one value */
inline fill_market_session_close_message(market_session_close_message_record, market_session_close_message_value) {
  fill_message_header(market_session_close_message_record.message_header, market_session_close_message_value);
  skip
}

/* each byte of Market Session Close Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_close_message(market_session_close_message_record, market_session_close_message_base) {
  ramp_message_header(market_session_close_message_record.message_header, market_session_close_message_base + 0);
  skip
}

/* Market Session Close Message to the wire, 33 bytes from where the cursor stands */
inline encode_market_session_close_message(market_session_close_message_record) {
  encode_message_header(market_session_close_message_record.message_header);
  skip
}

/* Market Session Close Message off the wire, 33 bytes from where the cursor stands */
inline decode_market_session_close_message(market_session_close_message_record) {
  decode_message_header(market_session_close_message_record.message_header);
  skip
}

/* what was read of Market Session Close Message is what was written, byte for byte */
inline equal_market_session_close_message(market_session_close_message_read, market_session_close_message_written) {
  equal_message_header(market_session_close_message_read.message_header, market_session_close_message_written.message_header);
  skip
}

/* ---- End Of Retransmission Requests Message: 33 bytes ------------------------ */

/* This message signals that no further retransmission requests will be honored. The End of Retransmission Requests message will be sent three times, at one-minute intervals */
typedef EndOfRetransmissionRequestsMessage {
  MessageHeader message_header
};

/* every byte of End Of Retransmission Requests Message set to one value */
inline fill_end_of_retransmission_requests_message(end_of_retransmission_requests_message_record, end_of_retransmission_requests_message_value) {
  fill_message_header(end_of_retransmission_requests_message_record.message_header, end_of_retransmission_requests_message_value);
  skip
}

/* each byte of End Of Retransmission Requests Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_retransmission_requests_message(end_of_retransmission_requests_message_record, end_of_retransmission_requests_message_base) {
  ramp_message_header(end_of_retransmission_requests_message_record.message_header, end_of_retransmission_requests_message_base + 0);
  skip
}

/* End Of Retransmission Requests Message to the wire, 33 bytes from where the cursor stands */
inline encode_end_of_retransmission_requests_message(end_of_retransmission_requests_message_record) {
  encode_message_header(end_of_retransmission_requests_message_record.message_header);
  skip
}

/* End Of Retransmission Requests Message off the wire, 33 bytes from where the cursor stands */
inline decode_end_of_retransmission_requests_message(end_of_retransmission_requests_message_record) {
  decode_message_header(end_of_retransmission_requests_message_record.message_header);
  skip
}

/* what was read of End Of Retransmission Requests Message is what was written, byte for byte */
inline equal_end_of_retransmission_requests_message(end_of_retransmission_requests_message_read, end_of_retransmission_requests_message_written) {
  equal_message_header(end_of_retransmission_requests_message_read.message_header, end_of_retransmission_requests_message_written.message_header);
  skip
}

/* ---- End Of Transmissions Message: 33 bytes ---------------------------------- */

/* The End of Transmissions Message signals that there will be no further transmissions of data sent through the TDDS line. */
typedef EndOfTransmissionsMessage {
  MessageHeader message_header
};

/* every byte of End Of Transmissions Message set to one value */
inline fill_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_value) {
  fill_message_header(end_of_transmissions_message_record.message_header, end_of_transmissions_message_value);
  skip
}

/* each byte of End Of Transmissions Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_base) {
  ramp_message_header(end_of_transmissions_message_record.message_header, end_of_transmissions_message_base + 0);
  skip
}

/* End Of Transmissions Message to the wire, 33 bytes from where the cursor stands */
inline encode_end_of_transmissions_message(end_of_transmissions_message_record) {
  encode_message_header(end_of_transmissions_message_record.message_header);
  skip
}

/* End Of Transmissions Message off the wire, 33 bytes from where the cursor stands */
inline decode_end_of_transmissions_message(end_of_transmissions_message_record) {
  decode_message_header(end_of_transmissions_message_record.message_header);
  skip
}

/* what was read of End Of Transmissions Message is what was written, byte for byte */
inline equal_end_of_transmissions_message(end_of_transmissions_message_read, end_of_transmissions_message_written) {
  equal_message_header(end_of_transmissions_message_read.message_header, end_of_transmissions_message_written.message_header);
  skip
}

/* ---- Line Integrity Message: 33 bytes ---------------------------------------- */

/* The Line Integrity Control Message will be transmitted at approximately one-minute intervals to verify the operational integrity of the TDDS message transmission, and will be intermixed with other messages */
typedef LineIntegrityMessage {
  MessageHeader message_header
};

/* every byte of Line Integrity Message set to one value */
inline fill_line_integrity_message(line_integrity_message_record, line_integrity_message_value) {
  fill_message_header(line_integrity_message_record.message_header, line_integrity_message_value);
  skip
}

/* each byte of Line Integrity Message set to where it lies, so a field read out of place says so */
inline ramp_line_integrity_message(line_integrity_message_record, line_integrity_message_base) {
  ramp_message_header(line_integrity_message_record.message_header, line_integrity_message_base + 0);
  skip
}

/* Line Integrity Message to the wire, 33 bytes from where the cursor stands */
inline encode_line_integrity_message(line_integrity_message_record) {
  encode_message_header(line_integrity_message_record.message_header);
  skip
}

/* Line Integrity Message off the wire, 33 bytes from where the cursor stands */
inline decode_line_integrity_message(line_integrity_message_record) {
  decode_message_header(line_integrity_message_record.message_header);
  skip
}

/* what was read of Line Integrity Message is what was written, byte for byte */
inline equal_line_integrity_message(line_integrity_message_read, line_integrity_message_written) {
  equal_message_header(line_integrity_message_read.message_header, line_integrity_message_written.message_header);
  skip
}

/* ---- Sequence Number Reset Message: 33 bytes --------------------------------- */

/* The Sequence Number Reset Message forces the resetting of the Sequence Number. The Sequence Number will either be reset to zero or to a number greater than the last number previously transmitted */
typedef SequenceNumberResetMessage {
  MessageHeader message_header
};

/* every byte of Sequence Number Reset Message set to one value */
inline fill_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_value) {
  fill_message_header(sequence_number_reset_message_record.message_header, sequence_number_reset_message_value);
  skip
}

/* each byte of Sequence Number Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_base) {
  ramp_message_header(sequence_number_reset_message_record.message_header, sequence_number_reset_message_base + 0);
  skip
}

/* Sequence Number Reset Message to the wire, 33 bytes from where the cursor stands */
inline encode_sequence_number_reset_message(sequence_number_reset_message_record) {
  encode_message_header(sequence_number_reset_message_record.message_header);
  skip
}

/* Sequence Number Reset Message off the wire, 33 bytes from where the cursor stands */
inline decode_sequence_number_reset_message(sequence_number_reset_message_record) {
  decode_message_header(sequence_number_reset_message_record.message_header);
  skip
}

/* what was read of Sequence Number Reset Message is what was written, byte for byte */
inline equal_sequence_number_reset_message(sequence_number_reset_message_read, sequence_number_reset_message_written) {
  equal_message_header(sequence_number_reset_message_read.message_header, sequence_number_reset_message_written.message_header);
  skip
}

/* ---- End Of Trade Reporting Message: 33 bytes -------------------------------- */

/* The End of Trade Reporting Control Message signals that the ORF system is closed for market participant trade transactions */
typedef EndOfTradeReportingMessage {
  MessageHeader message_header
};

/* every byte of End Of Trade Reporting Message set to one value */
inline fill_end_of_trade_reporting_message(end_of_trade_reporting_message_record, end_of_trade_reporting_message_value) {
  fill_message_header(end_of_trade_reporting_message_record.message_header, end_of_trade_reporting_message_value);
  skip
}

/* each byte of End Of Trade Reporting Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_trade_reporting_message(end_of_trade_reporting_message_record, end_of_trade_reporting_message_base) {
  ramp_message_header(end_of_trade_reporting_message_record.message_header, end_of_trade_reporting_message_base + 0);
  skip
}

/* End Of Trade Reporting Message to the wire, 33 bytes from where the cursor stands */
inline encode_end_of_trade_reporting_message(end_of_trade_reporting_message_record) {
  encode_message_header(end_of_trade_reporting_message_record.message_header);
  skip
}

/* End Of Trade Reporting Message off the wire, 33 bytes from where the cursor stands */
inline decode_end_of_trade_reporting_message(end_of_trade_reporting_message_record) {
  decode_message_header(end_of_trade_reporting_message_record.message_header);
  skip
}

/* what was read of End Of Trade Reporting Message is what was written, byte for byte */
inline equal_end_of_trade_reporting_message(end_of_trade_reporting_message_read, end_of_trade_reporting_message_written) {
  equal_message_header(end_of_trade_reporting_message_read.message_header, end_of_trade_reporting_message_written.message_header);
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

/* Mold Udp64: encoded, read back, and compared */
proctype check_mold_udp64() {
  MoldUdp64 mold_udp64_sent;
  MoldUdp64 mold_udp64_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mold_udp64(mold_udp64_sent, 0)
  :: pattern == 1 -> fill_mold_udp64(mold_udp64_sent, 32)
  :: pattern == 2 -> fill_mold_udp64(mold_udp64_sent, 255)
  :: else -> ramp_mold_udp64(mold_udp64_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mold_udp64(mold_udp64_sent);
    assert(at == 3);
    at = 0;
    decode_mold_udp64(mold_udp64_got);
    assert(at == 3);
    equal_mold_udp64(mold_udp64_got, mold_udp64_sent)
  }
}

/* Datetime: encoded, read back, and compared */
proctype check_datetime() {
  Datetime datetime_sent;
  Datetime datetime_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_datetime(datetime_sent, 0)
  :: pattern == 1 -> fill_datetime(datetime_sent, 32)
  :: pattern == 2 -> fill_datetime(datetime_sent, 255)
  :: else -> ramp_datetime(datetime_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_datetime(datetime_sent);
    assert(at == 23);
    at = 0;
    decode_datetime(datetime_got);
    assert(at == 23);
    equal_datetime(datetime_got, datetime_sent)
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
    assert(at == 33);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 33);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Trade Report Short Form Message: encoded, read back, and compared */
proctype check_trade_report_short_form_message() {
  TradeReportShortFormMessage trade_report_short_form_message_sent;
  TradeReportShortFormMessage trade_report_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_short_form_message(trade_report_short_form_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_short_form_message(trade_report_short_form_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_short_form_message(trade_report_short_form_message_sent, 255)
  :: else -> ramp_trade_report_short_form_message(trade_report_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_short_form_message(trade_report_short_form_message_sent);
    assert(at == 53);
    at = 0;
    decode_trade_report_short_form_message(trade_report_short_form_message_got);
    assert(at == 53);
    equal_trade_report_short_form_message(trade_report_short_form_message_got, trade_report_short_form_message_sent)
  }
}

/* Original Dissemination Date: encoded, read back, and compared */
proctype check_original_dissemination_date() {
  OriginalDisseminationDate original_dissemination_date_sent;
  OriginalDisseminationDate original_dissemination_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_original_dissemination_date(original_dissemination_date_sent, 0)
  :: pattern == 1 -> fill_original_dissemination_date(original_dissemination_date_sent, 32)
  :: pattern == 2 -> fill_original_dissemination_date(original_dissemination_date_sent, 255)
  :: else -> ramp_original_dissemination_date(original_dissemination_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_original_dissemination_date(original_dissemination_date_sent);
    assert(at == 8);
    at = 0;
    decode_original_dissemination_date(original_dissemination_date_got);
    assert(at == 8);
    equal_original_dissemination_date(original_dissemination_date_got, original_dissemination_date_sent)
  }
}

/* Execution Datetime: encoded, read back, and compared */
proctype check_execution_datetime() {
  ExecutionDatetime execution_datetime_sent;
  ExecutionDatetime execution_datetime_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_datetime(execution_datetime_sent, 0)
  :: pattern == 1 -> fill_execution_datetime(execution_datetime_sent, 32)
  :: pattern == 2 -> fill_execution_datetime(execution_datetime_sent, 255)
  :: else -> ramp_execution_datetime(execution_datetime_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_datetime(execution_datetime_sent);
    assert(at == 23);
    at = 0;
    decode_execution_datetime(execution_datetime_got);
    assert(at == 23);
    equal_execution_datetime(execution_datetime_got, execution_datetime_sent)
  }
}

/* Trade Information: encoded, read back, and compared */
proctype check_trade_information() {
  TradeInformation trade_information_sent;
  TradeInformation trade_information_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_information(trade_information_sent, 0)
  :: pattern == 1 -> fill_trade_information(trade_information_sent, 32)
  :: pattern == 2 -> fill_trade_information(trade_information_sent, 255)
  :: else -> ramp_trade_information(trade_information_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_information(trade_information_sent);
    assert(at == 55);
    at = 0;
    decode_trade_information(trade_information_got);
    assert(at == 55);
    equal_trade_information(trade_information_got, trade_information_sent)
  }
}

/* Trade Report Long Form Message: encoded, read back, and compared */
proctype check_trade_report_long_form_message() {
  TradeReportLongFormMessage trade_report_long_form_message_sent;
  TradeReportLongFormMessage trade_report_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_long_form_message(trade_report_long_form_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_long_form_message(trade_report_long_form_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_long_form_message(trade_report_long_form_message_sent, 255)
  :: else -> ramp_trade_report_long_form_message(trade_report_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_long_form_message(trade_report_long_form_message_sent);
    assert(at == 110);
    at = 0;
    decode_trade_report_long_form_message(trade_report_long_form_message_got);
    assert(at == 110);
    equal_trade_report_long_form_message(trade_report_long_form_message_got, trade_report_long_form_message_sent)
  }
}

/* Original Trade Information: encoded, read back, and compared */
proctype check_original_trade_information() {
  OriginalTradeInformation original_trade_information_sent;
  OriginalTradeInformation original_trade_information_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_original_trade_information(original_trade_information_sent, 0)
  :: pattern == 1 -> fill_original_trade_information(original_trade_information_sent, 32)
  :: pattern == 2 -> fill_original_trade_information(original_trade_information_sent, 255)
  :: else -> ramp_original_trade_information(original_trade_information_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_original_trade_information(original_trade_information_sent);
    assert(at == 54);
    at = 0;
    decode_original_trade_information(original_trade_information_got);
    assert(at == 54);
    equal_original_trade_information(original_trade_information_got, original_trade_information_sent)
  }
}

/* Trade Summary Information: encoded, read back, and compared */
proctype check_trade_summary_information() {
  TradeSummaryInformation trade_summary_information_sent;
  TradeSummaryInformation trade_summary_information_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_summary_information(trade_summary_information_sent, 0)
  :: pattern == 1 -> fill_trade_summary_information(trade_summary_information_sent, 32)
  :: pattern == 2 -> fill_trade_summary_information(trade_summary_information_sent, 255)
  :: else -> ramp_trade_summary_information(trade_summary_information_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_summary_information(trade_summary_information_sent);
    assert(at == 52);
    at = 0;
    decode_trade_summary_information(trade_summary_information_got);
    assert(at == 52);
    equal_trade_summary_information(trade_summary_information_got, trade_summary_information_sent)
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
    assert(at == 162);
    at = 0;
    decode_trade_cancel_error_message(trade_cancel_error_message_got);
    assert(at == 162);
    equal_trade_cancel_error_message(trade_cancel_error_message_got, trade_cancel_error_message_sent)
  }
}

/* Corrected Trade Information: encoded, read back, and compared */
proctype check_corrected_trade_information() {
  CorrectedTradeInformation corrected_trade_information_sent;
  CorrectedTradeInformation corrected_trade_information_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_corrected_trade_information(corrected_trade_information_sent, 0)
  :: pattern == 1 -> fill_corrected_trade_information(corrected_trade_information_sent, 32)
  :: pattern == 2 -> fill_corrected_trade_information(corrected_trade_information_sent, 255)
  :: else -> ramp_corrected_trade_information(corrected_trade_information_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_corrected_trade_information(corrected_trade_information_sent);
    assert(at == 54);
    at = 0;
    decode_corrected_trade_information(corrected_trade_information_got);
    assert(at == 54);
    equal_corrected_trade_information(corrected_trade_information_got, corrected_trade_information_sent)
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
    assert(at == 216);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 216);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Closing Trade Summary Report Message: encoded, read back, and compared */
proctype check_closing_trade_summary_report_message() {
  ClosingTradeSummaryReportMessage closing_trade_summary_report_message_sent;
  ClosingTradeSummaryReportMessage closing_trade_summary_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_closing_trade_summary_report_message(closing_trade_summary_report_message_sent, 0)
  :: pattern == 1 -> fill_closing_trade_summary_report_message(closing_trade_summary_report_message_sent, 32)
  :: pattern == 2 -> fill_closing_trade_summary_report_message(closing_trade_summary_report_message_sent, 255)
  :: else -> ramp_closing_trade_summary_report_message(closing_trade_summary_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_closing_trade_summary_report_message(closing_trade_summary_report_message_sent);
    assert(at == 114);
    at = 0;
    decode_closing_trade_summary_report_message(closing_trade_summary_report_message_got);
    assert(at == 114);
    equal_closing_trade_summary_report_message(closing_trade_summary_report_message_got, closing_trade_summary_report_message_sent)
  }
}

/* Action Datetime: encoded, read back, and compared */
proctype check_action_datetime() {
  ActionDatetime action_datetime_sent;
  ActionDatetime action_datetime_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_action_datetime(action_datetime_sent, 0)
  :: pattern == 1 -> fill_action_datetime(action_datetime_sent, 32)
  :: pattern == 2 -> fill_action_datetime(action_datetime_sent, 255)
  :: else -> ramp_action_datetime(action_datetime_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_action_datetime(action_datetime_sent);
    assert(at == 23);
    at = 0;
    decode_action_datetime(action_datetime_got);
    assert(at == 23);
    equal_action_datetime(action_datetime_got, action_datetime_sent)
  }
}

/* Trading Action Message: encoded, read back, and compared */
proctype check_trading_action_message() {
  TradingActionMessage trading_action_message_sent;
  TradingActionMessage trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_action_message(trading_action_message_sent, 0)
  :: pattern == 1 -> fill_trading_action_message(trading_action_message_sent, 32)
  :: pattern == 2 -> fill_trading_action_message(trading_action_message_sent, 255)
  :: else -> ramp_trading_action_message(trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_action_message(trading_action_message_sent);
    assert(at == 77);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 77);
    equal_trading_action_message(trading_action_message_got, trading_action_message_sent)
  }
}

/* Market Wide Circuit Breaker Event Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_event_message() {
  MarketWideCircuitBreakerEventMessage market_wide_circuit_breaker_event_message_sent;
  MarketWideCircuitBreakerEventMessage market_wide_circuit_breaker_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_sent);
    assert(at == 63);
    at = 0;
    decode_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_got);
    assert(at == 63);
    equal_market_wide_circuit_breaker_event_message(market_wide_circuit_breaker_event_message_got, market_wide_circuit_breaker_event_message_sent)
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
    assert(at == 33);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 33);
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
    assert(at == 33);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 33);
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
    assert(at == 33);
    at = 0;
    decode_market_session_open_message(market_session_open_message_got);
    assert(at == 33);
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
    assert(at == 33);
    at = 0;
    decode_market_session_close_message(market_session_close_message_got);
    assert(at == 33);
    equal_market_session_close_message(market_session_close_message_got, market_session_close_message_sent)
  }
}

/* End Of Retransmission Requests Message: encoded, read back, and compared */
proctype check_end_of_retransmission_requests_message() {
  EndOfRetransmissionRequestsMessage end_of_retransmission_requests_message_sent;
  EndOfRetransmissionRequestsMessage end_of_retransmission_requests_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent, 0)
  :: pattern == 1 -> fill_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent, 32)
  :: pattern == 2 -> fill_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent, 255)
  :: else -> ramp_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent);
    assert(at == 33);
    at = 0;
    decode_end_of_retransmission_requests_message(end_of_retransmission_requests_message_got);
    assert(at == 33);
    equal_end_of_retransmission_requests_message(end_of_retransmission_requests_message_got, end_of_retransmission_requests_message_sent)
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
    assert(at == 33);
    at = 0;
    decode_end_of_transmissions_message(end_of_transmissions_message_got);
    assert(at == 33);
    equal_end_of_transmissions_message(end_of_transmissions_message_got, end_of_transmissions_message_sent)
  }
}

/* Line Integrity Message: encoded, read back, and compared */
proctype check_line_integrity_message() {
  LineIntegrityMessage line_integrity_message_sent;
  LineIntegrityMessage line_integrity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_line_integrity_message(line_integrity_message_sent, 0)
  :: pattern == 1 -> fill_line_integrity_message(line_integrity_message_sent, 32)
  :: pattern == 2 -> fill_line_integrity_message(line_integrity_message_sent, 255)
  :: else -> ramp_line_integrity_message(line_integrity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_line_integrity_message(line_integrity_message_sent);
    assert(at == 33);
    at = 0;
    decode_line_integrity_message(line_integrity_message_got);
    assert(at == 33);
    equal_line_integrity_message(line_integrity_message_got, line_integrity_message_sent)
  }
}

/* Sequence Number Reset Message: encoded, read back, and compared */
proctype check_sequence_number_reset_message() {
  SequenceNumberResetMessage sequence_number_reset_message_sent;
  SequenceNumberResetMessage sequence_number_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 255)
  :: else -> ramp_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_number_reset_message(sequence_number_reset_message_sent);
    assert(at == 33);
    at = 0;
    decode_sequence_number_reset_message(sequence_number_reset_message_got);
    assert(at == 33);
    equal_sequence_number_reset_message(sequence_number_reset_message_got, sequence_number_reset_message_sent)
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
    assert(at == 33);
    at = 0;
    decode_end_of_trade_reporting_message(end_of_trade_reporting_message_got);
    assert(at == 33);
    equal_end_of_trade_reporting_message(end_of_trade_reporting_message_got, end_of_trade_reporting_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_mold_udp64()
  :: run check_datetime()
  :: run check_message_header()
  :: run check_trade_report_short_form_message()
  :: run check_original_dissemination_date()
  :: run check_execution_datetime()
  :: run check_trade_information()
  :: run check_trade_report_long_form_message()
  :: run check_original_trade_information()
  :: run check_trade_summary_information()
  :: run check_trade_cancel_error_message()
  :: run check_corrected_trade_information()
  :: run check_trade_correction_message()
  :: run check_closing_trade_summary_report_message()
  :: run check_action_datetime()
  :: run check_trading_action_message()
  :: run check_market_wide_circuit_breaker_event_message()
  :: run check_start_of_day_message()
  :: run check_end_of_day_message()
  :: run check_market_session_open_message()
  :: run check_market_session_close_message()
  :: run check_end_of_retransmission_requests_message()
  :: run check_end_of_transmissions_message()
  :: run check_line_integrity_message()
  :: run check_sequence_number_reset_message()
  :: run check_end_of_trade_reporting_message()
  fi
}
