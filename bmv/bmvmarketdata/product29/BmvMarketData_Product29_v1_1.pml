/*
 * Bolsa Mexicana de Valores Bmv Market Data Product 29
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 73

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- INTRA Multicast Header: 17 bytes ---------------------------------------- */

/* BMV INTRA Multicast Header */
typedef INTRAMulticastHeader {
  byte length[2];
  byte total_messages;
  byte market_data_group;
  byte session;
  byte sequence_number[4];
  byte datetime[8]
};

int i_n_t_r_a_multicast_header_at;

/* every byte of INTRA Multicast Header set to one value */
inline fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record, i_n_t_r_a_multicast_header_value) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_record.market_data_group = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_record.session = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of INTRA Multicast Header set to where it lies, so a field read out of place says so */
inline ramp_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record, i_n_t_r_a_multicast_header_base) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 0 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = (i_n_t_r_a_multicast_header_base + 2 + 1) % 256;
  i_n_t_r_a_multicast_header_record.market_data_group = (i_n_t_r_a_multicast_header_base + 3 + 1) % 256;
  i_n_t_r_a_multicast_header_record.session = (i_n_t_r_a_multicast_header_base + 4 + 1) % 256;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 5 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 9 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* INTRA Multicast Header to the wire, 17 bytes from where the cursor stands */
inline encode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> wire[at] = i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  wire[at] = i_n_t_r_a_multicast_header_record.total_messages; at = at + 1;
  wire[at] = i_n_t_r_a_multicast_header_record.market_data_group; at = at + 1;
  wire[at] = i_n_t_r_a_multicast_header_record.session; at = at + 1;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> wire[at] = i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> wire[at] = i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* INTRA Multicast Header off the wire, 17 bytes from where the cursor stands */
inline decode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_record.market_data_group = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_record.session = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of INTRA Multicast Header is what was written, byte for byte */
inline equal_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_read, i_n_t_r_a_multicast_header_written) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> assert(i_n_t_r_a_multicast_header_read.length[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.length[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  assert(i_n_t_r_a_multicast_header_read.total_messages == i_n_t_r_a_multicast_header_written.total_messages);
  assert(i_n_t_r_a_multicast_header_read.market_data_group == i_n_t_r_a_multicast_header_written.market_data_group);
  assert(i_n_t_r_a_multicast_header_read.session == i_n_t_r_a_multicast_header_written.session);
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> assert(i_n_t_r_a_multicast_header_read.sequence_number[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.sequence_number[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> assert(i_n_t_r_a_multicast_header_read.datetime[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.datetime[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Message length and message type */
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

/* ---- Last Quote Message: 23 bytes -------------------------------------------- */

/* Message sent by instrument when the best bid is modified in the electronic book by the Origin Exchange; denotes the side that is modified, the sale or the purchase. */
typedef LastQuoteMessage {
  byte instrument_number[4];
  byte origin;
  byte volume[8];
  byte price_rate[8];
  byte direction_of_the_bid;
  byte type_of_trading
};

int last_quote_message_at;

/* every byte of Last Quote Message set to one value */
inline fill_last_quote_message(last_quote_message_record, last_quote_message_value) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> last_quote_message_record.instrument_number[last_quote_message_at] = last_quote_message_value; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.origin = last_quote_message_value;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.volume[last_quote_message_at] = last_quote_message_value; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.price_rate[last_quote_message_at] = last_quote_message_value; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.direction_of_the_bid = last_quote_message_value;
  last_quote_message_record.type_of_trading = last_quote_message_value;
  skip
}

/* each byte of Last Quote Message set to where it lies, so a field read out of place says so */
inline ramp_last_quote_message(last_quote_message_record, last_quote_message_base) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> last_quote_message_record.instrument_number[last_quote_message_at] = (last_quote_message_base + 0 + last_quote_message_at + 1) % 256; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.origin = (last_quote_message_base + 4 + 1) % 256;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.volume[last_quote_message_at] = (last_quote_message_base + 5 + last_quote_message_at + 1) % 256; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.price_rate[last_quote_message_at] = (last_quote_message_base + 13 + last_quote_message_at + 1) % 256; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.direction_of_the_bid = (last_quote_message_base + 21 + 1) % 256;
  last_quote_message_record.type_of_trading = (last_quote_message_base + 22 + 1) % 256;
  skip
}

/* Last Quote Message to the wire, 23 bytes from where the cursor stands */
inline encode_last_quote_message(last_quote_message_record) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> wire[at] = last_quote_message_record.instrument_number[last_quote_message_at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = last_quote_message_record.origin; at = at + 1;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> wire[at] = last_quote_message_record.volume[last_quote_message_at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> wire[at] = last_quote_message_record.price_rate[last_quote_message_at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = last_quote_message_record.direction_of_the_bid; at = at + 1;
  wire[at] = last_quote_message_record.type_of_trading; at = at + 1;
  skip
}

/* Last Quote Message off the wire, 23 bytes from where the cursor stands */
inline decode_last_quote_message(last_quote_message_record) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> last_quote_message_record.instrument_number[last_quote_message_at] = wire[at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.origin = wire[at]; at = at + 1;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.volume[last_quote_message_at] = wire[at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.price_rate[last_quote_message_at] = wire[at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.direction_of_the_bid = wire[at]; at = at + 1;
  last_quote_message_record.type_of_trading = wire[at]; at = at + 1;
  skip
}

/* what was read of Last Quote Message is what was written, byte for byte */
inline equal_last_quote_message(last_quote_message_read, last_quote_message_written) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> assert(last_quote_message_read.instrument_number[last_quote_message_at] == last_quote_message_written.instrument_number[last_quote_message_at]); last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  assert(last_quote_message_read.origin == last_quote_message_written.origin);
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> assert(last_quote_message_read.volume[last_quote_message_at] == last_quote_message_written.volume[last_quote_message_at]); last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> assert(last_quote_message_read.price_rate[last_quote_message_at] == last_quote_message_written.price_rate[last_quote_message_at]); last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  assert(last_quote_message_read.direction_of_the_bid == last_quote_message_written.direction_of_the_bid);
  assert(last_quote_message_read.type_of_trading == last_quote_message_written.type_of_trading);
  skip
}

/* ---- Benchmark Trade Message: 25 bytes --------------------------------------- */

/* Trading statistics by trade. */
typedef BenchmarkTradeMessage {
  byte origin;
  byte average_volume[8];
  byte average_traded_value[8];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int benchmark_trade_message_at;

/* every byte of Benchmark Trade Message set to one value */
inline fill_benchmark_trade_message(benchmark_trade_message_record, benchmark_trade_message_value) {
  benchmark_trade_message_record.origin = benchmark_trade_message_value;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_volume[benchmark_trade_message_at] = benchmark_trade_message_value; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_traded_value[benchmark_trade_message_at] = benchmark_trade_message_value; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_record.market = benchmark_trade_message_value;
  benchmark_trade_message_record.sector = benchmark_trade_message_value;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> benchmark_trade_message_record.instrument_number[benchmark_trade_message_at] = benchmark_trade_message_value; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> benchmark_trade_message_record.indices[benchmark_trade_message_at] = benchmark_trade_message_value; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Benchmark Trade Message set to where it lies, so a field read out of place says so */
inline ramp_benchmark_trade_message(benchmark_trade_message_record, benchmark_trade_message_base) {
  benchmark_trade_message_record.origin = (benchmark_trade_message_base + 0 + 1) % 256;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_volume[benchmark_trade_message_at] = (benchmark_trade_message_base + 1 + benchmark_trade_message_at + 1) % 256; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_traded_value[benchmark_trade_message_at] = (benchmark_trade_message_base + 9 + benchmark_trade_message_at + 1) % 256; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_record.market = (benchmark_trade_message_base + 17 + 1) % 256;
  benchmark_trade_message_record.sector = (benchmark_trade_message_base + 18 + 1) % 256;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> benchmark_trade_message_record.instrument_number[benchmark_trade_message_at] = (benchmark_trade_message_base + 19 + benchmark_trade_message_at + 1) % 256; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> benchmark_trade_message_record.indices[benchmark_trade_message_at] = (benchmark_trade_message_base + 23 + benchmark_trade_message_at + 1) % 256; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Benchmark Trade Message to the wire, 25 bytes from where the cursor stands */
inline encode_benchmark_trade_message(benchmark_trade_message_record) {
  wire[at] = benchmark_trade_message_record.origin; at = at + 1;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> wire[at] = benchmark_trade_message_record.average_volume[benchmark_trade_message_at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> wire[at] = benchmark_trade_message_record.average_traded_value[benchmark_trade_message_at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = benchmark_trade_message_record.market; at = at + 1;
  wire[at] = benchmark_trade_message_record.sector; at = at + 1;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> wire[at] = benchmark_trade_message_record.instrument_number[benchmark_trade_message_at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> wire[at] = benchmark_trade_message_record.indices[benchmark_trade_message_at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Benchmark Trade Message off the wire, 25 bytes from where the cursor stands */
inline decode_benchmark_trade_message(benchmark_trade_message_record) {
  benchmark_trade_message_record.origin = wire[at]; at = at + 1;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_volume[benchmark_trade_message_at] = wire[at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_traded_value[benchmark_trade_message_at] = wire[at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_record.market = wire[at]; at = at + 1;
  benchmark_trade_message_record.sector = wire[at]; at = at + 1;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> benchmark_trade_message_record.instrument_number[benchmark_trade_message_at] = wire[at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> benchmark_trade_message_record.indices[benchmark_trade_message_at] = wire[at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Benchmark Trade Message is what was written, byte for byte */
inline equal_benchmark_trade_message(benchmark_trade_message_read, benchmark_trade_message_written) {
  assert(benchmark_trade_message_read.origin == benchmark_trade_message_written.origin);
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> assert(benchmark_trade_message_read.average_volume[benchmark_trade_message_at] == benchmark_trade_message_written.average_volume[benchmark_trade_message_at]); benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> assert(benchmark_trade_message_read.average_traded_value[benchmark_trade_message_at] == benchmark_trade_message_written.average_traded_value[benchmark_trade_message_at]); benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  assert(benchmark_trade_message_read.market == benchmark_trade_message_written.market);
  assert(benchmark_trade_message_read.sector == benchmark_trade_message_written.sector);
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> assert(benchmark_trade_message_read.instrument_number[benchmark_trade_message_at] == benchmark_trade_message_written.instrument_number[benchmark_trade_message_at]); benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> assert(benchmark_trade_message_read.indices[benchmark_trade_message_at] == benchmark_trade_message_written.indices[benchmark_trade_message_at]); benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Leaderboard Message: 33 bytes ------------------------------------- */

/* Measures time proportion that a stock Exchange maintains the best bid and (or) ask throughout the session. */
typedef PriceLeaderboardMessage {
  byte origin;
  byte t_best_bid[4];
  byte t_tie_best_bid[4];
  byte t_without_best_bid[4];
  byte t_best_ask[4];
  byte t_tie_best_ask[4];
  byte t_without_best_ask[4];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int price_leaderboard_message_at;

/* every byte of Price Leaderboard Message set to one value */
inline fill_price_leaderboard_message(price_leaderboard_message_record, price_leaderboard_message_value) {
  price_leaderboard_message_record.origin = price_leaderboard_message_value;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_bid[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_bid[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_bid[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_ask[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_ask[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_ask[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_record.market = price_leaderboard_message_value;
  price_leaderboard_message_record.sector = price_leaderboard_message_value;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.instrument_number[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> price_leaderboard_message_record.indices[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Leaderboard Message set to where it lies, so a field read out of place says so */
inline ramp_price_leaderboard_message(price_leaderboard_message_record, price_leaderboard_message_base) {
  price_leaderboard_message_record.origin = (price_leaderboard_message_base + 0 + 1) % 256;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_bid[price_leaderboard_message_at] = (price_leaderboard_message_base + 1 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_bid[price_leaderboard_message_at] = (price_leaderboard_message_base + 5 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_bid[price_leaderboard_message_at] = (price_leaderboard_message_base + 9 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_ask[price_leaderboard_message_at] = (price_leaderboard_message_base + 13 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_ask[price_leaderboard_message_at] = (price_leaderboard_message_base + 17 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_ask[price_leaderboard_message_at] = (price_leaderboard_message_base + 21 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_record.market = (price_leaderboard_message_base + 25 + 1) % 256;
  price_leaderboard_message_record.sector = (price_leaderboard_message_base + 26 + 1) % 256;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.instrument_number[price_leaderboard_message_at] = (price_leaderboard_message_base + 27 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> price_leaderboard_message_record.indices[price_leaderboard_message_at] = (price_leaderboard_message_base + 31 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Leaderboard Message to the wire, 33 bytes from where the cursor stands */
inline encode_price_leaderboard_message(price_leaderboard_message_record) {
  wire[at] = price_leaderboard_message_record.origin; at = at + 1;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_best_bid[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_tie_best_bid[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_without_best_bid[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_best_ask[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_tie_best_ask[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_without_best_ask[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  wire[at] = price_leaderboard_message_record.market; at = at + 1;
  wire[at] = price_leaderboard_message_record.sector; at = at + 1;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.instrument_number[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> wire[at] = price_leaderboard_message_record.indices[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Leaderboard Message off the wire, 33 bytes from where the cursor stands */
inline decode_price_leaderboard_message(price_leaderboard_message_record) {
  price_leaderboard_message_record.origin = wire[at]; at = at + 1;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_bid[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_bid[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_bid[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_ask[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_ask[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_ask[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_record.market = wire[at]; at = at + 1;
  price_leaderboard_message_record.sector = wire[at]; at = at + 1;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.instrument_number[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> price_leaderboard_message_record.indices[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Leaderboard Message is what was written, byte for byte */
inline equal_price_leaderboard_message(price_leaderboard_message_read, price_leaderboard_message_written) {
  assert(price_leaderboard_message_read.origin == price_leaderboard_message_written.origin);
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_best_bid[price_leaderboard_message_at] == price_leaderboard_message_written.t_best_bid[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_tie_best_bid[price_leaderboard_message_at] == price_leaderboard_message_written.t_tie_best_bid[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_without_best_bid[price_leaderboard_message_at] == price_leaderboard_message_written.t_without_best_bid[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_best_ask[price_leaderboard_message_at] == price_leaderboard_message_written.t_best_ask[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_tie_best_ask[price_leaderboard_message_at] == price_leaderboard_message_written.t_tie_best_ask[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_without_best_ask[price_leaderboard_message_at] == price_leaderboard_message_written.t_without_best_ask[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  assert(price_leaderboard_message_read.market == price_leaderboard_message_written.market);
  assert(price_leaderboard_message_read.sector == price_leaderboard_message_written.sector);
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.instrument_number[price_leaderboard_message_at] == price_leaderboard_message_written.instrument_number[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> assert(price_leaderboard_message_read.indices[price_leaderboard_message_at] == price_leaderboard_message_written.indices[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Sniper Message: 73 bytes ---------------------------------------- */

/* Quotes composition analysis, full and first ten depth levels */
typedef TradingSniperMessage {
  byte origin;
  byte depth_bid[8];
  byte depth_ask[8];
  byte depth_bid_10_l[8];
  byte depth_ask_10_l[8];
  byte vwp_bid_10_l[8];
  byte vwp_ask_10_l[8];
  byte vwp_bid[8];
  byte vwp_ask[8];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int trading_sniper_message_at;

/* every byte of Trading Sniper Message set to one value */
inline fill_trading_sniper_message(trading_sniper_message_record, trading_sniper_message_value) {
  trading_sniper_message_record.origin = trading_sniper_message_value;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_bid[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_ask[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_bid_10_l[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_ask_10_l[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_bid_10_l[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_ask_10_l[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_bid[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_ask[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_record.market = trading_sniper_message_value;
  trading_sniper_message_record.sector = trading_sniper_message_value;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 4 -> trading_sniper_message_record.instrument_number[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 2 -> trading_sniper_message_record.indices[trading_sniper_message_at] = trading_sniper_message_value; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Sniper Message set to where it lies, so a field read out of place says so */
inline ramp_trading_sniper_message(trading_sniper_message_record, trading_sniper_message_base) {
  trading_sniper_message_record.origin = (trading_sniper_message_base + 0 + 1) % 256;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_bid[trading_sniper_message_at] = (trading_sniper_message_base + 1 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_ask[trading_sniper_message_at] = (trading_sniper_message_base + 9 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_bid_10_l[trading_sniper_message_at] = (trading_sniper_message_base + 17 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_ask_10_l[trading_sniper_message_at] = (trading_sniper_message_base + 25 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_bid_10_l[trading_sniper_message_at] = (trading_sniper_message_base + 33 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_ask_10_l[trading_sniper_message_at] = (trading_sniper_message_base + 41 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_bid[trading_sniper_message_at] = (trading_sniper_message_base + 49 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_ask[trading_sniper_message_at] = (trading_sniper_message_base + 57 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_record.market = (trading_sniper_message_base + 65 + 1) % 256;
  trading_sniper_message_record.sector = (trading_sniper_message_base + 66 + 1) % 256;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 4 -> trading_sniper_message_record.instrument_number[trading_sniper_message_at] = (trading_sniper_message_base + 67 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 2 -> trading_sniper_message_record.indices[trading_sniper_message_at] = (trading_sniper_message_base + 71 + trading_sniper_message_at + 1) % 256; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Sniper Message to the wire, 73 bytes from where the cursor stands */
inline encode_trading_sniper_message(trading_sniper_message_record) {
  wire[at] = trading_sniper_message_record.origin; at = at + 1;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> wire[at] = trading_sniper_message_record.depth_bid[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> wire[at] = trading_sniper_message_record.depth_ask[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> wire[at] = trading_sniper_message_record.depth_bid_10_l[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> wire[at] = trading_sniper_message_record.depth_ask_10_l[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> wire[at] = trading_sniper_message_record.vwp_bid_10_l[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> wire[at] = trading_sniper_message_record.vwp_ask_10_l[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> wire[at] = trading_sniper_message_record.vwp_bid[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> wire[at] = trading_sniper_message_record.vwp_ask[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_sniper_message_record.market; at = at + 1;
  wire[at] = trading_sniper_message_record.sector; at = at + 1;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 4 -> wire[at] = trading_sniper_message_record.instrument_number[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 2 -> wire[at] = trading_sniper_message_record.indices[trading_sniper_message_at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Sniper Message off the wire, 73 bytes from where the cursor stands */
inline decode_trading_sniper_message(trading_sniper_message_record) {
  trading_sniper_message_record.origin = wire[at]; at = at + 1;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_bid[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_ask[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_bid_10_l[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.depth_ask_10_l[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_bid_10_l[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_ask_10_l[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_bid[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> trading_sniper_message_record.vwp_ask[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_record.market = wire[at]; at = at + 1;
  trading_sniper_message_record.sector = wire[at]; at = at + 1;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 4 -> trading_sniper_message_record.instrument_number[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 2 -> trading_sniper_message_record.indices[trading_sniper_message_at] = wire[at]; at = at + 1; trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Sniper Message is what was written, byte for byte */
inline equal_trading_sniper_message(trading_sniper_message_read, trading_sniper_message_written) {
  assert(trading_sniper_message_read.origin == trading_sniper_message_written.origin);
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> assert(trading_sniper_message_read.depth_bid[trading_sniper_message_at] == trading_sniper_message_written.depth_bid[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> assert(trading_sniper_message_read.depth_ask[trading_sniper_message_at] == trading_sniper_message_written.depth_ask[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> assert(trading_sniper_message_read.depth_bid_10_l[trading_sniper_message_at] == trading_sniper_message_written.depth_bid_10_l[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> assert(trading_sniper_message_read.depth_ask_10_l[trading_sniper_message_at] == trading_sniper_message_written.depth_ask_10_l[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> assert(trading_sniper_message_read.vwp_bid_10_l[trading_sniper_message_at] == trading_sniper_message_written.vwp_bid_10_l[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> assert(trading_sniper_message_read.vwp_ask_10_l[trading_sniper_message_at] == trading_sniper_message_written.vwp_ask_10_l[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> assert(trading_sniper_message_read.vwp_bid[trading_sniper_message_at] == trading_sniper_message_written.vwp_bid[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 8 -> assert(trading_sniper_message_read.vwp_ask[trading_sniper_message_at] == trading_sniper_message_written.vwp_ask[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  assert(trading_sniper_message_read.market == trading_sniper_message_written.market);
  assert(trading_sniper_message_read.sector == trading_sniper_message_written.sector);
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 4 -> assert(trading_sniper_message_read.instrument_number[trading_sniper_message_at] == trading_sniper_message_written.instrument_number[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  trading_sniper_message_at = 0;
  do
  :: trading_sniper_message_at < 2 -> assert(trading_sniper_message_read.indices[trading_sniper_message_at] == trading_sniper_message_written.indices[trading_sniper_message_at]); trading_sniper_message_at = trading_sniper_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Depth At Best Prices Message: 25 bytes ---------------------------------- */

/* Identify the deepest quotes depth for the national best bid and offer. */
typedef DepthAtBestPricesMessage {
  byte origin;
  byte instruments_bb[2];
  byte instruments_gv_bb[2];
  byte ratio_v_at_bb[4];
  byte instruments_ba[2];
  byte instruments_gv_ba[2];
  byte ratio_v_at_ba[4];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int depth_at_best_prices_message_at;

/* every byte of Depth At Best Prices Message set to one value */
inline fill_depth_at_best_prices_message(depth_at_best_prices_message_record, depth_at_best_prices_message_value) {
  depth_at_best_prices_message_record.origin = depth_at_best_prices_message_value;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_bb[depth_at_best_prices_message_at] = depth_at_best_prices_message_value; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_gv_bb[depth_at_best_prices_message_at] = depth_at_best_prices_message_value; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> depth_at_best_prices_message_record.ratio_v_at_bb[depth_at_best_prices_message_at] = depth_at_best_prices_message_value; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_ba[depth_at_best_prices_message_at] = depth_at_best_prices_message_value; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_gv_ba[depth_at_best_prices_message_at] = depth_at_best_prices_message_value; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> depth_at_best_prices_message_record.ratio_v_at_ba[depth_at_best_prices_message_at] = depth_at_best_prices_message_value; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_record.market = depth_at_best_prices_message_value;
  depth_at_best_prices_message_record.sector = depth_at_best_prices_message_value;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> depth_at_best_prices_message_record.instrument_number[depth_at_best_prices_message_at] = depth_at_best_prices_message_value; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.indices[depth_at_best_prices_message_at] = depth_at_best_prices_message_value; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Depth At Best Prices Message set to where it lies, so a field read out of place says so */
inline ramp_depth_at_best_prices_message(depth_at_best_prices_message_record, depth_at_best_prices_message_base) {
  depth_at_best_prices_message_record.origin = (depth_at_best_prices_message_base + 0 + 1) % 256;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_bb[depth_at_best_prices_message_at] = (depth_at_best_prices_message_base + 1 + depth_at_best_prices_message_at + 1) % 256; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_gv_bb[depth_at_best_prices_message_at] = (depth_at_best_prices_message_base + 3 + depth_at_best_prices_message_at + 1) % 256; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> depth_at_best_prices_message_record.ratio_v_at_bb[depth_at_best_prices_message_at] = (depth_at_best_prices_message_base + 5 + depth_at_best_prices_message_at + 1) % 256; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_ba[depth_at_best_prices_message_at] = (depth_at_best_prices_message_base + 9 + depth_at_best_prices_message_at + 1) % 256; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_gv_ba[depth_at_best_prices_message_at] = (depth_at_best_prices_message_base + 11 + depth_at_best_prices_message_at + 1) % 256; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> depth_at_best_prices_message_record.ratio_v_at_ba[depth_at_best_prices_message_at] = (depth_at_best_prices_message_base + 13 + depth_at_best_prices_message_at + 1) % 256; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_record.market = (depth_at_best_prices_message_base + 17 + 1) % 256;
  depth_at_best_prices_message_record.sector = (depth_at_best_prices_message_base + 18 + 1) % 256;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> depth_at_best_prices_message_record.instrument_number[depth_at_best_prices_message_at] = (depth_at_best_prices_message_base + 19 + depth_at_best_prices_message_at + 1) % 256; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.indices[depth_at_best_prices_message_at] = (depth_at_best_prices_message_base + 23 + depth_at_best_prices_message_at + 1) % 256; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* Depth At Best Prices Message to the wire, 25 bytes from where the cursor stands */
inline encode_depth_at_best_prices_message(depth_at_best_prices_message_record) {
  wire[at] = depth_at_best_prices_message_record.origin; at = at + 1;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> wire[at] = depth_at_best_prices_message_record.instruments_bb[depth_at_best_prices_message_at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> wire[at] = depth_at_best_prices_message_record.instruments_gv_bb[depth_at_best_prices_message_at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> wire[at] = depth_at_best_prices_message_record.ratio_v_at_bb[depth_at_best_prices_message_at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> wire[at] = depth_at_best_prices_message_record.instruments_ba[depth_at_best_prices_message_at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> wire[at] = depth_at_best_prices_message_record.instruments_gv_ba[depth_at_best_prices_message_at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> wire[at] = depth_at_best_prices_message_record.ratio_v_at_ba[depth_at_best_prices_message_at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  wire[at] = depth_at_best_prices_message_record.market; at = at + 1;
  wire[at] = depth_at_best_prices_message_record.sector; at = at + 1;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> wire[at] = depth_at_best_prices_message_record.instrument_number[depth_at_best_prices_message_at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> wire[at] = depth_at_best_prices_message_record.indices[depth_at_best_prices_message_at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* Depth At Best Prices Message off the wire, 25 bytes from where the cursor stands */
inline decode_depth_at_best_prices_message(depth_at_best_prices_message_record) {
  depth_at_best_prices_message_record.origin = wire[at]; at = at + 1;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_bb[depth_at_best_prices_message_at] = wire[at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_gv_bb[depth_at_best_prices_message_at] = wire[at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> depth_at_best_prices_message_record.ratio_v_at_bb[depth_at_best_prices_message_at] = wire[at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_ba[depth_at_best_prices_message_at] = wire[at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.instruments_gv_ba[depth_at_best_prices_message_at] = wire[at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> depth_at_best_prices_message_record.ratio_v_at_ba[depth_at_best_prices_message_at] = wire[at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_record.market = wire[at]; at = at + 1;
  depth_at_best_prices_message_record.sector = wire[at]; at = at + 1;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> depth_at_best_prices_message_record.instrument_number[depth_at_best_prices_message_at] = wire[at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> depth_at_best_prices_message_record.indices[depth_at_best_prices_message_at] = wire[at]; at = at + 1; depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Depth At Best Prices Message is what was written, byte for byte */
inline equal_depth_at_best_prices_message(depth_at_best_prices_message_read, depth_at_best_prices_message_written) {
  assert(depth_at_best_prices_message_read.origin == depth_at_best_prices_message_written.origin);
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> assert(depth_at_best_prices_message_read.instruments_bb[depth_at_best_prices_message_at] == depth_at_best_prices_message_written.instruments_bb[depth_at_best_prices_message_at]); depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> assert(depth_at_best_prices_message_read.instruments_gv_bb[depth_at_best_prices_message_at] == depth_at_best_prices_message_written.instruments_gv_bb[depth_at_best_prices_message_at]); depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> assert(depth_at_best_prices_message_read.ratio_v_at_bb[depth_at_best_prices_message_at] == depth_at_best_prices_message_written.ratio_v_at_bb[depth_at_best_prices_message_at]); depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> assert(depth_at_best_prices_message_read.instruments_ba[depth_at_best_prices_message_at] == depth_at_best_prices_message_written.instruments_ba[depth_at_best_prices_message_at]); depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> assert(depth_at_best_prices_message_read.instruments_gv_ba[depth_at_best_prices_message_at] == depth_at_best_prices_message_written.instruments_gv_ba[depth_at_best_prices_message_at]); depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> assert(depth_at_best_prices_message_read.ratio_v_at_ba[depth_at_best_prices_message_at] == depth_at_best_prices_message_written.ratio_v_at_ba[depth_at_best_prices_message_at]); depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  assert(depth_at_best_prices_message_read.market == depth_at_best_prices_message_written.market);
  assert(depth_at_best_prices_message_read.sector == depth_at_best_prices_message_written.sector);
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 4 -> assert(depth_at_best_prices_message_read.instrument_number[depth_at_best_prices_message_at] == depth_at_best_prices_message_written.instrument_number[depth_at_best_prices_message_at]); depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  depth_at_best_prices_message_at = 0;
  do
  :: depth_at_best_prices_message_at < 2 -> assert(depth_at_best_prices_message_read.indices[depth_at_best_prices_message_at] == depth_at_best_prices_message_written.indices[depth_at_best_prices_message_at]); depth_at_best_prices_message_at = depth_at_best_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* INTRA Multicast Header: encoded, read back, and compared */
proctype check_i_n_t_r_a_multicast_header() {
  INTRAMulticastHeader i_n_t_r_a_multicast_header_sent;
  INTRAMulticastHeader i_n_t_r_a_multicast_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 0)
  :: pattern == 1 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 32)
  :: pattern == 2 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 255)
  :: else -> ramp_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent);
    assert(at == 17);
    at = 0;
    decode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_got);
    assert(at == 17);
    equal_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_got, i_n_t_r_a_multicast_header_sent)
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

/* Last Quote Message: encoded, read back, and compared */
proctype check_last_quote_message() {
  LastQuoteMessage last_quote_message_sent;
  LastQuoteMessage last_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_last_quote_message(last_quote_message_sent, 0)
  :: pattern == 1 -> fill_last_quote_message(last_quote_message_sent, 32)
  :: pattern == 2 -> fill_last_quote_message(last_quote_message_sent, 255)
  :: else -> ramp_last_quote_message(last_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_last_quote_message(last_quote_message_sent);
    assert(at == 23);
    at = 0;
    decode_last_quote_message(last_quote_message_got);
    assert(at == 23);
    equal_last_quote_message(last_quote_message_got, last_quote_message_sent)
  }
}

/* Benchmark Trade Message: encoded, read back, and compared */
proctype check_benchmark_trade_message() {
  BenchmarkTradeMessage benchmark_trade_message_sent;
  BenchmarkTradeMessage benchmark_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_benchmark_trade_message(benchmark_trade_message_sent, 0)
  :: pattern == 1 -> fill_benchmark_trade_message(benchmark_trade_message_sent, 32)
  :: pattern == 2 -> fill_benchmark_trade_message(benchmark_trade_message_sent, 255)
  :: else -> ramp_benchmark_trade_message(benchmark_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_benchmark_trade_message(benchmark_trade_message_sent);
    assert(at == 25);
    at = 0;
    decode_benchmark_trade_message(benchmark_trade_message_got);
    assert(at == 25);
    equal_benchmark_trade_message(benchmark_trade_message_got, benchmark_trade_message_sent)
  }
}

/* Price Leaderboard Message: encoded, read back, and compared */
proctype check_price_leaderboard_message() {
  PriceLeaderboardMessage price_leaderboard_message_sent;
  PriceLeaderboardMessage price_leaderboard_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_leaderboard_message(price_leaderboard_message_sent, 0)
  :: pattern == 1 -> fill_price_leaderboard_message(price_leaderboard_message_sent, 32)
  :: pattern == 2 -> fill_price_leaderboard_message(price_leaderboard_message_sent, 255)
  :: else -> ramp_price_leaderboard_message(price_leaderboard_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_leaderboard_message(price_leaderboard_message_sent);
    assert(at == 33);
    at = 0;
    decode_price_leaderboard_message(price_leaderboard_message_got);
    assert(at == 33);
    equal_price_leaderboard_message(price_leaderboard_message_got, price_leaderboard_message_sent)
  }
}

/* Trading Sniper Message: encoded, read back, and compared */
proctype check_trading_sniper_message() {
  TradingSniperMessage trading_sniper_message_sent;
  TradingSniperMessage trading_sniper_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_sniper_message(trading_sniper_message_sent, 0)
  :: pattern == 1 -> fill_trading_sniper_message(trading_sniper_message_sent, 32)
  :: pattern == 2 -> fill_trading_sniper_message(trading_sniper_message_sent, 255)
  :: else -> ramp_trading_sniper_message(trading_sniper_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_sniper_message(trading_sniper_message_sent);
    assert(at == 73);
    at = 0;
    decode_trading_sniper_message(trading_sniper_message_got);
    assert(at == 73);
    equal_trading_sniper_message(trading_sniper_message_got, trading_sniper_message_sent)
  }
}

/* Depth At Best Prices Message: encoded, read back, and compared */
proctype check_depth_at_best_prices_message() {
  DepthAtBestPricesMessage depth_at_best_prices_message_sent;
  DepthAtBestPricesMessage depth_at_best_prices_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_depth_at_best_prices_message(depth_at_best_prices_message_sent, 0)
  :: pattern == 1 -> fill_depth_at_best_prices_message(depth_at_best_prices_message_sent, 32)
  :: pattern == 2 -> fill_depth_at_best_prices_message(depth_at_best_prices_message_sent, 255)
  :: else -> ramp_depth_at_best_prices_message(depth_at_best_prices_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_depth_at_best_prices_message(depth_at_best_prices_message_sent);
    assert(at == 25);
    at = 0;
    decode_depth_at_best_prices_message(depth_at_best_prices_message_got);
    assert(at == 25);
    equal_depth_at_best_prices_message(depth_at_best_prices_message_got, depth_at_best_prices_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_i_n_t_r_a_multicast_header()
  :: run check_message_header()
  :: run check_last_quote_message()
  :: run check_benchmark_trade_message()
  :: run check_price_leaderboard_message()
  :: run check_trading_sniper_message()
  :: run check_depth_at_best_prices_message()
  fi
}
