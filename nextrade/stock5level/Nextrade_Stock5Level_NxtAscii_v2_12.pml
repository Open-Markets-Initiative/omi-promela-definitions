/*
 * Nextrade Nextrade Stock Market Data 5 Level
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
 *   - a run filling what frames it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 448

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Polling Data Message: 5 bytes ------------------------------------------- */

/* The data is provided periodically in order to check multicast group status. */
typedef PollingDataMessage {
  byte current_time_1_minute_interval[4];
  byte end_keyword
};

int polling_data_message_at;

/* every byte of Polling Data Message set to one value */
inline fill_polling_data_message(polling_data_message_record, polling_data_message_value) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.current_time_1_minute_interval[polling_data_message_at] = polling_data_message_value; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_record.end_keyword = polling_data_message_value;
  skip
}

/* each byte of Polling Data Message set to where it lies, so a field read out of place says so */
inline ramp_polling_data_message(polling_data_message_record, polling_data_message_base) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.current_time_1_minute_interval[polling_data_message_at] = (polling_data_message_base + 0 + polling_data_message_at + 1) % 256; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_record.end_keyword = (polling_data_message_base + 4 + 1) % 256;
  skip
}

/* Polling Data Message to the wire, 5 bytes from where the cursor stands */
inline encode_polling_data_message(polling_data_message_record) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> wire[at] = polling_data_message_record.current_time_1_minute_interval[polling_data_message_at]; at = at + 1; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  wire[at] = polling_data_message_record.end_keyword; at = at + 1;
  skip
}

/* Polling Data Message off the wire, 5 bytes from where the cursor stands */
inline decode_polling_data_message(polling_data_message_record) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.current_time_1_minute_interval[polling_data_message_at] = wire[at]; at = at + 1; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Polling Data Message is what was written, byte for byte */
inline equal_polling_data_message(polling_data_message_read, polling_data_message_written) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> assert(polling_data_message_read.current_time_1_minute_interval[polling_data_message_at] == polling_data_message_written.current_time_1_minute_interval[polling_data_message_at]); polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  assert(polling_data_message_read.end_keyword == polling_data_message_written.end_keyword);
  skip
}

/* ---- Securities Quote 5 Level Message: 355 bytes ----------------------------- */

/* Securities_Quote(MM/LP Quotes Excluded) Best Order Data on NXT Trading Items provided - MM/LP Quotes Excluded * 5 Level Best Order on Ask/Bid. */
typedef SecuritiesQuote5LevelMessage {
  byte message_sequence_number[8];
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte processing_time_of_trading_system[12];
  byte ask_level_1_price[11];
  byte bid_level_1_price[11];
  byte ask_level_1_volume[12];
  byte bid_level_1_volume[12];
  byte ask_level_2_price[11];
  byte bid_level_2_price[11];
  byte ask_level_2_volume[12];
  byte bid_level_2_volume[12];
  byte ask_level_3_price[11];
  byte bid_level_3_price[11];
  byte ask_level_3_volume[12];
  byte bid_level_3_volume[12];
  byte ask_level_4_price[11];
  byte bid_level_4_price[11];
  byte ask_level_4_volume[12];
  byte bid_level_4_volume[12];
  byte ask_level_5_price[11];
  byte bid_level_5_price[11];
  byte ask_level_5_volume[12];
  byte bid_level_5_volume[12];
  byte total_ask_volume_level_10[12];
  byte total_bid_volume_level_10[12];
  byte estimated_trading_price[11];
  byte estimated_trading_volume[12];
  byte mid_price[11];
  byte total_mid_price_ask_volume_total_ask_volume_on_mid_price[12];
  byte total_mid_price_bid_volume_total_bid_volume_on_mid_price[12];
  byte end_keyword
};

int securities_quote5_level_message_at;

/* every byte of Securities Quote 5 Level Message set to one value */
inline fill_securities_quote5_level_message(securities_quote5_level_message_record, securities_quote5_level_message_value) {
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 8 -> securities_quote5_level_message_record.message_sequence_number[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> securities_quote5_level_message_record.board_id[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> securities_quote5_level_message_record.session_id[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.isin_code[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 6 -> securities_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.processing_time_of_trading_system[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_1_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_1_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_1_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_1_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_2_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_2_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_2_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_2_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_3_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_3_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_3_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_3_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_4_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_4_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_4_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_4_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_5_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_5_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_5_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_5_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_ask_volume_level_10[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_bid_volume_level_10[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.estimated_trading_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.estimated_trading_volume[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.mid_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote5_level_message_at] = securities_quote5_level_message_value; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_record.end_keyword = securities_quote5_level_message_value;
  skip
}

/* each byte of Securities Quote 5 Level Message set to where it lies, so a field read out of place says so */
inline ramp_securities_quote5_level_message(securities_quote5_level_message_record, securities_quote5_level_message_base) {
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 8 -> securities_quote5_level_message_record.message_sequence_number[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 0 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> securities_quote5_level_message_record.board_id[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 8 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> securities_quote5_level_message_record.session_id[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 10 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.isin_code[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 12 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 6 -> securities_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 24 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.processing_time_of_trading_system[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 30 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_1_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 42 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_1_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 53 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_1_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 64 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_1_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 76 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_2_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 88 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_2_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 99 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_2_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 110 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_2_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 122 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_3_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 134 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_3_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 145 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_3_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 156 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_3_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 168 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_4_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 180 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_4_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 191 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_4_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 202 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_4_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 214 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_5_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 226 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_5_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 237 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_5_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 248 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_5_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 260 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_ask_volume_level_10[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 272 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_bid_volume_level_10[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 284 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.estimated_trading_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 296 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.estimated_trading_volume[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 307 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.mid_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 319 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 330 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote5_level_message_at] = (securities_quote5_level_message_base + 342 + securities_quote5_level_message_at + 1) % 256; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_record.end_keyword = (securities_quote5_level_message_base + 354 + 1) % 256;
  skip
}

/* Securities Quote 5 Level Message to the wire, 355 bytes from where the cursor stands */
inline encode_securities_quote5_level_message(securities_quote5_level_message_record) {
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 8 -> wire[at] = securities_quote5_level_message_record.message_sequence_number[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> wire[at] = securities_quote5_level_message_record.board_id[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> wire[at] = securities_quote5_level_message_record.session_id[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.isin_code[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 6 -> wire[at] = securities_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.processing_time_of_trading_system[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.ask_level_1_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.bid_level_1_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.ask_level_1_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.bid_level_1_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.ask_level_2_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.bid_level_2_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.ask_level_2_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.bid_level_2_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.ask_level_3_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.bid_level_3_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.ask_level_3_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.bid_level_3_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.ask_level_4_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.bid_level_4_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.ask_level_4_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.bid_level_4_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.ask_level_5_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.bid_level_5_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.ask_level_5_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.bid_level_5_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.total_ask_volume_level_10[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.total_bid_volume_level_10[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.estimated_trading_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.estimated_trading_volume[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> wire[at] = securities_quote5_level_message_record.mid_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> wire[at] = securities_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote5_level_message_at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_quote5_level_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Quote 5 Level Message off the wire, 355 bytes from where the cursor stands */
inline decode_securities_quote5_level_message(securities_quote5_level_message_record) {
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 8 -> securities_quote5_level_message_record.message_sequence_number[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> securities_quote5_level_message_record.board_id[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> securities_quote5_level_message_record.session_id[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.isin_code[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 6 -> securities_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.processing_time_of_trading_system[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_1_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_1_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_1_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_1_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_2_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_2_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_2_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_2_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_3_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_3_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_3_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_3_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_4_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_4_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_4_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_4_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.ask_level_5_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.bid_level_5_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.ask_level_5_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.bid_level_5_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_ask_volume_level_10[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_bid_volume_level_10[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.estimated_trading_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.estimated_trading_volume[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> securities_quote5_level_message_record.mid_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> securities_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote5_level_message_at] = wire[at]; at = at + 1; securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Quote 5 Level Message is what was written, byte for byte */
inline equal_securities_quote5_level_message(securities_quote5_level_message_read, securities_quote5_level_message_written) {
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 8 -> assert(securities_quote5_level_message_read.message_sequence_number[securities_quote5_level_message_at] == securities_quote5_level_message_written.message_sequence_number[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> assert(securities_quote5_level_message_read.board_id[securities_quote5_level_message_at] == securities_quote5_level_message_written.board_id[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 2 -> assert(securities_quote5_level_message_read.session_id[securities_quote5_level_message_at] == securities_quote5_level_message_written.session_id[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.isin_code[securities_quote5_level_message_at] == securities_quote5_level_message_written.isin_code[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 6 -> assert(securities_quote5_level_message_read.a_designated_number_for_an_issue_from_krx[securities_quote5_level_message_at] == securities_quote5_level_message_written.a_designated_number_for_an_issue_from_krx[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.processing_time_of_trading_system[securities_quote5_level_message_at] == securities_quote5_level_message_written.processing_time_of_trading_system[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.ask_level_1_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_1_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.bid_level_1_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_1_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.ask_level_1_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_1_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.bid_level_1_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_1_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.ask_level_2_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_2_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.bid_level_2_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_2_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.ask_level_2_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_2_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.bid_level_2_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_2_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.ask_level_3_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_3_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.bid_level_3_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_3_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.ask_level_3_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_3_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.bid_level_3_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_3_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.ask_level_4_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_4_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.bid_level_4_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_4_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.ask_level_4_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_4_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.bid_level_4_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_4_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.ask_level_5_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_5_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.bid_level_5_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_5_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.ask_level_5_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.ask_level_5_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.bid_level_5_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.bid_level_5_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.total_ask_volume_level_10[securities_quote5_level_message_at] == securities_quote5_level_message_written.total_ask_volume_level_10[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.total_bid_volume_level_10[securities_quote5_level_message_at] == securities_quote5_level_message_written.total_bid_volume_level_10[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.estimated_trading_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.estimated_trading_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.estimated_trading_volume[securities_quote5_level_message_at] == securities_quote5_level_message_written.estimated_trading_volume[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 11 -> assert(securities_quote5_level_message_read.mid_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.mid_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_quote5_level_message_at = 0;
  do
  :: securities_quote5_level_message_at < 12 -> assert(securities_quote5_level_message_read.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote5_level_message_at] == securities_quote5_level_message_written.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote5_level_message_at]); securities_quote5_level_message_at = securities_quote5_level_message_at + 1
  :: else -> break
  od;
  assert(securities_quote5_level_message_read.end_keyword == securities_quote5_level_message_written.end_keyword);
  skip
}

/* ---- Securities Order Filled Plus Quote 5 Level Message: 448 bytes ----------- */

/* Securities_Order Filled With Quote Order Filled data with Best Order on NXT trading items - MM/LP Quotes Excluded * 5 Level Best Order on Ask/Bid. */
typedef SecuritiesOrderFilledPlusQuote5LevelMessage {
  byte message_sequence_number[8];
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte processing_time_of_trading_system[12];
  byte price_change_against_previous_day;
  byte a_price_change_against_the_previous_day[11];
  byte trading_price[11];
  byte trading_volume[10];
  byte opening_price[11];
  byte todays_high[11];
  byte todays_low[11];
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[22];
  byte final_ask_bid_type_code;
  byte lp_holding_quantity[15];
  byte ask_level_1_price[11];
  byte bid_level_1_price[11];
  byte ask_level_1_volume[12];
  byte bid_level_1_volume[12];
  byte ask_level_2_price[11];
  byte bid_level_2_price[11];
  byte ask_level_2_volume[12];
  byte bid_level_2_volume[12];
  byte ask_level_3_price[11];
  byte bid_level_3_price[11];
  byte ask_level_3_volume[12];
  byte bid_level_3_volume[12];
  byte ask_level_4_price[11];
  byte bid_level_4_price[11];
  byte ask_level_4_volume[12];
  byte bid_level_4_volume[12];
  byte ask_level_5_price[11];
  byte bid_level_5_price[11];
  byte ask_level_5_volume[12];
  byte bid_level_5_volume[12];
  byte total_ask_volume_level_10[12];
  byte total_bid_volume_level_10[12];
  byte mid_price[11];
  byte total_mid_price_ask_volume_total_ask_volume_on_mid_price[12];
  byte total_mid_price_bid_volume_total_bid_volume_on_mid_price[12];
  byte end_keyword
};

int securities_order_filled_plus_quote5_level_message_at;

/* every byte of Securities Order Filled Plus Quote 5 Level Message set to one value */
inline fill_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_record, securities_order_filled_plus_quote5_level_message_value) {
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 8 -> securities_order_filled_plus_quote5_level_message_record.message_sequence_number[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> securities_order_filled_plus_quote5_level_message_record.board_id[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> securities_order_filled_plus_quote5_level_message_record.session_id[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.isin_code[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 6 -> securities_order_filled_plus_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.processing_time_of_trading_system[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_record.price_change_against_previous_day = securities_order_filled_plus_quote5_level_message_value;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.a_price_change_against_the_previous_day[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.trading_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 10 -> securities_order_filled_plus_quote5_level_message_record.trading_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.opening_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.todays_high[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.todays_low[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.accumulated_trading_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 22 -> securities_order_filled_plus_quote5_level_message_record.accumulated_trading_value[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_record.final_ask_bid_type_code = securities_order_filled_plus_quote5_level_message_value;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 15 -> securities_order_filled_plus_quote5_level_message_record.lp_holding_quantity[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_1_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_1_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_1_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_1_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_2_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_2_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_2_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_2_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_3_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_3_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_3_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_3_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_4_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_4_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_4_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_4_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_5_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_5_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_5_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_5_volume[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_ask_volume_level_10[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_bid_volume_level_10[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.mid_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at] = securities_order_filled_plus_quote5_level_message_value; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_record.end_keyword = securities_order_filled_plus_quote5_level_message_value;
  skip
}

/* each byte of Securities Order Filled Plus Quote 5 Level Message set to where it lies, so a field read out of place says so */
inline ramp_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_record, securities_order_filled_plus_quote5_level_message_base) {
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 8 -> securities_order_filled_plus_quote5_level_message_record.message_sequence_number[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 0 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> securities_order_filled_plus_quote5_level_message_record.board_id[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 8 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> securities_order_filled_plus_quote5_level_message_record.session_id[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 10 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.isin_code[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 12 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 6 -> securities_order_filled_plus_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 24 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.processing_time_of_trading_system[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 30 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_record.price_change_against_previous_day = (securities_order_filled_plus_quote5_level_message_base + 42 + 1) % 256;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.a_price_change_against_the_previous_day[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 43 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.trading_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 54 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 10 -> securities_order_filled_plus_quote5_level_message_record.trading_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 65 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.opening_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 75 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.todays_high[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 86 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.todays_low[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 97 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.accumulated_trading_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 108 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 22 -> securities_order_filled_plus_quote5_level_message_record.accumulated_trading_value[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 120 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_record.final_ask_bid_type_code = (securities_order_filled_plus_quote5_level_message_base + 142 + 1) % 256;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 15 -> securities_order_filled_plus_quote5_level_message_record.lp_holding_quantity[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 143 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_1_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 158 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_1_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 169 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_1_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 180 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_1_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 192 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_2_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 204 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_2_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 215 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_2_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 226 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_2_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 238 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_3_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 250 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_3_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 261 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_3_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 272 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_3_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 284 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_4_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 296 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_4_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 307 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_4_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 318 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_4_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 330 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_5_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 342 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_5_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 353 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_5_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 364 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_5_volume[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 376 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_ask_volume_level_10[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 388 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_bid_volume_level_10[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 400 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.mid_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 412 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 423 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at] = (securities_order_filled_plus_quote5_level_message_base + 435 + securities_order_filled_plus_quote5_level_message_at + 1) % 256; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_record.end_keyword = (securities_order_filled_plus_quote5_level_message_base + 447 + 1) % 256;
  skip
}

/* Securities Order Filled Plus Quote 5 Level Message to the wire, 448 bytes from where the cursor stands */
inline encode_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_record) {
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 8 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.message_sequence_number[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.board_id[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.session_id[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.isin_code[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 6 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.processing_time_of_trading_system[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_order_filled_plus_quote5_level_message_record.price_change_against_previous_day; at = at + 1;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.a_price_change_against_the_previous_day[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.trading_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 10 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.trading_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.opening_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.todays_high[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.todays_low[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.accumulated_trading_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 22 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.accumulated_trading_value[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_order_filled_plus_quote5_level_message_record.final_ask_bid_type_code; at = at + 1;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 15 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.lp_holding_quantity[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_1_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_1_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_1_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_1_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_2_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_2_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_2_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_2_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_3_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_3_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_3_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_3_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_4_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_4_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_4_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_4_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_5_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_5_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.ask_level_5_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.bid_level_5_volume[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.total_ask_volume_level_10[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.total_bid_volume_level_10[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.mid_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> wire[at] = securities_order_filled_plus_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_order_filled_plus_quote5_level_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Order Filled Plus Quote 5 Level Message off the wire, 448 bytes from where the cursor stands */
inline decode_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_record) {
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 8 -> securities_order_filled_plus_quote5_level_message_record.message_sequence_number[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> securities_order_filled_plus_quote5_level_message_record.board_id[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> securities_order_filled_plus_quote5_level_message_record.session_id[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.isin_code[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 6 -> securities_order_filled_plus_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.processing_time_of_trading_system[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_record.price_change_against_previous_day = wire[at]; at = at + 1;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.a_price_change_against_the_previous_day[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.trading_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 10 -> securities_order_filled_plus_quote5_level_message_record.trading_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.opening_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.todays_high[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.todays_low[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.accumulated_trading_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 22 -> securities_order_filled_plus_quote5_level_message_record.accumulated_trading_value[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_record.final_ask_bid_type_code = wire[at]; at = at + 1;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 15 -> securities_order_filled_plus_quote5_level_message_record.lp_holding_quantity[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_1_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_1_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_1_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_1_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_2_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_2_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_2_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_2_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_3_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_3_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_3_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_3_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_4_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_4_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_4_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_4_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.ask_level_5_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.bid_level_5_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.ask_level_5_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.bid_level_5_volume[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_ask_volume_level_10[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_bid_volume_level_10[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> securities_order_filled_plus_quote5_level_message_record.mid_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> securities_order_filled_plus_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at] = wire[at]; at = at + 1; securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Order Filled Plus Quote 5 Level Message is what was written, byte for byte */
inline equal_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_read, securities_order_filled_plus_quote5_level_message_written) {
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 8 -> assert(securities_order_filled_plus_quote5_level_message_read.message_sequence_number[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.message_sequence_number[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> assert(securities_order_filled_plus_quote5_level_message_read.board_id[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.board_id[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 2 -> assert(securities_order_filled_plus_quote5_level_message_read.session_id[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.session_id[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.isin_code[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.isin_code[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 6 -> assert(securities_order_filled_plus_quote5_level_message_read.a_designated_number_for_an_issue_from_krx[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.a_designated_number_for_an_issue_from_krx[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.processing_time_of_trading_system[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.processing_time_of_trading_system[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  assert(securities_order_filled_plus_quote5_level_message_read.price_change_against_previous_day == securities_order_filled_plus_quote5_level_message_written.price_change_against_previous_day);
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.a_price_change_against_the_previous_day[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.a_price_change_against_the_previous_day[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.trading_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.trading_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 10 -> assert(securities_order_filled_plus_quote5_level_message_read.trading_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.trading_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.opening_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.opening_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.todays_high[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.todays_high[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.todays_low[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.todays_low[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.accumulated_trading_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.accumulated_trading_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 22 -> assert(securities_order_filled_plus_quote5_level_message_read.accumulated_trading_value[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.accumulated_trading_value[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  assert(securities_order_filled_plus_quote5_level_message_read.final_ask_bid_type_code == securities_order_filled_plus_quote5_level_message_written.final_ask_bid_type_code);
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 15 -> assert(securities_order_filled_plus_quote5_level_message_read.lp_holding_quantity[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.lp_holding_quantity[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_1_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_1_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_1_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_1_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_1_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_1_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_1_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_1_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_2_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_2_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_2_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_2_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_2_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_2_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_2_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_2_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_3_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_3_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_3_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_3_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_3_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_3_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_3_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_3_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_4_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_4_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_4_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_4_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_4_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_4_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_4_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_4_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_5_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_5_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_5_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_5_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.ask_level_5_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.ask_level_5_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.bid_level_5_volume[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.bid_level_5_volume[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.total_ask_volume_level_10[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.total_ask_volume_level_10[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.total_bid_volume_level_10[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.total_bid_volume_level_10[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 11 -> assert(securities_order_filled_plus_quote5_level_message_read.mid_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.mid_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  securities_order_filled_plus_quote5_level_message_at = 0;
  do
  :: securities_order_filled_plus_quote5_level_message_at < 12 -> assert(securities_order_filled_plus_quote5_level_message_read.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at] == securities_order_filled_plus_quote5_level_message_written.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_order_filled_plus_quote5_level_message_at]); securities_order_filled_plus_quote5_level_message_at = securities_order_filled_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  assert(securities_order_filled_plus_quote5_level_message_read.end_keyword == securities_order_filled_plus_quote5_level_message_written.end_keyword);
  skip
}

/* ---- Market Operation Ts Plus Quote 5 Level Message: 375 bytes --------------- */

/* Market Operation TS with Best Order on NXT trading items - MM/LP Quotes Excluded The data is provided per an issue if a Market Operation Trading session event occurs and Best Order changes. * 5 Level. */
typedef MarketOperationTsPlusQuote5LevelMessage {
  byte message_sequence_number[8];
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte processing_time_of_trading_system[12];
  byte board_event_id[3];
  byte start_time_of_a_board_event[9];
  byte board_event_group_code[5];
  byte trading_halt_reason_code[3];
  byte ask_level_1_price[11];
  byte bid_level_1_price[11];
  byte ask_level_1_volume[12];
  byte bid_level_1_volume[12];
  byte ask_level_2_price[11];
  byte bid_level_2_price[11];
  byte ask_level_2_volume[12];
  byte bid_level_2_volume[12];
  byte ask_level_3_price[11];
  byte bid_level_3_price[11];
  byte ask_level_3_volume[12];
  byte bid_level_3_volume[12];
  byte ask_level_4_price[11];
  byte bid_level_4_price[11];
  byte ask_level_4_volume[12];
  byte bid_level_4_volume[12];
  byte ask_level_5_price[11];
  byte bid_level_5_price[11];
  byte ask_level_5_volume[12];
  byte bid_level_5_volume[12];
  byte total_ask_volume_level_10[12];
  byte total_bid_volume_level_10[12];
  byte estimated_trading_price[11];
  byte estimated_trading_volume[12];
  byte mid_price[11];
  byte total_mid_price_ask_volume_total_ask_volume_on_mid_price[12];
  byte total_mid_price_bid_volume_total_bid_volume_on_mid_price[12];
  byte end_keyword
};

int market_operation_ts_plus_quote5_level_message_at;

/* every byte of Market Operation Ts Plus Quote 5 Level Message set to one value */
inline fill_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_record, market_operation_ts_plus_quote5_level_message_value) {
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 8 -> market_operation_ts_plus_quote5_level_message_record.message_sequence_number[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> market_operation_ts_plus_quote5_level_message_record.board_id[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> market_operation_ts_plus_quote5_level_message_record.session_id[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.isin_code[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 6 -> market_operation_ts_plus_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.processing_time_of_trading_system[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> market_operation_ts_plus_quote5_level_message_record.board_event_id[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 9 -> market_operation_ts_plus_quote5_level_message_record.start_time_of_a_board_event[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 5 -> market_operation_ts_plus_quote5_level_message_record.board_event_group_code[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> market_operation_ts_plus_quote5_level_message_record.trading_halt_reason_code[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_1_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_1_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_1_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_1_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_2_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_2_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_2_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_2_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_3_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_3_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_3_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_3_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_4_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_4_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_4_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_4_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_5_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_5_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_5_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_5_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_ask_volume_level_10[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_bid_volume_level_10[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.estimated_trading_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.estimated_trading_volume[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.mid_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at] = market_operation_ts_plus_quote5_level_message_value; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_record.end_keyword = market_operation_ts_plus_quote5_level_message_value;
  skip
}

/* each byte of Market Operation Ts Plus Quote 5 Level Message set to where it lies, so a field read out of place says so */
inline ramp_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_record, market_operation_ts_plus_quote5_level_message_base) {
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 8 -> market_operation_ts_plus_quote5_level_message_record.message_sequence_number[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 0 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> market_operation_ts_plus_quote5_level_message_record.board_id[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 8 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> market_operation_ts_plus_quote5_level_message_record.session_id[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 10 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.isin_code[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 12 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 6 -> market_operation_ts_plus_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 24 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.processing_time_of_trading_system[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 30 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> market_operation_ts_plus_quote5_level_message_record.board_event_id[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 42 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 9 -> market_operation_ts_plus_quote5_level_message_record.start_time_of_a_board_event[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 45 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 5 -> market_operation_ts_plus_quote5_level_message_record.board_event_group_code[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 54 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> market_operation_ts_plus_quote5_level_message_record.trading_halt_reason_code[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 59 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_1_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 62 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_1_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 73 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_1_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 84 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_1_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 96 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_2_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 108 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_2_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 119 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_2_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 130 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_2_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 142 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_3_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 154 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_3_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 165 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_3_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 176 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_3_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 188 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_4_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 200 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_4_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 211 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_4_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 222 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_4_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 234 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_5_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 246 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_5_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 257 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_5_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 268 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_5_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 280 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_ask_volume_level_10[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 292 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_bid_volume_level_10[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 304 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.estimated_trading_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 316 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.estimated_trading_volume[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 327 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.mid_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 339 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 350 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at] = (market_operation_ts_plus_quote5_level_message_base + 362 + market_operation_ts_plus_quote5_level_message_at + 1) % 256; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_record.end_keyword = (market_operation_ts_plus_quote5_level_message_base + 374 + 1) % 256;
  skip
}

/* Market Operation Ts Plus Quote 5 Level Message to the wire, 375 bytes from where the cursor stands */
inline encode_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_record) {
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 8 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.message_sequence_number[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.board_id[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.session_id[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.isin_code[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 6 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.processing_time_of_trading_system[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.board_event_id[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 9 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.start_time_of_a_board_event[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 5 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.board_event_group_code[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.trading_halt_reason_code[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_1_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_1_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_1_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_1_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_2_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_2_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_2_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_2_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_3_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_3_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_3_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_3_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_4_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_4_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_4_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_4_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_5_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_5_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.ask_level_5_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.bid_level_5_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.total_ask_volume_level_10[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.total_bid_volume_level_10[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.estimated_trading_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.estimated_trading_volume[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.mid_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> wire[at] = market_operation_ts_plus_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  wire[at] = market_operation_ts_plus_quote5_level_message_record.end_keyword; at = at + 1;
  skip
}

/* Market Operation Ts Plus Quote 5 Level Message off the wire, 375 bytes from where the cursor stands */
inline decode_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_record) {
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 8 -> market_operation_ts_plus_quote5_level_message_record.message_sequence_number[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> market_operation_ts_plus_quote5_level_message_record.board_id[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> market_operation_ts_plus_quote5_level_message_record.session_id[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.isin_code[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 6 -> market_operation_ts_plus_quote5_level_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.processing_time_of_trading_system[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> market_operation_ts_plus_quote5_level_message_record.board_event_id[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 9 -> market_operation_ts_plus_quote5_level_message_record.start_time_of_a_board_event[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 5 -> market_operation_ts_plus_quote5_level_message_record.board_event_group_code[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> market_operation_ts_plus_quote5_level_message_record.trading_halt_reason_code[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_1_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_1_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_1_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_1_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_2_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_2_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_2_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_2_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_3_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_3_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_3_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_3_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_4_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_4_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_4_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_4_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.ask_level_5_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.bid_level_5_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.ask_level_5_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.bid_level_5_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_ask_volume_level_10[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_bid_volume_level_10[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.estimated_trading_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.estimated_trading_volume[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> market_operation_ts_plus_quote5_level_message_record.mid_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> market_operation_ts_plus_quote5_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at] = wire[at]; at = at + 1; market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Operation Ts Plus Quote 5 Level Message is what was written, byte for byte */
inline equal_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_read, market_operation_ts_plus_quote5_level_message_written) {
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 8 -> assert(market_operation_ts_plus_quote5_level_message_read.message_sequence_number[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.message_sequence_number[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> assert(market_operation_ts_plus_quote5_level_message_read.board_id[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.board_id[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 2 -> assert(market_operation_ts_plus_quote5_level_message_read.session_id[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.session_id[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.isin_code[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.isin_code[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 6 -> assert(market_operation_ts_plus_quote5_level_message_read.a_designated_number_for_an_issue_from_krx[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.a_designated_number_for_an_issue_from_krx[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.processing_time_of_trading_system[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.processing_time_of_trading_system[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> assert(market_operation_ts_plus_quote5_level_message_read.board_event_id[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.board_event_id[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 9 -> assert(market_operation_ts_plus_quote5_level_message_read.start_time_of_a_board_event[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.start_time_of_a_board_event[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 5 -> assert(market_operation_ts_plus_quote5_level_message_read.board_event_group_code[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.board_event_group_code[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 3 -> assert(market_operation_ts_plus_quote5_level_message_read.trading_halt_reason_code[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.trading_halt_reason_code[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_1_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_1_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_1_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_1_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_1_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_1_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_1_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_1_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_2_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_2_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_2_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_2_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_2_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_2_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_2_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_2_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_3_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_3_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_3_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_3_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_3_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_3_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_3_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_3_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_4_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_4_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_4_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_4_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_4_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_4_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_4_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_4_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_5_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_5_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_5_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_5_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.ask_level_5_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.ask_level_5_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.bid_level_5_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.bid_level_5_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.total_ask_volume_level_10[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.total_ask_volume_level_10[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.total_bid_volume_level_10[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.total_bid_volume_level_10[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.estimated_trading_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.estimated_trading_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.estimated_trading_volume[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.estimated_trading_volume[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 11 -> assert(market_operation_ts_plus_quote5_level_message_read.mid_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.mid_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.total_mid_price_ask_volume_total_ask_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.total_mid_price_ask_volume_total_ask_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  market_operation_ts_plus_quote5_level_message_at = 0;
  do
  :: market_operation_ts_plus_quote5_level_message_at < 12 -> assert(market_operation_ts_plus_quote5_level_message_read.total_mid_price_bid_volume_total_bid_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at] == market_operation_ts_plus_quote5_level_message_written.total_mid_price_bid_volume_total_bid_volume_on_mid_price[market_operation_ts_plus_quote5_level_message_at]); market_operation_ts_plus_quote5_level_message_at = market_operation_ts_plus_quote5_level_message_at + 1
  :: else -> break
  od;
  assert(market_operation_ts_plus_quote5_level_message_read.end_keyword == market_operation_ts_plus_quote5_level_message_written.end_keyword);
  skip
}

/* ---- Securities Order Filled Message: 181 bytes ------------------------------ */

/* Securities_Order Filled Order Filled Data on NXT trading items provided. */
typedef SecuritiesOrderFilledMessage {
  byte message_sequence_number[8];
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte processing_time_of_trading_system[12];
  byte price_change_against_previous_day;
  byte a_price_change_against_the_previous_day[11];
  byte trading_price[11];
  byte trading_volume[10];
  byte opening_price[11];
  byte todays_high[11];
  byte todays_low[11];
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[22];
  byte final_ask_bid_type_code;
  byte lp_holding_quantity[15];
  byte the_best_ask[11];
  byte the_best_bid[11];
  byte end_keyword
};

int securities_order_filled_message_at;

/* every byte of Securities Order Filled Message set to one value */
inline fill_securities_order_filled_message(securities_order_filled_message_record, securities_order_filled_message_value) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.message_sequence_number[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> securities_order_filled_message_record.board_id[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> securities_order_filled_message_record.session_id[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.isin_code[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 6 -> securities_order_filled_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.processing_time_of_trading_system[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.price_change_against_previous_day = securities_order_filled_message_value;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.a_price_change_against_the_previous_day[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.trading_price[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 10 -> securities_order_filled_message_record.trading_volume[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.opening_price[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.todays_high[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.todays_low[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.accumulated_trading_volume[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 22 -> securities_order_filled_message_record.accumulated_trading_value[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.final_ask_bid_type_code = securities_order_filled_message_value;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 15 -> securities_order_filled_message_record.lp_holding_quantity[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.the_best_ask[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.the_best_bid[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.end_keyword = securities_order_filled_message_value;
  skip
}

/* each byte of Securities Order Filled Message set to where it lies, so a field read out of place says so */
inline ramp_securities_order_filled_message(securities_order_filled_message_record, securities_order_filled_message_base) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.message_sequence_number[securities_order_filled_message_at] = (securities_order_filled_message_base + 0 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> securities_order_filled_message_record.board_id[securities_order_filled_message_at] = (securities_order_filled_message_base + 8 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> securities_order_filled_message_record.session_id[securities_order_filled_message_at] = (securities_order_filled_message_base + 10 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.isin_code[securities_order_filled_message_at] = (securities_order_filled_message_base + 12 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 6 -> securities_order_filled_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at] = (securities_order_filled_message_base + 24 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.processing_time_of_trading_system[securities_order_filled_message_at] = (securities_order_filled_message_base + 30 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.price_change_against_previous_day = (securities_order_filled_message_base + 42 + 1) % 256;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.a_price_change_against_the_previous_day[securities_order_filled_message_at] = (securities_order_filled_message_base + 43 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.trading_price[securities_order_filled_message_at] = (securities_order_filled_message_base + 54 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 10 -> securities_order_filled_message_record.trading_volume[securities_order_filled_message_at] = (securities_order_filled_message_base + 65 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.opening_price[securities_order_filled_message_at] = (securities_order_filled_message_base + 75 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.todays_high[securities_order_filled_message_at] = (securities_order_filled_message_base + 86 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.todays_low[securities_order_filled_message_at] = (securities_order_filled_message_base + 97 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.accumulated_trading_volume[securities_order_filled_message_at] = (securities_order_filled_message_base + 108 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 22 -> securities_order_filled_message_record.accumulated_trading_value[securities_order_filled_message_at] = (securities_order_filled_message_base + 120 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.final_ask_bid_type_code = (securities_order_filled_message_base + 142 + 1) % 256;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 15 -> securities_order_filled_message_record.lp_holding_quantity[securities_order_filled_message_at] = (securities_order_filled_message_base + 143 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.the_best_ask[securities_order_filled_message_at] = (securities_order_filled_message_base + 158 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.the_best_bid[securities_order_filled_message_at] = (securities_order_filled_message_base + 169 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.end_keyword = (securities_order_filled_message_base + 180 + 1) % 256;
  skip
}

/* Securities Order Filled Message to the wire, 181 bytes from where the cursor stands */
inline encode_securities_order_filled_message(securities_order_filled_message_record) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.message_sequence_number[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> wire[at] = securities_order_filled_message_record.board_id[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> wire[at] = securities_order_filled_message_record.session_id[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> wire[at] = securities_order_filled_message_record.isin_code[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 6 -> wire[at] = securities_order_filled_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> wire[at] = securities_order_filled_message_record.processing_time_of_trading_system[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_order_filled_message_record.price_change_against_previous_day; at = at + 1;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> wire[at] = securities_order_filled_message_record.a_price_change_against_the_previous_day[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> wire[at] = securities_order_filled_message_record.trading_price[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 10 -> wire[at] = securities_order_filled_message_record.trading_volume[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> wire[at] = securities_order_filled_message_record.opening_price[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> wire[at] = securities_order_filled_message_record.todays_high[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> wire[at] = securities_order_filled_message_record.todays_low[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> wire[at] = securities_order_filled_message_record.accumulated_trading_volume[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 22 -> wire[at] = securities_order_filled_message_record.accumulated_trading_value[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_order_filled_message_record.final_ask_bid_type_code; at = at + 1;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 15 -> wire[at] = securities_order_filled_message_record.lp_holding_quantity[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> wire[at] = securities_order_filled_message_record.the_best_ask[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> wire[at] = securities_order_filled_message_record.the_best_bid[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_order_filled_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Order Filled Message off the wire, 181 bytes from where the cursor stands */
inline decode_securities_order_filled_message(securities_order_filled_message_record) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.message_sequence_number[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> securities_order_filled_message_record.board_id[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> securities_order_filled_message_record.session_id[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.isin_code[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 6 -> securities_order_filled_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.processing_time_of_trading_system[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.price_change_against_previous_day = wire[at]; at = at + 1;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.a_price_change_against_the_previous_day[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.trading_price[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 10 -> securities_order_filled_message_record.trading_volume[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.opening_price[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.todays_high[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.todays_low[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.accumulated_trading_volume[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 22 -> securities_order_filled_message_record.accumulated_trading_value[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.final_ask_bid_type_code = wire[at]; at = at + 1;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 15 -> securities_order_filled_message_record.lp_holding_quantity[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.the_best_ask[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> securities_order_filled_message_record.the_best_bid[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Order Filled Message is what was written, byte for byte */
inline equal_securities_order_filled_message(securities_order_filled_message_read, securities_order_filled_message_written) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.message_sequence_number[securities_order_filled_message_at] == securities_order_filled_message_written.message_sequence_number[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> assert(securities_order_filled_message_read.board_id[securities_order_filled_message_at] == securities_order_filled_message_written.board_id[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> assert(securities_order_filled_message_read.session_id[securities_order_filled_message_at] == securities_order_filled_message_written.session_id[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> assert(securities_order_filled_message_read.isin_code[securities_order_filled_message_at] == securities_order_filled_message_written.isin_code[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 6 -> assert(securities_order_filled_message_read.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at] == securities_order_filled_message_written.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> assert(securities_order_filled_message_read.processing_time_of_trading_system[securities_order_filled_message_at] == securities_order_filled_message_written.processing_time_of_trading_system[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  assert(securities_order_filled_message_read.price_change_against_previous_day == securities_order_filled_message_written.price_change_against_previous_day);
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> assert(securities_order_filled_message_read.a_price_change_against_the_previous_day[securities_order_filled_message_at] == securities_order_filled_message_written.a_price_change_against_the_previous_day[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> assert(securities_order_filled_message_read.trading_price[securities_order_filled_message_at] == securities_order_filled_message_written.trading_price[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 10 -> assert(securities_order_filled_message_read.trading_volume[securities_order_filled_message_at] == securities_order_filled_message_written.trading_volume[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> assert(securities_order_filled_message_read.opening_price[securities_order_filled_message_at] == securities_order_filled_message_written.opening_price[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> assert(securities_order_filled_message_read.todays_high[securities_order_filled_message_at] == securities_order_filled_message_written.todays_high[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> assert(securities_order_filled_message_read.todays_low[securities_order_filled_message_at] == securities_order_filled_message_written.todays_low[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> assert(securities_order_filled_message_read.accumulated_trading_volume[securities_order_filled_message_at] == securities_order_filled_message_written.accumulated_trading_volume[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 22 -> assert(securities_order_filled_message_read.accumulated_trading_value[securities_order_filled_message_at] == securities_order_filled_message_written.accumulated_trading_value[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  assert(securities_order_filled_message_read.final_ask_bid_type_code == securities_order_filled_message_written.final_ask_bid_type_code);
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 15 -> assert(securities_order_filled_message_read.lp_holding_quantity[securities_order_filled_message_at] == securities_order_filled_message_written.lp_holding_quantity[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> assert(securities_order_filled_message_read.the_best_ask[securities_order_filled_message_at] == securities_order_filled_message_written.the_best_ask[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 11 -> assert(securities_order_filled_message_read.the_best_bid[securities_order_filled_message_at] == securities_order_filled_message_written.the_best_bid[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  assert(securities_order_filled_message_read.end_keyword == securities_order_filled_message_written.end_keyword);
  skip
}

/* ---- Market Operation Ts Message: 63 bytes ----------------------------------- */

/* The data is provided per an issue if a Market Operation Trading session event occurs. */
typedef MarketOperationTsMessage {
  byte message_sequence_number[8];
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte processing_time_of_trading_system[12];
  byte board_event_id[3];
  byte start_time_of_a_board_event[9];
  byte board_event_group_code[5];
  byte trading_halt_reason_code[3];
  byte end_keyword
};

int market_operation_ts_message_at;

/* every byte of Market Operation Ts Message set to one value */
inline fill_market_operation_ts_message(market_operation_ts_message_record, market_operation_ts_message_value) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 8 -> market_operation_ts_message_record.message_sequence_number[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> market_operation_ts_message_record.board_id[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> market_operation_ts_message_record.session_id[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> market_operation_ts_message_record.isin_code[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 6 -> market_operation_ts_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> market_operation_ts_message_record.processing_time_of_trading_system[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.board_event_id[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 9 -> market_operation_ts_message_record.start_time_of_a_board_event[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 5 -> market_operation_ts_message_record.board_event_group_code[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.trading_halt_reason_code[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_record.end_keyword = market_operation_ts_message_value;
  skip
}

/* each byte of Market Operation Ts Message set to where it lies, so a field read out of place says so */
inline ramp_market_operation_ts_message(market_operation_ts_message_record, market_operation_ts_message_base) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 8 -> market_operation_ts_message_record.message_sequence_number[market_operation_ts_message_at] = (market_operation_ts_message_base + 0 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> market_operation_ts_message_record.board_id[market_operation_ts_message_at] = (market_operation_ts_message_base + 8 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> market_operation_ts_message_record.session_id[market_operation_ts_message_at] = (market_operation_ts_message_base + 10 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> market_operation_ts_message_record.isin_code[market_operation_ts_message_at] = (market_operation_ts_message_base + 12 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 6 -> market_operation_ts_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at] = (market_operation_ts_message_base + 24 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> market_operation_ts_message_record.processing_time_of_trading_system[market_operation_ts_message_at] = (market_operation_ts_message_base + 30 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.board_event_id[market_operation_ts_message_at] = (market_operation_ts_message_base + 42 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 9 -> market_operation_ts_message_record.start_time_of_a_board_event[market_operation_ts_message_at] = (market_operation_ts_message_base + 45 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 5 -> market_operation_ts_message_record.board_event_group_code[market_operation_ts_message_at] = (market_operation_ts_message_base + 54 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.trading_halt_reason_code[market_operation_ts_message_at] = (market_operation_ts_message_base + 59 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_record.end_keyword = (market_operation_ts_message_base + 62 + 1) % 256;
  skip
}

/* Market Operation Ts Message to the wire, 63 bytes from where the cursor stands */
inline encode_market_operation_ts_message(market_operation_ts_message_record) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 8 -> wire[at] = market_operation_ts_message_record.message_sequence_number[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> wire[at] = market_operation_ts_message_record.board_id[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> wire[at] = market_operation_ts_message_record.session_id[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> wire[at] = market_operation_ts_message_record.isin_code[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 6 -> wire[at] = market_operation_ts_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> wire[at] = market_operation_ts_message_record.processing_time_of_trading_system[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> wire[at] = market_operation_ts_message_record.board_event_id[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 9 -> wire[at] = market_operation_ts_message_record.start_time_of_a_board_event[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 5 -> wire[at] = market_operation_ts_message_record.board_event_group_code[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> wire[at] = market_operation_ts_message_record.trading_halt_reason_code[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  wire[at] = market_operation_ts_message_record.end_keyword; at = at + 1;
  skip
}

/* Market Operation Ts Message off the wire, 63 bytes from where the cursor stands */
inline decode_market_operation_ts_message(market_operation_ts_message_record) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 8 -> market_operation_ts_message_record.message_sequence_number[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> market_operation_ts_message_record.board_id[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> market_operation_ts_message_record.session_id[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> market_operation_ts_message_record.isin_code[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 6 -> market_operation_ts_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> market_operation_ts_message_record.processing_time_of_trading_system[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.board_event_id[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 9 -> market_operation_ts_message_record.start_time_of_a_board_event[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 5 -> market_operation_ts_message_record.board_event_group_code[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.trading_halt_reason_code[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Operation Ts Message is what was written, byte for byte */
inline equal_market_operation_ts_message(market_operation_ts_message_read, market_operation_ts_message_written) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 8 -> assert(market_operation_ts_message_read.message_sequence_number[market_operation_ts_message_at] == market_operation_ts_message_written.message_sequence_number[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> assert(market_operation_ts_message_read.board_id[market_operation_ts_message_at] == market_operation_ts_message_written.board_id[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> assert(market_operation_ts_message_read.session_id[market_operation_ts_message_at] == market_operation_ts_message_written.session_id[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> assert(market_operation_ts_message_read.isin_code[market_operation_ts_message_at] == market_operation_ts_message_written.isin_code[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 6 -> assert(market_operation_ts_message_read.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at] == market_operation_ts_message_written.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> assert(market_operation_ts_message_read.processing_time_of_trading_system[market_operation_ts_message_at] == market_operation_ts_message_written.processing_time_of_trading_system[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> assert(market_operation_ts_message_read.board_event_id[market_operation_ts_message_at] == market_operation_ts_message_written.board_event_id[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 9 -> assert(market_operation_ts_message_read.start_time_of_a_board_event[market_operation_ts_message_at] == market_operation_ts_message_written.start_time_of_a_board_event[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 5 -> assert(market_operation_ts_message_read.board_event_group_code[market_operation_ts_message_at] == market_operation_ts_message_written.board_event_group_code[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> assert(market_operation_ts_message_read.trading_halt_reason_code[market_operation_ts_message_at] == market_operation_ts_message_written.trading_halt_reason_code[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  assert(market_operation_ts_message_read.end_keyword == market_operation_ts_message_written.end_keyword);
  skip
}

/* ---- Issue Closing Message: 107 bytes ---------------------------------------- */

/* The data is provided in case of an issue closing per board. */
typedef IssueClosingMessage {
  byte message_sequence_number[8];
  byte board_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte closing_price[11];
  byte closing_price_type_code;
  byte upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[11];
  byte lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[11];
  byte closing_price_weighted_stock_price_average[11];
  byte closing_price_base_price_of_buy_in[11];
  byte closing_price_upper_limit_of_buy_in[11];
  byte closing_price_lower_limit_of_buy_in[11];
  byte end_keyword
};

int issue_closing_message_at;

/* every byte of Issue Closing Message set to one value */
inline fill_issue_closing_message(issue_closing_message_record, issue_closing_message_value) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.message_sequence_number[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 2 -> issue_closing_message_record.board_id[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 12 -> issue_closing_message_record.isin_code[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 6 -> issue_closing_message_record.a_designated_number_for_an_issue_from_krx[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_record.closing_price_type_code = issue_closing_message_value;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_weighted_stock_price_average[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_base_price_of_buy_in[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_upper_limit_of_buy_in[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_lower_limit_of_buy_in[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_record.end_keyword = issue_closing_message_value;
  skip
}

/* each byte of Issue Closing Message set to where it lies, so a field read out of place says so */
inline ramp_issue_closing_message(issue_closing_message_record, issue_closing_message_base) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.message_sequence_number[issue_closing_message_at] = (issue_closing_message_base + 0 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 2 -> issue_closing_message_record.board_id[issue_closing_message_at] = (issue_closing_message_base + 8 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 12 -> issue_closing_message_record.isin_code[issue_closing_message_at] = (issue_closing_message_base + 10 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 6 -> issue_closing_message_record.a_designated_number_for_an_issue_from_krx[issue_closing_message_at] = (issue_closing_message_base + 22 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price[issue_closing_message_at] = (issue_closing_message_base + 28 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_record.closing_price_type_code = (issue_closing_message_base + 39 + 1) % 256;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = (issue_closing_message_base + 40 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = (issue_closing_message_base + 51 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_weighted_stock_price_average[issue_closing_message_at] = (issue_closing_message_base + 62 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_base_price_of_buy_in[issue_closing_message_at] = (issue_closing_message_base + 73 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_upper_limit_of_buy_in[issue_closing_message_at] = (issue_closing_message_base + 84 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_lower_limit_of_buy_in[issue_closing_message_at] = (issue_closing_message_base + 95 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_record.end_keyword = (issue_closing_message_base + 106 + 1) % 256;
  skip
}

/* Issue Closing Message to the wire, 107 bytes from where the cursor stands */
inline encode_issue_closing_message(issue_closing_message_record) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> wire[at] = issue_closing_message_record.message_sequence_number[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 2 -> wire[at] = issue_closing_message_record.board_id[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 12 -> wire[at] = issue_closing_message_record.isin_code[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 6 -> wire[at] = issue_closing_message_record.a_designated_number_for_an_issue_from_krx[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> wire[at] = issue_closing_message_record.closing_price[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_closing_message_record.closing_price_type_code; at = at + 1;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> wire[at] = issue_closing_message_record.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> wire[at] = issue_closing_message_record.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> wire[at] = issue_closing_message_record.closing_price_weighted_stock_price_average[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> wire[at] = issue_closing_message_record.closing_price_base_price_of_buy_in[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> wire[at] = issue_closing_message_record.closing_price_upper_limit_of_buy_in[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> wire[at] = issue_closing_message_record.closing_price_lower_limit_of_buy_in[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_closing_message_record.end_keyword; at = at + 1;
  skip
}

/* Issue Closing Message off the wire, 107 bytes from where the cursor stands */
inline decode_issue_closing_message(issue_closing_message_record) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.message_sequence_number[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 2 -> issue_closing_message_record.board_id[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 12 -> issue_closing_message_record.isin_code[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 6 -> issue_closing_message_record.a_designated_number_for_an_issue_from_krx[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_record.closing_price_type_code = wire[at]; at = at + 1;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_weighted_stock_price_average[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_base_price_of_buy_in[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_upper_limit_of_buy_in[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> issue_closing_message_record.closing_price_lower_limit_of_buy_in[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Issue Closing Message is what was written, byte for byte */
inline equal_issue_closing_message(issue_closing_message_read, issue_closing_message_written) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> assert(issue_closing_message_read.message_sequence_number[issue_closing_message_at] == issue_closing_message_written.message_sequence_number[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 2 -> assert(issue_closing_message_read.board_id[issue_closing_message_at] == issue_closing_message_written.board_id[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 12 -> assert(issue_closing_message_read.isin_code[issue_closing_message_at] == issue_closing_message_written.isin_code[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 6 -> assert(issue_closing_message_read.a_designated_number_for_an_issue_from_krx[issue_closing_message_at] == issue_closing_message_written.a_designated_number_for_an_issue_from_krx[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> assert(issue_closing_message_read.closing_price[issue_closing_message_at] == issue_closing_message_written.closing_price[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  assert(issue_closing_message_read.closing_price_type_code == issue_closing_message_written.closing_price_type_code);
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> assert(issue_closing_message_read.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] == issue_closing_message_written.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> assert(issue_closing_message_read.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] == issue_closing_message_written.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> assert(issue_closing_message_read.closing_price_weighted_stock_price_average[issue_closing_message_at] == issue_closing_message_written.closing_price_weighted_stock_price_average[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> assert(issue_closing_message_read.closing_price_base_price_of_buy_in[issue_closing_message_at] == issue_closing_message_written.closing_price_base_price_of_buy_in[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> assert(issue_closing_message_read.closing_price_upper_limit_of_buy_in[issue_closing_message_at] == issue_closing_message_written.closing_price_upper_limit_of_buy_in[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 11 -> assert(issue_closing_message_read.closing_price_lower_limit_of_buy_in[issue_closing_message_at] == issue_closing_message_written.closing_price_lower_limit_of_buy_in[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  assert(issue_closing_message_read.end_keyword == issue_closing_message_written.end_keyword);
  skip
}

/* ---- Triggering Removing Vi Message: 111 bytes ------------------------------- */

/* Triggering/removing VI (Volatility Interruption). */
typedef TriggeringRemovingViMessage {
  byte message_sequence_number[8];
  byte board_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte processing_time_of_trading_system[12];
  byte the_time_ending_vi[9];
  byte vi_status_code;
  byte vi_type_code;
  byte a_base_price_to_trigger_static_vi[11];
  byte a_base_price_to_trigger_dynamic_vi[11];
  byte vi_triggering_price[11];
  byte disparate_ratio_to_trigger_static_vi[13];
  byte disparate_ratio_to_trigger_dynamic_vi[13];
  byte end_keyword
};

int triggering_removing_vi_message_at;

/* every byte of Triggering Removing Vi Message set to one value */
inline fill_triggering_removing_vi_message(triggering_removing_vi_message_record, triggering_removing_vi_message_value) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.message_sequence_number[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 2 -> triggering_removing_vi_message_record.board_id[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> triggering_removing_vi_message_record.isin_code[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 6 -> triggering_removing_vi_message_record.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> triggering_removing_vi_message_record.processing_time_of_trading_system[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 9 -> triggering_removing_vi_message_record.the_time_ending_vi[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_record.vi_status_code = triggering_removing_vi_message_value;
  triggering_removing_vi_message_record.vi_type_code = triggering_removing_vi_message_value;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> triggering_removing_vi_message_record.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> triggering_removing_vi_message_record.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> triggering_removing_vi_message_record.vi_triggering_price[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_record.end_keyword = triggering_removing_vi_message_value;
  skip
}

/* each byte of Triggering Removing Vi Message set to where it lies, so a field read out of place says so */
inline ramp_triggering_removing_vi_message(triggering_removing_vi_message_record, triggering_removing_vi_message_base) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.message_sequence_number[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 0 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 2 -> triggering_removing_vi_message_record.board_id[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 8 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> triggering_removing_vi_message_record.isin_code[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 10 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 6 -> triggering_removing_vi_message_record.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 22 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> triggering_removing_vi_message_record.processing_time_of_trading_system[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 28 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 9 -> triggering_removing_vi_message_record.the_time_ending_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 40 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_record.vi_status_code = (triggering_removing_vi_message_base + 49 + 1) % 256;
  triggering_removing_vi_message_record.vi_type_code = (triggering_removing_vi_message_base + 50 + 1) % 256;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> triggering_removing_vi_message_record.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 51 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> triggering_removing_vi_message_record.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 62 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> triggering_removing_vi_message_record.vi_triggering_price[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 73 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 84 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 97 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_record.end_keyword = (triggering_removing_vi_message_base + 110 + 1) % 256;
  skip
}

/* Triggering Removing Vi Message to the wire, 111 bytes from where the cursor stands */
inline encode_triggering_removing_vi_message(triggering_removing_vi_message_record) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> wire[at] = triggering_removing_vi_message_record.message_sequence_number[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 2 -> wire[at] = triggering_removing_vi_message_record.board_id[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> wire[at] = triggering_removing_vi_message_record.isin_code[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 6 -> wire[at] = triggering_removing_vi_message_record.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> wire[at] = triggering_removing_vi_message_record.processing_time_of_trading_system[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 9 -> wire[at] = triggering_removing_vi_message_record.the_time_ending_vi[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  wire[at] = triggering_removing_vi_message_record.vi_status_code; at = at + 1;
  wire[at] = triggering_removing_vi_message_record.vi_type_code; at = at + 1;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> wire[at] = triggering_removing_vi_message_record.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> wire[at] = triggering_removing_vi_message_record.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> wire[at] = triggering_removing_vi_message_record.vi_triggering_price[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> wire[at] = triggering_removing_vi_message_record.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> wire[at] = triggering_removing_vi_message_record.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  wire[at] = triggering_removing_vi_message_record.end_keyword; at = at + 1;
  skip
}

/* Triggering Removing Vi Message off the wire, 111 bytes from where the cursor stands */
inline decode_triggering_removing_vi_message(triggering_removing_vi_message_record) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.message_sequence_number[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 2 -> triggering_removing_vi_message_record.board_id[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> triggering_removing_vi_message_record.isin_code[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 6 -> triggering_removing_vi_message_record.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> triggering_removing_vi_message_record.processing_time_of_trading_system[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 9 -> triggering_removing_vi_message_record.the_time_ending_vi[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_record.vi_status_code = wire[at]; at = at + 1;
  triggering_removing_vi_message_record.vi_type_code = wire[at]; at = at + 1;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> triggering_removing_vi_message_record.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> triggering_removing_vi_message_record.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> triggering_removing_vi_message_record.vi_triggering_price[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Triggering Removing Vi Message is what was written, byte for byte */
inline equal_triggering_removing_vi_message(triggering_removing_vi_message_read, triggering_removing_vi_message_written) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> assert(triggering_removing_vi_message_read.message_sequence_number[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.message_sequence_number[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 2 -> assert(triggering_removing_vi_message_read.board_id[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.board_id[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> assert(triggering_removing_vi_message_read.isin_code[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.isin_code[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 6 -> assert(triggering_removing_vi_message_read.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> assert(triggering_removing_vi_message_read.processing_time_of_trading_system[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.processing_time_of_trading_system[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 9 -> assert(triggering_removing_vi_message_read.the_time_ending_vi[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.the_time_ending_vi[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  assert(triggering_removing_vi_message_read.vi_status_code == triggering_removing_vi_message_written.vi_status_code);
  assert(triggering_removing_vi_message_read.vi_type_code == triggering_removing_vi_message_written.vi_type_code);
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> assert(triggering_removing_vi_message_read.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> assert(triggering_removing_vi_message_read.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 11 -> assert(triggering_removing_vi_message_read.vi_triggering_price[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.vi_triggering_price[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> assert(triggering_removing_vi_message_read.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 13 -> assert(triggering_removing_vi_message_read.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  assert(triggering_removing_vi_message_read.end_keyword == triggering_removing_vi_message_written.end_keyword);
  skip
}

/* ---- Closing Price Trading Quote Message: 53 bytes --------------------------- */

/* Total Ask/Bid volume per Issue on Closing Price Trade. */
typedef ClosingPriceTradingQuoteMessage {
  byte message_sequence_number[8];
  byte board_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte total_ask_volume[12];
  byte total_bid_volume[12];
  byte end_keyword
};

int closing_price_trading_quote_message_at;

/* every byte of Closing Price Trading Quote Message set to one value */
inline fill_closing_price_trading_quote_message(closing_price_trading_quote_message_record, closing_price_trading_quote_message_value) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> closing_price_trading_quote_message_record.message_sequence_number[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 2 -> closing_price_trading_quote_message_record.board_id[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.isin_code[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 6 -> closing_price_trading_quote_message_record.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.total_ask_volume[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.total_bid_volume[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_record.end_keyword = closing_price_trading_quote_message_value;
  skip
}

/* each byte of Closing Price Trading Quote Message set to where it lies, so a field read out of place says so */
inline ramp_closing_price_trading_quote_message(closing_price_trading_quote_message_record, closing_price_trading_quote_message_base) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> closing_price_trading_quote_message_record.message_sequence_number[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 0 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 2 -> closing_price_trading_quote_message_record.board_id[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 8 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.isin_code[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 10 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 6 -> closing_price_trading_quote_message_record.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 22 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.total_ask_volume[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 28 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.total_bid_volume[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 40 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_record.end_keyword = (closing_price_trading_quote_message_base + 52 + 1) % 256;
  skip
}

/* Closing Price Trading Quote Message to the wire, 53 bytes from where the cursor stands */
inline encode_closing_price_trading_quote_message(closing_price_trading_quote_message_record) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> wire[at] = closing_price_trading_quote_message_record.message_sequence_number[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 2 -> wire[at] = closing_price_trading_quote_message_record.board_id[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> wire[at] = closing_price_trading_quote_message_record.isin_code[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 6 -> wire[at] = closing_price_trading_quote_message_record.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> wire[at] = closing_price_trading_quote_message_record.total_ask_volume[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> wire[at] = closing_price_trading_quote_message_record.total_bid_volume[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = closing_price_trading_quote_message_record.end_keyword; at = at + 1;
  skip
}

/* Closing Price Trading Quote Message off the wire, 53 bytes from where the cursor stands */
inline decode_closing_price_trading_quote_message(closing_price_trading_quote_message_record) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> closing_price_trading_quote_message_record.message_sequence_number[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 2 -> closing_price_trading_quote_message_record.board_id[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.isin_code[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 6 -> closing_price_trading_quote_message_record.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.total_ask_volume[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.total_bid_volume[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Closing Price Trading Quote Message is what was written, byte for byte */
inline equal_closing_price_trading_quote_message(closing_price_trading_quote_message_read, closing_price_trading_quote_message_written) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> assert(closing_price_trading_quote_message_read.message_sequence_number[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.message_sequence_number[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 2 -> assert(closing_price_trading_quote_message_read.board_id[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.board_id[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> assert(closing_price_trading_quote_message_read.isin_code[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.isin_code[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 6 -> assert(closing_price_trading_quote_message_read.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> assert(closing_price_trading_quote_message_read.total_ask_volume[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.total_ask_volume[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> assert(closing_price_trading_quote_message_read.total_bid_volume[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.total_bid_volume[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  assert(closing_price_trading_quote_message_read.end_keyword == closing_price_trading_quote_message_written.end_keyword);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Polling Data Message: encoded, read back, and compared */
proctype check_polling_data_message() {
  PollingDataMessage polling_data_message_sent;
  PollingDataMessage polling_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_polling_data_message(polling_data_message_sent, 0)
  :: pattern == 1 -> fill_polling_data_message(polling_data_message_sent, 32)
  :: pattern == 2 -> fill_polling_data_message(polling_data_message_sent, 255)
  :: else -> ramp_polling_data_message(polling_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_polling_data_message(polling_data_message_sent);
    assert(at == 5);
    at = 0;
    decode_polling_data_message(polling_data_message_got);
    assert(at == 5);
    equal_polling_data_message(polling_data_message_got, polling_data_message_sent)
  }
}

/* Securities Quote 5 Level Message: encoded, read back, and compared */
proctype check_securities_quote5_level_message() {
  SecuritiesQuote5LevelMessage securities_quote5_level_message_sent;
  SecuritiesQuote5LevelMessage securities_quote5_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_quote5_level_message(securities_quote5_level_message_sent, 0)
  :: pattern == 1 -> fill_securities_quote5_level_message(securities_quote5_level_message_sent, 32)
  :: pattern == 2 -> fill_securities_quote5_level_message(securities_quote5_level_message_sent, 255)
  :: else -> ramp_securities_quote5_level_message(securities_quote5_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_quote5_level_message(securities_quote5_level_message_sent);
    assert(at == 355);
    at = 0;
    decode_securities_quote5_level_message(securities_quote5_level_message_got);
    assert(at == 355);
    equal_securities_quote5_level_message(securities_quote5_level_message_got, securities_quote5_level_message_sent)
  }
}

/* Securities Order Filled Plus Quote 5 Level Message: encoded, read back, and compared */
proctype check_securities_order_filled_plus_quote5_level_message() {
  SecuritiesOrderFilledPlusQuote5LevelMessage securities_order_filled_plus_quote5_level_message_sent;
  SecuritiesOrderFilledPlusQuote5LevelMessage securities_order_filled_plus_quote5_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_sent, 0)
  :: pattern == 1 -> fill_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_sent, 32)
  :: pattern == 2 -> fill_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_sent, 255)
  :: else -> ramp_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_sent);
    assert(at == 448);
    at = 0;
    decode_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_got);
    assert(at == 448);
    equal_securities_order_filled_plus_quote5_level_message(securities_order_filled_plus_quote5_level_message_got, securities_order_filled_plus_quote5_level_message_sent)
  }
}

/* Market Operation Ts Plus Quote 5 Level Message: encoded, read back, and compared */
proctype check_market_operation_ts_plus_quote5_level_message() {
  MarketOperationTsPlusQuote5LevelMessage market_operation_ts_plus_quote5_level_message_sent;
  MarketOperationTsPlusQuote5LevelMessage market_operation_ts_plus_quote5_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_sent, 0)
  :: pattern == 1 -> fill_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_sent, 32)
  :: pattern == 2 -> fill_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_sent, 255)
  :: else -> ramp_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_sent);
    assert(at == 375);
    at = 0;
    decode_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_got);
    assert(at == 375);
    equal_market_operation_ts_plus_quote5_level_message(market_operation_ts_plus_quote5_level_message_got, market_operation_ts_plus_quote5_level_message_sent)
  }
}

/* Securities Order Filled Message: encoded, read back, and compared */
proctype check_securities_order_filled_message() {
  SecuritiesOrderFilledMessage securities_order_filled_message_sent;
  SecuritiesOrderFilledMessage securities_order_filled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_order_filled_message(securities_order_filled_message_sent, 0)
  :: pattern == 1 -> fill_securities_order_filled_message(securities_order_filled_message_sent, 32)
  :: pattern == 2 -> fill_securities_order_filled_message(securities_order_filled_message_sent, 255)
  :: else -> ramp_securities_order_filled_message(securities_order_filled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_order_filled_message(securities_order_filled_message_sent);
    assert(at == 181);
    at = 0;
    decode_securities_order_filled_message(securities_order_filled_message_got);
    assert(at == 181);
    equal_securities_order_filled_message(securities_order_filled_message_got, securities_order_filled_message_sent)
  }
}

/* Market Operation Ts Message: encoded, read back, and compared */
proctype check_market_operation_ts_message() {
  MarketOperationTsMessage market_operation_ts_message_sent;
  MarketOperationTsMessage market_operation_ts_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_operation_ts_message(market_operation_ts_message_sent, 0)
  :: pattern == 1 -> fill_market_operation_ts_message(market_operation_ts_message_sent, 32)
  :: pattern == 2 -> fill_market_operation_ts_message(market_operation_ts_message_sent, 255)
  :: else -> ramp_market_operation_ts_message(market_operation_ts_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_operation_ts_message(market_operation_ts_message_sent);
    assert(at == 63);
    at = 0;
    decode_market_operation_ts_message(market_operation_ts_message_got);
    assert(at == 63);
    equal_market_operation_ts_message(market_operation_ts_message_got, market_operation_ts_message_sent)
  }
}

/* Issue Closing Message: encoded, read back, and compared */
proctype check_issue_closing_message() {
  IssueClosingMessage issue_closing_message_sent;
  IssueClosingMessage issue_closing_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_issue_closing_message(issue_closing_message_sent, 0)
  :: pattern == 1 -> fill_issue_closing_message(issue_closing_message_sent, 32)
  :: pattern == 2 -> fill_issue_closing_message(issue_closing_message_sent, 255)
  :: else -> ramp_issue_closing_message(issue_closing_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_issue_closing_message(issue_closing_message_sent);
    assert(at == 107);
    at = 0;
    decode_issue_closing_message(issue_closing_message_got);
    assert(at == 107);
    equal_issue_closing_message(issue_closing_message_got, issue_closing_message_sent)
  }
}

/* Triggering Removing Vi Message: encoded, read back, and compared */
proctype check_triggering_removing_vi_message() {
  TriggeringRemovingViMessage triggering_removing_vi_message_sent;
  TriggeringRemovingViMessage triggering_removing_vi_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_triggering_removing_vi_message(triggering_removing_vi_message_sent, 0)
  :: pattern == 1 -> fill_triggering_removing_vi_message(triggering_removing_vi_message_sent, 32)
  :: pattern == 2 -> fill_triggering_removing_vi_message(triggering_removing_vi_message_sent, 255)
  :: else -> ramp_triggering_removing_vi_message(triggering_removing_vi_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_triggering_removing_vi_message(triggering_removing_vi_message_sent);
    assert(at == 111);
    at = 0;
    decode_triggering_removing_vi_message(triggering_removing_vi_message_got);
    assert(at == 111);
    equal_triggering_removing_vi_message(triggering_removing_vi_message_got, triggering_removing_vi_message_sent)
  }
}

/* Closing Price Trading Quote Message: encoded, read back, and compared */
proctype check_closing_price_trading_quote_message() {
  ClosingPriceTradingQuoteMessage closing_price_trading_quote_message_sent;
  ClosingPriceTradingQuoteMessage closing_price_trading_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_closing_price_trading_quote_message(closing_price_trading_quote_message_sent, 0)
  :: pattern == 1 -> fill_closing_price_trading_quote_message(closing_price_trading_quote_message_sent, 32)
  :: pattern == 2 -> fill_closing_price_trading_quote_message(closing_price_trading_quote_message_sent, 255)
  :: else -> ramp_closing_price_trading_quote_message(closing_price_trading_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_closing_price_trading_quote_message(closing_price_trading_quote_message_sent);
    assert(at == 53);
    at = 0;
    decode_closing_price_trading_quote_message(closing_price_trading_quote_message_got);
    assert(at == 53);
    equal_closing_price_trading_quote_message(closing_price_trading_quote_message_got, closing_price_trading_quote_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_polling_data_message()
  :: run check_securities_quote5_level_message()
  :: run check_securities_order_filled_plus_quote5_level_message()
  :: run check_market_operation_ts_plus_quote5_level_message()
  :: run check_securities_order_filled_message()
  :: run check_market_operation_ts_message()
  :: run check_issue_closing_message()
  :: run check_triggering_removing_vi_message()
  :: run check_closing_price_trading_quote_message()
  fi
}
