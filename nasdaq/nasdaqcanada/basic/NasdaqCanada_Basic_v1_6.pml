/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Nasdaq Basic Canada
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
#define WIRE 74

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

/* ---- Quotation Message: 58 bytes --------------------------------------------- */

/* Combined Quotation Report of the Nasdaq Canada best bid and offer, with size attributed to the CXC and CX2 trading books. */
typedef QuotationMessage {
  byte time_stamp[8];
  byte stock_symbol[10];
  byte nasdaq_canada_best_bid_price[8];
  byte nasdaq_canada_best_bid_size[4];
  byte nasdaq_cxc_best_bid_size[4];
  byte nasdaq_cx_2_best_bid_size[4];
  byte nasdaq_canada_best_ask_price[8];
  byte nasdaq_canada_best_ask_size[4];
  byte nasdaq_cxc_best_ask_size[4];
  byte nasdaq_cx_2_best_ask_size[4]
};

int quotation_message_at;

/* every byte of Quotation Message set to one value */
inline fill_quotation_message(quotation_message_record, quotation_message_value) {
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> quotation_message_record.time_stamp[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 10 -> quotation_message_record.stock_symbol[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> quotation_message_record.nasdaq_canada_best_bid_price[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_canada_best_bid_size[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cxc_best_bid_size[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cx_2_best_bid_size[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> quotation_message_record.nasdaq_canada_best_ask_price[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_canada_best_ask_size[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cxc_best_ask_size[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cx_2_best_ask_size[quotation_message_at] = quotation_message_value; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quotation Message set to where it lies, so a field read out of place says so */
inline ramp_quotation_message(quotation_message_record, quotation_message_base) {
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> quotation_message_record.time_stamp[quotation_message_at] = (quotation_message_base + 0 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 10 -> quotation_message_record.stock_symbol[quotation_message_at] = (quotation_message_base + 8 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> quotation_message_record.nasdaq_canada_best_bid_price[quotation_message_at] = (quotation_message_base + 18 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_canada_best_bid_size[quotation_message_at] = (quotation_message_base + 26 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cxc_best_bid_size[quotation_message_at] = (quotation_message_base + 30 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cx_2_best_bid_size[quotation_message_at] = (quotation_message_base + 34 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> quotation_message_record.nasdaq_canada_best_ask_price[quotation_message_at] = (quotation_message_base + 38 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_canada_best_ask_size[quotation_message_at] = (quotation_message_base + 46 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cxc_best_ask_size[quotation_message_at] = (quotation_message_base + 50 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cx_2_best_ask_size[quotation_message_at] = (quotation_message_base + 54 + quotation_message_at + 1) % 256; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quotation Message to the wire, 58 bytes from where the cursor stands */
inline encode_quotation_message(quotation_message_record) {
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> wire[at] = quotation_message_record.time_stamp[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 10 -> wire[at] = quotation_message_record.stock_symbol[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> wire[at] = quotation_message_record.nasdaq_canada_best_bid_price[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> wire[at] = quotation_message_record.nasdaq_canada_best_bid_size[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> wire[at] = quotation_message_record.nasdaq_cxc_best_bid_size[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> wire[at] = quotation_message_record.nasdaq_cx_2_best_bid_size[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> wire[at] = quotation_message_record.nasdaq_canada_best_ask_price[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> wire[at] = quotation_message_record.nasdaq_canada_best_ask_size[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> wire[at] = quotation_message_record.nasdaq_cxc_best_ask_size[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> wire[at] = quotation_message_record.nasdaq_cx_2_best_ask_size[quotation_message_at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quotation Message off the wire, 58 bytes from where the cursor stands */
inline decode_quotation_message(quotation_message_record) {
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> quotation_message_record.time_stamp[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 10 -> quotation_message_record.stock_symbol[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> quotation_message_record.nasdaq_canada_best_bid_price[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_canada_best_bid_size[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cxc_best_bid_size[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cx_2_best_bid_size[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> quotation_message_record.nasdaq_canada_best_ask_price[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_canada_best_ask_size[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cxc_best_ask_size[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> quotation_message_record.nasdaq_cx_2_best_ask_size[quotation_message_at] = wire[at]; at = at + 1; quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quotation Message is what was written, byte for byte */
inline equal_quotation_message(quotation_message_read, quotation_message_written) {
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> assert(quotation_message_read.time_stamp[quotation_message_at] == quotation_message_written.time_stamp[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 10 -> assert(quotation_message_read.stock_symbol[quotation_message_at] == quotation_message_written.stock_symbol[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> assert(quotation_message_read.nasdaq_canada_best_bid_price[quotation_message_at] == quotation_message_written.nasdaq_canada_best_bid_price[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> assert(quotation_message_read.nasdaq_canada_best_bid_size[quotation_message_at] == quotation_message_written.nasdaq_canada_best_bid_size[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> assert(quotation_message_read.nasdaq_cxc_best_bid_size[quotation_message_at] == quotation_message_written.nasdaq_cxc_best_bid_size[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> assert(quotation_message_read.nasdaq_cx_2_best_bid_size[quotation_message_at] == quotation_message_written.nasdaq_cx_2_best_bid_size[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 8 -> assert(quotation_message_read.nasdaq_canada_best_ask_price[quotation_message_at] == quotation_message_written.nasdaq_canada_best_ask_price[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> assert(quotation_message_read.nasdaq_canada_best_ask_size[quotation_message_at] == quotation_message_written.nasdaq_canada_best_ask_size[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> assert(quotation_message_read.nasdaq_cxc_best_ask_size[quotation_message_at] == quotation_message_written.nasdaq_cxc_best_ask_size[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  quotation_message_at = 0;
  do
  :: quotation_message_at < 4 -> assert(quotation_message_read.nasdaq_cx_2_best_ask_size[quotation_message_at] == quotation_message_written.nasdaq_cx_2_best_ask_size[quotation_message_at]); quotation_message_at = quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sale Condition Modifier: 4 bytes ---------------------------------------- */

/* Sale condition modifier consists of four levels */
typedef SaleConditionModifier {
  byte sale_condition_modifier_level_1;
  byte sales_condition_modifier_level_2;
  byte sales_condition_modifier_level_3;
  byte sales_condition_modifier_level_4
};

/* every byte of Sale Condition Modifier set to one value */
inline fill_sale_condition_modifier(sale_condition_modifier_record, sale_condition_modifier_value) {
  sale_condition_modifier_record.sale_condition_modifier_level_1 = sale_condition_modifier_value;
  sale_condition_modifier_record.sales_condition_modifier_level_2 = sale_condition_modifier_value;
  sale_condition_modifier_record.sales_condition_modifier_level_3 = sale_condition_modifier_value;
  sale_condition_modifier_record.sales_condition_modifier_level_4 = sale_condition_modifier_value;
  skip
}

/* each byte of Sale Condition Modifier set to where it lies, so a field read out of place says so */
inline ramp_sale_condition_modifier(sale_condition_modifier_record, sale_condition_modifier_base) {
  sale_condition_modifier_record.sale_condition_modifier_level_1 = (sale_condition_modifier_base + 0 + 1) % 256;
  sale_condition_modifier_record.sales_condition_modifier_level_2 = (sale_condition_modifier_base + 1 + 1) % 256;
  sale_condition_modifier_record.sales_condition_modifier_level_3 = (sale_condition_modifier_base + 2 + 1) % 256;
  sale_condition_modifier_record.sales_condition_modifier_level_4 = (sale_condition_modifier_base + 3 + 1) % 256;
  skip
}

/* Sale Condition Modifier to the wire, 4 bytes from where the cursor stands */
inline encode_sale_condition_modifier(sale_condition_modifier_record) {
  wire[at] = sale_condition_modifier_record.sale_condition_modifier_level_1; at = at + 1;
  wire[at] = sale_condition_modifier_record.sales_condition_modifier_level_2; at = at + 1;
  wire[at] = sale_condition_modifier_record.sales_condition_modifier_level_3; at = at + 1;
  wire[at] = sale_condition_modifier_record.sales_condition_modifier_level_4; at = at + 1;
  skip
}

/* Sale Condition Modifier off the wire, 4 bytes from where the cursor stands */
inline decode_sale_condition_modifier(sale_condition_modifier_record) {
  sale_condition_modifier_record.sale_condition_modifier_level_1 = wire[at]; at = at + 1;
  sale_condition_modifier_record.sales_condition_modifier_level_2 = wire[at]; at = at + 1;
  sale_condition_modifier_record.sales_condition_modifier_level_3 = wire[at]; at = at + 1;
  sale_condition_modifier_record.sales_condition_modifier_level_4 = wire[at]; at = at + 1;
  skip
}

/* what was read of Sale Condition Modifier is what was written, byte for byte */
inline equal_sale_condition_modifier(sale_condition_modifier_read, sale_condition_modifier_written) {
  assert(sale_condition_modifier_read.sale_condition_modifier_level_1 == sale_condition_modifier_written.sale_condition_modifier_level_1);
  assert(sale_condition_modifier_read.sales_condition_modifier_level_2 == sale_condition_modifier_written.sales_condition_modifier_level_2);
  assert(sale_condition_modifier_read.sales_condition_modifier_level_3 == sale_condition_modifier_written.sales_condition_modifier_level_3);
  assert(sale_condition_modifier_read.sales_condition_modifier_level_4 == sale_condition_modifier_written.sales_condition_modifier_level_4);
  skip
}

/* ---- Trade Report Message: 53 bytes ------------------------------------------ */

/* Relays all transactions available from or reported by the three Nasdaq Canada Trading Books for the current business day. */
typedef TradeReportMessage {
  byte time_stamp[8];
  byte originating_market_center_identifier;
  byte stock_symbol[10];
  byte trade_number[4];
  byte trade_price[8];
  byte trade_size[4];
  byte broker[3];
  byte contra_broker[3];
  SaleConditionModifier sale_condition_modifier;
  byte consolidated_trade_volume[8]
};

int trade_report_message_at;

/* every byte of Trade Report Message set to one value */
inline fill_trade_report_message(trade_report_message_record, trade_report_message_value) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.time_stamp[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.originating_market_center_identifier = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.stock_symbol[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_number[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> trade_report_message_record.broker[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> trade_report_message_record.contra_broker[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  fill_sale_condition_modifier(trade_report_message_record.sale_condition_modifier, trade_report_message_value);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.consolidated_trade_volume[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message(trade_report_message_record, trade_report_message_base) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.time_stamp[trade_report_message_at] = (trade_report_message_base + 0 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.originating_market_center_identifier = (trade_report_message_base + 8 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.stock_symbol[trade_report_message_at] = (trade_report_message_base + 9 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_number[trade_report_message_at] = (trade_report_message_base + 19 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = (trade_report_message_base + 23 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = (trade_report_message_base + 31 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> trade_report_message_record.broker[trade_report_message_at] = (trade_report_message_base + 35 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> trade_report_message_record.contra_broker[trade_report_message_at] = (trade_report_message_base + 38 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  ramp_sale_condition_modifier(trade_report_message_record.sale_condition_modifier, trade_report_message_base + 41);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.consolidated_trade_volume[trade_report_message_at] = (trade_report_message_base + 45 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message to the wire, 53 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.time_stamp[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.originating_market_center_identifier; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> wire[at] = trade_report_message_record.stock_symbol[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_number[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.trade_price[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_size[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> wire[at] = trade_report_message_record.broker[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> wire[at] = trade_report_message_record.contra_broker[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  encode_sale_condition_modifier(trade_report_message_record.sale_condition_modifier);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.consolidated_trade_volume[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message off the wire, 53 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.time_stamp[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.stock_symbol[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_number[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> trade_report_message_record.broker[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> trade_report_message_record.contra_broker[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  decode_sale_condition_modifier(trade_report_message_record.sale_condition_modifier);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.consolidated_trade_volume[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Report Message is what was written, byte for byte */
inline equal_trade_report_message(trade_report_message_read, trade_report_message_written) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.time_stamp[trade_report_message_at] == trade_report_message_written.time_stamp[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.originating_market_center_identifier == trade_report_message_written.originating_market_center_identifier);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> assert(trade_report_message_read.stock_symbol[trade_report_message_at] == trade_report_message_written.stock_symbol[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_number[trade_report_message_at] == trade_report_message_written.trade_number[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.trade_price[trade_report_message_at] == trade_report_message_written.trade_price[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_size[trade_report_message_at] == trade_report_message_written.trade_size[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> assert(trade_report_message_read.broker[trade_report_message_at] == trade_report_message_written.broker[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 3 -> assert(trade_report_message_read.contra_broker[trade_report_message_at] == trade_report_message_written.contra_broker[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  equal_sale_condition_modifier(trade_report_message_read.sale_condition_modifier, trade_report_message_written.sale_condition_modifier);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.consolidated_trade_volume[trade_report_message_at] == trade_report_message_written.consolidated_trade_volume[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Break Message: 13 bytes ------------------------------------------- */

/* Sent if a Trade is cancelled during the same day as its execution. */
typedef TradeBreakMessage {
  byte time_stamp[8];
  byte trade_control_number[4];
  byte originating_market_center_identifier
};

int trade_break_message_at;

/* every byte of Trade Break Message set to one value */
inline fill_trade_break_message(trade_break_message_record, trade_break_message_value) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.time_stamp[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.trade_control_number[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.originating_market_center_identifier = trade_break_message_value;
  skip
}

/* each byte of Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_trade_break_message(trade_break_message_record, trade_break_message_base) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.time_stamp[trade_break_message_at] = (trade_break_message_base + 0 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.trade_control_number[trade_break_message_at] = (trade_break_message_base + 8 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.originating_market_center_identifier = (trade_break_message_base + 12 + 1) % 256;
  skip
}

/* Trade Break Message to the wire, 13 bytes from where the cursor stands */
inline encode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.time_stamp[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> wire[at] = trade_break_message_record.trade_control_number[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_break_message_record.originating_market_center_identifier; at = at + 1;
  skip
}

/* Trade Break Message off the wire, 13 bytes from where the cursor stands */
inline decode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.time_stamp[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.trade_control_number[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Break Message is what was written, byte for byte */
inline equal_trade_break_message(trade_break_message_read, trade_break_message_written) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.time_stamp[trade_break_message_at] == trade_break_message_written.time_stamp[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> assert(trade_break_message_read.trade_control_number[trade_break_message_at] == trade_break_message_written.trade_control_number[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  assert(trade_break_message_read.originating_market_center_identifier == trade_break_message_written.originating_market_center_identifier);
  skip
}

/* ---- Trade Correction Message: 47 bytes -------------------------------------- */

/* Sent if a Trade is corrected during the same day as its execution. */
typedef TradeCorrectionMessage {
  byte time_stamp[8];
  byte originating_market_center_identifier;
  byte stock_symbol[10];
  byte original_trade_number[4];
  byte original_trade_price[8];
  byte original_trade_size[4];
  byte corrected_trade_price[8];
  byte corrected_trade_size[4]
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.time_stamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.originating_market_center_identifier = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.stock_symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.time_stamp[trade_correction_message_at] = (trade_correction_message_base + 0 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.originating_market_center_identifier = (trade_correction_message_base + 8 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.stock_symbol[trade_correction_message_at] = (trade_correction_message_base + 9 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_number[trade_correction_message_at] = (trade_correction_message_base + 19 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = (trade_correction_message_base + 23 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = (trade_correction_message_base + 31 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = (trade_correction_message_base + 35 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = (trade_correction_message_base + 43 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message to the wire, 47 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.time_stamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.originating_market_center_identifier; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> wire[at] = trade_correction_message_record.stock_symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_trade_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.original_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.corrected_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message off the wire, 47 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.time_stamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.stock_symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.time_stamp[trade_correction_message_at] == trade_correction_message_written.time_stamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.originating_market_center_identifier == trade_correction_message_written.originating_market_center_identifier);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> assert(trade_correction_message_read.stock_symbol[trade_correction_message_at] == trade_correction_message_written.stock_symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_trade_number[trade_correction_message_at] == trade_correction_message_written.original_trade_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.original_trade_price[trade_correction_message_at] == trade_correction_message_written.original_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_trade_size[trade_correction_message_at] == trade_correction_message_written.original_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.corrected_trade_price[trade_correction_message_at] == trade_correction_message_written.corrected_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_trade_size[trade_correction_message_at] == trade_correction_message_written.corrected_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 10 bytes ------------------------------------------ */

/* Issued to indicate a market state event. */
typedef SystemEventMessage {
  byte time_stamp[8];
  byte originating_market_center_identifier;
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.time_stamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.originating_market_center_identifier = system_event_message_value;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.time_stamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.originating_market_center_identifier = (system_event_message_base + 8 + 1) % 256;
  system_event_message_record.event_code = (system_event_message_base + 9 + 1) % 256;
  skip
}

/* System Event Message to the wire, 10 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.time_stamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.originating_market_center_identifier; at = at + 1;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 10 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.time_stamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.time_stamp[system_event_message_at] == system_event_message_written.time_stamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.originating_market_center_identifier == system_event_message_written.originating_market_center_identifier);
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Stock Directory Message: 64 bytes --------------------------------------- */

/* Disseminated at the start of each trading day for all active symbols in the Nasdaq Execution system. */
typedef StockDirectoryMessage {
  byte time_stamp[8];
  byte stock_symbol[10];
  byte stock_display_name[40];
  byte listing_market;
  byte board_lot_size[4];
  byte currency
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.time_stamp[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> stock_directory_message_record.stock_symbol[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 40 -> stock_directory_message_record.stock_display_name[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.listing_market = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.board_lot_size[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.currency = stock_directory_message_value;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.time_stamp[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> stock_directory_message_record.stock_symbol[stock_directory_message_at] = (stock_directory_message_base + 8 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 40 -> stock_directory_message_record.stock_display_name[stock_directory_message_at] = (stock_directory_message_base + 18 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.listing_market = (stock_directory_message_base + 58 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.board_lot_size[stock_directory_message_at] = (stock_directory_message_base + 59 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.currency = (stock_directory_message_base + 63 + 1) % 256;
  skip
}

/* Stock Directory Message to the wire, 64 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> wire[at] = stock_directory_message_record.time_stamp[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> wire[at] = stock_directory_message_record.stock_symbol[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 40 -> wire[at] = stock_directory_message_record.stock_display_name[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.listing_market; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.board_lot_size[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.currency; at = at + 1;
  skip
}

/* Stock Directory Message off the wire, 64 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.time_stamp[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> stock_directory_message_record.stock_symbol[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 40 -> stock_directory_message_record.stock_display_name[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.listing_market = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.board_lot_size[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.currency = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> assert(stock_directory_message_read.time_stamp[stock_directory_message_at] == stock_directory_message_written.time_stamp[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> assert(stock_directory_message_read.stock_symbol[stock_directory_message_at] == stock_directory_message_written.stock_symbol[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 40 -> assert(stock_directory_message_read.stock_display_name[stock_directory_message_at] == stock_directory_message_written.stock_display_name[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.listing_market == stock_directory_message_written.listing_market);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.board_lot_size[stock_directory_message_at] == stock_directory_message_written.board_lot_size[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.currency == stock_directory_message_written.currency);
  skip
}

/* ---- Stock Status Message: 20 bytes ------------------------------------------ */

/* Indicates the current trading status of a stock. */
typedef StockStatusMessage {
  byte time_stamp[8];
  byte stock_symbol[10];
  byte market;
  byte system_status
};

int stock_status_message_at;

/* every byte of Stock Status Message set to one value */
inline fill_stock_status_message(stock_status_message_record, stock_status_message_value) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.time_stamp[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> stock_status_message_record.stock_symbol[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.market = stock_status_message_value;
  stock_status_message_record.system_status = stock_status_message_value;
  skip
}

/* each byte of Stock Status Message set to where it lies, so a field read out of place says so */
inline ramp_stock_status_message(stock_status_message_record, stock_status_message_base) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.time_stamp[stock_status_message_at] = (stock_status_message_base + 0 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> stock_status_message_record.stock_symbol[stock_status_message_at] = (stock_status_message_base + 8 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.market = (stock_status_message_base + 18 + 1) % 256;
  stock_status_message_record.system_status = (stock_status_message_base + 19 + 1) % 256;
  skip
}

/* Stock Status Message to the wire, 20 bytes from where the cursor stands */
inline encode_stock_status_message(stock_status_message_record) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> wire[at] = stock_status_message_record.time_stamp[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> wire[at] = stock_status_message_record.stock_symbol[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_status_message_record.market; at = at + 1;
  wire[at] = stock_status_message_record.system_status; at = at + 1;
  skip
}

/* Stock Status Message off the wire, 20 bytes from where the cursor stands */
inline decode_stock_status_message(stock_status_message_record) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.time_stamp[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> stock_status_message_record.stock_symbol[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.market = wire[at]; at = at + 1;
  stock_status_message_record.system_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Status Message is what was written, byte for byte */
inline equal_stock_status_message(stock_status_message_read, stock_status_message_written) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> assert(stock_status_message_read.time_stamp[stock_status_message_at] == stock_status_message_written.time_stamp[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> assert(stock_status_message_read.stock_symbol[stock_status_message_at] == stock_status_message_written.stock_symbol[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  assert(stock_status_message_read.market == stock_status_message_written.market);
  assert(stock_status_message_read.system_status == stock_status_message_written.system_status);
  skip
}

/* ---- End Of Day Trade Summary Message: 74 bytes ------------------------------ */

/* Published once at 4:15PM and again at 5:15PM, including all traded symbols from the day. */
typedef EndOfDayTradeSummaryMessage {
  byte time_stamp[8];
  byte stock_symbol[10];
  byte consolidated_high_price[8];
  byte consolidated_low_price[8];
  byte consolidated_open_price[8];
  byte listing_center_open_price[8];
  byte consolidated_close_price[8];
  byte listing_center_close_price[8];
  byte consolidated_volume[8]
};

int end_of_day_trade_summary_message_at;

/* every byte of End Of Day Trade Summary Message set to one value */
inline fill_end_of_day_trade_summary_message(end_of_day_trade_summary_message_record, end_of_day_trade_summary_message_value) {
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.time_stamp[end_of_day_trade_summary_message_at] = end_of_day_trade_summary_message_value; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 10 -> end_of_day_trade_summary_message_record.stock_symbol[end_of_day_trade_summary_message_at] = end_of_day_trade_summary_message_value; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_high_price[end_of_day_trade_summary_message_at] = end_of_day_trade_summary_message_value; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_low_price[end_of_day_trade_summary_message_at] = end_of_day_trade_summary_message_value; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_open_price[end_of_day_trade_summary_message_at] = end_of_day_trade_summary_message_value; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.listing_center_open_price[end_of_day_trade_summary_message_at] = end_of_day_trade_summary_message_value; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_close_price[end_of_day_trade_summary_message_at] = end_of_day_trade_summary_message_value; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.listing_center_close_price[end_of_day_trade_summary_message_at] = end_of_day_trade_summary_message_value; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_volume[end_of_day_trade_summary_message_at] = end_of_day_trade_summary_message_value; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Day Trade Summary Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_trade_summary_message(end_of_day_trade_summary_message_record, end_of_day_trade_summary_message_base) {
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.time_stamp[end_of_day_trade_summary_message_at] = (end_of_day_trade_summary_message_base + 0 + end_of_day_trade_summary_message_at + 1) % 256; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 10 -> end_of_day_trade_summary_message_record.stock_symbol[end_of_day_trade_summary_message_at] = (end_of_day_trade_summary_message_base + 8 + end_of_day_trade_summary_message_at + 1) % 256; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_high_price[end_of_day_trade_summary_message_at] = (end_of_day_trade_summary_message_base + 18 + end_of_day_trade_summary_message_at + 1) % 256; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_low_price[end_of_day_trade_summary_message_at] = (end_of_day_trade_summary_message_base + 26 + end_of_day_trade_summary_message_at + 1) % 256; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_open_price[end_of_day_trade_summary_message_at] = (end_of_day_trade_summary_message_base + 34 + end_of_day_trade_summary_message_at + 1) % 256; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.listing_center_open_price[end_of_day_trade_summary_message_at] = (end_of_day_trade_summary_message_base + 42 + end_of_day_trade_summary_message_at + 1) % 256; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_close_price[end_of_day_trade_summary_message_at] = (end_of_day_trade_summary_message_base + 50 + end_of_day_trade_summary_message_at + 1) % 256; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.listing_center_close_price[end_of_day_trade_summary_message_at] = (end_of_day_trade_summary_message_base + 58 + end_of_day_trade_summary_message_at + 1) % 256; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_volume[end_of_day_trade_summary_message_at] = (end_of_day_trade_summary_message_base + 66 + end_of_day_trade_summary_message_at + 1) % 256; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Trade Summary Message to the wire, 74 bytes from where the cursor stands */
inline encode_end_of_day_trade_summary_message(end_of_day_trade_summary_message_record) {
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> wire[at] = end_of_day_trade_summary_message_record.time_stamp[end_of_day_trade_summary_message_at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 10 -> wire[at] = end_of_day_trade_summary_message_record.stock_symbol[end_of_day_trade_summary_message_at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> wire[at] = end_of_day_trade_summary_message_record.consolidated_high_price[end_of_day_trade_summary_message_at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> wire[at] = end_of_day_trade_summary_message_record.consolidated_low_price[end_of_day_trade_summary_message_at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> wire[at] = end_of_day_trade_summary_message_record.consolidated_open_price[end_of_day_trade_summary_message_at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> wire[at] = end_of_day_trade_summary_message_record.listing_center_open_price[end_of_day_trade_summary_message_at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> wire[at] = end_of_day_trade_summary_message_record.consolidated_close_price[end_of_day_trade_summary_message_at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> wire[at] = end_of_day_trade_summary_message_record.listing_center_close_price[end_of_day_trade_summary_message_at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> wire[at] = end_of_day_trade_summary_message_record.consolidated_volume[end_of_day_trade_summary_message_at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Trade Summary Message off the wire, 74 bytes from where the cursor stands */
inline decode_end_of_day_trade_summary_message(end_of_day_trade_summary_message_record) {
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.time_stamp[end_of_day_trade_summary_message_at] = wire[at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 10 -> end_of_day_trade_summary_message_record.stock_symbol[end_of_day_trade_summary_message_at] = wire[at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_high_price[end_of_day_trade_summary_message_at] = wire[at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_low_price[end_of_day_trade_summary_message_at] = wire[at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_open_price[end_of_day_trade_summary_message_at] = wire[at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.listing_center_open_price[end_of_day_trade_summary_message_at] = wire[at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_close_price[end_of_day_trade_summary_message_at] = wire[at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.listing_center_close_price[end_of_day_trade_summary_message_at] = wire[at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> end_of_day_trade_summary_message_record.consolidated_volume[end_of_day_trade_summary_message_at] = wire[at]; at = at + 1; end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Day Trade Summary Message is what was written, byte for byte */
inline equal_end_of_day_trade_summary_message(end_of_day_trade_summary_message_read, end_of_day_trade_summary_message_written) {
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> assert(end_of_day_trade_summary_message_read.time_stamp[end_of_day_trade_summary_message_at] == end_of_day_trade_summary_message_written.time_stamp[end_of_day_trade_summary_message_at]); end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 10 -> assert(end_of_day_trade_summary_message_read.stock_symbol[end_of_day_trade_summary_message_at] == end_of_day_trade_summary_message_written.stock_symbol[end_of_day_trade_summary_message_at]); end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> assert(end_of_day_trade_summary_message_read.consolidated_high_price[end_of_day_trade_summary_message_at] == end_of_day_trade_summary_message_written.consolidated_high_price[end_of_day_trade_summary_message_at]); end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> assert(end_of_day_trade_summary_message_read.consolidated_low_price[end_of_day_trade_summary_message_at] == end_of_day_trade_summary_message_written.consolidated_low_price[end_of_day_trade_summary_message_at]); end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> assert(end_of_day_trade_summary_message_read.consolidated_open_price[end_of_day_trade_summary_message_at] == end_of_day_trade_summary_message_written.consolidated_open_price[end_of_day_trade_summary_message_at]); end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> assert(end_of_day_trade_summary_message_read.listing_center_open_price[end_of_day_trade_summary_message_at] == end_of_day_trade_summary_message_written.listing_center_open_price[end_of_day_trade_summary_message_at]); end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> assert(end_of_day_trade_summary_message_read.consolidated_close_price[end_of_day_trade_summary_message_at] == end_of_day_trade_summary_message_written.consolidated_close_price[end_of_day_trade_summary_message_at]); end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> assert(end_of_day_trade_summary_message_read.listing_center_close_price[end_of_day_trade_summary_message_at] == end_of_day_trade_summary_message_written.listing_center_close_price[end_of_day_trade_summary_message_at]); end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_trade_summary_message_at = 0;
  do
  :: end_of_day_trade_summary_message_at < 8 -> assert(end_of_day_trade_summary_message_read.consolidated_volume[end_of_day_trade_summary_message_at] == end_of_day_trade_summary_message_written.consolidated_volume[end_of_day_trade_summary_message_at]); end_of_day_trade_summary_message_at = end_of_day_trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Adjusted Closing Price Message: 27 bytes -------------------------------- */

/* Previous Day Adjusted Close Price, sent at 7:00AM to reflect any adjustments made overnight. */
typedef AdjustedClosingPriceMessage {
  byte time_stamp[8];
  byte issue_symbol[10];
  byte security_class;
  byte adjusted_closing_price[8]
};

int adjusted_closing_price_message_at;

/* every byte of Adjusted Closing Price Message set to one value */
inline fill_adjusted_closing_price_message(adjusted_closing_price_message_record, adjusted_closing_price_message_value) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.time_stamp[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> adjusted_closing_price_message_record.issue_symbol[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = adjusted_closing_price_message_value;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Adjusted Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_adjusted_closing_price_message(adjusted_closing_price_message_record, adjusted_closing_price_message_base) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.time_stamp[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 0 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> adjusted_closing_price_message_record.issue_symbol[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 8 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = (adjusted_closing_price_message_base + 18 + 1) % 256;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 19 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message to the wire, 27 bytes from where the cursor stands */
inline encode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> wire[at] = adjusted_closing_price_message_record.time_stamp[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> wire[at] = adjusted_closing_price_message_record.issue_symbol[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = adjusted_closing_price_message_record.security_class; at = at + 1;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> wire[at] = adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message off the wire, 27 bytes from where the cursor stands */
inline decode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.time_stamp[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> adjusted_closing_price_message_record.issue_symbol[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = wire[at]; at = at + 1;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Adjusted Closing Price Message is what was written, byte for byte */
inline equal_adjusted_closing_price_message(adjusted_closing_price_message_read, adjusted_closing_price_message_written) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> assert(adjusted_closing_price_message_read.time_stamp[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.time_stamp[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> assert(adjusted_closing_price_message_read.issue_symbol[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.issue_symbol[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  assert(adjusted_closing_price_message_read.security_class == adjusted_closing_price_message_written.security_class);
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> assert(adjusted_closing_price_message_read.adjusted_closing_price[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.adjusted_closing_price[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
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

/* Quotation Message: encoded, read back, and compared */
proctype check_quotation_message() {
  QuotationMessage quotation_message_sent;
  QuotationMessage quotation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quotation_message(quotation_message_sent, 0)
  :: pattern == 1 -> fill_quotation_message(quotation_message_sent, 32)
  :: pattern == 2 -> fill_quotation_message(quotation_message_sent, 255)
  :: else -> ramp_quotation_message(quotation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quotation_message(quotation_message_sent);
    assert(at == 58);
    at = 0;
    decode_quotation_message(quotation_message_got);
    assert(at == 58);
    equal_quotation_message(quotation_message_got, quotation_message_sent)
  }
}

/* Sale Condition Modifier: encoded, read back, and compared */
proctype check_sale_condition_modifier() {
  SaleConditionModifier sale_condition_modifier_sent;
  SaleConditionModifier sale_condition_modifier_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sale_condition_modifier(sale_condition_modifier_sent, 0)
  :: pattern == 1 -> fill_sale_condition_modifier(sale_condition_modifier_sent, 32)
  :: pattern == 2 -> fill_sale_condition_modifier(sale_condition_modifier_sent, 255)
  :: else -> ramp_sale_condition_modifier(sale_condition_modifier_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sale_condition_modifier(sale_condition_modifier_sent);
    assert(at == 4);
    at = 0;
    decode_sale_condition_modifier(sale_condition_modifier_got);
    assert(at == 4);
    equal_sale_condition_modifier(sale_condition_modifier_got, sale_condition_modifier_sent)
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
    assert(at == 53);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 53);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
  }
}

/* Trade Break Message: encoded, read back, and compared */
proctype check_trade_break_message() {
  TradeBreakMessage trade_break_message_sent;
  TradeBreakMessage trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_break_message(trade_break_message_sent, 0)
  :: pattern == 1 -> fill_trade_break_message(trade_break_message_sent, 32)
  :: pattern == 2 -> fill_trade_break_message(trade_break_message_sent, 255)
  :: else -> ramp_trade_break_message(trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_break_message(trade_break_message_sent);
    assert(at == 13);
    at = 0;
    decode_trade_break_message(trade_break_message_got);
    assert(at == 13);
    equal_trade_break_message(trade_break_message_got, trade_break_message_sent)
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
    assert(at == 47);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 47);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
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
    assert(at == 10);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 10);
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
    assert(at == 64);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 64);
    equal_stock_directory_message(stock_directory_message_got, stock_directory_message_sent)
  }
}

/* Stock Status Message: encoded, read back, and compared */
proctype check_stock_status_message() {
  StockStatusMessage stock_status_message_sent;
  StockStatusMessage stock_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_status_message(stock_status_message_sent, 0)
  :: pattern == 1 -> fill_stock_status_message(stock_status_message_sent, 32)
  :: pattern == 2 -> fill_stock_status_message(stock_status_message_sent, 255)
  :: else -> ramp_stock_status_message(stock_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_status_message(stock_status_message_sent);
    assert(at == 20);
    at = 0;
    decode_stock_status_message(stock_status_message_got);
    assert(at == 20);
    equal_stock_status_message(stock_status_message_got, stock_status_message_sent)
  }
}

/* End Of Day Trade Summary Message: encoded, read back, and compared */
proctype check_end_of_day_trade_summary_message() {
  EndOfDayTradeSummaryMessage end_of_day_trade_summary_message_sent;
  EndOfDayTradeSummaryMessage end_of_day_trade_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_day_trade_summary_message(end_of_day_trade_summary_message_sent, 0)
  :: pattern == 1 -> fill_end_of_day_trade_summary_message(end_of_day_trade_summary_message_sent, 32)
  :: pattern == 2 -> fill_end_of_day_trade_summary_message(end_of_day_trade_summary_message_sent, 255)
  :: else -> ramp_end_of_day_trade_summary_message(end_of_day_trade_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_day_trade_summary_message(end_of_day_trade_summary_message_sent);
    assert(at == 74);
    at = 0;
    decode_end_of_day_trade_summary_message(end_of_day_trade_summary_message_got);
    assert(at == 74);
    equal_end_of_day_trade_summary_message(end_of_day_trade_summary_message_got, end_of_day_trade_summary_message_sent)
  }
}

/* Adjusted Closing Price Message: encoded, read back, and compared */
proctype check_adjusted_closing_price_message() {
  AdjustedClosingPriceMessage adjusted_closing_price_message_sent;
  AdjustedClosingPriceMessage adjusted_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_adjusted_closing_price_message(adjusted_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_adjusted_closing_price_message(adjusted_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_adjusted_closing_price_message(adjusted_closing_price_message_sent, 255)
  :: else -> ramp_adjusted_closing_price_message(adjusted_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_adjusted_closing_price_message(adjusted_closing_price_message_sent);
    assert(at == 27);
    at = 0;
    decode_adjusted_closing_price_message(adjusted_closing_price_message_got);
    assert(at == 27);
    equal_adjusted_closing_price_message(adjusted_closing_price_message_got, adjusted_closing_price_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_quotation_message()
  :: run check_sale_condition_modifier()
  :: run check_trade_report_message()
  :: run check_trade_break_message()
  :: run check_trade_correction_message()
  :: run check_system_event_message()
  :: run check_stock_directory_message()
  :: run check_stock_status_message()
  :: run check_end_of_day_trade_summary_message()
  :: run check_adjusted_closing_price_message()
  fi
}
