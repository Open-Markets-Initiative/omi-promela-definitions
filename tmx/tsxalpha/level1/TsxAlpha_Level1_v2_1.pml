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
#define WIRE 136

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

/* ---- Trade Message: 92 bytes ------------------------------------------------- */

/* A trade in an equity on the Alpha market. */
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
  byte bypass;
  byte opening_trade;
  byte settlement_terms;
  byte is_dark;
  byte trading_system_time_stamp[23]
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
  trade_message_record.bypass = trade_message_value;
  trade_message_record.opening_trade = trade_message_value;
  trade_message_record.settlement_terms = trade_message_value;
  trade_message_record.is_dark = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> trade_message_record.trading_system_time_stamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
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
  trade_message_record.bypass = (trade_message_base + 65 + 1) % 256;
  trade_message_record.opening_trade = (trade_message_base + 66 + 1) % 256;
  trade_message_record.settlement_terms = (trade_message_base + 67 + 1) % 256;
  trade_message_record.is_dark = (trade_message_base + 68 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> trade_message_record.trading_system_time_stamp[trade_message_at] = (trade_message_base + 69 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 92 bytes from where the cursor stands */
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
  wire[at] = trade_message_record.bypass; at = at + 1;
  wire[at] = trade_message_record.opening_trade; at = at + 1;
  wire[at] = trade_message_record.settlement_terms; at = at + 1;
  wire[at] = trade_message_record.is_dark; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> wire[at] = trade_message_record.trading_system_time_stamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 92 bytes from where the cursor stands */
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
  trade_message_record.bypass = wire[at]; at = at + 1;
  trade_message_record.opening_trade = wire[at]; at = at + 1;
  trade_message_record.settlement_terms = wire[at]; at = at + 1;
  trade_message_record.is_dark = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> trade_message_record.trading_system_time_stamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
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
  assert(trade_message_read.bypass == trade_message_written.bypass);
  assert(trade_message_read.opening_trade == trade_message_written.opening_trade);
  assert(trade_message_read.settlement_terms == trade_message_written.settlement_terms);
  assert(trade_message_read.is_dark == trade_message_written.is_dark);
  trade_message_at = 0;
  do
  :: trade_message_at < 23 -> assert(trade_message_read.trading_system_time_stamp[trade_message_at] == trade_message_written.trading_system_time_stamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Status Message: 136 bytes ---------------------------------------- */

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
  byte product_type;
  byte symbol_name[40];
  byte stock_group[2];
  byte stock_state[2];
  byte listing_market;
  byte min_po_qty[9];
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
  :: symbol_status_message_at < 9 -> symbol_status_message_record.min_po_qty[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
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
  symbol_status_message_record.product_type = (symbol_status_message_base + 80 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 40 -> symbol_status_message_record.symbol_name[symbol_status_message_at] = (symbol_status_message_base + 81 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_group[symbol_status_message_at] = (symbol_status_message_base + 121 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = (symbol_status_message_base + 123 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.listing_market = (symbol_status_message_base + 125 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 9 -> symbol_status_message_record.min_po_qty[symbol_status_message_at] = (symbol_status_message_base + 126 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = (symbol_status_message_base + 135 + 1) % 256;
  skip
}

/* Symbol Status Message to the wire, 136 bytes from where the cursor stands */
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
  :: symbol_status_message_at < 9 -> wire[at] = symbol_status_message_record.min_po_qty[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.test_symbol; at = at + 1;
  skip
}

/* Symbol Status Message off the wire, 136 bytes from where the cursor stands */
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
  :: symbol_status_message_at < 9 -> symbol_status_message_record.min_po_qty[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
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
  :: symbol_status_message_at < 9 -> assert(symbol_status_message_read.min_po_qty[symbol_status_message_at] == symbol_status_message_written.min_po_qty[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.test_symbol == symbol_status_message_written.test_symbol);
  skip
}

/* ---- Stock State Message: 83 bytes ------------------------------------------- */

/* A change in the trading state of a stock. */
typedef StockStateMessage {
  byte symbol[12];
  byte trading_system_time_stamp[23];
  byte comment[40];
  byte stock_state[2];
  byte opening_time[6]
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
  skip
}

/* Stock State Message to the wire, 83 bytes from where the cursor stands */
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
  skip
}

/* Stock State Message off the wire, 83 bytes from where the cursor stands */
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

/* ---- Trade Cancellation Message: 87 bytes ------------------------------------ */

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
  byte trading_system_time_stamp[23]
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
  skip
}

/* Trade Cancellation Message to the wire, 87 bytes from where the cursor stands */
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
  skip
}

/* Trade Cancellation Message off the wire, 87 bytes from where the cursor stands */
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

/* ---- Trade Correction Message: 101 bytes ------------------------------------- */

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
  byte bypass;
  byte opening_trade;
  byte settlement_terms;
  byte original_trade_id[9];
  byte is_dark;
  byte trading_system_time_stamp[23]
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
  trade_correction_message_record.bypass = trade_correction_message_value;
  trade_correction_message_record.opening_trade = trade_correction_message_value;
  trade_correction_message_record.settlement_terms = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.is_dark = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
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
  trade_correction_message_record.bypass = (trade_correction_message_base + 65 + 1) % 256;
  trade_correction_message_record.opening_trade = (trade_correction_message_base + 66 + 1) % 256;
  trade_correction_message_record.settlement_terms = (trade_correction_message_base + 67 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = (trade_correction_message_base + 68 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.is_dark = (trade_correction_message_base + 77 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at] = (trade_correction_message_base + 78 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message to the wire, 101 bytes from where the cursor stands */
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
  wire[at] = trade_correction_message_record.bypass; at = at + 1;
  wire[at] = trade_correction_message_record.opening_trade; at = at + 1;
  wire[at] = trade_correction_message_record.settlement_terms; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> wire[at] = trade_correction_message_record.original_trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.is_dark; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> wire[at] = trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message off the wire, 101 bytes from where the cursor stands */
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
  trade_correction_message_record.bypass = wire[at]; at = at + 1;
  trade_correction_message_record.opening_trade = wire[at]; at = at + 1;
  trade_correction_message_record.settlement_terms = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.is_dark = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
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
  assert(trade_correction_message_read.bypass == trade_correction_message_written.bypass);
  assert(trade_correction_message_read.opening_trade == trade_correction_message_written.opening_trade);
  assert(trade_correction_message_read.settlement_terms == trade_correction_message_written.settlement_terms);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> assert(trade_correction_message_read.original_trade_id[trade_correction_message_at] == trade_correction_message_written.original_trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.is_dark == trade_correction_message_written.is_dark);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 23 -> assert(trade_correction_message_read.trading_system_time_stamp[trade_correction_message_at] == trade_correction_message_written.trading_system_time_stamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
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
    assert(at == 92);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 92);
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
    assert(at == 136);
    at = 0;
    decode_symbol_status_message(symbol_status_message_got);
    assert(at == 136);
    equal_symbol_status_message(symbol_status_message_got, symbol_status_message_sent)
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
    assert(at == 83);
    at = 0;
    decode_stock_state_message(stock_state_message_got);
    assert(at == 83);
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
    assert(at == 87);
    at = 0;
    decode_trade_cancellation_message(trade_cancellation_message_got);
    assert(at == 87);
    equal_trade_cancellation_message(trade_cancellation_message_got, trade_cancellation_message_sent)
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
    assert(at == 101);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 101);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_trade_message()
  :: run check_symbol_status_message()
  :: run check_stock_state_message()
  :: run check_quote_message()
  :: run check_general_message()
  :: run check_trade_cancellation_message()
  :: run check_market_state_message()
  :: run check_trading_tier_status_message()
  :: run check_trade_correction_message()
  fi
}
