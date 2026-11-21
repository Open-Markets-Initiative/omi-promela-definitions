/*
 * Australian Securities Exchange Trade Market Data Feed
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
#define WIRE 366

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

/* ---- Seconds Message: 4 bytes ------------------------------------------------ */

/* Sent every second for which at least one MDF message is being generated. */
typedef SecondsMessage {
  byte second[4]
};

int seconds_message_at;

/* every byte of Seconds Message set to one value */
inline fill_seconds_message(seconds_message_record, seconds_message_value) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.second[seconds_message_at] = seconds_message_value; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Seconds Message set to where it lies, so a field read out of place says so */
inline ramp_seconds_message(seconds_message_record, seconds_message_base) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.second[seconds_message_at] = (seconds_message_base + 0 + seconds_message_at + 1) % 256; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message to the wire, 4 bytes from where the cursor stands */
inline encode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> wire[at] = seconds_message_record.second[seconds_message_at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message off the wire, 4 bytes from where the cursor stands */
inline decode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.second[seconds_message_at] = wire[at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Seconds Message is what was written, byte for byte */
inline equal_seconds_message(seconds_message_read, seconds_message_written) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> assert(seconds_message_read.second[seconds_message_at] == seconds_message_written.second[seconds_message_at]); seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book Directory Message: 366 bytes --------------------------------- */

/* Disseminated at the start of each trading day for all active securities, including halted securities. */
typedef OrderBookDirectoryMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte partition_id;
  byte symbol[32];
  byte long_name[32];
  byte isin[12];
  byte asset_name[32];
  byte financial_product;
  byte trading_currency[3];
  byte number_of_decimals_in_price[2];
  byte number_of_decimals_in_nominal_value[2];
  byte round_lot_size[4];
  byte nominal_value[8];
  byte number_of_legs;
  byte commodity_code[4];
  byte strike_price[8];
  byte expiration_date[4];
  byte number_of_decimals_in_strike_price[2];
  byte option_type;
  byte market_id[4];
  byte exchange_id[4];
  byte number_of_decimals_in[2];
  byte sector_code[4];
  byte number_of_tradable_equities[8];
  byte number_of_outstanding_equities[8];
  byte last_traded_date[4];
  byte contract_multiplier[8];
  byte multiplier[8];
  byte decimals_in_multiplier[2];
  byte min_order_quantity[8];
  byte max_order_quantity[8];
  byte number_of_settlement_days[4];
  byte primary;
  byte test_order_book;
  byte alias_name[32];
  byte settlement_date[4];
  byte tradable;
  byte externally_price_sourced;
  byte deliverable;
  byte price_unit;
  byte issuer[32];
  byte foreign_ownership_restriction;
  byte last_trading_time[6];
  byte option_style;
  byte minimum_value_for_initial_trade_report[8];
  byte cfi_code[6];
  byte upper_level_series[32];
  byte upper_series_level_order_book_id[4];
  byte instrument_type[4];
  byte status
};

int order_book_directory_message_at;

/* every byte of Order Book Directory Message set to one value */
inline fill_order_book_directory_message(order_book_directory_message_record, order_book_directory_message_value) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.timestamp_nanoseconds[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.order_book_id[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.partition_id = order_book_directory_message_value;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.symbol[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.long_name[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> order_book_directory_message_record.isin[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.asset_name[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.financial_product = order_book_directory_message_value;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> order_book_directory_message_record.trading_currency[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_price[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_nominal_value[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.round_lot_size[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.nominal_value[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.number_of_legs = order_book_directory_message_value;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.commodity_code[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.strike_price[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.expiration_date[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_strike_price[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.option_type = order_book_directory_message_value;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.market_id[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.exchange_id[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.sector_code[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.number_of_tradable_equities[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.number_of_outstanding_equities[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.last_traded_date[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.contract_multiplier[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.multiplier[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.decimals_in_multiplier[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.min_order_quantity[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.max_order_quantity[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.number_of_settlement_days[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.primary = order_book_directory_message_value;
  order_book_directory_message_record.test_order_book = order_book_directory_message_value;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.alias_name[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.settlement_date[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.tradable = order_book_directory_message_value;
  order_book_directory_message_record.externally_price_sourced = order_book_directory_message_value;
  order_book_directory_message_record.deliverable = order_book_directory_message_value;
  order_book_directory_message_record.price_unit = order_book_directory_message_value;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.issuer[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.foreign_ownership_restriction = order_book_directory_message_value;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> order_book_directory_message_record.last_trading_time[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.option_style = order_book_directory_message_value;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.minimum_value_for_initial_trade_report[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> order_book_directory_message_record.cfi_code[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.upper_level_series[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.upper_series_level_order_book_id[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.instrument_type[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.status = order_book_directory_message_value;
  skip
}

/* each byte of Order Book Directory Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_directory_message(order_book_directory_message_record, order_book_directory_message_base) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.timestamp_nanoseconds[order_book_directory_message_at] = (order_book_directory_message_base + 0 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.order_book_id[order_book_directory_message_at] = (order_book_directory_message_base + 4 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.partition_id = (order_book_directory_message_base + 8 + 1) % 256;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.symbol[order_book_directory_message_at] = (order_book_directory_message_base + 9 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.long_name[order_book_directory_message_at] = (order_book_directory_message_base + 41 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> order_book_directory_message_record.isin[order_book_directory_message_at] = (order_book_directory_message_base + 73 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.asset_name[order_book_directory_message_at] = (order_book_directory_message_base + 85 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.financial_product = (order_book_directory_message_base + 117 + 1) % 256;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> order_book_directory_message_record.trading_currency[order_book_directory_message_at] = (order_book_directory_message_base + 118 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_price[order_book_directory_message_at] = (order_book_directory_message_base + 121 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_nominal_value[order_book_directory_message_at] = (order_book_directory_message_base + 123 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.round_lot_size[order_book_directory_message_at] = (order_book_directory_message_base + 125 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.nominal_value[order_book_directory_message_at] = (order_book_directory_message_base + 129 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.number_of_legs = (order_book_directory_message_base + 137 + 1) % 256;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.commodity_code[order_book_directory_message_at] = (order_book_directory_message_base + 138 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.strike_price[order_book_directory_message_at] = (order_book_directory_message_base + 142 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.expiration_date[order_book_directory_message_at] = (order_book_directory_message_base + 150 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_strike_price[order_book_directory_message_at] = (order_book_directory_message_base + 154 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.option_type = (order_book_directory_message_base + 156 + 1) % 256;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.market_id[order_book_directory_message_at] = (order_book_directory_message_base + 157 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.exchange_id[order_book_directory_message_at] = (order_book_directory_message_base + 161 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in[order_book_directory_message_at] = (order_book_directory_message_base + 165 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.sector_code[order_book_directory_message_at] = (order_book_directory_message_base + 167 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.number_of_tradable_equities[order_book_directory_message_at] = (order_book_directory_message_base + 171 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.number_of_outstanding_equities[order_book_directory_message_at] = (order_book_directory_message_base + 179 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.last_traded_date[order_book_directory_message_at] = (order_book_directory_message_base + 187 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.contract_multiplier[order_book_directory_message_at] = (order_book_directory_message_base + 191 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.multiplier[order_book_directory_message_at] = (order_book_directory_message_base + 199 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.decimals_in_multiplier[order_book_directory_message_at] = (order_book_directory_message_base + 207 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.min_order_quantity[order_book_directory_message_at] = (order_book_directory_message_base + 209 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.max_order_quantity[order_book_directory_message_at] = (order_book_directory_message_base + 217 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.number_of_settlement_days[order_book_directory_message_at] = (order_book_directory_message_base + 225 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.primary = (order_book_directory_message_base + 229 + 1) % 256;
  order_book_directory_message_record.test_order_book = (order_book_directory_message_base + 230 + 1) % 256;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.alias_name[order_book_directory_message_at] = (order_book_directory_message_base + 231 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.settlement_date[order_book_directory_message_at] = (order_book_directory_message_base + 263 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.tradable = (order_book_directory_message_base + 267 + 1) % 256;
  order_book_directory_message_record.externally_price_sourced = (order_book_directory_message_base + 268 + 1) % 256;
  order_book_directory_message_record.deliverable = (order_book_directory_message_base + 269 + 1) % 256;
  order_book_directory_message_record.price_unit = (order_book_directory_message_base + 270 + 1) % 256;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.issuer[order_book_directory_message_at] = (order_book_directory_message_base + 271 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.foreign_ownership_restriction = (order_book_directory_message_base + 303 + 1) % 256;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> order_book_directory_message_record.last_trading_time[order_book_directory_message_at] = (order_book_directory_message_base + 304 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.option_style = (order_book_directory_message_base + 310 + 1) % 256;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.minimum_value_for_initial_trade_report[order_book_directory_message_at] = (order_book_directory_message_base + 311 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> order_book_directory_message_record.cfi_code[order_book_directory_message_at] = (order_book_directory_message_base + 319 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.upper_level_series[order_book_directory_message_at] = (order_book_directory_message_base + 325 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.upper_series_level_order_book_id[order_book_directory_message_at] = (order_book_directory_message_base + 357 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.instrument_type[order_book_directory_message_at] = (order_book_directory_message_base + 361 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.status = (order_book_directory_message_base + 365 + 1) % 256;
  skip
}

/* Order Book Directory Message to the wire, 366 bytes from where the cursor stands */
inline encode_order_book_directory_message(order_book_directory_message_record) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.timestamp_nanoseconds[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.order_book_id[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.partition_id; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> wire[at] = order_book_directory_message_record.symbol[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> wire[at] = order_book_directory_message_record.long_name[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> wire[at] = order_book_directory_message_record.isin[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> wire[at] = order_book_directory_message_record.asset_name[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.financial_product; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> wire[at] = order_book_directory_message_record.trading_currency[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> wire[at] = order_book_directory_message_record.number_of_decimals_in_price[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> wire[at] = order_book_directory_message_record.number_of_decimals_in_nominal_value[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.round_lot_size[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.nominal_value[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.number_of_legs; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.commodity_code[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.strike_price[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.expiration_date[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> wire[at] = order_book_directory_message_record.number_of_decimals_in_strike_price[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.option_type; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.market_id[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.exchange_id[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> wire[at] = order_book_directory_message_record.number_of_decimals_in[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.sector_code[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.number_of_tradable_equities[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.number_of_outstanding_equities[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.last_traded_date[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.contract_multiplier[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.multiplier[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> wire[at] = order_book_directory_message_record.decimals_in_multiplier[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.min_order_quantity[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.max_order_quantity[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.number_of_settlement_days[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.primary; at = at + 1;
  wire[at] = order_book_directory_message_record.test_order_book; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> wire[at] = order_book_directory_message_record.alias_name[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.settlement_date[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.tradable; at = at + 1;
  wire[at] = order_book_directory_message_record.externally_price_sourced; at = at + 1;
  wire[at] = order_book_directory_message_record.deliverable; at = at + 1;
  wire[at] = order_book_directory_message_record.price_unit; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> wire[at] = order_book_directory_message_record.issuer[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.foreign_ownership_restriction; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> wire[at] = order_book_directory_message_record.last_trading_time[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.option_style; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.minimum_value_for_initial_trade_report[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> wire[at] = order_book_directory_message_record.cfi_code[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> wire[at] = order_book_directory_message_record.upper_level_series[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.upper_series_level_order_book_id[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.instrument_type[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.status; at = at + 1;
  skip
}

/* Order Book Directory Message off the wire, 366 bytes from where the cursor stands */
inline decode_order_book_directory_message(order_book_directory_message_record) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.timestamp_nanoseconds[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.order_book_id[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.partition_id = wire[at]; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.symbol[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.long_name[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> order_book_directory_message_record.isin[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.asset_name[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.financial_product = wire[at]; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> order_book_directory_message_record.trading_currency[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_price[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_nominal_value[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.round_lot_size[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.nominal_value[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.number_of_legs = wire[at]; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.commodity_code[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.strike_price[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.expiration_date[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_strike_price[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.option_type = wire[at]; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.market_id[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.exchange_id[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.sector_code[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.number_of_tradable_equities[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.number_of_outstanding_equities[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.last_traded_date[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.contract_multiplier[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.multiplier[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.decimals_in_multiplier[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.min_order_quantity[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.max_order_quantity[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.number_of_settlement_days[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.primary = wire[at]; at = at + 1;
  order_book_directory_message_record.test_order_book = wire[at]; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.alias_name[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.settlement_date[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.tradable = wire[at]; at = at + 1;
  order_book_directory_message_record.externally_price_sourced = wire[at]; at = at + 1;
  order_book_directory_message_record.deliverable = wire[at]; at = at + 1;
  order_book_directory_message_record.price_unit = wire[at]; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.issuer[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.foreign_ownership_restriction = wire[at]; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> order_book_directory_message_record.last_trading_time[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.option_style = wire[at]; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.minimum_value_for_initial_trade_report[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> order_book_directory_message_record.cfi_code[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.upper_level_series[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.upper_series_level_order_book_id[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.instrument_type[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Book Directory Message is what was written, byte for byte */
inline equal_order_book_directory_message(order_book_directory_message_read, order_book_directory_message_written) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.timestamp_nanoseconds[order_book_directory_message_at] == order_book_directory_message_written.timestamp_nanoseconds[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.order_book_id[order_book_directory_message_at] == order_book_directory_message_written.order_book_id[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.partition_id == order_book_directory_message_written.partition_id);
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> assert(order_book_directory_message_read.symbol[order_book_directory_message_at] == order_book_directory_message_written.symbol[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> assert(order_book_directory_message_read.long_name[order_book_directory_message_at] == order_book_directory_message_written.long_name[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> assert(order_book_directory_message_read.isin[order_book_directory_message_at] == order_book_directory_message_written.isin[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> assert(order_book_directory_message_read.asset_name[order_book_directory_message_at] == order_book_directory_message_written.asset_name[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.financial_product == order_book_directory_message_written.financial_product);
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> assert(order_book_directory_message_read.trading_currency[order_book_directory_message_at] == order_book_directory_message_written.trading_currency[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> assert(order_book_directory_message_read.number_of_decimals_in_price[order_book_directory_message_at] == order_book_directory_message_written.number_of_decimals_in_price[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> assert(order_book_directory_message_read.number_of_decimals_in_nominal_value[order_book_directory_message_at] == order_book_directory_message_written.number_of_decimals_in_nominal_value[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.round_lot_size[order_book_directory_message_at] == order_book_directory_message_written.round_lot_size[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.nominal_value[order_book_directory_message_at] == order_book_directory_message_written.nominal_value[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.number_of_legs == order_book_directory_message_written.number_of_legs);
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.commodity_code[order_book_directory_message_at] == order_book_directory_message_written.commodity_code[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.strike_price[order_book_directory_message_at] == order_book_directory_message_written.strike_price[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.expiration_date[order_book_directory_message_at] == order_book_directory_message_written.expiration_date[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> assert(order_book_directory_message_read.number_of_decimals_in_strike_price[order_book_directory_message_at] == order_book_directory_message_written.number_of_decimals_in_strike_price[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.option_type == order_book_directory_message_written.option_type);
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.market_id[order_book_directory_message_at] == order_book_directory_message_written.market_id[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.exchange_id[order_book_directory_message_at] == order_book_directory_message_written.exchange_id[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> assert(order_book_directory_message_read.number_of_decimals_in[order_book_directory_message_at] == order_book_directory_message_written.number_of_decimals_in[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.sector_code[order_book_directory_message_at] == order_book_directory_message_written.sector_code[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.number_of_tradable_equities[order_book_directory_message_at] == order_book_directory_message_written.number_of_tradable_equities[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.number_of_outstanding_equities[order_book_directory_message_at] == order_book_directory_message_written.number_of_outstanding_equities[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.last_traded_date[order_book_directory_message_at] == order_book_directory_message_written.last_traded_date[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.contract_multiplier[order_book_directory_message_at] == order_book_directory_message_written.contract_multiplier[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.multiplier[order_book_directory_message_at] == order_book_directory_message_written.multiplier[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> assert(order_book_directory_message_read.decimals_in_multiplier[order_book_directory_message_at] == order_book_directory_message_written.decimals_in_multiplier[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.min_order_quantity[order_book_directory_message_at] == order_book_directory_message_written.min_order_quantity[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.max_order_quantity[order_book_directory_message_at] == order_book_directory_message_written.max_order_quantity[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.number_of_settlement_days[order_book_directory_message_at] == order_book_directory_message_written.number_of_settlement_days[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.primary == order_book_directory_message_written.primary);
  assert(order_book_directory_message_read.test_order_book == order_book_directory_message_written.test_order_book);
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> assert(order_book_directory_message_read.alias_name[order_book_directory_message_at] == order_book_directory_message_written.alias_name[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.settlement_date[order_book_directory_message_at] == order_book_directory_message_written.settlement_date[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.tradable == order_book_directory_message_written.tradable);
  assert(order_book_directory_message_read.externally_price_sourced == order_book_directory_message_written.externally_price_sourced);
  assert(order_book_directory_message_read.deliverable == order_book_directory_message_written.deliverable);
  assert(order_book_directory_message_read.price_unit == order_book_directory_message_written.price_unit);
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> assert(order_book_directory_message_read.issuer[order_book_directory_message_at] == order_book_directory_message_written.issuer[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.foreign_ownership_restriction == order_book_directory_message_written.foreign_ownership_restriction);
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> assert(order_book_directory_message_read.last_trading_time[order_book_directory_message_at] == order_book_directory_message_written.last_trading_time[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.option_style == order_book_directory_message_written.option_style);
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.minimum_value_for_initial_trade_report[order_book_directory_message_at] == order_book_directory_message_written.minimum_value_for_initial_trade_report[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 6 -> assert(order_book_directory_message_read.cfi_code[order_book_directory_message_at] == order_book_directory_message_written.cfi_code[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> assert(order_book_directory_message_read.upper_level_series[order_book_directory_message_at] == order_book_directory_message_written.upper_level_series[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.upper_series_level_order_book_id[order_book_directory_message_at] == order_book_directory_message_written.upper_series_level_order_book_id[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.instrument_type[order_book_directory_message_at] == order_book_directory_message_written.instrument_type[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.status == order_book_directory_message_written.status);
  skip
}

/* ---- Exchange Directory Message: 40 bytes ------------------------------------ */

/* Disseminated at the start of each trading day for all active Exchanges in the system. */
typedef ExchangeDirectoryMessage {
  byte timestamp_nanoseconds[4];
  byte exchange_id[4];
  byte exchange_name[32]
};

int exchange_directory_message_at;

/* every byte of Exchange Directory Message set to one value */
inline fill_exchange_directory_message(exchange_directory_message_record, exchange_directory_message_value) {
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> exchange_directory_message_record.timestamp_nanoseconds[exchange_directory_message_at] = exchange_directory_message_value; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> exchange_directory_message_record.exchange_id[exchange_directory_message_at] = exchange_directory_message_value; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 32 -> exchange_directory_message_record.exchange_name[exchange_directory_message_at] = exchange_directory_message_value; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Exchange Directory Message set to where it lies, so a field read out of place says so */
inline ramp_exchange_directory_message(exchange_directory_message_record, exchange_directory_message_base) {
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> exchange_directory_message_record.timestamp_nanoseconds[exchange_directory_message_at] = (exchange_directory_message_base + 0 + exchange_directory_message_at + 1) % 256; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> exchange_directory_message_record.exchange_id[exchange_directory_message_at] = (exchange_directory_message_base + 4 + exchange_directory_message_at + 1) % 256; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 32 -> exchange_directory_message_record.exchange_name[exchange_directory_message_at] = (exchange_directory_message_base + 8 + exchange_directory_message_at + 1) % 256; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Exchange Directory Message to the wire, 40 bytes from where the cursor stands */
inline encode_exchange_directory_message(exchange_directory_message_record) {
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> wire[at] = exchange_directory_message_record.timestamp_nanoseconds[exchange_directory_message_at]; at = at + 1; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> wire[at] = exchange_directory_message_record.exchange_id[exchange_directory_message_at]; at = at + 1; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 32 -> wire[at] = exchange_directory_message_record.exchange_name[exchange_directory_message_at]; at = at + 1; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Exchange Directory Message off the wire, 40 bytes from where the cursor stands */
inline decode_exchange_directory_message(exchange_directory_message_record) {
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> exchange_directory_message_record.timestamp_nanoseconds[exchange_directory_message_at] = wire[at]; at = at + 1; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> exchange_directory_message_record.exchange_id[exchange_directory_message_at] = wire[at]; at = at + 1; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 32 -> exchange_directory_message_record.exchange_name[exchange_directory_message_at] = wire[at]; at = at + 1; exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Exchange Directory Message is what was written, byte for byte */
inline equal_exchange_directory_message(exchange_directory_message_read, exchange_directory_message_written) {
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> assert(exchange_directory_message_read.timestamp_nanoseconds[exchange_directory_message_at] == exchange_directory_message_written.timestamp_nanoseconds[exchange_directory_message_at]); exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 4 -> assert(exchange_directory_message_read.exchange_id[exchange_directory_message_at] == exchange_directory_message_written.exchange_id[exchange_directory_message_at]); exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  exchange_directory_message_at = 0;
  do
  :: exchange_directory_message_at < 32 -> assert(exchange_directory_message_read.exchange_name[exchange_directory_message_at] == exchange_directory_message_written.exchange_name[exchange_directory_message_at]); exchange_directory_message_at = exchange_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Directory Message: 42 bytes -------------------------------------- */

/* Disseminated at the start of each trading day for all active Markets in the system. */
typedef MarketDirectoryMessage {
  byte timestamp_nanoseconds[4];
  byte market_id[4];
  byte market_name[32];
  byte market_type;
  byte index_market
};

int market_directory_message_at;

/* every byte of Market Directory Message set to one value */
inline fill_market_directory_message(market_directory_message_record, market_directory_message_value) {
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> market_directory_message_record.timestamp_nanoseconds[market_directory_message_at] = market_directory_message_value; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> market_directory_message_record.market_id[market_directory_message_at] = market_directory_message_value; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 32 -> market_directory_message_record.market_name[market_directory_message_at] = market_directory_message_value; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_record.market_type = market_directory_message_value;
  market_directory_message_record.index_market = market_directory_message_value;
  skip
}

/* each byte of Market Directory Message set to where it lies, so a field read out of place says so */
inline ramp_market_directory_message(market_directory_message_record, market_directory_message_base) {
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> market_directory_message_record.timestamp_nanoseconds[market_directory_message_at] = (market_directory_message_base + 0 + market_directory_message_at + 1) % 256; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> market_directory_message_record.market_id[market_directory_message_at] = (market_directory_message_base + 4 + market_directory_message_at + 1) % 256; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 32 -> market_directory_message_record.market_name[market_directory_message_at] = (market_directory_message_base + 8 + market_directory_message_at + 1) % 256; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_record.market_type = (market_directory_message_base + 40 + 1) % 256;
  market_directory_message_record.index_market = (market_directory_message_base + 41 + 1) % 256;
  skip
}

/* Market Directory Message to the wire, 42 bytes from where the cursor stands */
inline encode_market_directory_message(market_directory_message_record) {
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> wire[at] = market_directory_message_record.timestamp_nanoseconds[market_directory_message_at]; at = at + 1; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> wire[at] = market_directory_message_record.market_id[market_directory_message_at]; at = at + 1; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 32 -> wire[at] = market_directory_message_record.market_name[market_directory_message_at]; at = at + 1; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = market_directory_message_record.market_type; at = at + 1;
  wire[at] = market_directory_message_record.index_market; at = at + 1;
  skip
}

/* Market Directory Message off the wire, 42 bytes from where the cursor stands */
inline decode_market_directory_message(market_directory_message_record) {
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> market_directory_message_record.timestamp_nanoseconds[market_directory_message_at] = wire[at]; at = at + 1; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> market_directory_message_record.market_id[market_directory_message_at] = wire[at]; at = at + 1; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 32 -> market_directory_message_record.market_name[market_directory_message_at] = wire[at]; at = at + 1; market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_record.market_type = wire[at]; at = at + 1;
  market_directory_message_record.index_market = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Directory Message is what was written, byte for byte */
inline equal_market_directory_message(market_directory_message_read, market_directory_message_written) {
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> assert(market_directory_message_read.timestamp_nanoseconds[market_directory_message_at] == market_directory_message_written.timestamp_nanoseconds[market_directory_message_at]); market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 4 -> assert(market_directory_message_read.market_id[market_directory_message_at] == market_directory_message_written.market_id[market_directory_message_at]); market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  market_directory_message_at = 0;
  do
  :: market_directory_message_at < 32 -> assert(market_directory_message_read.market_name[market_directory_message_at] == market_directory_message_written.market_name[market_directory_message_at]); market_directory_message_at = market_directory_message_at + 1
  :: else -> break
  od;
  assert(market_directory_message_read.market_type == market_directory_message_written.market_type);
  assert(market_directory_message_read.index_market == market_directory_message_written.index_market);
  skip
}

/* ---- Combination Order Book Leg Directory Message: 17 bytes ------------------ */

/* Provides a mapping between a combination order book and one of the combination leg order books. */
typedef CombinationOrderBookLegDirectoryMessage {
  byte timestamp_nanoseconds[4];
  byte combination_order_book_id[4];
  byte leg_order_book_id[4];
  byte leg_side;
  byte leg_ratio[4]
};

int combination_order_book_leg_directory_message_at;

/* every byte of Combination Order Book Leg Directory Message set to one value */
inline fill_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_record, combination_order_book_leg_directory_message_value) {
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.timestamp_nanoseconds[combination_order_book_leg_directory_message_at] = combination_order_book_leg_directory_message_value; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.combination_order_book_id[combination_order_book_leg_directory_message_at] = combination_order_book_leg_directory_message_value; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.leg_order_book_id[combination_order_book_leg_directory_message_at] = combination_order_book_leg_directory_message_value; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_record.leg_side = combination_order_book_leg_directory_message_value;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.leg_ratio[combination_order_book_leg_directory_message_at] = combination_order_book_leg_directory_message_value; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Combination Order Book Leg Directory Message set to where it lies, so a field read out of place says so */
inline ramp_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_record, combination_order_book_leg_directory_message_base) {
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.timestamp_nanoseconds[combination_order_book_leg_directory_message_at] = (combination_order_book_leg_directory_message_base + 0 + combination_order_book_leg_directory_message_at + 1) % 256; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.combination_order_book_id[combination_order_book_leg_directory_message_at] = (combination_order_book_leg_directory_message_base + 4 + combination_order_book_leg_directory_message_at + 1) % 256; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.leg_order_book_id[combination_order_book_leg_directory_message_at] = (combination_order_book_leg_directory_message_base + 8 + combination_order_book_leg_directory_message_at + 1) % 256; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_record.leg_side = (combination_order_book_leg_directory_message_base + 12 + 1) % 256;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.leg_ratio[combination_order_book_leg_directory_message_at] = (combination_order_book_leg_directory_message_base + 13 + combination_order_book_leg_directory_message_at + 1) % 256; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Order Book Leg Directory Message to the wire, 17 bytes from where the cursor stands */
inline encode_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_record) {
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> wire[at] = combination_order_book_leg_directory_message_record.timestamp_nanoseconds[combination_order_book_leg_directory_message_at]; at = at + 1; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> wire[at] = combination_order_book_leg_directory_message_record.combination_order_book_id[combination_order_book_leg_directory_message_at]; at = at + 1; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> wire[at] = combination_order_book_leg_directory_message_record.leg_order_book_id[combination_order_book_leg_directory_message_at]; at = at + 1; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_book_leg_directory_message_record.leg_side; at = at + 1;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> wire[at] = combination_order_book_leg_directory_message_record.leg_ratio[combination_order_book_leg_directory_message_at]; at = at + 1; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Order Book Leg Directory Message off the wire, 17 bytes from where the cursor stands */
inline decode_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_record) {
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.timestamp_nanoseconds[combination_order_book_leg_directory_message_at] = wire[at]; at = at + 1; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.combination_order_book_id[combination_order_book_leg_directory_message_at] = wire[at]; at = at + 1; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.leg_order_book_id[combination_order_book_leg_directory_message_at] = wire[at]; at = at + 1; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_record.leg_side = wire[at]; at = at + 1;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> combination_order_book_leg_directory_message_record.leg_ratio[combination_order_book_leg_directory_message_at] = wire[at]; at = at + 1; combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Combination Order Book Leg Directory Message is what was written, byte for byte */
inline equal_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_read, combination_order_book_leg_directory_message_written) {
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> assert(combination_order_book_leg_directory_message_read.timestamp_nanoseconds[combination_order_book_leg_directory_message_at] == combination_order_book_leg_directory_message_written.timestamp_nanoseconds[combination_order_book_leg_directory_message_at]); combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> assert(combination_order_book_leg_directory_message_read.combination_order_book_id[combination_order_book_leg_directory_message_at] == combination_order_book_leg_directory_message_written.combination_order_book_id[combination_order_book_leg_directory_message_at]); combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> assert(combination_order_book_leg_directory_message_read.leg_order_book_id[combination_order_book_leg_directory_message_at] == combination_order_book_leg_directory_message_written.leg_order_book_id[combination_order_book_leg_directory_message_at]); combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  assert(combination_order_book_leg_directory_message_read.leg_side == combination_order_book_leg_directory_message_written.leg_side);
  combination_order_book_leg_directory_message_at = 0;
  do
  :: combination_order_book_leg_directory_message_at < 4 -> assert(combination_order_book_leg_directory_message_read.leg_ratio[combination_order_book_leg_directory_message_at] == combination_order_book_leg_directory_message_written.leg_ratio[combination_order_book_leg_directory_message_at]); combination_order_book_leg_directory_message_at = combination_order_book_leg_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick Size Table Entry Message: 32 bytes --------------------------------- */

/* Contains information on a tick size for a price range. */
typedef TickSizeTableEntryMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte tick_size[8];
  byte price_from[8];
  byte price_to[8]
};

int tick_size_table_entry_message_at;

/* every byte of Tick Size Table Entry Message set to one value */
inline fill_tick_size_table_entry_message(tick_size_table_entry_message_record, tick_size_table_entry_message_value) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.timestamp_nanoseconds[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.order_book_id[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.tick_size[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.price_from[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.price_to[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tick Size Table Entry Message set to where it lies, so a field read out of place says so */
inline ramp_tick_size_table_entry_message(tick_size_table_entry_message_record, tick_size_table_entry_message_base) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.timestamp_nanoseconds[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 0 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.order_book_id[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 4 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.tick_size[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 8 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.price_from[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 16 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.price_to[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 24 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Size Table Entry Message to the wire, 32 bytes from where the cursor stands */
inline encode_tick_size_table_entry_message(tick_size_table_entry_message_record) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> wire[at] = tick_size_table_entry_message_record.timestamp_nanoseconds[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> wire[at] = tick_size_table_entry_message_record.order_book_id[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> wire[at] = tick_size_table_entry_message_record.tick_size[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> wire[at] = tick_size_table_entry_message_record.price_from[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> wire[at] = tick_size_table_entry_message_record.price_to[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Size Table Entry Message off the wire, 32 bytes from where the cursor stands */
inline decode_tick_size_table_entry_message(tick_size_table_entry_message_record) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.timestamp_nanoseconds[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.order_book_id[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.tick_size[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.price_from[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.price_to[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tick Size Table Entry Message is what was written, byte for byte */
inline equal_tick_size_table_entry_message(tick_size_table_entry_message_read, tick_size_table_entry_message_written) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> assert(tick_size_table_entry_message_read.timestamp_nanoseconds[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.timestamp_nanoseconds[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> assert(tick_size_table_entry_message_read.order_book_id[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.order_book_id[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> assert(tick_size_table_entry_message_read.tick_size[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.tick_size[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> assert(tick_size_table_entry_message_read.price_from[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.price_from[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> assert(tick_size_table_entry_message_read.price_to[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.price_to[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Corporate Action Entry Message: 31 bytes -------------------------------- */

/* Displays the entries of assigned Corporate Action Codes to Order Books. */
typedef CorporateActionEntryMessage {
  byte timestamp_nanoseconds[4];
  byte corporate_action_id[4];
  byte order_book_id[4];
  byte corporate_action_code[4];
  byte corporate_action_type;
  byte start_date[4];
  byte end_date[4];
  byte record_date[4];
  byte corporate_action_status;
  byte action
};

int corporate_action_entry_message_at;

/* every byte of Corporate Action Entry Message set to one value */
inline fill_corporate_action_entry_message(corporate_action_entry_message_record, corporate_action_entry_message_value) {
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.timestamp_nanoseconds[corporate_action_entry_message_at] = corporate_action_entry_message_value; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.corporate_action_id[corporate_action_entry_message_at] = corporate_action_entry_message_value; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.order_book_id[corporate_action_entry_message_at] = corporate_action_entry_message_value; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.corporate_action_code[corporate_action_entry_message_at] = corporate_action_entry_message_value; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_record.corporate_action_type = corporate_action_entry_message_value;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.start_date[corporate_action_entry_message_at] = corporate_action_entry_message_value; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.end_date[corporate_action_entry_message_at] = corporate_action_entry_message_value; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.record_date[corporate_action_entry_message_at] = corporate_action_entry_message_value; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_record.corporate_action_status = corporate_action_entry_message_value;
  corporate_action_entry_message_record.action = corporate_action_entry_message_value;
  skip
}

/* each byte of Corporate Action Entry Message set to where it lies, so a field read out of place says so */
inline ramp_corporate_action_entry_message(corporate_action_entry_message_record, corporate_action_entry_message_base) {
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.timestamp_nanoseconds[corporate_action_entry_message_at] = (corporate_action_entry_message_base + 0 + corporate_action_entry_message_at + 1) % 256; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.corporate_action_id[corporate_action_entry_message_at] = (corporate_action_entry_message_base + 4 + corporate_action_entry_message_at + 1) % 256; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.order_book_id[corporate_action_entry_message_at] = (corporate_action_entry_message_base + 8 + corporate_action_entry_message_at + 1) % 256; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.corporate_action_code[corporate_action_entry_message_at] = (corporate_action_entry_message_base + 12 + corporate_action_entry_message_at + 1) % 256; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_record.corporate_action_type = (corporate_action_entry_message_base + 16 + 1) % 256;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.start_date[corporate_action_entry_message_at] = (corporate_action_entry_message_base + 17 + corporate_action_entry_message_at + 1) % 256; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.end_date[corporate_action_entry_message_at] = (corporate_action_entry_message_base + 21 + corporate_action_entry_message_at + 1) % 256; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.record_date[corporate_action_entry_message_at] = (corporate_action_entry_message_base + 25 + corporate_action_entry_message_at + 1) % 256; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_record.corporate_action_status = (corporate_action_entry_message_base + 29 + 1) % 256;
  corporate_action_entry_message_record.action = (corporate_action_entry_message_base + 30 + 1) % 256;
  skip
}

/* Corporate Action Entry Message to the wire, 31 bytes from where the cursor stands */
inline encode_corporate_action_entry_message(corporate_action_entry_message_record) {
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> wire[at] = corporate_action_entry_message_record.timestamp_nanoseconds[corporate_action_entry_message_at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> wire[at] = corporate_action_entry_message_record.corporate_action_id[corporate_action_entry_message_at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> wire[at] = corporate_action_entry_message_record.order_book_id[corporate_action_entry_message_at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> wire[at] = corporate_action_entry_message_record.corporate_action_code[corporate_action_entry_message_at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  wire[at] = corporate_action_entry_message_record.corporate_action_type; at = at + 1;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> wire[at] = corporate_action_entry_message_record.start_date[corporate_action_entry_message_at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> wire[at] = corporate_action_entry_message_record.end_date[corporate_action_entry_message_at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> wire[at] = corporate_action_entry_message_record.record_date[corporate_action_entry_message_at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  wire[at] = corporate_action_entry_message_record.corporate_action_status; at = at + 1;
  wire[at] = corporate_action_entry_message_record.action; at = at + 1;
  skip
}

/* Corporate Action Entry Message off the wire, 31 bytes from where the cursor stands */
inline decode_corporate_action_entry_message(corporate_action_entry_message_record) {
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.timestamp_nanoseconds[corporate_action_entry_message_at] = wire[at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.corporate_action_id[corporate_action_entry_message_at] = wire[at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.order_book_id[corporate_action_entry_message_at] = wire[at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.corporate_action_code[corporate_action_entry_message_at] = wire[at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_record.corporate_action_type = wire[at]; at = at + 1;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.start_date[corporate_action_entry_message_at] = wire[at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.end_date[corporate_action_entry_message_at] = wire[at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> corporate_action_entry_message_record.record_date[corporate_action_entry_message_at] = wire[at]; at = at + 1; corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_record.corporate_action_status = wire[at]; at = at + 1;
  corporate_action_entry_message_record.action = wire[at]; at = at + 1;
  skip
}

/* what was read of Corporate Action Entry Message is what was written, byte for byte */
inline equal_corporate_action_entry_message(corporate_action_entry_message_read, corporate_action_entry_message_written) {
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> assert(corporate_action_entry_message_read.timestamp_nanoseconds[corporate_action_entry_message_at] == corporate_action_entry_message_written.timestamp_nanoseconds[corporate_action_entry_message_at]); corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> assert(corporate_action_entry_message_read.corporate_action_id[corporate_action_entry_message_at] == corporate_action_entry_message_written.corporate_action_id[corporate_action_entry_message_at]); corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> assert(corporate_action_entry_message_read.order_book_id[corporate_action_entry_message_at] == corporate_action_entry_message_written.order_book_id[corporate_action_entry_message_at]); corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> assert(corporate_action_entry_message_read.corporate_action_code[corporate_action_entry_message_at] == corporate_action_entry_message_written.corporate_action_code[corporate_action_entry_message_at]); corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  assert(corporate_action_entry_message_read.corporate_action_type == corporate_action_entry_message_written.corporate_action_type);
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> assert(corporate_action_entry_message_read.start_date[corporate_action_entry_message_at] == corporate_action_entry_message_written.start_date[corporate_action_entry_message_at]); corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> assert(corporate_action_entry_message_read.end_date[corporate_action_entry_message_at] == corporate_action_entry_message_written.end_date[corporate_action_entry_message_at]); corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  corporate_action_entry_message_at = 0;
  do
  :: corporate_action_entry_message_at < 4 -> assert(corporate_action_entry_message_read.record_date[corporate_action_entry_message_at] == corporate_action_entry_message_written.record_date[corporate_action_entry_message_at]); corporate_action_entry_message_at = corporate_action_entry_message_at + 1
  :: else -> break
  od;
  assert(corporate_action_entry_message_read.corporate_action_status == corporate_action_entry_message_written.corporate_action_status);
  assert(corporate_action_entry_message_read.action == corporate_action_entry_message_written.action);
  skip
}

/* ---- Order Book Directory Extension Message: 92 bytes ------------------------ */

/* Provides additional information that are valid only for Fixed Income instruments; sent for all instruments. */
typedef OrderBookDirectoryExtensionMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte accrued_interest_rounding[4];
  byte accrued_interest_updown;
  byte calculation_convention;
  byte clean_price_rounding[4];
  byte clean_price_updown;
  byte coupon_frequency[4];
  byte coupon_interest[8];
  byte coupon_from_date[4];
  byte issue_date[4];
  byte maturity_date[4];
  byte day_calculation_rule;
  byte day_count_convention;
  byte ex_coupon_period[4];
  byte dividend[8];
  byte fixed_income_type;
  byte rate_determination_days[4];
  byte yield_convention[4];
  byte end_of_month_count_convention[4];
  byte first_settlement_date[4];
  byte coupon_div_date[4];
  byte date_books_close[4];
  byte effective_expiration_date[4];
  byte proceed_date[4];
  byte set_end_consideration;
  byte set_start_consideration
};

int order_book_directory_extension_message_at;

/* every byte of Order Book Directory Extension Message set to one value */
inline fill_order_book_directory_extension_message(order_book_directory_extension_message_record, order_book_directory_extension_message_value) {
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.timestamp_nanoseconds[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.order_book_id[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.accrued_interest_rounding[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.accrued_interest_updown = order_book_directory_extension_message_value;
  order_book_directory_extension_message_record.calculation_convention = order_book_directory_extension_message_value;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.clean_price_rounding[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.clean_price_updown = order_book_directory_extension_message_value;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.coupon_frequency[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> order_book_directory_extension_message_record.coupon_interest[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.coupon_from_date[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.issue_date[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.maturity_date[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.day_calculation_rule = order_book_directory_extension_message_value;
  order_book_directory_extension_message_record.day_count_convention = order_book_directory_extension_message_value;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.ex_coupon_period[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> order_book_directory_extension_message_record.dividend[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.fixed_income_type = order_book_directory_extension_message_value;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.rate_determination_days[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.yield_convention[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.end_of_month_count_convention[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.first_settlement_date[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.coupon_div_date[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.date_books_close[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.effective_expiration_date[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.proceed_date[order_book_directory_extension_message_at] = order_book_directory_extension_message_value; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.set_end_consideration = order_book_directory_extension_message_value;
  order_book_directory_extension_message_record.set_start_consideration = order_book_directory_extension_message_value;
  skip
}

/* each byte of Order Book Directory Extension Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_directory_extension_message(order_book_directory_extension_message_record, order_book_directory_extension_message_base) {
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.timestamp_nanoseconds[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 0 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.order_book_id[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 4 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.accrued_interest_rounding[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 8 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.accrued_interest_updown = (order_book_directory_extension_message_base + 12 + 1) % 256;
  order_book_directory_extension_message_record.calculation_convention = (order_book_directory_extension_message_base + 13 + 1) % 256;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.clean_price_rounding[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 14 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.clean_price_updown = (order_book_directory_extension_message_base + 18 + 1) % 256;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.coupon_frequency[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 19 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> order_book_directory_extension_message_record.coupon_interest[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 23 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.coupon_from_date[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 31 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.issue_date[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 35 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.maturity_date[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 39 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.day_calculation_rule = (order_book_directory_extension_message_base + 43 + 1) % 256;
  order_book_directory_extension_message_record.day_count_convention = (order_book_directory_extension_message_base + 44 + 1) % 256;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.ex_coupon_period[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 45 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> order_book_directory_extension_message_record.dividend[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 49 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.fixed_income_type = (order_book_directory_extension_message_base + 57 + 1) % 256;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.rate_determination_days[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 58 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.yield_convention[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 62 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.end_of_month_count_convention[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 66 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.first_settlement_date[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 70 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.coupon_div_date[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 74 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.date_books_close[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 78 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.effective_expiration_date[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 82 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.proceed_date[order_book_directory_extension_message_at] = (order_book_directory_extension_message_base + 86 + order_book_directory_extension_message_at + 1) % 256; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.set_end_consideration = (order_book_directory_extension_message_base + 90 + 1) % 256;
  order_book_directory_extension_message_record.set_start_consideration = (order_book_directory_extension_message_base + 91 + 1) % 256;
  skip
}

/* Order Book Directory Extension Message to the wire, 92 bytes from where the cursor stands */
inline encode_order_book_directory_extension_message(order_book_directory_extension_message_record) {
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.timestamp_nanoseconds[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.order_book_id[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.accrued_interest_rounding[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_extension_message_record.accrued_interest_updown; at = at + 1;
  wire[at] = order_book_directory_extension_message_record.calculation_convention; at = at + 1;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.clean_price_rounding[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_extension_message_record.clean_price_updown; at = at + 1;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.coupon_frequency[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> wire[at] = order_book_directory_extension_message_record.coupon_interest[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.coupon_from_date[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.issue_date[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.maturity_date[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_extension_message_record.day_calculation_rule; at = at + 1;
  wire[at] = order_book_directory_extension_message_record.day_count_convention; at = at + 1;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.ex_coupon_period[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> wire[at] = order_book_directory_extension_message_record.dividend[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_extension_message_record.fixed_income_type; at = at + 1;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.rate_determination_days[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.yield_convention[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.end_of_month_count_convention[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.first_settlement_date[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.coupon_div_date[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.date_books_close[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.effective_expiration_date[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> wire[at] = order_book_directory_extension_message_record.proceed_date[order_book_directory_extension_message_at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_extension_message_record.set_end_consideration; at = at + 1;
  wire[at] = order_book_directory_extension_message_record.set_start_consideration; at = at + 1;
  skip
}

/* Order Book Directory Extension Message off the wire, 92 bytes from where the cursor stands */
inline decode_order_book_directory_extension_message(order_book_directory_extension_message_record) {
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.timestamp_nanoseconds[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.order_book_id[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.accrued_interest_rounding[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.accrued_interest_updown = wire[at]; at = at + 1;
  order_book_directory_extension_message_record.calculation_convention = wire[at]; at = at + 1;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.clean_price_rounding[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.clean_price_updown = wire[at]; at = at + 1;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.coupon_frequency[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> order_book_directory_extension_message_record.coupon_interest[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.coupon_from_date[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.issue_date[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.maturity_date[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.day_calculation_rule = wire[at]; at = at + 1;
  order_book_directory_extension_message_record.day_count_convention = wire[at]; at = at + 1;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.ex_coupon_period[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> order_book_directory_extension_message_record.dividend[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.fixed_income_type = wire[at]; at = at + 1;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.rate_determination_days[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.yield_convention[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.end_of_month_count_convention[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.first_settlement_date[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.coupon_div_date[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.date_books_close[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.effective_expiration_date[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> order_book_directory_extension_message_record.proceed_date[order_book_directory_extension_message_at] = wire[at]; at = at + 1; order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_record.set_end_consideration = wire[at]; at = at + 1;
  order_book_directory_extension_message_record.set_start_consideration = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Book Directory Extension Message is what was written, byte for byte */
inline equal_order_book_directory_extension_message(order_book_directory_extension_message_read, order_book_directory_extension_message_written) {
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.timestamp_nanoseconds[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.timestamp_nanoseconds[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.order_book_id[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.order_book_id[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.accrued_interest_rounding[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.accrued_interest_rounding[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_extension_message_read.accrued_interest_updown == order_book_directory_extension_message_written.accrued_interest_updown);
  assert(order_book_directory_extension_message_read.calculation_convention == order_book_directory_extension_message_written.calculation_convention);
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.clean_price_rounding[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.clean_price_rounding[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_extension_message_read.clean_price_updown == order_book_directory_extension_message_written.clean_price_updown);
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.coupon_frequency[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.coupon_frequency[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> assert(order_book_directory_extension_message_read.coupon_interest[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.coupon_interest[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.coupon_from_date[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.coupon_from_date[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.issue_date[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.issue_date[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.maturity_date[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.maturity_date[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_extension_message_read.day_calculation_rule == order_book_directory_extension_message_written.day_calculation_rule);
  assert(order_book_directory_extension_message_read.day_count_convention == order_book_directory_extension_message_written.day_count_convention);
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.ex_coupon_period[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.ex_coupon_period[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 8 -> assert(order_book_directory_extension_message_read.dividend[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.dividend[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_extension_message_read.fixed_income_type == order_book_directory_extension_message_written.fixed_income_type);
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.rate_determination_days[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.rate_determination_days[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.yield_convention[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.yield_convention[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.end_of_month_count_convention[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.end_of_month_count_convention[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.first_settlement_date[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.first_settlement_date[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.coupon_div_date[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.coupon_div_date[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.date_books_close[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.date_books_close[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.effective_expiration_date[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.effective_expiration_date[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  order_book_directory_extension_message_at = 0;
  do
  :: order_book_directory_extension_message_at < 4 -> assert(order_book_directory_extension_message_read.proceed_date[order_book_directory_extension_message_at] == order_book_directory_extension_message_written.proceed_date[order_book_directory_extension_message_at]); order_book_directory_extension_message_at = order_book_directory_extension_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_extension_message_read.set_end_consideration == order_book_directory_extension_message_written.set_end_consideration);
  assert(order_book_directory_extension_message_read.set_start_consideration == order_book_directory_extension_message_written.set_start_consideration);
  skip
}

/* ---- System Event Message: 5 bytes ------------------------------------------- */

/* Used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte timestamp_nanoseconds[4];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp_nanoseconds[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp_nanoseconds[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 4 + 1) % 256;
  skip
}

/* System Event Message to the wire, 5 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.timestamp_nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 5 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp_nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.timestamp_nanoseconds[system_event_message_at] == system_event_message_written.timestamp_nanoseconds[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Order Book State Message: 48 bytes -------------------------------------- */

/* Relays information on state changes. */
typedef OrderBookStateMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte state_name[20];
  byte display_name[20]
};

int order_book_state_message_at;

/* every byte of Order Book State Message set to one value */
inline fill_order_book_state_message(order_book_state_message_record, order_book_state_message_value) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.timestamp_nanoseconds[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.order_book_id[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.state_name[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.display_name[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book State Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_state_message(order_book_state_message_record, order_book_state_message_base) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.timestamp_nanoseconds[order_book_state_message_at] = (order_book_state_message_base + 0 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.order_book_id[order_book_state_message_at] = (order_book_state_message_base + 4 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.state_name[order_book_state_message_at] = (order_book_state_message_base + 8 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.display_name[order_book_state_message_at] = (order_book_state_message_base + 28 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book State Message to the wire, 48 bytes from where the cursor stands */
inline encode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.timestamp_nanoseconds[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.order_book_id[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> wire[at] = order_book_state_message_record.state_name[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> wire[at] = order_book_state_message_record.display_name[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book State Message off the wire, 48 bytes from where the cursor stands */
inline decode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.timestamp_nanoseconds[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.order_book_id[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.state_name[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.display_name[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book State Message is what was written, byte for byte */
inline equal_order_book_state_message(order_book_state_message_read, order_book_state_message_written) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.timestamp_nanoseconds[order_book_state_message_at] == order_book_state_message_written.timestamp_nanoseconds[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.order_book_id[order_book_state_message_at] == order_book_state_message_written.order_book_id[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> assert(order_book_state_message_read.state_name[order_book_state_message_at] == order_book_state_message_written.state_name[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> assert(order_book_state_message_read.display_name[order_book_state_message_at] == order_book_state_message_written.display_name[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Business Date Message: 8 bytes ------------------------------------------ */

/* Relays information on the current business date. */
typedef BusinessDateMessage {
  byte timestamp_nanoseconds[4];
  byte business_date[4]
};

int business_date_message_at;

/* every byte of Business Date Message set to one value */
inline fill_business_date_message(business_date_message_record, business_date_message_value) {
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> business_date_message_record.timestamp_nanoseconds[business_date_message_at] = business_date_message_value; business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> business_date_message_record.business_date[business_date_message_at] = business_date_message_value; business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Business Date Message set to where it lies, so a field read out of place says so */
inline ramp_business_date_message(business_date_message_record, business_date_message_base) {
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> business_date_message_record.timestamp_nanoseconds[business_date_message_at] = (business_date_message_base + 0 + business_date_message_at + 1) % 256; business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> business_date_message_record.business_date[business_date_message_at] = (business_date_message_base + 4 + business_date_message_at + 1) % 256; business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  skip
}

/* Business Date Message to the wire, 8 bytes from where the cursor stands */
inline encode_business_date_message(business_date_message_record) {
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> wire[at] = business_date_message_record.timestamp_nanoseconds[business_date_message_at]; at = at + 1; business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> wire[at] = business_date_message_record.business_date[business_date_message_at]; at = at + 1; business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  skip
}

/* Business Date Message off the wire, 8 bytes from where the cursor stands */
inline decode_business_date_message(business_date_message_record) {
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> business_date_message_record.timestamp_nanoseconds[business_date_message_at] = wire[at]; at = at + 1; business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> business_date_message_record.business_date[business_date_message_at] = wire[at]; at = at + 1; business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Business Date Message is what was written, byte for byte */
inline equal_business_date_message(business_date_message_read, business_date_message_written) {
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> assert(business_date_message_read.timestamp_nanoseconds[business_date_message_at] == business_date_message_written.timestamp_nanoseconds[business_date_message_at]); business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  business_date_message_at = 0;
  do
  :: business_date_message_at < 4 -> assert(business_date_message_read.business_date[business_date_message_at] == business_date_message_written.business_date[business_date_message_at]); business_date_message_at = business_date_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Status Message: 65 bytes ------------------------------------- */

/* Received when the State of an Instrument is changed at any of the applicable levels. */
typedef InstrumentStatusMessage {
  byte timestamp_nanoseconds[4];
  byte trading_state_name[20];
  byte instrument_state_level;
  byte name_of_the_instrument_state_level[32];
  byte start_date[4];
  byte start_time[4]
};

int instrument_status_message_at;

/* every byte of Instrument Status Message set to one value */
inline fill_instrument_status_message(instrument_status_message_record, instrument_status_message_value) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> instrument_status_message_record.timestamp_nanoseconds[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 20 -> instrument_status_message_record.trading_state_name[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.instrument_state_level = instrument_status_message_value;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 32 -> instrument_status_message_record.name_of_the_instrument_state_level[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> instrument_status_message_record.start_date[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> instrument_status_message_record.start_time[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Status Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_status_message(instrument_status_message_record, instrument_status_message_base) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> instrument_status_message_record.timestamp_nanoseconds[instrument_status_message_at] = (instrument_status_message_base + 0 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 20 -> instrument_status_message_record.trading_state_name[instrument_status_message_at] = (instrument_status_message_base + 4 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.instrument_state_level = (instrument_status_message_base + 24 + 1) % 256;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 32 -> instrument_status_message_record.name_of_the_instrument_state_level[instrument_status_message_at] = (instrument_status_message_base + 25 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> instrument_status_message_record.start_date[instrument_status_message_at] = (instrument_status_message_base + 57 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> instrument_status_message_record.start_time[instrument_status_message_at] = (instrument_status_message_base + 61 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Status Message to the wire, 65 bytes from where the cursor stands */
inline encode_instrument_status_message(instrument_status_message_record) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> wire[at] = instrument_status_message_record.timestamp_nanoseconds[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 20 -> wire[at] = instrument_status_message_record.trading_state_name[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_status_message_record.instrument_state_level; at = at + 1;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 32 -> wire[at] = instrument_status_message_record.name_of_the_instrument_state_level[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> wire[at] = instrument_status_message_record.start_date[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> wire[at] = instrument_status_message_record.start_time[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Status Message off the wire, 65 bytes from where the cursor stands */
inline decode_instrument_status_message(instrument_status_message_record) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> instrument_status_message_record.timestamp_nanoseconds[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 20 -> instrument_status_message_record.trading_state_name[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.instrument_state_level = wire[at]; at = at + 1;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 32 -> instrument_status_message_record.name_of_the_instrument_state_level[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> instrument_status_message_record.start_date[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> instrument_status_message_record.start_time[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Status Message is what was written, byte for byte */
inline equal_instrument_status_message(instrument_status_message_read, instrument_status_message_written) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> assert(instrument_status_message_read.timestamp_nanoseconds[instrument_status_message_at] == instrument_status_message_written.timestamp_nanoseconds[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 20 -> assert(instrument_status_message_read.trading_state_name[instrument_status_message_at] == instrument_status_message_written.trading_state_name[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  assert(instrument_status_message_read.instrument_state_level == instrument_status_message_written.instrument_state_level);
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 32 -> assert(instrument_status_message_read.name_of_the_instrument_state_level[instrument_status_message_at] == instrument_status_message_written.name_of_the_instrument_state_level[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> assert(instrument_status_message_read.start_date[instrument_status_message_at] == instrument_status_message_written.start_date[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 4 -> assert(instrument_status_message_read.start_time[instrument_status_message_at] == instrument_status_message_written.start_time[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Equilibrium Price Message: 72 bytes ------------------------------------- */

/* Used when auctions occur; provides the changes in equilibrium price. */
typedef EquilibriumPriceMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte available_bid_quantity_at_equilibrium_price[8];
  byte available_ask_quantity_at_equilibrium_price[8];
  byte equilibrium_price[8];
  byte best_bid_price[8];
  byte best_ask_price[8];
  byte best_bid_quantity[8];
  byte best_ask_quantity[8];
  byte equilibrium_quantity[8]
};

int equilibrium_price_message_at;

/* every byte of Equilibrium Price Message set to one value */
inline fill_equilibrium_price_message(equilibrium_price_message_record, equilibrium_price_message_value) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.timestamp_nanoseconds[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.order_book_id[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.available_bid_quantity_at_equilibrium_price[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.available_ask_quantity_at_equilibrium_price[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.equilibrium_price[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_bid_price[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_ask_price[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_bid_quantity[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_ask_quantity[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.equilibrium_quantity[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Equilibrium Price Message set to where it lies, so a field read out of place says so */
inline ramp_equilibrium_price_message(equilibrium_price_message_record, equilibrium_price_message_base) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.timestamp_nanoseconds[equilibrium_price_message_at] = (equilibrium_price_message_base + 0 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.order_book_id[equilibrium_price_message_at] = (equilibrium_price_message_base + 4 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.available_bid_quantity_at_equilibrium_price[equilibrium_price_message_at] = (equilibrium_price_message_base + 8 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.available_ask_quantity_at_equilibrium_price[equilibrium_price_message_at] = (equilibrium_price_message_base + 16 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.equilibrium_price[equilibrium_price_message_at] = (equilibrium_price_message_base + 24 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_bid_price[equilibrium_price_message_at] = (equilibrium_price_message_base + 32 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_ask_price[equilibrium_price_message_at] = (equilibrium_price_message_base + 40 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_bid_quantity[equilibrium_price_message_at] = (equilibrium_price_message_base + 48 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_ask_quantity[equilibrium_price_message_at] = (equilibrium_price_message_base + 56 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.equilibrium_quantity[equilibrium_price_message_at] = (equilibrium_price_message_base + 64 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equilibrium Price Message to the wire, 72 bytes from where the cursor stands */
inline encode_equilibrium_price_message(equilibrium_price_message_record) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> wire[at] = equilibrium_price_message_record.timestamp_nanoseconds[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> wire[at] = equilibrium_price_message_record.order_book_id[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.available_bid_quantity_at_equilibrium_price[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.available_ask_quantity_at_equilibrium_price[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.equilibrium_price[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.best_bid_price[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.best_ask_price[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.best_bid_quantity[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.best_ask_quantity[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.equilibrium_quantity[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equilibrium Price Message off the wire, 72 bytes from where the cursor stands */
inline decode_equilibrium_price_message(equilibrium_price_message_record) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.timestamp_nanoseconds[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.order_book_id[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.available_bid_quantity_at_equilibrium_price[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.available_ask_quantity_at_equilibrium_price[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.equilibrium_price[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_bid_price[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_ask_price[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_bid_quantity[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.best_ask_quantity[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.equilibrium_quantity[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Equilibrium Price Message is what was written, byte for byte */
inline equal_equilibrium_price_message(equilibrium_price_message_read, equilibrium_price_message_written) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> assert(equilibrium_price_message_read.timestamp_nanoseconds[equilibrium_price_message_at] == equilibrium_price_message_written.timestamp_nanoseconds[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> assert(equilibrium_price_message_read.order_book_id[equilibrium_price_message_at] == equilibrium_price_message_written.order_book_id[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.available_bid_quantity_at_equilibrium_price[equilibrium_price_message_at] == equilibrium_price_message_written.available_bid_quantity_at_equilibrium_price[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.available_ask_quantity_at_equilibrium_price[equilibrium_price_message_at] == equilibrium_price_message_written.available_ask_quantity_at_equilibrium_price[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.equilibrium_price[equilibrium_price_message_at] == equilibrium_price_message_written.equilibrium_price[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.best_bid_price[equilibrium_price_message_at] == equilibrium_price_message_written.best_bid_price[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.best_ask_price[equilibrium_price_message_at] == equilibrium_price_message_written.best_ask_price[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.best_bid_quantity[equilibrium_price_message_at] == equilibrium_price_message_written.best_bid_quantity[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.best_ask_quantity[equilibrium_price_message_at] == equilibrium_price_message_written.best_ask_quantity[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.equilibrium_quantity[equilibrium_price_message_at] == equilibrium_price_message_written.equilibrium_quantity[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Statistics Message: 89 bytes -------------------------------------- */

/* Publishes Trade Statistics per Orderbook ID for the current Trading Day. */
typedef TradeStatisticsMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte open_price[8];
  byte high_price[8];
  byte low_price[8];
  byte last_price[8];
  byte last_auction_price[8];
  byte last_quantity[8];
  byte turnover_quantity[8];
  byte reported_trades_turnover_quantity[8];
  byte turnover_value[8];
  byte number_of_trades[8];
  byte trend_indicator
};

int trade_statistics_message_at;

/* every byte of Trade Statistics Message set to one value */
inline fill_trade_statistics_message(trade_statistics_message_record, trade_statistics_message_value) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.timestamp_nanoseconds[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.order_book_id[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.open_price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.high_price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.low_price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_auction_price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_quantity[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover_quantity[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.reported_trades_turnover_quantity[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover_value[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.number_of_trades[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_record.trend_indicator = trade_statistics_message_value;
  skip
}

/* each byte of Trade Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_trade_statistics_message(trade_statistics_message_record, trade_statistics_message_base) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.timestamp_nanoseconds[trade_statistics_message_at] = (trade_statistics_message_base + 0 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.order_book_id[trade_statistics_message_at] = (trade_statistics_message_base + 4 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.open_price[trade_statistics_message_at] = (trade_statistics_message_base + 8 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.high_price[trade_statistics_message_at] = (trade_statistics_message_base + 16 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.low_price[trade_statistics_message_at] = (trade_statistics_message_base + 24 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_price[trade_statistics_message_at] = (trade_statistics_message_base + 32 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_auction_price[trade_statistics_message_at] = (trade_statistics_message_base + 40 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_quantity[trade_statistics_message_at] = (trade_statistics_message_base + 48 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover_quantity[trade_statistics_message_at] = (trade_statistics_message_base + 56 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.reported_trades_turnover_quantity[trade_statistics_message_at] = (trade_statistics_message_base + 64 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover_value[trade_statistics_message_at] = (trade_statistics_message_base + 72 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.number_of_trades[trade_statistics_message_at] = (trade_statistics_message_base + 80 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_record.trend_indicator = (trade_statistics_message_base + 88 + 1) % 256;
  skip
}

/* Trade Statistics Message to the wire, 89 bytes from where the cursor stands */
inline encode_trade_statistics_message(trade_statistics_message_record) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.timestamp_nanoseconds[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.order_book_id[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.open_price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.high_price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.low_price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.last_price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.last_auction_price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.last_quantity[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.turnover_quantity[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.reported_trades_turnover_quantity[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.turnover_value[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.number_of_trades[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_statistics_message_record.trend_indicator; at = at + 1;
  skip
}

/* Trade Statistics Message off the wire, 89 bytes from where the cursor stands */
inline decode_trade_statistics_message(trade_statistics_message_record) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.timestamp_nanoseconds[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.order_book_id[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.open_price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.high_price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.low_price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_auction_price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_quantity[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover_quantity[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.reported_trades_turnover_quantity[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover_value[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.number_of_trades[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_record.trend_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Statistics Message is what was written, byte for byte */
inline equal_trade_statistics_message(trade_statistics_message_read, trade_statistics_message_written) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.timestamp_nanoseconds[trade_statistics_message_at] == trade_statistics_message_written.timestamp_nanoseconds[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.order_book_id[trade_statistics_message_at] == trade_statistics_message_written.order_book_id[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.open_price[trade_statistics_message_at] == trade_statistics_message_written.open_price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.high_price[trade_statistics_message_at] == trade_statistics_message_written.high_price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.low_price[trade_statistics_message_at] == trade_statistics_message_written.low_price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.last_price[trade_statistics_message_at] == trade_statistics_message_written.last_price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.last_auction_price[trade_statistics_message_at] == trade_statistics_message_written.last_auction_price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.last_quantity[trade_statistics_message_at] == trade_statistics_message_written.last_quantity[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.turnover_quantity[trade_statistics_message_at] == trade_statistics_message_written.turnover_quantity[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.reported_trades_turnover_quantity[trade_statistics_message_at] == trade_statistics_message_written.reported_trades_turnover_quantity[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.turnover_value[trade_statistics_message_at] == trade_statistics_message_written.turnover_value[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.number_of_trades[trade_statistics_message_at] == trade_statistics_message_written.number_of_trades[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  assert(trade_statistics_message_read.trend_indicator == trade_statistics_message_written.trend_indicator);
  skip
}

/* ---- Reference Price Message: 29 bytes --------------------------------------- */

/* Publishes Reference Prices per Price Types. */
typedef ReferencePriceMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte price_type;
  byte price[8];
  byte timestamp[8];
  byte price_date[4]
};

int reference_price_message_at;

/* every byte of Reference Price Message set to one value */
inline fill_reference_price_message(reference_price_message_record, reference_price_message_value) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.timestamp_nanoseconds[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.order_book_id[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.price_type = reference_price_message_value;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.timestamp[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.price_date[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reference Price Message set to where it lies, so a field read out of place says so */
inline ramp_reference_price_message(reference_price_message_record, reference_price_message_base) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.timestamp_nanoseconds[reference_price_message_at] = (reference_price_message_base + 0 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.order_book_id[reference_price_message_at] = (reference_price_message_base + 4 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.price_type = (reference_price_message_base + 8 + 1) % 256;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = (reference_price_message_base + 9 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.timestamp[reference_price_message_at] = (reference_price_message_base + 17 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.price_date[reference_price_message_at] = (reference_price_message_base + 25 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Price Message to the wire, 29 bytes from where the cursor stands */
inline encode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.timestamp_nanoseconds[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.order_book_id[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  wire[at] = reference_price_message_record.price_type; at = at + 1;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> wire[at] = reference_price_message_record.price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> wire[at] = reference_price_message_record.timestamp[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.price_date[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Price Message off the wire, 29 bytes from where the cursor stands */
inline decode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.timestamp_nanoseconds[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.order_book_id[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.price_type = wire[at]; at = at + 1;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.timestamp[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.price_date[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reference Price Message is what was written, byte for byte */
inline equal_reference_price_message(reference_price_message_read, reference_price_message_written) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.timestamp_nanoseconds[reference_price_message_at] == reference_price_message_written.timestamp_nanoseconds[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.order_book_id[reference_price_message_at] == reference_price_message_written.order_book_id[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  assert(reference_price_message_read.price_type == reference_price_message_written.price_type);
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> assert(reference_price_message_read.price[reference_price_message_at] == reference_price_message_written.price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> assert(reference_price_message_read.timestamp[reference_price_message_at] == reference_price_message_written.timestamp[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.price_date[reference_price_message_at] == reference_price_message_written.price_date[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Message: 37 bytes ------------------------------------------------- */

/* Used for sending index price information. */
typedef IndexMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte last_price[8];
  byte timestamp[8];
  byte change_previous[4];
  byte change_yesterday[4];
  byte trend_indicator;
  byte point_of_movement[4]
};

int index_message_at;

/* every byte of Index Message set to one value */
inline fill_index_message(index_message_record, index_message_value) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.timestamp_nanoseconds[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.order_book_id[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.last_price[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.timestamp[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.change_previous[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.change_yesterday[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_record.trend_indicator = index_message_value;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.point_of_movement[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Message set to where it lies, so a field read out of place says so */
inline ramp_index_message(index_message_record, index_message_base) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.timestamp_nanoseconds[index_message_at] = (index_message_base + 0 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.order_book_id[index_message_at] = (index_message_base + 4 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.last_price[index_message_at] = (index_message_base + 8 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.timestamp[index_message_at] = (index_message_base + 16 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.change_previous[index_message_at] = (index_message_base + 24 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.change_yesterday[index_message_at] = (index_message_base + 28 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_record.trend_indicator = (index_message_base + 32 + 1) % 256;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.point_of_movement[index_message_at] = (index_message_base + 33 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Message to the wire, 37 bytes from where the cursor stands */
inline encode_index_message(index_message_record) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> wire[at] = index_message_record.timestamp_nanoseconds[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> wire[at] = index_message_record.order_book_id[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> wire[at] = index_message_record.last_price[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> wire[at] = index_message_record.timestamp[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> wire[at] = index_message_record.change_previous[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> wire[at] = index_message_record.change_yesterday[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  wire[at] = index_message_record.trend_indicator; at = at + 1;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> wire[at] = index_message_record.point_of_movement[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Message off the wire, 37 bytes from where the cursor stands */
inline decode_index_message(index_message_record) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.timestamp_nanoseconds[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.order_book_id[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.last_price[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.timestamp[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.change_previous[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.change_yesterday[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_record.trend_indicator = wire[at]; at = at + 1;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.point_of_movement[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Message is what was written, byte for byte */
inline equal_index_message(index_message_read, index_message_written) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> assert(index_message_read.timestamp_nanoseconds[index_message_at] == index_message_written.timestamp_nanoseconds[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> assert(index_message_read.order_book_id[index_message_at] == index_message_written.order_book_id[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> assert(index_message_read.last_price[index_message_at] == index_message_written.last_price[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> assert(index_message_read.timestamp[index_message_at] == index_message_written.timestamp[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> assert(index_message_read.change_previous[index_message_at] == index_message_written.change_previous[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> assert(index_message_read.change_yesterday[index_message_at] == index_message_written.change_yesterday[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  assert(index_message_read.trend_indicator == index_message_written.trend_indicator);
  index_message_at = 0;
  do
  :: index_message_at < 4 -> assert(index_message_read.point_of_movement[index_message_at] == index_message_written.point_of_movement[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Interest Message: 24 bytes ----------------------------------------- */

/* Publishes Open Interest. */
typedef OpenInterestMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte open_interest[8];
  byte transact_time[8]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.timestamp_nanoseconds[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.order_book_id[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.open_interest[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.transact_time[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.timestamp_nanoseconds[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.order_book_id[open_interest_message_at] = (open_interest_message_base + 4 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.open_interest[open_interest_message_at] = (open_interest_message_base + 8 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.transact_time[open_interest_message_at] = (open_interest_message_base + 16 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 24 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.timestamp_nanoseconds[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.order_book_id[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> wire[at] = open_interest_message_record.open_interest[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> wire[at] = open_interest_message_record.transact_time[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 24 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.timestamp_nanoseconds[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.order_book_id[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.open_interest[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.transact_time[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.timestamp_nanoseconds[open_interest_message_at] == open_interest_message_written.timestamp_nanoseconds[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.order_book_id[open_interest_message_at] == open_interest_message_written.order_book_id[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> assert(open_interest_message_read.open_interest[open_interest_message_at] == open_interest_message_written.open_interest[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> assert(open_interest_message_read.transact_time[open_interest_message_at] == open_interest_message_written.transact_time[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Ticker Message: 91 bytes ------------------------------------------ */

/* Publishes Trade Ticker. */
typedef TradeTickerMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte deal_id[8];
  byte deal_source;
  byte price[8];
  byte quantity[8];
  byte deal_time[8];
  byte action;
  byte aggressor;
  byte trade_report_type[2];
  byte printable;
  byte as_of_date[4];
  byte boq_list[6];
  byte participant_id_buy[5];
  byte order_id_buy[8];
  byte participant_id_sell[5];
  byte order_id_sell[8];
  byte trade_slip_number[4];
  byte exchange_order_type[4];
  byte trade_condition
};

int trade_ticker_message_at;

/* every byte of Trade Ticker Message set to one value */
inline fill_trade_ticker_message(trade_ticker_message_record, trade_ticker_message_value) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.timestamp_nanoseconds[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.order_book_id[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.deal_id[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.deal_source = trade_ticker_message_value;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.price[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.quantity[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.deal_time[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.action = trade_ticker_message_value;
  trade_ticker_message_record.aggressor = trade_ticker_message_value;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> trade_ticker_message_record.trade_report_type[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.printable = trade_ticker_message_value;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.as_of_date[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 6 -> trade_ticker_message_record.boq_list[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> trade_ticker_message_record.participant_id_buy[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.order_id_buy[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> trade_ticker_message_record.participant_id_sell[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.order_id_sell[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.trade_slip_number[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.exchange_order_type[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.trade_condition = trade_ticker_message_value;
  skip
}

/* each byte of Trade Ticker Message set to where it lies, so a field read out of place says so */
inline ramp_trade_ticker_message(trade_ticker_message_record, trade_ticker_message_base) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.timestamp_nanoseconds[trade_ticker_message_at] = (trade_ticker_message_base + 0 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.order_book_id[trade_ticker_message_at] = (trade_ticker_message_base + 4 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.deal_id[trade_ticker_message_at] = (trade_ticker_message_base + 8 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.deal_source = (trade_ticker_message_base + 16 + 1) % 256;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.price[trade_ticker_message_at] = (trade_ticker_message_base + 17 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.quantity[trade_ticker_message_at] = (trade_ticker_message_base + 25 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.deal_time[trade_ticker_message_at] = (trade_ticker_message_base + 33 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.action = (trade_ticker_message_base + 41 + 1) % 256;
  trade_ticker_message_record.aggressor = (trade_ticker_message_base + 42 + 1) % 256;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> trade_ticker_message_record.trade_report_type[trade_ticker_message_at] = (trade_ticker_message_base + 43 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.printable = (trade_ticker_message_base + 45 + 1) % 256;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.as_of_date[trade_ticker_message_at] = (trade_ticker_message_base + 46 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 6 -> trade_ticker_message_record.boq_list[trade_ticker_message_at] = (trade_ticker_message_base + 50 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> trade_ticker_message_record.participant_id_buy[trade_ticker_message_at] = (trade_ticker_message_base + 56 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.order_id_buy[trade_ticker_message_at] = (trade_ticker_message_base + 61 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> trade_ticker_message_record.participant_id_sell[trade_ticker_message_at] = (trade_ticker_message_base + 69 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.order_id_sell[trade_ticker_message_at] = (trade_ticker_message_base + 74 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.trade_slip_number[trade_ticker_message_at] = (trade_ticker_message_base + 82 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.exchange_order_type[trade_ticker_message_at] = (trade_ticker_message_base + 86 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.trade_condition = (trade_ticker_message_base + 90 + 1) % 256;
  skip
}

/* Trade Ticker Message to the wire, 91 bytes from where the cursor stands */
inline encode_trade_ticker_message(trade_ticker_message_record) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> wire[at] = trade_ticker_message_record.timestamp_nanoseconds[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> wire[at] = trade_ticker_message_record.order_book_id[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> wire[at] = trade_ticker_message_record.deal_id[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_ticker_message_record.deal_source; at = at + 1;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> wire[at] = trade_ticker_message_record.price[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> wire[at] = trade_ticker_message_record.quantity[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> wire[at] = trade_ticker_message_record.deal_time[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_ticker_message_record.action; at = at + 1;
  wire[at] = trade_ticker_message_record.aggressor; at = at + 1;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> wire[at] = trade_ticker_message_record.trade_report_type[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_ticker_message_record.printable; at = at + 1;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> wire[at] = trade_ticker_message_record.as_of_date[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 6 -> wire[at] = trade_ticker_message_record.boq_list[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> wire[at] = trade_ticker_message_record.participant_id_buy[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> wire[at] = trade_ticker_message_record.order_id_buy[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> wire[at] = trade_ticker_message_record.participant_id_sell[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> wire[at] = trade_ticker_message_record.order_id_sell[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> wire[at] = trade_ticker_message_record.trade_slip_number[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> wire[at] = trade_ticker_message_record.exchange_order_type[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_ticker_message_record.trade_condition; at = at + 1;
  skip
}

/* Trade Ticker Message off the wire, 91 bytes from where the cursor stands */
inline decode_trade_ticker_message(trade_ticker_message_record) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.timestamp_nanoseconds[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.order_book_id[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.deal_id[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.deal_source = wire[at]; at = at + 1;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.price[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.quantity[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.deal_time[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.action = wire[at]; at = at + 1;
  trade_ticker_message_record.aggressor = wire[at]; at = at + 1;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> trade_ticker_message_record.trade_report_type[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.printable = wire[at]; at = at + 1;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.as_of_date[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 6 -> trade_ticker_message_record.boq_list[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> trade_ticker_message_record.participant_id_buy[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.order_id_buy[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> trade_ticker_message_record.participant_id_sell[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.order_id_sell[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.trade_slip_number[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.exchange_order_type[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Ticker Message is what was written, byte for byte */
inline equal_trade_ticker_message(trade_ticker_message_read, trade_ticker_message_written) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> assert(trade_ticker_message_read.timestamp_nanoseconds[trade_ticker_message_at] == trade_ticker_message_written.timestamp_nanoseconds[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> assert(trade_ticker_message_read.order_book_id[trade_ticker_message_at] == trade_ticker_message_written.order_book_id[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> assert(trade_ticker_message_read.deal_id[trade_ticker_message_at] == trade_ticker_message_written.deal_id[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  assert(trade_ticker_message_read.deal_source == trade_ticker_message_written.deal_source);
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> assert(trade_ticker_message_read.price[trade_ticker_message_at] == trade_ticker_message_written.price[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> assert(trade_ticker_message_read.quantity[trade_ticker_message_at] == trade_ticker_message_written.quantity[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> assert(trade_ticker_message_read.deal_time[trade_ticker_message_at] == trade_ticker_message_written.deal_time[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  assert(trade_ticker_message_read.action == trade_ticker_message_written.action);
  assert(trade_ticker_message_read.aggressor == trade_ticker_message_written.aggressor);
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> assert(trade_ticker_message_read.trade_report_type[trade_ticker_message_at] == trade_ticker_message_written.trade_report_type[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  assert(trade_ticker_message_read.printable == trade_ticker_message_written.printable);
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> assert(trade_ticker_message_read.as_of_date[trade_ticker_message_at] == trade_ticker_message_written.as_of_date[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 6 -> assert(trade_ticker_message_read.boq_list[trade_ticker_message_at] == trade_ticker_message_written.boq_list[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> assert(trade_ticker_message_read.participant_id_buy[trade_ticker_message_at] == trade_ticker_message_written.participant_id_buy[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> assert(trade_ticker_message_read.order_id_buy[trade_ticker_message_at] == trade_ticker_message_written.order_id_buy[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 5 -> assert(trade_ticker_message_read.participant_id_sell[trade_ticker_message_at] == trade_ticker_message_written.participant_id_sell[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> assert(trade_ticker_message_read.order_id_sell[trade_ticker_message_at] == trade_ticker_message_written.order_id_sell[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> assert(trade_ticker_message_read.trade_slip_number[trade_ticker_message_at] == trade_ticker_message_written.trade_slip_number[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> assert(trade_ticker_message_read.exchange_order_type[trade_ticker_message_at] == trade_ticker_message_written.exchange_order_type[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  assert(trade_ticker_message_read.trade_condition == trade_ticker_message_written.trade_condition);
  skip
}

/* ---- Price Limits Message: 34 bytes ------------------------------------------ */

/* Provides an update to the price limits or circuit breaker limits for an order book. */
typedef PriceLimitsMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte upper_limit[8];
  byte lower_limit[8];
  byte type;
  byte category;
  byte reference_price[8]
};

int price_limits_message_at;

/* every byte of Price Limits Message set to one value */
inline fill_price_limits_message(price_limits_message_record, price_limits_message_value) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.timestamp_nanoseconds[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.order_book_id[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_limit[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_limit[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_record.type = price_limits_message_value;
  price_limits_message_record.category = price_limits_message_value;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.reference_price[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Limits Message set to where it lies, so a field read out of place says so */
inline ramp_price_limits_message(price_limits_message_record, price_limits_message_base) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.timestamp_nanoseconds[price_limits_message_at] = (price_limits_message_base + 0 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.order_book_id[price_limits_message_at] = (price_limits_message_base + 4 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_limit[price_limits_message_at] = (price_limits_message_base + 8 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_limit[price_limits_message_at] = (price_limits_message_base + 16 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_record.type = (price_limits_message_base + 24 + 1) % 256;
  price_limits_message_record.category = (price_limits_message_base + 25 + 1) % 256;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.reference_price[price_limits_message_at] = (price_limits_message_base + 26 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Limits Message to the wire, 34 bytes from where the cursor stands */
inline encode_price_limits_message(price_limits_message_record) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> wire[at] = price_limits_message_record.timestamp_nanoseconds[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> wire[at] = price_limits_message_record.order_book_id[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.upper_limit[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.lower_limit[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  wire[at] = price_limits_message_record.type; at = at + 1;
  wire[at] = price_limits_message_record.category; at = at + 1;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.reference_price[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Limits Message off the wire, 34 bytes from where the cursor stands */
inline decode_price_limits_message(price_limits_message_record) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.timestamp_nanoseconds[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.order_book_id[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_limit[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_limit[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_record.type = wire[at]; at = at + 1;
  price_limits_message_record.category = wire[at]; at = at + 1;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.reference_price[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Limits Message is what was written, byte for byte */
inline equal_price_limits_message(price_limits_message_read, price_limits_message_written) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> assert(price_limits_message_read.timestamp_nanoseconds[price_limits_message_at] == price_limits_message_written.timestamp_nanoseconds[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> assert(price_limits_message_read.order_book_id[price_limits_message_at] == price_limits_message_written.order_book_id[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.upper_limit[price_limits_message_at] == price_limits_message_written.upper_limit[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.lower_limit[price_limits_message_at] == price_limits_message_written.lower_limit[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  assert(price_limits_message_read.type == price_limits_message_written.type);
  assert(price_limits_message_read.category == price_limits_message_written.category);
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.reference_price[price_limits_message_at] == price_limits_message_written.reference_price[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Snapshot Message: 20 bytes --------------------------------------- */

/* Returns the current MDF sequence number to be used when connecting to the MDF feed (Glimpse). */
typedef EndOfSnapshotMessage {
  byte snapshot_sequence_number[20]
};

int end_of_snapshot_message_at;

/* every byte of End Of Snapshot Message set to one value */
inline fill_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_value) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.snapshot_sequence_number[end_of_snapshot_message_at] = end_of_snapshot_message_value; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_base) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.snapshot_sequence_number[end_of_snapshot_message_at] = (end_of_snapshot_message_base + 0 + end_of_snapshot_message_at + 1) % 256; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> wire[at] = end_of_snapshot_message_record.snapshot_sequence_number[end_of_snapshot_message_at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.snapshot_sequence_number[end_of_snapshot_message_at] = wire[at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Snapshot Message is what was written, byte for byte */
inline equal_end_of_snapshot_message(end_of_snapshot_message_read, end_of_snapshot_message_written) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> assert(end_of_snapshot_message_read.snapshot_sequence_number[end_of_snapshot_message_at] == end_of_snapshot_message_written.snapshot_sequence_number[end_of_snapshot_message_at]); end_of_snapshot_message_at = end_of_snapshot_message_at + 1
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

/* Seconds Message: encoded, read back, and compared */
proctype check_seconds_message() {
  SecondsMessage seconds_message_sent;
  SecondsMessage seconds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_seconds_message(seconds_message_sent, 0)
  :: pattern == 1 -> fill_seconds_message(seconds_message_sent, 32)
  :: pattern == 2 -> fill_seconds_message(seconds_message_sent, 255)
  :: else -> ramp_seconds_message(seconds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_seconds_message(seconds_message_sent);
    assert(at == 4);
    at = 0;
    decode_seconds_message(seconds_message_got);
    assert(at == 4);
    equal_seconds_message(seconds_message_got, seconds_message_sent)
  }
}

/* Order Book Directory Message: encoded, read back, and compared */
proctype check_order_book_directory_message() {
  OrderBookDirectoryMessage order_book_directory_message_sent;
  OrderBookDirectoryMessage order_book_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_directory_message(order_book_directory_message_sent, 0)
  :: pattern == 1 -> fill_order_book_directory_message(order_book_directory_message_sent, 32)
  :: pattern == 2 -> fill_order_book_directory_message(order_book_directory_message_sent, 255)
  :: else -> ramp_order_book_directory_message(order_book_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_directory_message(order_book_directory_message_sent);
    assert(at == 366);
    at = 0;
    decode_order_book_directory_message(order_book_directory_message_got);
    assert(at == 366);
    equal_order_book_directory_message(order_book_directory_message_got, order_book_directory_message_sent)
  }
}

/* Exchange Directory Message: encoded, read back, and compared */
proctype check_exchange_directory_message() {
  ExchangeDirectoryMessage exchange_directory_message_sent;
  ExchangeDirectoryMessage exchange_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_exchange_directory_message(exchange_directory_message_sent, 0)
  :: pattern == 1 -> fill_exchange_directory_message(exchange_directory_message_sent, 32)
  :: pattern == 2 -> fill_exchange_directory_message(exchange_directory_message_sent, 255)
  :: else -> ramp_exchange_directory_message(exchange_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_exchange_directory_message(exchange_directory_message_sent);
    assert(at == 40);
    at = 0;
    decode_exchange_directory_message(exchange_directory_message_got);
    assert(at == 40);
    equal_exchange_directory_message(exchange_directory_message_got, exchange_directory_message_sent)
  }
}

/* Market Directory Message: encoded, read back, and compared */
proctype check_market_directory_message() {
  MarketDirectoryMessage market_directory_message_sent;
  MarketDirectoryMessage market_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_directory_message(market_directory_message_sent, 0)
  :: pattern == 1 -> fill_market_directory_message(market_directory_message_sent, 32)
  :: pattern == 2 -> fill_market_directory_message(market_directory_message_sent, 255)
  :: else -> ramp_market_directory_message(market_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_directory_message(market_directory_message_sent);
    assert(at == 42);
    at = 0;
    decode_market_directory_message(market_directory_message_got);
    assert(at == 42);
    equal_market_directory_message(market_directory_message_got, market_directory_message_sent)
  }
}

/* Combination Order Book Leg Directory Message: encoded, read back, and compared */
proctype check_combination_order_book_leg_directory_message() {
  CombinationOrderBookLegDirectoryMessage combination_order_book_leg_directory_message_sent;
  CombinationOrderBookLegDirectoryMessage combination_order_book_leg_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_sent, 0)
  :: pattern == 1 -> fill_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_sent, 32)
  :: pattern == 2 -> fill_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_sent, 255)
  :: else -> ramp_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_sent);
    assert(at == 17);
    at = 0;
    decode_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_got);
    assert(at == 17);
    equal_combination_order_book_leg_directory_message(combination_order_book_leg_directory_message_got, combination_order_book_leg_directory_message_sent)
  }
}

/* Tick Size Table Entry Message: encoded, read back, and compared */
proctype check_tick_size_table_entry_message() {
  TickSizeTableEntryMessage tick_size_table_entry_message_sent;
  TickSizeTableEntryMessage tick_size_table_entry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_size_table_entry_message(tick_size_table_entry_message_sent, 0)
  :: pattern == 1 -> fill_tick_size_table_entry_message(tick_size_table_entry_message_sent, 32)
  :: pattern == 2 -> fill_tick_size_table_entry_message(tick_size_table_entry_message_sent, 255)
  :: else -> ramp_tick_size_table_entry_message(tick_size_table_entry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_size_table_entry_message(tick_size_table_entry_message_sent);
    assert(at == 32);
    at = 0;
    decode_tick_size_table_entry_message(tick_size_table_entry_message_got);
    assert(at == 32);
    equal_tick_size_table_entry_message(tick_size_table_entry_message_got, tick_size_table_entry_message_sent)
  }
}

/* Corporate Action Entry Message: encoded, read back, and compared */
proctype check_corporate_action_entry_message() {
  CorporateActionEntryMessage corporate_action_entry_message_sent;
  CorporateActionEntryMessage corporate_action_entry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_corporate_action_entry_message(corporate_action_entry_message_sent, 0)
  :: pattern == 1 -> fill_corporate_action_entry_message(corporate_action_entry_message_sent, 32)
  :: pattern == 2 -> fill_corporate_action_entry_message(corporate_action_entry_message_sent, 255)
  :: else -> ramp_corporate_action_entry_message(corporate_action_entry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_corporate_action_entry_message(corporate_action_entry_message_sent);
    assert(at == 31);
    at = 0;
    decode_corporate_action_entry_message(corporate_action_entry_message_got);
    assert(at == 31);
    equal_corporate_action_entry_message(corporate_action_entry_message_got, corporate_action_entry_message_sent)
  }
}

/* Order Book Directory Extension Message: encoded, read back, and compared */
proctype check_order_book_directory_extension_message() {
  OrderBookDirectoryExtensionMessage order_book_directory_extension_message_sent;
  OrderBookDirectoryExtensionMessage order_book_directory_extension_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_directory_extension_message(order_book_directory_extension_message_sent, 0)
  :: pattern == 1 -> fill_order_book_directory_extension_message(order_book_directory_extension_message_sent, 32)
  :: pattern == 2 -> fill_order_book_directory_extension_message(order_book_directory_extension_message_sent, 255)
  :: else -> ramp_order_book_directory_extension_message(order_book_directory_extension_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_directory_extension_message(order_book_directory_extension_message_sent);
    assert(at == 92);
    at = 0;
    decode_order_book_directory_extension_message(order_book_directory_extension_message_got);
    assert(at == 92);
    equal_order_book_directory_extension_message(order_book_directory_extension_message_got, order_book_directory_extension_message_sent)
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
    assert(at == 5);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 5);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Order Book State Message: encoded, read back, and compared */
proctype check_order_book_state_message() {
  OrderBookStateMessage order_book_state_message_sent;
  OrderBookStateMessage order_book_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_state_message(order_book_state_message_sent, 0)
  :: pattern == 1 -> fill_order_book_state_message(order_book_state_message_sent, 32)
  :: pattern == 2 -> fill_order_book_state_message(order_book_state_message_sent, 255)
  :: else -> ramp_order_book_state_message(order_book_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_state_message(order_book_state_message_sent);
    assert(at == 48);
    at = 0;
    decode_order_book_state_message(order_book_state_message_got);
    assert(at == 48);
    equal_order_book_state_message(order_book_state_message_got, order_book_state_message_sent)
  }
}

/* Business Date Message: encoded, read back, and compared */
proctype check_business_date_message() {
  BusinessDateMessage business_date_message_sent;
  BusinessDateMessage business_date_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_business_date_message(business_date_message_sent, 0)
  :: pattern == 1 -> fill_business_date_message(business_date_message_sent, 32)
  :: pattern == 2 -> fill_business_date_message(business_date_message_sent, 255)
  :: else -> ramp_business_date_message(business_date_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_business_date_message(business_date_message_sent);
    assert(at == 8);
    at = 0;
    decode_business_date_message(business_date_message_got);
    assert(at == 8);
    equal_business_date_message(business_date_message_got, business_date_message_sent)
  }
}

/* Instrument Status Message: encoded, read back, and compared */
proctype check_instrument_status_message() {
  InstrumentStatusMessage instrument_status_message_sent;
  InstrumentStatusMessage instrument_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_status_message(instrument_status_message_sent, 0)
  :: pattern == 1 -> fill_instrument_status_message(instrument_status_message_sent, 32)
  :: pattern == 2 -> fill_instrument_status_message(instrument_status_message_sent, 255)
  :: else -> ramp_instrument_status_message(instrument_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_status_message(instrument_status_message_sent);
    assert(at == 65);
    at = 0;
    decode_instrument_status_message(instrument_status_message_got);
    assert(at == 65);
    equal_instrument_status_message(instrument_status_message_got, instrument_status_message_sent)
  }
}

/* Equilibrium Price Message: encoded, read back, and compared */
proctype check_equilibrium_price_message() {
  EquilibriumPriceMessage equilibrium_price_message_sent;
  EquilibriumPriceMessage equilibrium_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equilibrium_price_message(equilibrium_price_message_sent, 0)
  :: pattern == 1 -> fill_equilibrium_price_message(equilibrium_price_message_sent, 32)
  :: pattern == 2 -> fill_equilibrium_price_message(equilibrium_price_message_sent, 255)
  :: else -> ramp_equilibrium_price_message(equilibrium_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equilibrium_price_message(equilibrium_price_message_sent);
    assert(at == 72);
    at = 0;
    decode_equilibrium_price_message(equilibrium_price_message_got);
    assert(at == 72);
    equal_equilibrium_price_message(equilibrium_price_message_got, equilibrium_price_message_sent)
  }
}

/* Trade Statistics Message: encoded, read back, and compared */
proctype check_trade_statistics_message() {
  TradeStatisticsMessage trade_statistics_message_sent;
  TradeStatisticsMessage trade_statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_statistics_message(trade_statistics_message_sent, 0)
  :: pattern == 1 -> fill_trade_statistics_message(trade_statistics_message_sent, 32)
  :: pattern == 2 -> fill_trade_statistics_message(trade_statistics_message_sent, 255)
  :: else -> ramp_trade_statistics_message(trade_statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_statistics_message(trade_statistics_message_sent);
    assert(at == 89);
    at = 0;
    decode_trade_statistics_message(trade_statistics_message_got);
    assert(at == 89);
    equal_trade_statistics_message(trade_statistics_message_got, trade_statistics_message_sent)
  }
}

/* Reference Price Message: encoded, read back, and compared */
proctype check_reference_price_message() {
  ReferencePriceMessage reference_price_message_sent;
  ReferencePriceMessage reference_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reference_price_message(reference_price_message_sent, 0)
  :: pattern == 1 -> fill_reference_price_message(reference_price_message_sent, 32)
  :: pattern == 2 -> fill_reference_price_message(reference_price_message_sent, 255)
  :: else -> ramp_reference_price_message(reference_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reference_price_message(reference_price_message_sent);
    assert(at == 29);
    at = 0;
    decode_reference_price_message(reference_price_message_got);
    assert(at == 29);
    equal_reference_price_message(reference_price_message_got, reference_price_message_sent)
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
    assert(at == 37);
    at = 0;
    decode_index_message(index_message_got);
    assert(at == 37);
    equal_index_message(index_message_got, index_message_sent)
  }
}

/* Open Interest Message: encoded, read back, and compared */
proctype check_open_interest_message() {
  OpenInterestMessage open_interest_message_sent;
  OpenInterestMessage open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_message(open_interest_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_message(open_interest_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_message(open_interest_message_sent, 255)
  :: else -> ramp_open_interest_message(open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_message(open_interest_message_sent);
    assert(at == 24);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 24);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Trade Ticker Message: encoded, read back, and compared */
proctype check_trade_ticker_message() {
  TradeTickerMessage trade_ticker_message_sent;
  TradeTickerMessage trade_ticker_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_ticker_message(trade_ticker_message_sent, 0)
  :: pattern == 1 -> fill_trade_ticker_message(trade_ticker_message_sent, 32)
  :: pattern == 2 -> fill_trade_ticker_message(trade_ticker_message_sent, 255)
  :: else -> ramp_trade_ticker_message(trade_ticker_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_ticker_message(trade_ticker_message_sent);
    assert(at == 91);
    at = 0;
    decode_trade_ticker_message(trade_ticker_message_got);
    assert(at == 91);
    equal_trade_ticker_message(trade_ticker_message_got, trade_ticker_message_sent)
  }
}

/* Price Limits Message: encoded, read back, and compared */
proctype check_price_limits_message() {
  PriceLimitsMessage price_limits_message_sent;
  PriceLimitsMessage price_limits_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_limits_message(price_limits_message_sent, 0)
  :: pattern == 1 -> fill_price_limits_message(price_limits_message_sent, 32)
  :: pattern == 2 -> fill_price_limits_message(price_limits_message_sent, 255)
  :: else -> ramp_price_limits_message(price_limits_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_limits_message(price_limits_message_sent);
    assert(at == 34);
    at = 0;
    decode_price_limits_message(price_limits_message_got);
    assert(at == 34);
    equal_price_limits_message(price_limits_message_got, price_limits_message_sent)
  }
}

/* End Of Snapshot Message: encoded, read back, and compared */
proctype check_end_of_snapshot_message() {
  EndOfSnapshotMessage end_of_snapshot_message_sent;
  EndOfSnapshotMessage end_of_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 255)
  :: else -> ramp_end_of_snapshot_message(end_of_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_snapshot_message(end_of_snapshot_message_sent);
    assert(at == 20);
    at = 0;
    decode_end_of_snapshot_message(end_of_snapshot_message_got);
    assert(at == 20);
    equal_end_of_snapshot_message(end_of_snapshot_message_got, end_of_snapshot_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_seconds_message()
  :: run check_order_book_directory_message()
  :: run check_exchange_directory_message()
  :: run check_market_directory_message()
  :: run check_combination_order_book_leg_directory_message()
  :: run check_tick_size_table_entry_message()
  :: run check_corporate_action_entry_message()
  :: run check_order_book_directory_extension_message()
  :: run check_system_event_message()
  :: run check_order_book_state_message()
  :: run check_business_date_message()
  :: run check_instrument_status_message()
  :: run check_equilibrium_price_message()
  :: run check_trade_statistics_message()
  :: run check_reference_price_message()
  :: run check_index_message()
  :: run check_open_interest_message()
  :: run check_trade_ticker_message()
  :: run check_price_limits_message()
  :: run check_end_of_snapshot_message()
  fi
}
