/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Net Order Imbalance View
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 47

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

/* Itch Mold Udp 64 Packet Header */
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

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Mold Udp 64 Message Header */
typedef MessageHeader {
  byte message_length[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- System Event Message: 9 bytes ------------------------------------------- */

/* Reflects the number of seconds past midnight that the Timestamp message was generated. */
typedef SystemEventMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 2 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  skip
}

/* System Event Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.tracking_number[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.tracking_number[system_event_message_at] == system_event_message_written.tracking_number[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Stock Directory Message: 36 bytes --------------------------------------- */

/* At the start of each trading day, Nasdaq disseminates stock directory messages for all active symbols in the Nasdaq execution system. */
typedef StockDirectoryMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte stock_alpha_8[8];
  byte market_category;
  byte financial_status_indicator;
  byte round_lot_size[4];
  byte round_lots_only;
  byte issue_classification;
  byte issue_sub_type[2];
  byte authenticity;
  byte short_sale_threshold_indicator;
  byte ipo_flag;
  byte luld_reference_price_tier;
  byte etp_flag;
  byte etp_leverage_factor[4];
  byte inverse_indicator
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.tracking_number[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.timestamp[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock_alpha_8[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = stock_directory_message_value;
  stock_directory_message_record.financial_status_indicator = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = stock_directory_message_value;
  stock_directory_message_record.issue_classification = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = stock_directory_message_value;
  stock_directory_message_record.short_sale_threshold_indicator = stock_directory_message_value;
  stock_directory_message_record.ipo_flag = stock_directory_message_value;
  stock_directory_message_record.luld_reference_price_tier = stock_directory_message_value;
  stock_directory_message_record.etp_flag = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = stock_directory_message_value;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.tracking_number[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.timestamp[stock_directory_message_at] = (stock_directory_message_base + 2 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock_alpha_8[stock_directory_message_at] = (stock_directory_message_base + 8 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = (stock_directory_message_base + 16 + 1) % 256;
  stock_directory_message_record.financial_status_indicator = (stock_directory_message_base + 17 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = (stock_directory_message_base + 18 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = (stock_directory_message_base + 22 + 1) % 256;
  stock_directory_message_record.issue_classification = (stock_directory_message_base + 23 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = (stock_directory_message_base + 24 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = (stock_directory_message_base + 26 + 1) % 256;
  stock_directory_message_record.short_sale_threshold_indicator = (stock_directory_message_base + 27 + 1) % 256;
  stock_directory_message_record.ipo_flag = (stock_directory_message_base + 28 + 1) % 256;
  stock_directory_message_record.luld_reference_price_tier = (stock_directory_message_base + 29 + 1) % 256;
  stock_directory_message_record.etp_flag = (stock_directory_message_base + 30 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = (stock_directory_message_base + 31 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = (stock_directory_message_base + 35 + 1) % 256;
  skip
}

/* Stock Directory Message to the wire, 36 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> wire[at] = stock_directory_message_record.tracking_number[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> wire[at] = stock_directory_message_record.timestamp[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> wire[at] = stock_directory_message_record.stock_alpha_8[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.market_category; at = at + 1;
  wire[at] = stock_directory_message_record.financial_status_indicator; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.round_lot_size[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.round_lots_only; at = at + 1;
  wire[at] = stock_directory_message_record.issue_classification; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> wire[at] = stock_directory_message_record.issue_sub_type[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.authenticity; at = at + 1;
  wire[at] = stock_directory_message_record.short_sale_threshold_indicator; at = at + 1;
  wire[at] = stock_directory_message_record.ipo_flag; at = at + 1;
  wire[at] = stock_directory_message_record.luld_reference_price_tier; at = at + 1;
  wire[at] = stock_directory_message_record.etp_flag; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.etp_leverage_factor[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.inverse_indicator; at = at + 1;
  skip
}

/* Stock Directory Message off the wire, 36 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.tracking_number[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.timestamp[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock_alpha_8[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = wire[at]; at = at + 1;
  stock_directory_message_record.financial_status_indicator = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = wire[at]; at = at + 1;
  stock_directory_message_record.issue_classification = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = wire[at]; at = at + 1;
  stock_directory_message_record.short_sale_threshold_indicator = wire[at]; at = at + 1;
  stock_directory_message_record.ipo_flag = wire[at]; at = at + 1;
  stock_directory_message_record.luld_reference_price_tier = wire[at]; at = at + 1;
  stock_directory_message_record.etp_flag = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> assert(stock_directory_message_read.tracking_number[stock_directory_message_at] == stock_directory_message_written.tracking_number[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> assert(stock_directory_message_read.timestamp[stock_directory_message_at] == stock_directory_message_written.timestamp[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> assert(stock_directory_message_read.stock_alpha_8[stock_directory_message_at] == stock_directory_message_written.stock_alpha_8[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.market_category == stock_directory_message_written.market_category);
  assert(stock_directory_message_read.financial_status_indicator == stock_directory_message_written.financial_status_indicator);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.round_lot_size[stock_directory_message_at] == stock_directory_message_written.round_lot_size[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.round_lots_only == stock_directory_message_written.round_lots_only);
  assert(stock_directory_message_read.issue_classification == stock_directory_message_written.issue_classification);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> assert(stock_directory_message_read.issue_sub_type[stock_directory_message_at] == stock_directory_message_written.issue_sub_type[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.authenticity == stock_directory_message_written.authenticity);
  assert(stock_directory_message_read.short_sale_threshold_indicator == stock_directory_message_written.short_sale_threshold_indicator);
  assert(stock_directory_message_read.ipo_flag == stock_directory_message_written.ipo_flag);
  assert(stock_directory_message_read.luld_reference_price_tier == stock_directory_message_written.luld_reference_price_tier);
  assert(stock_directory_message_read.etp_flag == stock_directory_message_written.etp_flag);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.etp_leverage_factor[stock_directory_message_at] == stock_directory_message_written.etp_leverage_factor[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.inverse_indicator == stock_directory_message_written.inverse_indicator);
  skip
}

/* ---- Stock Trading Action Message: 21 bytes ---------------------------------- */

/* NASDAQ uses this administrative message to indicate the current trading status of a security to the trading community. */
typedef StockTradingActionMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte stock_alphanumeric_8[8];
  byte current_trading_state;
  byte reason[4]
};

int stock_trading_action_message_at;

/* every byte of Stock Trading Action Message set to one value */
inline fill_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_value) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.tracking_number[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.stock_alphanumeric_8[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.current_trading_state = stock_trading_action_message_value;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_base) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.tracking_number[stock_trading_action_message_at] = (stock_trading_action_message_base + 0 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = (stock_trading_action_message_base + 2 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.stock_alphanumeric_8[stock_trading_action_message_at] = (stock_trading_action_message_base + 8 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.current_trading_state = (stock_trading_action_message_base + 16 + 1) % 256;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = (stock_trading_action_message_base + 17 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message to the wire, 21 bytes from where the cursor stands */
inline encode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> wire[at] = stock_trading_action_message_record.tracking_number[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> wire[at] = stock_trading_action_message_record.timestamp[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> wire[at] = stock_trading_action_message_record.stock_alphanumeric_8[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_trading_action_message_record.current_trading_state; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> wire[at] = stock_trading_action_message_record.reason[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message off the wire, 21 bytes from where the cursor stands */
inline decode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.tracking_number[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.stock_alphanumeric_8[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.current_trading_state = wire[at]; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Trading Action Message is what was written, byte for byte */
inline equal_stock_trading_action_message(stock_trading_action_message_read, stock_trading_action_message_written) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> assert(stock_trading_action_message_read.tracking_number[stock_trading_action_message_at] == stock_trading_action_message_written.tracking_number[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> assert(stock_trading_action_message_read.timestamp[stock_trading_action_message_at] == stock_trading_action_message_written.timestamp[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> assert(stock_trading_action_message_read.stock_alphanumeric_8[stock_trading_action_message_at] == stock_trading_action_message_written.stock_alphanumeric_8[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  assert(stock_trading_action_message_read.current_trading_state == stock_trading_action_message_written.current_trading_state);
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> assert(stock_trading_action_message_read.reason[stock_trading_action_message_at] == stock_trading_action_message_written.reason[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Restriction Message: 17 bytes ----------------------------------- */

/* NASDAQ processes orders based on the most Reg SHO Restriction status value. */
typedef RegShoRestrictionMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte stock_alphanumeric_8[8];
  byte reg_sho_action
};

int reg_sho_restriction_message_at;

/* every byte of Reg Sho Restriction Message set to one value */
inline fill_reg_sho_restriction_message(reg_sho_restriction_message_record, reg_sho_restriction_message_value) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> reg_sho_restriction_message_record.tracking_number[reg_sho_restriction_message_at] = reg_sho_restriction_message_value; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 6 -> reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at] = reg_sho_restriction_message_value; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.stock_alphanumeric_8[reg_sho_restriction_message_at] = reg_sho_restriction_message_value; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.reg_sho_action = reg_sho_restriction_message_value;
  skip
}

/* each byte of Reg Sho Restriction Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_restriction_message(reg_sho_restriction_message_record, reg_sho_restriction_message_base) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> reg_sho_restriction_message_record.tracking_number[reg_sho_restriction_message_at] = (reg_sho_restriction_message_base + 0 + reg_sho_restriction_message_at + 1) % 256; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 6 -> reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at] = (reg_sho_restriction_message_base + 2 + reg_sho_restriction_message_at + 1) % 256; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.stock_alphanumeric_8[reg_sho_restriction_message_at] = (reg_sho_restriction_message_base + 8 + reg_sho_restriction_message_at + 1) % 256; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.reg_sho_action = (reg_sho_restriction_message_base + 16 + 1) % 256;
  skip
}

/* Reg Sho Restriction Message to the wire, 17 bytes from where the cursor stands */
inline encode_reg_sho_restriction_message(reg_sho_restriction_message_record) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> wire[at] = reg_sho_restriction_message_record.tracking_number[reg_sho_restriction_message_at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 6 -> wire[at] = reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> wire[at] = reg_sho_restriction_message_record.stock_alphanumeric_8[reg_sho_restriction_message_at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_restriction_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Reg Sho Restriction Message off the wire, 17 bytes from where the cursor stands */
inline decode_reg_sho_restriction_message(reg_sho_restriction_message_record) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> reg_sho_restriction_message_record.tracking_number[reg_sho_restriction_message_at] = wire[at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 6 -> reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at] = wire[at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.stock_alphanumeric_8[reg_sho_restriction_message_at] = wire[at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Restriction Message is what was written, byte for byte */
inline equal_reg_sho_restriction_message(reg_sho_restriction_message_read, reg_sho_restriction_message_written) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> assert(reg_sho_restriction_message_read.tracking_number[reg_sho_restriction_message_at] == reg_sho_restriction_message_written.tracking_number[reg_sho_restriction_message_at]); reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 6 -> assert(reg_sho_restriction_message_read.timestamp[reg_sho_restriction_message_at] == reg_sho_restriction_message_written.timestamp[reg_sho_restriction_message_at]); reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> assert(reg_sho_restriction_message_read.stock_alphanumeric_8[reg_sho_restriction_message_at] == reg_sho_restriction_message_written.stock_alphanumeric_8[reg_sho_restriction_message_at]); reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_restriction_message_read.reg_sho_action == reg_sho_restriction_message_written.reg_sho_action);
  skip
}

/* ---- Noii Message: 47 bytes -------------------------------------------------- */

/* Nasdaq disseminates NOII data at 5-second intervals in the minutes leading up to the Nasdaq Opening and Closing Crosses as well as the IPO/Halt Crosses */
typedef NoiiMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte paired_shares[8];
  byte imbalance_shares[8];
  byte imbalance_direction;
  byte stock_alphanumeric_8[8];
  byte far_price[4];
  byte near_price[4];
  byte current_reference_price[4];
  byte cross_type;
  byte price_variation_indicator
};

int noii_message_at;

/* every byte of Noii Message set to one value */
inline fill_noii_message(noii_message_record, noii_message_value) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> noii_message_record.tracking_number[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> noii_message_record.timestamp[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.paired_shares[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.imbalance_shares[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.imbalance_direction = noii_message_value;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.stock_alphanumeric_8[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.far_price[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.near_price[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.current_reference_price[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.cross_type = noii_message_value;
  noii_message_record.price_variation_indicator = noii_message_value;
  skip
}

/* each byte of Noii Message set to where it lies, so a field read out of place says so */
inline ramp_noii_message(noii_message_record, noii_message_base) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> noii_message_record.tracking_number[noii_message_at] = (noii_message_base + 0 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> noii_message_record.timestamp[noii_message_at] = (noii_message_base + 2 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.paired_shares[noii_message_at] = (noii_message_base + 8 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.imbalance_shares[noii_message_at] = (noii_message_base + 16 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.imbalance_direction = (noii_message_base + 24 + 1) % 256;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.stock_alphanumeric_8[noii_message_at] = (noii_message_base + 25 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.far_price[noii_message_at] = (noii_message_base + 33 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.near_price[noii_message_at] = (noii_message_base + 37 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.current_reference_price[noii_message_at] = (noii_message_base + 41 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.cross_type = (noii_message_base + 45 + 1) % 256;
  noii_message_record.price_variation_indicator = (noii_message_base + 46 + 1) % 256;
  skip
}

/* Noii Message to the wire, 47 bytes from where the cursor stands */
inline encode_noii_message(noii_message_record) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> wire[at] = noii_message_record.tracking_number[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> wire[at] = noii_message_record.timestamp[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> wire[at] = noii_message_record.paired_shares[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> wire[at] = noii_message_record.imbalance_shares[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  wire[at] = noii_message_record.imbalance_direction; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> wire[at] = noii_message_record.stock_alphanumeric_8[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.far_price[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.near_price[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.current_reference_price[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  wire[at] = noii_message_record.cross_type; at = at + 1;
  wire[at] = noii_message_record.price_variation_indicator; at = at + 1;
  skip
}

/* Noii Message off the wire, 47 bytes from where the cursor stands */
inline decode_noii_message(noii_message_record) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> noii_message_record.tracking_number[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> noii_message_record.timestamp[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.paired_shares[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.imbalance_shares[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.imbalance_direction = wire[at]; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.stock_alphanumeric_8[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.far_price[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.near_price[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.current_reference_price[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.cross_type = wire[at]; at = at + 1;
  noii_message_record.price_variation_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Noii Message is what was written, byte for byte */
inline equal_noii_message(noii_message_read, noii_message_written) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> assert(noii_message_read.tracking_number[noii_message_at] == noii_message_written.tracking_number[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> assert(noii_message_read.timestamp[noii_message_at] == noii_message_written.timestamp[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> assert(noii_message_read.paired_shares[noii_message_at] == noii_message_written.paired_shares[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> assert(noii_message_read.imbalance_shares[noii_message_at] == noii_message_written.imbalance_shares[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  assert(noii_message_read.imbalance_direction == noii_message_written.imbalance_direction);
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> assert(noii_message_read.stock_alphanumeric_8[noii_message_at] == noii_message_written.stock_alphanumeric_8[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.far_price[noii_message_at] == noii_message_written.far_price[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.near_price[noii_message_at] == noii_message_written.near_price[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.current_reference_price[noii_message_at] == noii_message_written.current_reference_price[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  assert(noii_message_read.cross_type == noii_message_written.cross_type);
  assert(noii_message_read.price_variation_indicator == noii_message_written.price_variation_indicator);
  skip
}

/* ---- Cross Trade Message: 37 bytes ------------------------------------------- */

/* Cross Trade message indicates that Nasdaq has completed its cross process for a specific security. Nasdaq sends out a Cross Trade message for all active issues in the system following the Opening, Closing and EMC cross events. Firms may use the Cross Trade message to determine when the cross for each security has been completed. */
typedef CrossTradeMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte shares[8];
  byte stock_alphanumeric_8[8];
  byte cross_price[4];
  byte match_number[8];
  byte cross_type
};

int cross_trade_message_at;

/* every byte of Cross Trade Message set to one value */
inline fill_cross_trade_message(cross_trade_message_record, cross_trade_message_value) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.tracking_number[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> cross_trade_message_record.timestamp[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.shares[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.stock_alphanumeric_8[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.match_number[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = cross_trade_message_value;
  skip
}

/* each byte of Cross Trade Message set to where it lies, so a field read out of place says so */
inline ramp_cross_trade_message(cross_trade_message_record, cross_trade_message_base) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.tracking_number[cross_trade_message_at] = (cross_trade_message_base + 0 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> cross_trade_message_record.timestamp[cross_trade_message_at] = (cross_trade_message_base + 2 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.shares[cross_trade_message_at] = (cross_trade_message_base + 8 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.stock_alphanumeric_8[cross_trade_message_at] = (cross_trade_message_base + 16 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = (cross_trade_message_base + 24 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.match_number[cross_trade_message_at] = (cross_trade_message_base + 28 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = (cross_trade_message_base + 36 + 1) % 256;
  skip
}

/* Cross Trade Message to the wire, 37 bytes from where the cursor stands */
inline encode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> wire[at] = cross_trade_message_record.tracking_number[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> wire[at] = cross_trade_message_record.timestamp[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> wire[at] = cross_trade_message_record.shares[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> wire[at] = cross_trade_message_record.stock_alphanumeric_8[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.cross_price[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> wire[at] = cross_trade_message_record.match_number[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_trade_message_record.cross_type; at = at + 1;
  skip
}

/* Cross Trade Message off the wire, 37 bytes from where the cursor stands */
inline decode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.tracking_number[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> cross_trade_message_record.timestamp[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.shares[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.stock_alphanumeric_8[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.match_number[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Cross Trade Message is what was written, byte for byte */
inline equal_cross_trade_message(cross_trade_message_read, cross_trade_message_written) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> assert(cross_trade_message_read.tracking_number[cross_trade_message_at] == cross_trade_message_written.tracking_number[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> assert(cross_trade_message_read.timestamp[cross_trade_message_at] == cross_trade_message_written.timestamp[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> assert(cross_trade_message_read.shares[cross_trade_message_at] == cross_trade_message_written.shares[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> assert(cross_trade_message_read.stock_alphanumeric_8[cross_trade_message_at] == cross_trade_message_written.stock_alphanumeric_8[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.cross_price[cross_trade_message_at] == cross_trade_message_written.cross_price[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> assert(cross_trade_message_read.match_number[cross_trade_message_at] == cross_trade_message_written.match_number[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  assert(cross_trade_message_read.cross_type == cross_trade_message_written.cross_type);
  skip
}

/* ---- Ipo Quoting Period Update Message: 25 bytes ----------------------------- */

/* Indicates the anticipated IPO quotation release time of a security. */
typedef IpoQuotingPeriodUpdateMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte stock_alphanumeric_8[8];
  byte ipo_quotation_release_time[4];
  byte ipo_quotation_release_qualifier;
  byte ipo_price[4]
};

int ipo_quoting_period_update_message_at;

/* every byte of Ipo Quoting Period Update Message set to one value */
inline fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record, ipo_quoting_period_update_message_value) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> ipo_quoting_period_update_message_record.tracking_number[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> ipo_quoting_period_update_message_record.timestamp[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.stock_alphanumeric_8[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier = ipo_quoting_period_update_message_value;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ipo Quoting Period Update Message set to where it lies, so a field read out of place says so */
inline ramp_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record, ipo_quoting_period_update_message_base) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> ipo_quoting_period_update_message_record.tracking_number[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 0 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> ipo_quoting_period_update_message_record.timestamp[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 2 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.stock_alphanumeric_8[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 8 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 16 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier = (ipo_quoting_period_update_message_base + 20 + 1) % 256;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 21 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update Message to the wire, 25 bytes from where the cursor stands */
inline encode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> wire[at] = ipo_quoting_period_update_message_record.tracking_number[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> wire[at] = ipo_quoting_period_update_message_record.timestamp[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> wire[at] = ipo_quoting_period_update_message_record.stock_alphanumeric_8[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> wire[at] = ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  wire[at] = ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier; at = at + 1;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> wire[at] = ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update Message off the wire, 25 bytes from where the cursor stands */
inline decode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> ipo_quoting_period_update_message_record.tracking_number[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> ipo_quoting_period_update_message_record.timestamp[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.stock_alphanumeric_8[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier = wire[at]; at = at + 1;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ipo Quoting Period Update Message is what was written, byte for byte */
inline equal_ipo_quoting_period_update_message(ipo_quoting_period_update_message_read, ipo_quoting_period_update_message_written) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> assert(ipo_quoting_period_update_message_read.tracking_number[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.tracking_number[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> assert(ipo_quoting_period_update_message_read.timestamp[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.timestamp[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> assert(ipo_quoting_period_update_message_read.stock_alphanumeric_8[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.stock_alphanumeric_8[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> assert(ipo_quoting_period_update_message_read.ipo_quotation_release_time[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.ipo_quotation_release_time[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  assert(ipo_quoting_period_update_message_read.ipo_quotation_release_qualifier == ipo_quoting_period_update_message_written.ipo_quotation_release_qualifier);
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> assert(ipo_quoting_period_update_message_read.ipo_price[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.ipo_price[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Direct Listing With Capital Raise Message: 45 bytes --------------------- */

/* Disseminated only for Direct Listing with Capital Raise (DLCR) securities, once per second once the DLCR volatility test has successfully passed. */
typedef DirectListingWithCapitalRaiseMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte stock_alpha_8[8];
  byte open_eligibility_status;
  byte minimum_allowable_price[4];
  byte maximum_allowable_price[4];
  byte near_execution_price[4];
  byte near_execution_time[8];
  byte lower_price_range_collar[4];
  byte upper_price_range_collar[4]
};

int direct_listing_with_capital_raise_message_at;

/* every byte of Direct Listing With Capital Raise Message set to one value */
inline fill_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_record, direct_listing_with_capital_raise_message_value) {
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 2 -> direct_listing_with_capital_raise_message_record.tracking_number[direct_listing_with_capital_raise_message_at] = direct_listing_with_capital_raise_message_value; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 6 -> direct_listing_with_capital_raise_message_record.timestamp[direct_listing_with_capital_raise_message_at] = direct_listing_with_capital_raise_message_value; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> direct_listing_with_capital_raise_message_record.stock_alpha_8[direct_listing_with_capital_raise_message_at] = direct_listing_with_capital_raise_message_value; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_record.open_eligibility_status = direct_listing_with_capital_raise_message_value;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.minimum_allowable_price[direct_listing_with_capital_raise_message_at] = direct_listing_with_capital_raise_message_value; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.maximum_allowable_price[direct_listing_with_capital_raise_message_at] = direct_listing_with_capital_raise_message_value; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.near_execution_price[direct_listing_with_capital_raise_message_at] = direct_listing_with_capital_raise_message_value; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> direct_listing_with_capital_raise_message_record.near_execution_time[direct_listing_with_capital_raise_message_at] = direct_listing_with_capital_raise_message_value; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.lower_price_range_collar[direct_listing_with_capital_raise_message_at] = direct_listing_with_capital_raise_message_value; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.upper_price_range_collar[direct_listing_with_capital_raise_message_at] = direct_listing_with_capital_raise_message_value; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Direct Listing With Capital Raise Message set to where it lies, so a field read out of place says so */
inline ramp_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_record, direct_listing_with_capital_raise_message_base) {
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 2 -> direct_listing_with_capital_raise_message_record.tracking_number[direct_listing_with_capital_raise_message_at] = (direct_listing_with_capital_raise_message_base + 0 + direct_listing_with_capital_raise_message_at + 1) % 256; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 6 -> direct_listing_with_capital_raise_message_record.timestamp[direct_listing_with_capital_raise_message_at] = (direct_listing_with_capital_raise_message_base + 2 + direct_listing_with_capital_raise_message_at + 1) % 256; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> direct_listing_with_capital_raise_message_record.stock_alpha_8[direct_listing_with_capital_raise_message_at] = (direct_listing_with_capital_raise_message_base + 8 + direct_listing_with_capital_raise_message_at + 1) % 256; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_record.open_eligibility_status = (direct_listing_with_capital_raise_message_base + 16 + 1) % 256;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.minimum_allowable_price[direct_listing_with_capital_raise_message_at] = (direct_listing_with_capital_raise_message_base + 17 + direct_listing_with_capital_raise_message_at + 1) % 256; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.maximum_allowable_price[direct_listing_with_capital_raise_message_at] = (direct_listing_with_capital_raise_message_base + 21 + direct_listing_with_capital_raise_message_at + 1) % 256; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.near_execution_price[direct_listing_with_capital_raise_message_at] = (direct_listing_with_capital_raise_message_base + 25 + direct_listing_with_capital_raise_message_at + 1) % 256; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> direct_listing_with_capital_raise_message_record.near_execution_time[direct_listing_with_capital_raise_message_at] = (direct_listing_with_capital_raise_message_base + 29 + direct_listing_with_capital_raise_message_at + 1) % 256; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.lower_price_range_collar[direct_listing_with_capital_raise_message_at] = (direct_listing_with_capital_raise_message_base + 37 + direct_listing_with_capital_raise_message_at + 1) % 256; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.upper_price_range_collar[direct_listing_with_capital_raise_message_at] = (direct_listing_with_capital_raise_message_base + 41 + direct_listing_with_capital_raise_message_at + 1) % 256; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  skip
}

/* Direct Listing With Capital Raise Message to the wire, 45 bytes from where the cursor stands */
inline encode_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_record) {
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 2 -> wire[at] = direct_listing_with_capital_raise_message_record.tracking_number[direct_listing_with_capital_raise_message_at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 6 -> wire[at] = direct_listing_with_capital_raise_message_record.timestamp[direct_listing_with_capital_raise_message_at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> wire[at] = direct_listing_with_capital_raise_message_record.stock_alpha_8[direct_listing_with_capital_raise_message_at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  wire[at] = direct_listing_with_capital_raise_message_record.open_eligibility_status; at = at + 1;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_message_record.minimum_allowable_price[direct_listing_with_capital_raise_message_at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_message_record.maximum_allowable_price[direct_listing_with_capital_raise_message_at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_message_record.near_execution_price[direct_listing_with_capital_raise_message_at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> wire[at] = direct_listing_with_capital_raise_message_record.near_execution_time[direct_listing_with_capital_raise_message_at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_message_record.lower_price_range_collar[direct_listing_with_capital_raise_message_at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_message_record.upper_price_range_collar[direct_listing_with_capital_raise_message_at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  skip
}

/* Direct Listing With Capital Raise Message off the wire, 45 bytes from where the cursor stands */
inline decode_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_record) {
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 2 -> direct_listing_with_capital_raise_message_record.tracking_number[direct_listing_with_capital_raise_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 6 -> direct_listing_with_capital_raise_message_record.timestamp[direct_listing_with_capital_raise_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> direct_listing_with_capital_raise_message_record.stock_alpha_8[direct_listing_with_capital_raise_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_record.open_eligibility_status = wire[at]; at = at + 1;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.minimum_allowable_price[direct_listing_with_capital_raise_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.maximum_allowable_price[direct_listing_with_capital_raise_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.near_execution_price[direct_listing_with_capital_raise_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> direct_listing_with_capital_raise_message_record.near_execution_time[direct_listing_with_capital_raise_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.lower_price_range_collar[direct_listing_with_capital_raise_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> direct_listing_with_capital_raise_message_record.upper_price_range_collar[direct_listing_with_capital_raise_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Direct Listing With Capital Raise Message is what was written, byte for byte */
inline equal_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_read, direct_listing_with_capital_raise_message_written) {
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 2 -> assert(direct_listing_with_capital_raise_message_read.tracking_number[direct_listing_with_capital_raise_message_at] == direct_listing_with_capital_raise_message_written.tracking_number[direct_listing_with_capital_raise_message_at]); direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 6 -> assert(direct_listing_with_capital_raise_message_read.timestamp[direct_listing_with_capital_raise_message_at] == direct_listing_with_capital_raise_message_written.timestamp[direct_listing_with_capital_raise_message_at]); direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> assert(direct_listing_with_capital_raise_message_read.stock_alpha_8[direct_listing_with_capital_raise_message_at] == direct_listing_with_capital_raise_message_written.stock_alpha_8[direct_listing_with_capital_raise_message_at]); direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  assert(direct_listing_with_capital_raise_message_read.open_eligibility_status == direct_listing_with_capital_raise_message_written.open_eligibility_status);
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> assert(direct_listing_with_capital_raise_message_read.minimum_allowable_price[direct_listing_with_capital_raise_message_at] == direct_listing_with_capital_raise_message_written.minimum_allowable_price[direct_listing_with_capital_raise_message_at]); direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> assert(direct_listing_with_capital_raise_message_read.maximum_allowable_price[direct_listing_with_capital_raise_message_at] == direct_listing_with_capital_raise_message_written.maximum_allowable_price[direct_listing_with_capital_raise_message_at]); direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> assert(direct_listing_with_capital_raise_message_read.near_execution_price[direct_listing_with_capital_raise_message_at] == direct_listing_with_capital_raise_message_written.near_execution_price[direct_listing_with_capital_raise_message_at]); direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 8 -> assert(direct_listing_with_capital_raise_message_read.near_execution_time[direct_listing_with_capital_raise_message_at] == direct_listing_with_capital_raise_message_written.near_execution_time[direct_listing_with_capital_raise_message_at]); direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> assert(direct_listing_with_capital_raise_message_read.lower_price_range_collar[direct_listing_with_capital_raise_message_at] == direct_listing_with_capital_raise_message_written.lower_price_range_collar[direct_listing_with_capital_raise_message_at]); direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_message_at = 0;
  do
  :: direct_listing_with_capital_raise_message_at < 4 -> assert(direct_listing_with_capital_raise_message_read.upper_price_range_collar[direct_listing_with_capital_raise_message_at] == direct_listing_with_capital_raise_message_written.upper_price_range_collar[direct_listing_with_capital_raise_message_at]); direct_listing_with_capital_raise_message_at = direct_listing_with_capital_raise_message_at + 1
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
    assert(at == 3);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 3);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* System Event Message: encoded, read back, and compared */
proctype check_system_event_message() {
  SystemEventMessage system_event_message_sent;
  SystemEventMessage system_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_event_message(system_event_message_sent, 0)
  :: pattern == 1 -> fill_system_event_message(system_event_message_sent, 32)
  :: pattern == 2 -> fill_system_event_message(system_event_message_sent, 255)
  :: else -> ramp_system_event_message(system_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_event_message(system_event_message_sent);
    assert(at == 9);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 9);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Stock Directory Message: encoded, read back, and compared */
proctype check_stock_directory_message() {
  StockDirectoryMessage stock_directory_message_sent;
  StockDirectoryMessage stock_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_directory_message(stock_directory_message_sent, 0)
  :: pattern == 1 -> fill_stock_directory_message(stock_directory_message_sent, 32)
  :: pattern == 2 -> fill_stock_directory_message(stock_directory_message_sent, 255)
  :: else -> ramp_stock_directory_message(stock_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_directory_message(stock_directory_message_sent);
    assert(at == 36);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 36);
    equal_stock_directory_message(stock_directory_message_got, stock_directory_message_sent)
  }
}

/* Stock Trading Action Message: encoded, read back, and compared */
proctype check_stock_trading_action_message() {
  StockTradingActionMessage stock_trading_action_message_sent;
  StockTradingActionMessage stock_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 255)
  :: else -> ramp_stock_trading_action_message(stock_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_trading_action_message(stock_trading_action_message_sent);
    assert(at == 21);
    at = 0;
    decode_stock_trading_action_message(stock_trading_action_message_got);
    assert(at == 21);
    equal_stock_trading_action_message(stock_trading_action_message_got, stock_trading_action_message_sent)
  }
}

/* Reg Sho Restriction Message: encoded, read back, and compared */
proctype check_reg_sho_restriction_message() {
  RegShoRestrictionMessage reg_sho_restriction_message_sent;
  RegShoRestrictionMessage reg_sho_restriction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 0)
  :: pattern == 1 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 32)
  :: pattern == 2 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 255)
  :: else -> ramp_reg_sho_restriction_message(reg_sho_restriction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reg_sho_restriction_message(reg_sho_restriction_message_sent);
    assert(at == 17);
    at = 0;
    decode_reg_sho_restriction_message(reg_sho_restriction_message_got);
    assert(at == 17);
    equal_reg_sho_restriction_message(reg_sho_restriction_message_got, reg_sho_restriction_message_sent)
  }
}

/* Noii Message: encoded, read back, and compared */
proctype check_noii_message() {
  NoiiMessage noii_message_sent;
  NoiiMessage noii_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_noii_message(noii_message_sent, 0)
  :: pattern == 1 -> fill_noii_message(noii_message_sent, 32)
  :: pattern == 2 -> fill_noii_message(noii_message_sent, 255)
  :: else -> ramp_noii_message(noii_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_noii_message(noii_message_sent);
    assert(at == 47);
    at = 0;
    decode_noii_message(noii_message_got);
    assert(at == 47);
    equal_noii_message(noii_message_got, noii_message_sent)
  }
}

/* Cross Trade Message: encoded, read back, and compared */
proctype check_cross_trade_message() {
  CrossTradeMessage cross_trade_message_sent;
  CrossTradeMessage cross_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_trade_message(cross_trade_message_sent, 0)
  :: pattern == 1 -> fill_cross_trade_message(cross_trade_message_sent, 32)
  :: pattern == 2 -> fill_cross_trade_message(cross_trade_message_sent, 255)
  :: else -> ramp_cross_trade_message(cross_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_trade_message(cross_trade_message_sent);
    assert(at == 37);
    at = 0;
    decode_cross_trade_message(cross_trade_message_got);
    assert(at == 37);
    equal_cross_trade_message(cross_trade_message_got, cross_trade_message_sent)
  }
}

/* Ipo Quoting Period Update Message: encoded, read back, and compared */
proctype check_ipo_quoting_period_update_message() {
  IpoQuotingPeriodUpdateMessage ipo_quoting_period_update_message_sent;
  IpoQuotingPeriodUpdateMessage ipo_quoting_period_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 0)
  :: pattern == 1 -> fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 32)
  :: pattern == 2 -> fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 255)
  :: else -> ramp_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent);
    assert(at == 25);
    at = 0;
    decode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_got);
    assert(at == 25);
    equal_ipo_quoting_period_update_message(ipo_quoting_period_update_message_got, ipo_quoting_period_update_message_sent)
  }
}

/* Direct Listing With Capital Raise Message: encoded, read back, and compared */
proctype check_direct_listing_with_capital_raise_message() {
  DirectListingWithCapitalRaiseMessage direct_listing_with_capital_raise_message_sent;
  DirectListingWithCapitalRaiseMessage direct_listing_with_capital_raise_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_sent, 0)
  :: pattern == 1 -> fill_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_sent, 32)
  :: pattern == 2 -> fill_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_sent, 255)
  :: else -> ramp_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_sent);
    assert(at == 45);
    at = 0;
    decode_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_got);
    assert(at == 45);
    equal_direct_listing_with_capital_raise_message(direct_listing_with_capital_raise_message_got, direct_listing_with_capital_raise_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_stock_directory_message()
  :: run check_stock_trading_action_message()
  :: run check_reg_sho_restriction_message()
  :: run check_noii_message()
  :: run check_cross_trade_message()
  :: run check_ipo_quoting_period_update_message()
  :: run check_direct_listing_with_capital_raise_message()
  fi
}
