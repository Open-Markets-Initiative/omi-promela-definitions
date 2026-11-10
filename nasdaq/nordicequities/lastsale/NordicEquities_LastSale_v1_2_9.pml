/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Nordic Equity Last Sale
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
#define WIRE 147

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

/* ---- Adjusted Closing Price Message: 22 bytes -------------------------------- */

/* Adjusted closing price disseminated for all active symbols at the start of each trading day */
typedef AdjustedClosingPriceMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_book[4];
  byte adjusted_closing_price[8]
};

int adjusted_closing_price_message_at;

/* every byte of Adjusted Closing Price Message set to one value */
inline fill_adjusted_closing_price_message(adjusted_closing_price_message_record, adjusted_closing_price_message_value) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.timestamp[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> adjusted_closing_price_message_record.tracking_number[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 4 -> adjusted_closing_price_message_record.order_book[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
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
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.timestamp[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 0 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> adjusted_closing_price_message_record.tracking_number[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 8 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 4 -> adjusted_closing_price_message_record.order_book[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 10 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 14 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message to the wire, 22 bytes from where the cursor stands */
inline encode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> wire[at] = adjusted_closing_price_message_record.timestamp[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> wire[at] = adjusted_closing_price_message_record.tracking_number[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 4 -> wire[at] = adjusted_closing_price_message_record.order_book[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> wire[at] = adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message off the wire, 22 bytes from where the cursor stands */
inline decode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.timestamp[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> adjusted_closing_price_message_record.tracking_number[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 4 -> adjusted_closing_price_message_record.order_book[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
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
  :: adjusted_closing_price_message_at < 8 -> assert(adjusted_closing_price_message_read.timestamp[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.timestamp[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> assert(adjusted_closing_price_message_read.tracking_number[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.tracking_number[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 4 -> assert(adjusted_closing_price_message_read.order_book[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.order_book[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> assert(adjusted_closing_price_message_read.adjusted_closing_price[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.adjusted_closing_price[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- On Exchange Trade Message: 92 bytes ------------------------------------- */

/* Relays on exchange trade transactions executed or deferred to the current business day */
typedef OnExchangeTradeMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_book[4];
  byte execution_date[4];
  byte execution_time[8];
  byte agreement_date[4];
  byte agreement_time[8];
  byte price_on_exchange[8];
  byte quantity[8];
  byte venue_of_execution[4];
  byte transaction_identifier_code[10];
  byte mmt_trade_flags[14];
  byte trade_type;
  byte mpid_buyer[4];
  byte mpid_seller[4];
  byte transaction_to_be_cleared
};

int on_exchange_trade_message_at;

/* every byte of On Exchange Trade Message set to one value */
inline fill_on_exchange_trade_message(on_exchange_trade_message_record, on_exchange_trade_message_value) {
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.timestamp[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 2 -> on_exchange_trade_message_record.tracking_number[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.order_book[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.execution_date[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.execution_time[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.agreement_date[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.agreement_time[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.price_on_exchange[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.quantity[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.venue_of_execution[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 10 -> on_exchange_trade_message_record.transaction_identifier_code[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 14 -> on_exchange_trade_message_record.mmt_trade_flags[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_record.trade_type = on_exchange_trade_message_value;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.mpid_buyer[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.mpid_seller[on_exchange_trade_message_at] = on_exchange_trade_message_value; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_record.transaction_to_be_cleared = on_exchange_trade_message_value;
  skip
}

/* each byte of On Exchange Trade Message set to where it lies, so a field read out of place says so */
inline ramp_on_exchange_trade_message(on_exchange_trade_message_record, on_exchange_trade_message_base) {
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.timestamp[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 0 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 2 -> on_exchange_trade_message_record.tracking_number[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 8 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.order_book[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 10 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.execution_date[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 14 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.execution_time[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 18 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.agreement_date[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 26 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.agreement_time[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 30 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.price_on_exchange[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 38 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.quantity[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 46 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.venue_of_execution[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 54 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 10 -> on_exchange_trade_message_record.transaction_identifier_code[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 58 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 14 -> on_exchange_trade_message_record.mmt_trade_flags[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 68 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_record.trade_type = (on_exchange_trade_message_base + 82 + 1) % 256;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.mpid_buyer[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 83 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.mpid_seller[on_exchange_trade_message_at] = (on_exchange_trade_message_base + 87 + on_exchange_trade_message_at + 1) % 256; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_record.transaction_to_be_cleared = (on_exchange_trade_message_base + 91 + 1) % 256;
  skip
}

/* On Exchange Trade Message to the wire, 92 bytes from where the cursor stands */
inline encode_on_exchange_trade_message(on_exchange_trade_message_record) {
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> wire[at] = on_exchange_trade_message_record.timestamp[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 2 -> wire[at] = on_exchange_trade_message_record.tracking_number[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> wire[at] = on_exchange_trade_message_record.order_book[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> wire[at] = on_exchange_trade_message_record.execution_date[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> wire[at] = on_exchange_trade_message_record.execution_time[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> wire[at] = on_exchange_trade_message_record.agreement_date[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> wire[at] = on_exchange_trade_message_record.agreement_time[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> wire[at] = on_exchange_trade_message_record.price_on_exchange[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> wire[at] = on_exchange_trade_message_record.quantity[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> wire[at] = on_exchange_trade_message_record.venue_of_execution[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 10 -> wire[at] = on_exchange_trade_message_record.transaction_identifier_code[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 14 -> wire[at] = on_exchange_trade_message_record.mmt_trade_flags[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = on_exchange_trade_message_record.trade_type; at = at + 1;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> wire[at] = on_exchange_trade_message_record.mpid_buyer[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> wire[at] = on_exchange_trade_message_record.mpid_seller[on_exchange_trade_message_at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = on_exchange_trade_message_record.transaction_to_be_cleared; at = at + 1;
  skip
}

/* On Exchange Trade Message off the wire, 92 bytes from where the cursor stands */
inline decode_on_exchange_trade_message(on_exchange_trade_message_record) {
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.timestamp[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 2 -> on_exchange_trade_message_record.tracking_number[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.order_book[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.execution_date[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.execution_time[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.agreement_date[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.agreement_time[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.price_on_exchange[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> on_exchange_trade_message_record.quantity[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.venue_of_execution[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 10 -> on_exchange_trade_message_record.transaction_identifier_code[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 14 -> on_exchange_trade_message_record.mmt_trade_flags[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_record.trade_type = wire[at]; at = at + 1;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.mpid_buyer[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> on_exchange_trade_message_record.mpid_seller[on_exchange_trade_message_at] = wire[at]; at = at + 1; on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_record.transaction_to_be_cleared = wire[at]; at = at + 1;
  skip
}

/* what was read of On Exchange Trade Message is what was written, byte for byte */
inline equal_on_exchange_trade_message(on_exchange_trade_message_read, on_exchange_trade_message_written) {
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> assert(on_exchange_trade_message_read.timestamp[on_exchange_trade_message_at] == on_exchange_trade_message_written.timestamp[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 2 -> assert(on_exchange_trade_message_read.tracking_number[on_exchange_trade_message_at] == on_exchange_trade_message_written.tracking_number[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> assert(on_exchange_trade_message_read.order_book[on_exchange_trade_message_at] == on_exchange_trade_message_written.order_book[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> assert(on_exchange_trade_message_read.execution_date[on_exchange_trade_message_at] == on_exchange_trade_message_written.execution_date[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> assert(on_exchange_trade_message_read.execution_time[on_exchange_trade_message_at] == on_exchange_trade_message_written.execution_time[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> assert(on_exchange_trade_message_read.agreement_date[on_exchange_trade_message_at] == on_exchange_trade_message_written.agreement_date[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> assert(on_exchange_trade_message_read.agreement_time[on_exchange_trade_message_at] == on_exchange_trade_message_written.agreement_time[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> assert(on_exchange_trade_message_read.price_on_exchange[on_exchange_trade_message_at] == on_exchange_trade_message_written.price_on_exchange[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 8 -> assert(on_exchange_trade_message_read.quantity[on_exchange_trade_message_at] == on_exchange_trade_message_written.quantity[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> assert(on_exchange_trade_message_read.venue_of_execution[on_exchange_trade_message_at] == on_exchange_trade_message_written.venue_of_execution[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 10 -> assert(on_exchange_trade_message_read.transaction_identifier_code[on_exchange_trade_message_at] == on_exchange_trade_message_written.transaction_identifier_code[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 14 -> assert(on_exchange_trade_message_read.mmt_trade_flags[on_exchange_trade_message_at] == on_exchange_trade_message_written.mmt_trade_flags[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  assert(on_exchange_trade_message_read.trade_type == on_exchange_trade_message_written.trade_type);
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> assert(on_exchange_trade_message_read.mpid_buyer[on_exchange_trade_message_at] == on_exchange_trade_message_written.mpid_buyer[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  on_exchange_trade_message_at = 0;
  do
  :: on_exchange_trade_message_at < 4 -> assert(on_exchange_trade_message_read.mpid_seller[on_exchange_trade_message_at] == on_exchange_trade_message_written.mpid_seller[on_exchange_trade_message_at]); on_exchange_trade_message_at = on_exchange_trade_message_at + 1
  :: else -> break
  od;
  assert(on_exchange_trade_message_read.transaction_to_be_cleared == on_exchange_trade_message_written.transaction_to_be_cleared);
  skip
}

/* ---- Otc Trade Message: 147 bytes -------------------------------------------- */

/* Relays over the counter and systematic internaliser trade transactions */
typedef OtcTradeMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte instrument_identification_code_type[4];
  byte instrument_identification_code[12];
  byte agreement_date[4];
  byte agreement_time[8];
  byte price_otc[8];
  byte price_fraction;
  byte price_notation[4];
  byte price_currency[3];
  byte quantity[8];
  byte quantity_fraction;
  byte notation_of_the_quantity_in_measurement_unit[25];
  byte quantity_in_measurement_unit[8];
  byte quantity_in_measurement_unit_fraction;
  byte venue_of_execution[4];
  byte notional_amount[8];
  byte notional_amount_fraction;
  byte notional_currency[3];
  byte type[4];
  byte transaction_identifier_code[10];
  byte mmt_trade_flags[14];
  byte transaction_to_be_cleared;
  byte trade_type;
  byte third_country_trading_venue_of_execution[4]
};

int otc_trade_message_at;

/* every byte of Otc Trade Message set to one value */
inline fill_otc_trade_message(otc_trade_message_record, otc_trade_message_value) {
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.timestamp[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 2 -> otc_trade_message_record.tracking_number[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.instrument_identification_code_type[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 12 -> otc_trade_message_record.instrument_identification_code[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.agreement_date[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.agreement_time[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.price_otc[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.price_fraction = otc_trade_message_value;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.price_notation[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> otc_trade_message_record.price_currency[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.quantity[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.quantity_fraction = otc_trade_message_value;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 25 -> otc_trade_message_record.notation_of_the_quantity_in_measurement_unit[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.quantity_in_measurement_unit[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.quantity_in_measurement_unit_fraction = otc_trade_message_value;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.venue_of_execution[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.notional_amount[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.notional_amount_fraction = otc_trade_message_value;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> otc_trade_message_record.notional_currency[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.type[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 10 -> otc_trade_message_record.transaction_identifier_code[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 14 -> otc_trade_message_record.mmt_trade_flags[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.transaction_to_be_cleared = otc_trade_message_value;
  otc_trade_message_record.trade_type = otc_trade_message_value;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.third_country_trading_venue_of_execution[otc_trade_message_at] = otc_trade_message_value; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Otc Trade Message set to where it lies, so a field read out of place says so */
inline ramp_otc_trade_message(otc_trade_message_record, otc_trade_message_base) {
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.timestamp[otc_trade_message_at] = (otc_trade_message_base + 0 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 2 -> otc_trade_message_record.tracking_number[otc_trade_message_at] = (otc_trade_message_base + 8 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.instrument_identification_code_type[otc_trade_message_at] = (otc_trade_message_base + 10 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 12 -> otc_trade_message_record.instrument_identification_code[otc_trade_message_at] = (otc_trade_message_base + 14 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.agreement_date[otc_trade_message_at] = (otc_trade_message_base + 26 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.agreement_time[otc_trade_message_at] = (otc_trade_message_base + 30 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.price_otc[otc_trade_message_at] = (otc_trade_message_base + 38 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.price_fraction = (otc_trade_message_base + 46 + 1) % 256;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.price_notation[otc_trade_message_at] = (otc_trade_message_base + 47 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> otc_trade_message_record.price_currency[otc_trade_message_at] = (otc_trade_message_base + 51 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.quantity[otc_trade_message_at] = (otc_trade_message_base + 54 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.quantity_fraction = (otc_trade_message_base + 62 + 1) % 256;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 25 -> otc_trade_message_record.notation_of_the_quantity_in_measurement_unit[otc_trade_message_at] = (otc_trade_message_base + 63 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.quantity_in_measurement_unit[otc_trade_message_at] = (otc_trade_message_base + 88 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.quantity_in_measurement_unit_fraction = (otc_trade_message_base + 96 + 1) % 256;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.venue_of_execution[otc_trade_message_at] = (otc_trade_message_base + 97 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.notional_amount[otc_trade_message_at] = (otc_trade_message_base + 101 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.notional_amount_fraction = (otc_trade_message_base + 109 + 1) % 256;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> otc_trade_message_record.notional_currency[otc_trade_message_at] = (otc_trade_message_base + 110 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.type[otc_trade_message_at] = (otc_trade_message_base + 113 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 10 -> otc_trade_message_record.transaction_identifier_code[otc_trade_message_at] = (otc_trade_message_base + 117 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 14 -> otc_trade_message_record.mmt_trade_flags[otc_trade_message_at] = (otc_trade_message_base + 127 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.transaction_to_be_cleared = (otc_trade_message_base + 141 + 1) % 256;
  otc_trade_message_record.trade_type = (otc_trade_message_base + 142 + 1) % 256;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.third_country_trading_venue_of_execution[otc_trade_message_at] = (otc_trade_message_base + 143 + otc_trade_message_at + 1) % 256; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Otc Trade Message to the wire, 147 bytes from where the cursor stands */
inline encode_otc_trade_message(otc_trade_message_record) {
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> wire[at] = otc_trade_message_record.timestamp[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 2 -> wire[at] = otc_trade_message_record.tracking_number[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> wire[at] = otc_trade_message_record.instrument_identification_code_type[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 12 -> wire[at] = otc_trade_message_record.instrument_identification_code[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> wire[at] = otc_trade_message_record.agreement_date[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> wire[at] = otc_trade_message_record.agreement_time[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> wire[at] = otc_trade_message_record.price_otc[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_trade_message_record.price_fraction; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> wire[at] = otc_trade_message_record.price_notation[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> wire[at] = otc_trade_message_record.price_currency[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> wire[at] = otc_trade_message_record.quantity[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_trade_message_record.quantity_fraction; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 25 -> wire[at] = otc_trade_message_record.notation_of_the_quantity_in_measurement_unit[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> wire[at] = otc_trade_message_record.quantity_in_measurement_unit[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_trade_message_record.quantity_in_measurement_unit_fraction; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> wire[at] = otc_trade_message_record.venue_of_execution[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> wire[at] = otc_trade_message_record.notional_amount[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_trade_message_record.notional_amount_fraction; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> wire[at] = otc_trade_message_record.notional_currency[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> wire[at] = otc_trade_message_record.type[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 10 -> wire[at] = otc_trade_message_record.transaction_identifier_code[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 14 -> wire[at] = otc_trade_message_record.mmt_trade_flags[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_trade_message_record.transaction_to_be_cleared; at = at + 1;
  wire[at] = otc_trade_message_record.trade_type; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> wire[at] = otc_trade_message_record.third_country_trading_venue_of_execution[otc_trade_message_at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Otc Trade Message off the wire, 147 bytes from where the cursor stands */
inline decode_otc_trade_message(otc_trade_message_record) {
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.timestamp[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 2 -> otc_trade_message_record.tracking_number[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.instrument_identification_code_type[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 12 -> otc_trade_message_record.instrument_identification_code[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.agreement_date[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.agreement_time[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.price_otc[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.price_fraction = wire[at]; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.price_notation[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> otc_trade_message_record.price_currency[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.quantity[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.quantity_fraction = wire[at]; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 25 -> otc_trade_message_record.notation_of_the_quantity_in_measurement_unit[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.quantity_in_measurement_unit[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.quantity_in_measurement_unit_fraction = wire[at]; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.venue_of_execution[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> otc_trade_message_record.notional_amount[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.notional_amount_fraction = wire[at]; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> otc_trade_message_record.notional_currency[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.type[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 10 -> otc_trade_message_record.transaction_identifier_code[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 14 -> otc_trade_message_record.mmt_trade_flags[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_record.transaction_to_be_cleared = wire[at]; at = at + 1;
  otc_trade_message_record.trade_type = wire[at]; at = at + 1;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> otc_trade_message_record.third_country_trading_venue_of_execution[otc_trade_message_at] = wire[at]; at = at + 1; otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Otc Trade Message is what was written, byte for byte */
inline equal_otc_trade_message(otc_trade_message_read, otc_trade_message_written) {
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> assert(otc_trade_message_read.timestamp[otc_trade_message_at] == otc_trade_message_written.timestamp[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 2 -> assert(otc_trade_message_read.tracking_number[otc_trade_message_at] == otc_trade_message_written.tracking_number[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> assert(otc_trade_message_read.instrument_identification_code_type[otc_trade_message_at] == otc_trade_message_written.instrument_identification_code_type[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 12 -> assert(otc_trade_message_read.instrument_identification_code[otc_trade_message_at] == otc_trade_message_written.instrument_identification_code[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> assert(otc_trade_message_read.agreement_date[otc_trade_message_at] == otc_trade_message_written.agreement_date[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> assert(otc_trade_message_read.agreement_time[otc_trade_message_at] == otc_trade_message_written.agreement_time[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> assert(otc_trade_message_read.price_otc[otc_trade_message_at] == otc_trade_message_written.price_otc[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  assert(otc_trade_message_read.price_fraction == otc_trade_message_written.price_fraction);
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> assert(otc_trade_message_read.price_notation[otc_trade_message_at] == otc_trade_message_written.price_notation[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> assert(otc_trade_message_read.price_currency[otc_trade_message_at] == otc_trade_message_written.price_currency[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> assert(otc_trade_message_read.quantity[otc_trade_message_at] == otc_trade_message_written.quantity[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  assert(otc_trade_message_read.quantity_fraction == otc_trade_message_written.quantity_fraction);
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 25 -> assert(otc_trade_message_read.notation_of_the_quantity_in_measurement_unit[otc_trade_message_at] == otc_trade_message_written.notation_of_the_quantity_in_measurement_unit[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> assert(otc_trade_message_read.quantity_in_measurement_unit[otc_trade_message_at] == otc_trade_message_written.quantity_in_measurement_unit[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  assert(otc_trade_message_read.quantity_in_measurement_unit_fraction == otc_trade_message_written.quantity_in_measurement_unit_fraction);
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> assert(otc_trade_message_read.venue_of_execution[otc_trade_message_at] == otc_trade_message_written.venue_of_execution[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 8 -> assert(otc_trade_message_read.notional_amount[otc_trade_message_at] == otc_trade_message_written.notional_amount[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  assert(otc_trade_message_read.notional_amount_fraction == otc_trade_message_written.notional_amount_fraction);
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 3 -> assert(otc_trade_message_read.notional_currency[otc_trade_message_at] == otc_trade_message_written.notional_currency[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> assert(otc_trade_message_read.type[otc_trade_message_at] == otc_trade_message_written.type[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 10 -> assert(otc_trade_message_read.transaction_identifier_code[otc_trade_message_at] == otc_trade_message_written.transaction_identifier_code[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 14 -> assert(otc_trade_message_read.mmt_trade_flags[otc_trade_message_at] == otc_trade_message_written.mmt_trade_flags[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
  :: else -> break
  od;
  assert(otc_trade_message_read.transaction_to_be_cleared == otc_trade_message_written.transaction_to_be_cleared);
  assert(otc_trade_message_read.trade_type == otc_trade_message_written.trade_type);
  otc_trade_message_at = 0;
  do
  :: otc_trade_message_at < 4 -> assert(otc_trade_message_read.third_country_trading_venue_of_execution[otc_trade_message_at] == otc_trade_message_written.third_country_trading_venue_of_execution[otc_trade_message_at]); otc_trade_message_at = otc_trade_message_at + 1
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
    assert(at == 22);
    at = 0;
    decode_adjusted_closing_price_message(adjusted_closing_price_message_got);
    assert(at == 22);
    equal_adjusted_closing_price_message(adjusted_closing_price_message_got, adjusted_closing_price_message_sent)
  }
}

/* On Exchange Trade Message: encoded, read back, and compared */
proctype check_on_exchange_trade_message() {
  OnExchangeTradeMessage on_exchange_trade_message_sent;
  OnExchangeTradeMessage on_exchange_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_on_exchange_trade_message(on_exchange_trade_message_sent, 0)
  :: pattern == 1 -> fill_on_exchange_trade_message(on_exchange_trade_message_sent, 32)
  :: pattern == 2 -> fill_on_exchange_trade_message(on_exchange_trade_message_sent, 255)
  :: else -> ramp_on_exchange_trade_message(on_exchange_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_on_exchange_trade_message(on_exchange_trade_message_sent);
    assert(at == 92);
    at = 0;
    decode_on_exchange_trade_message(on_exchange_trade_message_got);
    assert(at == 92);
    equal_on_exchange_trade_message(on_exchange_trade_message_got, on_exchange_trade_message_sent)
  }
}

/* Otc Trade Message: encoded, read back, and compared */
proctype check_otc_trade_message() {
  OtcTradeMessage otc_trade_message_sent;
  OtcTradeMessage otc_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_otc_trade_message(otc_trade_message_sent, 0)
  :: pattern == 1 -> fill_otc_trade_message(otc_trade_message_sent, 32)
  :: pattern == 2 -> fill_otc_trade_message(otc_trade_message_sent, 255)
  :: else -> ramp_otc_trade_message(otc_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_otc_trade_message(otc_trade_message_sent);
    assert(at == 147);
    at = 0;
    decode_otc_trade_message(otc_trade_message_got);
    assert(at == 147);
    equal_otc_trade_message(otc_trade_message_got, otc_trade_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_adjusted_closing_price_message()
  :: run check_on_exchange_trade_message()
  :: run check_otc_trade_message()
  fi
}
