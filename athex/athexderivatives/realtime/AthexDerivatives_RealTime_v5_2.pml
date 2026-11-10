/*
 * Athens Exchange Group Athens Exchange Derivatives Market Real Time Channel
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
 *   - a field filling what is left of what holds it
 *   - a run counted by a field
 *   - a length prefix framing what follows
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

/* ---- Message Header: 35 bytes ------------------------------------------------ */

/* Thirty five character header succeeding the Soh character of every message packet */
typedef MessageHeader {
  byte vendor_identifier[2];
  byte message_category;
  byte message_subcategory;
  byte venue_i_d[4];
  byte message_sequence_number[7];
  byte publication_timestamp[20]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.vendor_identifier[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_category = message_header_value;
  message_header_record.message_subcategory = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.venue_i_d[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 7 -> message_header_record.message_sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 20 -> message_header_record.publication_timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.vendor_identifier[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_category = (message_header_base + 2 + 1) % 256;
  message_header_record.message_subcategory = (message_header_base + 3 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.venue_i_d[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 7 -> message_header_record.message_sequence_number[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 20 -> message_header_record.publication_timestamp[message_header_at] = (message_header_base + 15 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 35 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.vendor_identifier[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_category; at = at + 1;
  wire[at] = message_header_record.message_subcategory; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.venue_i_d[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 7 -> wire[at] = message_header_record.message_sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 20 -> wire[at] = message_header_record.publication_timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 35 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.vendor_identifier[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_category = wire[at]; at = at + 1;
  message_header_record.message_subcategory = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.venue_i_d[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 7 -> message_header_record.message_sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 20 -> message_header_record.publication_timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.vendor_identifier[message_header_at] == message_header_written.vendor_identifier[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_category == message_header_written.message_category);
  assert(message_header_read.message_subcategory == message_header_written.message_subcategory);
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.venue_i_d[message_header_at] == message_header_written.venue_i_d[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 7 -> assert(message_header_read.message_sequence_number[message_header_at] == message_header_written.message_sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 20 -> assert(message_header_read.publication_timestamp[message_header_at] == message_header_written.publication_timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 147 bytes ------------------------------------------------ */

/* Transmitted when an instrument trade occurs in the trading platform or the clearing system */
typedef TradeMessage {
  byte symbol[15];
  byte board_id;
  byte trade_number[6];
  byte buy_order_number[8];
  byte buy_order_date[8];
  byte sell_order_number[8];
  byte sell_order_date[8];
  byte price[9];
  byte volume[17];
  byte total_volume[17];
  byte trade_type;
  byte trade_source;
  byte buy_order_type;
  byte sell_order_type;
  byte buy_waiver_indicator[4];
  byte sell_waiver_indicator[4];
  byte notional_amount[14];
  byte buy_algo_flag;
  byte sell_algo_flag;
  byte sdiv_flag;
  byte dupl_flag;
  byte time_stamp[20]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 15 -> trade_message_record.symbol[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.board_id = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.trade_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.buy_order_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.buy_order_date[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.sell_order_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.sell_order_date[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> trade_message_record.volume[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> trade_message_record.total_volume[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_type = trade_message_value;
  trade_message_record.trade_source = trade_message_value;
  trade_message_record.buy_order_type = trade_message_value;
  trade_message_record.sell_order_type = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.buy_waiver_indicator[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.sell_waiver_indicator[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> trade_message_record.notional_amount[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.buy_algo_flag = trade_message_value;
  trade_message_record.sell_algo_flag = trade_message_value;
  trade_message_record.sdiv_flag = trade_message_value;
  trade_message_record.dupl_flag = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 20 -> trade_message_record.time_stamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 15 -> trade_message_record.symbol[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.board_id = (trade_message_base + 15 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.trade_number[trade_message_at] = (trade_message_base + 16 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.buy_order_number[trade_message_at] = (trade_message_base + 22 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.buy_order_date[trade_message_at] = (trade_message_base + 30 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.sell_order_number[trade_message_at] = (trade_message_base + 38 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.sell_order_date[trade_message_at] = (trade_message_base + 46 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.price[trade_message_at] = (trade_message_base + 54 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> trade_message_record.volume[trade_message_at] = (trade_message_base + 63 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> trade_message_record.total_volume[trade_message_at] = (trade_message_base + 80 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_type = (trade_message_base + 97 + 1) % 256;
  trade_message_record.trade_source = (trade_message_base + 98 + 1) % 256;
  trade_message_record.buy_order_type = (trade_message_base + 99 + 1) % 256;
  trade_message_record.sell_order_type = (trade_message_base + 100 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.buy_waiver_indicator[trade_message_at] = (trade_message_base + 101 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.sell_waiver_indicator[trade_message_at] = (trade_message_base + 105 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> trade_message_record.notional_amount[trade_message_at] = (trade_message_base + 109 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.buy_algo_flag = (trade_message_base + 123 + 1) % 256;
  trade_message_record.sell_algo_flag = (trade_message_base + 124 + 1) % 256;
  trade_message_record.sdiv_flag = (trade_message_base + 125 + 1) % 256;
  trade_message_record.dupl_flag = (trade_message_base + 126 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 20 -> trade_message_record.time_stamp[trade_message_at] = (trade_message_base + 127 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 147 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 15 -> wire[at] = trade_message_record.symbol[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.board_id; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> wire[at] = trade_message_record.trade_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.buy_order_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.buy_order_date[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.sell_order_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.sell_order_date[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> wire[at] = trade_message_record.volume[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> wire[at] = trade_message_record.total_volume[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_type; at = at + 1;
  wire[at] = trade_message_record.trade_source; at = at + 1;
  wire[at] = trade_message_record.buy_order_type; at = at + 1;
  wire[at] = trade_message_record.sell_order_type; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.buy_waiver_indicator[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.sell_waiver_indicator[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> wire[at] = trade_message_record.notional_amount[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.buy_algo_flag; at = at + 1;
  wire[at] = trade_message_record.sell_algo_flag; at = at + 1;
  wire[at] = trade_message_record.sdiv_flag; at = at + 1;
  wire[at] = trade_message_record.dupl_flag; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 20 -> wire[at] = trade_message_record.time_stamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 147 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 15 -> trade_message_record.symbol[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.board_id = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.trade_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.buy_order_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.buy_order_date[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.sell_order_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.sell_order_date[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> trade_message_record.volume[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> trade_message_record.total_volume[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_type = wire[at]; at = at + 1;
  trade_message_record.trade_source = wire[at]; at = at + 1;
  trade_message_record.buy_order_type = wire[at]; at = at + 1;
  trade_message_record.sell_order_type = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.buy_waiver_indicator[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.sell_waiver_indicator[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> trade_message_record.notional_amount[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.buy_algo_flag = wire[at]; at = at + 1;
  trade_message_record.sell_algo_flag = wire[at]; at = at + 1;
  trade_message_record.sdiv_flag = wire[at]; at = at + 1;
  trade_message_record.dupl_flag = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 20 -> trade_message_record.time_stamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 15 -> assert(trade_message_read.symbol[trade_message_at] == trade_message_written.symbol[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.board_id == trade_message_written.board_id);
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> assert(trade_message_read.trade_number[trade_message_at] == trade_message_written.trade_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.buy_order_number[trade_message_at] == trade_message_written.buy_order_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.buy_order_date[trade_message_at] == trade_message_written.buy_order_date[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.sell_order_number[trade_message_at] == trade_message_written.sell_order_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.sell_order_date[trade_message_at] == trade_message_written.sell_order_date[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> assert(trade_message_read.volume[trade_message_at] == trade_message_written.volume[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 17 -> assert(trade_message_read.total_volume[trade_message_at] == trade_message_written.total_volume[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_type == trade_message_written.trade_type);
  assert(trade_message_read.trade_source == trade_message_written.trade_source);
  assert(trade_message_read.buy_order_type == trade_message_written.buy_order_type);
  assert(trade_message_read.sell_order_type == trade_message_written.sell_order_type);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.buy_waiver_indicator[trade_message_at] == trade_message_written.buy_waiver_indicator[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.sell_waiver_indicator[trade_message_at] == trade_message_written.sell_waiver_indicator[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> assert(trade_message_read.notional_amount[trade_message_at] == trade_message_written.notional_amount[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.buy_algo_flag == trade_message_written.buy_algo_flag);
  assert(trade_message_read.sell_algo_flag == trade_message_written.sell_algo_flag);
  assert(trade_message_read.sdiv_flag == trade_message_written.sdiv_flag);
  assert(trade_message_read.dupl_flag == trade_message_written.dupl_flag);
  trade_message_at = 0;
  do
  :: trade_message_at < 20 -> assert(trade_message_read.time_stamp[trade_message_at] == trade_message_written.time_stamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Message: 24 bytes ------------------------------------------------- */

/* Transmitted every time the trading platform calculates the price of a given index */
typedef IndexMessage {
  byte symbol[15];
  byte index_price[9]
};

int index_message_at;

/* every byte of Index Message set to one value */
inline fill_index_message(index_message_record, index_message_value) {
  index_message_at = 0;
  do
  :: index_message_at < 15 -> index_message_record.symbol[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 9 -> index_message_record.index_price[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Message set to where it lies, so a field read out of place says so */
inline ramp_index_message(index_message_record, index_message_base) {
  index_message_at = 0;
  do
  :: index_message_at < 15 -> index_message_record.symbol[index_message_at] = (index_message_base + 0 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 9 -> index_message_record.index_price[index_message_at] = (index_message_base + 15 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Message to the wire, 24 bytes from where the cursor stands */
inline encode_index_message(index_message_record) {
  index_message_at = 0;
  do
  :: index_message_at < 15 -> wire[at] = index_message_record.symbol[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 9 -> wire[at] = index_message_record.index_price[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Message off the wire, 24 bytes from where the cursor stands */
inline decode_index_message(index_message_record) {
  index_message_at = 0;
  do
  :: index_message_at < 15 -> index_message_record.symbol[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 9 -> index_message_record.index_price[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Message is what was written, byte for byte */
inline equal_index_message(index_message_read, index_message_written) {
  index_message_at = 0;
  do
  :: index_message_at < 15 -> assert(index_message_read.symbol[index_message_at] == index_message_written.symbol[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 9 -> assert(index_message_read.index_price[index_message_at] == index_message_written.index_price[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Summary Message: 103 bytes ----------------------------------- */

/* Transmitted for each instrument right after the corresponding market status changes to End of Day */
typedef InstrumentSummaryMessage {
  byte symbol[15];
  byte opening_price[9];
  byte high[9];
  byte low[9];
  byte last[9];
  byte closing_price[9];
  byte start_of_day_price[9];
  byte total_volume[17];
  byte total_value[17]
};

int instrument_summary_message_at;

/* every byte of Instrument Summary Message set to one value */
inline fill_instrument_summary_message(instrument_summary_message_record, instrument_summary_message_value) {
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 15 -> instrument_summary_message_record.symbol[instrument_summary_message_at] = instrument_summary_message_value; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.opening_price[instrument_summary_message_at] = instrument_summary_message_value; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.high[instrument_summary_message_at] = instrument_summary_message_value; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.low[instrument_summary_message_at] = instrument_summary_message_value; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.last[instrument_summary_message_at] = instrument_summary_message_value; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.closing_price[instrument_summary_message_at] = instrument_summary_message_value; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.start_of_day_price[instrument_summary_message_at] = instrument_summary_message_value; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> instrument_summary_message_record.total_volume[instrument_summary_message_at] = instrument_summary_message_value; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> instrument_summary_message_record.total_value[instrument_summary_message_at] = instrument_summary_message_value; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Summary Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_summary_message(instrument_summary_message_record, instrument_summary_message_base) {
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 15 -> instrument_summary_message_record.symbol[instrument_summary_message_at] = (instrument_summary_message_base + 0 + instrument_summary_message_at + 1) % 256; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.opening_price[instrument_summary_message_at] = (instrument_summary_message_base + 15 + instrument_summary_message_at + 1) % 256; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.high[instrument_summary_message_at] = (instrument_summary_message_base + 24 + instrument_summary_message_at + 1) % 256; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.low[instrument_summary_message_at] = (instrument_summary_message_base + 33 + instrument_summary_message_at + 1) % 256; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.last[instrument_summary_message_at] = (instrument_summary_message_base + 42 + instrument_summary_message_at + 1) % 256; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.closing_price[instrument_summary_message_at] = (instrument_summary_message_base + 51 + instrument_summary_message_at + 1) % 256; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.start_of_day_price[instrument_summary_message_at] = (instrument_summary_message_base + 60 + instrument_summary_message_at + 1) % 256; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> instrument_summary_message_record.total_volume[instrument_summary_message_at] = (instrument_summary_message_base + 69 + instrument_summary_message_at + 1) % 256; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> instrument_summary_message_record.total_value[instrument_summary_message_at] = (instrument_summary_message_base + 86 + instrument_summary_message_at + 1) % 256; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Summary Message to the wire, 103 bytes from where the cursor stands */
inline encode_instrument_summary_message(instrument_summary_message_record) {
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 15 -> wire[at] = instrument_summary_message_record.symbol[instrument_summary_message_at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> wire[at] = instrument_summary_message_record.opening_price[instrument_summary_message_at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> wire[at] = instrument_summary_message_record.high[instrument_summary_message_at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> wire[at] = instrument_summary_message_record.low[instrument_summary_message_at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> wire[at] = instrument_summary_message_record.last[instrument_summary_message_at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> wire[at] = instrument_summary_message_record.closing_price[instrument_summary_message_at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> wire[at] = instrument_summary_message_record.start_of_day_price[instrument_summary_message_at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> wire[at] = instrument_summary_message_record.total_volume[instrument_summary_message_at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> wire[at] = instrument_summary_message_record.total_value[instrument_summary_message_at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Summary Message off the wire, 103 bytes from where the cursor stands */
inline decode_instrument_summary_message(instrument_summary_message_record) {
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 15 -> instrument_summary_message_record.symbol[instrument_summary_message_at] = wire[at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.opening_price[instrument_summary_message_at] = wire[at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.high[instrument_summary_message_at] = wire[at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.low[instrument_summary_message_at] = wire[at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.last[instrument_summary_message_at] = wire[at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.closing_price[instrument_summary_message_at] = wire[at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> instrument_summary_message_record.start_of_day_price[instrument_summary_message_at] = wire[at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> instrument_summary_message_record.total_volume[instrument_summary_message_at] = wire[at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> instrument_summary_message_record.total_value[instrument_summary_message_at] = wire[at]; at = at + 1; instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Summary Message is what was written, byte for byte */
inline equal_instrument_summary_message(instrument_summary_message_read, instrument_summary_message_written) {
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 15 -> assert(instrument_summary_message_read.symbol[instrument_summary_message_at] == instrument_summary_message_written.symbol[instrument_summary_message_at]); instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> assert(instrument_summary_message_read.opening_price[instrument_summary_message_at] == instrument_summary_message_written.opening_price[instrument_summary_message_at]); instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> assert(instrument_summary_message_read.high[instrument_summary_message_at] == instrument_summary_message_written.high[instrument_summary_message_at]); instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> assert(instrument_summary_message_read.low[instrument_summary_message_at] == instrument_summary_message_written.low[instrument_summary_message_at]); instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> assert(instrument_summary_message_read.last[instrument_summary_message_at] == instrument_summary_message_written.last[instrument_summary_message_at]); instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> assert(instrument_summary_message_read.closing_price[instrument_summary_message_at] == instrument_summary_message_written.closing_price[instrument_summary_message_at]); instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 9 -> assert(instrument_summary_message_read.start_of_day_price[instrument_summary_message_at] == instrument_summary_message_written.start_of_day_price[instrument_summary_message_at]); instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> assert(instrument_summary_message_read.total_volume[instrument_summary_message_at] == instrument_summary_message_written.total_volume[instrument_summary_message_at]); instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  instrument_summary_message_at = 0;
  do
  :: instrument_summary_message_at < 17 -> assert(instrument_summary_message_read.total_value[instrument_summary_message_at] == instrument_summary_message_written.total_value[instrument_summary_message_at]); instrument_summary_message_at = instrument_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancelled Trade Message: 147 bytes -------------------------------------- */

/* Transmitted when an instrument trade cancellation occurs in the trading platform or clearing system */
typedef CancelledTradeMessage {
  byte symbol[15];
  byte board_id;
  byte trade_number[6];
  byte buy_order_number[8];
  byte buy_order_date[8];
  byte sell_order_number[8];
  byte sell_order_date[8];
  byte cancelled_trade_price[9];
  byte cancelled_volume[17];
  byte total_volume[17];
  byte trade_type;
  byte trade_source;
  byte buy_order_type;
  byte sell_order_type;
  byte buy_waiver_indicator[4];
  byte sell_waiver_indicator[4];
  byte notional_amount[14];
  byte buy_algo_flag;
  byte sell_algo_flag;
  byte sdiv_flag;
  byte dupl_flag;
  byte time_stamp[20]
};

int cancelled_trade_message_at;

/* every byte of Cancelled Trade Message set to one value */
inline fill_cancelled_trade_message(cancelled_trade_message_record, cancelled_trade_message_value) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 15 -> cancelled_trade_message_record.symbol[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.board_id = cancelled_trade_message_value;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 6 -> cancelled_trade_message_record.trade_number[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.buy_order_number[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.buy_order_date[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.sell_order_number[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.sell_order_date[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 9 -> cancelled_trade_message_record.cancelled_trade_price[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> cancelled_trade_message_record.cancelled_volume[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> cancelled_trade_message_record.total_volume[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.trade_type = cancelled_trade_message_value;
  cancelled_trade_message_record.trade_source = cancelled_trade_message_value;
  cancelled_trade_message_record.buy_order_type = cancelled_trade_message_value;
  cancelled_trade_message_record.sell_order_type = cancelled_trade_message_value;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.buy_waiver_indicator[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.sell_waiver_indicator[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 14 -> cancelled_trade_message_record.notional_amount[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.buy_algo_flag = cancelled_trade_message_value;
  cancelled_trade_message_record.sell_algo_flag = cancelled_trade_message_value;
  cancelled_trade_message_record.sdiv_flag = cancelled_trade_message_value;
  cancelled_trade_message_record.dupl_flag = cancelled_trade_message_value;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 20 -> cancelled_trade_message_record.time_stamp[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancelled Trade Message set to where it lies, so a field read out of place says so */
inline ramp_cancelled_trade_message(cancelled_trade_message_record, cancelled_trade_message_base) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 15 -> cancelled_trade_message_record.symbol[cancelled_trade_message_at] = (cancelled_trade_message_base + 0 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.board_id = (cancelled_trade_message_base + 15 + 1) % 256;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 6 -> cancelled_trade_message_record.trade_number[cancelled_trade_message_at] = (cancelled_trade_message_base + 16 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.buy_order_number[cancelled_trade_message_at] = (cancelled_trade_message_base + 22 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.buy_order_date[cancelled_trade_message_at] = (cancelled_trade_message_base + 30 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.sell_order_number[cancelled_trade_message_at] = (cancelled_trade_message_base + 38 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.sell_order_date[cancelled_trade_message_at] = (cancelled_trade_message_base + 46 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 9 -> cancelled_trade_message_record.cancelled_trade_price[cancelled_trade_message_at] = (cancelled_trade_message_base + 54 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> cancelled_trade_message_record.cancelled_volume[cancelled_trade_message_at] = (cancelled_trade_message_base + 63 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> cancelled_trade_message_record.total_volume[cancelled_trade_message_at] = (cancelled_trade_message_base + 80 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.trade_type = (cancelled_trade_message_base + 97 + 1) % 256;
  cancelled_trade_message_record.trade_source = (cancelled_trade_message_base + 98 + 1) % 256;
  cancelled_trade_message_record.buy_order_type = (cancelled_trade_message_base + 99 + 1) % 256;
  cancelled_trade_message_record.sell_order_type = (cancelled_trade_message_base + 100 + 1) % 256;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.buy_waiver_indicator[cancelled_trade_message_at] = (cancelled_trade_message_base + 101 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.sell_waiver_indicator[cancelled_trade_message_at] = (cancelled_trade_message_base + 105 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 14 -> cancelled_trade_message_record.notional_amount[cancelled_trade_message_at] = (cancelled_trade_message_base + 109 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.buy_algo_flag = (cancelled_trade_message_base + 123 + 1) % 256;
  cancelled_trade_message_record.sell_algo_flag = (cancelled_trade_message_base + 124 + 1) % 256;
  cancelled_trade_message_record.sdiv_flag = (cancelled_trade_message_base + 125 + 1) % 256;
  cancelled_trade_message_record.dupl_flag = (cancelled_trade_message_base + 126 + 1) % 256;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 20 -> cancelled_trade_message_record.time_stamp[cancelled_trade_message_at] = (cancelled_trade_message_base + 127 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancelled Trade Message to the wire, 147 bytes from where the cursor stands */
inline encode_cancelled_trade_message(cancelled_trade_message_record) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 15 -> wire[at] = cancelled_trade_message_record.symbol[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = cancelled_trade_message_record.board_id; at = at + 1;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 6 -> wire[at] = cancelled_trade_message_record.trade_number[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> wire[at] = cancelled_trade_message_record.buy_order_number[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> wire[at] = cancelled_trade_message_record.buy_order_date[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> wire[at] = cancelled_trade_message_record.sell_order_number[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> wire[at] = cancelled_trade_message_record.sell_order_date[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 9 -> wire[at] = cancelled_trade_message_record.cancelled_trade_price[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> wire[at] = cancelled_trade_message_record.cancelled_volume[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> wire[at] = cancelled_trade_message_record.total_volume[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = cancelled_trade_message_record.trade_type; at = at + 1;
  wire[at] = cancelled_trade_message_record.trade_source; at = at + 1;
  wire[at] = cancelled_trade_message_record.buy_order_type; at = at + 1;
  wire[at] = cancelled_trade_message_record.sell_order_type; at = at + 1;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> wire[at] = cancelled_trade_message_record.buy_waiver_indicator[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> wire[at] = cancelled_trade_message_record.sell_waiver_indicator[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 14 -> wire[at] = cancelled_trade_message_record.notional_amount[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = cancelled_trade_message_record.buy_algo_flag; at = at + 1;
  wire[at] = cancelled_trade_message_record.sell_algo_flag; at = at + 1;
  wire[at] = cancelled_trade_message_record.sdiv_flag; at = at + 1;
  wire[at] = cancelled_trade_message_record.dupl_flag; at = at + 1;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 20 -> wire[at] = cancelled_trade_message_record.time_stamp[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancelled Trade Message off the wire, 147 bytes from where the cursor stands */
inline decode_cancelled_trade_message(cancelled_trade_message_record) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 15 -> cancelled_trade_message_record.symbol[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.board_id = wire[at]; at = at + 1;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 6 -> cancelled_trade_message_record.trade_number[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.buy_order_number[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.buy_order_date[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.sell_order_number[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.sell_order_date[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 9 -> cancelled_trade_message_record.cancelled_trade_price[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> cancelled_trade_message_record.cancelled_volume[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> cancelled_trade_message_record.total_volume[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.trade_type = wire[at]; at = at + 1;
  cancelled_trade_message_record.trade_source = wire[at]; at = at + 1;
  cancelled_trade_message_record.buy_order_type = wire[at]; at = at + 1;
  cancelled_trade_message_record.sell_order_type = wire[at]; at = at + 1;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.buy_waiver_indicator[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.sell_waiver_indicator[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 14 -> cancelled_trade_message_record.notional_amount[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.buy_algo_flag = wire[at]; at = at + 1;
  cancelled_trade_message_record.sell_algo_flag = wire[at]; at = at + 1;
  cancelled_trade_message_record.sdiv_flag = wire[at]; at = at + 1;
  cancelled_trade_message_record.dupl_flag = wire[at]; at = at + 1;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 20 -> cancelled_trade_message_record.time_stamp[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancelled Trade Message is what was written, byte for byte */
inline equal_cancelled_trade_message(cancelled_trade_message_read, cancelled_trade_message_written) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 15 -> assert(cancelled_trade_message_read.symbol[cancelled_trade_message_at] == cancelled_trade_message_written.symbol[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  assert(cancelled_trade_message_read.board_id == cancelled_trade_message_written.board_id);
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 6 -> assert(cancelled_trade_message_read.trade_number[cancelled_trade_message_at] == cancelled_trade_message_written.trade_number[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> assert(cancelled_trade_message_read.buy_order_number[cancelled_trade_message_at] == cancelled_trade_message_written.buy_order_number[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> assert(cancelled_trade_message_read.buy_order_date[cancelled_trade_message_at] == cancelled_trade_message_written.buy_order_date[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> assert(cancelled_trade_message_read.sell_order_number[cancelled_trade_message_at] == cancelled_trade_message_written.sell_order_number[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> assert(cancelled_trade_message_read.sell_order_date[cancelled_trade_message_at] == cancelled_trade_message_written.sell_order_date[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 9 -> assert(cancelled_trade_message_read.cancelled_trade_price[cancelled_trade_message_at] == cancelled_trade_message_written.cancelled_trade_price[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> assert(cancelled_trade_message_read.cancelled_volume[cancelled_trade_message_at] == cancelled_trade_message_written.cancelled_volume[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 17 -> assert(cancelled_trade_message_read.total_volume[cancelled_trade_message_at] == cancelled_trade_message_written.total_volume[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  assert(cancelled_trade_message_read.trade_type == cancelled_trade_message_written.trade_type);
  assert(cancelled_trade_message_read.trade_source == cancelled_trade_message_written.trade_source);
  assert(cancelled_trade_message_read.buy_order_type == cancelled_trade_message_written.buy_order_type);
  assert(cancelled_trade_message_read.sell_order_type == cancelled_trade_message_written.sell_order_type);
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> assert(cancelled_trade_message_read.buy_waiver_indicator[cancelled_trade_message_at] == cancelled_trade_message_written.buy_waiver_indicator[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> assert(cancelled_trade_message_read.sell_waiver_indicator[cancelled_trade_message_at] == cancelled_trade_message_written.sell_waiver_indicator[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 14 -> assert(cancelled_trade_message_read.notional_amount[cancelled_trade_message_at] == cancelled_trade_message_written.notional_amount[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  assert(cancelled_trade_message_read.buy_algo_flag == cancelled_trade_message_written.buy_algo_flag);
  assert(cancelled_trade_message_read.sell_algo_flag == cancelled_trade_message_written.sell_algo_flag);
  assert(cancelled_trade_message_read.sdiv_flag == cancelled_trade_message_written.sdiv_flag);
  assert(cancelled_trade_message_read.dupl_flag == cancelled_trade_message_written.dupl_flag);
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 20 -> assert(cancelled_trade_message_read.time_stamp[cancelled_trade_message_at] == cancelled_trade_message_written.time_stamp[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Closing Price Message: 32 bytes ----------------------------------------- */

/* Transmitted for every instrument whose closing price has been calculated by the trading platform, and again whenever the trading platform recalculates one */
typedef ClosingPriceMessage {
  byte symbol[15];
  byte closing[9];
  byte open_interest[8]
};

int closing_price_message_at;

/* every byte of Closing Price Message set to one value */
inline fill_closing_price_message(closing_price_message_record, closing_price_message_value) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 15 -> closing_price_message_record.symbol[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 9 -> closing_price_message_record.closing[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 8 -> closing_price_message_record.open_interest[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_closing_price_message(closing_price_message_record, closing_price_message_base) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 15 -> closing_price_message_record.symbol[closing_price_message_at] = (closing_price_message_base + 0 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 9 -> closing_price_message_record.closing[closing_price_message_at] = (closing_price_message_base + 15 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 8 -> closing_price_message_record.open_interest[closing_price_message_at] = (closing_price_message_base + 24 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Message to the wire, 32 bytes from where the cursor stands */
inline encode_closing_price_message(closing_price_message_record) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 15 -> wire[at] = closing_price_message_record.symbol[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 9 -> wire[at] = closing_price_message_record.closing[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 8 -> wire[at] = closing_price_message_record.open_interest[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Message off the wire, 32 bytes from where the cursor stands */
inline decode_closing_price_message(closing_price_message_record) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 15 -> closing_price_message_record.symbol[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 9 -> closing_price_message_record.closing[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 8 -> closing_price_message_record.open_interest[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Closing Price Message is what was written, byte for byte */
inline equal_closing_price_message(closing_price_message_read, closing_price_message_written) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 15 -> assert(closing_price_message_read.symbol[closing_price_message_at] == closing_price_message_written.symbol[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 9 -> assert(closing_price_message_read.closing[closing_price_message_at] == closing_price_message_written.closing[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 8 -> assert(closing_price_message_read.open_interest[closing_price_message_at] == closing_price_message_written.open_interest[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Projected Auction Auction Open Projected Close Price Message: 62 bytes ---- */

/* Transmitted whenever the trading platform calculates a Projected Auction, Auction Open or Projected Close price for the instrument */
typedef ProjectedAuctionAuctionOpenProjectedClosePriceMessage {
  byte symbol[15];
  byte price_flag;
  byte price[9];
  byte volume[17];
  byte time_stamp[20]
};

int projected_auction_auction_open_projected_close_price_message_at;

/* every byte of Projected Auction Auction Open Projected Close Price Message set to one value */
inline fill_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_record, projected_auction_auction_open_projected_close_price_message_value) {
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 15 -> projected_auction_auction_open_projected_close_price_message_record.symbol[projected_auction_auction_open_projected_close_price_message_at] = projected_auction_auction_open_projected_close_price_message_value; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_record.price_flag = projected_auction_auction_open_projected_close_price_message_value;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 9 -> projected_auction_auction_open_projected_close_price_message_record.price[projected_auction_auction_open_projected_close_price_message_at] = projected_auction_auction_open_projected_close_price_message_value; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 17 -> projected_auction_auction_open_projected_close_price_message_record.volume[projected_auction_auction_open_projected_close_price_message_at] = projected_auction_auction_open_projected_close_price_message_value; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 20 -> projected_auction_auction_open_projected_close_price_message_record.time_stamp[projected_auction_auction_open_projected_close_price_message_at] = projected_auction_auction_open_projected_close_price_message_value; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Projected Auction Auction Open Projected Close Price Message set to where it lies, so a field read out of place says so */
inline ramp_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_record, projected_auction_auction_open_projected_close_price_message_base) {
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 15 -> projected_auction_auction_open_projected_close_price_message_record.symbol[projected_auction_auction_open_projected_close_price_message_at] = (projected_auction_auction_open_projected_close_price_message_base + 0 + projected_auction_auction_open_projected_close_price_message_at + 1) % 256; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_record.price_flag = (projected_auction_auction_open_projected_close_price_message_base + 15 + 1) % 256;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 9 -> projected_auction_auction_open_projected_close_price_message_record.price[projected_auction_auction_open_projected_close_price_message_at] = (projected_auction_auction_open_projected_close_price_message_base + 16 + projected_auction_auction_open_projected_close_price_message_at + 1) % 256; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 17 -> projected_auction_auction_open_projected_close_price_message_record.volume[projected_auction_auction_open_projected_close_price_message_at] = (projected_auction_auction_open_projected_close_price_message_base + 25 + projected_auction_auction_open_projected_close_price_message_at + 1) % 256; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 20 -> projected_auction_auction_open_projected_close_price_message_record.time_stamp[projected_auction_auction_open_projected_close_price_message_at] = (projected_auction_auction_open_projected_close_price_message_base + 42 + projected_auction_auction_open_projected_close_price_message_at + 1) % 256; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Projected Auction Auction Open Projected Close Price Message to the wire, 62 bytes from where the cursor stands */
inline encode_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_record) {
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 15 -> wire[at] = projected_auction_auction_open_projected_close_price_message_record.symbol[projected_auction_auction_open_projected_close_price_message_at]; at = at + 1; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  wire[at] = projected_auction_auction_open_projected_close_price_message_record.price_flag; at = at + 1;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 9 -> wire[at] = projected_auction_auction_open_projected_close_price_message_record.price[projected_auction_auction_open_projected_close_price_message_at]; at = at + 1; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 17 -> wire[at] = projected_auction_auction_open_projected_close_price_message_record.volume[projected_auction_auction_open_projected_close_price_message_at]; at = at + 1; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 20 -> wire[at] = projected_auction_auction_open_projected_close_price_message_record.time_stamp[projected_auction_auction_open_projected_close_price_message_at]; at = at + 1; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Projected Auction Auction Open Projected Close Price Message off the wire, 62 bytes from where the cursor stands */
inline decode_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_record) {
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 15 -> projected_auction_auction_open_projected_close_price_message_record.symbol[projected_auction_auction_open_projected_close_price_message_at] = wire[at]; at = at + 1; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_record.price_flag = wire[at]; at = at + 1;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 9 -> projected_auction_auction_open_projected_close_price_message_record.price[projected_auction_auction_open_projected_close_price_message_at] = wire[at]; at = at + 1; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 17 -> projected_auction_auction_open_projected_close_price_message_record.volume[projected_auction_auction_open_projected_close_price_message_at] = wire[at]; at = at + 1; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 20 -> projected_auction_auction_open_projected_close_price_message_record.time_stamp[projected_auction_auction_open_projected_close_price_message_at] = wire[at]; at = at + 1; projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Projected Auction Auction Open Projected Close Price Message is what was written, byte for byte */
inline equal_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_read, projected_auction_auction_open_projected_close_price_message_written) {
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 15 -> assert(projected_auction_auction_open_projected_close_price_message_read.symbol[projected_auction_auction_open_projected_close_price_message_at] == projected_auction_auction_open_projected_close_price_message_written.symbol[projected_auction_auction_open_projected_close_price_message_at]); projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  assert(projected_auction_auction_open_projected_close_price_message_read.price_flag == projected_auction_auction_open_projected_close_price_message_written.price_flag);
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 9 -> assert(projected_auction_auction_open_projected_close_price_message_read.price[projected_auction_auction_open_projected_close_price_message_at] == projected_auction_auction_open_projected_close_price_message_written.price[projected_auction_auction_open_projected_close_price_message_at]); projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 17 -> assert(projected_auction_auction_open_projected_close_price_message_read.volume[projected_auction_auction_open_projected_close_price_message_at] == projected_auction_auction_open_projected_close_price_message_written.volume[projected_auction_auction_open_projected_close_price_message_at]); projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  projected_auction_auction_open_projected_close_price_message_at = 0;
  do
  :: projected_auction_auction_open_projected_close_price_message_at < 20 -> assert(projected_auction_auction_open_projected_close_price_message_read.time_stamp[projected_auction_auction_open_projected_close_price_message_at] == projected_auction_auction_open_projected_close_price_message_written.time_stamp[projected_auction_auction_open_projected_close_price_message_at]); projected_auction_auction_open_projected_close_price_message_at = projected_auction_auction_open_projected_close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- High Low Limit Modification Message: 56 bytes --------------------------- */

/* Transmitted at the beginning of the trading day, and whenever the static High and Low limits for the given instrument change */
typedef HighLowLimitModificationMessage {
  byte symbol[15];
  byte ceiling_price[9];
  byte floor_price[9];
  byte start_of_day_price[9];
  byte accrued_interest[14]
};

int high_low_limit_modification_message_at;

/* every byte of High Low Limit Modification Message set to one value */
inline fill_high_low_limit_modification_message(high_low_limit_modification_message_record, high_low_limit_modification_message_value) {
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 15 -> high_low_limit_modification_message_record.symbol[high_low_limit_modification_message_at] = high_low_limit_modification_message_value; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> high_low_limit_modification_message_record.ceiling_price[high_low_limit_modification_message_at] = high_low_limit_modification_message_value; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> high_low_limit_modification_message_record.floor_price[high_low_limit_modification_message_at] = high_low_limit_modification_message_value; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> high_low_limit_modification_message_record.start_of_day_price[high_low_limit_modification_message_at] = high_low_limit_modification_message_value; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 14 -> high_low_limit_modification_message_record.accrued_interest[high_low_limit_modification_message_at] = high_low_limit_modification_message_value; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of High Low Limit Modification Message set to where it lies, so a field read out of place says so */
inline ramp_high_low_limit_modification_message(high_low_limit_modification_message_record, high_low_limit_modification_message_base) {
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 15 -> high_low_limit_modification_message_record.symbol[high_low_limit_modification_message_at] = (high_low_limit_modification_message_base + 0 + high_low_limit_modification_message_at + 1) % 256; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> high_low_limit_modification_message_record.ceiling_price[high_low_limit_modification_message_at] = (high_low_limit_modification_message_base + 15 + high_low_limit_modification_message_at + 1) % 256; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> high_low_limit_modification_message_record.floor_price[high_low_limit_modification_message_at] = (high_low_limit_modification_message_base + 24 + high_low_limit_modification_message_at + 1) % 256; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> high_low_limit_modification_message_record.start_of_day_price[high_low_limit_modification_message_at] = (high_low_limit_modification_message_base + 33 + high_low_limit_modification_message_at + 1) % 256; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 14 -> high_low_limit_modification_message_record.accrued_interest[high_low_limit_modification_message_at] = (high_low_limit_modification_message_base + 42 + high_low_limit_modification_message_at + 1) % 256; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  skip
}

/* High Low Limit Modification Message to the wire, 56 bytes from where the cursor stands */
inline encode_high_low_limit_modification_message(high_low_limit_modification_message_record) {
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 15 -> wire[at] = high_low_limit_modification_message_record.symbol[high_low_limit_modification_message_at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> wire[at] = high_low_limit_modification_message_record.ceiling_price[high_low_limit_modification_message_at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> wire[at] = high_low_limit_modification_message_record.floor_price[high_low_limit_modification_message_at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> wire[at] = high_low_limit_modification_message_record.start_of_day_price[high_low_limit_modification_message_at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 14 -> wire[at] = high_low_limit_modification_message_record.accrued_interest[high_low_limit_modification_message_at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  skip
}

/* High Low Limit Modification Message off the wire, 56 bytes from where the cursor stands */
inline decode_high_low_limit_modification_message(high_low_limit_modification_message_record) {
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 15 -> high_low_limit_modification_message_record.symbol[high_low_limit_modification_message_at] = wire[at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> high_low_limit_modification_message_record.ceiling_price[high_low_limit_modification_message_at] = wire[at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> high_low_limit_modification_message_record.floor_price[high_low_limit_modification_message_at] = wire[at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> high_low_limit_modification_message_record.start_of_day_price[high_low_limit_modification_message_at] = wire[at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 14 -> high_low_limit_modification_message_record.accrued_interest[high_low_limit_modification_message_at] = wire[at]; at = at + 1; high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of High Low Limit Modification Message is what was written, byte for byte */
inline equal_high_low_limit_modification_message(high_low_limit_modification_message_read, high_low_limit_modification_message_written) {
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 15 -> assert(high_low_limit_modification_message_read.symbol[high_low_limit_modification_message_at] == high_low_limit_modification_message_written.symbol[high_low_limit_modification_message_at]); high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> assert(high_low_limit_modification_message_read.ceiling_price[high_low_limit_modification_message_at] == high_low_limit_modification_message_written.ceiling_price[high_low_limit_modification_message_at]); high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> assert(high_low_limit_modification_message_read.floor_price[high_low_limit_modification_message_at] == high_low_limit_modification_message_written.floor_price[high_low_limit_modification_message_at]); high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 9 -> assert(high_low_limit_modification_message_read.start_of_day_price[high_low_limit_modification_message_at] == high_low_limit_modification_message_written.start_of_day_price[high_low_limit_modification_message_at]); high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  high_low_limit_modification_message_at = 0;
  do
  :: high_low_limit_modification_message_at < 14 -> assert(high_low_limit_modification_message_read.accrued_interest[high_low_limit_modification_message_at] == high_low_limit_modification_message_written.accrued_interest[high_low_limit_modification_message_at]); high_low_limit_modification_message_at = high_low_limit_modification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument State Message: 38 bytes -------------------------------------- */

/* Transmitted at the beginning of the trading day, and whenever the instrument changes its trading phase or its status */
typedef InstrumentStateMessage {
  byte symbol[15];
  byte phase_id;
  byte instrument_status;
  byte halt_suspend_reason;
  byte time_stamp[20]
};

int instrument_state_message_at;

/* every byte of Instrument State Message set to one value */
inline fill_instrument_state_message(instrument_state_message_record, instrument_state_message_value) {
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 15 -> instrument_state_message_record.symbol[instrument_state_message_at] = instrument_state_message_value; instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  instrument_state_message_record.phase_id = instrument_state_message_value;
  instrument_state_message_record.instrument_status = instrument_state_message_value;
  instrument_state_message_record.halt_suspend_reason = instrument_state_message_value;
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 20 -> instrument_state_message_record.time_stamp[instrument_state_message_at] = instrument_state_message_value; instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument State Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_state_message(instrument_state_message_record, instrument_state_message_base) {
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 15 -> instrument_state_message_record.symbol[instrument_state_message_at] = (instrument_state_message_base + 0 + instrument_state_message_at + 1) % 256; instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  instrument_state_message_record.phase_id = (instrument_state_message_base + 15 + 1) % 256;
  instrument_state_message_record.instrument_status = (instrument_state_message_base + 16 + 1) % 256;
  instrument_state_message_record.halt_suspend_reason = (instrument_state_message_base + 17 + 1) % 256;
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 20 -> instrument_state_message_record.time_stamp[instrument_state_message_at] = (instrument_state_message_base + 18 + instrument_state_message_at + 1) % 256; instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument State Message to the wire, 38 bytes from where the cursor stands */
inline encode_instrument_state_message(instrument_state_message_record) {
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 15 -> wire[at] = instrument_state_message_record.symbol[instrument_state_message_at]; at = at + 1; instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_state_message_record.phase_id; at = at + 1;
  wire[at] = instrument_state_message_record.instrument_status; at = at + 1;
  wire[at] = instrument_state_message_record.halt_suspend_reason; at = at + 1;
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 20 -> wire[at] = instrument_state_message_record.time_stamp[instrument_state_message_at]; at = at + 1; instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument State Message off the wire, 38 bytes from where the cursor stands */
inline decode_instrument_state_message(instrument_state_message_record) {
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 15 -> instrument_state_message_record.symbol[instrument_state_message_at] = wire[at]; at = at + 1; instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  instrument_state_message_record.phase_id = wire[at]; at = at + 1;
  instrument_state_message_record.instrument_status = wire[at]; at = at + 1;
  instrument_state_message_record.halt_suspend_reason = wire[at]; at = at + 1;
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 20 -> instrument_state_message_record.time_stamp[instrument_state_message_at] = wire[at]; at = at + 1; instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument State Message is what was written, byte for byte */
inline equal_instrument_state_message(instrument_state_message_read, instrument_state_message_written) {
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 15 -> assert(instrument_state_message_read.symbol[instrument_state_message_at] == instrument_state_message_written.symbol[instrument_state_message_at]); instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  assert(instrument_state_message_read.phase_id == instrument_state_message_written.phase_id);
  assert(instrument_state_message_read.instrument_status == instrument_state_message_written.instrument_status);
  assert(instrument_state_message_read.halt_suspend_reason == instrument_state_message_written.halt_suspend_reason);
  instrument_state_message_at = 0;
  do
  :: instrument_state_message_at < 20 -> assert(instrument_state_message_read.time_stamp[instrument_state_message_at] == instrument_state_message_written.time_stamp[instrument_state_message_at]); instrument_state_message_at = instrument_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Status Message: 2 bytes ------------------------------------------ */

/* Transmitted whenever the market changes its status */
typedef MarketStatusMessage {
  byte market_id;
  byte market_status
};

/* every byte of Market Status Message set to one value */
inline fill_market_status_message(market_status_message_record, market_status_message_value) {
  market_status_message_record.market_id = market_status_message_value;
  market_status_message_record.market_status = market_status_message_value;
  skip
}

/* each byte of Market Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_status_message(market_status_message_record, market_status_message_base) {
  market_status_message_record.market_id = (market_status_message_base + 0 + 1) % 256;
  market_status_message_record.market_status = (market_status_message_base + 1 + 1) % 256;
  skip
}

/* Market Status Message to the wire, 2 bytes from where the cursor stands */
inline encode_market_status_message(market_status_message_record) {
  wire[at] = market_status_message_record.market_id; at = at + 1;
  wire[at] = market_status_message_record.market_status; at = at + 1;
  skip
}

/* Market Status Message off the wire, 2 bytes from where the cursor stands */
inline decode_market_status_message(market_status_message_record) {
  market_status_message_record.market_id = wire[at]; at = at + 1;
  market_status_message_record.market_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Status Message is what was written, byte for byte */
inline equal_market_status_message(market_status_message_read, market_status_message_written) {
  assert(market_status_message_read.market_id == market_status_message_written.market_id);
  assert(market_status_message_read.market_status == market_status_message_written.market_status);
  skip
}

/* ---- Order Message: 147 bytes ------------------------------------------------ */

/* Transmitted at the beginning of the trading session for an order whose lifetime spans multiple days, when a new order is entered in the trading platform, and when an already placed order is changed. It is not transmitted for Combinations */
typedef OrderMessage {
  byte symbol[15];
  byte board_id;
  byte order_number[8];
  byte order_entry_date[8];
  byte order_status[2];
  byte side;
  byte volume[17];
  byte matched_volume[17];
  byte price[9];
  byte original_price_type;
  byte order_lifetime;
  byte special_conditions;
  byte condition_volume[17];
  byte order_release_date[8];
  byte order_release_time[12];
  byte last_order_update_date[8];
  byte order_type;
  byte time_stamp[20]
};

int order_message_at;

/* every byte of Order Message set to one value */
inline fill_order_message(order_message_record, order_message_value) {
  order_message_at = 0;
  do
  :: order_message_at < 15 -> order_message_record.symbol[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.board_id = order_message_value;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.order_number[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.order_entry_date[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 2 -> order_message_record.order_status[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.side = order_message_value;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> order_message_record.volume[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> order_message_record.matched_volume[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 9 -> order_message_record.price[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.original_price_type = order_message_value;
  order_message_record.order_lifetime = order_message_value;
  order_message_record.special_conditions = order_message_value;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> order_message_record.condition_volume[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.order_release_date[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 12 -> order_message_record.order_release_time[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.last_order_update_date[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.order_type = order_message_value;
  order_message_at = 0;
  do
  :: order_message_at < 20 -> order_message_record.time_stamp[order_message_at] = order_message_value; order_message_at = order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Message set to where it lies, so a field read out of place says so */
inline ramp_order_message(order_message_record, order_message_base) {
  order_message_at = 0;
  do
  :: order_message_at < 15 -> order_message_record.symbol[order_message_at] = (order_message_base + 0 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.board_id = (order_message_base + 15 + 1) % 256;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.order_number[order_message_at] = (order_message_base + 16 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.order_entry_date[order_message_at] = (order_message_base + 24 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 2 -> order_message_record.order_status[order_message_at] = (order_message_base + 32 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.side = (order_message_base + 34 + 1) % 256;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> order_message_record.volume[order_message_at] = (order_message_base + 35 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> order_message_record.matched_volume[order_message_at] = (order_message_base + 52 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 9 -> order_message_record.price[order_message_at] = (order_message_base + 69 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.original_price_type = (order_message_base + 78 + 1) % 256;
  order_message_record.order_lifetime = (order_message_base + 79 + 1) % 256;
  order_message_record.special_conditions = (order_message_base + 80 + 1) % 256;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> order_message_record.condition_volume[order_message_at] = (order_message_base + 81 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.order_release_date[order_message_at] = (order_message_base + 98 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 12 -> order_message_record.order_release_time[order_message_at] = (order_message_base + 106 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.last_order_update_date[order_message_at] = (order_message_base + 118 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.order_type = (order_message_base + 126 + 1) % 256;
  order_message_at = 0;
  do
  :: order_message_at < 20 -> order_message_record.time_stamp[order_message_at] = (order_message_base + 127 + order_message_at + 1) % 256; order_message_at = order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Message to the wire, 147 bytes from where the cursor stands */
inline encode_order_message(order_message_record) {
  order_message_at = 0;
  do
  :: order_message_at < 15 -> wire[at] = order_message_record.symbol[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  wire[at] = order_message_record.board_id; at = at + 1;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> wire[at] = order_message_record.order_number[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> wire[at] = order_message_record.order_entry_date[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 2 -> wire[at] = order_message_record.order_status[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  wire[at] = order_message_record.side; at = at + 1;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> wire[at] = order_message_record.volume[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> wire[at] = order_message_record.matched_volume[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 9 -> wire[at] = order_message_record.price[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  wire[at] = order_message_record.original_price_type; at = at + 1;
  wire[at] = order_message_record.order_lifetime; at = at + 1;
  wire[at] = order_message_record.special_conditions; at = at + 1;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> wire[at] = order_message_record.condition_volume[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> wire[at] = order_message_record.order_release_date[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 12 -> wire[at] = order_message_record.order_release_time[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> wire[at] = order_message_record.last_order_update_date[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  wire[at] = order_message_record.order_type; at = at + 1;
  order_message_at = 0;
  do
  :: order_message_at < 20 -> wire[at] = order_message_record.time_stamp[order_message_at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Message off the wire, 147 bytes from where the cursor stands */
inline decode_order_message(order_message_record) {
  order_message_at = 0;
  do
  :: order_message_at < 15 -> order_message_record.symbol[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.board_id = wire[at]; at = at + 1;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.order_number[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.order_entry_date[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 2 -> order_message_record.order_status[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.side = wire[at]; at = at + 1;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> order_message_record.volume[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> order_message_record.matched_volume[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 9 -> order_message_record.price[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.original_price_type = wire[at]; at = at + 1;
  order_message_record.order_lifetime = wire[at]; at = at + 1;
  order_message_record.special_conditions = wire[at]; at = at + 1;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> order_message_record.condition_volume[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.order_release_date[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 12 -> order_message_record.order_release_time[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> order_message_record.last_order_update_date[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_record.order_type = wire[at]; at = at + 1;
  order_message_at = 0;
  do
  :: order_message_at < 20 -> order_message_record.time_stamp[order_message_at] = wire[at]; at = at + 1; order_message_at = order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Message is what was written, byte for byte */
inline equal_order_message(order_message_read, order_message_written) {
  order_message_at = 0;
  do
  :: order_message_at < 15 -> assert(order_message_read.symbol[order_message_at] == order_message_written.symbol[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  assert(order_message_read.board_id == order_message_written.board_id);
  order_message_at = 0;
  do
  :: order_message_at < 8 -> assert(order_message_read.order_number[order_message_at] == order_message_written.order_number[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> assert(order_message_read.order_entry_date[order_message_at] == order_message_written.order_entry_date[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 2 -> assert(order_message_read.order_status[order_message_at] == order_message_written.order_status[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  assert(order_message_read.side == order_message_written.side);
  order_message_at = 0;
  do
  :: order_message_at < 17 -> assert(order_message_read.volume[order_message_at] == order_message_written.volume[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 17 -> assert(order_message_read.matched_volume[order_message_at] == order_message_written.matched_volume[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 9 -> assert(order_message_read.price[order_message_at] == order_message_written.price[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  assert(order_message_read.original_price_type == order_message_written.original_price_type);
  assert(order_message_read.order_lifetime == order_message_written.order_lifetime);
  assert(order_message_read.special_conditions == order_message_written.special_conditions);
  order_message_at = 0;
  do
  :: order_message_at < 17 -> assert(order_message_read.condition_volume[order_message_at] == order_message_written.condition_volume[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> assert(order_message_read.order_release_date[order_message_at] == order_message_written.order_release_date[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 12 -> assert(order_message_read.order_release_time[order_message_at] == order_message_written.order_release_time[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  order_message_at = 0;
  do
  :: order_message_at < 8 -> assert(order_message_read.last_order_update_date[order_message_at] == order_message_written.last_order_update_date[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  assert(order_message_read.order_type == order_message_written.order_type);
  order_message_at = 0;
  do
  :: order_message_at < 20 -> assert(order_message_read.time_stamp[order_message_at] == order_message_written.time_stamp[order_message_at]); order_message_at = order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancelled Order Message: 117 bytes -------------------------------------- */

/* Transmitted whenever an order is cancelled. It is not transmitted for Combinations */
typedef CancelledOrderMessage {
  byte symbol[15];
  byte board_id;
  byte order_number[8];
  byte order_entry_date[8];
  byte side;
  byte volume[17];
  byte matched_volume[17];
  byte price[9];
  byte original_price_type;
  byte order_lifetime;
  byte special_conditions;
  byte condition_volume[17];
  byte order_type;
  byte time_stamp[20]
};

int cancelled_order_message_at;

/* every byte of Cancelled Order Message set to one value */
inline fill_cancelled_order_message(cancelled_order_message_record, cancelled_order_message_value) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 15 -> cancelled_order_message_record.symbol[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.board_id = cancelled_order_message_value;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> cancelled_order_message_record.order_number[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> cancelled_order_message_record.order_entry_date[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.side = cancelled_order_message_value;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> cancelled_order_message_record.volume[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> cancelled_order_message_record.matched_volume[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 9 -> cancelled_order_message_record.price[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.original_price_type = cancelled_order_message_value;
  cancelled_order_message_record.order_lifetime = cancelled_order_message_value;
  cancelled_order_message_record.special_conditions = cancelled_order_message_value;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> cancelled_order_message_record.condition_volume[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.order_type = cancelled_order_message_value;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 20 -> cancelled_order_message_record.time_stamp[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancelled Order Message set to where it lies, so a field read out of place says so */
inline ramp_cancelled_order_message(cancelled_order_message_record, cancelled_order_message_base) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 15 -> cancelled_order_message_record.symbol[cancelled_order_message_at] = (cancelled_order_message_base + 0 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.board_id = (cancelled_order_message_base + 15 + 1) % 256;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> cancelled_order_message_record.order_number[cancelled_order_message_at] = (cancelled_order_message_base + 16 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> cancelled_order_message_record.order_entry_date[cancelled_order_message_at] = (cancelled_order_message_base + 24 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.side = (cancelled_order_message_base + 32 + 1) % 256;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> cancelled_order_message_record.volume[cancelled_order_message_at] = (cancelled_order_message_base + 33 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> cancelled_order_message_record.matched_volume[cancelled_order_message_at] = (cancelled_order_message_base + 50 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 9 -> cancelled_order_message_record.price[cancelled_order_message_at] = (cancelled_order_message_base + 67 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.original_price_type = (cancelled_order_message_base + 76 + 1) % 256;
  cancelled_order_message_record.order_lifetime = (cancelled_order_message_base + 77 + 1) % 256;
  cancelled_order_message_record.special_conditions = (cancelled_order_message_base + 78 + 1) % 256;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> cancelled_order_message_record.condition_volume[cancelled_order_message_at] = (cancelled_order_message_base + 79 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.order_type = (cancelled_order_message_base + 96 + 1) % 256;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 20 -> cancelled_order_message_record.time_stamp[cancelled_order_message_at] = (cancelled_order_message_base + 97 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancelled Order Message to the wire, 117 bytes from where the cursor stands */
inline encode_cancelled_order_message(cancelled_order_message_record) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 15 -> wire[at] = cancelled_order_message_record.symbol[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  wire[at] = cancelled_order_message_record.board_id; at = at + 1;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> wire[at] = cancelled_order_message_record.order_number[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> wire[at] = cancelled_order_message_record.order_entry_date[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  wire[at] = cancelled_order_message_record.side; at = at + 1;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> wire[at] = cancelled_order_message_record.volume[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> wire[at] = cancelled_order_message_record.matched_volume[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 9 -> wire[at] = cancelled_order_message_record.price[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  wire[at] = cancelled_order_message_record.original_price_type; at = at + 1;
  wire[at] = cancelled_order_message_record.order_lifetime; at = at + 1;
  wire[at] = cancelled_order_message_record.special_conditions; at = at + 1;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> wire[at] = cancelled_order_message_record.condition_volume[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  wire[at] = cancelled_order_message_record.order_type; at = at + 1;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 20 -> wire[at] = cancelled_order_message_record.time_stamp[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancelled Order Message off the wire, 117 bytes from where the cursor stands */
inline decode_cancelled_order_message(cancelled_order_message_record) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 15 -> cancelled_order_message_record.symbol[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.board_id = wire[at]; at = at + 1;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> cancelled_order_message_record.order_number[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> cancelled_order_message_record.order_entry_date[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.side = wire[at]; at = at + 1;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> cancelled_order_message_record.volume[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> cancelled_order_message_record.matched_volume[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 9 -> cancelled_order_message_record.price[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.original_price_type = wire[at]; at = at + 1;
  cancelled_order_message_record.order_lifetime = wire[at]; at = at + 1;
  cancelled_order_message_record.special_conditions = wire[at]; at = at + 1;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> cancelled_order_message_record.condition_volume[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.order_type = wire[at]; at = at + 1;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 20 -> cancelled_order_message_record.time_stamp[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancelled Order Message is what was written, byte for byte */
inline equal_cancelled_order_message(cancelled_order_message_read, cancelled_order_message_written) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 15 -> assert(cancelled_order_message_read.symbol[cancelled_order_message_at] == cancelled_order_message_written.symbol[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  assert(cancelled_order_message_read.board_id == cancelled_order_message_written.board_id);
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> assert(cancelled_order_message_read.order_number[cancelled_order_message_at] == cancelled_order_message_written.order_number[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> assert(cancelled_order_message_read.order_entry_date[cancelled_order_message_at] == cancelled_order_message_written.order_entry_date[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  assert(cancelled_order_message_read.side == cancelled_order_message_written.side);
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> assert(cancelled_order_message_read.volume[cancelled_order_message_at] == cancelled_order_message_written.volume[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> assert(cancelled_order_message_read.matched_volume[cancelled_order_message_at] == cancelled_order_message_written.matched_volume[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 9 -> assert(cancelled_order_message_read.price[cancelled_order_message_at] == cancelled_order_message_written.price[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  assert(cancelled_order_message_read.original_price_type == cancelled_order_message_written.original_price_type);
  assert(cancelled_order_message_read.order_lifetime == cancelled_order_message_written.order_lifetime);
  assert(cancelled_order_message_read.special_conditions == cancelled_order_message_written.special_conditions);
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 17 -> assert(cancelled_order_message_read.condition_volume[cancelled_order_message_at] == cancelled_order_message_written.condition_volume[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  assert(cancelled_order_message_read.order_type == cancelled_order_message_written.order_type);
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 20 -> assert(cancelled_order_message_read.time_stamp[cancelled_order_message_at] == cancelled_order_message_written.time_stamp[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
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
    assert(at == 35);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 35);
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
    assert(at == 147);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 147);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Index Message: encoded, read back, and compared */
proctype check_index_message() {
  IndexMessage index_message_sent;
  IndexMessage index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_message(index_message_sent, 0)
  :: pattern == 1 -> fill_index_message(index_message_sent, 32)
  :: pattern == 2 -> fill_index_message(index_message_sent, 255)
  :: else -> ramp_index_message(index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_message(index_message_sent);
    assert(at == 24);
    at = 0;
    decode_index_message(index_message_got);
    assert(at == 24);
    equal_index_message(index_message_got, index_message_sent)
  }
}

/* Instrument Summary Message: encoded, read back, and compared */
proctype check_instrument_summary_message() {
  InstrumentSummaryMessage instrument_summary_message_sent;
  InstrumentSummaryMessage instrument_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_summary_message(instrument_summary_message_sent, 0)
  :: pattern == 1 -> fill_instrument_summary_message(instrument_summary_message_sent, 32)
  :: pattern == 2 -> fill_instrument_summary_message(instrument_summary_message_sent, 255)
  :: else -> ramp_instrument_summary_message(instrument_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_summary_message(instrument_summary_message_sent);
    assert(at == 103);
    at = 0;
    decode_instrument_summary_message(instrument_summary_message_got);
    assert(at == 103);
    equal_instrument_summary_message(instrument_summary_message_got, instrument_summary_message_sent)
  }
}

/* Cancelled Trade Message: encoded, read back, and compared */
proctype check_cancelled_trade_message() {
  CancelledTradeMessage cancelled_trade_message_sent;
  CancelledTradeMessage cancelled_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancelled_trade_message(cancelled_trade_message_sent, 0)
  :: pattern == 1 -> fill_cancelled_trade_message(cancelled_trade_message_sent, 32)
  :: pattern == 2 -> fill_cancelled_trade_message(cancelled_trade_message_sent, 255)
  :: else -> ramp_cancelled_trade_message(cancelled_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancelled_trade_message(cancelled_trade_message_sent);
    assert(at == 147);
    at = 0;
    decode_cancelled_trade_message(cancelled_trade_message_got);
    assert(at == 147);
    equal_cancelled_trade_message(cancelled_trade_message_got, cancelled_trade_message_sent)
  }
}

/* Closing Price Message: encoded, read back, and compared */
proctype check_closing_price_message() {
  ClosingPriceMessage closing_price_message_sent;
  ClosingPriceMessage closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_closing_price_message(closing_price_message_sent, 0)
  :: pattern == 1 -> fill_closing_price_message(closing_price_message_sent, 32)
  :: pattern == 2 -> fill_closing_price_message(closing_price_message_sent, 255)
  :: else -> ramp_closing_price_message(closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_closing_price_message(closing_price_message_sent);
    assert(at == 32);
    at = 0;
    decode_closing_price_message(closing_price_message_got);
    assert(at == 32);
    equal_closing_price_message(closing_price_message_got, closing_price_message_sent)
  }
}

/* Projected Auction Auction Open Projected Close Price Message: encoded, read back, and compared */
proctype check_projected_auction_auction_open_projected_close_price_message() {
  ProjectedAuctionAuctionOpenProjectedClosePriceMessage projected_auction_auction_open_projected_close_price_message_sent;
  ProjectedAuctionAuctionOpenProjectedClosePriceMessage projected_auction_auction_open_projected_close_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_sent, 0)
  :: pattern == 1 -> fill_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_sent, 32)
  :: pattern == 2 -> fill_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_sent, 255)
  :: else -> ramp_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_sent);
    assert(at == 62);
    at = 0;
    decode_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_got);
    assert(at == 62);
    equal_projected_auction_auction_open_projected_close_price_message(projected_auction_auction_open_projected_close_price_message_got, projected_auction_auction_open_projected_close_price_message_sent)
  }
}

/* High Low Limit Modification Message: encoded, read back, and compared */
proctype check_high_low_limit_modification_message() {
  HighLowLimitModificationMessage high_low_limit_modification_message_sent;
  HighLowLimitModificationMessage high_low_limit_modification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_high_low_limit_modification_message(high_low_limit_modification_message_sent, 0)
  :: pattern == 1 -> fill_high_low_limit_modification_message(high_low_limit_modification_message_sent, 32)
  :: pattern == 2 -> fill_high_low_limit_modification_message(high_low_limit_modification_message_sent, 255)
  :: else -> ramp_high_low_limit_modification_message(high_low_limit_modification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_high_low_limit_modification_message(high_low_limit_modification_message_sent);
    assert(at == 56);
    at = 0;
    decode_high_low_limit_modification_message(high_low_limit_modification_message_got);
    assert(at == 56);
    equal_high_low_limit_modification_message(high_low_limit_modification_message_got, high_low_limit_modification_message_sent)
  }
}

/* Instrument State Message: encoded, read back, and compared */
proctype check_instrument_state_message() {
  InstrumentStateMessage instrument_state_message_sent;
  InstrumentStateMessage instrument_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_state_message(instrument_state_message_sent, 0)
  :: pattern == 1 -> fill_instrument_state_message(instrument_state_message_sent, 32)
  :: pattern == 2 -> fill_instrument_state_message(instrument_state_message_sent, 255)
  :: else -> ramp_instrument_state_message(instrument_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_state_message(instrument_state_message_sent);
    assert(at == 38);
    at = 0;
    decode_instrument_state_message(instrument_state_message_got);
    assert(at == 38);
    equal_instrument_state_message(instrument_state_message_got, instrument_state_message_sent)
  }
}

/* Market Status Message: encoded, read back, and compared */
proctype check_market_status_message() {
  MarketStatusMessage market_status_message_sent;
  MarketStatusMessage market_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_status_message(market_status_message_sent, 0)
  :: pattern == 1 -> fill_market_status_message(market_status_message_sent, 32)
  :: pattern == 2 -> fill_market_status_message(market_status_message_sent, 255)
  :: else -> ramp_market_status_message(market_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_status_message(market_status_message_sent);
    assert(at == 2);
    at = 0;
    decode_market_status_message(market_status_message_got);
    assert(at == 2);
    equal_market_status_message(market_status_message_got, market_status_message_sent)
  }
}

/* Order Message: encoded, read back, and compared */
proctype check_order_message() {
  OrderMessage order_message_sent;
  OrderMessage order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_message(order_message_sent, 0)
  :: pattern == 1 -> fill_order_message(order_message_sent, 32)
  :: pattern == 2 -> fill_order_message(order_message_sent, 255)
  :: else -> ramp_order_message(order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_message(order_message_sent);
    assert(at == 147);
    at = 0;
    decode_order_message(order_message_got);
    assert(at == 147);
    equal_order_message(order_message_got, order_message_sent)
  }
}

/* Cancelled Order Message: encoded, read back, and compared */
proctype check_cancelled_order_message() {
  CancelledOrderMessage cancelled_order_message_sent;
  CancelledOrderMessage cancelled_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancelled_order_message(cancelled_order_message_sent, 0)
  :: pattern == 1 -> fill_cancelled_order_message(cancelled_order_message_sent, 32)
  :: pattern == 2 -> fill_cancelled_order_message(cancelled_order_message_sent, 255)
  :: else -> ramp_cancelled_order_message(cancelled_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancelled_order_message(cancelled_order_message_sent);
    assert(at == 117);
    at = 0;
    decode_cancelled_order_message(cancelled_order_message_got);
    assert(at == 117);
    equal_cancelled_order_message(cancelled_order_message_got, cancelled_order_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_trade_message()
  :: run check_index_message()
  :: run check_instrument_summary_message()
  :: run check_cancelled_trade_message()
  :: run check_closing_price_message()
  :: run check_projected_auction_auction_open_projected_close_price_message()
  :: run check_high_low_limit_modification_message()
  :: run check_instrument_state_message()
  :: run check_market_status_message()
  :: run check_order_message()
  :: run check_cancelled_order_message()
  fi
}
