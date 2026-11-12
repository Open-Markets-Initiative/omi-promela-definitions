/*
 * Financial Industry Regulatory Authority Securitized Products Dissemination Service for 144A Transactions
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
#define WIRE 254

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

/* ---- Datetime: 14 bytes ------------------------------------------------------ */

/* Datetime */
typedef Datetime {
  byte year[4];
  byte month[2];
  byte day[2];
  byte hour[2];
  byte minute[2];
  byte second[2]
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
  skip
}

/* Datetime to the wire, 14 bytes from where the cursor stands */
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
  skip
}

/* Datetime off the wire, 14 bytes from where the cursor stands */
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
  skip
}

/* ---- Message Header: 22 bytes ------------------------------------------------ */

/* Message Header */
typedef MessageHeader {
  byte trade_identifier[7];
  byte market_center_originator_id;
  Datetime datetime
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 7 -> message_header_record.trade_identifier[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.market_center_originator_id = message_header_value;
  fill_datetime(message_header_record.datetime, message_header_value);
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 7 -> message_header_record.trade_identifier[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.market_center_originator_id = (message_header_base + 7 + 1) % 256;
  ramp_datetime(message_header_record.datetime, message_header_base + 8);
  skip
}

/* Message Header to the wire, 22 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 7 -> wire[at] = message_header_record.trade_identifier[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.market_center_originator_id; at = at + 1;
  encode_datetime(message_header_record.datetime);
  skip
}

/* Message Header off the wire, 22 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 7 -> message_header_record.trade_identifier[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.market_center_originator_id = wire[at]; at = at + 1;
  decode_datetime(message_header_record.datetime);
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 7 -> assert(message_header_read.trade_identifier[message_header_at] == message_header_written.trade_identifier[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.market_center_originator_id == message_header_written.market_center_originator_id);
  equal_datetime(message_header_read.datetime, message_header_written.datetime);
  skip
}

/* ---- Label: 40 bytes --------------------------------------------------------- */

/* Label */
typedef Label {
  byte symbol[14];
  byte cusip[9];
  byte bsym[12];
  byte sub_product_type[5]
};

int label_at;

/* every byte of Label set to one value */
inline fill_label(label_record, label_value) {
  label_at = 0;
  do
  :: label_at < 14 -> label_record.symbol[label_at] = label_value; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 9 -> label_record.cusip[label_at] = label_value; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 12 -> label_record.bsym[label_at] = label_value; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 5 -> label_record.sub_product_type[label_at] = label_value; label_at = label_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Label set to where it lies, so a field read out of place says so */
inline ramp_label(label_record, label_base) {
  label_at = 0;
  do
  :: label_at < 14 -> label_record.symbol[label_at] = (label_base + 0 + label_at + 1) % 256; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 9 -> label_record.cusip[label_at] = (label_base + 14 + label_at + 1) % 256; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 12 -> label_record.bsym[label_at] = (label_base + 23 + label_at + 1) % 256; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 5 -> label_record.sub_product_type[label_at] = (label_base + 35 + label_at + 1) % 256; label_at = label_at + 1
  :: else -> break
  od;
  skip
}

/* Label to the wire, 40 bytes from where the cursor stands */
inline encode_label(label_record) {
  label_at = 0;
  do
  :: label_at < 14 -> wire[at] = label_record.symbol[label_at]; at = at + 1; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 9 -> wire[at] = label_record.cusip[label_at]; at = at + 1; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 12 -> wire[at] = label_record.bsym[label_at]; at = at + 1; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 5 -> wire[at] = label_record.sub_product_type[label_at]; at = at + 1; label_at = label_at + 1
  :: else -> break
  od;
  skip
}

/* Label off the wire, 40 bytes from where the cursor stands */
inline decode_label(label_record) {
  label_at = 0;
  do
  :: label_at < 14 -> label_record.symbol[label_at] = wire[at]; at = at + 1; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 9 -> label_record.cusip[label_at] = wire[at]; at = at + 1; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 12 -> label_record.bsym[label_at] = wire[at]; at = at + 1; label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 5 -> label_record.sub_product_type[label_at] = wire[at]; at = at + 1; label_at = label_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Label is what was written, byte for byte */
inline equal_label(label_read, label_written) {
  label_at = 0;
  do
  :: label_at < 14 -> assert(label_read.symbol[label_at] == label_written.symbol[label_at]); label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 9 -> assert(label_read.cusip[label_at] == label_written.cusip[label_at]); label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 12 -> assert(label_read.bsym[label_at] == label_written.bsym[label_at]); label_at = label_at + 1
  :: else -> break
  od;
  label_at = 0;
  do
  :: label_at < 5 -> assert(label_read.sub_product_type[label_at] == label_written.sub_product_type[label_at]); label_at = label_at + 1
  :: else -> break
  od;
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

/* ---- Execution Datetime: 14 bytes -------------------------------------------- */

/* Execution Datetime */
typedef ExecutionDatetime {
  byte year[4];
  byte month[2];
  byte day[2];
  byte hour[2];
  byte minute[2];
  byte second[2]
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
  skip
}

/* Execution Datetime to the wire, 14 bytes from where the cursor stands */
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
  skip
}

/* Execution Datetime off the wire, 14 bytes from where the cursor stands */
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
  skip
}

/* ---- Settlement Date: 8 bytes ------------------------------------------------ */

/* Settlement Date */
typedef SettlementDate {
  byte year[4];
  byte month[2];
  byte day[2]
};

int settlement_date_at;

/* every byte of Settlement Date set to one value */
inline fill_settlement_date(settlement_date_record, settlement_date_value) {
  settlement_date_at = 0;
  do
  :: settlement_date_at < 4 -> settlement_date_record.year[settlement_date_at] = settlement_date_value; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> settlement_date_record.month[settlement_date_at] = settlement_date_value; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> settlement_date_record.day[settlement_date_at] = settlement_date_value; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Settlement Date set to where it lies, so a field read out of place says so */
inline ramp_settlement_date(settlement_date_record, settlement_date_base) {
  settlement_date_at = 0;
  do
  :: settlement_date_at < 4 -> settlement_date_record.year[settlement_date_at] = (settlement_date_base + 0 + settlement_date_at + 1) % 256; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> settlement_date_record.month[settlement_date_at] = (settlement_date_base + 4 + settlement_date_at + 1) % 256; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> settlement_date_record.day[settlement_date_at] = (settlement_date_base + 6 + settlement_date_at + 1) % 256; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  skip
}

/* Settlement Date to the wire, 8 bytes from where the cursor stands */
inline encode_settlement_date(settlement_date_record) {
  settlement_date_at = 0;
  do
  :: settlement_date_at < 4 -> wire[at] = settlement_date_record.year[settlement_date_at]; at = at + 1; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> wire[at] = settlement_date_record.month[settlement_date_at]; at = at + 1; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> wire[at] = settlement_date_record.day[settlement_date_at]; at = at + 1; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  skip
}

/* Settlement Date off the wire, 8 bytes from where the cursor stands */
inline decode_settlement_date(settlement_date_record) {
  settlement_date_at = 0;
  do
  :: settlement_date_at < 4 -> settlement_date_record.year[settlement_date_at] = wire[at]; at = at + 1; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> settlement_date_record.month[settlement_date_at] = wire[at]; at = at + 1; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> settlement_date_record.day[settlement_date_at] = wire[at]; at = at + 1; settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Settlement Date is what was written, byte for byte */
inline equal_settlement_date(settlement_date_read, settlement_date_written) {
  settlement_date_at = 0;
  do
  :: settlement_date_at < 4 -> assert(settlement_date_read.year[settlement_date_at] == settlement_date_written.year[settlement_date_at]); settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> assert(settlement_date_read.month[settlement_date_at] == settlement_date_written.month[settlement_date_at]); settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  settlement_date_at = 0;
  do
  :: settlement_date_at < 2 -> assert(settlement_date_read.day[settlement_date_at] == settlement_date_written.day[settlement_date_at]); settlement_date_at = settlement_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Information: 71 bytes --------------------------------------------- */

/* Trade Information */
typedef TradeInformation {
  byte quantity_indicator;
  byte quantity[14];
  byte price[11];
  byte remuneration;
  byte special_price_indicator;
  byte side;
  byte as_of_indicator;
  ExecutionDatetime execution_datetime;
  byte future_use[2];
  byte sale_condition_3;
  byte sale_condition_4;
  SettlementDate settlement_date;
  byte factor[12];
  byte reporting_party_type;
  byte contra_party_type;
  byte ats_indicator
};

int trade_information_at;

/* every byte of Trade Information set to one value */
inline fill_trade_information(trade_information_record, trade_information_value) {
  trade_information_record.quantity_indicator = trade_information_value;
  trade_information_at = 0;
  do
  :: trade_information_at < 14 -> trade_information_record.quantity[trade_information_at] = trade_information_value; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 11 -> trade_information_record.price[trade_information_at] = trade_information_value; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.remuneration = trade_information_value;
  trade_information_record.special_price_indicator = trade_information_value;
  trade_information_record.side = trade_information_value;
  trade_information_record.as_of_indicator = trade_information_value;
  fill_execution_datetime(trade_information_record.execution_datetime, trade_information_value);
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> trade_information_record.future_use[trade_information_at] = trade_information_value; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.sale_condition_3 = trade_information_value;
  trade_information_record.sale_condition_4 = trade_information_value;
  fill_settlement_date(trade_information_record.settlement_date, trade_information_value);
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> trade_information_record.factor[trade_information_at] = trade_information_value; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.reporting_party_type = trade_information_value;
  trade_information_record.contra_party_type = trade_information_value;
  trade_information_record.ats_indicator = trade_information_value;
  skip
}

/* each byte of Trade Information set to where it lies, so a field read out of place says so */
inline ramp_trade_information(trade_information_record, trade_information_base) {
  trade_information_record.quantity_indicator = (trade_information_base + 0 + 1) % 256;
  trade_information_at = 0;
  do
  :: trade_information_at < 14 -> trade_information_record.quantity[trade_information_at] = (trade_information_base + 1 + trade_information_at + 1) % 256; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 11 -> trade_information_record.price[trade_information_at] = (trade_information_base + 15 + trade_information_at + 1) % 256; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.remuneration = (trade_information_base + 26 + 1) % 256;
  trade_information_record.special_price_indicator = (trade_information_base + 27 + 1) % 256;
  trade_information_record.side = (trade_information_base + 28 + 1) % 256;
  trade_information_record.as_of_indicator = (trade_information_base + 29 + 1) % 256;
  ramp_execution_datetime(trade_information_record.execution_datetime, trade_information_base + 30);
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> trade_information_record.future_use[trade_information_at] = (trade_information_base + 44 + trade_information_at + 1) % 256; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.sale_condition_3 = (trade_information_base + 46 + 1) % 256;
  trade_information_record.sale_condition_4 = (trade_information_base + 47 + 1) % 256;
  ramp_settlement_date(trade_information_record.settlement_date, trade_information_base + 48);
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> trade_information_record.factor[trade_information_at] = (trade_information_base + 56 + trade_information_at + 1) % 256; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.reporting_party_type = (trade_information_base + 68 + 1) % 256;
  trade_information_record.contra_party_type = (trade_information_base + 69 + 1) % 256;
  trade_information_record.ats_indicator = (trade_information_base + 70 + 1) % 256;
  skip
}

/* Trade Information to the wire, 71 bytes from where the cursor stands */
inline encode_trade_information(trade_information_record) {
  wire[at] = trade_information_record.quantity_indicator; at = at + 1;
  trade_information_at = 0;
  do
  :: trade_information_at < 14 -> wire[at] = trade_information_record.quantity[trade_information_at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 11 -> wire[at] = trade_information_record.price[trade_information_at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_information_record.remuneration; at = at + 1;
  wire[at] = trade_information_record.special_price_indicator; at = at + 1;
  wire[at] = trade_information_record.side; at = at + 1;
  wire[at] = trade_information_record.as_of_indicator; at = at + 1;
  encode_execution_datetime(trade_information_record.execution_datetime);
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> wire[at] = trade_information_record.future_use[trade_information_at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_information_record.sale_condition_3; at = at + 1;
  wire[at] = trade_information_record.sale_condition_4; at = at + 1;
  encode_settlement_date(trade_information_record.settlement_date);
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> wire[at] = trade_information_record.factor[trade_information_at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_information_record.reporting_party_type; at = at + 1;
  wire[at] = trade_information_record.contra_party_type; at = at + 1;
  wire[at] = trade_information_record.ats_indicator; at = at + 1;
  skip
}

/* Trade Information off the wire, 71 bytes from where the cursor stands */
inline decode_trade_information(trade_information_record) {
  trade_information_record.quantity_indicator = wire[at]; at = at + 1;
  trade_information_at = 0;
  do
  :: trade_information_at < 14 -> trade_information_record.quantity[trade_information_at] = wire[at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 11 -> trade_information_record.price[trade_information_at] = wire[at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.remuneration = wire[at]; at = at + 1;
  trade_information_record.special_price_indicator = wire[at]; at = at + 1;
  trade_information_record.side = wire[at]; at = at + 1;
  trade_information_record.as_of_indicator = wire[at]; at = at + 1;
  decode_execution_datetime(trade_information_record.execution_datetime);
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> trade_information_record.future_use[trade_information_at] = wire[at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.sale_condition_3 = wire[at]; at = at + 1;
  trade_information_record.sale_condition_4 = wire[at]; at = at + 1;
  decode_settlement_date(trade_information_record.settlement_date);
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> trade_information_record.factor[trade_information_at] = wire[at]; at = at + 1; trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_record.reporting_party_type = wire[at]; at = at + 1;
  trade_information_record.contra_party_type = wire[at]; at = at + 1;
  trade_information_record.ats_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Information is what was written, byte for byte */
inline equal_trade_information(trade_information_read, trade_information_written) {
  assert(trade_information_read.quantity_indicator == trade_information_written.quantity_indicator);
  trade_information_at = 0;
  do
  :: trade_information_at < 14 -> assert(trade_information_read.quantity[trade_information_at] == trade_information_written.quantity[trade_information_at]); trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  trade_information_at = 0;
  do
  :: trade_information_at < 11 -> assert(trade_information_read.price[trade_information_at] == trade_information_written.price[trade_information_at]); trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  assert(trade_information_read.remuneration == trade_information_written.remuneration);
  assert(trade_information_read.special_price_indicator == trade_information_written.special_price_indicator);
  assert(trade_information_read.side == trade_information_written.side);
  assert(trade_information_read.as_of_indicator == trade_information_written.as_of_indicator);
  equal_execution_datetime(trade_information_read.execution_datetime, trade_information_written.execution_datetime);
  trade_information_at = 0;
  do
  :: trade_information_at < 2 -> assert(trade_information_read.future_use[trade_information_at] == trade_information_written.future_use[trade_information_at]); trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  assert(trade_information_read.sale_condition_3 == trade_information_written.sale_condition_3);
  assert(trade_information_read.sale_condition_4 == trade_information_written.sale_condition_4);
  equal_settlement_date(trade_information_read.settlement_date, trade_information_written.settlement_date);
  trade_information_at = 0;
  do
  :: trade_information_at < 12 -> assert(trade_information_read.factor[trade_information_at] == trade_information_written.factor[trade_information_at]); trade_information_at = trade_information_at + 1
  :: else -> break
  od;
  assert(trade_information_read.reporting_party_type == trade_information_written.reporting_party_type);
  assert(trade_information_read.contra_party_type == trade_information_written.contra_party_type);
  assert(trade_information_read.ats_indicator == trade_information_written.ats_indicator);
  skip
}

/* ---- Trade Report Message: 142 bytes ----------------------------------------- */

/* Used to transmit trade transaction information for Abs and certain Cmo transactions */
typedef TradeReportMessage {
  MessageHeader message_header;
  Label label;
  OriginalDisseminationDate original_dissemin_b2ojs1;
  TradeInformation trade_information;
  byte change_indicator
};

/* every byte of Trade Report Message set to one value */
inline fill_trade_report_message(trade_report_message_record, trade_report_message_value) {
  fill_message_header(trade_report_message_record.message_header, trade_report_message_value);
  fill_label(trade_report_message_record.label, trade_report_message_value);
  fill_original_dissemination_date(trade_report_message_record.original_dissemin_b2ojs1, trade_report_message_value);
  fill_trade_information(trade_report_message_record.trade_information, trade_report_message_value);
  trade_report_message_record.change_indicator = trade_report_message_value;
  skip
}

/* each byte of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message(trade_report_message_record, trade_report_message_base) {
  ramp_message_header(trade_report_message_record.message_header, trade_report_message_base + 0);
  ramp_label(trade_report_message_record.label, trade_report_message_base + 22);
  ramp_original_dissemination_date(trade_report_message_record.original_dissemin_b2ojs1, trade_report_message_base + 62);
  ramp_trade_information(trade_report_message_record.trade_information, trade_report_message_base + 70);
  trade_report_message_record.change_indicator = (trade_report_message_base + 141 + 1) % 256;
  skip
}

/* Trade Report Message to the wire, 142 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  encode_message_header(trade_report_message_record.message_header);
  encode_label(trade_report_message_record.label);
  encode_original_dissemination_date(trade_report_message_record.original_dissemin_b2ojs1);
  encode_trade_information(trade_report_message_record.trade_information);
  wire[at] = trade_report_message_record.change_indicator; at = at + 1;
  skip
}

/* Trade Report Message off the wire, 142 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  decode_message_header(trade_report_message_record.message_header);
  decode_label(trade_report_message_record.label);
  decode_original_dissemination_date(trade_report_message_record.original_dissemin_b2ojs1);
  decode_trade_information(trade_report_message_record.trade_information);
  trade_report_message_record.change_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Report Message is what was written, byte for byte */
inline equal_trade_report_message(trade_report_message_read, trade_report_message_written) {
  equal_message_header(trade_report_message_read.message_header, trade_report_message_written.message_header);
  equal_label(trade_report_message_read.label, trade_report_message_written.label);
  equal_original_dissemination_date(trade_report_message_read.original_dissemin_b2ojs1, trade_report_message_written.original_dissemin_b2ojs1);
  equal_trade_information(trade_report_message_read.trade_information, trade_report_message_written.trade_information);
  assert(trade_report_message_read.change_indicator == trade_report_message_written.change_indicator);
  skip
}

/* ---- Original Trade Information: 71 bytes ------------------------------------ */

/* Original Trade Information */
typedef OriginalTradeInformation {
  byte quantity_indicator;
  byte quantity[14];
  byte price[11];
  byte remuneration;
  byte special_price_indicator;
  byte side;
  byte as_of_indicator;
  ExecutionDatetime execution_datetime;
  byte future_use[2];
  byte sale_condition_3;
  byte sale_condition_4;
  SettlementDate settlement_date;
  byte factor[12];
  byte reporting_party_type;
  byte contra_party_type;
  byte ats_indicator
};

int original_trade_information_at;

/* every byte of Original Trade Information set to one value */
inline fill_original_trade_information(original_trade_information_record, original_trade_information_value) {
  original_trade_information_record.quantity_indicator = original_trade_information_value;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 14 -> original_trade_information_record.quantity[original_trade_information_at] = original_trade_information_value; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 11 -> original_trade_information_record.price[original_trade_information_at] = original_trade_information_value; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.remuneration = original_trade_information_value;
  original_trade_information_record.special_price_indicator = original_trade_information_value;
  original_trade_information_record.side = original_trade_information_value;
  original_trade_information_record.as_of_indicator = original_trade_information_value;
  fill_execution_datetime(original_trade_information_record.execution_datetime, original_trade_information_value);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> original_trade_information_record.future_use[original_trade_information_at] = original_trade_information_value; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.sale_condition_3 = original_trade_information_value;
  original_trade_information_record.sale_condition_4 = original_trade_information_value;
  fill_settlement_date(original_trade_information_record.settlement_date, original_trade_information_value);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> original_trade_information_record.factor[original_trade_information_at] = original_trade_information_value; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.reporting_party_type = original_trade_information_value;
  original_trade_information_record.contra_party_type = original_trade_information_value;
  original_trade_information_record.ats_indicator = original_trade_information_value;
  skip
}

/* each byte of Original Trade Information set to where it lies, so a field read out of place says so */
inline ramp_original_trade_information(original_trade_information_record, original_trade_information_base) {
  original_trade_information_record.quantity_indicator = (original_trade_information_base + 0 + 1) % 256;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 14 -> original_trade_information_record.quantity[original_trade_information_at] = (original_trade_information_base + 1 + original_trade_information_at + 1) % 256; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 11 -> original_trade_information_record.price[original_trade_information_at] = (original_trade_information_base + 15 + original_trade_information_at + 1) % 256; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.remuneration = (original_trade_information_base + 26 + 1) % 256;
  original_trade_information_record.special_price_indicator = (original_trade_information_base + 27 + 1) % 256;
  original_trade_information_record.side = (original_trade_information_base + 28 + 1) % 256;
  original_trade_information_record.as_of_indicator = (original_trade_information_base + 29 + 1) % 256;
  ramp_execution_datetime(original_trade_information_record.execution_datetime, original_trade_information_base + 30);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> original_trade_information_record.future_use[original_trade_information_at] = (original_trade_information_base + 44 + original_trade_information_at + 1) % 256; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.sale_condition_3 = (original_trade_information_base + 46 + 1) % 256;
  original_trade_information_record.sale_condition_4 = (original_trade_information_base + 47 + 1) % 256;
  ramp_settlement_date(original_trade_information_record.settlement_date, original_trade_information_base + 48);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> original_trade_information_record.factor[original_trade_information_at] = (original_trade_information_base + 56 + original_trade_information_at + 1) % 256; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.reporting_party_type = (original_trade_information_base + 68 + 1) % 256;
  original_trade_information_record.contra_party_type = (original_trade_information_base + 69 + 1) % 256;
  original_trade_information_record.ats_indicator = (original_trade_information_base + 70 + 1) % 256;
  skip
}

/* Original Trade Information to the wire, 71 bytes from where the cursor stands */
inline encode_original_trade_information(original_trade_information_record) {
  wire[at] = original_trade_information_record.quantity_indicator; at = at + 1;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 14 -> wire[at] = original_trade_information_record.quantity[original_trade_information_at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 11 -> wire[at] = original_trade_information_record.price[original_trade_information_at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = original_trade_information_record.remuneration; at = at + 1;
  wire[at] = original_trade_information_record.special_price_indicator; at = at + 1;
  wire[at] = original_trade_information_record.side; at = at + 1;
  wire[at] = original_trade_information_record.as_of_indicator; at = at + 1;
  encode_execution_datetime(original_trade_information_record.execution_datetime);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> wire[at] = original_trade_information_record.future_use[original_trade_information_at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = original_trade_information_record.sale_condition_3; at = at + 1;
  wire[at] = original_trade_information_record.sale_condition_4; at = at + 1;
  encode_settlement_date(original_trade_information_record.settlement_date);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> wire[at] = original_trade_information_record.factor[original_trade_information_at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = original_trade_information_record.reporting_party_type; at = at + 1;
  wire[at] = original_trade_information_record.contra_party_type; at = at + 1;
  wire[at] = original_trade_information_record.ats_indicator; at = at + 1;
  skip
}

/* Original Trade Information off the wire, 71 bytes from where the cursor stands */
inline decode_original_trade_information(original_trade_information_record) {
  original_trade_information_record.quantity_indicator = wire[at]; at = at + 1;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 14 -> original_trade_information_record.quantity[original_trade_information_at] = wire[at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 11 -> original_trade_information_record.price[original_trade_information_at] = wire[at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.remuneration = wire[at]; at = at + 1;
  original_trade_information_record.special_price_indicator = wire[at]; at = at + 1;
  original_trade_information_record.side = wire[at]; at = at + 1;
  original_trade_information_record.as_of_indicator = wire[at]; at = at + 1;
  decode_execution_datetime(original_trade_information_record.execution_datetime);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> original_trade_information_record.future_use[original_trade_information_at] = wire[at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.sale_condition_3 = wire[at]; at = at + 1;
  original_trade_information_record.sale_condition_4 = wire[at]; at = at + 1;
  decode_settlement_date(original_trade_information_record.settlement_date);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> original_trade_information_record.factor[original_trade_information_at] = wire[at]; at = at + 1; original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_record.reporting_party_type = wire[at]; at = at + 1;
  original_trade_information_record.contra_party_type = wire[at]; at = at + 1;
  original_trade_information_record.ats_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Original Trade Information is what was written, byte for byte */
inline equal_original_trade_information(original_trade_information_read, original_trade_information_written) {
  assert(original_trade_information_read.quantity_indicator == original_trade_information_written.quantity_indicator);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 14 -> assert(original_trade_information_read.quantity[original_trade_information_at] == original_trade_information_written.quantity[original_trade_information_at]); original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 11 -> assert(original_trade_information_read.price[original_trade_information_at] == original_trade_information_written.price[original_trade_information_at]); original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  assert(original_trade_information_read.remuneration == original_trade_information_written.remuneration);
  assert(original_trade_information_read.special_price_indicator == original_trade_information_written.special_price_indicator);
  assert(original_trade_information_read.side == original_trade_information_written.side);
  assert(original_trade_information_read.as_of_indicator == original_trade_information_written.as_of_indicator);
  equal_execution_datetime(original_trade_information_read.execution_datetime, original_trade_information_written.execution_datetime);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 2 -> assert(original_trade_information_read.future_use[original_trade_information_at] == original_trade_information_written.future_use[original_trade_information_at]); original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  assert(original_trade_information_read.sale_condition_3 == original_trade_information_written.sale_condition_3);
  assert(original_trade_information_read.sale_condition_4 == original_trade_information_written.sale_condition_4);
  equal_settlement_date(original_trade_information_read.settlement_date, original_trade_information_written.settlement_date);
  original_trade_information_at = 0;
  do
  :: original_trade_information_at < 12 -> assert(original_trade_information_read.factor[original_trade_information_at] == original_trade_information_written.factor[original_trade_information_at]); original_trade_information_at = original_trade_information_at + 1
  :: else -> break
  od;
  assert(original_trade_information_read.reporting_party_type == original_trade_information_written.reporting_party_type);
  assert(original_trade_information_read.contra_party_type == original_trade_information_written.contra_party_type);
  assert(original_trade_information_read.ats_indicator == original_trade_information_written.ats_indicator);
  skip
}

/* ---- Trade Summary Information: 34 bytes ------------------------------------- */

/* Trade Summary Information */
typedef TradeSummaryInformation {
  byte high_price[11];
  byte low_price[11];
  byte last_sale_price[11];
  byte change_indicator
};

int trade_summary_information_at;

/* every byte of Trade Summary Information set to one value */
inline fill_trade_summary_information(trade_summary_information_record, trade_summary_information_value) {
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.high_price[trade_summary_information_at] = trade_summary_information_value; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.low_price[trade_summary_information_at] = trade_summary_information_value; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.last_sale_price[trade_summary_information_at] = trade_summary_information_value; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.change_indicator = trade_summary_information_value;
  skip
}

/* each byte of Trade Summary Information set to where it lies, so a field read out of place says so */
inline ramp_trade_summary_information(trade_summary_information_record, trade_summary_information_base) {
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.high_price[trade_summary_information_at] = (trade_summary_information_base + 0 + trade_summary_information_at + 1) % 256; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.low_price[trade_summary_information_at] = (trade_summary_information_base + 11 + trade_summary_information_at + 1) % 256; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.last_sale_price[trade_summary_information_at] = (trade_summary_information_base + 22 + trade_summary_information_at + 1) % 256; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.change_indicator = (trade_summary_information_base + 33 + 1) % 256;
  skip
}

/* Trade Summary Information to the wire, 34 bytes from where the cursor stands */
inline encode_trade_summary_information(trade_summary_information_record) {
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> wire[at] = trade_summary_information_record.high_price[trade_summary_information_at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> wire[at] = trade_summary_information_record.low_price[trade_summary_information_at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> wire[at] = trade_summary_information_record.last_sale_price[trade_summary_information_at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  wire[at] = trade_summary_information_record.change_indicator; at = at + 1;
  skip
}

/* Trade Summary Information off the wire, 34 bytes from where the cursor stands */
inline decode_trade_summary_information(trade_summary_information_record) {
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.high_price[trade_summary_information_at] = wire[at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.low_price[trade_summary_information_at] = wire[at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> trade_summary_information_record.last_sale_price[trade_summary_information_at] = wire[at]; at = at + 1; trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_record.change_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Summary Information is what was written, byte for byte */
inline equal_trade_summary_information(trade_summary_information_read, trade_summary_information_written) {
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> assert(trade_summary_information_read.high_price[trade_summary_information_at] == trade_summary_information_written.high_price[trade_summary_information_at]); trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> assert(trade_summary_information_read.low_price[trade_summary_information_at] == trade_summary_information_written.low_price[trade_summary_information_at]); trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  trade_summary_information_at = 0;
  do
  :: trade_summary_information_at < 11 -> assert(trade_summary_information_read.last_sale_price[trade_summary_information_at] == trade_summary_information_written.last_sale_price[trade_summary_information_at]); trade_summary_information_at = trade_summary_information_at + 1
  :: else -> break
  od;
  assert(trade_summary_information_read.change_indicator == trade_summary_information_written.change_indicator);
  skip
}

/* ---- Trade Cancel Message: 183 bytes ----------------------------------------- */

/* Notifies subscribers that a trade report entered during the past 20 business days has been cancelled */
typedef TradeCancelMessage {
  MessageHeader message_header;
  Label label;
  OriginalDisseminationDate original_dissemin_b2ojs1;
  byte original_trade_identifier[7];
  byte report_function;
  OriginalTradeInformation original_trade_in_rg56l6;
  TradeSummaryInformation trade_summary_inf_v7d12v
};

int trade_cancel_message_at;

/* every byte of Trade Cancel Message set to one value */
inline fill_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_value) {
  fill_message_header(trade_cancel_message_record.message_header, trade_cancel_message_value);
  fill_label(trade_cancel_message_record.label, trade_cancel_message_value);
  fill_original_dissemination_date(trade_cancel_message_record.original_dissemin_b2ojs1, trade_cancel_message_value);
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 7 -> trade_cancel_message_record.original_trade_identifier[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.report_function = trade_cancel_message_value;
  fill_original_trade_information(trade_cancel_message_record.original_trade_in_rg56l6, trade_cancel_message_value);
  fill_trade_summary_information(trade_cancel_message_record.trade_summary_inf_v7d12v, trade_cancel_message_value);
  skip
}

/* each byte of Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_base) {
  ramp_message_header(trade_cancel_message_record.message_header, trade_cancel_message_base + 0);
  ramp_label(trade_cancel_message_record.label, trade_cancel_message_base + 22);
  ramp_original_dissemination_date(trade_cancel_message_record.original_dissemin_b2ojs1, trade_cancel_message_base + 62);
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 7 -> trade_cancel_message_record.original_trade_identifier[trade_cancel_message_at] = (trade_cancel_message_base + 70 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.report_function = (trade_cancel_message_base + 77 + 1) % 256;
  ramp_original_trade_information(trade_cancel_message_record.original_trade_in_rg56l6, trade_cancel_message_base + 78);
  ramp_trade_summary_information(trade_cancel_message_record.trade_summary_inf_v7d12v, trade_cancel_message_base + 149);
  skip
}

/* Trade Cancel Message to the wire, 183 bytes from where the cursor stands */
inline encode_trade_cancel_message(trade_cancel_message_record) {
  encode_message_header(trade_cancel_message_record.message_header);
  encode_label(trade_cancel_message_record.label);
  encode_original_dissemination_date(trade_cancel_message_record.original_dissemin_b2ojs1);
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 7 -> wire[at] = trade_cancel_message_record.original_trade_identifier[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_message_record.report_function; at = at + 1;
  encode_original_trade_information(trade_cancel_message_record.original_trade_in_rg56l6);
  encode_trade_summary_information(trade_cancel_message_record.trade_summary_inf_v7d12v);
  skip
}

/* Trade Cancel Message off the wire, 183 bytes from where the cursor stands */
inline decode_trade_cancel_message(trade_cancel_message_record) {
  decode_message_header(trade_cancel_message_record.message_header);
  decode_label(trade_cancel_message_record.label);
  decode_original_dissemination_date(trade_cancel_message_record.original_dissemin_b2ojs1);
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 7 -> trade_cancel_message_record.original_trade_identifier[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.report_function = wire[at]; at = at + 1;
  decode_original_trade_information(trade_cancel_message_record.original_trade_in_rg56l6);
  decode_trade_summary_information(trade_cancel_message_record.trade_summary_inf_v7d12v);
  skip
}

/* what was read of Trade Cancel Message is what was written, byte for byte */
inline equal_trade_cancel_message(trade_cancel_message_read, trade_cancel_message_written) {
  equal_message_header(trade_cancel_message_read.message_header, trade_cancel_message_written.message_header);
  equal_label(trade_cancel_message_read.label, trade_cancel_message_written.label);
  equal_original_dissemination_date(trade_cancel_message_read.original_dissemin_b2ojs1, trade_cancel_message_written.original_dissemin_b2ojs1);
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 7 -> assert(trade_cancel_message_read.original_trade_identifier[trade_cancel_message_at] == trade_cancel_message_written.original_trade_identifier[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_message_read.report_function == trade_cancel_message_written.report_function);
  equal_original_trade_information(trade_cancel_message_read.original_trade_in_rg56l6, trade_cancel_message_written.original_trade_in_rg56l6);
  equal_trade_summary_information(trade_cancel_message_read.trade_summary_inf_v7d12v, trade_cancel_message_written.trade_summary_inf_v7d12v);
  skip
}

/* ---- Correction Trade Information: 71 bytes ---------------------------------- */

/* Correction Trade Information */
typedef CorrectionTradeInformation {
  byte quantity_indicator;
  byte quantity[14];
  byte price[11];
  byte remuneration;
  byte special_price_indicator;
  byte side;
  byte as_of_indicator;
  ExecutionDatetime execution_datetime;
  byte future_use[2];
  byte sale_condition_3;
  byte sale_condition_4;
  SettlementDate settlement_date;
  byte factor[12];
  byte reporting_party_type;
  byte contra_party_type;
  byte ats_indicator
};

int correction_trade_information_at;

/* every byte of Correction Trade Information set to one value */
inline fill_correction_trade_information(correction_trade_information_record, correction_trade_information_value) {
  correction_trade_information_record.quantity_indicator = correction_trade_information_value;
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 14 -> correction_trade_information_record.quantity[correction_trade_information_at] = correction_trade_information_value; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 11 -> correction_trade_information_record.price[correction_trade_information_at] = correction_trade_information_value; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_record.remuneration = correction_trade_information_value;
  correction_trade_information_record.special_price_indicator = correction_trade_information_value;
  correction_trade_information_record.side = correction_trade_information_value;
  correction_trade_information_record.as_of_indicator = correction_trade_information_value;
  fill_execution_datetime(correction_trade_information_record.execution_datetime, correction_trade_information_value);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 2 -> correction_trade_information_record.future_use[correction_trade_information_at] = correction_trade_information_value; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_record.sale_condition_3 = correction_trade_information_value;
  correction_trade_information_record.sale_condition_4 = correction_trade_information_value;
  fill_settlement_date(correction_trade_information_record.settlement_date, correction_trade_information_value);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 12 -> correction_trade_information_record.factor[correction_trade_information_at] = correction_trade_information_value; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_record.reporting_party_type = correction_trade_information_value;
  correction_trade_information_record.contra_party_type = correction_trade_information_value;
  correction_trade_information_record.ats_indicator = correction_trade_information_value;
  skip
}

/* each byte of Correction Trade Information set to where it lies, so a field read out of place says so */
inline ramp_correction_trade_information(correction_trade_information_record, correction_trade_information_base) {
  correction_trade_information_record.quantity_indicator = (correction_trade_information_base + 0 + 1) % 256;
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 14 -> correction_trade_information_record.quantity[correction_trade_information_at] = (correction_trade_information_base + 1 + correction_trade_information_at + 1) % 256; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 11 -> correction_trade_information_record.price[correction_trade_information_at] = (correction_trade_information_base + 15 + correction_trade_information_at + 1) % 256; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_record.remuneration = (correction_trade_information_base + 26 + 1) % 256;
  correction_trade_information_record.special_price_indicator = (correction_trade_information_base + 27 + 1) % 256;
  correction_trade_information_record.side = (correction_trade_information_base + 28 + 1) % 256;
  correction_trade_information_record.as_of_indicator = (correction_trade_information_base + 29 + 1) % 256;
  ramp_execution_datetime(correction_trade_information_record.execution_datetime, correction_trade_information_base + 30);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 2 -> correction_trade_information_record.future_use[correction_trade_information_at] = (correction_trade_information_base + 44 + correction_trade_information_at + 1) % 256; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_record.sale_condition_3 = (correction_trade_information_base + 46 + 1) % 256;
  correction_trade_information_record.sale_condition_4 = (correction_trade_information_base + 47 + 1) % 256;
  ramp_settlement_date(correction_trade_information_record.settlement_date, correction_trade_information_base + 48);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 12 -> correction_trade_information_record.factor[correction_trade_information_at] = (correction_trade_information_base + 56 + correction_trade_information_at + 1) % 256; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_record.reporting_party_type = (correction_trade_information_base + 68 + 1) % 256;
  correction_trade_information_record.contra_party_type = (correction_trade_information_base + 69 + 1) % 256;
  correction_trade_information_record.ats_indicator = (correction_trade_information_base + 70 + 1) % 256;
  skip
}

/* Correction Trade Information to the wire, 71 bytes from where the cursor stands */
inline encode_correction_trade_information(correction_trade_information_record) {
  wire[at] = correction_trade_information_record.quantity_indicator; at = at + 1;
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 14 -> wire[at] = correction_trade_information_record.quantity[correction_trade_information_at]; at = at + 1; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 11 -> wire[at] = correction_trade_information_record.price[correction_trade_information_at]; at = at + 1; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = correction_trade_information_record.remuneration; at = at + 1;
  wire[at] = correction_trade_information_record.special_price_indicator; at = at + 1;
  wire[at] = correction_trade_information_record.side; at = at + 1;
  wire[at] = correction_trade_information_record.as_of_indicator; at = at + 1;
  encode_execution_datetime(correction_trade_information_record.execution_datetime);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 2 -> wire[at] = correction_trade_information_record.future_use[correction_trade_information_at]; at = at + 1; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = correction_trade_information_record.sale_condition_3; at = at + 1;
  wire[at] = correction_trade_information_record.sale_condition_4; at = at + 1;
  encode_settlement_date(correction_trade_information_record.settlement_date);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 12 -> wire[at] = correction_trade_information_record.factor[correction_trade_information_at]; at = at + 1; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  wire[at] = correction_trade_information_record.reporting_party_type; at = at + 1;
  wire[at] = correction_trade_information_record.contra_party_type; at = at + 1;
  wire[at] = correction_trade_information_record.ats_indicator; at = at + 1;
  skip
}

/* Correction Trade Information off the wire, 71 bytes from where the cursor stands */
inline decode_correction_trade_information(correction_trade_information_record) {
  correction_trade_information_record.quantity_indicator = wire[at]; at = at + 1;
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 14 -> correction_trade_information_record.quantity[correction_trade_information_at] = wire[at]; at = at + 1; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 11 -> correction_trade_information_record.price[correction_trade_information_at] = wire[at]; at = at + 1; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_record.remuneration = wire[at]; at = at + 1;
  correction_trade_information_record.special_price_indicator = wire[at]; at = at + 1;
  correction_trade_information_record.side = wire[at]; at = at + 1;
  correction_trade_information_record.as_of_indicator = wire[at]; at = at + 1;
  decode_execution_datetime(correction_trade_information_record.execution_datetime);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 2 -> correction_trade_information_record.future_use[correction_trade_information_at] = wire[at]; at = at + 1; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_record.sale_condition_3 = wire[at]; at = at + 1;
  correction_trade_information_record.sale_condition_4 = wire[at]; at = at + 1;
  decode_settlement_date(correction_trade_information_record.settlement_date);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 12 -> correction_trade_information_record.factor[correction_trade_information_at] = wire[at]; at = at + 1; correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_record.reporting_party_type = wire[at]; at = at + 1;
  correction_trade_information_record.contra_party_type = wire[at]; at = at + 1;
  correction_trade_information_record.ats_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Correction Trade Information is what was written, byte for byte */
inline equal_correction_trade_information(correction_trade_information_read, correction_trade_information_written) {
  assert(correction_trade_information_read.quantity_indicator == correction_trade_information_written.quantity_indicator);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 14 -> assert(correction_trade_information_read.quantity[correction_trade_information_at] == correction_trade_information_written.quantity[correction_trade_information_at]); correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 11 -> assert(correction_trade_information_read.price[correction_trade_information_at] == correction_trade_information_written.price[correction_trade_information_at]); correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  assert(correction_trade_information_read.remuneration == correction_trade_information_written.remuneration);
  assert(correction_trade_information_read.special_price_indicator == correction_trade_information_written.special_price_indicator);
  assert(correction_trade_information_read.side == correction_trade_information_written.side);
  assert(correction_trade_information_read.as_of_indicator == correction_trade_information_written.as_of_indicator);
  equal_execution_datetime(correction_trade_information_read.execution_datetime, correction_trade_information_written.execution_datetime);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 2 -> assert(correction_trade_information_read.future_use[correction_trade_information_at] == correction_trade_information_written.future_use[correction_trade_information_at]); correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  assert(correction_trade_information_read.sale_condition_3 == correction_trade_information_written.sale_condition_3);
  assert(correction_trade_information_read.sale_condition_4 == correction_trade_information_written.sale_condition_4);
  equal_settlement_date(correction_trade_information_read.settlement_date, correction_trade_information_written.settlement_date);
  correction_trade_information_at = 0;
  do
  :: correction_trade_information_at < 12 -> assert(correction_trade_information_read.factor[correction_trade_information_at] == correction_trade_information_written.factor[correction_trade_information_at]); correction_trade_information_at = correction_trade_information_at + 1
  :: else -> break
  od;
  assert(correction_trade_information_read.reporting_party_type == correction_trade_information_written.reporting_party_type);
  assert(correction_trade_information_read.contra_party_type == correction_trade_information_written.contra_party_type);
  assert(correction_trade_information_read.ats_indicator == correction_trade_information_written.ats_indicator);
  skip
}

/* ---- Trade Correction Message: 254 bytes ------------------------------------- */

/* Notifies subscribers that a trade report entered during the past 20 business days has been corrected */
typedef TradeCorrectionMessage {
  MessageHeader message_header;
  Label label;
  OriginalDisseminationDate original_dissemin_b2ojs1;
  byte original_trade_identifier[7];
  byte report_function;
  OriginalTradeInformation original_trade_in_rg56l6;
  CorrectionTradeInformation correction_trade__yipk6t;
  TradeSummaryInformation trade_summary_inf_v7d12v
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  fill_message_header(trade_correction_message_record.message_header, trade_correction_message_value);
  fill_label(trade_correction_message_record.label, trade_correction_message_value);
  fill_original_dissemination_date(trade_correction_message_record.original_dissemin_b2ojs1, trade_correction_message_value);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 7 -> trade_correction_message_record.original_trade_identifier[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.report_function = trade_correction_message_value;
  fill_original_trade_information(trade_correction_message_record.original_trade_in_rg56l6, trade_correction_message_value);
  fill_correction_trade_information(trade_correction_message_record.correction_trade__yipk6t, trade_correction_message_value);
  fill_trade_summary_information(trade_correction_message_record.trade_summary_inf_v7d12v, trade_correction_message_value);
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  ramp_message_header(trade_correction_message_record.message_header, trade_correction_message_base + 0);
  ramp_label(trade_correction_message_record.label, trade_correction_message_base + 22);
  ramp_original_dissemination_date(trade_correction_message_record.original_dissemin_b2ojs1, trade_correction_message_base + 62);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 7 -> trade_correction_message_record.original_trade_identifier[trade_correction_message_at] = (trade_correction_message_base + 70 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.report_function = (trade_correction_message_base + 77 + 1) % 256;
  ramp_original_trade_information(trade_correction_message_record.original_trade_in_rg56l6, trade_correction_message_base + 78);
  ramp_correction_trade_information(trade_correction_message_record.correction_trade__yipk6t, trade_correction_message_base + 149);
  ramp_trade_summary_information(trade_correction_message_record.trade_summary_inf_v7d12v, trade_correction_message_base + 220);
  skip
}

/* Trade Correction Message to the wire, 254 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  encode_message_header(trade_correction_message_record.message_header);
  encode_label(trade_correction_message_record.label);
  encode_original_dissemination_date(trade_correction_message_record.original_dissemin_b2ojs1);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 7 -> wire[at] = trade_correction_message_record.original_trade_identifier[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.report_function; at = at + 1;
  encode_original_trade_information(trade_correction_message_record.original_trade_in_rg56l6);
  encode_correction_trade_information(trade_correction_message_record.correction_trade__yipk6t);
  encode_trade_summary_information(trade_correction_message_record.trade_summary_inf_v7d12v);
  skip
}

/* Trade Correction Message off the wire, 254 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  decode_message_header(trade_correction_message_record.message_header);
  decode_label(trade_correction_message_record.label);
  decode_original_dissemination_date(trade_correction_message_record.original_dissemin_b2ojs1);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 7 -> trade_correction_message_record.original_trade_identifier[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.report_function = wire[at]; at = at + 1;
  decode_original_trade_information(trade_correction_message_record.original_trade_in_rg56l6);
  decode_correction_trade_information(trade_correction_message_record.correction_trade__yipk6t);
  decode_trade_summary_information(trade_correction_message_record.trade_summary_inf_v7d12v);
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  equal_message_header(trade_correction_message_read.message_header, trade_correction_message_written.message_header);
  equal_label(trade_correction_message_read.label, trade_correction_message_written.label);
  equal_original_dissemination_date(trade_correction_message_read.original_dissemin_b2ojs1, trade_correction_message_written.original_dissemin_b2ojs1);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 7 -> assert(trade_correction_message_read.original_trade_identifier[trade_correction_message_at] == trade_correction_message_written.original_trade_identifier[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.report_function == trade_correction_message_written.report_function);
  equal_original_trade_information(trade_correction_message_read.original_trade_in_rg56l6, trade_correction_message_written.original_trade_in_rg56l6);
  equal_correction_trade_information(trade_correction_message_read.correction_trade__yipk6t, trade_correction_message_written.correction_trade__yipk6t);
  equal_trade_summary_information(trade_correction_message_read.trade_summary_inf_v7d12v, trade_correction_message_written.trade_summary_inf_v7d12v);
  skip
}

/* ---- Daily Trade Summary Message: 95 bytes ----------------------------------- */

/* Price summary disseminated for each security that traded during the normal trading hours */
typedef DailyTradeSummaryMessage {
  MessageHeader message_header;
  Label label;
  byte daily_high_price[11];
  byte daily_low_price[11];
  byte daily_close_price[11]
};

int daily_trade_summary_message_at;

/* every byte of Daily Trade Summary Message set to one value */
inline fill_daily_trade_summary_message(daily_trade_summary_message_record, daily_trade_summary_message_value) {
  fill_message_header(daily_trade_summary_message_record.message_header, daily_trade_summary_message_value);
  fill_label(daily_trade_summary_message_record.label, daily_trade_summary_message_value);
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> daily_trade_summary_message_record.daily_high_price[daily_trade_summary_message_at] = daily_trade_summary_message_value; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> daily_trade_summary_message_record.daily_low_price[daily_trade_summary_message_at] = daily_trade_summary_message_value; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> daily_trade_summary_message_record.daily_close_price[daily_trade_summary_message_at] = daily_trade_summary_message_value; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Daily Trade Summary Message set to where it lies, so a field read out of place says so */
inline ramp_daily_trade_summary_message(daily_trade_summary_message_record, daily_trade_summary_message_base) {
  ramp_message_header(daily_trade_summary_message_record.message_header, daily_trade_summary_message_base + 0);
  ramp_label(daily_trade_summary_message_record.label, daily_trade_summary_message_base + 22);
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> daily_trade_summary_message_record.daily_high_price[daily_trade_summary_message_at] = (daily_trade_summary_message_base + 62 + daily_trade_summary_message_at + 1) % 256; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> daily_trade_summary_message_record.daily_low_price[daily_trade_summary_message_at] = (daily_trade_summary_message_base + 73 + daily_trade_summary_message_at + 1) % 256; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> daily_trade_summary_message_record.daily_close_price[daily_trade_summary_message_at] = (daily_trade_summary_message_base + 84 + daily_trade_summary_message_at + 1) % 256; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Daily Trade Summary Message to the wire, 95 bytes from where the cursor stands */
inline encode_daily_trade_summary_message(daily_trade_summary_message_record) {
  encode_message_header(daily_trade_summary_message_record.message_header);
  encode_label(daily_trade_summary_message_record.label);
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> wire[at] = daily_trade_summary_message_record.daily_high_price[daily_trade_summary_message_at]; at = at + 1; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> wire[at] = daily_trade_summary_message_record.daily_low_price[daily_trade_summary_message_at]; at = at + 1; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> wire[at] = daily_trade_summary_message_record.daily_close_price[daily_trade_summary_message_at]; at = at + 1; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Daily Trade Summary Message off the wire, 95 bytes from where the cursor stands */
inline decode_daily_trade_summary_message(daily_trade_summary_message_record) {
  decode_message_header(daily_trade_summary_message_record.message_header);
  decode_label(daily_trade_summary_message_record.label);
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> daily_trade_summary_message_record.daily_high_price[daily_trade_summary_message_at] = wire[at]; at = at + 1; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> daily_trade_summary_message_record.daily_low_price[daily_trade_summary_message_at] = wire[at]; at = at + 1; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> daily_trade_summary_message_record.daily_close_price[daily_trade_summary_message_at] = wire[at]; at = at + 1; daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Daily Trade Summary Message is what was written, byte for byte */
inline equal_daily_trade_summary_message(daily_trade_summary_message_read, daily_trade_summary_message_written) {
  equal_message_header(daily_trade_summary_message_read.message_header, daily_trade_summary_message_written.message_header);
  equal_label(daily_trade_summary_message_read.label, daily_trade_summary_message_written.label);
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> assert(daily_trade_summary_message_read.daily_high_price[daily_trade_summary_message_at] == daily_trade_summary_message_written.daily_high_price[daily_trade_summary_message_at]); daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> assert(daily_trade_summary_message_read.daily_low_price[daily_trade_summary_message_at] == daily_trade_summary_message_written.daily_low_price[daily_trade_summary_message_at]); daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  daily_trade_summary_message_at = 0;
  do
  :: daily_trade_summary_message_at < 11 -> assert(daily_trade_summary_message_read.daily_close_price[daily_trade_summary_message_at] == daily_trade_summary_message_written.daily_close_price[daily_trade_summary_message_at]); daily_trade_summary_message_at = daily_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Action Datetime: 14 bytes ----------------------------------------------- */

/* Action Datetime */
typedef ActionDatetime {
  byte year[4];
  byte month[2];
  byte day[2];
  byte hour[2];
  byte minute[2];
  byte second[2]
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
  skip
}

/* Action Datetime to the wire, 14 bytes from where the cursor stands */
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
  skip
}

/* Action Datetime off the wire, 14 bytes from where the cursor stands */
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
  skip
}

/* ---- Trading Halt Message: 111 bytes ----------------------------------------- */

/* Disseminated when a trading halt is instituted or removed for a security */
typedef TradingHaltMessage {
  MessageHeader message_header;
  Label label;
  byte issuer[30];
  byte action;
  ActionDatetime action_datetime;
  byte halt_reason[4]
};

int trading_halt_message_at;

/* every byte of Trading Halt Message set to one value */
inline fill_trading_halt_message(trading_halt_message_record, trading_halt_message_value) {
  fill_message_header(trading_halt_message_record.message_header, trading_halt_message_value);
  fill_label(trading_halt_message_record.label, trading_halt_message_value);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 30 -> trading_halt_message_record.issuer[trading_halt_message_at] = trading_halt_message_value; trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  trading_halt_message_record.action = trading_halt_message_value;
  fill_action_datetime(trading_halt_message_record.action_datetime, trading_halt_message_value);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 4 -> trading_halt_message_record.halt_reason[trading_halt_message_at] = trading_halt_message_value; trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Halt Message set to where it lies, so a field read out of place says so */
inline ramp_trading_halt_message(trading_halt_message_record, trading_halt_message_base) {
  ramp_message_header(trading_halt_message_record.message_header, trading_halt_message_base + 0);
  ramp_label(trading_halt_message_record.label, trading_halt_message_base + 22);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 30 -> trading_halt_message_record.issuer[trading_halt_message_at] = (trading_halt_message_base + 62 + trading_halt_message_at + 1) % 256; trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  trading_halt_message_record.action = (trading_halt_message_base + 92 + 1) % 256;
  ramp_action_datetime(trading_halt_message_record.action_datetime, trading_halt_message_base + 93);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 4 -> trading_halt_message_record.halt_reason[trading_halt_message_at] = (trading_halt_message_base + 107 + trading_halt_message_at + 1) % 256; trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Halt Message to the wire, 111 bytes from where the cursor stands */
inline encode_trading_halt_message(trading_halt_message_record) {
  encode_message_header(trading_halt_message_record.message_header);
  encode_label(trading_halt_message_record.label);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 30 -> wire[at] = trading_halt_message_record.issuer[trading_halt_message_at]; at = at + 1; trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_halt_message_record.action; at = at + 1;
  encode_action_datetime(trading_halt_message_record.action_datetime);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 4 -> wire[at] = trading_halt_message_record.halt_reason[trading_halt_message_at]; at = at + 1; trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Halt Message off the wire, 111 bytes from where the cursor stands */
inline decode_trading_halt_message(trading_halt_message_record) {
  decode_message_header(trading_halt_message_record.message_header);
  decode_label(trading_halt_message_record.label);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 30 -> trading_halt_message_record.issuer[trading_halt_message_at] = wire[at]; at = at + 1; trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  trading_halt_message_record.action = wire[at]; at = at + 1;
  decode_action_datetime(trading_halt_message_record.action_datetime);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 4 -> trading_halt_message_record.halt_reason[trading_halt_message_at] = wire[at]; at = at + 1; trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Halt Message is what was written, byte for byte */
inline equal_trading_halt_message(trading_halt_message_read, trading_halt_message_written) {
  equal_message_header(trading_halt_message_read.message_header, trading_halt_message_written.message_header);
  equal_label(trading_halt_message_read.label, trading_halt_message_written.label);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 30 -> assert(trading_halt_message_read.issuer[trading_halt_message_at] == trading_halt_message_written.issuer[trading_halt_message_at]); trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  assert(trading_halt_message_read.action == trading_halt_message_written.action);
  equal_action_datetime(trading_halt_message_read.action_datetime, trading_halt_message_written.action_datetime);
  trading_halt_message_at = 0;
  do
  :: trading_halt_message_at < 4 -> assert(trading_halt_message_read.halt_reason[trading_halt_message_at] == trading_halt_message_written.halt_reason[trading_halt_message_at]); trading_halt_message_at = trading_halt_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Day Message: 22 bytes ------------------------------------------ */

/* Signifies the beginning of Finra's daily operational cycle */
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

/* Start Of Day Message to the wire, 22 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  encode_message_header(start_of_day_message_record.message_header);
  skip
}

/* Start Of Day Message off the wire, 22 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  decode_message_header(start_of_day_message_record.message_header);
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  equal_message_header(start_of_day_message_read.message_header, start_of_day_message_written.message_header);
  skip
}

/* ---- End Of Day Message: 22 bytes -------------------------------------------- */

/* Signals the end of activity for the operational cycle */
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

/* End Of Day Message to the wire, 22 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  encode_message_header(end_of_day_message_record.message_header);
  skip
}

/* End Of Day Message off the wire, 22 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  decode_message_header(end_of_day_message_record.message_header);
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  equal_message_header(end_of_day_message_read.message_header, end_of_day_message_written.message_header);
  skip
}

/* ---- Market Session Open Message: 22 bytes ----------------------------------- */

/* Signifies the opening of the market for the session indicated in the message header */
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

/* Market Session Open Message to the wire, 22 bytes from where the cursor stands */
inline encode_market_session_open_message(market_session_open_message_record) {
  encode_message_header(market_session_open_message_record.message_header);
  skip
}

/* Market Session Open Message off the wire, 22 bytes from where the cursor stands */
inline decode_market_session_open_message(market_session_open_message_record) {
  decode_message_header(market_session_open_message_record.message_header);
  skip
}

/* what was read of Market Session Open Message is what was written, byte for byte */
inline equal_market_session_open_message(market_session_open_message_read, market_session_open_message_written) {
  equal_message_header(market_session_open_message_read.message_header, market_session_open_message_written.message_header);
  skip
}

/* ---- Market Session Close Message: 22 bytes ---------------------------------- */

/* Signals the closing of the market for the session indicated in the message header */
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

/* Market Session Close Message to the wire, 22 bytes from where the cursor stands */
inline encode_market_session_close_message(market_session_close_message_record) {
  encode_message_header(market_session_close_message_record.message_header);
  skip
}

/* Market Session Close Message off the wire, 22 bytes from where the cursor stands */
inline decode_market_session_close_message(market_session_close_message_record) {
  decode_message_header(market_session_close_message_record.message_header);
  skip
}

/* what was read of Market Session Close Message is what was written, byte for byte */
inline equal_market_session_close_message(market_session_close_message_read, market_session_close_message_written) {
  equal_message_header(market_session_close_message_read.message_header, market_session_close_message_written.message_header);
  skip
}

/* ---- End Of Trade Reporting Message: 22 bytes -------------------------------- */

/* Signals that no further trade reports or corrections will be sent for that market session */
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

/* End Of Trade Reporting Message to the wire, 22 bytes from where the cursor stands */
inline encode_end_of_trade_reporting_message(end_of_trade_reporting_message_record) {
  encode_message_header(end_of_trade_reporting_message_record.message_header);
  skip
}

/* End Of Trade Reporting Message off the wire, 22 bytes from where the cursor stands */
inline decode_end_of_trade_reporting_message(end_of_trade_reporting_message_record) {
  decode_message_header(end_of_trade_reporting_message_record.message_header);
  skip
}

/* what was read of End Of Trade Reporting Message is what was written, byte for byte */
inline equal_end_of_trade_reporting_message(end_of_trade_reporting_message_read, end_of_trade_reporting_message_written) {
  equal_message_header(end_of_trade_reporting_message_read.message_header, end_of_trade_reporting_message_written.message_header);
  skip
}

/* ---- End Of Transmissions Message: 22 bytes ---------------------------------- */

/* Signals that there will be no further transmissions of data */
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

/* End Of Transmissions Message to the wire, 22 bytes from where the cursor stands */
inline encode_end_of_transmissions_message(end_of_transmissions_message_record) {
  encode_message_header(end_of_transmissions_message_record.message_header);
  skip
}

/* End Of Transmissions Message off the wire, 22 bytes from where the cursor stands */
inline decode_end_of_transmissions_message(end_of_transmissions_message_record) {
  decode_message_header(end_of_transmissions_message_record.message_header);
  skip
}

/* what was read of End Of Transmissions Message is what was written, byte for byte */
inline equal_end_of_transmissions_message(end_of_transmissions_message_read, end_of_transmissions_message_written) {
  equal_message_header(end_of_transmissions_message_read.message_header, end_of_transmissions_message_written.message_header);
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
    assert(at == 14);
    at = 0;
    decode_datetime(datetime_got);
    assert(at == 14);
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
    assert(at == 22);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 22);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Label: encoded, read back, and compared */
proctype check_label() {
  Label label_sent;
  Label label_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_label(label_sent, 0)
  :: pattern == 1 -> fill_label(label_sent, 32)
  :: pattern == 2 -> fill_label(label_sent, 255)
  :: else -> ramp_label(label_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_label(label_sent);
    assert(at == 40);
    at = 0;
    decode_label(label_got);
    assert(at == 40);
    equal_label(label_got, label_sent)
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
    assert(at == 14);
    at = 0;
    decode_execution_datetime(execution_datetime_got);
    assert(at == 14);
    equal_execution_datetime(execution_datetime_got, execution_datetime_sent)
  }
}

/* Settlement Date: encoded, read back, and compared */
proctype check_settlement_date() {
  SettlementDate settlement_date_sent;
  SettlementDate settlement_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_settlement_date(settlement_date_sent, 0)
  :: pattern == 1 -> fill_settlement_date(settlement_date_sent, 32)
  :: pattern == 2 -> fill_settlement_date(settlement_date_sent, 255)
  :: else -> ramp_settlement_date(settlement_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_settlement_date(settlement_date_sent);
    assert(at == 8);
    at = 0;
    decode_settlement_date(settlement_date_got);
    assert(at == 8);
    equal_settlement_date(settlement_date_got, settlement_date_sent)
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
    assert(at == 71);
    at = 0;
    decode_trade_information(trade_information_got);
    assert(at == 71);
    equal_trade_information(trade_information_got, trade_information_sent)
  }
}

/* Trade Report Message: encoded, read back, and compared */
proctype check_trade_report_message() {
  TradeReportMessage trade_report_message_sent;
  TradeReportMessage trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_message(trade_report_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_message(trade_report_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_message(trade_report_message_sent, 255)
  :: else -> ramp_trade_report_message(trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_message(trade_report_message_sent);
    assert(at == 142);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 142);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
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
    assert(at == 71);
    at = 0;
    decode_original_trade_information(original_trade_information_got);
    assert(at == 71);
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
    assert(at == 34);
    at = 0;
    decode_trade_summary_information(trade_summary_information_got);
    assert(at == 34);
    equal_trade_summary_information(trade_summary_information_got, trade_summary_information_sent)
  }
}

/* Trade Cancel Message: encoded, read back, and compared */
proctype check_trade_cancel_message() {
  TradeCancelMessage trade_cancel_message_sent;
  TradeCancelMessage trade_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_message(trade_cancel_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_message(trade_cancel_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_message(trade_cancel_message_sent, 255)
  :: else -> ramp_trade_cancel_message(trade_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_message(trade_cancel_message_sent);
    assert(at == 183);
    at = 0;
    decode_trade_cancel_message(trade_cancel_message_got);
    assert(at == 183);
    equal_trade_cancel_message(trade_cancel_message_got, trade_cancel_message_sent)
  }
}

/* Correction Trade Information: encoded, read back, and compared */
proctype check_correction_trade_information() {
  CorrectionTradeInformation correction_trade_information_sent;
  CorrectionTradeInformation correction_trade_information_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_correction_trade_information(correction_trade_information_sent, 0)
  :: pattern == 1 -> fill_correction_trade_information(correction_trade_information_sent, 32)
  :: pattern == 2 -> fill_correction_trade_information(correction_trade_information_sent, 255)
  :: else -> ramp_correction_trade_information(correction_trade_information_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_correction_trade_information(correction_trade_information_sent);
    assert(at == 71);
    at = 0;
    decode_correction_trade_information(correction_trade_information_got);
    assert(at == 71);
    equal_correction_trade_information(correction_trade_information_got, correction_trade_information_sent)
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
    assert(at == 254);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 254);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Daily Trade Summary Message: encoded, read back, and compared */
proctype check_daily_trade_summary_message() {
  DailyTradeSummaryMessage daily_trade_summary_message_sent;
  DailyTradeSummaryMessage daily_trade_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_daily_trade_summary_message(daily_trade_summary_message_sent, 0)
  :: pattern == 1 -> fill_daily_trade_summary_message(daily_trade_summary_message_sent, 32)
  :: pattern == 2 -> fill_daily_trade_summary_message(daily_trade_summary_message_sent, 255)
  :: else -> ramp_daily_trade_summary_message(daily_trade_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_daily_trade_summary_message(daily_trade_summary_message_sent);
    assert(at == 95);
    at = 0;
    decode_daily_trade_summary_message(daily_trade_summary_message_got);
    assert(at == 95);
    equal_daily_trade_summary_message(daily_trade_summary_message_got, daily_trade_summary_message_sent)
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
    assert(at == 14);
    at = 0;
    decode_action_datetime(action_datetime_got);
    assert(at == 14);
    equal_action_datetime(action_datetime_got, action_datetime_sent)
  }
}

/* Trading Halt Message: encoded, read back, and compared */
proctype check_trading_halt_message() {
  TradingHaltMessage trading_halt_message_sent;
  TradingHaltMessage trading_halt_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_halt_message(trading_halt_message_sent, 0)
  :: pattern == 1 -> fill_trading_halt_message(trading_halt_message_sent, 32)
  :: pattern == 2 -> fill_trading_halt_message(trading_halt_message_sent, 255)
  :: else -> ramp_trading_halt_message(trading_halt_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_halt_message(trading_halt_message_sent);
    assert(at == 111);
    at = 0;
    decode_trading_halt_message(trading_halt_message_got);
    assert(at == 111);
    equal_trading_halt_message(trading_halt_message_got, trading_halt_message_sent)
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
    assert(at == 22);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 22);
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
    assert(at == 22);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 22);
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
    assert(at == 22);
    at = 0;
    decode_market_session_open_message(market_session_open_message_got);
    assert(at == 22);
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
    assert(at == 22);
    at = 0;
    decode_market_session_close_message(market_session_close_message_got);
    assert(at == 22);
    equal_market_session_close_message(market_session_close_message_got, market_session_close_message_sent)
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
    assert(at == 22);
    at = 0;
    decode_end_of_trade_reporting_message(end_of_trade_reporting_message_got);
    assert(at == 22);
    equal_end_of_trade_reporting_message(end_of_trade_reporting_message_got, end_of_trade_reporting_message_sent)
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
    assert(at == 22);
    at = 0;
    decode_end_of_transmissions_message(end_of_transmissions_message_got);
    assert(at == 22);
    equal_end_of_transmissions_message(end_of_transmissions_message_got, end_of_transmissions_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_mold_udp64()
  :: run check_datetime()
  :: run check_message_header()
  :: run check_label()
  :: run check_original_dissemination_date()
  :: run check_execution_datetime()
  :: run check_settlement_date()
  :: run check_trade_information()
  :: run check_trade_report_message()
  :: run check_original_trade_information()
  :: run check_trade_summary_information()
  :: run check_trade_cancel_message()
  :: run check_correction_trade_information()
  :: run check_trade_correction_message()
  :: run check_daily_trade_summary_message()
  :: run check_action_datetime()
  :: run check_trading_halt_message()
  :: run check_start_of_day_message()
  :: run check_end_of_day_message()
  :: run check_market_session_open_message()
  :: run check_market_session_close_message()
  :: run check_end_of_trade_reporting_message()
  :: run check_end_of_transmissions_message()
  fi
}
