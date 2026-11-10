/*
 * TMX Group Level 1
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 164

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 22 bytes ------------------------------------------------ */

/* Twenty two byte ascii header carried on every Qrtmd message */
typedef MessageHeader {
  byte message_length[4];
  byte sequence_number[9];
  byte service_identifier[3];
  byte retransmission_identifier;
  byte continuation_identifier;
  byte message_type[2];
  byte exchange_identifier[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> message_header_record.service_identifier[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.retransmission_identifier = message_header_value;
  message_header_record.continuation_identifier = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.exchange_identifier[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.sequence_number[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> message_header_record.service_identifier[message_header_at] = (message_header_base + 13 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.retransmission_identifier = (message_header_base + 16 + 1) % 256;
  message_header_record.continuation_identifier = (message_header_base + 17 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 18 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.exchange_identifier[message_header_at] = (message_header_base + 20 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 22 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> wire[at] = message_header_record.sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> wire[at] = message_header_record.service_identifier[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.retransmission_identifier; at = at + 1;
  wire[at] = message_header_record.continuation_identifier; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.exchange_identifier[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 22 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> message_header_record.service_identifier[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.retransmission_identifier = wire[at]; at = at + 1;
  message_header_record.continuation_identifier = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.exchange_identifier[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> assert(message_header_read.sequence_number[message_header_at] == message_header_written.sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> assert(message_header_read.service_identifier[message_header_at] == message_header_written.service_identifier[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.retransmission_identifier == message_header_written.retransmission_identifier);
  assert(message_header_read.continuation_identifier == message_header_written.continuation_identifier);
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.exchange_identifier[message_header_at] == message_header_written.exchange_identifier[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 105 bytes ------------------------------------------------ */

/* A trade in an equity on the Tsx or Tsx Venture market. */
typedef TradeMessage {
  byte symbol[12];
  byte volume[9];
  byte trade_price[11];
  byte buyer_id[3];
  byte seller_id[3];
  byte trade_time_stamp[6];
  byte last_sale[11];
  byte trade_id[9];
  byte cross_type;
  byte moc;
  byte bypass;
  byte opening_trade;
  byte settlement_terms;
  byte trading_system_time_stamp[23];
  byte listing_market;
  byte product_type;
  byte trade_date[8];
  byte is_mid_only;
  byte is_dark;
  byte is_conditional
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.symbol[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.volume[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.trade_price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.buyer_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.seller_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.trade_time_stamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.last_sale[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.trade_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.cross_type = trade_message_value;
  trade_message_record.moc = trade_message_value;
  trade_message_record.bypass = trade_message_value;
  trade_message_record.opening_trade = trade_message_value;
  trade_message_record.settlement_terms = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> trade_message_record.trading_system_time_stamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.listing_market = trade_message_value;
  trade_message_record.product_type = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_date[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.is_mid_only = trade_message_value;
  trade_message_record.is_dark = trade_message_value;
  trade_message_record.is_conditional = trade_message_value;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.symbol[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.volume[trade_message_at] = (trade_message_base + 12 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.trade_price[trade_message_at] = (trade_message_base + 21 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.buyer_id[trade_message_at] = (trade_message_base + 32 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.seller_id[trade_message_at] = (trade_message_base + 35 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.trade_time_stamp[trade_message_at] = (trade_message_base + 38 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.last_sale[trade_message_at] = (trade_message_base + 44 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.trade_id[trade_message_at] = (trade_message_base + 55 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.cross_type = (trade_message_base + 64 + 1) % 256;
  trade_message_record.moc = (trade_message_base + 65 + 1) % 256;
  trade_message_record.bypass = (trade_message_base + 66 + 1) % 256;
  trade_message_record.opening_trade = (trade_message_base + 67 + 1) % 256;
  trade_message_record.settlement_terms = (trade_message_base + 68 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> trade_message_record.trading_system_time_stamp[trade_message_at] = (trade_message_base + 69 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.listing_market = (trade_message_base + 92 + 1) % 256;
  trade_message_record.product_type = (trade_message_base + 93 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_date[trade_message_at] = (trade_message_base + 94 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.is_mid_only = (trade_message_base + 102 + 1) % 256;
  trade_message_record.is_dark = (trade_message_base + 103 + 1) % 256;
  trade_message_record.is_conditional = (trade_message_base + 104 + 1) % 256;
  skip
}

/* Trade Message to the wire, 105 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> wire[at] = trade_message_record.symbol[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> wire[at] = trade_message_record.volume[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> wire[at] = trade_message_record.trade_price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> wire[at] = trade_message_record.buyer_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> wire[at] = trade_message_record.seller_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> wire[at] = trade_message_record.trade_time_stamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> wire[at] = trade_message_record.last_sale[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> wire[at] = trade_message_record.trade_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.cross_type; at = at + 1;
  wire[at] = trade_message_record.moc; at = at + 1;
  wire[at] = trade_message_record.bypass; at = at + 1;
  wire[at] = trade_message_record.opening_trade; at = at + 1;
  wire[at] = trade_message_record.settlement_terms; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> wire[at] = trade_message_record.trading_system_time_stamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.listing_market; at = at + 1;
  wire[at] = trade_message_record.product_type; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.trade_date[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.is_mid_only; at = at + 1;
  wire[at] = trade_message_record.is_dark; at = at + 1;
  wire[at] = trade_message_record.is_conditional; at = at + 1;
  skip
}

/* Trade Message off the wire, 105 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.symbol[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.volume[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.trade_price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.buyer_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.seller_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.trade_time_stamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.last_sale[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.trade_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.cross_type = wire[at]; at = at + 1;
  trade_message_record.moc = wire[at]; at = at + 1;
  trade_message_record.bypass = wire[at]; at = at + 1;
  trade_message_record.opening_trade = wire[at]; at = at + 1;
  trade_message_record.settlement_terms = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> trade_message_record.trading_system_time_stamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.listing_market = wire[at]; at = at + 1;
  trade_message_record.product_type = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_date[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.is_mid_only = wire[at]; at = at + 1;
  trade_message_record.is_dark = wire[at]; at = at + 1;
  trade_message_record.is_conditional = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> assert(trade_message_read.symbol[trade_message_at] == trade_message_written.symbol[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> assert(trade_message_read.volume[trade_message_at] == trade_message_written.volume[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> assert(trade_message_read.trade_price[trade_message_at] == trade_message_written.trade_price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> assert(trade_message_read.buyer_id[trade_message_at] == trade_message_written.buyer_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> assert(trade_message_read.seller_id[trade_message_at] == trade_message_written.seller_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> assert(trade_message_read.trade_time_stamp[trade_message_at] == trade_message_written.trade_time_stamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> assert(trade_message_read.last_sale[trade_message_at] == trade_message_written.last_sale[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> assert(trade_message_read.trade_id[trade_message_at] == trade_message_written.trade_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.cross_type == trade_message_written.cross_type);
  assert(trade_message_read.moc == trade_message_written.moc);
  assert(trade_message_read.bypass == trade_message_written.bypass);
  assert(trade_message_read.opening_trade == trade_message_written.opening_trade);
  assert(trade_message_read.settlement_terms == trade_message_written.settlement_terms);
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> assert(trade_message_read.trading_system_time_stamp[trade_message_at] == trade_message_written.trading_system_time_stamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.listing_market == trade_message_written.listing_market);
  assert(trade_message_read.product_type == trade_message_written.product_type);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.trade_date[trade_message_at] == trade_message_written.trade_date[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.is_mid_only == trade_message_written.is_mid_only);
  assert(trade_message_read.is_dark == trade_message_written.is_dark);
  assert(trade_message_read.is_conditional == trade_message_written.is_conditional);
  skip
}

/* ---- Symbol Status Message: 164 bytes ---------------------------------------- */

/* Reference information for a symbol trading on the current day. */
typedef SymbolStatusMessage {
  byte symbol[12];
  byte trading_system_time_stamp[23];
  byte exchange_id[3];
  byte cusip[12];
  byte board_lot[9];
  byte currency;
  byte face_value[9];
  byte last_sale[11];
  byte moc_eligible;
  byte product_type;
  byte symbol_name[40];
  byte stock_group[2];
  byte stock_state[2];
  byte listing_market;
  byte buy_maximum_quantity[9];
  byte buy_minimum_quantity[9];
  byte sell_maximum_quantity[9];
  byte sell_minimum_quantity[9];
  byte test_symbol
};

int symbol_status_message_at;

/* every byte of Symbol Status Message set to one value */
inline fill_symbol_status_message(symbol_status_message_record, symbol_status_message_value) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.symbol[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 23 -> symbol_status_message_record.trading_system_time_stamp[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 3 -> symbol_status_message_record.exchange_id[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.cusip[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.board_lot[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.currency = symbol_status_message_value;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.face_value[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 11 -> symbol_status_message_record.last_sale[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.moc_eligible = symbol_status_message_value;
  symbol_status_message_record.product_type = symbol_status_message_value;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 40 -> symbol_status_message_record.symbol_name[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_group[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.listing_market = symbol_status_message_value;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.buy_maximum_quantity[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.buy_minimum_quantity[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.sell_maximum_quantity[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.sell_minimum_quantity[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = symbol_status_message_value;
  skip
}

/* each byte of Symbol Status Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_status_message(symbol_status_message_record, symbol_status_message_base) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.symbol[symbol_status_message_at] = (symbol_status_message_base + 0 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 23 -> symbol_status_message_record.trading_system_time_stamp[symbol_status_message_at] = (symbol_status_message_base + 12 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 3 -> symbol_status_message_record.exchange_id[symbol_status_message_at] = (symbol_status_message_base + 35 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.cusip[symbol_status_message_at] = (symbol_status_message_base + 38 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.board_lot[symbol_status_message_at] = (symbol_status_message_base + 50 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.currency = (symbol_status_message_base + 59 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.face_value[symbol_status_message_at] = (symbol_status_message_base + 60 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 11 -> symbol_status_message_record.last_sale[symbol_status_message_at] = (symbol_status_message_base + 69 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.moc_eligible = (symbol_status_message_base + 80 + 1) % 256;
  symbol_status_message_record.product_type = (symbol_status_message_base + 81 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 40 -> symbol_status_message_record.symbol_name[symbol_status_message_at] = (symbol_status_message_base + 82 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_group[symbol_status_message_at] = (symbol_status_message_base + 122 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = (symbol_status_message_base + 124 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.listing_market = (symbol_status_message_base + 126 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.buy_maximum_quantity[symbol_status_message_at] = (symbol_status_message_base + 127 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.buy_minimum_quantity[symbol_status_message_at] = (symbol_status_message_base + 136 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.sell_maximum_quantity[symbol_status_message_at] = (symbol_status_message_base + 145 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.sell_minimum_quantity[symbol_status_message_at] = (symbol_status_message_base + 154 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = (symbol_status_message_base + 163 + 1) % 256;
  skip
}

/* Symbol Status Message to the wire, 164 bytes from where the cursor stands */
inline encode_symbol_status_message(symbol_status_message_record) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> wire[at] = symbol_status_message_record.symbol[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 23 -> wire[at] = symbol_status_message_record.trading_system_time_stamp[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 3 -> wire[at] = symbol_status_message_record.exchange_id[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> wire[at] = symbol_status_message_record.cusip[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> wire[at] = symbol_status_message_record.board_lot[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.currency; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> wire[at] = symbol_status_message_record.face_value[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 11 -> wire[at] = symbol_status_message_record.last_sale[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.moc_eligible; at = at + 1;
  wire[at] = symbol_status_message_record.product_type; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 40 -> wire[at] = symbol_status_message_record.symbol_name[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> wire[at] = symbol_status_message_record.stock_group[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> wire[at] = symbol_status_message_record.stock_state[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.listing_market; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> wire[at] = symbol_status_message_record.buy_maximum_quantity[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> wire[at] = symbol_status_message_record.buy_minimum_quantity[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> wire[at] = symbol_status_message_record.sell_maximum_quantity[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> wire[at] = symbol_status_message_record.sell_minimum_quantity[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.test_symbol; at = at + 1;
  skip
}

/* Symbol Status Message off the wire, 164 bytes from where the cursor stands */
inline decode_symbol_status_message(symbol_status_message_record) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.symbol[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 23 -> symbol_status_message_record.trading_system_time_stamp[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 3 -> symbol_status_message_record.exchange_id[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.cusip[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.board_lot[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.currency = wire[at]; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.face_value[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 11 -> symbol_status_message_record.last_sale[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.moc_eligible = wire[at]; at = at + 1;
  symbol_status_message_record.product_type = wire[at]; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 40 -> symbol_status_message_record.symbol_name[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_group[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.listing_market = wire[at]; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.buy_maximum_quantity[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.buy_minimum_quantity[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.sell_maximum_quantity[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.sell_minimum_quantity[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = wire[at]; at = at + 1;
  skip
}

/* what was read of Symbol Status Message is what was written, byte for byte */
inline equal_symbol_status_message(symbol_status_message_read, symbol_status_message_written) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> assert(symbol_status_message_read.symbol[symbol_status_message_at] == symbol_status_message_written.symbol[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 23 -> assert(symbol_status_message_read.trading_system_time_stamp[symbol_status_message_at] == symbol_status_message_written.trading_system_time_stamp[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 3 -> assert(symbol_status_message_read.exchange_id[symbol_status_message_at] == symbol_status_message_written.exchange_id[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> assert(symbol_status_message_read.cusip[symbol_status_message_at] == symbol_status_message_written.cusip[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> assert(symbol_status_message_read.board_lot[symbol_status_message_at] == symbol_status_message_written.board_lot[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.currency == symbol_status_message_written.currency);
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> assert(symbol_status_message_read.face_value[symbol_status_message_at] == symbol_status_message_written.face_value[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 11 -> assert(symbol_status_message_read.last_sale[symbol_status_message_at] == symbol_status_message_written.last_sale[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.moc_eligible == symbol_status_message_written.moc_eligible);
  assert(symbol_status_message_read.product_type == symbol_status_message_written.product_type);
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 40 -> assert(symbol_status_message_read.symbol_name[symbol_status_message_at] == symbol_status_message_written.symbol_name[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> assert(symbol_status_message_read.stock_group[symbol_status_message_at] == symbol_status_message_written.stock_group[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> assert(symbol_status_message_read.stock_state[symbol_status_message_at] == symbol_status_message_written.stock_state[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.listing_market == symbol_status_message_written.listing_market);
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> assert(symbol_status_message_read.buy_maximum_quantity[symbol_status_message_at] == symbol_status_message_written.buy_maximum_quantity[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> assert(symbol_status_message_read.buy_minimum_quantity[symbol_status_message_at] == symbol_status_message_written.buy_minimum_quantity[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> assert(symbol_status_message_read.sell_maximum_quantity[symbol_status_message_at] == symbol_status_message_written.sell_maximum_quantity[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> assert(symbol_status_message_read.sell_minimum_quantity[symbol_status_message_at] == symbol_status_message_written.sell_minimum_quantity[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.test_symbol == symbol_status_message_written.test_symbol);
  skip
}

/* ---- Moc Imbalance Notification Message: 102 bytes --------------------------- */

/* Volume imbalance for a Market On Close eligible symbol, sent every ten seconds from the beginning of the MOC Imbalance session. */
typedef MocImbalanceNotificationMessage {
  byte symbol[12];
  byte imbalance_side;
  byte imbalance_volume[9];
  byte imbalance_reference_price[11];
  byte paired_volume[9];
  byte market_order_imbalance_volume[9];
  byte market_order_imbalance_side;
  byte near_indicative_closing_price[11];
  byte far_indicative_closing_price[11];
  byte price_variation[5];
  byte trading_system_time_stamp[23]
};

int moc_imbalance_notification_message_at;

/* every byte of Moc Imbalance Notification Message set to one value */
inline fill_moc_imbalance_notification_message(moc_imbalance_notification_message_record, moc_imbalance_notification_message_value) {
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 12 -> moc_imbalance_notification_message_record.symbol[moc_imbalance_notification_message_at] = moc_imbalance_notification_message_value; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_record.imbalance_side = moc_imbalance_notification_message_value;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> moc_imbalance_notification_message_record.imbalance_volume[moc_imbalance_notification_message_at] = moc_imbalance_notification_message_value; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> moc_imbalance_notification_message_record.imbalance_reference_price[moc_imbalance_notification_message_at] = moc_imbalance_notification_message_value; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> moc_imbalance_notification_message_record.paired_volume[moc_imbalance_notification_message_at] = moc_imbalance_notification_message_value; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> moc_imbalance_notification_message_record.market_order_imbalance_volume[moc_imbalance_notification_message_at] = moc_imbalance_notification_message_value; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_record.market_order_imbalance_side = moc_imbalance_notification_message_value;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> moc_imbalance_notification_message_record.near_indicative_closing_price[moc_imbalance_notification_message_at] = moc_imbalance_notification_message_value; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> moc_imbalance_notification_message_record.far_indicative_closing_price[moc_imbalance_notification_message_at] = moc_imbalance_notification_message_value; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 5 -> moc_imbalance_notification_message_record.price_variation[moc_imbalance_notification_message_at] = moc_imbalance_notification_message_value; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 23 -> moc_imbalance_notification_message_record.trading_system_time_stamp[moc_imbalance_notification_message_at] = moc_imbalance_notification_message_value; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Moc Imbalance Notification Message set to where it lies, so a field read out of place says so */
inline ramp_moc_imbalance_notification_message(moc_imbalance_notification_message_record, moc_imbalance_notification_message_base) {
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 12 -> moc_imbalance_notification_message_record.symbol[moc_imbalance_notification_message_at] = (moc_imbalance_notification_message_base + 0 + moc_imbalance_notification_message_at + 1) % 256; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_record.imbalance_side = (moc_imbalance_notification_message_base + 12 + 1) % 256;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> moc_imbalance_notification_message_record.imbalance_volume[moc_imbalance_notification_message_at] = (moc_imbalance_notification_message_base + 13 + moc_imbalance_notification_message_at + 1) % 256; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> moc_imbalance_notification_message_record.imbalance_reference_price[moc_imbalance_notification_message_at] = (moc_imbalance_notification_message_base + 22 + moc_imbalance_notification_message_at + 1) % 256; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> moc_imbalance_notification_message_record.paired_volume[moc_imbalance_notification_message_at] = (moc_imbalance_notification_message_base + 33 + moc_imbalance_notification_message_at + 1) % 256; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> moc_imbalance_notification_message_record.market_order_imbalance_volume[moc_imbalance_notification_message_at] = (moc_imbalance_notification_message_base + 42 + moc_imbalance_notification_message_at + 1) % 256; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_record.market_order_imbalance_side = (moc_imbalance_notification_message_base + 51 + 1) % 256;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> moc_imbalance_notification_message_record.near_indicative_closing_price[moc_imbalance_notification_message_at] = (moc_imbalance_notification_message_base + 52 + moc_imbalance_notification_message_at + 1) % 256; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> moc_imbalance_notification_message_record.far_indicative_closing_price[moc_imbalance_notification_message_at] = (moc_imbalance_notification_message_base + 63 + moc_imbalance_notification_message_at + 1) % 256; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 5 -> moc_imbalance_notification_message_record.price_variation[moc_imbalance_notification_message_at] = (moc_imbalance_notification_message_base + 74 + moc_imbalance_notification_message_at + 1) % 256; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 23 -> moc_imbalance_notification_message_record.trading_system_time_stamp[moc_imbalance_notification_message_at] = (moc_imbalance_notification_message_base + 79 + moc_imbalance_notification_message_at + 1) % 256; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Moc Imbalance Notification Message to the wire, 102 bytes from where the cursor stands */
inline encode_moc_imbalance_notification_message(moc_imbalance_notification_message_record) {
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 12 -> wire[at] = moc_imbalance_notification_message_record.symbol[moc_imbalance_notification_message_at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = moc_imbalance_notification_message_record.imbalance_side; at = at + 1;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> wire[at] = moc_imbalance_notification_message_record.imbalance_volume[moc_imbalance_notification_message_at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> wire[at] = moc_imbalance_notification_message_record.imbalance_reference_price[moc_imbalance_notification_message_at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> wire[at] = moc_imbalance_notification_message_record.paired_volume[moc_imbalance_notification_message_at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> wire[at] = moc_imbalance_notification_message_record.market_order_imbalance_volume[moc_imbalance_notification_message_at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = moc_imbalance_notification_message_record.market_order_imbalance_side; at = at + 1;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> wire[at] = moc_imbalance_notification_message_record.near_indicative_closing_price[moc_imbalance_notification_message_at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> wire[at] = moc_imbalance_notification_message_record.far_indicative_closing_price[moc_imbalance_notification_message_at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 5 -> wire[at] = moc_imbalance_notification_message_record.price_variation[moc_imbalance_notification_message_at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 23 -> wire[at] = moc_imbalance_notification_message_record.trading_system_time_stamp[moc_imbalance_notification_message_at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Moc Imbalance Notification Message off the wire, 102 bytes from where the cursor stands */
inline decode_moc_imbalance_notification_message(moc_imbalance_notification_message_record) {
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 12 -> moc_imbalance_notification_message_record.symbol[moc_imbalance_notification_message_at] = wire[at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_record.imbalance_side = wire[at]; at = at + 1;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> moc_imbalance_notification_message_record.imbalance_volume[moc_imbalance_notification_message_at] = wire[at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> moc_imbalance_notification_message_record.imbalance_reference_price[moc_imbalance_notification_message_at] = wire[at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> moc_imbalance_notification_message_record.paired_volume[moc_imbalance_notification_message_at] = wire[at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> moc_imbalance_notification_message_record.market_order_imbalance_volume[moc_imbalance_notification_message_at] = wire[at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_record.market_order_imbalance_side = wire[at]; at = at + 1;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> moc_imbalance_notification_message_record.near_indicative_closing_price[moc_imbalance_notification_message_at] = wire[at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> moc_imbalance_notification_message_record.far_indicative_closing_price[moc_imbalance_notification_message_at] = wire[at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 5 -> moc_imbalance_notification_message_record.price_variation[moc_imbalance_notification_message_at] = wire[at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 23 -> moc_imbalance_notification_message_record.trading_system_time_stamp[moc_imbalance_notification_message_at] = wire[at]; at = at + 1; moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Moc Imbalance Notification Message is what was written, byte for byte */
inline equal_moc_imbalance_notification_message(moc_imbalance_notification_message_read, moc_imbalance_notification_message_written) {
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 12 -> assert(moc_imbalance_notification_message_read.symbol[moc_imbalance_notification_message_at] == moc_imbalance_notification_message_written.symbol[moc_imbalance_notification_message_at]); moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  assert(moc_imbalance_notification_message_read.imbalance_side == moc_imbalance_notification_message_written.imbalance_side);
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> assert(moc_imbalance_notification_message_read.imbalance_volume[moc_imbalance_notification_message_at] == moc_imbalance_notification_message_written.imbalance_volume[moc_imbalance_notification_message_at]); moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> assert(moc_imbalance_notification_message_read.imbalance_reference_price[moc_imbalance_notification_message_at] == moc_imbalance_notification_message_written.imbalance_reference_price[moc_imbalance_notification_message_at]); moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> assert(moc_imbalance_notification_message_read.paired_volume[moc_imbalance_notification_message_at] == moc_imbalance_notification_message_written.paired_volume[moc_imbalance_notification_message_at]); moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 9 -> assert(moc_imbalance_notification_message_read.market_order_imbalance_volume[moc_imbalance_notification_message_at] == moc_imbalance_notification_message_written.market_order_imbalance_volume[moc_imbalance_notification_message_at]); moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  assert(moc_imbalance_notification_message_read.market_order_imbalance_side == moc_imbalance_notification_message_written.market_order_imbalance_side);
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> assert(moc_imbalance_notification_message_read.near_indicative_closing_price[moc_imbalance_notification_message_at] == moc_imbalance_notification_message_written.near_indicative_closing_price[moc_imbalance_notification_message_at]); moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 11 -> assert(moc_imbalance_notification_message_read.far_indicative_closing_price[moc_imbalance_notification_message_at] == moc_imbalance_notification_message_written.far_indicative_closing_price[moc_imbalance_notification_message_at]); moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 5 -> assert(moc_imbalance_notification_message_read.price_variation[moc_imbalance_notification_message_at] == moc_imbalance_notification_message_written.price_variation[moc_imbalance_notification_message_at]); moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  moc_imbalance_notification_message_at = 0;
  do
  :: moc_imbalance_notification_message_at < 23 -> assert(moc_imbalance_notification_message_read.trading_system_time_stamp[moc_imbalance_notification_message_at] == moc_imbalance_notification_message_written.trading_system_time_stamp[moc_imbalance_notification_message_at]); moc_imbalance_notification_message_at = moc_imbalance_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Moc Price Movement Delay Message: 59 bytes ------------------------------ */

/* Transmitted when Price Movement Extension is invoked. */
typedef MocPriceMovementDelayMessage {
  byte symbol[12];
  byte trading_system_time_stamp[23];
  byte stock_state[2];
  byte ccp[11];
  byte vwap[11]
};

int moc_price_movement_delay_message_at;

/* every byte of Moc Price Movement Delay Message set to one value */
inline fill_moc_price_movement_delay_message(moc_price_movement_delay_message_record, moc_price_movement_delay_message_value) {
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 12 -> moc_price_movement_delay_message_record.symbol[moc_price_movement_delay_message_at] = moc_price_movement_delay_message_value; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 23 -> moc_price_movement_delay_message_record.trading_system_time_stamp[moc_price_movement_delay_message_at] = moc_price_movement_delay_message_value; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 2 -> moc_price_movement_delay_message_record.stock_state[moc_price_movement_delay_message_at] = moc_price_movement_delay_message_value; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> moc_price_movement_delay_message_record.ccp[moc_price_movement_delay_message_at] = moc_price_movement_delay_message_value; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> moc_price_movement_delay_message_record.vwap[moc_price_movement_delay_message_at] = moc_price_movement_delay_message_value; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Moc Price Movement Delay Message set to where it lies, so a field read out of place says so */
inline ramp_moc_price_movement_delay_message(moc_price_movement_delay_message_record, moc_price_movement_delay_message_base) {
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 12 -> moc_price_movement_delay_message_record.symbol[moc_price_movement_delay_message_at] = (moc_price_movement_delay_message_base + 0 + moc_price_movement_delay_message_at + 1) % 256; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 23 -> moc_price_movement_delay_message_record.trading_system_time_stamp[moc_price_movement_delay_message_at] = (moc_price_movement_delay_message_base + 12 + moc_price_movement_delay_message_at + 1) % 256; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 2 -> moc_price_movement_delay_message_record.stock_state[moc_price_movement_delay_message_at] = (moc_price_movement_delay_message_base + 35 + moc_price_movement_delay_message_at + 1) % 256; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> moc_price_movement_delay_message_record.ccp[moc_price_movement_delay_message_at] = (moc_price_movement_delay_message_base + 37 + moc_price_movement_delay_message_at + 1) % 256; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> moc_price_movement_delay_message_record.vwap[moc_price_movement_delay_message_at] = (moc_price_movement_delay_message_base + 48 + moc_price_movement_delay_message_at + 1) % 256; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  skip
}

/* Moc Price Movement Delay Message to the wire, 59 bytes from where the cursor stands */
inline encode_moc_price_movement_delay_message(moc_price_movement_delay_message_record) {
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 12 -> wire[at] = moc_price_movement_delay_message_record.symbol[moc_price_movement_delay_message_at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 23 -> wire[at] = moc_price_movement_delay_message_record.trading_system_time_stamp[moc_price_movement_delay_message_at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 2 -> wire[at] = moc_price_movement_delay_message_record.stock_state[moc_price_movement_delay_message_at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> wire[at] = moc_price_movement_delay_message_record.ccp[moc_price_movement_delay_message_at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> wire[at] = moc_price_movement_delay_message_record.vwap[moc_price_movement_delay_message_at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  skip
}

/* Moc Price Movement Delay Message off the wire, 59 bytes from where the cursor stands */
inline decode_moc_price_movement_delay_message(moc_price_movement_delay_message_record) {
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 12 -> moc_price_movement_delay_message_record.symbol[moc_price_movement_delay_message_at] = wire[at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 23 -> moc_price_movement_delay_message_record.trading_system_time_stamp[moc_price_movement_delay_message_at] = wire[at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 2 -> moc_price_movement_delay_message_record.stock_state[moc_price_movement_delay_message_at] = wire[at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> moc_price_movement_delay_message_record.ccp[moc_price_movement_delay_message_at] = wire[at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> moc_price_movement_delay_message_record.vwap[moc_price_movement_delay_message_at] = wire[at]; at = at + 1; moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Moc Price Movement Delay Message is what was written, byte for byte */
inline equal_moc_price_movement_delay_message(moc_price_movement_delay_message_read, moc_price_movement_delay_message_written) {
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 12 -> assert(moc_price_movement_delay_message_read.symbol[moc_price_movement_delay_message_at] == moc_price_movement_delay_message_written.symbol[moc_price_movement_delay_message_at]); moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 23 -> assert(moc_price_movement_delay_message_read.trading_system_time_stamp[moc_price_movement_delay_message_at] == moc_price_movement_delay_message_written.trading_system_time_stamp[moc_price_movement_delay_message_at]); moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 2 -> assert(moc_price_movement_delay_message_read.stock_state[moc_price_movement_delay_message_at] == moc_price_movement_delay_message_written.stock_state[moc_price_movement_delay_message_at]); moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> assert(moc_price_movement_delay_message_read.ccp[moc_price_movement_delay_message_at] == moc_price_movement_delay_message_written.ccp[moc_price_movement_delay_message_at]); moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  moc_price_movement_delay_message_at = 0;
  do
  :: moc_price_movement_delay_message_at < 11 -> assert(moc_price_movement_delay_message_read.vwap[moc_price_movement_delay_message_at] == moc_price_movement_delay_message_written.vwap[moc_price_movement_delay_message_at]); moc_price_movement_delay_message_at = moc_price_movement_delay_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock State Message: 85 bytes ------------------------------------------- */

/* A change in the trading state of a stock. */
typedef StockStateMessage {
  byte symbol[12];
  byte trading_system_time_stamp[23];
  byte comment[40];
  byte stock_state[2];
  byte opening_time[6];
  byte listing_market;
  byte product_type
};

int stock_state_message_at;

/* every byte of Stock State Message set to one value */
inline fill_stock_state_message(stock_state_message_record, stock_state_message_value) {
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 12 -> stock_state_message_record.symbol[stock_state_message_at] = stock_state_message_value; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 23 -> stock_state_message_record.trading_system_time_stamp[stock_state_message_at] = stock_state_message_value; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 40 -> stock_state_message_record.comment[stock_state_message_at] = stock_state_message_value; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 2 -> stock_state_message_record.stock_state[stock_state_message_at] = stock_state_message_value; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 6 -> stock_state_message_record.opening_time[stock_state_message_at] = stock_state_message_value; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_record.listing_market = stock_state_message_value;
  stock_state_message_record.product_type = stock_state_message_value;
  skip
}

/* each byte of Stock State Message set to where it lies, so a field read out of place says so */
inline ramp_stock_state_message(stock_state_message_record, stock_state_message_base) {
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 12 -> stock_state_message_record.symbol[stock_state_message_at] = (stock_state_message_base + 0 + stock_state_message_at + 1) % 256; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 23 -> stock_state_message_record.trading_system_time_stamp[stock_state_message_at] = (stock_state_message_base + 12 + stock_state_message_at + 1) % 256; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 40 -> stock_state_message_record.comment[stock_state_message_at] = (stock_state_message_base + 35 + stock_state_message_at + 1) % 256; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 2 -> stock_state_message_record.stock_state[stock_state_message_at] = (stock_state_message_base + 75 + stock_state_message_at + 1) % 256; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 6 -> stock_state_message_record.opening_time[stock_state_message_at] = (stock_state_message_base + 77 + stock_state_message_at + 1) % 256; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_record.listing_market = (stock_state_message_base + 83 + 1) % 256;
  stock_state_message_record.product_type = (stock_state_message_base + 84 + 1) % 256;
  skip
}

/* Stock State Message to the wire, 85 bytes from where the cursor stands */
inline encode_stock_state_message(stock_state_message_record) {
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 12 -> wire[at] = stock_state_message_record.symbol[stock_state_message_at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 23 -> wire[at] = stock_state_message_record.trading_system_time_stamp[stock_state_message_at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 40 -> wire[at] = stock_state_message_record.comment[stock_state_message_at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 2 -> wire[at] = stock_state_message_record.stock_state[stock_state_message_at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 6 -> wire[at] = stock_state_message_record.opening_time[stock_state_message_at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_state_message_record.listing_market; at = at + 1;
  wire[at] = stock_state_message_record.product_type; at = at + 1;
  skip
}

/* Stock State Message off the wire, 85 bytes from where the cursor stands */
inline decode_stock_state_message(stock_state_message_record) {
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 12 -> stock_state_message_record.symbol[stock_state_message_at] = wire[at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 23 -> stock_state_message_record.trading_system_time_stamp[stock_state_message_at] = wire[at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 40 -> stock_state_message_record.comment[stock_state_message_at] = wire[at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 2 -> stock_state_message_record.stock_state[stock_state_message_at] = wire[at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 6 -> stock_state_message_record.opening_time[stock_state_message_at] = wire[at]; at = at + 1; stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_record.listing_market = wire[at]; at = at + 1;
  stock_state_message_record.product_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock State Message is what was written, byte for byte */
inline equal_stock_state_message(stock_state_message_read, stock_state_message_written) {
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 12 -> assert(stock_state_message_read.symbol[stock_state_message_at] == stock_state_message_written.symbol[stock_state_message_at]); stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 23 -> assert(stock_state_message_read.trading_system_time_stamp[stock_state_message_at] == stock_state_message_written.trading_system_time_stamp[stock_state_message_at]); stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 40 -> assert(stock_state_message_read.comment[stock_state_message_at] == stock_state_message_written.comment[stock_state_message_at]); stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 2 -> assert(stock_state_message_read.stock_state[stock_state_message_at] == stock_state_message_written.stock_state[stock_state_message_at]); stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  stock_state_message_at = 0;
  do
  :: stock_state_message_at < 6 -> assert(stock_state_message_read.opening_time[stock_state_message_at] == stock_state_message_written.opening_time[stock_state_message_at]); stock_state_message_at = stock_state_message_at + 1
  :: else -> break
  od;
  assert(stock_state_message_read.listing_market == stock_state_message_written.listing_market);
  assert(stock_state_message_read.product_type == stock_state_message_written.product_type);
  skip
}

/* ---- Quote Message: 71 bytes ------------------------------------------------- */

/* Full update quote sent whenever either the bid or the ask has changed. */
typedef QuoteMessage {
  byte symbol[12];
  byte bid_price[9];
  byte bid_size[9];
  byte ask_price[9];
  byte ask_size[9];
  byte trading_system_time_stamp[23]
};

int quote_message_at;

/* every byte of Quote Message set to one value */
inline fill_quote_message(quote_message_record, quote_message_value) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> quote_message_record.symbol[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.bid_price[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.bid_size[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.ask_price[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.ask_size[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 23 -> quote_message_record.trading_system_time_stamp[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Message set to where it lies, so a field read out of place says so */
inline ramp_quote_message(quote_message_record, quote_message_base) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> quote_message_record.symbol[quote_message_at] = (quote_message_base + 0 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.bid_price[quote_message_at] = (quote_message_base + 12 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.bid_size[quote_message_at] = (quote_message_base + 21 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.ask_price[quote_message_at] = (quote_message_base + 30 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.ask_size[quote_message_at] = (quote_message_base + 39 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 23 -> quote_message_record.trading_system_time_stamp[quote_message_at] = (quote_message_base + 48 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Message to the wire, 71 bytes from where the cursor stands */
inline encode_quote_message(quote_message_record) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> wire[at] = quote_message_record.symbol[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> wire[at] = quote_message_record.bid_price[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> wire[at] = quote_message_record.bid_size[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> wire[at] = quote_message_record.ask_price[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> wire[at] = quote_message_record.ask_size[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 23 -> wire[at] = quote_message_record.trading_system_time_stamp[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Message off the wire, 71 bytes from where the cursor stands */
inline decode_quote_message(quote_message_record) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> quote_message_record.symbol[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.bid_price[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.bid_size[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.ask_price[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> quote_message_record.ask_size[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 23 -> quote_message_record.trading_system_time_stamp[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Message is what was written, byte for byte */
inline equal_quote_message(quote_message_read, quote_message_written) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> assert(quote_message_read.symbol[quote_message_at] == quote_message_written.symbol[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> assert(quote_message_read.bid_price[quote_message_at] == quote_message_written.bid_price[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> assert(quote_message_read.bid_size[quote_message_at] == quote_message_written.bid_size[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> assert(quote_message_read.ask_price[quote_message_at] == quote_message_written.ask_price[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 9 -> assert(quote_message_read.ask_size[quote_message_at] == quote_message_written.ask_size[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 23 -> assert(quote_message_read.trading_system_time_stamp[quote_message_at] == quote_message_written.trading_system_time_stamp[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- General Message: 104 bytes ---------------------------------------------- */

/* Bulletin in textual format. */
typedef GeneralMessage {
  byte trading_system_time_stamp[23];
  byte bulletin_indicator;
  byte message_text[80]
};

int general_message_at;

/* every byte of General Message set to one value */
inline fill_general_message(general_message_record, general_message_value) {
  general_message_at = 0;
  do
  :: general_message_at < 23 -> general_message_record.trading_system_time_stamp[general_message_at] = general_message_value; general_message_at = general_message_at + 1
  :: else -> break
  od;
  general_message_record.bulletin_indicator = general_message_value;
  general_message_at = 0;
  do
  :: general_message_at < 80 -> general_message_record.message_text[general_message_at] = general_message_value; general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of General Message set to where it lies, so a field read out of place says so */
inline ramp_general_message(general_message_record, general_message_base) {
  general_message_at = 0;
  do
  :: general_message_at < 23 -> general_message_record.trading_system_time_stamp[general_message_at] = (general_message_base + 0 + general_message_at + 1) % 256; general_message_at = general_message_at + 1
  :: else -> break
  od;
  general_message_record.bulletin_indicator = (general_message_base + 23 + 1) % 256;
  general_message_at = 0;
  do
  :: general_message_at < 80 -> general_message_record.message_text[general_message_at] = (general_message_base + 24 + general_message_at + 1) % 256; general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* General Message to the wire, 104 bytes from where the cursor stands */
inline encode_general_message(general_message_record) {
  general_message_at = 0;
  do
  :: general_message_at < 23 -> wire[at] = general_message_record.trading_system_time_stamp[general_message_at]; at = at + 1; general_message_at = general_message_at + 1
  :: else -> break
  od;
  wire[at] = general_message_record.bulletin_indicator; at = at + 1;
  general_message_at = 0;
  do
  :: general_message_at < 80 -> wire[at] = general_message_record.message_text[general_message_at]; at = at + 1; general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* General Message off the wire, 104 bytes from where the cursor stands */
inline decode_general_message(general_message_record) {
  general_message_at = 0;
  do
  :: general_message_at < 23 -> general_message_record.trading_system_time_stamp[general_message_at] = wire[at]; at = at + 1; general_message_at = general_message_at + 1
  :: else -> break
  od;
  general_message_record.bulletin_indicator = wire[at]; at = at + 1;
  general_message_at = 0;
  do
  :: general_message_at < 80 -> general_message_record.message_text[general_message_at] = wire[at]; at = at + 1; general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of General Message is what was written, byte for byte */
inline equal_general_message(general_message_read, general_message_written) {
  general_message_at = 0;
  do
  :: general_message_at < 23 -> assert(general_message_read.trading_system_time_stamp[general_message_at] == general_message_written.trading_system_time_stamp[general_message_at]); general_message_at = general_message_at + 1
  :: else -> break
  od;
  assert(general_message_read.bulletin_indicator == general_message_written.bulletin_indicator);
  general_message_at = 0;
  do
  :: general_message_at < 80 -> assert(general_message_read.message_text[general_message_at] == general_message_written.message_text[general_message_at]); general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancellation Message: 97 bytes ------------------------------------ */

/* Cancellation of a trade, reducing total volume, value and transactions by the amount of the cancellation. */
typedef TradeCancellationMessage {
  byte symbol[12];
  byte volume[9];
  byte trade_price[11];
  byte buyer_id[3];
  byte seller_id[3];
  byte trade_time_stamp[6];
  byte original_trade_id[9];
  byte last_sale[11];
  byte trading_system_time_stamp[23];
  byte listing_market;
  byte product_type;
  byte trade_date[8]
};

int trade_cancellation_message_at;

/* every byte of Trade Cancellation Message set to one value */
inline fill_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_value) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 12 -> trade_cancellation_message_record.symbol[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> trade_cancellation_message_record.volume[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> trade_cancellation_message_record.trade_price[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> trade_cancellation_message_record.buyer_id[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> trade_cancellation_message_record.seller_id[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 6 -> trade_cancellation_message_record.trade_time_stamp[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> trade_cancellation_message_record.original_trade_id[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> trade_cancellation_message_record.last_sale[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 23 -> trade_cancellation_message_record.trading_system_time_stamp[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_record.listing_market = trade_cancellation_message_value;
  trade_cancellation_message_record.product_type = trade_cancellation_message_value;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> trade_cancellation_message_record.trade_date[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_base) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 12 -> trade_cancellation_message_record.symbol[trade_cancellation_message_at] = (trade_cancellation_message_base + 0 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> trade_cancellation_message_record.volume[trade_cancellation_message_at] = (trade_cancellation_message_base + 12 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> trade_cancellation_message_record.trade_price[trade_cancellation_message_at] = (trade_cancellation_message_base + 21 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> trade_cancellation_message_record.buyer_id[trade_cancellation_message_at] = (trade_cancellation_message_base + 32 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> trade_cancellation_message_record.seller_id[trade_cancellation_message_at] = (trade_cancellation_message_base + 35 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 6 -> trade_cancellation_message_record.trade_time_stamp[trade_cancellation_message_at] = (trade_cancellation_message_base + 38 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> trade_cancellation_message_record.original_trade_id[trade_cancellation_message_at] = (trade_cancellation_message_base + 44 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> trade_cancellation_message_record.last_sale[trade_cancellation_message_at] = (trade_cancellation_message_base + 53 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 23 -> trade_cancellation_message_record.trading_system_time_stamp[trade_cancellation_message_at] = (trade_cancellation_message_base + 64 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_record.listing_market = (trade_cancellation_message_base + 87 + 1) % 256;
  trade_cancellation_message_record.product_type = (trade_cancellation_message_base + 88 + 1) % 256;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> trade_cancellation_message_record.trade_date[trade_cancellation_message_at] = (trade_cancellation_message_base + 89 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message to the wire, 97 bytes from where the cursor stands */
inline encode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 12 -> wire[at] = trade_cancellation_message_record.symbol[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> wire[at] = trade_cancellation_message_record.volume[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> wire[at] = trade_cancellation_message_record.trade_price[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> wire[at] = trade_cancellation_message_record.buyer_id[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> wire[at] = trade_cancellation_message_record.seller_id[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 6 -> wire[at] = trade_cancellation_message_record.trade_time_stamp[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> wire[at] = trade_cancellation_message_record.original_trade_id[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> wire[at] = trade_cancellation_message_record.last_sale[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 23 -> wire[at] = trade_cancellation_message_record.trading_system_time_stamp[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancellation_message_record.listing_market; at = at + 1;
  wire[at] = trade_cancellation_message_record.product_type; at = at + 1;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> wire[at] = trade_cancellation_message_record.trade_date[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message off the wire, 97 bytes from where the cursor stands */
inline decode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 12 -> trade_cancellation_message_record.symbol[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> trade_cancellation_message_record.volume[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> trade_cancellation_message_record.trade_price[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> trade_cancellation_message_record.buyer_id[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> trade_cancellation_message_record.seller_id[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 6 -> trade_cancellation_message_record.trade_time_stamp[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> trade_cancellation_message_record.original_trade_id[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> trade_cancellation_message_record.last_sale[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 23 -> trade_cancellation_message_record.trading_system_time_stamp[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_record.listing_market = wire[at]; at = at + 1;
  trade_cancellation_message_record.product_type = wire[at]; at = at + 1;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> trade_cancellation_message_record.trade_date[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancellation Message is what was written, byte for byte */
inline equal_trade_cancellation_message(trade_cancellation_message_read, trade_cancellation_message_written) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 12 -> assert(trade_cancellation_message_read.symbol[trade_cancellation_message_at] == trade_cancellation_message_written.symbol[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> assert(trade_cancellation_message_read.volume[trade_cancellation_message_at] == trade_cancellation_message_written.volume[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> assert(trade_cancellation_message_read.trade_price[trade_cancellation_message_at] == trade_cancellation_message_written.trade_price[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> assert(trade_cancellation_message_read.buyer_id[trade_cancellation_message_at] == trade_cancellation_message_written.buyer_id[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 3 -> assert(trade_cancellation_message_read.seller_id[trade_cancellation_message_at] == trade_cancellation_message_written.seller_id[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 6 -> assert(trade_cancellation_message_read.trade_time_stamp[trade_cancellation_message_at] == trade_cancellation_message_written.trade_time_stamp[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 9 -> assert(trade_cancellation_message_read.original_trade_id[trade_cancellation_message_at] == trade_cancellation_message_written.original_trade_id[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 11 -> assert(trade_cancellation_message_read.last_sale[trade_cancellation_message_at] == trade_cancellation_message_written.last_sale[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 23 -> assert(trade_cancellation_message_read.trading_system_time_stamp[trade_cancellation_message_at] == trade_cancellation_message_written.trading_system_time_stamp[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  assert(trade_cancellation_message_read.listing_market == trade_cancellation_message_written.listing_market);
  assert(trade_cancellation_message_read.product_type == trade_cancellation_message_written.product_type);
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> assert(trade_cancellation_message_read.trade_date[trade_cancellation_message_at] == trade_cancellation_message_written.trade_date[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Price Message: 44 bytes -------------------------------------- */

/* Indicative Closing Price, calculated and published at sixteen hundred London time on every trading day. */
typedef IndicativePriceMessage {
  byte symbol[12];
  byte cusip[12];
  byte indicative_price[11];
  byte price_marker;
  byte business_date[8]
};

int indicative_price_message_at;

/* every byte of Indicative Price Message set to one value */
inline fill_indicative_price_message(indicative_price_message_record, indicative_price_message_value) {
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> indicative_price_message_record.symbol[indicative_price_message_at] = indicative_price_message_value; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> indicative_price_message_record.cusip[indicative_price_message_at] = indicative_price_message_value; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 11 -> indicative_price_message_record.indicative_price[indicative_price_message_at] = indicative_price_message_value; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_record.price_marker = indicative_price_message_value;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 8 -> indicative_price_message_record.business_date[indicative_price_message_at] = indicative_price_message_value; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indicative Price Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_price_message(indicative_price_message_record, indicative_price_message_base) {
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> indicative_price_message_record.symbol[indicative_price_message_at] = (indicative_price_message_base + 0 + indicative_price_message_at + 1) % 256; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> indicative_price_message_record.cusip[indicative_price_message_at] = (indicative_price_message_base + 12 + indicative_price_message_at + 1) % 256; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 11 -> indicative_price_message_record.indicative_price[indicative_price_message_at] = (indicative_price_message_base + 24 + indicative_price_message_at + 1) % 256; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_record.price_marker = (indicative_price_message_base + 35 + 1) % 256;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 8 -> indicative_price_message_record.business_date[indicative_price_message_at] = (indicative_price_message_base + 36 + indicative_price_message_at + 1) % 256; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Price Message to the wire, 44 bytes from where the cursor stands */
inline encode_indicative_price_message(indicative_price_message_record) {
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> wire[at] = indicative_price_message_record.symbol[indicative_price_message_at]; at = at + 1; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> wire[at] = indicative_price_message_record.cusip[indicative_price_message_at]; at = at + 1; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 11 -> wire[at] = indicative_price_message_record.indicative_price[indicative_price_message_at]; at = at + 1; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  wire[at] = indicative_price_message_record.price_marker; at = at + 1;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 8 -> wire[at] = indicative_price_message_record.business_date[indicative_price_message_at]; at = at + 1; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Price Message off the wire, 44 bytes from where the cursor stands */
inline decode_indicative_price_message(indicative_price_message_record) {
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> indicative_price_message_record.symbol[indicative_price_message_at] = wire[at]; at = at + 1; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> indicative_price_message_record.cusip[indicative_price_message_at] = wire[at]; at = at + 1; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 11 -> indicative_price_message_record.indicative_price[indicative_price_message_at] = wire[at]; at = at + 1; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_record.price_marker = wire[at]; at = at + 1;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 8 -> indicative_price_message_record.business_date[indicative_price_message_at] = wire[at]; at = at + 1; indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indicative Price Message is what was written, byte for byte */
inline equal_indicative_price_message(indicative_price_message_read, indicative_price_message_written) {
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> assert(indicative_price_message_read.symbol[indicative_price_message_at] == indicative_price_message_written.symbol[indicative_price_message_at]); indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 12 -> assert(indicative_price_message_read.cusip[indicative_price_message_at] == indicative_price_message_written.cusip[indicative_price_message_at]); indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 11 -> assert(indicative_price_message_read.indicative_price[indicative_price_message_at] == indicative_price_message_written.indicative_price[indicative_price_message_at]); indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  assert(indicative_price_message_read.price_marker == indicative_price_message_written.price_marker);
  indicative_price_message_at = 0;
  do
  :: indicative_price_message_at < 8 -> assert(indicative_price_message_read.business_date[indicative_price_message_at] == indicative_price_message_written.business_date[indicative_price_message_at]); indicative_price_message_at = indicative_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Calculated Opening Price Message: 59 bytes ------------------------------ */

/* Calculated Opening Price, published continuously from seven in the morning until the Tsx market opens. */
typedef CalculatedOpeningPriceMessage {
  byte symbol[12];
  byte cusip[12];
  byte cop[11];
  byte price_marker;
  byte trading_system_time_stamp[23]
};

int calculated_opening_price_message_at;

/* every byte of Calculated Opening Price Message set to one value */
inline fill_calculated_opening_price_message(calculated_opening_price_message_record, calculated_opening_price_message_value) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> calculated_opening_price_message_record.symbol[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> calculated_opening_price_message_record.cusip[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 11 -> calculated_opening_price_message_record.cop[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_record.price_marker = calculated_opening_price_message_value;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 23 -> calculated_opening_price_message_record.trading_system_time_stamp[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Calculated Opening Price Message set to where it lies, so a field read out of place says so */
inline ramp_calculated_opening_price_message(calculated_opening_price_message_record, calculated_opening_price_message_base) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> calculated_opening_price_message_record.symbol[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 0 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> calculated_opening_price_message_record.cusip[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 12 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 11 -> calculated_opening_price_message_record.cop[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 24 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_record.price_marker = (calculated_opening_price_message_base + 35 + 1) % 256;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 23 -> calculated_opening_price_message_record.trading_system_time_stamp[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 36 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Opening Price Message to the wire, 59 bytes from where the cursor stands */
inline encode_calculated_opening_price_message(calculated_opening_price_message_record) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> wire[at] = calculated_opening_price_message_record.symbol[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> wire[at] = calculated_opening_price_message_record.cusip[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 11 -> wire[at] = calculated_opening_price_message_record.cop[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  wire[at] = calculated_opening_price_message_record.price_marker; at = at + 1;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 23 -> wire[at] = calculated_opening_price_message_record.trading_system_time_stamp[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Opening Price Message off the wire, 59 bytes from where the cursor stands */
inline decode_calculated_opening_price_message(calculated_opening_price_message_record) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> calculated_opening_price_message_record.symbol[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> calculated_opening_price_message_record.cusip[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 11 -> calculated_opening_price_message_record.cop[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_record.price_marker = wire[at]; at = at + 1;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 23 -> calculated_opening_price_message_record.trading_system_time_stamp[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Calculated Opening Price Message is what was written, byte for byte */
inline equal_calculated_opening_price_message(calculated_opening_price_message_read, calculated_opening_price_message_written) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> assert(calculated_opening_price_message_read.symbol[calculated_opening_price_message_at] == calculated_opening_price_message_written.symbol[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 12 -> assert(calculated_opening_price_message_read.cusip[calculated_opening_price_message_at] == calculated_opening_price_message_written.cusip[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 11 -> assert(calculated_opening_price_message_read.cop[calculated_opening_price_message_at] == calculated_opening_price_message_written.cop[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  assert(calculated_opening_price_message_read.price_marker == calculated_opening_price_message_written.price_marker);
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 23 -> assert(calculated_opening_price_message_read.trading_system_time_stamp[calculated_opening_price_message_at] == calculated_opening_price_message_written.trading_system_time_stamp[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tsx Tsxv Closing Price Message: 61 bytes -------------------------------- */

/* Closing price of the trading day with the last bid and ask behind it. */
typedef TsxTsxvClosingPriceMessage {
  byte symbol[12];
  byte cusip[12];
  byte tsx_tsxv_closing_price[11];
  byte tsx_tsxv_last_bid[9];
  byte tsx_tsxv_last_ask[9];
  byte business_date[8]
};

int tsx_tsxv_closing_price_message_at;

/* every byte of Tsx Tsxv Closing Price Message set to one value */
inline fill_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_record, tsx_tsxv_closing_price_message_value) {
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> tsx_tsxv_closing_price_message_record.symbol[tsx_tsxv_closing_price_message_at] = tsx_tsxv_closing_price_message_value; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> tsx_tsxv_closing_price_message_record.cusip[tsx_tsxv_closing_price_message_at] = tsx_tsxv_closing_price_message_value; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 11 -> tsx_tsxv_closing_price_message_record.tsx_tsxv_closing_price[tsx_tsxv_closing_price_message_at] = tsx_tsxv_closing_price_message_value; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> tsx_tsxv_closing_price_message_record.tsx_tsxv_last_bid[tsx_tsxv_closing_price_message_at] = tsx_tsxv_closing_price_message_value; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> tsx_tsxv_closing_price_message_record.tsx_tsxv_last_ask[tsx_tsxv_closing_price_message_at] = tsx_tsxv_closing_price_message_value; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 8 -> tsx_tsxv_closing_price_message_record.business_date[tsx_tsxv_closing_price_message_at] = tsx_tsxv_closing_price_message_value; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tsx Tsxv Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_record, tsx_tsxv_closing_price_message_base) {
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> tsx_tsxv_closing_price_message_record.symbol[tsx_tsxv_closing_price_message_at] = (tsx_tsxv_closing_price_message_base + 0 + tsx_tsxv_closing_price_message_at + 1) % 256; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> tsx_tsxv_closing_price_message_record.cusip[tsx_tsxv_closing_price_message_at] = (tsx_tsxv_closing_price_message_base + 12 + tsx_tsxv_closing_price_message_at + 1) % 256; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 11 -> tsx_tsxv_closing_price_message_record.tsx_tsxv_closing_price[tsx_tsxv_closing_price_message_at] = (tsx_tsxv_closing_price_message_base + 24 + tsx_tsxv_closing_price_message_at + 1) % 256; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> tsx_tsxv_closing_price_message_record.tsx_tsxv_last_bid[tsx_tsxv_closing_price_message_at] = (tsx_tsxv_closing_price_message_base + 35 + tsx_tsxv_closing_price_message_at + 1) % 256; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> tsx_tsxv_closing_price_message_record.tsx_tsxv_last_ask[tsx_tsxv_closing_price_message_at] = (tsx_tsxv_closing_price_message_base + 44 + tsx_tsxv_closing_price_message_at + 1) % 256; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 8 -> tsx_tsxv_closing_price_message_record.business_date[tsx_tsxv_closing_price_message_at] = (tsx_tsxv_closing_price_message_base + 53 + tsx_tsxv_closing_price_message_at + 1) % 256; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tsx Tsxv Closing Price Message to the wire, 61 bytes from where the cursor stands */
inline encode_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_record) {
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> wire[at] = tsx_tsxv_closing_price_message_record.symbol[tsx_tsxv_closing_price_message_at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> wire[at] = tsx_tsxv_closing_price_message_record.cusip[tsx_tsxv_closing_price_message_at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 11 -> wire[at] = tsx_tsxv_closing_price_message_record.tsx_tsxv_closing_price[tsx_tsxv_closing_price_message_at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> wire[at] = tsx_tsxv_closing_price_message_record.tsx_tsxv_last_bid[tsx_tsxv_closing_price_message_at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> wire[at] = tsx_tsxv_closing_price_message_record.tsx_tsxv_last_ask[tsx_tsxv_closing_price_message_at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 8 -> wire[at] = tsx_tsxv_closing_price_message_record.business_date[tsx_tsxv_closing_price_message_at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tsx Tsxv Closing Price Message off the wire, 61 bytes from where the cursor stands */
inline decode_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_record) {
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> tsx_tsxv_closing_price_message_record.symbol[tsx_tsxv_closing_price_message_at] = wire[at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> tsx_tsxv_closing_price_message_record.cusip[tsx_tsxv_closing_price_message_at] = wire[at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 11 -> tsx_tsxv_closing_price_message_record.tsx_tsxv_closing_price[tsx_tsxv_closing_price_message_at] = wire[at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> tsx_tsxv_closing_price_message_record.tsx_tsxv_last_bid[tsx_tsxv_closing_price_message_at] = wire[at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> tsx_tsxv_closing_price_message_record.tsx_tsxv_last_ask[tsx_tsxv_closing_price_message_at] = wire[at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 8 -> tsx_tsxv_closing_price_message_record.business_date[tsx_tsxv_closing_price_message_at] = wire[at]; at = at + 1; tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tsx Tsxv Closing Price Message is what was written, byte for byte */
inline equal_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_read, tsx_tsxv_closing_price_message_written) {
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> assert(tsx_tsxv_closing_price_message_read.symbol[tsx_tsxv_closing_price_message_at] == tsx_tsxv_closing_price_message_written.symbol[tsx_tsxv_closing_price_message_at]); tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 12 -> assert(tsx_tsxv_closing_price_message_read.cusip[tsx_tsxv_closing_price_message_at] == tsx_tsxv_closing_price_message_written.cusip[tsx_tsxv_closing_price_message_at]); tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 11 -> assert(tsx_tsxv_closing_price_message_read.tsx_tsxv_closing_price[tsx_tsxv_closing_price_message_at] == tsx_tsxv_closing_price_message_written.tsx_tsxv_closing_price[tsx_tsxv_closing_price_message_at]); tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> assert(tsx_tsxv_closing_price_message_read.tsx_tsxv_last_bid[tsx_tsxv_closing_price_message_at] == tsx_tsxv_closing_price_message_written.tsx_tsxv_last_bid[tsx_tsxv_closing_price_message_at]); tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 9 -> assert(tsx_tsxv_closing_price_message_read.tsx_tsxv_last_ask[tsx_tsxv_closing_price_message_at] == tsx_tsxv_closing_price_message_written.tsx_tsxv_last_ask[tsx_tsxv_closing_price_message_at]); tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  tsx_tsxv_closing_price_message_at = 0;
  do
  :: tsx_tsxv_closing_price_message_at < 8 -> assert(tsx_tsxv_closing_price_message_read.business_date[tsx_tsxv_closing_price_message_at] == tsx_tsxv_closing_price_message_written.business_date[tsx_tsxv_closing_price_message_at]); tsx_tsxv_closing_price_message_at = tsx_tsxv_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market State Message: 26 bytes ------------------------------------------ */

/* The indication of the current market state for a stock group. */
typedef MarketStateMessage {
  byte trading_system_time_stamp[23];
  byte stock_group[2];
  byte market_state
};

int market_state_message_at;

/* every byte of Market State Message set to one value */
inline fill_market_state_message(market_state_message_record, market_state_message_value) {
  market_state_message_at = 0;
  do
  :: market_state_message_at < 23 -> market_state_message_record.trading_system_time_stamp[market_state_message_at] = market_state_message_value; market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  market_state_message_at = 0;
  do
  :: market_state_message_at < 2 -> market_state_message_record.stock_group[market_state_message_at] = market_state_message_value; market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  market_state_message_record.market_state = market_state_message_value;
  skip
}

/* each byte of Market State Message set to where it lies, so a field read out of place says so */
inline ramp_market_state_message(market_state_message_record, market_state_message_base) {
  market_state_message_at = 0;
  do
  :: market_state_message_at < 23 -> market_state_message_record.trading_system_time_stamp[market_state_message_at] = (market_state_message_base + 0 + market_state_message_at + 1) % 256; market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  market_state_message_at = 0;
  do
  :: market_state_message_at < 2 -> market_state_message_record.stock_group[market_state_message_at] = (market_state_message_base + 23 + market_state_message_at + 1) % 256; market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  market_state_message_record.market_state = (market_state_message_base + 25 + 1) % 256;
  skip
}

/* Market State Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_state_message(market_state_message_record) {
  market_state_message_at = 0;
  do
  :: market_state_message_at < 23 -> wire[at] = market_state_message_record.trading_system_time_stamp[market_state_message_at]; at = at + 1; market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  market_state_message_at = 0;
  do
  :: market_state_message_at < 2 -> wire[at] = market_state_message_record.stock_group[market_state_message_at]; at = at + 1; market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  wire[at] = market_state_message_record.market_state; at = at + 1;
  skip
}

/* Market State Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_state_message(market_state_message_record) {
  market_state_message_at = 0;
  do
  :: market_state_message_at < 23 -> market_state_message_record.trading_system_time_stamp[market_state_message_at] = wire[at]; at = at + 1; market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  market_state_message_at = 0;
  do
  :: market_state_message_at < 2 -> market_state_message_record.stock_group[market_state_message_at] = wire[at]; at = at + 1; market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  market_state_message_record.market_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Market State Message is what was written, byte for byte */
inline equal_market_state_message(market_state_message_read, market_state_message_written) {
  market_state_message_at = 0;
  do
  :: market_state_message_at < 23 -> assert(market_state_message_read.trading_system_time_stamp[market_state_message_at] == market_state_message_written.trading_system_time_stamp[market_state_message_at]); market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  market_state_message_at = 0;
  do
  :: market_state_message_at < 2 -> assert(market_state_message_read.stock_group[market_state_message_at] == market_state_message_written.stock_group[market_state_message_at]); market_state_message_at = market_state_message_at + 1
  :: else -> break
  od;
  assert(market_state_message_read.market_state == market_state_message_written.market_state);
  skip
}

/* ---- Trading Tier Status Message: 40 bytes ----------------------------------- */

/* Statistical information on the number of symbols and stock groups for the current trading day, sent at the beginning of each trading day. */
typedef TradingTierStatusMessage {
  byte exchange_id[3];
  byte total_number_of_symbols[5];
  byte total_number_of_stock_groups[3];
  byte trading_system_time_stamp[23];
  byte trading_tier_id[6]
};

int trading_tier_status_message_at;

/* every byte of Trading Tier Status Message set to one value */
inline fill_trading_tier_status_message(trading_tier_status_message_record, trading_tier_status_message_value) {
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> trading_tier_status_message_record.exchange_id[trading_tier_status_message_at] = trading_tier_status_message_value; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 5 -> trading_tier_status_message_record.total_number_of_symbols[trading_tier_status_message_at] = trading_tier_status_message_value; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> trading_tier_status_message_record.total_number_of_stock_groups[trading_tier_status_message_at] = trading_tier_status_message_value; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 23 -> trading_tier_status_message_record.trading_system_time_stamp[trading_tier_status_message_at] = trading_tier_status_message_value; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 6 -> trading_tier_status_message_record.trading_tier_id[trading_tier_status_message_at] = trading_tier_status_message_value; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Tier Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_tier_status_message(trading_tier_status_message_record, trading_tier_status_message_base) {
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> trading_tier_status_message_record.exchange_id[trading_tier_status_message_at] = (trading_tier_status_message_base + 0 + trading_tier_status_message_at + 1) % 256; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 5 -> trading_tier_status_message_record.total_number_of_symbols[trading_tier_status_message_at] = (trading_tier_status_message_base + 3 + trading_tier_status_message_at + 1) % 256; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> trading_tier_status_message_record.total_number_of_stock_groups[trading_tier_status_message_at] = (trading_tier_status_message_base + 8 + trading_tier_status_message_at + 1) % 256; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 23 -> trading_tier_status_message_record.trading_system_time_stamp[trading_tier_status_message_at] = (trading_tier_status_message_base + 11 + trading_tier_status_message_at + 1) % 256; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 6 -> trading_tier_status_message_record.trading_tier_id[trading_tier_status_message_at] = (trading_tier_status_message_base + 34 + trading_tier_status_message_at + 1) % 256; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Tier Status Message to the wire, 40 bytes from where the cursor stands */
inline encode_trading_tier_status_message(trading_tier_status_message_record) {
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> wire[at] = trading_tier_status_message_record.exchange_id[trading_tier_status_message_at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 5 -> wire[at] = trading_tier_status_message_record.total_number_of_symbols[trading_tier_status_message_at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> wire[at] = trading_tier_status_message_record.total_number_of_stock_groups[trading_tier_status_message_at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 23 -> wire[at] = trading_tier_status_message_record.trading_system_time_stamp[trading_tier_status_message_at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 6 -> wire[at] = trading_tier_status_message_record.trading_tier_id[trading_tier_status_message_at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Tier Status Message off the wire, 40 bytes from where the cursor stands */
inline decode_trading_tier_status_message(trading_tier_status_message_record) {
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> trading_tier_status_message_record.exchange_id[trading_tier_status_message_at] = wire[at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 5 -> trading_tier_status_message_record.total_number_of_symbols[trading_tier_status_message_at] = wire[at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> trading_tier_status_message_record.total_number_of_stock_groups[trading_tier_status_message_at] = wire[at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 23 -> trading_tier_status_message_record.trading_system_time_stamp[trading_tier_status_message_at] = wire[at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 6 -> trading_tier_status_message_record.trading_tier_id[trading_tier_status_message_at] = wire[at]; at = at + 1; trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Tier Status Message is what was written, byte for byte */
inline equal_trading_tier_status_message(trading_tier_status_message_read, trading_tier_status_message_written) {
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> assert(trading_tier_status_message_read.exchange_id[trading_tier_status_message_at] == trading_tier_status_message_written.exchange_id[trading_tier_status_message_at]); trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 5 -> assert(trading_tier_status_message_read.total_number_of_symbols[trading_tier_status_message_at] == trading_tier_status_message_written.total_number_of_symbols[trading_tier_status_message_at]); trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 3 -> assert(trading_tier_status_message_read.total_number_of_stock_groups[trading_tier_status_message_at] == trading_tier_status_message_written.total_number_of_stock_groups[trading_tier_status_message_at]); trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 23 -> assert(trading_tier_status_message_read.trading_system_time_stamp[trading_tier_status_message_at] == trading_tier_status_message_written.trading_system_time_stamp[trading_tier_status_message_at]); trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  trading_tier_status_message_at = 0;
  do
  :: trading_tier_status_message_at < 6 -> assert(trading_tier_status_message_read.trading_tier_id[trading_tier_status_message_at] == trading_tier_status_message_written.trading_tier_id[trading_tier_status_message_at]); trading_tier_status_message_at = trading_tier_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction Message: 114 bytes ------------------------------------- */

/* Correction of a trade already disseminated. */
typedef TradeCorrectionMessage {
  byte symbol[12];
  byte volume[9];
  byte trade_price[11];
  byte buyer_id[3];
  byte seller_id[3];
  byte trade_time_stamp[6];
  byte last_sale[11];
  byte trade_id[9];
  byte cross_type;
  byte moc;
  byte bypass;
  byte opening_trade;
  byte settlement_terms;
  byte original_trade_id[9];
  byte trading_system_time_stamp[23];
  byte listing_market;
  byte product_type;
  byte trade_date[8];
  byte is_mid_only;
  byte is_dark;
  byte is_conditional
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> trade_correction_message_record.symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.volume[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> trade_correction_message_record.buyer_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> trade_correction_message_record.seller_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.trade_time_stamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.last_sale[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.cross_type = trade_correction_message_value;
  trade_correction_message_record.moc = trade_correction_message_value;
  trade_correction_message_record.bypass = trade_correction_message_value;
  trade_correction_message_record.opening_trade = trade_correction_message_value;
  trade_correction_message_record.settlement_terms = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.listing_market = trade_correction_message_value;
  trade_correction_message_record.product_type = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trade_date[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.is_mid_only = trade_correction_message_value;
  trade_correction_message_record.is_dark = trade_correction_message_value;
  trade_correction_message_record.is_conditional = trade_correction_message_value;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> trade_correction_message_record.symbol[trade_correction_message_at] = (trade_correction_message_base + 0 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.volume[trade_correction_message_at] = (trade_correction_message_base + 12 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.trade_price[trade_correction_message_at] = (trade_correction_message_base + 21 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> trade_correction_message_record.buyer_id[trade_correction_message_at] = (trade_correction_message_base + 32 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> trade_correction_message_record.seller_id[trade_correction_message_at] = (trade_correction_message_base + 35 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.trade_time_stamp[trade_correction_message_at] = (trade_correction_message_base + 38 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.last_sale[trade_correction_message_at] = (trade_correction_message_base + 44 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.trade_id[trade_correction_message_at] = (trade_correction_message_base + 55 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.cross_type = (trade_correction_message_base + 64 + 1) % 256;
  trade_correction_message_record.moc = (trade_correction_message_base + 65 + 1) % 256;
  trade_correction_message_record.bypass = (trade_correction_message_base + 66 + 1) % 256;
  trade_correction_message_record.opening_trade = (trade_correction_message_base + 67 + 1) % 256;
  trade_correction_message_record.settlement_terms = (trade_correction_message_base + 68 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = (trade_correction_message_base + 69 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at] = (trade_correction_message_base + 78 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.listing_market = (trade_correction_message_base + 101 + 1) % 256;
  trade_correction_message_record.product_type = (trade_correction_message_base + 102 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trade_date[trade_correction_message_at] = (trade_correction_message_base + 103 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.is_mid_only = (trade_correction_message_base + 111 + 1) % 256;
  trade_correction_message_record.is_dark = (trade_correction_message_base + 112 + 1) % 256;
  trade_correction_message_record.is_conditional = (trade_correction_message_base + 113 + 1) % 256;
  skip
}

/* Trade Correction Message to the wire, 114 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> wire[at] = trade_correction_message_record.symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> wire[at] = trade_correction_message_record.volume[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> wire[at] = trade_correction_message_record.trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> wire[at] = trade_correction_message_record.buyer_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> wire[at] = trade_correction_message_record.seller_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> wire[at] = trade_correction_message_record.trade_time_stamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> wire[at] = trade_correction_message_record.last_sale[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> wire[at] = trade_correction_message_record.trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.cross_type; at = at + 1;
  wire[at] = trade_correction_message_record.moc; at = at + 1;
  wire[at] = trade_correction_message_record.bypass; at = at + 1;
  wire[at] = trade_correction_message_record.opening_trade; at = at + 1;
  wire[at] = trade_correction_message_record.settlement_terms; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> wire[at] = trade_correction_message_record.original_trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> wire[at] = trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.listing_market; at = at + 1;
  wire[at] = trade_correction_message_record.product_type; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.trade_date[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.is_mid_only; at = at + 1;
  wire[at] = trade_correction_message_record.is_dark; at = at + 1;
  wire[at] = trade_correction_message_record.is_conditional; at = at + 1;
  skip
}

/* Trade Correction Message off the wire, 114 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> trade_correction_message_record.symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.volume[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> trade_correction_message_record.buyer_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> trade_correction_message_record.seller_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.trade_time_stamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.last_sale[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.cross_type = wire[at]; at = at + 1;
  trade_correction_message_record.moc = wire[at]; at = at + 1;
  trade_correction_message_record.bypass = wire[at]; at = at + 1;
  trade_correction_message_record.opening_trade = wire[at]; at = at + 1;
  trade_correction_message_record.settlement_terms = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.listing_market = wire[at]; at = at + 1;
  trade_correction_message_record.product_type = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trade_date[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.is_mid_only = wire[at]; at = at + 1;
  trade_correction_message_record.is_dark = wire[at]; at = at + 1;
  trade_correction_message_record.is_conditional = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> assert(trade_correction_message_read.symbol[trade_correction_message_at] == trade_correction_message_written.symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> assert(trade_correction_message_read.volume[trade_correction_message_at] == trade_correction_message_written.volume[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> assert(trade_correction_message_read.trade_price[trade_correction_message_at] == trade_correction_message_written.trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> assert(trade_correction_message_read.buyer_id[trade_correction_message_at] == trade_correction_message_written.buyer_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 3 -> assert(trade_correction_message_read.seller_id[trade_correction_message_at] == trade_correction_message_written.seller_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> assert(trade_correction_message_read.trade_time_stamp[trade_correction_message_at] == trade_correction_message_written.trade_time_stamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> assert(trade_correction_message_read.last_sale[trade_correction_message_at] == trade_correction_message_written.last_sale[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> assert(trade_correction_message_read.trade_id[trade_correction_message_at] == trade_correction_message_written.trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.cross_type == trade_correction_message_written.cross_type);
  assert(trade_correction_message_read.moc == trade_correction_message_written.moc);
  assert(trade_correction_message_read.bypass == trade_correction_message_written.bypass);
  assert(trade_correction_message_read.opening_trade == trade_correction_message_written.opening_trade);
  assert(trade_correction_message_read.settlement_terms == trade_correction_message_written.settlement_terms);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> assert(trade_correction_message_read.original_trade_id[trade_correction_message_at] == trade_correction_message_written.original_trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> assert(trade_correction_message_read.trading_system_time_stamp[trade_correction_message_at] == trade_correction_message_written.trading_system_time_stamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.listing_market == trade_correction_message_written.listing_market);
  assert(trade_correction_message_read.product_type == trade_correction_message_written.product_type);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.trade_date[trade_correction_message_at] == trade_correction_message_written.trade_date[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.is_mid_only == trade_correction_message_written.is_mid_only);
  assert(trade_correction_message_read.is_dark == trade_correction_message_written.is_dark);
  assert(trade_correction_message_read.is_conditional == trade_correction_message_written.is_conditional);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 105);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 105);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Symbol Status Message: encoded, read back, and compared */
proctype check_symbol_status_message() {
  SymbolStatusMessage symbol_status_message_sent;
  SymbolStatusMessage symbol_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_status_message(symbol_status_message_sent, 0)
  :: pattern == 1 -> fill_symbol_status_message(symbol_status_message_sent, 32)
  :: pattern == 2 -> fill_symbol_status_message(symbol_status_message_sent, 255)
  :: else -> ramp_symbol_status_message(symbol_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_status_message(symbol_status_message_sent);
    assert(at == 164);
    at = 0;
    decode_symbol_status_message(symbol_status_message_got);
    assert(at == 164);
    equal_symbol_status_message(symbol_status_message_got, symbol_status_message_sent)
  }
}

/* Moc Imbalance Notification Message: encoded, read back, and compared */
proctype check_moc_imbalance_notification_message() {
  MocImbalanceNotificationMessage moc_imbalance_notification_message_sent;
  MocImbalanceNotificationMessage moc_imbalance_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_moc_imbalance_notification_message(moc_imbalance_notification_message_sent, 0)
  :: pattern == 1 -> fill_moc_imbalance_notification_message(moc_imbalance_notification_message_sent, 32)
  :: pattern == 2 -> fill_moc_imbalance_notification_message(moc_imbalance_notification_message_sent, 255)
  :: else -> ramp_moc_imbalance_notification_message(moc_imbalance_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_moc_imbalance_notification_message(moc_imbalance_notification_message_sent);
    assert(at == 102);
    at = 0;
    decode_moc_imbalance_notification_message(moc_imbalance_notification_message_got);
    assert(at == 102);
    equal_moc_imbalance_notification_message(moc_imbalance_notification_message_got, moc_imbalance_notification_message_sent)
  }
}

/* Moc Price Movement Delay Message: encoded, read back, and compared */
proctype check_moc_price_movement_delay_message() {
  MocPriceMovementDelayMessage moc_price_movement_delay_message_sent;
  MocPriceMovementDelayMessage moc_price_movement_delay_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_moc_price_movement_delay_message(moc_price_movement_delay_message_sent, 0)
  :: pattern == 1 -> fill_moc_price_movement_delay_message(moc_price_movement_delay_message_sent, 32)
  :: pattern == 2 -> fill_moc_price_movement_delay_message(moc_price_movement_delay_message_sent, 255)
  :: else -> ramp_moc_price_movement_delay_message(moc_price_movement_delay_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_moc_price_movement_delay_message(moc_price_movement_delay_message_sent);
    assert(at == 59);
    at = 0;
    decode_moc_price_movement_delay_message(moc_price_movement_delay_message_got);
    assert(at == 59);
    equal_moc_price_movement_delay_message(moc_price_movement_delay_message_got, moc_price_movement_delay_message_sent)
  }
}

/* Stock State Message: encoded, read back, and compared */
proctype check_stock_state_message() {
  StockStateMessage stock_state_message_sent;
  StockStateMessage stock_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_state_message(stock_state_message_sent, 0)
  :: pattern == 1 -> fill_stock_state_message(stock_state_message_sent, 32)
  :: pattern == 2 -> fill_stock_state_message(stock_state_message_sent, 255)
  :: else -> ramp_stock_state_message(stock_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_state_message(stock_state_message_sent);
    assert(at == 85);
    at = 0;
    decode_stock_state_message(stock_state_message_got);
    assert(at == 85);
    equal_stock_state_message(stock_state_message_got, stock_state_message_sent)
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
    assert(at == 71);
    at = 0;
    decode_quote_message(quote_message_got);
    assert(at == 71);
    equal_quote_message(quote_message_got, quote_message_sent)
  }
}

/* General Message: encoded, read back, and compared */
proctype check_general_message() {
  GeneralMessage general_message_sent;
  GeneralMessage general_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_general_message(general_message_sent, 0)
  :: pattern == 1 -> fill_general_message(general_message_sent, 32)
  :: pattern == 2 -> fill_general_message(general_message_sent, 255)
  :: else -> ramp_general_message(general_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_general_message(general_message_sent);
    assert(at == 104);
    at = 0;
    decode_general_message(general_message_got);
    assert(at == 104);
    equal_general_message(general_message_got, general_message_sent)
  }
}

/* Trade Cancellation Message: encoded, read back, and compared */
proctype check_trade_cancellation_message() {
  TradeCancellationMessage trade_cancellation_message_sent;
  TradeCancellationMessage trade_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 255)
  :: else -> ramp_trade_cancellation_message(trade_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancellation_message(trade_cancellation_message_sent);
    assert(at == 97);
    at = 0;
    decode_trade_cancellation_message(trade_cancellation_message_got);
    assert(at == 97);
    equal_trade_cancellation_message(trade_cancellation_message_got, trade_cancellation_message_sent)
  }
}

/* Indicative Price Message: encoded, read back, and compared */
proctype check_indicative_price_message() {
  IndicativePriceMessage indicative_price_message_sent;
  IndicativePriceMessage indicative_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_price_message(indicative_price_message_sent, 0)
  :: pattern == 1 -> fill_indicative_price_message(indicative_price_message_sent, 32)
  :: pattern == 2 -> fill_indicative_price_message(indicative_price_message_sent, 255)
  :: else -> ramp_indicative_price_message(indicative_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_price_message(indicative_price_message_sent);
    assert(at == 44);
    at = 0;
    decode_indicative_price_message(indicative_price_message_got);
    assert(at == 44);
    equal_indicative_price_message(indicative_price_message_got, indicative_price_message_sent)
  }
}

/* Calculated Opening Price Message: encoded, read back, and compared */
proctype check_calculated_opening_price_message() {
  CalculatedOpeningPriceMessage calculated_opening_price_message_sent;
  CalculatedOpeningPriceMessage calculated_opening_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_calculated_opening_price_message(calculated_opening_price_message_sent, 0)
  :: pattern == 1 -> fill_calculated_opening_price_message(calculated_opening_price_message_sent, 32)
  :: pattern == 2 -> fill_calculated_opening_price_message(calculated_opening_price_message_sent, 255)
  :: else -> ramp_calculated_opening_price_message(calculated_opening_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_calculated_opening_price_message(calculated_opening_price_message_sent);
    assert(at == 59);
    at = 0;
    decode_calculated_opening_price_message(calculated_opening_price_message_got);
    assert(at == 59);
    equal_calculated_opening_price_message(calculated_opening_price_message_got, calculated_opening_price_message_sent)
  }
}

/* Tsx Tsxv Closing Price Message: encoded, read back, and compared */
proctype check_tsx_tsxv_closing_price_message() {
  TsxTsxvClosingPriceMessage tsx_tsxv_closing_price_message_sent;
  TsxTsxvClosingPriceMessage tsx_tsxv_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_sent, 255)
  :: else -> ramp_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_sent);
    assert(at == 61);
    at = 0;
    decode_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_got);
    assert(at == 61);
    equal_tsx_tsxv_closing_price_message(tsx_tsxv_closing_price_message_got, tsx_tsxv_closing_price_message_sent)
  }
}

/* Market State Message: encoded, read back, and compared */
proctype check_market_state_message() {
  MarketStateMessage market_state_message_sent;
  MarketStateMessage market_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_state_message(market_state_message_sent, 0)
  :: pattern == 1 -> fill_market_state_message(market_state_message_sent, 32)
  :: pattern == 2 -> fill_market_state_message(market_state_message_sent, 255)
  :: else -> ramp_market_state_message(market_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_state_message(market_state_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_state_message(market_state_message_got);
    assert(at == 26);
    equal_market_state_message(market_state_message_got, market_state_message_sent)
  }
}

/* Trading Tier Status Message: encoded, read back, and compared */
proctype check_trading_tier_status_message() {
  TradingTierStatusMessage trading_tier_status_message_sent;
  TradingTierStatusMessage trading_tier_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_tier_status_message(trading_tier_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_tier_status_message(trading_tier_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_tier_status_message(trading_tier_status_message_sent, 255)
  :: else -> ramp_trading_tier_status_message(trading_tier_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_tier_status_message(trading_tier_status_message_sent);
    assert(at == 40);
    at = 0;
    decode_trading_tier_status_message(trading_tier_status_message_got);
    assert(at == 40);
    equal_trading_tier_status_message(trading_tier_status_message_got, trading_tier_status_message_sent)
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
    assert(at == 114);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 114);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_trade_message()
  :: run check_symbol_status_message()
  :: run check_moc_imbalance_notification_message()
  :: run check_moc_price_movement_delay_message()
  :: run check_stock_state_message()
  :: run check_quote_message()
  :: run check_general_message()
  :: run check_trade_cancellation_message()
  :: run check_indicative_price_message()
  :: run check_calculated_opening_price_message()
  :: run check_tsx_tsxv_closing_price_message()
  :: run check_market_state_message()
  :: run check_trading_tier_status_message()
  :: run check_trade_correction_message()
  fi
}
