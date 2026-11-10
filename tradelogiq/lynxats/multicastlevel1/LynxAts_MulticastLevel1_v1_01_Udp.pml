/*
 * Tradelogiq Markets Inc. Lynx Multicast Level 1
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
#define WIRE 71

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

/* Tradelogiq Qtp Downstream Packet Header */
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

/* Tradelogiq Qtp Message Block Header */
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

/* ---- Quote Message: 43 bytes ------------------------------------------------- */

/* Tradelogiq's BBO will broadcast real-time updates every time Tradelogiq's top of book changes. */
typedef QuoteMessage {
  byte reserved_1;
  byte stock_symbol[10];
  byte timestamp[8];
  byte best_bid_price[8];
  byte best_bid_size[4];
  byte best_ask_price[8];
  byte best_ask_size[4]
};

int quote_message_at;

/* every byte of Quote Message set to one value */
inline fill_quote_message(quote_message_record, quote_message_value) {
  quote_message_record.reserved_1 = quote_message_value;
  quote_message_at = 0;
  do
  :: quote_message_at < 10 -> quote_message_record.stock_symbol[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.timestamp[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.best_bid_price[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.best_bid_size[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.best_ask_price[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.best_ask_size[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Message set to where it lies, so a field read out of place says so */
inline ramp_quote_message(quote_message_record, quote_message_base) {
  quote_message_record.reserved_1 = (quote_message_base + 0 + 1) % 256;
  quote_message_at = 0;
  do
  :: quote_message_at < 10 -> quote_message_record.stock_symbol[quote_message_at] = (quote_message_base + 1 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.timestamp[quote_message_at] = (quote_message_base + 11 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.best_bid_price[quote_message_at] = (quote_message_base + 19 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.best_bid_size[quote_message_at] = (quote_message_base + 27 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.best_ask_price[quote_message_at] = (quote_message_base + 31 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.best_ask_size[quote_message_at] = (quote_message_base + 39 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Message to the wire, 43 bytes from where the cursor stands */
inline encode_quote_message(quote_message_record) {
  wire[at] = quote_message_record.reserved_1; at = at + 1;
  quote_message_at = 0;
  do
  :: quote_message_at < 10 -> wire[at] = quote_message_record.stock_symbol[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> wire[at] = quote_message_record.timestamp[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> wire[at] = quote_message_record.best_bid_price[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.best_bid_size[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> wire[at] = quote_message_record.best_ask_price[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.best_ask_size[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Message off the wire, 43 bytes from where the cursor stands */
inline decode_quote_message(quote_message_record) {
  quote_message_record.reserved_1 = wire[at]; at = at + 1;
  quote_message_at = 0;
  do
  :: quote_message_at < 10 -> quote_message_record.stock_symbol[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.timestamp[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.best_bid_price[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.best_bid_size[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.best_ask_price[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.best_ask_size[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Message is what was written, byte for byte */
inline equal_quote_message(quote_message_read, quote_message_written) {
  assert(quote_message_read.reserved_1 == quote_message_written.reserved_1);
  quote_message_at = 0;
  do
  :: quote_message_at < 10 -> assert(quote_message_read.stock_symbol[quote_message_at] == quote_message_written.stock_symbol[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> assert(quote_message_read.timestamp[quote_message_at] == quote_message_written.timestamp[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> assert(quote_message_read.best_bid_price[quote_message_at] == quote_message_written.best_bid_price[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.best_bid_size[quote_message_at] == quote_message_written.best_bid_size[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> assert(quote_message_read.best_ask_price[quote_message_at] == quote_message_written.best_ask_price[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.best_ask_size[quote_message_at] == quote_message_written.best_ask_size[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Report Message: 43 bytes ------------------------------------------ */

/* Relays all transactions available from or reported by Tradelogiq's two trading books for the current business day. */
typedef TradeReportMessage {
  byte conditions[5];
  byte stock_symbol[10];
  byte timestamp[8];
  byte trade_id[4];
  byte trade_price[8];
  byte trade_size[4];
  byte buy_broker[2];
  byte sell_broker[2]
};

int trade_report_message_at;

/* every byte of Trade Report Message set to one value */
inline fill_trade_report_message(trade_report_message_record, trade_report_message_value) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 5 -> trade_report_message_record.conditions[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.stock_symbol[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.timestamp[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_id[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 2 -> trade_report_message_record.buy_broker[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.sell_broker[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message(trade_report_message_record, trade_report_message_base) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 5 -> trade_report_message_record.conditions[trade_report_message_at] = (trade_report_message_base + 0 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.stock_symbol[trade_report_message_at] = (trade_report_message_base + 5 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.timestamp[trade_report_message_at] = (trade_report_message_base + 15 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_id[trade_report_message_at] = (trade_report_message_base + 23 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = (trade_report_message_base + 27 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = (trade_report_message_base + 35 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.buy_broker[trade_report_message_at] = (trade_report_message_base + 39 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.sell_broker[trade_report_message_at] = (trade_report_message_base + 41 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message to the wire, 43 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 5 -> wire[at] = trade_report_message_record.conditions[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> wire[at] = trade_report_message_record.stock_symbol[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.timestamp[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_id[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 2 -> wire[at] = trade_report_message_record.buy_broker[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> wire[at] = trade_report_message_record.sell_broker[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message off the wire, 43 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 5 -> trade_report_message_record.conditions[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.stock_symbol[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.timestamp[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_id[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 2 -> trade_report_message_record.buy_broker[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.sell_broker[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Report Message is what was written, byte for byte */
inline equal_trade_report_message(trade_report_message_read, trade_report_message_written) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 5 -> assert(trade_report_message_read.conditions[trade_report_message_at] == trade_report_message_written.conditions[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> assert(trade_report_message_read.stock_symbol[trade_report_message_at] == trade_report_message_written.stock_symbol[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.timestamp[trade_report_message_at] == trade_report_message_written.timestamp[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_id[trade_report_message_at] == trade_report_message_written.trade_id[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 2 -> assert(trade_report_message_read.buy_broker[trade_report_message_at] == trade_report_message_written.buy_broker[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> assert(trade_report_message_read.sell_broker[trade_report_message_at] == trade_report_message_written.sell_broker[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Bust Message: 23 bytes -------------------------------------------- */

/* If trade is cancelled or busted during the day Trade Bust Message will be sent. */
typedef TradeBustMessage {
  byte reserved_1;
  byte stock_symbol[10];
  byte timestamp[8];
  byte trade_id[4]
};

int trade_bust_message_at;

/* every byte of Trade Bust Message set to one value */
inline fill_trade_bust_message(trade_bust_message_record, trade_bust_message_value) {
  trade_bust_message_record.reserved_1 = trade_bust_message_value;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 10 -> trade_bust_message_record.stock_symbol[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.timestamp[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.trade_id[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Bust Message set to where it lies, so a field read out of place says so */
inline ramp_trade_bust_message(trade_bust_message_record, trade_bust_message_base) {
  trade_bust_message_record.reserved_1 = (trade_bust_message_base + 0 + 1) % 256;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 10 -> trade_bust_message_record.stock_symbol[trade_bust_message_at] = (trade_bust_message_base + 1 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.timestamp[trade_bust_message_at] = (trade_bust_message_base + 11 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.trade_id[trade_bust_message_at] = (trade_bust_message_base + 19 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message to the wire, 23 bytes from where the cursor stands */
inline encode_trade_bust_message(trade_bust_message_record) {
  wire[at] = trade_bust_message_record.reserved_1; at = at + 1;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 10 -> wire[at] = trade_bust_message_record.stock_symbol[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.timestamp[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> wire[at] = trade_bust_message_record.trade_id[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message off the wire, 23 bytes from where the cursor stands */
inline decode_trade_bust_message(trade_bust_message_record) {
  trade_bust_message_record.reserved_1 = wire[at]; at = at + 1;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 10 -> trade_bust_message_record.stock_symbol[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.timestamp[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.trade_id[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Bust Message is what was written, byte for byte */
inline equal_trade_bust_message(trade_bust_message_read, trade_bust_message_written) {
  assert(trade_bust_message_read.reserved_1 == trade_bust_message_written.reserved_1);
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 10 -> assert(trade_bust_message_read.stock_symbol[trade_bust_message_at] == trade_bust_message_written.stock_symbol[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.timestamp[trade_bust_message_at] == trade_bust_message_written.timestamp[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> assert(trade_bust_message_read.trade_id[trade_bust_message_at] == trade_bust_message_written.trade_id[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction Message: 47 bytes -------------------------------------- */

/* Trade amendments during the day will send this message. */
typedef TradeCorrectionMessage {
  byte reserved_1;
  byte stock_symbol[10];
  byte timestamp[8];
  byte original_trade_id[4];
  byte original_trade_price[8];
  byte original_trade_size[4];
  byte corrected_trade_price[8];
  byte corrected_trade_size[4]
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_record.reserved_1 = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.stock_symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
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
  trade_correction_message_record.reserved_1 = (trade_correction_message_base + 0 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.stock_symbol[trade_correction_message_at] = (trade_correction_message_base + 1 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp[trade_correction_message_at] = (trade_correction_message_base + 11 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = (trade_correction_message_base + 19 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
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
  wire[at] = trade_correction_message_record.reserved_1; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> wire[at] = trade_correction_message_record.stock_symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.timestamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
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
  trade_correction_message_record.reserved_1 = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.stock_symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
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
  assert(trade_correction_message_read.reserved_1 == trade_correction_message_written.reserved_1);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> assert(trade_correction_message_read.stock_symbol[trade_correction_message_at] == trade_correction_message_written.stock_symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.timestamp[trade_correction_message_at] == trade_correction_message_written.timestamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_trade_id[trade_correction_message_at] == trade_correction_message_written.original_trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
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

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* The system event message is used to signal a market or a data feed handler event. */
typedef SystemEventMessage {
  byte event_code;
  byte reserved_2[2];
  byte timestamp[8]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.reserved_2[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_record.event_code = (system_event_message_base + 0 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.reserved_2[system_event_message_at] = (system_event_message_base + 1 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 3 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.reserved_2[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.reserved_2[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.reserved_2[system_event_message_at] == system_event_message_written.reserved_2[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Directory Message: 39 bytes --------------------------------------- */

/* At start of each trading day, OSI disseminates stock directory messages for supported securities. */
typedef StockDirectoryMessage {
  byte market;
  byte stock[10];
  byte timestamp[8];
  byte board_lot_size[4];
  byte instrument_id[2];
  byte shortable;
  byte dividend_indicator;
  byte reserved_9[9];
  byte currency[3]
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_record.market = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> stock_directory_message_record.stock[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.timestamp[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.board_lot_size[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.instrument_id[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.shortable = stock_directory_message_value;
  stock_directory_message_record.dividend_indicator = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> stock_directory_message_record.reserved_9[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> stock_directory_message_record.currency[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_record.market = (stock_directory_message_base + 0 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> stock_directory_message_record.stock[stock_directory_message_at] = (stock_directory_message_base + 1 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.timestamp[stock_directory_message_at] = (stock_directory_message_base + 11 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.board_lot_size[stock_directory_message_at] = (stock_directory_message_base + 19 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.instrument_id[stock_directory_message_at] = (stock_directory_message_base + 23 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.shortable = (stock_directory_message_base + 25 + 1) % 256;
  stock_directory_message_record.dividend_indicator = (stock_directory_message_base + 26 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> stock_directory_message_record.reserved_9[stock_directory_message_at] = (stock_directory_message_base + 27 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> stock_directory_message_record.currency[stock_directory_message_at] = (stock_directory_message_base + 36 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory Message to the wire, 39 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  wire[at] = stock_directory_message_record.market; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> wire[at] = stock_directory_message_record.stock[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> wire[at] = stock_directory_message_record.timestamp[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.board_lot_size[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> wire[at] = stock_directory_message_record.instrument_id[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.shortable; at = at + 1;
  wire[at] = stock_directory_message_record.dividend_indicator; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> wire[at] = stock_directory_message_record.reserved_9[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> wire[at] = stock_directory_message_record.currency[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory Message off the wire, 39 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_record.market = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> stock_directory_message_record.stock[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.timestamp[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.board_lot_size[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.instrument_id[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.shortable = wire[at]; at = at + 1;
  stock_directory_message_record.dividend_indicator = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> stock_directory_message_record.reserved_9[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> stock_directory_message_record.currency[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  assert(stock_directory_message_read.market == stock_directory_message_written.market);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> assert(stock_directory_message_read.stock[stock_directory_message_at] == stock_directory_message_written.stock[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> assert(stock_directory_message_read.timestamp[stock_directory_message_at] == stock_directory_message_written.timestamp[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.board_lot_size[stock_directory_message_at] == stock_directory_message_written.board_lot_size[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> assert(stock_directory_message_read.instrument_id[stock_directory_message_at] == stock_directory_message_written.instrument_id[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.shortable == stock_directory_message_written.shortable);
  assert(stock_directory_message_read.dividend_indicator == stock_directory_message_written.dividend_indicator);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> assert(stock_directory_message_read.reserved_9[stock_directory_message_at] == stock_directory_message_written.reserved_9[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> assert(stock_directory_message_read.currency[stock_directory_message_at] == stock_directory_message_written.currency[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Stock Directory Message: 71 bytes ------------------------------ */

/* Extended Stock Directory are for Special stock symbols eg warrants debentures rights. */
typedef ExtendedStockDirectoryMessage {
  byte market;
  byte stock[10];
  byte timestamp[8];
  byte board_lot_size[4];
  byte instrument_id[2];
  byte shortable;
  byte frequency;
  byte reserved_9[9];
  byte currency[3];
  byte security_type;
  byte expiry_date[8];
  byte description[20];
  byte reserved_3[3]
};

int extended_stock_directory_message_at;

/* every byte of Extended Stock Directory Message set to one value */
inline fill_extended_stock_directory_message(extended_stock_directory_message_record, extended_stock_directory_message_value) {
  extended_stock_directory_message_record.market = extended_stock_directory_message_value;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> extended_stock_directory_message_record.stock[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.timestamp[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> extended_stock_directory_message_record.board_lot_size[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> extended_stock_directory_message_record.instrument_id[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.shortable = extended_stock_directory_message_value;
  extended_stock_directory_message_record.frequency = extended_stock_directory_message_value;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> extended_stock_directory_message_record.reserved_9[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.currency[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.security_type = extended_stock_directory_message_value;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.expiry_date[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> extended_stock_directory_message_record.description[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.reserved_3[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_extended_stock_directory_message(extended_stock_directory_message_record, extended_stock_directory_message_base) {
  extended_stock_directory_message_record.market = (extended_stock_directory_message_base + 0 + 1) % 256;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> extended_stock_directory_message_record.stock[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 1 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.timestamp[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 11 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> extended_stock_directory_message_record.board_lot_size[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 19 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> extended_stock_directory_message_record.instrument_id[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 23 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.shortable = (extended_stock_directory_message_base + 25 + 1) % 256;
  extended_stock_directory_message_record.frequency = (extended_stock_directory_message_base + 26 + 1) % 256;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> extended_stock_directory_message_record.reserved_9[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 27 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.currency[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 36 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.security_type = (extended_stock_directory_message_base + 39 + 1) % 256;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.expiry_date[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 40 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> extended_stock_directory_message_record.description[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 48 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.reserved_3[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 68 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Stock Directory Message to the wire, 71 bytes from where the cursor stands */
inline encode_extended_stock_directory_message(extended_stock_directory_message_record) {
  wire[at] = extended_stock_directory_message_record.market; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> wire[at] = extended_stock_directory_message_record.stock[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> wire[at] = extended_stock_directory_message_record.timestamp[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> wire[at] = extended_stock_directory_message_record.board_lot_size[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> wire[at] = extended_stock_directory_message_record.instrument_id[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = extended_stock_directory_message_record.shortable; at = at + 1;
  wire[at] = extended_stock_directory_message_record.frequency; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> wire[at] = extended_stock_directory_message_record.reserved_9[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> wire[at] = extended_stock_directory_message_record.currency[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = extended_stock_directory_message_record.security_type; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> wire[at] = extended_stock_directory_message_record.expiry_date[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> wire[at] = extended_stock_directory_message_record.description[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> wire[at] = extended_stock_directory_message_record.reserved_3[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Stock Directory Message off the wire, 71 bytes from where the cursor stands */
inline decode_extended_stock_directory_message(extended_stock_directory_message_record) {
  extended_stock_directory_message_record.market = wire[at]; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> extended_stock_directory_message_record.stock[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.timestamp[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> extended_stock_directory_message_record.board_lot_size[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> extended_stock_directory_message_record.instrument_id[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.shortable = wire[at]; at = at + 1;
  extended_stock_directory_message_record.frequency = wire[at]; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> extended_stock_directory_message_record.reserved_9[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.currency[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.security_type = wire[at]; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.expiry_date[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> extended_stock_directory_message_record.description[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.reserved_3[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Stock Directory Message is what was written, byte for byte */
inline equal_extended_stock_directory_message(extended_stock_directory_message_read, extended_stock_directory_message_written) {
  assert(extended_stock_directory_message_read.market == extended_stock_directory_message_written.market);
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> assert(extended_stock_directory_message_read.stock[extended_stock_directory_message_at] == extended_stock_directory_message_written.stock[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> assert(extended_stock_directory_message_read.timestamp[extended_stock_directory_message_at] == extended_stock_directory_message_written.timestamp[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> assert(extended_stock_directory_message_read.board_lot_size[extended_stock_directory_message_at] == extended_stock_directory_message_written.board_lot_size[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> assert(extended_stock_directory_message_read.instrument_id[extended_stock_directory_message_at] == extended_stock_directory_message_written.instrument_id[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  assert(extended_stock_directory_message_read.shortable == extended_stock_directory_message_written.shortable);
  assert(extended_stock_directory_message_read.frequency == extended_stock_directory_message_written.frequency);
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> assert(extended_stock_directory_message_read.reserved_9[extended_stock_directory_message_at] == extended_stock_directory_message_written.reserved_9[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> assert(extended_stock_directory_message_read.currency[extended_stock_directory_message_at] == extended_stock_directory_message_written.currency[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  assert(extended_stock_directory_message_read.security_type == extended_stock_directory_message_written.security_type);
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> assert(extended_stock_directory_message_read.expiry_date[extended_stock_directory_message_at] == extended_stock_directory_message_written.expiry_date[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> assert(extended_stock_directory_message_read.description[extended_stock_directory_message_at] == extended_stock_directory_message_written.description[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> assert(extended_stock_directory_message_read.reserved_3[extended_stock_directory_message_at] == extended_stock_directory_message_written.reserved_3[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Status Message: 23 bytes ------------------------------------------ */

/* This message indicates the current trading status of a stock. */
typedef StockStatusMessage {
  byte trading_state;
  byte stock[10];
  byte timestamp[8];
  byte reason[4]
};

int stock_status_message_at;

/* every byte of Stock Status Message set to one value */
inline fill_stock_status_message(stock_status_message_record, stock_status_message_value) {
  stock_status_message_record.trading_state = stock_status_message_value;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> stock_status_message_record.stock[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.timestamp[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> stock_status_message_record.reason[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Status Message set to where it lies, so a field read out of place says so */
inline ramp_stock_status_message(stock_status_message_record, stock_status_message_base) {
  stock_status_message_record.trading_state = (stock_status_message_base + 0 + 1) % 256;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> stock_status_message_record.stock[stock_status_message_at] = (stock_status_message_base + 1 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.timestamp[stock_status_message_at] = (stock_status_message_base + 11 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> stock_status_message_record.reason[stock_status_message_at] = (stock_status_message_base + 19 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Status Message to the wire, 23 bytes from where the cursor stands */
inline encode_stock_status_message(stock_status_message_record) {
  wire[at] = stock_status_message_record.trading_state; at = at + 1;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> wire[at] = stock_status_message_record.stock[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> wire[at] = stock_status_message_record.timestamp[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> wire[at] = stock_status_message_record.reason[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Status Message off the wire, 23 bytes from where the cursor stands */
inline decode_stock_status_message(stock_status_message_record) {
  stock_status_message_record.trading_state = wire[at]; at = at + 1;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> stock_status_message_record.stock[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.timestamp[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> stock_status_message_record.reason[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Status Message is what was written, byte for byte */
inline equal_stock_status_message(stock_status_message_read, stock_status_message_written) {
  assert(stock_status_message_read.trading_state == stock_status_message_written.trading_state);
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> assert(stock_status_message_read.stock[stock_status_message_at] == stock_status_message_written.stock[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> assert(stock_status_message_read.timestamp[stock_status_message_at] == stock_status_message_written.timestamp[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> assert(stock_status_message_read.reason[stock_status_message_at] == stock_status_message_written.reason[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
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

/* Quote Message: encoded, read back, and compared */
proctype check_quote_message() {
  QuoteMessage quote_message_sent;
  QuoteMessage quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_message(quote_message_sent, 0)
  :: pattern == 1 -> fill_quote_message(quote_message_sent, 32)
  :: pattern == 2 -> fill_quote_message(quote_message_sent, 255)
  :: else -> ramp_quote_message(quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_message(quote_message_sent);
    assert(at == 43);
    at = 0;
    decode_quote_message(quote_message_got);
    assert(at == 43);
    equal_quote_message(quote_message_got, quote_message_sent)
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
    assert(at == 43);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 43);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
  }
}

/* Trade Bust Message: encoded, read back, and compared */
proctype check_trade_bust_message() {
  TradeBustMessage trade_bust_message_sent;
  TradeBustMessage trade_bust_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_bust_message(trade_bust_message_sent, 0)
  :: pattern == 1 -> fill_trade_bust_message(trade_bust_message_sent, 32)
  :: pattern == 2 -> fill_trade_bust_message(trade_bust_message_sent, 255)
  :: else -> ramp_trade_bust_message(trade_bust_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_bust_message(trade_bust_message_sent);
    assert(at == 23);
    at = 0;
    decode_trade_bust_message(trade_bust_message_got);
    assert(at == 23);
    equal_trade_bust_message(trade_bust_message_got, trade_bust_message_sent)
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
    assert(at == 11);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 11);
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
    assert(at == 39);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 39);
    equal_stock_directory_message(stock_directory_message_got, stock_directory_message_sent)
  }
}

/* Extended Stock Directory Message: encoded, read back, and compared */
proctype check_extended_stock_directory_message() {
  ExtendedStockDirectoryMessage extended_stock_directory_message_sent;
  ExtendedStockDirectoryMessage extended_stock_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_stock_directory_message(extended_stock_directory_message_sent, 0)
  :: pattern == 1 -> fill_extended_stock_directory_message(extended_stock_directory_message_sent, 32)
  :: pattern == 2 -> fill_extended_stock_directory_message(extended_stock_directory_message_sent, 255)
  :: else -> ramp_extended_stock_directory_message(extended_stock_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_stock_directory_message(extended_stock_directory_message_sent);
    assert(at == 71);
    at = 0;
    decode_extended_stock_directory_message(extended_stock_directory_message_got);
    assert(at == 71);
    equal_extended_stock_directory_message(extended_stock_directory_message_got, extended_stock_directory_message_sent)
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
    assert(at == 23);
    at = 0;
    decode_stock_status_message(stock_status_message_got);
    assert(at == 23);
    equal_stock_status_message(stock_status_message_got, stock_status_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_quote_message()
  :: run check_trade_report_message()
  :: run check_trade_bust_message()
  :: run check_trade_correction_message()
  :: run check_system_event_message()
  :: run check_stock_directory_message()
  :: run check_extended_stock_directory_message()
  :: run check_stock_status_message()
  fi
}
