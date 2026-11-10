/*
 * Nextrade Nextrade Stock Market Data Common
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
#define WIRE 680

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

/* ---- Securities Quote 10 Level Message: 585 bytes ---------------------------- */

/* Securities_Quote(MM/LP Quotes Excluded) Best Order Data on NXT Trading Items provided - MM/LP Quotes Excluded * 10 Level Best Order on Ask/Bid. */
typedef SecuritiesQuote10LevelMessage {
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
  byte ask_level_6_price[11];
  byte bid_level_6_price[11];
  byte ask_level_6_volume[12];
  byte bid_level_6_volume[12];
  byte ask_level_7_price[11];
  byte bid_level_7_price[11];
  byte ask_level_7_volume[12];
  byte bid_level_7_volume[12];
  byte ask_level_8_price[11];
  byte bid_level_8_price[11];
  byte ask_level_8_volume[12];
  byte bid_level_8_volume[12];
  byte ask_level_9_price[11];
  byte bid_level_9_price[11];
  byte ask_level_9_volume[12];
  byte bid_level_9_volume[12];
  byte ask_level_10_price[11];
  byte bid_level_10_price[11];
  byte ask_level_10_volume[12];
  byte bid_level_10_volume[12];
  byte total_ask_volume[12];
  byte total_bid_volume[12];
  byte estimated_trading_price[11];
  byte estimated_trading_volume[12];
  byte mid_price[11];
  byte total_mid_price_ask_volume_total_ask_volume_on_mid_price[12];
  byte total_mid_price_bid_volume_total_bid_volume_on_mid_price[12];
  byte end_keyword
};

int securities_quote10_level_message_at;

/* every byte of Securities Quote 10 Level Message set to one value */
inline fill_securities_quote10_level_message(securities_quote10_level_message_record, securities_quote10_level_message_value) {
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 8 -> securities_quote10_level_message_record.message_sequence_number[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> securities_quote10_level_message_record.board_id[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> securities_quote10_level_message_record.session_id[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.isin_code[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 6 -> securities_quote10_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.processing_time_of_trading_system[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_1_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_1_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_1_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_1_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_2_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_2_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_2_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_2_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_3_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_3_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_3_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_3_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_4_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_4_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_4_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_4_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_5_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_5_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_5_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_5_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_6_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_6_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_6_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_6_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_7_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_7_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_7_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_7_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_8_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_8_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_8_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_8_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_9_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_9_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_9_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_9_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_10_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_10_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_10_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_10_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_ask_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_bid_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.estimated_trading_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.estimated_trading_volume[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.mid_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote10_level_message_at] = securities_quote10_level_message_value; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_record.end_keyword = securities_quote10_level_message_value;
  skip
}

/* each byte of Securities Quote 10 Level Message set to where it lies, so a field read out of place says so */
inline ramp_securities_quote10_level_message(securities_quote10_level_message_record, securities_quote10_level_message_base) {
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 8 -> securities_quote10_level_message_record.message_sequence_number[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 0 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> securities_quote10_level_message_record.board_id[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 8 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> securities_quote10_level_message_record.session_id[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 10 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.isin_code[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 12 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 6 -> securities_quote10_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 24 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.processing_time_of_trading_system[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 30 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_1_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 42 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_1_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 53 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_1_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 64 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_1_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 76 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_2_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 88 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_2_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 99 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_2_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 110 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_2_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 122 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_3_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 134 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_3_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 145 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_3_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 156 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_3_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 168 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_4_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 180 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_4_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 191 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_4_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 202 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_4_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 214 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_5_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 226 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_5_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 237 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_5_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 248 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_5_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 260 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_6_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 272 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_6_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 283 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_6_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 294 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_6_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 306 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_7_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 318 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_7_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 329 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_7_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 340 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_7_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 352 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_8_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 364 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_8_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 375 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_8_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 386 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_8_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 398 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_9_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 410 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_9_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 421 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_9_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 432 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_9_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 444 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_10_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 456 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_10_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 467 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_10_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 478 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_10_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 490 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_ask_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 502 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_bid_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 514 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.estimated_trading_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 526 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.estimated_trading_volume[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 537 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.mid_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 549 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 560 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote10_level_message_at] = (securities_quote10_level_message_base + 572 + securities_quote10_level_message_at + 1) % 256; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_record.end_keyword = (securities_quote10_level_message_base + 584 + 1) % 256;
  skip
}

/* Securities Quote 10 Level Message to the wire, 585 bytes from where the cursor stands */
inline encode_securities_quote10_level_message(securities_quote10_level_message_record) {
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 8 -> wire[at] = securities_quote10_level_message_record.message_sequence_number[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> wire[at] = securities_quote10_level_message_record.board_id[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> wire[at] = securities_quote10_level_message_record.session_id[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.isin_code[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 6 -> wire[at] = securities_quote10_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.processing_time_of_trading_system[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_1_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_1_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_1_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_1_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_2_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_2_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_2_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_2_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_3_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_3_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_3_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_3_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_4_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_4_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_4_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_4_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_5_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_5_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_5_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_5_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_6_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_6_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_6_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_6_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_7_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_7_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_7_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_7_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_8_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_8_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_8_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_8_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_9_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_9_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_9_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_9_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.ask_level_10_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.bid_level_10_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.ask_level_10_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.bid_level_10_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.total_ask_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.total_bid_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.estimated_trading_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.estimated_trading_volume[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> wire[at] = securities_quote10_level_message_record.mid_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> wire[at] = securities_quote10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote10_level_message_at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_quote10_level_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Quote 10 Level Message off the wire, 585 bytes from where the cursor stands */
inline decode_securities_quote10_level_message(securities_quote10_level_message_record) {
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 8 -> securities_quote10_level_message_record.message_sequence_number[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> securities_quote10_level_message_record.board_id[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> securities_quote10_level_message_record.session_id[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.isin_code[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 6 -> securities_quote10_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.processing_time_of_trading_system[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_1_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_1_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_1_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_1_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_2_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_2_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_2_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_2_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_3_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_3_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_3_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_3_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_4_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_4_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_4_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_4_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_5_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_5_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_5_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_5_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_6_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_6_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_6_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_6_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_7_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_7_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_7_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_7_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_8_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_8_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_8_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_8_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_9_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_9_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_9_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_9_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.ask_level_10_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.bid_level_10_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.ask_level_10_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.bid_level_10_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_ask_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_bid_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.estimated_trading_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.estimated_trading_volume[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> securities_quote10_level_message_record.mid_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> securities_quote10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote10_level_message_at] = wire[at]; at = at + 1; securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Quote 10 Level Message is what was written, byte for byte */
inline equal_securities_quote10_level_message(securities_quote10_level_message_read, securities_quote10_level_message_written) {
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 8 -> assert(securities_quote10_level_message_read.message_sequence_number[securities_quote10_level_message_at] == securities_quote10_level_message_written.message_sequence_number[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> assert(securities_quote10_level_message_read.board_id[securities_quote10_level_message_at] == securities_quote10_level_message_written.board_id[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 2 -> assert(securities_quote10_level_message_read.session_id[securities_quote10_level_message_at] == securities_quote10_level_message_written.session_id[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.isin_code[securities_quote10_level_message_at] == securities_quote10_level_message_written.isin_code[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 6 -> assert(securities_quote10_level_message_read.a_designated_number_for_an_issue_from_krx[securities_quote10_level_message_at] == securities_quote10_level_message_written.a_designated_number_for_an_issue_from_krx[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.processing_time_of_trading_system[securities_quote10_level_message_at] == securities_quote10_level_message_written.processing_time_of_trading_system[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_1_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_1_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_1_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_1_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_1_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_1_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_1_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_1_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_2_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_2_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_2_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_2_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_2_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_2_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_2_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_2_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_3_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_3_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_3_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_3_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_3_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_3_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_3_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_3_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_4_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_4_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_4_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_4_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_4_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_4_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_4_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_4_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_5_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_5_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_5_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_5_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_5_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_5_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_5_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_5_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_6_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_6_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_6_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_6_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_6_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_6_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_6_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_6_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_7_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_7_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_7_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_7_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_7_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_7_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_7_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_7_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_8_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_8_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_8_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_8_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_8_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_8_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_8_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_8_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_9_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_9_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_9_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_9_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_9_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_9_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_9_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_9_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.ask_level_10_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_10_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.bid_level_10_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_10_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.ask_level_10_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.ask_level_10_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.bid_level_10_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.bid_level_10_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.total_ask_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.total_ask_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.total_bid_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.total_bid_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.estimated_trading_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.estimated_trading_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.estimated_trading_volume[securities_quote10_level_message_at] == securities_quote10_level_message_written.estimated_trading_volume[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 11 -> assert(securities_quote10_level_message_read.mid_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.mid_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  securities_quote10_level_message_at = 0;
  do
  :: securities_quote10_level_message_at < 12 -> assert(securities_quote10_level_message_read.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote10_level_message_at] == securities_quote10_level_message_written.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote10_level_message_at]); securities_quote10_level_message_at = securities_quote10_level_message_at + 1
  :: else -> break
  od;
  assert(securities_quote10_level_message_read.end_keyword == securities_quote10_level_message_written.end_keyword);
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

/* ---- Equities Snapshot 10 Level Message: 680 bytes --------------------------- */

/* Snapshot and final status are provided with certain intervals per issue and board - MM/LP Quotes Excluded * 10 Level Best Order on Ask/Bid. */
typedef EquitiesSnapshot10LevelMessage {
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte price_change_against_previous_day;
  byte a_price_change_against_the_previous_day[11];
  byte upper_limit_price[11];
  byte lower_limit_price[11];
  byte current_price[11];
  byte opening_price[11];
  byte todays_high[11];
  byte todays_low[11];
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[22];
  byte final_ask_bid_type_code;
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
  byte ask_level_6_price[11];
  byte bid_level_6_price[11];
  byte ask_level_6_volume[12];
  byte bid_level_6_volume[12];
  byte ask_level_7_price[11];
  byte bid_level_7_price[11];
  byte ask_level_7_volume[12];
  byte bid_level_7_volume[12];
  byte ask_level_8_price[11];
  byte bid_level_8_price[11];
  byte ask_level_8_volume[12];
  byte bid_level_8_volume[12];
  byte ask_level_9_price[11];
  byte bid_level_9_price[11];
  byte ask_level_9_volume[12];
  byte bid_level_9_volume[12];
  byte ask_level_10_price[11];
  byte bid_level_10_price[11];
  byte ask_level_10_volume[12];
  byte bid_level_10_volume[12];
  byte total_ask_volume[12];
  byte total_bid_volume[12];
  byte estimated_trading_price[11];
  byte estimated_trading_volume[12];
  byte closing_price_type_code;
  byte trading_halt;
  byte mid_price[11];
  byte total_mid_price_ask_volume_total_ask_volume_on_mid_price[12];
  byte total_mid_price_bid_volume_total_bid_volume_on_mid_price[12];
  byte end_keyword
};

int equities_snapshot10_level_message_at;

/* every byte of Equities Snapshot 10 Level Message set to one value */
inline fill_equities_snapshot10_level_message(equities_snapshot10_level_message_record, equities_snapshot10_level_message_value) {
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> equities_snapshot10_level_message_record.board_id[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> equities_snapshot10_level_message_record.session_id[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.isin_code[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 6 -> equities_snapshot10_level_message_record.a_designated_number_for_an_issue_from_krx[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.price_change_against_previous_day = equities_snapshot10_level_message_value;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.a_price_change_against_the_previous_day[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.upper_limit_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.lower_limit_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.current_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.opening_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.todays_high[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.todays_low[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.accumulated_trading_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 22 -> equities_snapshot10_level_message_record.accumulated_trading_value[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.final_ask_bid_type_code = equities_snapshot10_level_message_value;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_1_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_1_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_1_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_1_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_2_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_2_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_2_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_2_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_3_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_3_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_3_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_3_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_4_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_4_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_4_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_4_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_5_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_5_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_5_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_5_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_6_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_6_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_6_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_6_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_7_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_7_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_7_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_7_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_8_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_8_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_8_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_8_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_9_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_9_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_9_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_9_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_10_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_10_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_10_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_10_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_ask_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_bid_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.estimated_trading_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.estimated_trading_volume[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.closing_price_type_code = equities_snapshot10_level_message_value;
  equities_snapshot10_level_message_record.trading_halt = equities_snapshot10_level_message_value;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.mid_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot10_level_message_at] = equities_snapshot10_level_message_value; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.end_keyword = equities_snapshot10_level_message_value;
  skip
}

/* each byte of Equities Snapshot 10 Level Message set to where it lies, so a field read out of place says so */
inline ramp_equities_snapshot10_level_message(equities_snapshot10_level_message_record, equities_snapshot10_level_message_base) {
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> equities_snapshot10_level_message_record.board_id[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 0 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> equities_snapshot10_level_message_record.session_id[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 2 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.isin_code[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 4 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 6 -> equities_snapshot10_level_message_record.a_designated_number_for_an_issue_from_krx[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 16 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.price_change_against_previous_day = (equities_snapshot10_level_message_base + 22 + 1) % 256;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.a_price_change_against_the_previous_day[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 23 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.upper_limit_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 34 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.lower_limit_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 45 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.current_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 56 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.opening_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 67 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.todays_high[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 78 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.todays_low[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 89 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.accumulated_trading_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 100 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 22 -> equities_snapshot10_level_message_record.accumulated_trading_value[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 112 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.final_ask_bid_type_code = (equities_snapshot10_level_message_base + 134 + 1) % 256;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_1_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 135 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_1_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 146 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_1_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 157 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_1_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 169 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_2_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 181 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_2_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 192 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_2_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 203 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_2_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 215 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_3_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 227 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_3_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 238 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_3_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 249 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_3_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 261 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_4_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 273 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_4_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 284 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_4_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 295 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_4_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 307 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_5_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 319 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_5_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 330 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_5_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 341 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_5_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 353 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_6_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 365 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_6_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 376 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_6_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 387 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_6_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 399 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_7_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 411 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_7_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 422 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_7_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 433 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_7_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 445 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_8_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 457 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_8_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 468 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_8_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 479 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_8_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 491 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_9_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 503 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_9_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 514 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_9_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 525 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_9_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 537 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_10_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 549 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_10_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 560 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_10_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 571 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_10_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 583 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_ask_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 595 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_bid_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 607 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.estimated_trading_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 619 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.estimated_trading_volume[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 630 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.closing_price_type_code = (equities_snapshot10_level_message_base + 642 + 1) % 256;
  equities_snapshot10_level_message_record.trading_halt = (equities_snapshot10_level_message_base + 643 + 1) % 256;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.mid_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 644 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 655 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot10_level_message_at] = (equities_snapshot10_level_message_base + 667 + equities_snapshot10_level_message_at + 1) % 256; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.end_keyword = (equities_snapshot10_level_message_base + 679 + 1) % 256;
  skip
}

/* Equities Snapshot 10 Level Message to the wire, 680 bytes from where the cursor stands */
inline encode_equities_snapshot10_level_message(equities_snapshot10_level_message_record) {
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> wire[at] = equities_snapshot10_level_message_record.board_id[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> wire[at] = equities_snapshot10_level_message_record.session_id[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.isin_code[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 6 -> wire[at] = equities_snapshot10_level_message_record.a_designated_number_for_an_issue_from_krx[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_snapshot10_level_message_record.price_change_against_previous_day; at = at + 1;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.a_price_change_against_the_previous_day[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.upper_limit_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.lower_limit_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.current_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.opening_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.todays_high[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.todays_low[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.accumulated_trading_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 22 -> wire[at] = equities_snapshot10_level_message_record.accumulated_trading_value[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_snapshot10_level_message_record.final_ask_bid_type_code; at = at + 1;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_1_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_1_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_1_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_1_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_2_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_2_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_2_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_2_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_3_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_3_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_3_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_3_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_4_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_4_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_4_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_4_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_5_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_5_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_5_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_5_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_6_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_6_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_6_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_6_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_7_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_7_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_7_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_7_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_8_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_8_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_8_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_8_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_9_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_9_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_9_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_9_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.ask_level_10_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.bid_level_10_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.ask_level_10_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.bid_level_10_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.total_ask_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.total_bid_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.estimated_trading_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.estimated_trading_volume[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_snapshot10_level_message_record.closing_price_type_code; at = at + 1;
  wire[at] = equities_snapshot10_level_message_record.trading_halt; at = at + 1;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> wire[at] = equities_snapshot10_level_message_record.mid_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> wire[at] = equities_snapshot10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot10_level_message_at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_snapshot10_level_message_record.end_keyword; at = at + 1;
  skip
}

/* Equities Snapshot 10 Level Message off the wire, 680 bytes from where the cursor stands */
inline decode_equities_snapshot10_level_message(equities_snapshot10_level_message_record) {
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> equities_snapshot10_level_message_record.board_id[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> equities_snapshot10_level_message_record.session_id[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.isin_code[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 6 -> equities_snapshot10_level_message_record.a_designated_number_for_an_issue_from_krx[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.price_change_against_previous_day = wire[at]; at = at + 1;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.a_price_change_against_the_previous_day[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.upper_limit_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.lower_limit_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.current_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.opening_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.todays_high[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.todays_low[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.accumulated_trading_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 22 -> equities_snapshot10_level_message_record.accumulated_trading_value[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.final_ask_bid_type_code = wire[at]; at = at + 1;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_1_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_1_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_1_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_1_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_2_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_2_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_2_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_2_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_3_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_3_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_3_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_3_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_4_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_4_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_4_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_4_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_5_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_5_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_5_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_5_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_6_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_6_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_6_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_6_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_7_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_7_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_7_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_7_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_8_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_8_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_8_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_8_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_9_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_9_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_9_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_9_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.ask_level_10_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.bid_level_10_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.ask_level_10_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.bid_level_10_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_ask_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_bid_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.estimated_trading_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.estimated_trading_volume[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.closing_price_type_code = wire[at]; at = at + 1;
  equities_snapshot10_level_message_record.trading_halt = wire[at]; at = at + 1;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> equities_snapshot10_level_message_record.mid_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> equities_snapshot10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot10_level_message_at] = wire[at]; at = at + 1; equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Equities Snapshot 10 Level Message is what was written, byte for byte */
inline equal_equities_snapshot10_level_message(equities_snapshot10_level_message_read, equities_snapshot10_level_message_written) {
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> assert(equities_snapshot10_level_message_read.board_id[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.board_id[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 2 -> assert(equities_snapshot10_level_message_read.session_id[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.session_id[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.isin_code[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.isin_code[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 6 -> assert(equities_snapshot10_level_message_read.a_designated_number_for_an_issue_from_krx[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.a_designated_number_for_an_issue_from_krx[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  assert(equities_snapshot10_level_message_read.price_change_against_previous_day == equities_snapshot10_level_message_written.price_change_against_previous_day);
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.a_price_change_against_the_previous_day[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.a_price_change_against_the_previous_day[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.upper_limit_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.upper_limit_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.lower_limit_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.lower_limit_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.current_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.current_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.opening_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.opening_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.todays_high[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.todays_high[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.todays_low[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.todays_low[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.accumulated_trading_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.accumulated_trading_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 22 -> assert(equities_snapshot10_level_message_read.accumulated_trading_value[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.accumulated_trading_value[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  assert(equities_snapshot10_level_message_read.final_ask_bid_type_code == equities_snapshot10_level_message_written.final_ask_bid_type_code);
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_1_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_1_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_1_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_1_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_1_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_1_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_1_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_1_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_2_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_2_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_2_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_2_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_2_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_2_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_2_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_2_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_3_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_3_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_3_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_3_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_3_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_3_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_3_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_3_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_4_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_4_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_4_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_4_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_4_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_4_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_4_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_4_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_5_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_5_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_5_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_5_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_5_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_5_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_5_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_5_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_6_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_6_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_6_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_6_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_6_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_6_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_6_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_6_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_7_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_7_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_7_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_7_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_7_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_7_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_7_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_7_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_8_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_8_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_8_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_8_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_8_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_8_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_8_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_8_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_9_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_9_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_9_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_9_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_9_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_9_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_9_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_9_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.ask_level_10_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_10_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.bid_level_10_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_10_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.ask_level_10_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.ask_level_10_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.bid_level_10_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.bid_level_10_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.total_ask_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.total_ask_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.total_bid_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.total_bid_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.estimated_trading_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.estimated_trading_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.estimated_trading_volume[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.estimated_trading_volume[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  assert(equities_snapshot10_level_message_read.closing_price_type_code == equities_snapshot10_level_message_written.closing_price_type_code);
  assert(equities_snapshot10_level_message_read.trading_halt == equities_snapshot10_level_message_written.trading_halt);
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 11 -> assert(equities_snapshot10_level_message_read.mid_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.mid_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot10_level_message_at = 0;
  do
  :: equities_snapshot10_level_message_at < 12 -> assert(equities_snapshot10_level_message_read.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot10_level_message_at] == equities_snapshot10_level_message_written.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot10_level_message_at]); equities_snapshot10_level_message_at = equities_snapshot10_level_message_at + 1
  :: else -> break
  od;
  assert(equities_snapshot10_level_message_read.end_keyword == equities_snapshot10_level_message_written.end_keyword);
  skip
}

/* ---- Investor Activities Per An Industry Message: 100 bytes ------------------ */

/* Investor Activities per an Industry. */
typedef InvestorActivitiesPerAnIndustryMessage {
  byte calculation_time[6];
  byte investor_code[4];
  byte interface_index_id[6];
  byte index_isin_code[12];
  byte accumulated_ask_trading_volume[12];
  byte accumulated_ask_trading_value[22];
  byte accumulated_bid_trading_volume[12];
  byte accumulated_bid_trading_value[22];
  byte filler_3[3];
  byte end_keyword
};

int investor_activities_per_an_industry_message_at;

/* every byte of Investor Activities Per An Industry Message set to one value */
inline fill_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_record, investor_activities_per_an_industry_message_value) {
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> investor_activities_per_an_industry_message_record.calculation_time[investor_activities_per_an_industry_message_at] = investor_activities_per_an_industry_message_value; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 4 -> investor_activities_per_an_industry_message_record.investor_code[investor_activities_per_an_industry_message_at] = investor_activities_per_an_industry_message_value; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> investor_activities_per_an_industry_message_record.interface_index_id[investor_activities_per_an_industry_message_at] = investor_activities_per_an_industry_message_value; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> investor_activities_per_an_industry_message_record.index_isin_code[investor_activities_per_an_industry_message_at] = investor_activities_per_an_industry_message_value; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> investor_activities_per_an_industry_message_record.accumulated_ask_trading_volume[investor_activities_per_an_industry_message_at] = investor_activities_per_an_industry_message_value; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> investor_activities_per_an_industry_message_record.accumulated_ask_trading_value[investor_activities_per_an_industry_message_at] = investor_activities_per_an_industry_message_value; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> investor_activities_per_an_industry_message_record.accumulated_bid_trading_volume[investor_activities_per_an_industry_message_at] = investor_activities_per_an_industry_message_value; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> investor_activities_per_an_industry_message_record.accumulated_bid_trading_value[investor_activities_per_an_industry_message_at] = investor_activities_per_an_industry_message_value; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 3 -> investor_activities_per_an_industry_message_record.filler_3[investor_activities_per_an_industry_message_at] = investor_activities_per_an_industry_message_value; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_record.end_keyword = investor_activities_per_an_industry_message_value;
  skip
}

/* each byte of Investor Activities Per An Industry Message set to where it lies, so a field read out of place says so */
inline ramp_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_record, investor_activities_per_an_industry_message_base) {
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> investor_activities_per_an_industry_message_record.calculation_time[investor_activities_per_an_industry_message_at] = (investor_activities_per_an_industry_message_base + 0 + investor_activities_per_an_industry_message_at + 1) % 256; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 4 -> investor_activities_per_an_industry_message_record.investor_code[investor_activities_per_an_industry_message_at] = (investor_activities_per_an_industry_message_base + 6 + investor_activities_per_an_industry_message_at + 1) % 256; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> investor_activities_per_an_industry_message_record.interface_index_id[investor_activities_per_an_industry_message_at] = (investor_activities_per_an_industry_message_base + 10 + investor_activities_per_an_industry_message_at + 1) % 256; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> investor_activities_per_an_industry_message_record.index_isin_code[investor_activities_per_an_industry_message_at] = (investor_activities_per_an_industry_message_base + 16 + investor_activities_per_an_industry_message_at + 1) % 256; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> investor_activities_per_an_industry_message_record.accumulated_ask_trading_volume[investor_activities_per_an_industry_message_at] = (investor_activities_per_an_industry_message_base + 28 + investor_activities_per_an_industry_message_at + 1) % 256; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> investor_activities_per_an_industry_message_record.accumulated_ask_trading_value[investor_activities_per_an_industry_message_at] = (investor_activities_per_an_industry_message_base + 40 + investor_activities_per_an_industry_message_at + 1) % 256; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> investor_activities_per_an_industry_message_record.accumulated_bid_trading_volume[investor_activities_per_an_industry_message_at] = (investor_activities_per_an_industry_message_base + 62 + investor_activities_per_an_industry_message_at + 1) % 256; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> investor_activities_per_an_industry_message_record.accumulated_bid_trading_value[investor_activities_per_an_industry_message_at] = (investor_activities_per_an_industry_message_base + 74 + investor_activities_per_an_industry_message_at + 1) % 256; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 3 -> investor_activities_per_an_industry_message_record.filler_3[investor_activities_per_an_industry_message_at] = (investor_activities_per_an_industry_message_base + 96 + investor_activities_per_an_industry_message_at + 1) % 256; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_record.end_keyword = (investor_activities_per_an_industry_message_base + 99 + 1) % 256;
  skip
}

/* Investor Activities Per An Industry Message to the wire, 100 bytes from where the cursor stands */
inline encode_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_record) {
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> wire[at] = investor_activities_per_an_industry_message_record.calculation_time[investor_activities_per_an_industry_message_at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 4 -> wire[at] = investor_activities_per_an_industry_message_record.investor_code[investor_activities_per_an_industry_message_at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> wire[at] = investor_activities_per_an_industry_message_record.interface_index_id[investor_activities_per_an_industry_message_at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> wire[at] = investor_activities_per_an_industry_message_record.index_isin_code[investor_activities_per_an_industry_message_at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> wire[at] = investor_activities_per_an_industry_message_record.accumulated_ask_trading_volume[investor_activities_per_an_industry_message_at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> wire[at] = investor_activities_per_an_industry_message_record.accumulated_ask_trading_value[investor_activities_per_an_industry_message_at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> wire[at] = investor_activities_per_an_industry_message_record.accumulated_bid_trading_volume[investor_activities_per_an_industry_message_at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> wire[at] = investor_activities_per_an_industry_message_record.accumulated_bid_trading_value[investor_activities_per_an_industry_message_at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 3 -> wire[at] = investor_activities_per_an_industry_message_record.filler_3[investor_activities_per_an_industry_message_at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  wire[at] = investor_activities_per_an_industry_message_record.end_keyword; at = at + 1;
  skip
}

/* Investor Activities Per An Industry Message off the wire, 100 bytes from where the cursor stands */
inline decode_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_record) {
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> investor_activities_per_an_industry_message_record.calculation_time[investor_activities_per_an_industry_message_at] = wire[at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 4 -> investor_activities_per_an_industry_message_record.investor_code[investor_activities_per_an_industry_message_at] = wire[at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> investor_activities_per_an_industry_message_record.interface_index_id[investor_activities_per_an_industry_message_at] = wire[at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> investor_activities_per_an_industry_message_record.index_isin_code[investor_activities_per_an_industry_message_at] = wire[at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> investor_activities_per_an_industry_message_record.accumulated_ask_trading_volume[investor_activities_per_an_industry_message_at] = wire[at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> investor_activities_per_an_industry_message_record.accumulated_ask_trading_value[investor_activities_per_an_industry_message_at] = wire[at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> investor_activities_per_an_industry_message_record.accumulated_bid_trading_volume[investor_activities_per_an_industry_message_at] = wire[at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> investor_activities_per_an_industry_message_record.accumulated_bid_trading_value[investor_activities_per_an_industry_message_at] = wire[at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 3 -> investor_activities_per_an_industry_message_record.filler_3[investor_activities_per_an_industry_message_at] = wire[at]; at = at + 1; investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Investor Activities Per An Industry Message is what was written, byte for byte */
inline equal_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_read, investor_activities_per_an_industry_message_written) {
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> assert(investor_activities_per_an_industry_message_read.calculation_time[investor_activities_per_an_industry_message_at] == investor_activities_per_an_industry_message_written.calculation_time[investor_activities_per_an_industry_message_at]); investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 4 -> assert(investor_activities_per_an_industry_message_read.investor_code[investor_activities_per_an_industry_message_at] == investor_activities_per_an_industry_message_written.investor_code[investor_activities_per_an_industry_message_at]); investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 6 -> assert(investor_activities_per_an_industry_message_read.interface_index_id[investor_activities_per_an_industry_message_at] == investor_activities_per_an_industry_message_written.interface_index_id[investor_activities_per_an_industry_message_at]); investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> assert(investor_activities_per_an_industry_message_read.index_isin_code[investor_activities_per_an_industry_message_at] == investor_activities_per_an_industry_message_written.index_isin_code[investor_activities_per_an_industry_message_at]); investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> assert(investor_activities_per_an_industry_message_read.accumulated_ask_trading_volume[investor_activities_per_an_industry_message_at] == investor_activities_per_an_industry_message_written.accumulated_ask_trading_volume[investor_activities_per_an_industry_message_at]); investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> assert(investor_activities_per_an_industry_message_read.accumulated_ask_trading_value[investor_activities_per_an_industry_message_at] == investor_activities_per_an_industry_message_written.accumulated_ask_trading_value[investor_activities_per_an_industry_message_at]); investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 12 -> assert(investor_activities_per_an_industry_message_read.accumulated_bid_trading_volume[investor_activities_per_an_industry_message_at] == investor_activities_per_an_industry_message_written.accumulated_bid_trading_volume[investor_activities_per_an_industry_message_at]); investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 22 -> assert(investor_activities_per_an_industry_message_read.accumulated_bid_trading_value[investor_activities_per_an_industry_message_at] == investor_activities_per_an_industry_message_written.accumulated_bid_trading_value[investor_activities_per_an_industry_message_at]); investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_industry_message_at = 0;
  do
  :: investor_activities_per_an_industry_message_at < 3 -> assert(investor_activities_per_an_industry_message_read.filler_3[investor_activities_per_an_industry_message_at] == investor_activities_per_an_industry_message_written.filler_3[investor_activities_per_an_industry_message_at]); investor_activities_per_an_industry_message_at = investor_activities_per_an_industry_message_at + 1
  :: else -> break
  od;
  assert(investor_activities_per_an_industry_message_read.end_keyword == investor_activities_per_an_industry_message_written.end_keyword);
  skip
}

/* ---- Current Movement Message: 51 bytes -------------------------------------- */

/* Current Movement. */
typedef CurrentMovementMessage {
  byte total_number_of_issues[5];
  byte number_of_issues_for_movement_calculation[5];
  byte number_of_issues_of_upper_limit[5];
  byte number_of_issues_of_going_up[5];
  byte number_of_issues_of_steadiness[5];
  byte number_of_issues_of_lower_limit[5];
  byte number_of_issues_of_going_down[5];
  byte number_of_issues_having_quotes[5];
  byte number_of_issues_of_which_quotes_are_increasing[5];
  byte number_of_issues_of_which_quotes_are_decreasing[5];
  byte end_keyword
};

int current_movement_message_at;

/* every byte of Current Movement Message set to one value */
inline fill_current_movement_message(current_movement_message_record, current_movement_message_value) {
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.total_number_of_issues[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_for_movement_calculation[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_upper_limit[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_going_up[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_steadiness[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_lower_limit[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_going_down[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_having_quotes[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_which_quotes_are_increasing[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_which_quotes_are_decreasing[current_movement_message_at] = current_movement_message_value; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_record.end_keyword = current_movement_message_value;
  skip
}

/* each byte of Current Movement Message set to where it lies, so a field read out of place says so */
inline ramp_current_movement_message(current_movement_message_record, current_movement_message_base) {
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.total_number_of_issues[current_movement_message_at] = (current_movement_message_base + 0 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_for_movement_calculation[current_movement_message_at] = (current_movement_message_base + 5 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_upper_limit[current_movement_message_at] = (current_movement_message_base + 10 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_going_up[current_movement_message_at] = (current_movement_message_base + 15 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_steadiness[current_movement_message_at] = (current_movement_message_base + 20 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_lower_limit[current_movement_message_at] = (current_movement_message_base + 25 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_going_down[current_movement_message_at] = (current_movement_message_base + 30 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_having_quotes[current_movement_message_at] = (current_movement_message_base + 35 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_which_quotes_are_increasing[current_movement_message_at] = (current_movement_message_base + 40 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_which_quotes_are_decreasing[current_movement_message_at] = (current_movement_message_base + 45 + current_movement_message_at + 1) % 256; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_record.end_keyword = (current_movement_message_base + 50 + 1) % 256;
  skip
}

/* Current Movement Message to the wire, 51 bytes from where the cursor stands */
inline encode_current_movement_message(current_movement_message_record) {
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.total_number_of_issues[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.number_of_issues_for_movement_calculation[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.number_of_issues_of_upper_limit[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.number_of_issues_of_going_up[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.number_of_issues_of_steadiness[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.number_of_issues_of_lower_limit[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.number_of_issues_of_going_down[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.number_of_issues_having_quotes[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.number_of_issues_of_which_quotes_are_increasing[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> wire[at] = current_movement_message_record.number_of_issues_of_which_quotes_are_decreasing[current_movement_message_at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  wire[at] = current_movement_message_record.end_keyword; at = at + 1;
  skip
}

/* Current Movement Message off the wire, 51 bytes from where the cursor stands */
inline decode_current_movement_message(current_movement_message_record) {
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.total_number_of_issues[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_for_movement_calculation[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_upper_limit[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_going_up[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_steadiness[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_lower_limit[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_going_down[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_having_quotes[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_which_quotes_are_increasing[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> current_movement_message_record.number_of_issues_of_which_quotes_are_decreasing[current_movement_message_at] = wire[at]; at = at + 1; current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Current Movement Message is what was written, byte for byte */
inline equal_current_movement_message(current_movement_message_read, current_movement_message_written) {
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.total_number_of_issues[current_movement_message_at] == current_movement_message_written.total_number_of_issues[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.number_of_issues_for_movement_calculation[current_movement_message_at] == current_movement_message_written.number_of_issues_for_movement_calculation[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.number_of_issues_of_upper_limit[current_movement_message_at] == current_movement_message_written.number_of_issues_of_upper_limit[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.number_of_issues_of_going_up[current_movement_message_at] == current_movement_message_written.number_of_issues_of_going_up[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.number_of_issues_of_steadiness[current_movement_message_at] == current_movement_message_written.number_of_issues_of_steadiness[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.number_of_issues_of_lower_limit[current_movement_message_at] == current_movement_message_written.number_of_issues_of_lower_limit[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.number_of_issues_of_going_down[current_movement_message_at] == current_movement_message_written.number_of_issues_of_going_down[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.number_of_issues_having_quotes[current_movement_message_at] == current_movement_message_written.number_of_issues_having_quotes[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.number_of_issues_of_which_quotes_are_increasing[current_movement_message_at] == current_movement_message_written.number_of_issues_of_which_quotes_are_increasing[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  current_movement_message_at = 0;
  do
  :: current_movement_message_at < 5 -> assert(current_movement_message_read.number_of_issues_of_which_quotes_are_decreasing[current_movement_message_at] == current_movement_message_written.number_of_issues_of_which_quotes_are_decreasing[current_movement_message_at]); current_movement_message_at = current_movement_message_at + 1
  :: else -> break
  od;
  assert(current_movement_message_read.end_keyword == current_movement_message_written.end_keyword);
  skip
}

/* ---- Program Trading Activity Per Investor Message: 159 bytes ---------------- */

/* Program Trading Activity per Investor. */
typedef ProgramTradingActivityPerInvestorMessage {
  byte calculation_time[6];
  byte investor_code[4];
  byte sell_side_arbitrage_volume[15];
  byte sell_side_arbitrage_value[22];
  byte sell_side_non_arbitrage_volume[15];
  byte sell_side_non_arbitrage_value[22];
  byte buy_side_arbitrage_volume[15];
  byte buy_side_arbitrage_value[22];
  byte buy_side_non_arbitrage_volume[15];
  byte buy_side_non_arbitrage_value[22];
  byte end_keyword
};

int program_trading_activity_per_investor_message_at;

/* every byte of Program Trading Activity Per Investor Message set to one value */
inline fill_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_record, program_trading_activity_per_investor_message_value) {
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 6 -> program_trading_activity_per_investor_message_record.calculation_time[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 4 -> program_trading_activity_per_investor_message_record.investor_code[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.sell_side_arbitrage_volume[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.sell_side_arbitrage_value[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.sell_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.sell_side_non_arbitrage_value[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.buy_side_arbitrage_volume[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.buy_side_arbitrage_value[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.buy_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.buy_side_non_arbitrage_value[program_trading_activity_per_investor_message_at] = program_trading_activity_per_investor_message_value; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_record.end_keyword = program_trading_activity_per_investor_message_value;
  skip
}

/* each byte of Program Trading Activity Per Investor Message set to where it lies, so a field read out of place says so */
inline ramp_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_record, program_trading_activity_per_investor_message_base) {
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 6 -> program_trading_activity_per_investor_message_record.calculation_time[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 0 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 4 -> program_trading_activity_per_investor_message_record.investor_code[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 6 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.sell_side_arbitrage_volume[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 10 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.sell_side_arbitrage_value[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 25 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.sell_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 47 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.sell_side_non_arbitrage_value[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 62 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.buy_side_arbitrage_volume[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 84 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.buy_side_arbitrage_value[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 99 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.buy_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 121 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.buy_side_non_arbitrage_value[program_trading_activity_per_investor_message_at] = (program_trading_activity_per_investor_message_base + 136 + program_trading_activity_per_investor_message_at + 1) % 256; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_record.end_keyword = (program_trading_activity_per_investor_message_base + 158 + 1) % 256;
  skip
}

/* Program Trading Activity Per Investor Message to the wire, 159 bytes from where the cursor stands */
inline encode_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_record) {
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 6 -> wire[at] = program_trading_activity_per_investor_message_record.calculation_time[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 4 -> wire[at] = program_trading_activity_per_investor_message_record.investor_code[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> wire[at] = program_trading_activity_per_investor_message_record.sell_side_arbitrage_volume[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> wire[at] = program_trading_activity_per_investor_message_record.sell_side_arbitrage_value[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> wire[at] = program_trading_activity_per_investor_message_record.sell_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> wire[at] = program_trading_activity_per_investor_message_record.sell_side_non_arbitrage_value[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> wire[at] = program_trading_activity_per_investor_message_record.buy_side_arbitrage_volume[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> wire[at] = program_trading_activity_per_investor_message_record.buy_side_arbitrage_value[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> wire[at] = program_trading_activity_per_investor_message_record.buy_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> wire[at] = program_trading_activity_per_investor_message_record.buy_side_non_arbitrage_value[program_trading_activity_per_investor_message_at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  wire[at] = program_trading_activity_per_investor_message_record.end_keyword; at = at + 1;
  skip
}

/* Program Trading Activity Per Investor Message off the wire, 159 bytes from where the cursor stands */
inline decode_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_record) {
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 6 -> program_trading_activity_per_investor_message_record.calculation_time[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 4 -> program_trading_activity_per_investor_message_record.investor_code[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.sell_side_arbitrage_volume[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.sell_side_arbitrage_value[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.sell_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.sell_side_non_arbitrage_value[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.buy_side_arbitrage_volume[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.buy_side_arbitrage_value[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> program_trading_activity_per_investor_message_record.buy_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> program_trading_activity_per_investor_message_record.buy_side_non_arbitrage_value[program_trading_activity_per_investor_message_at] = wire[at]; at = at + 1; program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Program Trading Activity Per Investor Message is what was written, byte for byte */
inline equal_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_read, program_trading_activity_per_investor_message_written) {
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 6 -> assert(program_trading_activity_per_investor_message_read.calculation_time[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.calculation_time[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 4 -> assert(program_trading_activity_per_investor_message_read.investor_code[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.investor_code[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> assert(program_trading_activity_per_investor_message_read.sell_side_arbitrage_volume[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.sell_side_arbitrage_volume[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> assert(program_trading_activity_per_investor_message_read.sell_side_arbitrage_value[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.sell_side_arbitrage_value[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> assert(program_trading_activity_per_investor_message_read.sell_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.sell_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> assert(program_trading_activity_per_investor_message_read.sell_side_non_arbitrage_value[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.sell_side_non_arbitrage_value[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> assert(program_trading_activity_per_investor_message_read.buy_side_arbitrage_volume[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.buy_side_arbitrage_volume[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> assert(program_trading_activity_per_investor_message_read.buy_side_arbitrage_value[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.buy_side_arbitrage_value[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 15 -> assert(program_trading_activity_per_investor_message_read.buy_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.buy_side_non_arbitrage_volume[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  program_trading_activity_per_investor_message_at = 0;
  do
  :: program_trading_activity_per_investor_message_at < 22 -> assert(program_trading_activity_per_investor_message_read.buy_side_non_arbitrage_value[program_trading_activity_per_investor_message_at] == program_trading_activity_per_investor_message_written.buy_side_non_arbitrage_value[program_trading_activity_per_investor_message_at]); program_trading_activity_per_investor_message_at = program_trading_activity_per_investor_message_at + 1
  :: else -> break
  od;
  assert(program_trading_activity_per_investor_message_read.end_keyword == program_trading_activity_per_investor_message_written.end_keyword);
  skip
}

/* ---- Program Trading Information Per Issue Aggregated Information Message: 395 bytes ---- */

/* Program Trading_Information per issue_Aggregated Information. */
typedef ProgramTradingInformationPerIssueAggregatedInformationMessage {
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte sell_side_arbitrage_trading_remaining_quantity[15];
  byte buy_side_arbitrage_trading_remaining_quantity[15];
  byte sell_side_non_arbitrage_remaining_quantity[15];
  byte buy_side_non_arbitrage_remaining_quantity[15];
  byte sell_side_arbitrage_quantity[15];
  byte buy_side_arbitrage_quantity[15];
  byte sell_side_non_arbitrage_quantity[15];
  byte buy_side_non_arbitrage_quantity[15];
  byte arbitrage_ask_trust_trading_volume[10];
  byte arbitrage_ask_principal_trading_volume[10];
  byte arbitrage_bid_trust_trading_volume[10];
  byte arbitrage_bid_principal_trading_volume[10];
  byte non_arbitrage_ask_trust_trading_volume[10];
  byte non_arbitrage_ask_principal_trading_volume[10];
  byte non_arbitrage_bid_trust_trading_volume[10];
  byte non_arbitrage_bid_principal_trading_volume[10];
  byte arbitrage_ask_trust_trading_value[22];
  byte arbitrage_ask_principal_trading_value[22];
  byte arbitrage_bid_trust_trading_value[22];
  byte arbitrage_bid_principal_trading_value[22];
  byte non_arbitrage_ask_trust_trading_value[22];
  byte non_arbitrage_ask_principal_trading_value[22];
  byte non_arbitrage_bid_trust_trading_value[22];
  byte non_arbitrage_bid_principal_trading_value[22];
  byte end_keyword
};

int program_trading_information_per_issue_aggregated_information_message_at;

/* every byte of Program Trading Information Per Issue Aggregated Information Message set to one value */
inline fill_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_record, program_trading_information_per_issue_aggregated_information_message_value) {
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 12 -> program_trading_information_per_issue_aggregated_information_message_record.isin_code[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 6 -> program_trading_information_per_issue_aggregated_information_message_record.a_designated_number_for_an_issue_from_krx[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = program_trading_information_per_issue_aggregated_information_message_value; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_record.end_keyword = program_trading_information_per_issue_aggregated_information_message_value;
  skip
}

/* each byte of Program Trading Information Per Issue Aggregated Information Message set to where it lies, so a field read out of place says so */
inline ramp_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_record, program_trading_information_per_issue_aggregated_information_message_base) {
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 12 -> program_trading_information_per_issue_aggregated_information_message_record.isin_code[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 0 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 6 -> program_trading_information_per_issue_aggregated_information_message_record.a_designated_number_for_an_issue_from_krx[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 12 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 18 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 33 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 48 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 63 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 78 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 93 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 108 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 123 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 138 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 148 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 158 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 168 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 178 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 188 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 198 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 208 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 218 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 240 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 262 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 284 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 306 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 328 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 350 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = (program_trading_information_per_issue_aggregated_information_message_base + 372 + program_trading_information_per_issue_aggregated_information_message_at + 1) % 256; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_record.end_keyword = (program_trading_information_per_issue_aggregated_information_message_base + 394 + 1) % 256;
  skip
}

/* Program Trading Information Per Issue Aggregated Information Message to the wire, 395 bytes from where the cursor stands */
inline encode_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_record) {
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 12 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.isin_code[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 6 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.a_designated_number_for_an_issue_from_krx[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.sell_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.buy_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.sell_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.buy_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.sell_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.buy_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  wire[at] = program_trading_information_per_issue_aggregated_information_message_record.end_keyword; at = at + 1;
  skip
}

/* Program Trading Information Per Issue Aggregated Information Message off the wire, 395 bytes from where the cursor stands */
inline decode_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_record) {
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 12 -> program_trading_information_per_issue_aggregated_information_message_record.isin_code[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 6 -> program_trading_information_per_issue_aggregated_information_message_record.a_designated_number_for_an_issue_from_krx[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.sell_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> program_trading_information_per_issue_aggregated_information_message_record.buy_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> program_trading_information_per_issue_aggregated_information_message_record.non_arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Program Trading Information Per Issue Aggregated Information Message is what was written, byte for byte */
inline equal_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_read, program_trading_information_per_issue_aggregated_information_message_written) {
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 12 -> assert(program_trading_information_per_issue_aggregated_information_message_read.isin_code[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.isin_code[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 6 -> assert(program_trading_information_per_issue_aggregated_information_message_read.a_designated_number_for_an_issue_from_krx[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.a_designated_number_for_an_issue_from_krx[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> assert(program_trading_information_per_issue_aggregated_information_message_read.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> assert(program_trading_information_per_issue_aggregated_information_message_read.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> assert(program_trading_information_per_issue_aggregated_information_message_read.sell_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.sell_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> assert(program_trading_information_per_issue_aggregated_information_message_read.buy_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.buy_side_non_arbitrage_remaining_quantity[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> assert(program_trading_information_per_issue_aggregated_information_message_read.sell_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.sell_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> assert(program_trading_information_per_issue_aggregated_information_message_read.buy_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.buy_side_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> assert(program_trading_information_per_issue_aggregated_information_message_read.sell_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.sell_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 15 -> assert(program_trading_information_per_issue_aggregated_information_message_read.buy_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.buy_side_non_arbitrage_quantity[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> assert(program_trading_information_per_issue_aggregated_information_message_read.arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> assert(program_trading_information_per_issue_aggregated_information_message_read.arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> assert(program_trading_information_per_issue_aggregated_information_message_read.arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> assert(program_trading_information_per_issue_aggregated_information_message_read.arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> assert(program_trading_information_per_issue_aggregated_information_message_read.non_arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.non_arbitrage_ask_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> assert(program_trading_information_per_issue_aggregated_information_message_read.non_arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.non_arbitrage_ask_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> assert(program_trading_information_per_issue_aggregated_information_message_read.non_arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.non_arbitrage_bid_trust_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 10 -> assert(program_trading_information_per_issue_aggregated_information_message_read.non_arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.non_arbitrage_bid_principal_trading_volume[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> assert(program_trading_information_per_issue_aggregated_information_message_read.arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> assert(program_trading_information_per_issue_aggregated_information_message_read.arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> assert(program_trading_information_per_issue_aggregated_information_message_read.arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> assert(program_trading_information_per_issue_aggregated_information_message_read.arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> assert(program_trading_information_per_issue_aggregated_information_message_read.non_arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.non_arbitrage_ask_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> assert(program_trading_information_per_issue_aggregated_information_message_read.non_arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.non_arbitrage_ask_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> assert(program_trading_information_per_issue_aggregated_information_message_read.non_arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.non_arbitrage_bid_trust_trading_value[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_per_issue_aggregated_information_message_at = 0;
  do
  :: program_trading_information_per_issue_aggregated_information_message_at < 22 -> assert(program_trading_information_per_issue_aggregated_information_message_read.non_arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at] == program_trading_information_per_issue_aggregated_information_message_written.non_arbitrage_bid_principal_trading_value[program_trading_information_per_issue_aggregated_information_message_at]); program_trading_information_per_issue_aggregated_information_message_at = program_trading_information_per_issue_aggregated_information_message_at + 1
  :: else -> break
  od;
  assert(program_trading_information_per_issue_aggregated_information_message_read.end_keyword == program_trading_information_per_issue_aggregated_information_message_written.end_keyword);
  skip
}

/* ---- Program Trading Information Of Total Aggregated Information Message: 377 bytes ---- */

/* Program Trading_Information of Total Aggregated Information. */
typedef ProgramTradingInformationOfTotalAggregatedInformationMessage {
  byte sell_side_arbitrage_trading_remaining_quantity[15];
  byte buy_side_arbitrage_trading_remaining_quantity[15];
  byte sell_side_non_arbitrage_remaining_quantity[15];
  byte buy_side_non_arbitrage_remaining_quantity[15];
  byte sell_side_arbitrage_quantity[15];
  byte buy_side_arbitrage_quantity[15];
  byte sell_side_non_arbitrage_quantity[15];
  byte buy_side_non_arbitrage_quantity[15];
  byte arbitrage_ask_trust_trading_volume[10];
  byte arbitrage_ask_principal_trading_volume[10];
  byte arbitrage_bid_trust_trading_volume[10];
  byte arbitrage_bid_principal_trading_volume[10];
  byte non_arbitrage_ask_trust_trading_volume[10];
  byte non_arbitrage_ask_principal_trading_volume[10];
  byte non_arbitrage_bid_trust_trading_volume[10];
  byte non_arbitrage_bid_principal_trading_volume[10];
  byte arbitrage_ask_trust_trading_value[22];
  byte arbitrage_ask_principal_trading_value[22];
  byte arbitrage_bid_trust_trading_value[22];
  byte arbitrage_bid_principal_trading_value[22];
  byte non_arbitrage_ask_trust_trading_value[22];
  byte non_arbitrage_ask_principal_trading_value[22];
  byte non_arbitrage_bid_trust_trading_value[22];
  byte non_arbitrage_bid_principal_trading_value[22];
  byte end_keyword
};

int program_trading_information_of_total_aggregated_information_message_at;

/* every byte of Program Trading Information Of Total Aggregated Information Message set to one value */
inline fill_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_record, program_trading_information_of_total_aggregated_information_message_value) {
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = program_trading_information_of_total_aggregated_information_message_value; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_record.end_keyword = program_trading_information_of_total_aggregated_information_message_value;
  skip
}

/* each byte of Program Trading Information Of Total Aggregated Information Message set to where it lies, so a field read out of place says so */
inline ramp_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_record, program_trading_information_of_total_aggregated_information_message_base) {
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 0 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 15 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 30 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 45 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 60 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 75 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 90 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 105 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 120 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 130 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 140 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 150 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 160 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 170 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 180 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 190 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 200 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 222 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 244 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 266 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 288 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 310 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 332 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = (program_trading_information_of_total_aggregated_information_message_base + 354 + program_trading_information_of_total_aggregated_information_message_at + 1) % 256; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_record.end_keyword = (program_trading_information_of_total_aggregated_information_message_base + 376 + 1) % 256;
  skip
}

/* Program Trading Information Of Total Aggregated Information Message to the wire, 377 bytes from where the cursor stands */
inline encode_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_record) {
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.sell_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.buy_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.sell_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.buy_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.sell_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.buy_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> wire[at] = program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  wire[at] = program_trading_information_of_total_aggregated_information_message_record.end_keyword; at = at + 1;
  skip
}

/* Program Trading Information Of Total Aggregated Information Message off the wire, 377 bytes from where the cursor stands */
inline decode_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_record) {
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.sell_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> program_trading_information_of_total_aggregated_information_message_record.buy_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> program_trading_information_of_total_aggregated_information_message_record.non_arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] = wire[at]; at = at + 1; program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Program Trading Information Of Total Aggregated Information Message is what was written, byte for byte */
inline equal_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_read, program_trading_information_of_total_aggregated_information_message_written) {
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> assert(program_trading_information_of_total_aggregated_information_message_read.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.sell_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> assert(program_trading_information_of_total_aggregated_information_message_read.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.buy_side_arbitrage_trading_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> assert(program_trading_information_of_total_aggregated_information_message_read.sell_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.sell_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> assert(program_trading_information_of_total_aggregated_information_message_read.buy_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.buy_side_non_arbitrage_remaining_quantity[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> assert(program_trading_information_of_total_aggregated_information_message_read.sell_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.sell_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> assert(program_trading_information_of_total_aggregated_information_message_read.buy_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.buy_side_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> assert(program_trading_information_of_total_aggregated_information_message_read.sell_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.sell_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 15 -> assert(program_trading_information_of_total_aggregated_information_message_read.buy_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.buy_side_non_arbitrage_quantity[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> assert(program_trading_information_of_total_aggregated_information_message_read.arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> assert(program_trading_information_of_total_aggregated_information_message_read.arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> assert(program_trading_information_of_total_aggregated_information_message_read.arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> assert(program_trading_information_of_total_aggregated_information_message_read.arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> assert(program_trading_information_of_total_aggregated_information_message_read.non_arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.non_arbitrage_ask_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> assert(program_trading_information_of_total_aggregated_information_message_read.non_arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.non_arbitrage_ask_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> assert(program_trading_information_of_total_aggregated_information_message_read.non_arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.non_arbitrage_bid_trust_trading_volume[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 10 -> assert(program_trading_information_of_total_aggregated_information_message_read.non_arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.non_arbitrage_bid_principal_trading_volume[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> assert(program_trading_information_of_total_aggregated_information_message_read.arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> assert(program_trading_information_of_total_aggregated_information_message_read.arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> assert(program_trading_information_of_total_aggregated_information_message_read.arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> assert(program_trading_information_of_total_aggregated_information_message_read.arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> assert(program_trading_information_of_total_aggregated_information_message_read.non_arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.non_arbitrage_ask_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> assert(program_trading_information_of_total_aggregated_information_message_read.non_arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.non_arbitrage_ask_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> assert(program_trading_information_of_total_aggregated_information_message_read.non_arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.non_arbitrage_bid_trust_trading_value[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  program_trading_information_of_total_aggregated_information_message_at = 0;
  do
  :: program_trading_information_of_total_aggregated_information_message_at < 22 -> assert(program_trading_information_of_total_aggregated_information_message_read.non_arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at] == program_trading_information_of_total_aggregated_information_message_written.non_arbitrage_bid_principal_trading_value[program_trading_information_of_total_aggregated_information_message_at]); program_trading_information_of_total_aggregated_information_message_at = program_trading_information_of_total_aggregated_information_message_at + 1
  :: else -> break
  od;
  assert(program_trading_information_of_total_aggregated_information_message_read.end_keyword == program_trading_information_of_total_aggregated_information_message_written.end_keyword);
  skip
}

/* ---- Market Operation Schedule Message: 78 bytes ----------------------------- */

/* The data is provided when a Market Operation Schedule event is disclosed. */
typedef MarketOperationScheduleMessage {
  byte market_operation_product_id[3];
  byte board_id[2];
  byte board_event_id[3];
  byte start_time_of_a_board_event[9];
  byte board_event_group_code[5];
  byte session_start_end_code[2];
  byte session_id[2];
  byte isin_code[12];
  byte isin_code_of_a_common_stock[12];
  byte product_id[11];
  byte trading_halt_reason_code[3];
  byte trading_halt_type_code;
  byte step_applied[2];
  byte price_limit_range_expansion_for_base_issue_type_code;
  byte expected_time_of_expanding_price_limit_range[9];
  byte end_keyword
};

int market_operation_schedule_message_at;

/* every byte of Market Operation Schedule Message set to one value */
inline fill_market_operation_schedule_message(market_operation_schedule_message_record, market_operation_schedule_message_value) {
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.market_operation_product_id[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.board_id[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.board_event_id[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> market_operation_schedule_message_record.start_time_of_a_board_event[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 5 -> market_operation_schedule_message_record.board_event_group_code[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.session_start_end_code[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.session_id[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> market_operation_schedule_message_record.isin_code[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> market_operation_schedule_message_record.isin_code_of_a_common_stock[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 11 -> market_operation_schedule_message_record.product_id[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.trading_halt_reason_code[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.trading_halt_type_code = market_operation_schedule_message_value;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.step_applied[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.price_limit_range_expansion_for_base_issue_type_code = market_operation_schedule_message_value;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> market_operation_schedule_message_record.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.end_keyword = market_operation_schedule_message_value;
  skip
}

/* each byte of Market Operation Schedule Message set to where it lies, so a field read out of place says so */
inline ramp_market_operation_schedule_message(market_operation_schedule_message_record, market_operation_schedule_message_base) {
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.market_operation_product_id[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 0 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.board_id[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 3 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.board_event_id[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 5 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> market_operation_schedule_message_record.start_time_of_a_board_event[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 8 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 5 -> market_operation_schedule_message_record.board_event_group_code[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 17 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.session_start_end_code[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 22 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.session_id[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 24 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> market_operation_schedule_message_record.isin_code[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 26 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> market_operation_schedule_message_record.isin_code_of_a_common_stock[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 38 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 11 -> market_operation_schedule_message_record.product_id[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 50 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.trading_halt_reason_code[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 61 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.trading_halt_type_code = (market_operation_schedule_message_base + 64 + 1) % 256;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.step_applied[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 65 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.price_limit_range_expansion_for_base_issue_type_code = (market_operation_schedule_message_base + 67 + 1) % 256;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> market_operation_schedule_message_record.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 68 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.end_keyword = (market_operation_schedule_message_base + 77 + 1) % 256;
  skip
}

/* Market Operation Schedule Message to the wire, 78 bytes from where the cursor stands */
inline encode_market_operation_schedule_message(market_operation_schedule_message_record) {
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> wire[at] = market_operation_schedule_message_record.market_operation_product_id[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> wire[at] = market_operation_schedule_message_record.board_id[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> wire[at] = market_operation_schedule_message_record.board_event_id[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> wire[at] = market_operation_schedule_message_record.start_time_of_a_board_event[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 5 -> wire[at] = market_operation_schedule_message_record.board_event_group_code[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> wire[at] = market_operation_schedule_message_record.session_start_end_code[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> wire[at] = market_operation_schedule_message_record.session_id[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> wire[at] = market_operation_schedule_message_record.isin_code[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> wire[at] = market_operation_schedule_message_record.isin_code_of_a_common_stock[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 11 -> wire[at] = market_operation_schedule_message_record.product_id[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> wire[at] = market_operation_schedule_message_record.trading_halt_reason_code[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  wire[at] = market_operation_schedule_message_record.trading_halt_type_code; at = at + 1;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> wire[at] = market_operation_schedule_message_record.step_applied[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  wire[at] = market_operation_schedule_message_record.price_limit_range_expansion_for_base_issue_type_code; at = at + 1;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> wire[at] = market_operation_schedule_message_record.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  wire[at] = market_operation_schedule_message_record.end_keyword; at = at + 1;
  skip
}

/* Market Operation Schedule Message off the wire, 78 bytes from where the cursor stands */
inline decode_market_operation_schedule_message(market_operation_schedule_message_record) {
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.market_operation_product_id[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.board_id[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.board_event_id[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> market_operation_schedule_message_record.start_time_of_a_board_event[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 5 -> market_operation_schedule_message_record.board_event_group_code[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.session_start_end_code[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.session_id[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> market_operation_schedule_message_record.isin_code[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> market_operation_schedule_message_record.isin_code_of_a_common_stock[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 11 -> market_operation_schedule_message_record.product_id[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.trading_halt_reason_code[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.trading_halt_type_code = wire[at]; at = at + 1;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.step_applied[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.price_limit_range_expansion_for_base_issue_type_code = wire[at]; at = at + 1;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> market_operation_schedule_message_record.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Operation Schedule Message is what was written, byte for byte */
inline equal_market_operation_schedule_message(market_operation_schedule_message_read, market_operation_schedule_message_written) {
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> assert(market_operation_schedule_message_read.market_operation_product_id[market_operation_schedule_message_at] == market_operation_schedule_message_written.market_operation_product_id[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> assert(market_operation_schedule_message_read.board_id[market_operation_schedule_message_at] == market_operation_schedule_message_written.board_id[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> assert(market_operation_schedule_message_read.board_event_id[market_operation_schedule_message_at] == market_operation_schedule_message_written.board_event_id[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> assert(market_operation_schedule_message_read.start_time_of_a_board_event[market_operation_schedule_message_at] == market_operation_schedule_message_written.start_time_of_a_board_event[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 5 -> assert(market_operation_schedule_message_read.board_event_group_code[market_operation_schedule_message_at] == market_operation_schedule_message_written.board_event_group_code[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> assert(market_operation_schedule_message_read.session_start_end_code[market_operation_schedule_message_at] == market_operation_schedule_message_written.session_start_end_code[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> assert(market_operation_schedule_message_read.session_id[market_operation_schedule_message_at] == market_operation_schedule_message_written.session_id[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> assert(market_operation_schedule_message_read.isin_code[market_operation_schedule_message_at] == market_operation_schedule_message_written.isin_code[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> assert(market_operation_schedule_message_read.isin_code_of_a_common_stock[market_operation_schedule_message_at] == market_operation_schedule_message_written.isin_code_of_a_common_stock[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 11 -> assert(market_operation_schedule_message_read.product_id[market_operation_schedule_message_at] == market_operation_schedule_message_written.product_id[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> assert(market_operation_schedule_message_read.trading_halt_reason_code[market_operation_schedule_message_at] == market_operation_schedule_message_written.trading_halt_reason_code[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  assert(market_operation_schedule_message_read.trading_halt_type_code == market_operation_schedule_message_written.trading_halt_type_code);
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> assert(market_operation_schedule_message_read.step_applied[market_operation_schedule_message_at] == market_operation_schedule_message_written.step_applied[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  assert(market_operation_schedule_message_read.price_limit_range_expansion_for_base_issue_type_code == market_operation_schedule_message_written.price_limit_range_expansion_for_base_issue_type_code);
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> assert(market_operation_schedule_message_read.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at] == market_operation_schedule_message_written.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  assert(market_operation_schedule_message_read.end_keyword == market_operation_schedule_message_written.end_keyword);
  skip
}

/* ---- Member Firm Imposing Lifting Sanctions Message: 41 bytes ---------------- */

/* The data is provided when a sanction is imposed on a member firm or lifted. */
typedef MemberFirmImposingLiftingSanctionsMessage {
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte disclosing_data_type_code[3];
  byte disclosure_time[9];
  byte member_number[5];
  byte member_firm_trust_principal_type_code[5];
  byte end_keyword
};

int member_firm_imposing_lifting_sanctions_message_at;

/* every byte of Member Firm Imposing Lifting Sanctions Message set to one value */
inline fill_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_record, member_firm_imposing_lifting_sanctions_message_value) {
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 12 -> member_firm_imposing_lifting_sanctions_message_record.isin_code[member_firm_imposing_lifting_sanctions_message_at] = member_firm_imposing_lifting_sanctions_message_value; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 6 -> member_firm_imposing_lifting_sanctions_message_record.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at] = member_firm_imposing_lifting_sanctions_message_value; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 3 -> member_firm_imposing_lifting_sanctions_message_record.disclosing_data_type_code[member_firm_imposing_lifting_sanctions_message_at] = member_firm_imposing_lifting_sanctions_message_value; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 9 -> member_firm_imposing_lifting_sanctions_message_record.disclosure_time[member_firm_imposing_lifting_sanctions_message_at] = member_firm_imposing_lifting_sanctions_message_value; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> member_firm_imposing_lifting_sanctions_message_record.member_number[member_firm_imposing_lifting_sanctions_message_at] = member_firm_imposing_lifting_sanctions_message_value; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> member_firm_imposing_lifting_sanctions_message_record.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at] = member_firm_imposing_lifting_sanctions_message_value; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_record.end_keyword = member_firm_imposing_lifting_sanctions_message_value;
  skip
}

/* each byte of Member Firm Imposing Lifting Sanctions Message set to where it lies, so a field read out of place says so */
inline ramp_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_record, member_firm_imposing_lifting_sanctions_message_base) {
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 12 -> member_firm_imposing_lifting_sanctions_message_record.isin_code[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 0 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 6 -> member_firm_imposing_lifting_sanctions_message_record.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 12 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 3 -> member_firm_imposing_lifting_sanctions_message_record.disclosing_data_type_code[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 18 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 9 -> member_firm_imposing_lifting_sanctions_message_record.disclosure_time[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 21 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> member_firm_imposing_lifting_sanctions_message_record.member_number[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 30 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> member_firm_imposing_lifting_sanctions_message_record.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 35 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_record.end_keyword = (member_firm_imposing_lifting_sanctions_message_base + 40 + 1) % 256;
  skip
}

/* Member Firm Imposing Lifting Sanctions Message to the wire, 41 bytes from where the cursor stands */
inline encode_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_record) {
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 12 -> wire[at] = member_firm_imposing_lifting_sanctions_message_record.isin_code[member_firm_imposing_lifting_sanctions_message_at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 6 -> wire[at] = member_firm_imposing_lifting_sanctions_message_record.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 3 -> wire[at] = member_firm_imposing_lifting_sanctions_message_record.disclosing_data_type_code[member_firm_imposing_lifting_sanctions_message_at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 9 -> wire[at] = member_firm_imposing_lifting_sanctions_message_record.disclosure_time[member_firm_imposing_lifting_sanctions_message_at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> wire[at] = member_firm_imposing_lifting_sanctions_message_record.member_number[member_firm_imposing_lifting_sanctions_message_at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> wire[at] = member_firm_imposing_lifting_sanctions_message_record.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  wire[at] = member_firm_imposing_lifting_sanctions_message_record.end_keyword; at = at + 1;
  skip
}

/* Member Firm Imposing Lifting Sanctions Message off the wire, 41 bytes from where the cursor stands */
inline decode_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_record) {
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 12 -> member_firm_imposing_lifting_sanctions_message_record.isin_code[member_firm_imposing_lifting_sanctions_message_at] = wire[at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 6 -> member_firm_imposing_lifting_sanctions_message_record.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at] = wire[at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 3 -> member_firm_imposing_lifting_sanctions_message_record.disclosing_data_type_code[member_firm_imposing_lifting_sanctions_message_at] = wire[at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 9 -> member_firm_imposing_lifting_sanctions_message_record.disclosure_time[member_firm_imposing_lifting_sanctions_message_at] = wire[at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> member_firm_imposing_lifting_sanctions_message_record.member_number[member_firm_imposing_lifting_sanctions_message_at] = wire[at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> member_firm_imposing_lifting_sanctions_message_record.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at] = wire[at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Member Firm Imposing Lifting Sanctions Message is what was written, byte for byte */
inline equal_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_read, member_firm_imposing_lifting_sanctions_message_written) {
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 12 -> assert(member_firm_imposing_lifting_sanctions_message_read.isin_code[member_firm_imposing_lifting_sanctions_message_at] == member_firm_imposing_lifting_sanctions_message_written.isin_code[member_firm_imposing_lifting_sanctions_message_at]); member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 6 -> assert(member_firm_imposing_lifting_sanctions_message_read.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at] == member_firm_imposing_lifting_sanctions_message_written.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at]); member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 3 -> assert(member_firm_imposing_lifting_sanctions_message_read.disclosing_data_type_code[member_firm_imposing_lifting_sanctions_message_at] == member_firm_imposing_lifting_sanctions_message_written.disclosing_data_type_code[member_firm_imposing_lifting_sanctions_message_at]); member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 9 -> assert(member_firm_imposing_lifting_sanctions_message_read.disclosure_time[member_firm_imposing_lifting_sanctions_message_at] == member_firm_imposing_lifting_sanctions_message_written.disclosure_time[member_firm_imposing_lifting_sanctions_message_at]); member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> assert(member_firm_imposing_lifting_sanctions_message_read.member_number[member_firm_imposing_lifting_sanctions_message_at] == member_firm_imposing_lifting_sanctions_message_written.member_number[member_firm_imposing_lifting_sanctions_message_at]); member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> assert(member_firm_imposing_lifting_sanctions_message_read.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at] == member_firm_imposing_lifting_sanctions_message_written.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at]); member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  assert(member_firm_imposing_lifting_sanctions_message_read.end_keyword == member_firm_imposing_lifting_sanctions_message_written.end_keyword);
  skip
}

/* ---- Top Five Traders Activities Message: 409 bytes -------------------------- */

/* Top Five Traders' Activities (including only Regular Board). */
typedef TopFiveTradersActivitiesMessage {
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte member_number_1_for_ask[5];
  byte ask_trading_volume_1[12];
  byte ask_trading_value_1[22];
  byte member_number_1_for_bid[5];
  byte bid_trading_volume_1[12];
  byte bid_trading_value_1[22];
  byte member_number_2_for_ask[5];
  byte ask_trading_volume_2[12];
  byte ask_trading_value_2[22];
  byte member_number_2_for_bid[5];
  byte bid_trading_volume_2[12];
  byte bid_trading_value_2[22];
  byte member_number_3_for_ask[5];
  byte ask_trading_volume_3[12];
  byte ask_trading_value_3[22];
  byte member_number_3_for_bid[5];
  byte bid_trading_volume_3[12];
  byte bid_trading_value_3[22];
  byte member_number_4_for_ask[5];
  byte ask_trading_volume_4[12];
  byte ask_trading_value_4[22];
  byte member_number_4_for_bid[5];
  byte bid_trading_volume_4[12];
  byte bid_trading_value_4[22];
  byte member_number_5_for_ask[5];
  byte ask_trading_volume_5[12];
  byte ask_trading_value_5[22];
  byte member_number_5_for_bid[5];
  byte bid_trading_volume_5[12];
  byte bid_trading_value_5[22];
  byte end_keyword
};

int top_five_traders_activities_message_at;

/* every byte of Top Five Traders Activities Message set to one value */
inline fill_top_five_traders_activities_message(top_five_traders_activities_message_record, top_five_traders_activities_message_value) {
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.isin_code[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 6 -> top_five_traders_activities_message_record.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_1[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_1[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_1[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_1[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_2[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_2[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_2[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_2[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_3[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_3[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_3[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_3[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_4[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_4[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_4[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_4[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_5[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_5[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_5[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_5[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_record.end_keyword = top_five_traders_activities_message_value;
  skip
}

/* each byte of Top Five Traders Activities Message set to where it lies, so a field read out of place says so */
inline ramp_top_five_traders_activities_message(top_five_traders_activities_message_record, top_five_traders_activities_message_base) {
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.isin_code[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 0 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 6 -> top_five_traders_activities_message_record.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 12 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 18 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_1[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 23 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_1[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 35 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 57 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_1[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 62 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_1[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 74 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 96 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_2[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 101 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_2[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 113 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 135 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_2[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 140 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_2[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 152 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 174 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_3[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 179 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_3[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 191 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 213 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_3[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 218 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_3[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 230 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 252 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_4[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 257 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_4[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 269 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 291 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_4[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 296 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_4[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 308 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 330 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_5[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 335 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_5[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 347 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 369 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_5[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 374 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_5[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 386 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_record.end_keyword = (top_five_traders_activities_message_base + 408 + 1) % 256;
  skip
}

/* Top Five Traders Activities Message to the wire, 409 bytes from where the cursor stands */
inline encode_top_five_traders_activities_message(top_five_traders_activities_message_record) {
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.isin_code[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 6 -> wire[at] = top_five_traders_activities_message_record.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_1_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_1[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_1[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_1_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_1[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_1[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_2_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_2[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_2[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_2_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_2[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_2[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_3_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_3[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_3[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_3_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_3[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_3[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_4_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_4[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_4[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_4_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_4[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_4[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_5_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_5[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_5[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_5_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_5[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_5[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  wire[at] = top_five_traders_activities_message_record.end_keyword; at = at + 1;
  skip
}

/* Top Five Traders Activities Message off the wire, 409 bytes from where the cursor stands */
inline decode_top_five_traders_activities_message(top_five_traders_activities_message_record) {
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.isin_code[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 6 -> top_five_traders_activities_message_record.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_1[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_1[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_1[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_1[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_2[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_2[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_2[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_2[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_3[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_3[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_3[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_3[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_4[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_4[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_4[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_4[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.ask_trading_volume_5[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.ask_trading_value_5[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.bid_trading_volume_5[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> top_five_traders_activities_message_record.bid_trading_value_5[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Top Five Traders Activities Message is what was written, byte for byte */
inline equal_top_five_traders_activities_message(top_five_traders_activities_message_read, top_five_traders_activities_message_written) {
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.isin_code[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.isin_code[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 6 -> assert(top_five_traders_activities_message_read.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_1_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_1_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.ask_trading_volume_1[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_1[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.ask_trading_value_1[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_1[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_1_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_1_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.bid_trading_volume_1[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_1[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.bid_trading_value_1[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_1[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_2_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_2_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.ask_trading_volume_2[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_2[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.ask_trading_value_2[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_2[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_2_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_2_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.bid_trading_volume_2[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_2[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.bid_trading_value_2[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_2[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_3_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_3_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.ask_trading_volume_3[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_3[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.ask_trading_value_3[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_3[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_3_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_3_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.bid_trading_volume_3[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_3[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.bid_trading_value_3[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_3[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_4_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_4_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.ask_trading_volume_4[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_4[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.ask_trading_value_4[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_4[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_4_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_4_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.bid_trading_volume_4[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_4[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.bid_trading_value_4[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_4[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_5_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_5_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.ask_trading_volume_5[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_5[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.ask_trading_value_5[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_5[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_5_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_5_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> assert(top_five_traders_activities_message_read.bid_trading_volume_5[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_5[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 22 -> assert(top_five_traders_activities_message_read.bid_trading_value_5[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_5[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  assert(top_five_traders_activities_message_read.end_keyword == top_five_traders_activities_message_written.end_keyword);
  skip
}

/* ---- Equities Batch Data Message: 649 bytes ---------------------------------- */

/* Details. */
typedef EquitiesBatchDataMessage {
  byte message_sequence_number[8];
  byte total_number_of_instruments_of_the_contract[6];
  byte business_date[8];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte abbreviated_issue_code[9];
  byte abbreviated_issue_name[40];
  byte abbreviated_issue_name_in_en[40];
  byte group_number[5];
  byte market_operation_product_id[3];
  byte security_group_id[2];
  byte unit_trading;
  byte rights_type_code[2];
  byte par_value_type_code[2];
  byte an_issue_of_which_base_price_is_settled_with_a_todays_single_price;
  byte reevaluation_reason_code[2];
  byte base_price_change;
  byte random_end_trigger_code;
  byte market_alert;
  byte market_alert_type_code[2];
  byte korea_corporate_governance_stock_price_index_kogi;
  byte issue_for_administration;
  byte unfaithful_disclosure;
  byte back_door_listing;
  byte trading_halt;
  byte industry_id[10];
  byte small_medium_sized_business;
  byte section_type_code;
  byte investment_institution_type_code;
  byte base_price[11];
  byte yesterdays_closing_price_type_code_krx;
  byte yesterdays_closing_price_krx[11];
  byte yesterdays_accumulated_trading_amount[12];
  byte yesterdays_accumulated_trading_value[22];
  byte upper_limit_price[11];
  byte lower_limit_price[11];
  byte substitute_price_of_securities[11];
  byte par_value[11];
  byte issuing_price[11];
  byte listing_date[8];
  byte number_of_listed_shares[16];
  byte liquidation_trade;
  byte the_establishment_date[8];
  byte maturity_date[8];
  byte exercising_period[8];
  byte expiration_date_for_right[8];
  byte exercise_price_of_elw_or_bw[13];
  byte capital[22];
  byte credit_order_possibility;
  byte limit_order_permission_type_code[5];
  byte market_price_order_permission_type_code[5];
  byte conditioned_order_permission_type_code[5];
  byte best_favorable_order_permission_type_code[5];
  byte first_best_order_permission_type[5];
  byte mid_price_order_permission_type_code[5];
  byte stop_limit_price_order_permission_type_code[5];
  byte capital_increase_type_code[2];
  byte other_stock_type_code;
  byte national_stock;
  byte appraised_price[11];
  byte lowest_order_price[11];
  byte highest_order_price[11];
  byte unit_of_volume_in_main_board[11];
  byte lot_size_after_hours_trading[11];
  byte rei_ts_type_code;
  byte target_stock_isin_code[12];
  byte currency_iso_code[3];
  byte country_code[3];
  byte market_making_possibility;
  byte closing_price_trading_possibility_in_the_after_hours;
  byte closing_price_trading_in_the_pre_opening_market;
  byte block_trading_in_the_pre_opening_market;
  byte basket_trading_in_the_pre_opening_market;
  byte announcement_of_estimated_trading_price;
  byte short_selling;
  byte etf_tracking_difference[13];
  byte regs;
  byte spac;
  byte tax_type_code;
  byte appraisal_ratio_of_substitute_price[13];
  byte investment_caution_issue;
  byte delisting_date[8];
  byte short_term_overheat_issue_type_code;
  byte etf_replication_methods_type_code;
  byte expiration_date[8];
  byte distribution_type_code[2];
  byte calculation_of_redemption_price_start_date[8];
  byte calculation_of_redemption_price_end_date[8];
  byte etp_product_type_code;
  byte index_calculation_institution_type_code[2];
  byte index_market_classification_id[6];
  byte index_sequence_number[3];
  byte tracking_index_leverage_inverse_type_code[2];
  byte reference_index_leverage_inverse_type_code[2];
  byte index_asset_classification_id_1[6];
  byte index_asset_classification_id_2[6];
  byte ipo_underwriter_member_number[5];
  byte lp_order;
  byte low_liquidity;
  byte abnormal_rise;
  byte upper_limit_quantity[23];
  byte investment_precaution_issue;
  byte preferred_stocks_with_lesser_shares;
  byte spac_merger;
  byte segment_type_code;
  byte after_market_possibility;
  byte choice_on_competitive_trading;
  byte limit_on_competitive_trading_volume;
  byte occurrence_of_reasons_prohibiting_competitive_trading;
  byte approval_on_competitive_trading;
  byte approval_on_negotiation_trading;
  byte yesterdays_closing_price_type_code_nxt;
  byte yesterdays_closing_price_nxt[11];
  byte competition_board_trade_permission_code[5];
  byte negotiation_possible_or_not_before_main_market;
  byte end_keyword
};

int equities_batch_data_message_at;

/* every byte of Equities Batch Data Message set to one value */
inline fill_equities_batch_data_message(equities_batch_data_message_record, equities_batch_data_message_value) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.message_sequence_number[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.total_number_of_instruments_of_the_contract[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.business_date[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.isin_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 9 -> equities_batch_data_message_record.abbreviated_issue_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> equities_batch_data_message_record.abbreviated_issue_name[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> equities_batch_data_message_record.abbreviated_issue_name_in_en[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.group_number[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.market_operation_product_id[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.security_group_id[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.unit_trading = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.rights_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.par_value_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.an_issue_of_which_base_price_is_settled_with_a_todays_single_price = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.reevaluation_reason_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.base_price_change = equities_batch_data_message_value;
  equities_batch_data_message_record.random_end_trigger_code = equities_batch_data_message_value;
  equities_batch_data_message_record.market_alert = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.market_alert_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.korea_corporate_governance_stock_price_index_kogi = equities_batch_data_message_value;
  equities_batch_data_message_record.issue_for_administration = equities_batch_data_message_value;
  equities_batch_data_message_record.unfaithful_disclosure = equities_batch_data_message_value;
  equities_batch_data_message_record.back_door_listing = equities_batch_data_message_value;
  equities_batch_data_message_record.trading_halt = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 10 -> equities_batch_data_message_record.industry_id[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.small_medium_sized_business = equities_batch_data_message_value;
  equities_batch_data_message_record.section_type_code = equities_batch_data_message_value;
  equities_batch_data_message_record.investment_institution_type_code = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.base_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_krx = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.yesterdays_closing_price_krx[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.yesterdays_accumulated_trading_amount[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> equities_batch_data_message_record.yesterdays_accumulated_trading_value[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.upper_limit_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.lower_limit_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.substitute_price_of_securities[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.par_value[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.issuing_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.listing_date[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.number_of_listed_shares[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.liquidation_trade = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.the_establishment_date[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.maturity_date[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.exercising_period[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.expiration_date_for_right[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> equities_batch_data_message_record.exercise_price_of_elw_or_bw[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> equities_batch_data_message_record.capital[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.credit_order_possibility = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.limit_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.market_price_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.conditioned_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.best_favorable_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.first_best_order_permission_type[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.mid_price_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.stop_limit_price_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.capital_increase_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.other_stock_type_code = equities_batch_data_message_value;
  equities_batch_data_message_record.national_stock = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.appraised_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.lowest_order_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.highest_order_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.unit_of_volume_in_main_board[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.lot_size_after_hours_trading[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.rei_ts_type_code = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.target_stock_isin_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.currency_iso_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.country_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.market_making_possibility = equities_batch_data_message_value;
  equities_batch_data_message_record.closing_price_trading_possibility_in_the_after_hours = equities_batch_data_message_value;
  equities_batch_data_message_record.closing_price_trading_in_the_pre_opening_market = equities_batch_data_message_value;
  equities_batch_data_message_record.block_trading_in_the_pre_opening_market = equities_batch_data_message_value;
  equities_batch_data_message_record.basket_trading_in_the_pre_opening_market = equities_batch_data_message_value;
  equities_batch_data_message_record.announcement_of_estimated_trading_price = equities_batch_data_message_value;
  equities_batch_data_message_record.short_selling = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> equities_batch_data_message_record.etf_tracking_difference[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.regs = equities_batch_data_message_value;
  equities_batch_data_message_record.spac = equities_batch_data_message_value;
  equities_batch_data_message_record.tax_type_code = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> equities_batch_data_message_record.appraisal_ratio_of_substitute_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.investment_caution_issue = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.delisting_date[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.short_term_overheat_issue_type_code = equities_batch_data_message_value;
  equities_batch_data_message_record.etf_replication_methods_type_code = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.expiration_date[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.distribution_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.calculation_of_redemption_price_start_date[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.calculation_of_redemption_price_end_date[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.etp_product_type_code = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.index_calculation_institution_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_market_classification_id[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.index_sequence_number[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.tracking_index_leverage_inverse_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.reference_index_leverage_inverse_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_asset_classification_id_1[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_asset_classification_id_2[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.ipo_underwriter_member_number[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.lp_order = equities_batch_data_message_value;
  equities_batch_data_message_record.low_liquidity = equities_batch_data_message_value;
  equities_batch_data_message_record.abnormal_rise = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 23 -> equities_batch_data_message_record.upper_limit_quantity[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.investment_precaution_issue = equities_batch_data_message_value;
  equities_batch_data_message_record.preferred_stocks_with_lesser_shares = equities_batch_data_message_value;
  equities_batch_data_message_record.spac_merger = equities_batch_data_message_value;
  equities_batch_data_message_record.segment_type_code = equities_batch_data_message_value;
  equities_batch_data_message_record.after_market_possibility = equities_batch_data_message_value;
  equities_batch_data_message_record.choice_on_competitive_trading = equities_batch_data_message_value;
  equities_batch_data_message_record.limit_on_competitive_trading_volume = equities_batch_data_message_value;
  equities_batch_data_message_record.occurrence_of_reasons_prohibiting_competitive_trading = equities_batch_data_message_value;
  equities_batch_data_message_record.approval_on_competitive_trading = equities_batch_data_message_value;
  equities_batch_data_message_record.approval_on_negotiation_trading = equities_batch_data_message_value;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_nxt = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.yesterdays_closing_price_nxt[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.competition_board_trade_permission_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.negotiation_possible_or_not_before_main_market = equities_batch_data_message_value;
  equities_batch_data_message_record.end_keyword = equities_batch_data_message_value;
  skip
}

/* each byte of Equities Batch Data Message set to where it lies, so a field read out of place says so */
inline ramp_equities_batch_data_message(equities_batch_data_message_record, equities_batch_data_message_base) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.message_sequence_number[equities_batch_data_message_at] = (equities_batch_data_message_base + 0 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.total_number_of_instruments_of_the_contract[equities_batch_data_message_at] = (equities_batch_data_message_base + 8 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.business_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 14 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.isin_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 22 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at] = (equities_batch_data_message_base + 34 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 9 -> equities_batch_data_message_record.abbreviated_issue_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 40 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> equities_batch_data_message_record.abbreviated_issue_name[equities_batch_data_message_at] = (equities_batch_data_message_base + 49 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> equities_batch_data_message_record.abbreviated_issue_name_in_en[equities_batch_data_message_at] = (equities_batch_data_message_base + 89 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.group_number[equities_batch_data_message_at] = (equities_batch_data_message_base + 129 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.market_operation_product_id[equities_batch_data_message_at] = (equities_batch_data_message_base + 134 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.security_group_id[equities_batch_data_message_at] = (equities_batch_data_message_base + 137 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.unit_trading = (equities_batch_data_message_base + 139 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.rights_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 140 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.par_value_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 142 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.an_issue_of_which_base_price_is_settled_with_a_todays_single_price = (equities_batch_data_message_base + 144 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.reevaluation_reason_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 145 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.base_price_change = (equities_batch_data_message_base + 147 + 1) % 256;
  equities_batch_data_message_record.random_end_trigger_code = (equities_batch_data_message_base + 148 + 1) % 256;
  equities_batch_data_message_record.market_alert = (equities_batch_data_message_base + 149 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.market_alert_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 150 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.korea_corporate_governance_stock_price_index_kogi = (equities_batch_data_message_base + 152 + 1) % 256;
  equities_batch_data_message_record.issue_for_administration = (equities_batch_data_message_base + 153 + 1) % 256;
  equities_batch_data_message_record.unfaithful_disclosure = (equities_batch_data_message_base + 154 + 1) % 256;
  equities_batch_data_message_record.back_door_listing = (equities_batch_data_message_base + 155 + 1) % 256;
  equities_batch_data_message_record.trading_halt = (equities_batch_data_message_base + 156 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 10 -> equities_batch_data_message_record.industry_id[equities_batch_data_message_at] = (equities_batch_data_message_base + 157 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.small_medium_sized_business = (equities_batch_data_message_base + 167 + 1) % 256;
  equities_batch_data_message_record.section_type_code = (equities_batch_data_message_base + 168 + 1) % 256;
  equities_batch_data_message_record.investment_institution_type_code = (equities_batch_data_message_base + 169 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.base_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 170 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_krx = (equities_batch_data_message_base + 181 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.yesterdays_closing_price_krx[equities_batch_data_message_at] = (equities_batch_data_message_base + 182 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.yesterdays_accumulated_trading_amount[equities_batch_data_message_at] = (equities_batch_data_message_base + 193 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> equities_batch_data_message_record.yesterdays_accumulated_trading_value[equities_batch_data_message_at] = (equities_batch_data_message_base + 205 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.upper_limit_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 227 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.lower_limit_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 238 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.substitute_price_of_securities[equities_batch_data_message_at] = (equities_batch_data_message_base + 249 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.par_value[equities_batch_data_message_at] = (equities_batch_data_message_base + 260 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.issuing_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 271 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.listing_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 282 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.number_of_listed_shares[equities_batch_data_message_at] = (equities_batch_data_message_base + 290 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.liquidation_trade = (equities_batch_data_message_base + 306 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.the_establishment_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 307 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.maturity_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 315 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.exercising_period[equities_batch_data_message_at] = (equities_batch_data_message_base + 323 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.expiration_date_for_right[equities_batch_data_message_at] = (equities_batch_data_message_base + 331 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> equities_batch_data_message_record.exercise_price_of_elw_or_bw[equities_batch_data_message_at] = (equities_batch_data_message_base + 339 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> equities_batch_data_message_record.capital[equities_batch_data_message_at] = (equities_batch_data_message_base + 352 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.credit_order_possibility = (equities_batch_data_message_base + 374 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.limit_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 375 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.market_price_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 380 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.conditioned_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 385 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.best_favorable_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 390 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.first_best_order_permission_type[equities_batch_data_message_at] = (equities_batch_data_message_base + 395 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.mid_price_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 400 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.stop_limit_price_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 405 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.capital_increase_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 410 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.other_stock_type_code = (equities_batch_data_message_base + 412 + 1) % 256;
  equities_batch_data_message_record.national_stock = (equities_batch_data_message_base + 413 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.appraised_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 414 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.lowest_order_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 425 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.highest_order_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 436 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.unit_of_volume_in_main_board[equities_batch_data_message_at] = (equities_batch_data_message_base + 447 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.lot_size_after_hours_trading[equities_batch_data_message_at] = (equities_batch_data_message_base + 458 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.rei_ts_type_code = (equities_batch_data_message_base + 469 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.target_stock_isin_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 470 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.currency_iso_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 482 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.country_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 485 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.market_making_possibility = (equities_batch_data_message_base + 488 + 1) % 256;
  equities_batch_data_message_record.closing_price_trading_possibility_in_the_after_hours = (equities_batch_data_message_base + 489 + 1) % 256;
  equities_batch_data_message_record.closing_price_trading_in_the_pre_opening_market = (equities_batch_data_message_base + 490 + 1) % 256;
  equities_batch_data_message_record.block_trading_in_the_pre_opening_market = (equities_batch_data_message_base + 491 + 1) % 256;
  equities_batch_data_message_record.basket_trading_in_the_pre_opening_market = (equities_batch_data_message_base + 492 + 1) % 256;
  equities_batch_data_message_record.announcement_of_estimated_trading_price = (equities_batch_data_message_base + 493 + 1) % 256;
  equities_batch_data_message_record.short_selling = (equities_batch_data_message_base + 494 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> equities_batch_data_message_record.etf_tracking_difference[equities_batch_data_message_at] = (equities_batch_data_message_base + 495 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.regs = (equities_batch_data_message_base + 508 + 1) % 256;
  equities_batch_data_message_record.spac = (equities_batch_data_message_base + 509 + 1) % 256;
  equities_batch_data_message_record.tax_type_code = (equities_batch_data_message_base + 510 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> equities_batch_data_message_record.appraisal_ratio_of_substitute_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 511 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.investment_caution_issue = (equities_batch_data_message_base + 524 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.delisting_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 525 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.short_term_overheat_issue_type_code = (equities_batch_data_message_base + 533 + 1) % 256;
  equities_batch_data_message_record.etf_replication_methods_type_code = (equities_batch_data_message_base + 534 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.expiration_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 535 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.distribution_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 543 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.calculation_of_redemption_price_start_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 545 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.calculation_of_redemption_price_end_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 553 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.etp_product_type_code = (equities_batch_data_message_base + 561 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.index_calculation_institution_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 562 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_market_classification_id[equities_batch_data_message_at] = (equities_batch_data_message_base + 564 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.index_sequence_number[equities_batch_data_message_at] = (equities_batch_data_message_base + 570 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.tracking_index_leverage_inverse_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 573 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.reference_index_leverage_inverse_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 575 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_asset_classification_id_1[equities_batch_data_message_at] = (equities_batch_data_message_base + 577 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_asset_classification_id_2[equities_batch_data_message_at] = (equities_batch_data_message_base + 583 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.ipo_underwriter_member_number[equities_batch_data_message_at] = (equities_batch_data_message_base + 589 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.lp_order = (equities_batch_data_message_base + 594 + 1) % 256;
  equities_batch_data_message_record.low_liquidity = (equities_batch_data_message_base + 595 + 1) % 256;
  equities_batch_data_message_record.abnormal_rise = (equities_batch_data_message_base + 596 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 23 -> equities_batch_data_message_record.upper_limit_quantity[equities_batch_data_message_at] = (equities_batch_data_message_base + 597 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.investment_precaution_issue = (equities_batch_data_message_base + 620 + 1) % 256;
  equities_batch_data_message_record.preferred_stocks_with_lesser_shares = (equities_batch_data_message_base + 621 + 1) % 256;
  equities_batch_data_message_record.spac_merger = (equities_batch_data_message_base + 622 + 1) % 256;
  equities_batch_data_message_record.segment_type_code = (equities_batch_data_message_base + 623 + 1) % 256;
  equities_batch_data_message_record.after_market_possibility = (equities_batch_data_message_base + 624 + 1) % 256;
  equities_batch_data_message_record.choice_on_competitive_trading = (equities_batch_data_message_base + 625 + 1) % 256;
  equities_batch_data_message_record.limit_on_competitive_trading_volume = (equities_batch_data_message_base + 626 + 1) % 256;
  equities_batch_data_message_record.occurrence_of_reasons_prohibiting_competitive_trading = (equities_batch_data_message_base + 627 + 1) % 256;
  equities_batch_data_message_record.approval_on_competitive_trading = (equities_batch_data_message_base + 628 + 1) % 256;
  equities_batch_data_message_record.approval_on_negotiation_trading = (equities_batch_data_message_base + 629 + 1) % 256;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_nxt = (equities_batch_data_message_base + 630 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.yesterdays_closing_price_nxt[equities_batch_data_message_at] = (equities_batch_data_message_base + 631 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.competition_board_trade_permission_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 642 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.negotiation_possible_or_not_before_main_market = (equities_batch_data_message_base + 647 + 1) % 256;
  equities_batch_data_message_record.end_keyword = (equities_batch_data_message_base + 648 + 1) % 256;
  skip
}

/* Equities Batch Data Message to the wire, 649 bytes from where the cursor stands */
inline encode_equities_batch_data_message(equities_batch_data_message_record) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.message_sequence_number[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> wire[at] = equities_batch_data_message_record.total_number_of_instruments_of_the_contract[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.business_date[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> wire[at] = equities_batch_data_message_record.isin_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> wire[at] = equities_batch_data_message_record.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 9 -> wire[at] = equities_batch_data_message_record.abbreviated_issue_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> wire[at] = equities_batch_data_message_record.abbreviated_issue_name[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> wire[at] = equities_batch_data_message_record.abbreviated_issue_name_in_en[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.group_number[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> wire[at] = equities_batch_data_message_record.market_operation_product_id[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.security_group_id[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.unit_trading; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.rights_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.par_value_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.an_issue_of_which_base_price_is_settled_with_a_todays_single_price; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.reevaluation_reason_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.base_price_change; at = at + 1;
  wire[at] = equities_batch_data_message_record.random_end_trigger_code; at = at + 1;
  wire[at] = equities_batch_data_message_record.market_alert; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.market_alert_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.korea_corporate_governance_stock_price_index_kogi; at = at + 1;
  wire[at] = equities_batch_data_message_record.issue_for_administration; at = at + 1;
  wire[at] = equities_batch_data_message_record.unfaithful_disclosure; at = at + 1;
  wire[at] = equities_batch_data_message_record.back_door_listing; at = at + 1;
  wire[at] = equities_batch_data_message_record.trading_halt; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 10 -> wire[at] = equities_batch_data_message_record.industry_id[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.small_medium_sized_business; at = at + 1;
  wire[at] = equities_batch_data_message_record.section_type_code; at = at + 1;
  wire[at] = equities_batch_data_message_record.investment_institution_type_code; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.base_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.yesterdays_closing_price_type_code_krx; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.yesterdays_closing_price_krx[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> wire[at] = equities_batch_data_message_record.yesterdays_accumulated_trading_amount[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> wire[at] = equities_batch_data_message_record.yesterdays_accumulated_trading_value[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.upper_limit_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.lower_limit_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.substitute_price_of_securities[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.par_value[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.issuing_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.listing_date[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> wire[at] = equities_batch_data_message_record.number_of_listed_shares[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.liquidation_trade; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.the_establishment_date[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.maturity_date[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.exercising_period[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.expiration_date_for_right[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> wire[at] = equities_batch_data_message_record.exercise_price_of_elw_or_bw[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> wire[at] = equities_batch_data_message_record.capital[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.credit_order_possibility; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.limit_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.market_price_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.conditioned_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.best_favorable_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.first_best_order_permission_type[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.mid_price_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.stop_limit_price_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.capital_increase_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.other_stock_type_code; at = at + 1;
  wire[at] = equities_batch_data_message_record.national_stock; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.appraised_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.lowest_order_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.highest_order_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.unit_of_volume_in_main_board[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.lot_size_after_hours_trading[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.rei_ts_type_code; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> wire[at] = equities_batch_data_message_record.target_stock_isin_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> wire[at] = equities_batch_data_message_record.currency_iso_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> wire[at] = equities_batch_data_message_record.country_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.market_making_possibility; at = at + 1;
  wire[at] = equities_batch_data_message_record.closing_price_trading_possibility_in_the_after_hours; at = at + 1;
  wire[at] = equities_batch_data_message_record.closing_price_trading_in_the_pre_opening_market; at = at + 1;
  wire[at] = equities_batch_data_message_record.block_trading_in_the_pre_opening_market; at = at + 1;
  wire[at] = equities_batch_data_message_record.basket_trading_in_the_pre_opening_market; at = at + 1;
  wire[at] = equities_batch_data_message_record.announcement_of_estimated_trading_price; at = at + 1;
  wire[at] = equities_batch_data_message_record.short_selling; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> wire[at] = equities_batch_data_message_record.etf_tracking_difference[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.regs; at = at + 1;
  wire[at] = equities_batch_data_message_record.spac; at = at + 1;
  wire[at] = equities_batch_data_message_record.tax_type_code; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> wire[at] = equities_batch_data_message_record.appraisal_ratio_of_substitute_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.investment_caution_issue; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.delisting_date[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.short_term_overheat_issue_type_code; at = at + 1;
  wire[at] = equities_batch_data_message_record.etf_replication_methods_type_code; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.expiration_date[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.distribution_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.calculation_of_redemption_price_start_date[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.calculation_of_redemption_price_end_date[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.etp_product_type_code; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.index_calculation_institution_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> wire[at] = equities_batch_data_message_record.index_market_classification_id[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> wire[at] = equities_batch_data_message_record.index_sequence_number[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.tracking_index_leverage_inverse_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> wire[at] = equities_batch_data_message_record.reference_index_leverage_inverse_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> wire[at] = equities_batch_data_message_record.index_asset_classification_id_1[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> wire[at] = equities_batch_data_message_record.index_asset_classification_id_2[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.ipo_underwriter_member_number[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.lp_order; at = at + 1;
  wire[at] = equities_batch_data_message_record.low_liquidity; at = at + 1;
  wire[at] = equities_batch_data_message_record.abnormal_rise; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 23 -> wire[at] = equities_batch_data_message_record.upper_limit_quantity[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.investment_precaution_issue; at = at + 1;
  wire[at] = equities_batch_data_message_record.preferred_stocks_with_lesser_shares; at = at + 1;
  wire[at] = equities_batch_data_message_record.spac_merger; at = at + 1;
  wire[at] = equities_batch_data_message_record.segment_type_code; at = at + 1;
  wire[at] = equities_batch_data_message_record.after_market_possibility; at = at + 1;
  wire[at] = equities_batch_data_message_record.choice_on_competitive_trading; at = at + 1;
  wire[at] = equities_batch_data_message_record.limit_on_competitive_trading_volume; at = at + 1;
  wire[at] = equities_batch_data_message_record.occurrence_of_reasons_prohibiting_competitive_trading; at = at + 1;
  wire[at] = equities_batch_data_message_record.approval_on_competitive_trading; at = at + 1;
  wire[at] = equities_batch_data_message_record.approval_on_negotiation_trading; at = at + 1;
  wire[at] = equities_batch_data_message_record.yesterdays_closing_price_type_code_nxt; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> wire[at] = equities_batch_data_message_record.yesterdays_closing_price_nxt[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> wire[at] = equities_batch_data_message_record.competition_board_trade_permission_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.negotiation_possible_or_not_before_main_market; at = at + 1;
  wire[at] = equities_batch_data_message_record.end_keyword; at = at + 1;
  skip
}

/* Equities Batch Data Message off the wire, 649 bytes from where the cursor stands */
inline decode_equities_batch_data_message(equities_batch_data_message_record) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.message_sequence_number[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.total_number_of_instruments_of_the_contract[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.business_date[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.isin_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 9 -> equities_batch_data_message_record.abbreviated_issue_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> equities_batch_data_message_record.abbreviated_issue_name[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> equities_batch_data_message_record.abbreviated_issue_name_in_en[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.group_number[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.market_operation_product_id[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.security_group_id[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.unit_trading = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.rights_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.par_value_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.an_issue_of_which_base_price_is_settled_with_a_todays_single_price = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.reevaluation_reason_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.base_price_change = wire[at]; at = at + 1;
  equities_batch_data_message_record.random_end_trigger_code = wire[at]; at = at + 1;
  equities_batch_data_message_record.market_alert = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.market_alert_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.korea_corporate_governance_stock_price_index_kogi = wire[at]; at = at + 1;
  equities_batch_data_message_record.issue_for_administration = wire[at]; at = at + 1;
  equities_batch_data_message_record.unfaithful_disclosure = wire[at]; at = at + 1;
  equities_batch_data_message_record.back_door_listing = wire[at]; at = at + 1;
  equities_batch_data_message_record.trading_halt = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 10 -> equities_batch_data_message_record.industry_id[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.small_medium_sized_business = wire[at]; at = at + 1;
  equities_batch_data_message_record.section_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_record.investment_institution_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.base_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_krx = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.yesterdays_closing_price_krx[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.yesterdays_accumulated_trading_amount[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> equities_batch_data_message_record.yesterdays_accumulated_trading_value[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.upper_limit_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.lower_limit_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.substitute_price_of_securities[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.par_value[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.issuing_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.listing_date[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.number_of_listed_shares[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.liquidation_trade = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.the_establishment_date[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.maturity_date[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.exercising_period[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.expiration_date_for_right[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> equities_batch_data_message_record.exercise_price_of_elw_or_bw[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> equities_batch_data_message_record.capital[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.credit_order_possibility = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.limit_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.market_price_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.conditioned_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.best_favorable_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.first_best_order_permission_type[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.mid_price_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.stop_limit_price_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.capital_increase_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.other_stock_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_record.national_stock = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.appraised_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.lowest_order_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.highest_order_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.unit_of_volume_in_main_board[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.lot_size_after_hours_trading[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.rei_ts_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.target_stock_isin_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.currency_iso_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.country_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.market_making_possibility = wire[at]; at = at + 1;
  equities_batch_data_message_record.closing_price_trading_possibility_in_the_after_hours = wire[at]; at = at + 1;
  equities_batch_data_message_record.closing_price_trading_in_the_pre_opening_market = wire[at]; at = at + 1;
  equities_batch_data_message_record.block_trading_in_the_pre_opening_market = wire[at]; at = at + 1;
  equities_batch_data_message_record.basket_trading_in_the_pre_opening_market = wire[at]; at = at + 1;
  equities_batch_data_message_record.announcement_of_estimated_trading_price = wire[at]; at = at + 1;
  equities_batch_data_message_record.short_selling = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> equities_batch_data_message_record.etf_tracking_difference[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.regs = wire[at]; at = at + 1;
  equities_batch_data_message_record.spac = wire[at]; at = at + 1;
  equities_batch_data_message_record.tax_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> equities_batch_data_message_record.appraisal_ratio_of_substitute_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.investment_caution_issue = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.delisting_date[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.short_term_overheat_issue_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_record.etf_replication_methods_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.expiration_date[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.distribution_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.calculation_of_redemption_price_start_date[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.calculation_of_redemption_price_end_date[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.etp_product_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.index_calculation_institution_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_market_classification_id[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.index_sequence_number[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.tracking_index_leverage_inverse_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.reference_index_leverage_inverse_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_asset_classification_id_1[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_asset_classification_id_2[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.ipo_underwriter_member_number[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.lp_order = wire[at]; at = at + 1;
  equities_batch_data_message_record.low_liquidity = wire[at]; at = at + 1;
  equities_batch_data_message_record.abnormal_rise = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 23 -> equities_batch_data_message_record.upper_limit_quantity[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.investment_precaution_issue = wire[at]; at = at + 1;
  equities_batch_data_message_record.preferred_stocks_with_lesser_shares = wire[at]; at = at + 1;
  equities_batch_data_message_record.spac_merger = wire[at]; at = at + 1;
  equities_batch_data_message_record.segment_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_record.after_market_possibility = wire[at]; at = at + 1;
  equities_batch_data_message_record.choice_on_competitive_trading = wire[at]; at = at + 1;
  equities_batch_data_message_record.limit_on_competitive_trading_volume = wire[at]; at = at + 1;
  equities_batch_data_message_record.occurrence_of_reasons_prohibiting_competitive_trading = wire[at]; at = at + 1;
  equities_batch_data_message_record.approval_on_competitive_trading = wire[at]; at = at + 1;
  equities_batch_data_message_record.approval_on_negotiation_trading = wire[at]; at = at + 1;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_nxt = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> equities_batch_data_message_record.yesterdays_closing_price_nxt[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.competition_board_trade_permission_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.negotiation_possible_or_not_before_main_market = wire[at]; at = at + 1;
  equities_batch_data_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Equities Batch Data Message is what was written, byte for byte */
inline equal_equities_batch_data_message(equities_batch_data_message_read, equities_batch_data_message_written) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.message_sequence_number[equities_batch_data_message_at] == equities_batch_data_message_written.message_sequence_number[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> assert(equities_batch_data_message_read.total_number_of_instruments_of_the_contract[equities_batch_data_message_at] == equities_batch_data_message_written.total_number_of_instruments_of_the_contract[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.business_date[equities_batch_data_message_at] == equities_batch_data_message_written.business_date[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> assert(equities_batch_data_message_read.isin_code[equities_batch_data_message_at] == equities_batch_data_message_written.isin_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> assert(equities_batch_data_message_read.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at] == equities_batch_data_message_written.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 9 -> assert(equities_batch_data_message_read.abbreviated_issue_code[equities_batch_data_message_at] == equities_batch_data_message_written.abbreviated_issue_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> assert(equities_batch_data_message_read.abbreviated_issue_name[equities_batch_data_message_at] == equities_batch_data_message_written.abbreviated_issue_name[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> assert(equities_batch_data_message_read.abbreviated_issue_name_in_en[equities_batch_data_message_at] == equities_batch_data_message_written.abbreviated_issue_name_in_en[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.group_number[equities_batch_data_message_at] == equities_batch_data_message_written.group_number[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> assert(equities_batch_data_message_read.market_operation_product_id[equities_batch_data_message_at] == equities_batch_data_message_written.market_operation_product_id[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.security_group_id[equities_batch_data_message_at] == equities_batch_data_message_written.security_group_id[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.unit_trading == equities_batch_data_message_written.unit_trading);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.rights_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.rights_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.par_value_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.par_value_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.an_issue_of_which_base_price_is_settled_with_a_todays_single_price == equities_batch_data_message_written.an_issue_of_which_base_price_is_settled_with_a_todays_single_price);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.reevaluation_reason_code[equities_batch_data_message_at] == equities_batch_data_message_written.reevaluation_reason_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.base_price_change == equities_batch_data_message_written.base_price_change);
  assert(equities_batch_data_message_read.random_end_trigger_code == equities_batch_data_message_written.random_end_trigger_code);
  assert(equities_batch_data_message_read.market_alert == equities_batch_data_message_written.market_alert);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.market_alert_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.market_alert_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.korea_corporate_governance_stock_price_index_kogi == equities_batch_data_message_written.korea_corporate_governance_stock_price_index_kogi);
  assert(equities_batch_data_message_read.issue_for_administration == equities_batch_data_message_written.issue_for_administration);
  assert(equities_batch_data_message_read.unfaithful_disclosure == equities_batch_data_message_written.unfaithful_disclosure);
  assert(equities_batch_data_message_read.back_door_listing == equities_batch_data_message_written.back_door_listing);
  assert(equities_batch_data_message_read.trading_halt == equities_batch_data_message_written.trading_halt);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 10 -> assert(equities_batch_data_message_read.industry_id[equities_batch_data_message_at] == equities_batch_data_message_written.industry_id[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.small_medium_sized_business == equities_batch_data_message_written.small_medium_sized_business);
  assert(equities_batch_data_message_read.section_type_code == equities_batch_data_message_written.section_type_code);
  assert(equities_batch_data_message_read.investment_institution_type_code == equities_batch_data_message_written.investment_institution_type_code);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.base_price[equities_batch_data_message_at] == equities_batch_data_message_written.base_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.yesterdays_closing_price_type_code_krx == equities_batch_data_message_written.yesterdays_closing_price_type_code_krx);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.yesterdays_closing_price_krx[equities_batch_data_message_at] == equities_batch_data_message_written.yesterdays_closing_price_krx[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> assert(equities_batch_data_message_read.yesterdays_accumulated_trading_amount[equities_batch_data_message_at] == equities_batch_data_message_written.yesterdays_accumulated_trading_amount[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> assert(equities_batch_data_message_read.yesterdays_accumulated_trading_value[equities_batch_data_message_at] == equities_batch_data_message_written.yesterdays_accumulated_trading_value[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.upper_limit_price[equities_batch_data_message_at] == equities_batch_data_message_written.upper_limit_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.lower_limit_price[equities_batch_data_message_at] == equities_batch_data_message_written.lower_limit_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.substitute_price_of_securities[equities_batch_data_message_at] == equities_batch_data_message_written.substitute_price_of_securities[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.par_value[equities_batch_data_message_at] == equities_batch_data_message_written.par_value[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.issuing_price[equities_batch_data_message_at] == equities_batch_data_message_written.issuing_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.listing_date[equities_batch_data_message_at] == equities_batch_data_message_written.listing_date[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> assert(equities_batch_data_message_read.number_of_listed_shares[equities_batch_data_message_at] == equities_batch_data_message_written.number_of_listed_shares[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.liquidation_trade == equities_batch_data_message_written.liquidation_trade);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.the_establishment_date[equities_batch_data_message_at] == equities_batch_data_message_written.the_establishment_date[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.maturity_date[equities_batch_data_message_at] == equities_batch_data_message_written.maturity_date[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.exercising_period[equities_batch_data_message_at] == equities_batch_data_message_written.exercising_period[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.expiration_date_for_right[equities_batch_data_message_at] == equities_batch_data_message_written.expiration_date_for_right[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> assert(equities_batch_data_message_read.exercise_price_of_elw_or_bw[equities_batch_data_message_at] == equities_batch_data_message_written.exercise_price_of_elw_or_bw[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 22 -> assert(equities_batch_data_message_read.capital[equities_batch_data_message_at] == equities_batch_data_message_written.capital[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.credit_order_possibility == equities_batch_data_message_written.credit_order_possibility);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.limit_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.limit_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.market_price_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.market_price_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.conditioned_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.conditioned_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.best_favorable_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.best_favorable_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.first_best_order_permission_type[equities_batch_data_message_at] == equities_batch_data_message_written.first_best_order_permission_type[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.mid_price_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.mid_price_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.stop_limit_price_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.stop_limit_price_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.capital_increase_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.capital_increase_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.other_stock_type_code == equities_batch_data_message_written.other_stock_type_code);
  assert(equities_batch_data_message_read.national_stock == equities_batch_data_message_written.national_stock);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.appraised_price[equities_batch_data_message_at] == equities_batch_data_message_written.appraised_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.lowest_order_price[equities_batch_data_message_at] == equities_batch_data_message_written.lowest_order_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.highest_order_price[equities_batch_data_message_at] == equities_batch_data_message_written.highest_order_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.unit_of_volume_in_main_board[equities_batch_data_message_at] == equities_batch_data_message_written.unit_of_volume_in_main_board[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.lot_size_after_hours_trading[equities_batch_data_message_at] == equities_batch_data_message_written.lot_size_after_hours_trading[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.rei_ts_type_code == equities_batch_data_message_written.rei_ts_type_code);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> assert(equities_batch_data_message_read.target_stock_isin_code[equities_batch_data_message_at] == equities_batch_data_message_written.target_stock_isin_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> assert(equities_batch_data_message_read.currency_iso_code[equities_batch_data_message_at] == equities_batch_data_message_written.currency_iso_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> assert(equities_batch_data_message_read.country_code[equities_batch_data_message_at] == equities_batch_data_message_written.country_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.market_making_possibility == equities_batch_data_message_written.market_making_possibility);
  assert(equities_batch_data_message_read.closing_price_trading_possibility_in_the_after_hours == equities_batch_data_message_written.closing_price_trading_possibility_in_the_after_hours);
  assert(equities_batch_data_message_read.closing_price_trading_in_the_pre_opening_market == equities_batch_data_message_written.closing_price_trading_in_the_pre_opening_market);
  assert(equities_batch_data_message_read.block_trading_in_the_pre_opening_market == equities_batch_data_message_written.block_trading_in_the_pre_opening_market);
  assert(equities_batch_data_message_read.basket_trading_in_the_pre_opening_market == equities_batch_data_message_written.basket_trading_in_the_pre_opening_market);
  assert(equities_batch_data_message_read.announcement_of_estimated_trading_price == equities_batch_data_message_written.announcement_of_estimated_trading_price);
  assert(equities_batch_data_message_read.short_selling == equities_batch_data_message_written.short_selling);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> assert(equities_batch_data_message_read.etf_tracking_difference[equities_batch_data_message_at] == equities_batch_data_message_written.etf_tracking_difference[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.regs == equities_batch_data_message_written.regs);
  assert(equities_batch_data_message_read.spac == equities_batch_data_message_written.spac);
  assert(equities_batch_data_message_read.tax_type_code == equities_batch_data_message_written.tax_type_code);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 13 -> assert(equities_batch_data_message_read.appraisal_ratio_of_substitute_price[equities_batch_data_message_at] == equities_batch_data_message_written.appraisal_ratio_of_substitute_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.investment_caution_issue == equities_batch_data_message_written.investment_caution_issue);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.delisting_date[equities_batch_data_message_at] == equities_batch_data_message_written.delisting_date[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.short_term_overheat_issue_type_code == equities_batch_data_message_written.short_term_overheat_issue_type_code);
  assert(equities_batch_data_message_read.etf_replication_methods_type_code == equities_batch_data_message_written.etf_replication_methods_type_code);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.expiration_date[equities_batch_data_message_at] == equities_batch_data_message_written.expiration_date[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.distribution_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.distribution_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.calculation_of_redemption_price_start_date[equities_batch_data_message_at] == equities_batch_data_message_written.calculation_of_redemption_price_start_date[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.calculation_of_redemption_price_end_date[equities_batch_data_message_at] == equities_batch_data_message_written.calculation_of_redemption_price_end_date[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.etp_product_type_code == equities_batch_data_message_written.etp_product_type_code);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.index_calculation_institution_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.index_calculation_institution_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> assert(equities_batch_data_message_read.index_market_classification_id[equities_batch_data_message_at] == equities_batch_data_message_written.index_market_classification_id[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> assert(equities_batch_data_message_read.index_sequence_number[equities_batch_data_message_at] == equities_batch_data_message_written.index_sequence_number[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.tracking_index_leverage_inverse_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.tracking_index_leverage_inverse_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> assert(equities_batch_data_message_read.reference_index_leverage_inverse_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.reference_index_leverage_inverse_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> assert(equities_batch_data_message_read.index_asset_classification_id_1[equities_batch_data_message_at] == equities_batch_data_message_written.index_asset_classification_id_1[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> assert(equities_batch_data_message_read.index_asset_classification_id_2[equities_batch_data_message_at] == equities_batch_data_message_written.index_asset_classification_id_2[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.ipo_underwriter_member_number[equities_batch_data_message_at] == equities_batch_data_message_written.ipo_underwriter_member_number[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.lp_order == equities_batch_data_message_written.lp_order);
  assert(equities_batch_data_message_read.low_liquidity == equities_batch_data_message_written.low_liquidity);
  assert(equities_batch_data_message_read.abnormal_rise == equities_batch_data_message_written.abnormal_rise);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 23 -> assert(equities_batch_data_message_read.upper_limit_quantity[equities_batch_data_message_at] == equities_batch_data_message_written.upper_limit_quantity[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.investment_precaution_issue == equities_batch_data_message_written.investment_precaution_issue);
  assert(equities_batch_data_message_read.preferred_stocks_with_lesser_shares == equities_batch_data_message_written.preferred_stocks_with_lesser_shares);
  assert(equities_batch_data_message_read.spac_merger == equities_batch_data_message_written.spac_merger);
  assert(equities_batch_data_message_read.segment_type_code == equities_batch_data_message_written.segment_type_code);
  assert(equities_batch_data_message_read.after_market_possibility == equities_batch_data_message_written.after_market_possibility);
  assert(equities_batch_data_message_read.choice_on_competitive_trading == equities_batch_data_message_written.choice_on_competitive_trading);
  assert(equities_batch_data_message_read.limit_on_competitive_trading_volume == equities_batch_data_message_written.limit_on_competitive_trading_volume);
  assert(equities_batch_data_message_read.occurrence_of_reasons_prohibiting_competitive_trading == equities_batch_data_message_written.occurrence_of_reasons_prohibiting_competitive_trading);
  assert(equities_batch_data_message_read.approval_on_competitive_trading == equities_batch_data_message_written.approval_on_competitive_trading);
  assert(equities_batch_data_message_read.approval_on_negotiation_trading == equities_batch_data_message_written.approval_on_negotiation_trading);
  assert(equities_batch_data_message_read.yesterdays_closing_price_type_code_nxt == equities_batch_data_message_written.yesterdays_closing_price_type_code_nxt);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 11 -> assert(equities_batch_data_message_read.yesterdays_closing_price_nxt[equities_batch_data_message_at] == equities_batch_data_message_written.yesterdays_closing_price_nxt[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> assert(equities_batch_data_message_read.competition_board_trade_permission_code[equities_batch_data_message_at] == equities_batch_data_message_written.competition_board_trade_permission_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.negotiation_possible_or_not_before_main_market == equities_batch_data_message_written.negotiation_possible_or_not_before_main_market);
  assert(equities_batch_data_message_read.end_keyword == equities_batch_data_message_written.end_keyword);
  skip
}

/* ---- Member Information Message: 202 bytes ----------------------------------- */

/* Details. */
typedef MemberInformationMessage {
  byte message_sequence_number[8];
  byte business_date[8];
  byte market_participant_number[5];
  byte name_of_a_market_participant_in_kr[80];
  byte name_of_a_market_participant_in_en[80];
  byte an_abbreviated_name_of_a_market_participant_in_kr[20];
  byte end_keyword
};

int member_information_message_at;

/* every byte of Member Information Message set to one value */
inline fill_member_information_message(member_information_message_record, member_information_message_value) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> member_information_message_record.message_sequence_number[member_information_message_at] = member_information_message_value; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> member_information_message_record.business_date[member_information_message_at] = member_information_message_value; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 5 -> member_information_message_record.market_participant_number[member_information_message_at] = member_information_message_value; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> member_information_message_record.name_of_a_market_participant_in_kr[member_information_message_at] = member_information_message_value; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> member_information_message_record.name_of_a_market_participant_in_en[member_information_message_at] = member_information_message_value; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 20 -> member_information_message_record.an_abbreviated_name_of_a_market_participant_in_kr[member_information_message_at] = member_information_message_value; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_record.end_keyword = member_information_message_value;
  skip
}

/* each byte of Member Information Message set to where it lies, so a field read out of place says so */
inline ramp_member_information_message(member_information_message_record, member_information_message_base) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> member_information_message_record.message_sequence_number[member_information_message_at] = (member_information_message_base + 0 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> member_information_message_record.business_date[member_information_message_at] = (member_information_message_base + 8 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 5 -> member_information_message_record.market_participant_number[member_information_message_at] = (member_information_message_base + 16 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> member_information_message_record.name_of_a_market_participant_in_kr[member_information_message_at] = (member_information_message_base + 21 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> member_information_message_record.name_of_a_market_participant_in_en[member_information_message_at] = (member_information_message_base + 101 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 20 -> member_information_message_record.an_abbreviated_name_of_a_market_participant_in_kr[member_information_message_at] = (member_information_message_base + 181 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_record.end_keyword = (member_information_message_base + 201 + 1) % 256;
  skip
}

/* Member Information Message to the wire, 202 bytes from where the cursor stands */
inline encode_member_information_message(member_information_message_record) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> wire[at] = member_information_message_record.message_sequence_number[member_information_message_at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> wire[at] = member_information_message_record.business_date[member_information_message_at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 5 -> wire[at] = member_information_message_record.market_participant_number[member_information_message_at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> wire[at] = member_information_message_record.name_of_a_market_participant_in_kr[member_information_message_at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> wire[at] = member_information_message_record.name_of_a_market_participant_in_en[member_information_message_at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 20 -> wire[at] = member_information_message_record.an_abbreviated_name_of_a_market_participant_in_kr[member_information_message_at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  wire[at] = member_information_message_record.end_keyword; at = at + 1;
  skip
}

/* Member Information Message off the wire, 202 bytes from where the cursor stands */
inline decode_member_information_message(member_information_message_record) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> member_information_message_record.message_sequence_number[member_information_message_at] = wire[at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> member_information_message_record.business_date[member_information_message_at] = wire[at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 5 -> member_information_message_record.market_participant_number[member_information_message_at] = wire[at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> member_information_message_record.name_of_a_market_participant_in_kr[member_information_message_at] = wire[at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> member_information_message_record.name_of_a_market_participant_in_en[member_information_message_at] = wire[at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 20 -> member_information_message_record.an_abbreviated_name_of_a_market_participant_in_kr[member_information_message_at] = wire[at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Member Information Message is what was written, byte for byte */
inline equal_member_information_message(member_information_message_read, member_information_message_written) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> assert(member_information_message_read.message_sequence_number[member_information_message_at] == member_information_message_written.message_sequence_number[member_information_message_at]); member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> assert(member_information_message_read.business_date[member_information_message_at] == member_information_message_written.business_date[member_information_message_at]); member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 5 -> assert(member_information_message_read.market_participant_number[member_information_message_at] == member_information_message_written.market_participant_number[member_information_message_at]); member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> assert(member_information_message_read.name_of_a_market_participant_in_kr[member_information_message_at] == member_information_message_written.name_of_a_market_participant_in_kr[member_information_message_at]); member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> assert(member_information_message_read.name_of_a_market_participant_in_en[member_information_message_at] == member_information_message_written.name_of_a_market_participant_in_en[member_information_message_at]); member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 20 -> assert(member_information_message_read.an_abbreviated_name_of_a_market_participant_in_kr[member_information_message_at] == member_information_message_written.an_abbreviated_name_of_a_market_participant_in_kr[member_information_message_at]); member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  assert(member_information_message_read.end_keyword == member_information_message_written.end_keyword);
  skip
}

/* ---- Issue Event Message: 43 bytes ------------------------------------------- */

/* Details. */
typedef IssueEventMessage {
  byte message_sequence_number[8];
  byte isin_code[12];
  byte event_type_code[2];
  byte event_reason_code[4];
  byte event_start_date[8];
  byte event_end_date[8];
  byte end_keyword
};

int issue_event_message_at;

/* every byte of Issue Event Message set to one value */
inline fill_issue_event_message(issue_event_message_record, issue_event_message_value) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.message_sequence_number[issue_event_message_at] = issue_event_message_value; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 12 -> issue_event_message_record.isin_code[issue_event_message_at] = issue_event_message_value; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 2 -> issue_event_message_record.event_type_code[issue_event_message_at] = issue_event_message_value; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.event_reason_code[issue_event_message_at] = issue_event_message_value; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.event_start_date[issue_event_message_at] = issue_event_message_value; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.event_end_date[issue_event_message_at] = issue_event_message_value; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_record.end_keyword = issue_event_message_value;
  skip
}

/* each byte of Issue Event Message set to where it lies, so a field read out of place says so */
inline ramp_issue_event_message(issue_event_message_record, issue_event_message_base) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.message_sequence_number[issue_event_message_at] = (issue_event_message_base + 0 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 12 -> issue_event_message_record.isin_code[issue_event_message_at] = (issue_event_message_base + 8 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 2 -> issue_event_message_record.event_type_code[issue_event_message_at] = (issue_event_message_base + 20 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.event_reason_code[issue_event_message_at] = (issue_event_message_base + 22 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.event_start_date[issue_event_message_at] = (issue_event_message_base + 26 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.event_end_date[issue_event_message_at] = (issue_event_message_base + 34 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_record.end_keyword = (issue_event_message_base + 42 + 1) % 256;
  skip
}

/* Issue Event Message to the wire, 43 bytes from where the cursor stands */
inline encode_issue_event_message(issue_event_message_record) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> wire[at] = issue_event_message_record.message_sequence_number[issue_event_message_at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 12 -> wire[at] = issue_event_message_record.isin_code[issue_event_message_at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 2 -> wire[at] = issue_event_message_record.event_type_code[issue_event_message_at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> wire[at] = issue_event_message_record.event_reason_code[issue_event_message_at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> wire[at] = issue_event_message_record.event_start_date[issue_event_message_at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> wire[at] = issue_event_message_record.event_end_date[issue_event_message_at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_event_message_record.end_keyword; at = at + 1;
  skip
}

/* Issue Event Message off the wire, 43 bytes from where the cursor stands */
inline decode_issue_event_message(issue_event_message_record) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.message_sequence_number[issue_event_message_at] = wire[at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 12 -> issue_event_message_record.isin_code[issue_event_message_at] = wire[at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 2 -> issue_event_message_record.event_type_code[issue_event_message_at] = wire[at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.event_reason_code[issue_event_message_at] = wire[at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.event_start_date[issue_event_message_at] = wire[at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.event_end_date[issue_event_message_at] = wire[at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Issue Event Message is what was written, byte for byte */
inline equal_issue_event_message(issue_event_message_read, issue_event_message_written) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> assert(issue_event_message_read.message_sequence_number[issue_event_message_at] == issue_event_message_written.message_sequence_number[issue_event_message_at]); issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 12 -> assert(issue_event_message_read.isin_code[issue_event_message_at] == issue_event_message_written.isin_code[issue_event_message_at]); issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 2 -> assert(issue_event_message_read.event_type_code[issue_event_message_at] == issue_event_message_written.event_type_code[issue_event_message_at]); issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> assert(issue_event_message_read.event_reason_code[issue_event_message_at] == issue_event_message_written.event_reason_code[issue_event_message_at]); issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> assert(issue_event_message_read.event_start_date[issue_event_message_at] == issue_event_message_written.event_start_date[issue_event_message_at]); issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> assert(issue_event_message_read.event_end_date[issue_event_message_at] == issue_event_message_written.event_end_date[issue_event_message_at]); issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  assert(issue_event_message_read.end_keyword == issue_event_message_written.end_keyword);
  skip
}

/* ---- Block Basket Trade Data Message: 55 bytes ------------------------------- */

/* Block/Basket Trade Data in NXT. */
typedef BlockBasketTradeDataMessage {
  byte board_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[22];
  byte end_keyword
};

int block_basket_trade_data_message_at;

/* every byte of Block Basket Trade Data Message set to one value */
inline fill_block_basket_trade_data_message(block_basket_trade_data_message_record, block_basket_trade_data_message_value) {
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 2 -> block_basket_trade_data_message_record.board_id[block_basket_trade_data_message_at] = block_basket_trade_data_message_value; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> block_basket_trade_data_message_record.isin_code[block_basket_trade_data_message_at] = block_basket_trade_data_message_value; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 6 -> block_basket_trade_data_message_record.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at] = block_basket_trade_data_message_value; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> block_basket_trade_data_message_record.accumulated_trading_volume[block_basket_trade_data_message_at] = block_basket_trade_data_message_value; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 22 -> block_basket_trade_data_message_record.accumulated_trading_value[block_basket_trade_data_message_at] = block_basket_trade_data_message_value; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_record.end_keyword = block_basket_trade_data_message_value;
  skip
}

/* each byte of Block Basket Trade Data Message set to where it lies, so a field read out of place says so */
inline ramp_block_basket_trade_data_message(block_basket_trade_data_message_record, block_basket_trade_data_message_base) {
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 2 -> block_basket_trade_data_message_record.board_id[block_basket_trade_data_message_at] = (block_basket_trade_data_message_base + 0 + block_basket_trade_data_message_at + 1) % 256; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> block_basket_trade_data_message_record.isin_code[block_basket_trade_data_message_at] = (block_basket_trade_data_message_base + 2 + block_basket_trade_data_message_at + 1) % 256; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 6 -> block_basket_trade_data_message_record.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at] = (block_basket_trade_data_message_base + 14 + block_basket_trade_data_message_at + 1) % 256; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> block_basket_trade_data_message_record.accumulated_trading_volume[block_basket_trade_data_message_at] = (block_basket_trade_data_message_base + 20 + block_basket_trade_data_message_at + 1) % 256; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 22 -> block_basket_trade_data_message_record.accumulated_trading_value[block_basket_trade_data_message_at] = (block_basket_trade_data_message_base + 32 + block_basket_trade_data_message_at + 1) % 256; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_record.end_keyword = (block_basket_trade_data_message_base + 54 + 1) % 256;
  skip
}

/* Block Basket Trade Data Message to the wire, 55 bytes from where the cursor stands */
inline encode_block_basket_trade_data_message(block_basket_trade_data_message_record) {
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 2 -> wire[at] = block_basket_trade_data_message_record.board_id[block_basket_trade_data_message_at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> wire[at] = block_basket_trade_data_message_record.isin_code[block_basket_trade_data_message_at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 6 -> wire[at] = block_basket_trade_data_message_record.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> wire[at] = block_basket_trade_data_message_record.accumulated_trading_volume[block_basket_trade_data_message_at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 22 -> wire[at] = block_basket_trade_data_message_record.accumulated_trading_value[block_basket_trade_data_message_at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  wire[at] = block_basket_trade_data_message_record.end_keyword; at = at + 1;
  skip
}

/* Block Basket Trade Data Message off the wire, 55 bytes from where the cursor stands */
inline decode_block_basket_trade_data_message(block_basket_trade_data_message_record) {
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 2 -> block_basket_trade_data_message_record.board_id[block_basket_trade_data_message_at] = wire[at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> block_basket_trade_data_message_record.isin_code[block_basket_trade_data_message_at] = wire[at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 6 -> block_basket_trade_data_message_record.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at] = wire[at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> block_basket_trade_data_message_record.accumulated_trading_volume[block_basket_trade_data_message_at] = wire[at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 22 -> block_basket_trade_data_message_record.accumulated_trading_value[block_basket_trade_data_message_at] = wire[at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Block Basket Trade Data Message is what was written, byte for byte */
inline equal_block_basket_trade_data_message(block_basket_trade_data_message_read, block_basket_trade_data_message_written) {
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 2 -> assert(block_basket_trade_data_message_read.board_id[block_basket_trade_data_message_at] == block_basket_trade_data_message_written.board_id[block_basket_trade_data_message_at]); block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> assert(block_basket_trade_data_message_read.isin_code[block_basket_trade_data_message_at] == block_basket_trade_data_message_written.isin_code[block_basket_trade_data_message_at]); block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 6 -> assert(block_basket_trade_data_message_read.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at] == block_basket_trade_data_message_written.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at]); block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 12 -> assert(block_basket_trade_data_message_read.accumulated_trading_volume[block_basket_trade_data_message_at] == block_basket_trade_data_message_written.accumulated_trading_volume[block_basket_trade_data_message_at]); block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 22 -> assert(block_basket_trade_data_message_read.accumulated_trading_value[block_basket_trade_data_message_at] == block_basket_trade_data_message_written.accumulated_trading_value[block_basket_trade_data_message_at]); block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  assert(block_basket_trade_data_message_read.end_keyword == block_basket_trade_data_message_written.end_keyword);
  skip
}

/* ---- Investor Activities Per An Issue Eod Message: 91 bytes ------------------ */

/* Investor Activities per an issue_EOD. */
typedef InvestorActivitiesPerAnIssueEodMessage {
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[6];
  byte investor_code[4];
  byte accumulated_ask_trading_volume[12];
  byte accumulated_ask_trading_value[22];
  byte accumulated_bid_trading_volume[12];
  byte accumulated_bid_trading_value[22];
  byte end_keyword
};

int investor_activities_per_an_issue_eod_message_at;

/* every byte of Investor Activities Per An Issue Eod Message set to one value */
inline fill_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_record, investor_activities_per_an_issue_eod_message_value) {
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.isin_code[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 6 -> investor_activities_per_an_issue_eod_message_record.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.investor_code[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_record.end_keyword = investor_activities_per_an_issue_eod_message_value;
  skip
}

/* each byte of Investor Activities Per An Issue Eod Message set to where it lies, so a field read out of place says so */
inline ramp_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_record, investor_activities_per_an_issue_eod_message_base) {
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.isin_code[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 0 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 6 -> investor_activities_per_an_issue_eod_message_record.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 12 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.investor_code[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 18 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 22 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 34 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 56 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 68 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_record.end_keyword = (investor_activities_per_an_issue_eod_message_base + 90 + 1) % 256;
  skip
}

/* Investor Activities Per An Issue Eod Message to the wire, 91 bytes from where the cursor stands */
inline encode_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_record) {
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> wire[at] = investor_activities_per_an_issue_eod_message_record.isin_code[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 6 -> wire[at] = investor_activities_per_an_issue_eod_message_record.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> wire[at] = investor_activities_per_an_issue_eod_message_record.investor_code[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> wire[at] = investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> wire[at] = investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> wire[at] = investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> wire[at] = investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  wire[at] = investor_activities_per_an_issue_eod_message_record.end_keyword; at = at + 1;
  skip
}

/* Investor Activities Per An Issue Eod Message off the wire, 91 bytes from where the cursor stands */
inline decode_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_record) {
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.isin_code[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 6 -> investor_activities_per_an_issue_eod_message_record.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.investor_code[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Investor Activities Per An Issue Eod Message is what was written, byte for byte */
inline equal_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_read, investor_activities_per_an_issue_eod_message_written) {
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> assert(investor_activities_per_an_issue_eod_message_read.isin_code[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.isin_code[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 6 -> assert(investor_activities_per_an_issue_eod_message_read.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> assert(investor_activities_per_an_issue_eod_message_read.investor_code[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.investor_code[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> assert(investor_activities_per_an_issue_eod_message_read.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> assert(investor_activities_per_an_issue_eod_message_read.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> assert(investor_activities_per_an_issue_eod_message_read.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 22 -> assert(investor_activities_per_an_issue_eod_message_read.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  assert(investor_activities_per_an_issue_eod_message_read.end_keyword == investor_activities_per_an_issue_eod_message_written.end_keyword);
  skip
}

/* ---- Short Selling Message: 115 bytes ---------------------------------------- */

/* Short Selling. */
typedef ShortSellingMessage {
  byte isin_code[12];
  byte covered_short_selling_trading_volume[12];
  byte covered_short_selling_trading_value[22];
  byte uptick_rule_applied_covered_short_selling_trading_volume[12];
  byte uptick_rule_applied_covered_short_selling_trading_value[22];
  byte uptick_rule_unapplied_covered_short_selling_trading_volume[12];
  byte uptick_rule_unapplied_covered_short_selling_trading_value[22];
  byte end_keyword
};

int short_selling_message_at;

/* every byte of Short Selling Message set to one value */
inline fill_short_selling_message(short_selling_message_record, short_selling_message_value) {
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.isin_code[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.covered_short_selling_trading_volume[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> short_selling_message_record.covered_short_selling_trading_value[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_record.end_keyword = short_selling_message_value;
  skip
}

/* each byte of Short Selling Message set to where it lies, so a field read out of place says so */
inline ramp_short_selling_message(short_selling_message_record, short_selling_message_base) {
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.isin_code[short_selling_message_at] = (short_selling_message_base + 0 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.covered_short_selling_trading_volume[short_selling_message_at] = (short_selling_message_base + 12 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> short_selling_message_record.covered_short_selling_trading_value[short_selling_message_at] = (short_selling_message_base + 24 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at] = (short_selling_message_base + 46 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at] = (short_selling_message_base + 58 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at] = (short_selling_message_base + 80 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at] = (short_selling_message_base + 92 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_record.end_keyword = (short_selling_message_base + 114 + 1) % 256;
  skip
}

/* Short Selling Message to the wire, 115 bytes from where the cursor stands */
inline encode_short_selling_message(short_selling_message_record) {
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> wire[at] = short_selling_message_record.isin_code[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> wire[at] = short_selling_message_record.covered_short_selling_trading_volume[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> wire[at] = short_selling_message_record.covered_short_selling_trading_value[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> wire[at] = short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> wire[at] = short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> wire[at] = short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> wire[at] = short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  wire[at] = short_selling_message_record.end_keyword; at = at + 1;
  skip
}

/* Short Selling Message off the wire, 115 bytes from where the cursor stands */
inline decode_short_selling_message(short_selling_message_record) {
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.isin_code[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.covered_short_selling_trading_volume[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> short_selling_message_record.covered_short_selling_trading_value[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Short Selling Message is what was written, byte for byte */
inline equal_short_selling_message(short_selling_message_read, short_selling_message_written) {
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> assert(short_selling_message_read.isin_code[short_selling_message_at] == short_selling_message_written.isin_code[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> assert(short_selling_message_read.covered_short_selling_trading_volume[short_selling_message_at] == short_selling_message_written.covered_short_selling_trading_volume[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> assert(short_selling_message_read.covered_short_selling_trading_value[short_selling_message_at] == short_selling_message_written.covered_short_selling_trading_value[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> assert(short_selling_message_read.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at] == short_selling_message_written.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> assert(short_selling_message_read.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at] == short_selling_message_written.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> assert(short_selling_message_read.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at] == short_selling_message_written.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 22 -> assert(short_selling_message_read.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at] == short_selling_message_written.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  assert(short_selling_message_read.end_keyword == short_selling_message_written.end_keyword);
  skip
}

/* ---- Brokers Acitity Information Message: 86 bytes --------------------------- */

/* Information on Brokers Activity in NXT market. */
typedef BrokersAcitityInformationMessage {
  byte isin_code[12];
  byte member_number[5];
  byte accumulated_ask_trading_volume[12];
  byte accumulated_ask_trading_value[22];
  byte accumulated_bid_trading_volume[12];
  byte accumulated_bid_trading_value[22];
  byte end_keyword
};

int brokers_acitity_information_message_at;

/* every byte of Brokers Acitity Information Message set to one value */
inline fill_brokers_acitity_information_message(brokers_acitity_information_message_record, brokers_acitity_information_message_value) {
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> brokers_acitity_information_message_record.isin_code[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 5 -> brokers_acitity_information_message_record.member_number[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> brokers_acitity_information_message_record.accumulated_ask_trading_volume[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> brokers_acitity_information_message_record.accumulated_ask_trading_value[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> brokers_acitity_information_message_record.accumulated_bid_trading_volume[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> brokers_acitity_information_message_record.accumulated_bid_trading_value[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_record.end_keyword = brokers_acitity_information_message_value;
  skip
}

/* each byte of Brokers Acitity Information Message set to where it lies, so a field read out of place says so */
inline ramp_brokers_acitity_information_message(brokers_acitity_information_message_record, brokers_acitity_information_message_base) {
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> brokers_acitity_information_message_record.isin_code[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 0 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 5 -> brokers_acitity_information_message_record.member_number[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 12 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> brokers_acitity_information_message_record.accumulated_ask_trading_volume[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 17 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> brokers_acitity_information_message_record.accumulated_ask_trading_value[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 29 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> brokers_acitity_information_message_record.accumulated_bid_trading_volume[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 51 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> brokers_acitity_information_message_record.accumulated_bid_trading_value[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 63 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_record.end_keyword = (brokers_acitity_information_message_base + 85 + 1) % 256;
  skip
}

/* Brokers Acitity Information Message to the wire, 86 bytes from where the cursor stands */
inline encode_brokers_acitity_information_message(brokers_acitity_information_message_record) {
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> wire[at] = brokers_acitity_information_message_record.isin_code[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 5 -> wire[at] = brokers_acitity_information_message_record.member_number[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> wire[at] = brokers_acitity_information_message_record.accumulated_ask_trading_volume[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> wire[at] = brokers_acitity_information_message_record.accumulated_ask_trading_value[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> wire[at] = brokers_acitity_information_message_record.accumulated_bid_trading_volume[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> wire[at] = brokers_acitity_information_message_record.accumulated_bid_trading_value[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  wire[at] = brokers_acitity_information_message_record.end_keyword; at = at + 1;
  skip
}

/* Brokers Acitity Information Message off the wire, 86 bytes from where the cursor stands */
inline decode_brokers_acitity_information_message(brokers_acitity_information_message_record) {
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> brokers_acitity_information_message_record.isin_code[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 5 -> brokers_acitity_information_message_record.member_number[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> brokers_acitity_information_message_record.accumulated_ask_trading_volume[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> brokers_acitity_information_message_record.accumulated_ask_trading_value[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> brokers_acitity_information_message_record.accumulated_bid_trading_volume[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> brokers_acitity_information_message_record.accumulated_bid_trading_value[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Brokers Acitity Information Message is what was written, byte for byte */
inline equal_brokers_acitity_information_message(brokers_acitity_information_message_read, brokers_acitity_information_message_written) {
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> assert(brokers_acitity_information_message_read.isin_code[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.isin_code[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 5 -> assert(brokers_acitity_information_message_read.member_number[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.member_number[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> assert(brokers_acitity_information_message_read.accumulated_ask_trading_volume[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.accumulated_ask_trading_volume[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> assert(brokers_acitity_information_message_read.accumulated_ask_trading_value[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.accumulated_ask_trading_value[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 12 -> assert(brokers_acitity_information_message_read.accumulated_bid_trading_volume[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.accumulated_bid_trading_volume[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 22 -> assert(brokers_acitity_information_message_read.accumulated_bid_trading_value[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.accumulated_bid_trading_value[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  assert(brokers_acitity_information_message_read.end_keyword == brokers_acitity_information_message_written.end_keyword);
  skip
}

/* ---- Trading Activity By Session Per An Issue Message: 120 bytes ------------- */

/* Trading Activity by session for each issue and market. */
typedef TradingActivityBySessionPerAnIssueMessage {
  byte isin_code[12];
  byte total_number_of_tradable_issues_on_competitive_trading[5];
  byte pre_market_accumulated_trading_volume[12];
  byte pre_market_accumulated_trading_value[22];
  byte main_market_accumulated_trading_volume[12];
  byte main_market_accumulated_trading_value[22];
  byte after_market_accumulated_trading_volume[12];
  byte after_market_accumulated_trading_value[22];
  byte end_keyword
};

int trading_activity_by_session_per_an_issue_message_at;

/* every byte of Trading Activity By Session Per An Issue Message set to one value */
inline fill_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_record, trading_activity_by_session_per_an_issue_message_value) {
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.isin_code[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 5 -> trading_activity_by_session_per_an_issue_message_record.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_record.end_keyword = trading_activity_by_session_per_an_issue_message_value;
  skip
}

/* each byte of Trading Activity By Session Per An Issue Message set to where it lies, so a field read out of place says so */
inline ramp_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_record, trading_activity_by_session_per_an_issue_message_base) {
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.isin_code[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 0 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 5 -> trading_activity_by_session_per_an_issue_message_record.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 12 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 17 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 29 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 51 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 63 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 85 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 97 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_record.end_keyword = (trading_activity_by_session_per_an_issue_message_base + 119 + 1) % 256;
  skip
}

/* Trading Activity By Session Per An Issue Message to the wire, 120 bytes from where the cursor stands */
inline encode_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_record) {
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.isin_code[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 5 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_activity_by_session_per_an_issue_message_record.end_keyword; at = at + 1;
  skip
}

/* Trading Activity By Session Per An Issue Message off the wire, 120 bytes from where the cursor stands */
inline decode_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_record) {
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.isin_code[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 5 -> trading_activity_by_session_per_an_issue_message_record.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Activity By Session Per An Issue Message is what was written, byte for byte */
inline equal_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_read, trading_activity_by_session_per_an_issue_message_written) {
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> assert(trading_activity_by_session_per_an_issue_message_read.isin_code[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.isin_code[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 5 -> assert(trading_activity_by_session_per_an_issue_message_read.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> assert(trading_activity_by_session_per_an_issue_message_read.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> assert(trading_activity_by_session_per_an_issue_message_read.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> assert(trading_activity_by_session_per_an_issue_message_read.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> assert(trading_activity_by_session_per_an_issue_message_read.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> assert(trading_activity_by_session_per_an_issue_message_read.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 22 -> assert(trading_activity_by_session_per_an_issue_message_read.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  assert(trading_activity_by_session_per_an_issue_message_read.end_keyword == trading_activity_by_session_per_an_issue_message_written.end_keyword);
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

/* Securities Quote 10 Level Message: encoded, read back, and compared */
proctype check_securities_quote10_level_message() {
  SecuritiesQuote10LevelMessage securities_quote10_level_message_sent;
  SecuritiesQuote10LevelMessage securities_quote10_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_quote10_level_message(securities_quote10_level_message_sent, 0)
  :: pattern == 1 -> fill_securities_quote10_level_message(securities_quote10_level_message_sent, 32)
  :: pattern == 2 -> fill_securities_quote10_level_message(securities_quote10_level_message_sent, 255)
  :: else -> ramp_securities_quote10_level_message(securities_quote10_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_quote10_level_message(securities_quote10_level_message_sent);
    assert(at == 585);
    at = 0;
    decode_securities_quote10_level_message(securities_quote10_level_message_got);
    assert(at == 585);
    equal_securities_quote10_level_message(securities_quote10_level_message_got, securities_quote10_level_message_sent)
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

/* Equities Snapshot 10 Level Message: encoded, read back, and compared */
proctype check_equities_snapshot10_level_message() {
  EquitiesSnapshot10LevelMessage equities_snapshot10_level_message_sent;
  EquitiesSnapshot10LevelMessage equities_snapshot10_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equities_snapshot10_level_message(equities_snapshot10_level_message_sent, 0)
  :: pattern == 1 -> fill_equities_snapshot10_level_message(equities_snapshot10_level_message_sent, 32)
  :: pattern == 2 -> fill_equities_snapshot10_level_message(equities_snapshot10_level_message_sent, 255)
  :: else -> ramp_equities_snapshot10_level_message(equities_snapshot10_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equities_snapshot10_level_message(equities_snapshot10_level_message_sent);
    assert(at == 680);
    at = 0;
    decode_equities_snapshot10_level_message(equities_snapshot10_level_message_got);
    assert(at == 680);
    equal_equities_snapshot10_level_message(equities_snapshot10_level_message_got, equities_snapshot10_level_message_sent)
  }
}

/* Investor Activities Per An Industry Message: encoded, read back, and compared */
proctype check_investor_activities_per_an_industry_message() {
  InvestorActivitiesPerAnIndustryMessage investor_activities_per_an_industry_message_sent;
  InvestorActivitiesPerAnIndustryMessage investor_activities_per_an_industry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_sent, 0)
  :: pattern == 1 -> fill_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_sent, 32)
  :: pattern == 2 -> fill_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_sent, 255)
  :: else -> ramp_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_sent);
    assert(at == 100);
    at = 0;
    decode_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_got);
    assert(at == 100);
    equal_investor_activities_per_an_industry_message(investor_activities_per_an_industry_message_got, investor_activities_per_an_industry_message_sent)
  }
}

/* Current Movement Message: encoded, read back, and compared */
proctype check_current_movement_message() {
  CurrentMovementMessage current_movement_message_sent;
  CurrentMovementMessage current_movement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_current_movement_message(current_movement_message_sent, 0)
  :: pattern == 1 -> fill_current_movement_message(current_movement_message_sent, 32)
  :: pattern == 2 -> fill_current_movement_message(current_movement_message_sent, 255)
  :: else -> ramp_current_movement_message(current_movement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_current_movement_message(current_movement_message_sent);
    assert(at == 51);
    at = 0;
    decode_current_movement_message(current_movement_message_got);
    assert(at == 51);
    equal_current_movement_message(current_movement_message_got, current_movement_message_sent)
  }
}

/* Program Trading Activity Per Investor Message: encoded, read back, and compared */
proctype check_program_trading_activity_per_investor_message() {
  ProgramTradingActivityPerInvestorMessage program_trading_activity_per_investor_message_sent;
  ProgramTradingActivityPerInvestorMessage program_trading_activity_per_investor_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_sent, 0)
  :: pattern == 1 -> fill_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_sent, 32)
  :: pattern == 2 -> fill_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_sent, 255)
  :: else -> ramp_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_sent);
    assert(at == 159);
    at = 0;
    decode_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_got);
    assert(at == 159);
    equal_program_trading_activity_per_investor_message(program_trading_activity_per_investor_message_got, program_trading_activity_per_investor_message_sent)
  }
}

/* Program Trading Information Per Issue Aggregated Information Message: encoded, read back, and compared */
proctype check_program_trading_information_per_issue_aggregated_information_message() {
  ProgramTradingInformationPerIssueAggregatedInformationMessage program_trading_information_per_issue_aggregated_information_message_sent;
  ProgramTradingInformationPerIssueAggregatedInformationMessage program_trading_information_per_issue_aggregated_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_sent, 0)
  :: pattern == 1 -> fill_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_sent, 32)
  :: pattern == 2 -> fill_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_sent, 255)
  :: else -> ramp_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_sent);
    assert(at == 395);
    at = 0;
    decode_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_got);
    assert(at == 395);
    equal_program_trading_information_per_issue_aggregated_information_message(program_trading_information_per_issue_aggregated_information_message_got, program_trading_information_per_issue_aggregated_information_message_sent)
  }
}

/* Program Trading Information Of Total Aggregated Information Message: encoded, read back, and compared */
proctype check_program_trading_information_of_total_aggregated_information_message() {
  ProgramTradingInformationOfTotalAggregatedInformationMessage program_trading_information_of_total_aggregated_information_message_sent;
  ProgramTradingInformationOfTotalAggregatedInformationMessage program_trading_information_of_total_aggregated_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_sent, 0)
  :: pattern == 1 -> fill_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_sent, 32)
  :: pattern == 2 -> fill_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_sent, 255)
  :: else -> ramp_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_sent);
    assert(at == 377);
    at = 0;
    decode_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_got);
    assert(at == 377);
    equal_program_trading_information_of_total_aggregated_information_message(program_trading_information_of_total_aggregated_information_message_got, program_trading_information_of_total_aggregated_information_message_sent)
  }
}

/* Market Operation Schedule Message: encoded, read back, and compared */
proctype check_market_operation_schedule_message() {
  MarketOperationScheduleMessage market_operation_schedule_message_sent;
  MarketOperationScheduleMessage market_operation_schedule_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_operation_schedule_message(market_operation_schedule_message_sent, 0)
  :: pattern == 1 -> fill_market_operation_schedule_message(market_operation_schedule_message_sent, 32)
  :: pattern == 2 -> fill_market_operation_schedule_message(market_operation_schedule_message_sent, 255)
  :: else -> ramp_market_operation_schedule_message(market_operation_schedule_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_operation_schedule_message(market_operation_schedule_message_sent);
    assert(at == 78);
    at = 0;
    decode_market_operation_schedule_message(market_operation_schedule_message_got);
    assert(at == 78);
    equal_market_operation_schedule_message(market_operation_schedule_message_got, market_operation_schedule_message_sent)
  }
}

/* Member Firm Imposing Lifting Sanctions Message: encoded, read back, and compared */
proctype check_member_firm_imposing_lifting_sanctions_message() {
  MemberFirmImposingLiftingSanctionsMessage member_firm_imposing_lifting_sanctions_message_sent;
  MemberFirmImposingLiftingSanctionsMessage member_firm_imposing_lifting_sanctions_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_sent, 0)
  :: pattern == 1 -> fill_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_sent, 32)
  :: pattern == 2 -> fill_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_sent, 255)
  :: else -> ramp_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_sent);
    assert(at == 41);
    at = 0;
    decode_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_got);
    assert(at == 41);
    equal_member_firm_imposing_lifting_sanctions_message(member_firm_imposing_lifting_sanctions_message_got, member_firm_imposing_lifting_sanctions_message_sent)
  }
}

/* Top Five Traders Activities Message: encoded, read back, and compared */
proctype check_top_five_traders_activities_message() {
  TopFiveTradersActivitiesMessage top_five_traders_activities_message_sent;
  TopFiveTradersActivitiesMessage top_five_traders_activities_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_five_traders_activities_message(top_five_traders_activities_message_sent, 0)
  :: pattern == 1 -> fill_top_five_traders_activities_message(top_five_traders_activities_message_sent, 32)
  :: pattern == 2 -> fill_top_five_traders_activities_message(top_five_traders_activities_message_sent, 255)
  :: else -> ramp_top_five_traders_activities_message(top_five_traders_activities_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_five_traders_activities_message(top_five_traders_activities_message_sent);
    assert(at == 409);
    at = 0;
    decode_top_five_traders_activities_message(top_five_traders_activities_message_got);
    assert(at == 409);
    equal_top_five_traders_activities_message(top_five_traders_activities_message_got, top_five_traders_activities_message_sent)
  }
}

/* Equities Batch Data Message: encoded, read back, and compared */
proctype check_equities_batch_data_message() {
  EquitiesBatchDataMessage equities_batch_data_message_sent;
  EquitiesBatchDataMessage equities_batch_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equities_batch_data_message(equities_batch_data_message_sent, 0)
  :: pattern == 1 -> fill_equities_batch_data_message(equities_batch_data_message_sent, 32)
  :: pattern == 2 -> fill_equities_batch_data_message(equities_batch_data_message_sent, 255)
  :: else -> ramp_equities_batch_data_message(equities_batch_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equities_batch_data_message(equities_batch_data_message_sent);
    assert(at == 649);
    at = 0;
    decode_equities_batch_data_message(equities_batch_data_message_got);
    assert(at == 649);
    equal_equities_batch_data_message(equities_batch_data_message_got, equities_batch_data_message_sent)
  }
}

/* Member Information Message: encoded, read back, and compared */
proctype check_member_information_message() {
  MemberInformationMessage member_information_message_sent;
  MemberInformationMessage member_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_member_information_message(member_information_message_sent, 0)
  :: pattern == 1 -> fill_member_information_message(member_information_message_sent, 32)
  :: pattern == 2 -> fill_member_information_message(member_information_message_sent, 255)
  :: else -> ramp_member_information_message(member_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_member_information_message(member_information_message_sent);
    assert(at == 202);
    at = 0;
    decode_member_information_message(member_information_message_got);
    assert(at == 202);
    equal_member_information_message(member_information_message_got, member_information_message_sent)
  }
}

/* Issue Event Message: encoded, read back, and compared */
proctype check_issue_event_message() {
  IssueEventMessage issue_event_message_sent;
  IssueEventMessage issue_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_issue_event_message(issue_event_message_sent, 0)
  :: pattern == 1 -> fill_issue_event_message(issue_event_message_sent, 32)
  :: pattern == 2 -> fill_issue_event_message(issue_event_message_sent, 255)
  :: else -> ramp_issue_event_message(issue_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_issue_event_message(issue_event_message_sent);
    assert(at == 43);
    at = 0;
    decode_issue_event_message(issue_event_message_got);
    assert(at == 43);
    equal_issue_event_message(issue_event_message_got, issue_event_message_sent)
  }
}

/* Block Basket Trade Data Message: encoded, read back, and compared */
proctype check_block_basket_trade_data_message() {
  BlockBasketTradeDataMessage block_basket_trade_data_message_sent;
  BlockBasketTradeDataMessage block_basket_trade_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_basket_trade_data_message(block_basket_trade_data_message_sent, 0)
  :: pattern == 1 -> fill_block_basket_trade_data_message(block_basket_trade_data_message_sent, 32)
  :: pattern == 2 -> fill_block_basket_trade_data_message(block_basket_trade_data_message_sent, 255)
  :: else -> ramp_block_basket_trade_data_message(block_basket_trade_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_basket_trade_data_message(block_basket_trade_data_message_sent);
    assert(at == 55);
    at = 0;
    decode_block_basket_trade_data_message(block_basket_trade_data_message_got);
    assert(at == 55);
    equal_block_basket_trade_data_message(block_basket_trade_data_message_got, block_basket_trade_data_message_sent)
  }
}

/* Investor Activities Per An Issue Eod Message: encoded, read back, and compared */
proctype check_investor_activities_per_an_issue_eod_message() {
  InvestorActivitiesPerAnIssueEodMessage investor_activities_per_an_issue_eod_message_sent;
  InvestorActivitiesPerAnIssueEodMessage investor_activities_per_an_issue_eod_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_sent, 0)
  :: pattern == 1 -> fill_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_sent, 32)
  :: pattern == 2 -> fill_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_sent, 255)
  :: else -> ramp_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_sent);
    assert(at == 91);
    at = 0;
    decode_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_got);
    assert(at == 91);
    equal_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_got, investor_activities_per_an_issue_eod_message_sent)
  }
}

/* Short Selling Message: encoded, read back, and compared */
proctype check_short_selling_message() {
  ShortSellingMessage short_selling_message_sent;
  ShortSellingMessage short_selling_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_selling_message(short_selling_message_sent, 0)
  :: pattern == 1 -> fill_short_selling_message(short_selling_message_sent, 32)
  :: pattern == 2 -> fill_short_selling_message(short_selling_message_sent, 255)
  :: else -> ramp_short_selling_message(short_selling_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_selling_message(short_selling_message_sent);
    assert(at == 115);
    at = 0;
    decode_short_selling_message(short_selling_message_got);
    assert(at == 115);
    equal_short_selling_message(short_selling_message_got, short_selling_message_sent)
  }
}

/* Brokers Acitity Information Message: encoded, read back, and compared */
proctype check_brokers_acitity_information_message() {
  BrokersAcitityInformationMessage brokers_acitity_information_message_sent;
  BrokersAcitityInformationMessage brokers_acitity_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_brokers_acitity_information_message(brokers_acitity_information_message_sent, 0)
  :: pattern == 1 -> fill_brokers_acitity_information_message(brokers_acitity_information_message_sent, 32)
  :: pattern == 2 -> fill_brokers_acitity_information_message(brokers_acitity_information_message_sent, 255)
  :: else -> ramp_brokers_acitity_information_message(brokers_acitity_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_brokers_acitity_information_message(brokers_acitity_information_message_sent);
    assert(at == 86);
    at = 0;
    decode_brokers_acitity_information_message(brokers_acitity_information_message_got);
    assert(at == 86);
    equal_brokers_acitity_information_message(brokers_acitity_information_message_got, brokers_acitity_information_message_sent)
  }
}

/* Trading Activity By Session Per An Issue Message: encoded, read back, and compared */
proctype check_trading_activity_by_session_per_an_issue_message() {
  TradingActivityBySessionPerAnIssueMessage trading_activity_by_session_per_an_issue_message_sent;
  TradingActivityBySessionPerAnIssueMessage trading_activity_by_session_per_an_issue_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_sent, 0)
  :: pattern == 1 -> fill_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_sent, 32)
  :: pattern == 2 -> fill_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_sent, 255)
  :: else -> ramp_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_sent);
    assert(at == 120);
    at = 0;
    decode_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_got);
    assert(at == 120);
    equal_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_got, trading_activity_by_session_per_an_issue_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_polling_data_message()
  :: run check_securities_quote10_level_message()
  :: run check_securities_order_filled_message()
  :: run check_market_operation_ts_message()
  :: run check_issue_closing_message()
  :: run check_triggering_removing_vi_message()
  :: run check_closing_price_trading_quote_message()
  :: run check_equities_snapshot10_level_message()
  :: run check_investor_activities_per_an_industry_message()
  :: run check_current_movement_message()
  :: run check_program_trading_activity_per_investor_message()
  :: run check_program_trading_information_per_issue_aggregated_information_message()
  :: run check_program_trading_information_of_total_aggregated_information_message()
  :: run check_market_operation_schedule_message()
  :: run check_member_firm_imposing_lifting_sanctions_message()
  :: run check_top_five_traders_activities_message()
  :: run check_equities_batch_data_message()
  :: run check_member_information_message()
  :: run check_issue_event_message()
  :: run check_block_basket_trade_data_message()
  :: run check_investor_activities_per_an_issue_eod_message()
  :: run check_short_selling_message()
  :: run check_brokers_acitity_information_message()
  :: run check_trading_activity_by_session_per_an_issue_message()
  fi
}
