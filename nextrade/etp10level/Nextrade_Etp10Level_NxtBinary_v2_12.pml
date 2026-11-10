/*
 * Nextrade Nextrade Etp Market Data 10 Level
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
#define WIRE 576

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Polling Data Message: 8 bytes ------------------------------------------- */

/* The data is provided periodically in order to check multicast group status. */
typedef PollingDataMessage {
  byte current_time_1_minute_interval[4];
  byte end_keyword[4]
};

int polling_data_message_at;

/* every byte of Polling Data Message set to one value */
inline fill_polling_data_message(polling_data_message_record, polling_data_message_value) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.current_time_1_minute_interval[polling_data_message_at] = polling_data_message_value; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.end_keyword[polling_data_message_at] = polling_data_message_value; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Polling Data Message set to where it lies, so a field read out of place says so */
inline ramp_polling_data_message(polling_data_message_record, polling_data_message_base) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.current_time_1_minute_interval[polling_data_message_at] = (polling_data_message_base + 0 + polling_data_message_at + 1) % 256; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.end_keyword[polling_data_message_at] = (polling_data_message_base + 4 + polling_data_message_at + 1) % 256; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Polling Data Message to the wire, 8 bytes from where the cursor stands */
inline encode_polling_data_message(polling_data_message_record) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> wire[at] = polling_data_message_record.current_time_1_minute_interval[polling_data_message_at]; at = at + 1; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> wire[at] = polling_data_message_record.end_keyword[polling_data_message_at]; at = at + 1; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Polling Data Message off the wire, 8 bytes from where the cursor stands */
inline decode_polling_data_message(polling_data_message_record) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.current_time_1_minute_interval[polling_data_message_at] = wire[at]; at = at + 1; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.end_keyword[polling_data_message_at] = wire[at]; at = at + 1; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Polling Data Message is what was written, byte for byte */
inline equal_polling_data_message(polling_data_message_read, polling_data_message_written) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> assert(polling_data_message_read.current_time_1_minute_interval[polling_data_message_at] == polling_data_message_written.current_time_1_minute_interval[polling_data_message_at]); polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> assert(polling_data_message_read.end_keyword[polling_data_message_at] == polling_data_message_written.end_keyword[polling_data_message_at]); polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Securities Quote Mm Lp Quotes Included 10 Level Message: 576 bytes ------ */

/* Securities_Quote (MM/LP Quotes Included, 10 Level) Best Order Data on NXT Trading Items provided - MM/LP Quotes Included * 10 Level Best Order on Ask/Bid. */
typedef SecuritiesQuoteMmLpQuotesIncluded10LevelMessage {
  byte message_sequence_number[4];
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte processing_time_of_trading_system[12];
  byte ask_level_1_price[8];
  byte bid_level_1_price[8];
  byte ask_level_1_volume[8];
  byte bid_level_1_volume[8];
  byte lp_ask_level_1_volume[8];
  byte lp_bid_level_1_volume[8];
  byte ask_level_2_price[8];
  byte bid_level_2_price[8];
  byte ask_level_2_volume[8];
  byte bid_level_2_volume[8];
  byte lp_ask_level_2_volume[8];
  byte lp_bid_level_2_volume[8];
  byte ask_level_3_price[8];
  byte bid_level_3_price[8];
  byte ask_level_3_volume[8];
  byte bid_level_3_volume[8];
  byte lp_ask_level_3_volume[8];
  byte lp_bid_level_3_volume[8];
  byte ask_level_4_price[8];
  byte bid_level_4_price[8];
  byte ask_level_4_volume[8];
  byte bid_level_4_volume[8];
  byte lp_ask_level_4_volume[8];
  byte lp_bid_level_4_volume[8];
  byte ask_level_5_price[8];
  byte bid_level_5_price[8];
  byte ask_level_5_volume[8];
  byte bid_level_5_volume[8];
  byte lp_ask_level_5_volume[8];
  byte lp_bid_level_5_volume[8];
  byte ask_level_6_price[8];
  byte bid_level_6_price[8];
  byte ask_level_6_volume[8];
  byte bid_level_6_volume[8];
  byte lp_ask_level_6_volume[8];
  byte lp_bid_level_6_volume[8];
  byte ask_level_7_price[8];
  byte bid_level_7_price[8];
  byte ask_level_7_volume[8];
  byte bid_level_7_volume[8];
  byte lp_ask_level_7_volume[8];
  byte lp_bid_level_7_volume[8];
  byte ask_level_8_price[8];
  byte bid_level_8_price[8];
  byte ask_level_8_volume[8];
  byte bid_level_8_volume[8];
  byte lp_ask_level_8_volume[8];
  byte lp_bid_level_8_volume[8];
  byte ask_level_9_price[8];
  byte bid_level_9_price[8];
  byte ask_level_9_volume[8];
  byte bid_level_9_volume[8];
  byte lp_ask_level_9_volume[8];
  byte lp_bid_level_9_volume[8];
  byte ask_level_10_price[8];
  byte bid_level_10_price[8];
  byte ask_level_10_volume[8];
  byte bid_level_10_volume[8];
  byte lp_ask_level_10_volume[8];
  byte lp_bid_level_10_volume[8];
  byte total_ask_volume[8];
  byte total_bid_volume[8];
  byte estimated_trading_price[8];
  byte estimated_trading_volume[8];
  byte mid_price[8];
  byte total_mid_price_ask_volume_total_ask_volume_on_mid_price[8];
  byte total_mid_price_bid_volume_total_bid_volume_on_mid_price[8];
  byte end_keyword[4]
};

int securities_quote_mm_lp_quotes_included10_level_message_at;

/* every byte of Securities Quote Mm Lp Quotes Included 10 Level Message set to one value */
inline fill_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_record, securities_quote_mm_lp_quotes_included10_level_message_value) {
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> securities_quote_mm_lp_quotes_included10_level_message_record.message_sequence_number[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> securities_quote_mm_lp_quotes_included10_level_message_record.board_id[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> securities_quote_mm_lp_quotes_included10_level_message_record.session_id[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> securities_quote_mm_lp_quotes_included10_level_message_record.isin_code[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> securities_quote_mm_lp_quotes_included10_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> securities_quote_mm_lp_quotes_included10_level_message_record.processing_time_of_trading_system[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_ask_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_bid_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.estimated_trading_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.estimated_trading_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> securities_quote_mm_lp_quotes_included10_level_message_record.end_keyword[securities_quote_mm_lp_quotes_included10_level_message_at] = securities_quote_mm_lp_quotes_included10_level_message_value; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Securities Quote Mm Lp Quotes Included 10 Level Message set to where it lies, so a field read out of place says so */
inline ramp_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_record, securities_quote_mm_lp_quotes_included10_level_message_base) {
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> securities_quote_mm_lp_quotes_included10_level_message_record.message_sequence_number[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 0 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> securities_quote_mm_lp_quotes_included10_level_message_record.board_id[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 4 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> securities_quote_mm_lp_quotes_included10_level_message_record.session_id[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 6 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> securities_quote_mm_lp_quotes_included10_level_message_record.isin_code[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 8 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> securities_quote_mm_lp_quotes_included10_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 20 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> securities_quote_mm_lp_quotes_included10_level_message_record.processing_time_of_trading_system[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 24 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 36 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 44 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 52 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 60 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 68 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 76 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 84 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 92 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 100 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 108 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 116 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 124 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 132 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 140 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 148 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 156 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 164 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 172 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 180 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 188 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 196 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 204 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 212 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 220 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 228 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 236 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 244 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 252 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 260 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 268 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 276 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 284 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 292 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 300 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 308 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 316 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 324 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 332 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 340 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 348 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 356 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 364 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 372 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 380 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 388 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 396 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 404 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 412 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 420 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 428 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 436 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 444 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 452 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 460 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 468 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 476 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 484 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 492 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 500 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 508 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_ask_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 516 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_bid_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 524 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.estimated_trading_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 532 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.estimated_trading_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 540 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 548 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 556 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 564 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> securities_quote_mm_lp_quotes_included10_level_message_record.end_keyword[securities_quote_mm_lp_quotes_included10_level_message_at] = (securities_quote_mm_lp_quotes_included10_level_message_base + 572 + securities_quote_mm_lp_quotes_included10_level_message_at + 1) % 256; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Securities Quote Mm Lp Quotes Included 10 Level Message to the wire, 576 bytes from where the cursor stands */
inline encode_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_record) {
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.message_sequence_number[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.board_id[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.session_id[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.isin_code[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.processing_time_of_trading_system[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.total_ask_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.total_bid_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.estimated_trading_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.estimated_trading_volume[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.mid_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> wire[at] = securities_quote_mm_lp_quotes_included10_level_message_record.end_keyword[securities_quote_mm_lp_quotes_included10_level_message_at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Securities Quote Mm Lp Quotes Included 10 Level Message off the wire, 576 bytes from where the cursor stands */
inline decode_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_record) {
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> securities_quote_mm_lp_quotes_included10_level_message_record.message_sequence_number[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> securities_quote_mm_lp_quotes_included10_level_message_record.board_id[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> securities_quote_mm_lp_quotes_included10_level_message_record.session_id[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> securities_quote_mm_lp_quotes_included10_level_message_record.isin_code[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> securities_quote_mm_lp_quotes_included10_level_message_record.a_designated_number_for_an_issue_from_krx[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> securities_quote_mm_lp_quotes_included10_level_message_record.processing_time_of_trading_system[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.lp_bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_ask_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_bid_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.estimated_trading_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.estimated_trading_volume[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> securities_quote_mm_lp_quotes_included10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> securities_quote_mm_lp_quotes_included10_level_message_record.end_keyword[securities_quote_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Securities Quote Mm Lp Quotes Included 10 Level Message is what was written, byte for byte */
inline equal_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_read, securities_quote_mm_lp_quotes_included10_level_message_written) {
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.message_sequence_number[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.message_sequence_number[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.board_id[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.board_id[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 2 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.session_id[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.session_id[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.isin_code[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.isin_code[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.a_designated_number_for_an_issue_from_krx[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.a_designated_number_for_an_issue_from_krx[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 12 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.processing_time_of_trading_system[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.processing_time_of_trading_system[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_1_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_1_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_2_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_2_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_3_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_3_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_4_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_4_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_5_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_5_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_6_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_6_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_7_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_7_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_8_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_8_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_9_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_9_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_10_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_ask_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.lp_bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.lp_bid_level_10_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.total_ask_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.total_ask_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.total_bid_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.total_bid_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.estimated_trading_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.estimated_trading_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.estimated_trading_volume[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.estimated_trading_volume[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.mid_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.total_mid_price_ask_volume_total_ask_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 8 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.total_mid_price_bid_volume_total_bid_volume_on_mid_price[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  securities_quote_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: securities_quote_mm_lp_quotes_included10_level_message_at < 4 -> assert(securities_quote_mm_lp_quotes_included10_level_message_read.end_keyword[securities_quote_mm_lp_quotes_included10_level_message_at] == securities_quote_mm_lp_quotes_included10_level_message_written.end_keyword[securities_quote_mm_lp_quotes_included10_level_message_at]); securities_quote_mm_lp_quotes_included10_level_message_at = securities_quote_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Securities Order Filled Message: 138 bytes ------------------------------ */

/* Securities_Order Filled Order Filled Data on NXT trading items provided. */
typedef SecuritiesOrderFilledMessage {
  byte message_sequence_number[4];
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte processing_time_of_trading_system[12];
  byte price_change_against_previous_day;
  byte a_price_change_against_the_previous_day[8];
  byte trading_price[8];
  byte trading_volume[8];
  byte opening_price[8];
  byte todays_high[8];
  byte todays_low[8];
  byte accumulated_trading_volume[8];
  byte accumulated_trading_value[16];
  byte final_ask_bid_type_code;
  byte lp_holding_quantity[8];
  byte the_best_ask[8];
  byte the_best_bid[8];
  byte end_keyword[4]
};

int securities_order_filled_message_at;

/* every byte of Securities Order Filled Message set to one value */
inline fill_securities_order_filled_message(securities_order_filled_message_record, securities_order_filled_message_value) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> securities_order_filled_message_record.message_sequence_number[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
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
  :: securities_order_filled_message_at < 4 -> securities_order_filled_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
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
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.a_price_change_against_the_previous_day[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.trading_price[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.trading_volume[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.opening_price[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.todays_high[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.todays_low[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.accumulated_trading_volume[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 16 -> securities_order_filled_message_record.accumulated_trading_value[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.final_ask_bid_type_code = securities_order_filled_message_value;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.lp_holding_quantity[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.the_best_ask[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.the_best_bid[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> securities_order_filled_message_record.end_keyword[securities_order_filled_message_at] = securities_order_filled_message_value; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Securities Order Filled Message set to where it lies, so a field read out of place says so */
inline ramp_securities_order_filled_message(securities_order_filled_message_record, securities_order_filled_message_base) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> securities_order_filled_message_record.message_sequence_number[securities_order_filled_message_at] = (securities_order_filled_message_base + 0 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> securities_order_filled_message_record.board_id[securities_order_filled_message_at] = (securities_order_filled_message_base + 4 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 2 -> securities_order_filled_message_record.session_id[securities_order_filled_message_at] = (securities_order_filled_message_base + 6 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.isin_code[securities_order_filled_message_at] = (securities_order_filled_message_base + 8 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> securities_order_filled_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at] = (securities_order_filled_message_base + 20 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 12 -> securities_order_filled_message_record.processing_time_of_trading_system[securities_order_filled_message_at] = (securities_order_filled_message_base + 24 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.price_change_against_previous_day = (securities_order_filled_message_base + 36 + 1) % 256;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.a_price_change_against_the_previous_day[securities_order_filled_message_at] = (securities_order_filled_message_base + 37 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.trading_price[securities_order_filled_message_at] = (securities_order_filled_message_base + 45 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.trading_volume[securities_order_filled_message_at] = (securities_order_filled_message_base + 53 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.opening_price[securities_order_filled_message_at] = (securities_order_filled_message_base + 61 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.todays_high[securities_order_filled_message_at] = (securities_order_filled_message_base + 69 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.todays_low[securities_order_filled_message_at] = (securities_order_filled_message_base + 77 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.accumulated_trading_volume[securities_order_filled_message_at] = (securities_order_filled_message_base + 85 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 16 -> securities_order_filled_message_record.accumulated_trading_value[securities_order_filled_message_at] = (securities_order_filled_message_base + 93 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.final_ask_bid_type_code = (securities_order_filled_message_base + 109 + 1) % 256;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.lp_holding_quantity[securities_order_filled_message_at] = (securities_order_filled_message_base + 110 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.the_best_ask[securities_order_filled_message_at] = (securities_order_filled_message_base + 118 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.the_best_bid[securities_order_filled_message_at] = (securities_order_filled_message_base + 126 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> securities_order_filled_message_record.end_keyword[securities_order_filled_message_at] = (securities_order_filled_message_base + 134 + securities_order_filled_message_at + 1) % 256; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Securities Order Filled Message to the wire, 138 bytes from where the cursor stands */
inline encode_securities_order_filled_message(securities_order_filled_message_record) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> wire[at] = securities_order_filled_message_record.message_sequence_number[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
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
  :: securities_order_filled_message_at < 4 -> wire[at] = securities_order_filled_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
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
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.a_price_change_against_the_previous_day[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.trading_price[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.trading_volume[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.opening_price[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.todays_high[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.todays_low[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.accumulated_trading_volume[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 16 -> wire[at] = securities_order_filled_message_record.accumulated_trading_value[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_order_filled_message_record.final_ask_bid_type_code; at = at + 1;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.lp_holding_quantity[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.the_best_ask[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> wire[at] = securities_order_filled_message_record.the_best_bid[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> wire[at] = securities_order_filled_message_record.end_keyword[securities_order_filled_message_at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Securities Order Filled Message off the wire, 138 bytes from where the cursor stands */
inline decode_securities_order_filled_message(securities_order_filled_message_record) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> securities_order_filled_message_record.message_sequence_number[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
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
  :: securities_order_filled_message_at < 4 -> securities_order_filled_message_record.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
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
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.a_price_change_against_the_previous_day[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.trading_price[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.trading_volume[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.opening_price[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.todays_high[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.todays_low[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.accumulated_trading_volume[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 16 -> securities_order_filled_message_record.accumulated_trading_value[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_record.final_ask_bid_type_code = wire[at]; at = at + 1;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.lp_holding_quantity[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.the_best_ask[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> securities_order_filled_message_record.the_best_bid[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> securities_order_filled_message_record.end_keyword[securities_order_filled_message_at] = wire[at]; at = at + 1; securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Securities Order Filled Message is what was written, byte for byte */
inline equal_securities_order_filled_message(securities_order_filled_message_read, securities_order_filled_message_written) {
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> assert(securities_order_filled_message_read.message_sequence_number[securities_order_filled_message_at] == securities_order_filled_message_written.message_sequence_number[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
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
  :: securities_order_filled_message_at < 4 -> assert(securities_order_filled_message_read.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at] == securities_order_filled_message_written.a_designated_number_for_an_issue_from_krx[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
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
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.a_price_change_against_the_previous_day[securities_order_filled_message_at] == securities_order_filled_message_written.a_price_change_against_the_previous_day[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.trading_price[securities_order_filled_message_at] == securities_order_filled_message_written.trading_price[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.trading_volume[securities_order_filled_message_at] == securities_order_filled_message_written.trading_volume[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.opening_price[securities_order_filled_message_at] == securities_order_filled_message_written.opening_price[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.todays_high[securities_order_filled_message_at] == securities_order_filled_message_written.todays_high[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.todays_low[securities_order_filled_message_at] == securities_order_filled_message_written.todays_low[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.accumulated_trading_volume[securities_order_filled_message_at] == securities_order_filled_message_written.accumulated_trading_volume[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 16 -> assert(securities_order_filled_message_read.accumulated_trading_value[securities_order_filled_message_at] == securities_order_filled_message_written.accumulated_trading_value[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  assert(securities_order_filled_message_read.final_ask_bid_type_code == securities_order_filled_message_written.final_ask_bid_type_code);
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.lp_holding_quantity[securities_order_filled_message_at] == securities_order_filled_message_written.lp_holding_quantity[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.the_best_ask[securities_order_filled_message_at] == securities_order_filled_message_written.the_best_ask[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 8 -> assert(securities_order_filled_message_read.the_best_bid[securities_order_filled_message_at] == securities_order_filled_message_written.the_best_bid[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  securities_order_filled_message_at = 0;
  do
  :: securities_order_filled_message_at < 4 -> assert(securities_order_filled_message_read.end_keyword[securities_order_filled_message_at] == securities_order_filled_message_written.end_keyword[securities_order_filled_message_at]); securities_order_filled_message_at = securities_order_filled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Operation Ts Message: 59 bytes ----------------------------------- */

/* The data is provided per an issue if a Market Operation Trading session event occurs. */
typedef MarketOperationTsMessage {
  byte message_sequence_number[4];
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte processing_time_of_trading_system[12];
  byte board_event_id[3];
  byte start_time_of_a_board_event[9];
  byte board_event_group_code[4];
  byte trading_halt_reason_code[3];
  byte end_keyword[4]
};

int market_operation_ts_message_at;

/* every byte of Market Operation Ts Message set to one value */
inline fill_market_operation_ts_message(market_operation_ts_message_record, market_operation_ts_message_value) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.message_sequence_number[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
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
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
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
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.board_event_group_code[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.trading_halt_reason_code[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.end_keyword[market_operation_ts_message_at] = market_operation_ts_message_value; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Operation Ts Message set to where it lies, so a field read out of place says so */
inline ramp_market_operation_ts_message(market_operation_ts_message_record, market_operation_ts_message_base) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.message_sequence_number[market_operation_ts_message_at] = (market_operation_ts_message_base + 0 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> market_operation_ts_message_record.board_id[market_operation_ts_message_at] = (market_operation_ts_message_base + 4 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 2 -> market_operation_ts_message_record.session_id[market_operation_ts_message_at] = (market_operation_ts_message_base + 6 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> market_operation_ts_message_record.isin_code[market_operation_ts_message_at] = (market_operation_ts_message_base + 8 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at] = (market_operation_ts_message_base + 20 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 12 -> market_operation_ts_message_record.processing_time_of_trading_system[market_operation_ts_message_at] = (market_operation_ts_message_base + 24 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.board_event_id[market_operation_ts_message_at] = (market_operation_ts_message_base + 36 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 9 -> market_operation_ts_message_record.start_time_of_a_board_event[market_operation_ts_message_at] = (market_operation_ts_message_base + 39 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.board_event_group_code[market_operation_ts_message_at] = (market_operation_ts_message_base + 48 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.trading_halt_reason_code[market_operation_ts_message_at] = (market_operation_ts_message_base + 52 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.end_keyword[market_operation_ts_message_at] = (market_operation_ts_message_base + 55 + market_operation_ts_message_at + 1) % 256; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Operation Ts Message to the wire, 59 bytes from where the cursor stands */
inline encode_market_operation_ts_message(market_operation_ts_message_record) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> wire[at] = market_operation_ts_message_record.message_sequence_number[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
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
  :: market_operation_ts_message_at < 4 -> wire[at] = market_operation_ts_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
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
  :: market_operation_ts_message_at < 4 -> wire[at] = market_operation_ts_message_record.board_event_group_code[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> wire[at] = market_operation_ts_message_record.trading_halt_reason_code[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> wire[at] = market_operation_ts_message_record.end_keyword[market_operation_ts_message_at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Operation Ts Message off the wire, 59 bytes from where the cursor stands */
inline decode_market_operation_ts_message(market_operation_ts_message_record) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.message_sequence_number[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
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
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
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
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.board_event_group_code[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> market_operation_ts_message_record.trading_halt_reason_code[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> market_operation_ts_message_record.end_keyword[market_operation_ts_message_at] = wire[at]; at = at + 1; market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Operation Ts Message is what was written, byte for byte */
inline equal_market_operation_ts_message(market_operation_ts_message_read, market_operation_ts_message_written) {
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> assert(market_operation_ts_message_read.message_sequence_number[market_operation_ts_message_at] == market_operation_ts_message_written.message_sequence_number[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
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
  :: market_operation_ts_message_at < 4 -> assert(market_operation_ts_message_read.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at] == market_operation_ts_message_written.a_designated_number_for_an_issue_from_krx[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
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
  :: market_operation_ts_message_at < 4 -> assert(market_operation_ts_message_read.board_event_group_code[market_operation_ts_message_at] == market_operation_ts_message_written.board_event_group_code[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 3 -> assert(market_operation_ts_message_read.trading_halt_reason_code[market_operation_ts_message_at] == market_operation_ts_message_written.trading_halt_reason_code[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  market_operation_ts_message_at = 0;
  do
  :: market_operation_ts_message_at < 4 -> assert(market_operation_ts_message_read.end_keyword[market_operation_ts_message_at] == market_operation_ts_message_written.end_keyword[market_operation_ts_message_at]); market_operation_ts_message_at = market_operation_ts_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Issue Closing Message: 83 bytes ----------------------------------------- */

/* The data is provided in case of an issue closing per board. */
typedef IssueClosingMessage {
  byte message_sequence_number[4];
  byte board_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte closing_price[8];
  byte closing_price_type_code;
  byte upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[8];
  byte lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[8];
  byte closing_price_weighted_stock_price_average[8];
  byte closing_price_base_price_of_buy_in[8];
  byte closing_price_upper_limit_of_buy_in[8];
  byte closing_price_lower_limit_of_buy_in[8];
  byte end_keyword[4]
};

int issue_closing_message_at;

/* every byte of Issue Closing Message set to one value */
inline fill_issue_closing_message(issue_closing_message_record, issue_closing_message_value) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> issue_closing_message_record.message_sequence_number[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
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
  :: issue_closing_message_at < 4 -> issue_closing_message_record.a_designated_number_for_an_issue_from_krx[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_record.closing_price_type_code = issue_closing_message_value;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_weighted_stock_price_average[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_base_price_of_buy_in[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_upper_limit_of_buy_in[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_lower_limit_of_buy_in[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> issue_closing_message_record.end_keyword[issue_closing_message_at] = issue_closing_message_value; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Issue Closing Message set to where it lies, so a field read out of place says so */
inline ramp_issue_closing_message(issue_closing_message_record, issue_closing_message_base) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> issue_closing_message_record.message_sequence_number[issue_closing_message_at] = (issue_closing_message_base + 0 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 2 -> issue_closing_message_record.board_id[issue_closing_message_at] = (issue_closing_message_base + 4 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 12 -> issue_closing_message_record.isin_code[issue_closing_message_at] = (issue_closing_message_base + 6 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> issue_closing_message_record.a_designated_number_for_an_issue_from_krx[issue_closing_message_at] = (issue_closing_message_base + 18 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price[issue_closing_message_at] = (issue_closing_message_base + 22 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_record.closing_price_type_code = (issue_closing_message_base + 30 + 1) % 256;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = (issue_closing_message_base + 31 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = (issue_closing_message_base + 39 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_weighted_stock_price_average[issue_closing_message_at] = (issue_closing_message_base + 47 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_base_price_of_buy_in[issue_closing_message_at] = (issue_closing_message_base + 55 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_upper_limit_of_buy_in[issue_closing_message_at] = (issue_closing_message_base + 63 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_lower_limit_of_buy_in[issue_closing_message_at] = (issue_closing_message_base + 71 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> issue_closing_message_record.end_keyword[issue_closing_message_at] = (issue_closing_message_base + 79 + issue_closing_message_at + 1) % 256; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Closing Message to the wire, 83 bytes from where the cursor stands */
inline encode_issue_closing_message(issue_closing_message_record) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> wire[at] = issue_closing_message_record.message_sequence_number[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
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
  :: issue_closing_message_at < 4 -> wire[at] = issue_closing_message_record.a_designated_number_for_an_issue_from_krx[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> wire[at] = issue_closing_message_record.closing_price[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_closing_message_record.closing_price_type_code; at = at + 1;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> wire[at] = issue_closing_message_record.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> wire[at] = issue_closing_message_record.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> wire[at] = issue_closing_message_record.closing_price_weighted_stock_price_average[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> wire[at] = issue_closing_message_record.closing_price_base_price_of_buy_in[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> wire[at] = issue_closing_message_record.closing_price_upper_limit_of_buy_in[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> wire[at] = issue_closing_message_record.closing_price_lower_limit_of_buy_in[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> wire[at] = issue_closing_message_record.end_keyword[issue_closing_message_at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Closing Message off the wire, 83 bytes from where the cursor stands */
inline decode_issue_closing_message(issue_closing_message_record) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> issue_closing_message_record.message_sequence_number[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
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
  :: issue_closing_message_at < 4 -> issue_closing_message_record.a_designated_number_for_an_issue_from_krx[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_record.closing_price_type_code = wire[at]; at = at + 1;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_weighted_stock_price_average[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_base_price_of_buy_in[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_upper_limit_of_buy_in[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> issue_closing_message_record.closing_price_lower_limit_of_buy_in[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> issue_closing_message_record.end_keyword[issue_closing_message_at] = wire[at]; at = at + 1; issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Issue Closing Message is what was written, byte for byte */
inline equal_issue_closing_message(issue_closing_message_read, issue_closing_message_written) {
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> assert(issue_closing_message_read.message_sequence_number[issue_closing_message_at] == issue_closing_message_written.message_sequence_number[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
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
  :: issue_closing_message_at < 4 -> assert(issue_closing_message_read.a_designated_number_for_an_issue_from_krx[issue_closing_message_at] == issue_closing_message_written.a_designated_number_for_an_issue_from_krx[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> assert(issue_closing_message_read.closing_price[issue_closing_message_at] == issue_closing_message_written.closing_price[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  assert(issue_closing_message_read.closing_price_type_code == issue_closing_message_written.closing_price_type_code);
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> assert(issue_closing_message_read.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] == issue_closing_message_written.upper_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> assert(issue_closing_message_read.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at] == issue_closing_message_written.lower_limit_price_on_the_single_price_trade_in_the_off_hours_session[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> assert(issue_closing_message_read.closing_price_weighted_stock_price_average[issue_closing_message_at] == issue_closing_message_written.closing_price_weighted_stock_price_average[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> assert(issue_closing_message_read.closing_price_base_price_of_buy_in[issue_closing_message_at] == issue_closing_message_written.closing_price_base_price_of_buy_in[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> assert(issue_closing_message_read.closing_price_upper_limit_of_buy_in[issue_closing_message_at] == issue_closing_message_written.closing_price_upper_limit_of_buy_in[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 8 -> assert(issue_closing_message_read.closing_price_lower_limit_of_buy_in[issue_closing_message_at] == issue_closing_message_written.closing_price_lower_limit_of_buy_in[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  issue_closing_message_at = 0;
  do
  :: issue_closing_message_at < 4 -> assert(issue_closing_message_read.end_keyword[issue_closing_message_at] == issue_closing_message_written.end_keyword[issue_closing_message_at]); issue_closing_message_at = issue_closing_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Triggering Removing Vi Message: 89 bytes -------------------------------- */

/* Triggering/removing VI (Volatility Interruption). */
typedef TriggeringRemovingViMessage {
  byte message_sequence_number[4];
  byte board_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte processing_time_of_trading_system[12];
  byte the_time_ending_vi[9];
  byte vi_status_code;
  byte vi_type_code;
  byte a_base_price_to_trigger_static_vi[8];
  byte a_base_price_to_trigger_dynamic_vi[8];
  byte vi_triggering_price[8];
  byte disparate_ratio_to_trigger_static_vi[8];
  byte disparate_ratio_to_trigger_dynamic_vi[8];
  byte end_keyword[4]
};

int triggering_removing_vi_message_at;

/* every byte of Triggering Removing Vi Message set to one value */
inline fill_triggering_removing_vi_message(triggering_removing_vi_message_record, triggering_removing_vi_message_value) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> triggering_removing_vi_message_record.message_sequence_number[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
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
  :: triggering_removing_vi_message_at < 4 -> triggering_removing_vi_message_record.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
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
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.vi_triggering_price[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> triggering_removing_vi_message_record.end_keyword[triggering_removing_vi_message_at] = triggering_removing_vi_message_value; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Triggering Removing Vi Message set to where it lies, so a field read out of place says so */
inline ramp_triggering_removing_vi_message(triggering_removing_vi_message_record, triggering_removing_vi_message_base) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> triggering_removing_vi_message_record.message_sequence_number[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 0 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 2 -> triggering_removing_vi_message_record.board_id[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 4 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> triggering_removing_vi_message_record.isin_code[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 6 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> triggering_removing_vi_message_record.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 18 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 12 -> triggering_removing_vi_message_record.processing_time_of_trading_system[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 22 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 9 -> triggering_removing_vi_message_record.the_time_ending_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 34 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_record.vi_status_code = (triggering_removing_vi_message_base + 43 + 1) % 256;
  triggering_removing_vi_message_record.vi_type_code = (triggering_removing_vi_message_base + 44 + 1) % 256;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 45 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 53 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.vi_triggering_price[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 61 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 69 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 77 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> triggering_removing_vi_message_record.end_keyword[triggering_removing_vi_message_at] = (triggering_removing_vi_message_base + 85 + triggering_removing_vi_message_at + 1) % 256; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  skip
}

/* Triggering Removing Vi Message to the wire, 89 bytes from where the cursor stands */
inline encode_triggering_removing_vi_message(triggering_removing_vi_message_record) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> wire[at] = triggering_removing_vi_message_record.message_sequence_number[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
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
  :: triggering_removing_vi_message_at < 4 -> wire[at] = triggering_removing_vi_message_record.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
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
  :: triggering_removing_vi_message_at < 8 -> wire[at] = triggering_removing_vi_message_record.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> wire[at] = triggering_removing_vi_message_record.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> wire[at] = triggering_removing_vi_message_record.vi_triggering_price[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> wire[at] = triggering_removing_vi_message_record.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> wire[at] = triggering_removing_vi_message_record.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> wire[at] = triggering_removing_vi_message_record.end_keyword[triggering_removing_vi_message_at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  skip
}

/* Triggering Removing Vi Message off the wire, 89 bytes from where the cursor stands */
inline decode_triggering_removing_vi_message(triggering_removing_vi_message_record) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> triggering_removing_vi_message_record.message_sequence_number[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
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
  :: triggering_removing_vi_message_at < 4 -> triggering_removing_vi_message_record.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
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
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.vi_triggering_price[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> triggering_removing_vi_message_record.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> triggering_removing_vi_message_record.end_keyword[triggering_removing_vi_message_at] = wire[at]; at = at + 1; triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Triggering Removing Vi Message is what was written, byte for byte */
inline equal_triggering_removing_vi_message(triggering_removing_vi_message_read, triggering_removing_vi_message_written) {
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> assert(triggering_removing_vi_message_read.message_sequence_number[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.message_sequence_number[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
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
  :: triggering_removing_vi_message_at < 4 -> assert(triggering_removing_vi_message_read.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.a_designated_number_for_an_issue_from_krx[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
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
  :: triggering_removing_vi_message_at < 8 -> assert(triggering_removing_vi_message_read.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.a_base_price_to_trigger_static_vi[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> assert(triggering_removing_vi_message_read.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.a_base_price_to_trigger_dynamic_vi[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> assert(triggering_removing_vi_message_read.vi_triggering_price[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.vi_triggering_price[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> assert(triggering_removing_vi_message_read.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.disparate_ratio_to_trigger_static_vi[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 8 -> assert(triggering_removing_vi_message_read.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.disparate_ratio_to_trigger_dynamic_vi[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  triggering_removing_vi_message_at = 0;
  do
  :: triggering_removing_vi_message_at < 4 -> assert(triggering_removing_vi_message_read.end_keyword[triggering_removing_vi_message_at] == triggering_removing_vi_message_written.end_keyword[triggering_removing_vi_message_at]); triggering_removing_vi_message_at = triggering_removing_vi_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Closing Price Trading Quote Message: 42 bytes --------------------------- */

/* Total Ask/Bid volume per Issue on Closing Price Trade. */
typedef ClosingPriceTradingQuoteMessage {
  byte message_sequence_number[4];
  byte board_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte total_ask_volume[8];
  byte total_bid_volume[8];
  byte end_keyword[4]
};

int closing_price_trading_quote_message_at;

/* every byte of Closing Price Trading Quote Message set to one value */
inline fill_closing_price_trading_quote_message(closing_price_trading_quote_message_record, closing_price_trading_quote_message_value) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> closing_price_trading_quote_message_record.message_sequence_number[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
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
  :: closing_price_trading_quote_message_at < 4 -> closing_price_trading_quote_message_record.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> closing_price_trading_quote_message_record.total_ask_volume[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> closing_price_trading_quote_message_record.total_bid_volume[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> closing_price_trading_quote_message_record.end_keyword[closing_price_trading_quote_message_at] = closing_price_trading_quote_message_value; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Closing Price Trading Quote Message set to where it lies, so a field read out of place says so */
inline ramp_closing_price_trading_quote_message(closing_price_trading_quote_message_record, closing_price_trading_quote_message_base) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> closing_price_trading_quote_message_record.message_sequence_number[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 0 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 2 -> closing_price_trading_quote_message_record.board_id[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 4 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 12 -> closing_price_trading_quote_message_record.isin_code[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 6 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> closing_price_trading_quote_message_record.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 18 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> closing_price_trading_quote_message_record.total_ask_volume[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 22 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> closing_price_trading_quote_message_record.total_bid_volume[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 30 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> closing_price_trading_quote_message_record.end_keyword[closing_price_trading_quote_message_at] = (closing_price_trading_quote_message_base + 38 + closing_price_trading_quote_message_at + 1) % 256; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Trading Quote Message to the wire, 42 bytes from where the cursor stands */
inline encode_closing_price_trading_quote_message(closing_price_trading_quote_message_record) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> wire[at] = closing_price_trading_quote_message_record.message_sequence_number[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
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
  :: closing_price_trading_quote_message_at < 4 -> wire[at] = closing_price_trading_quote_message_record.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> wire[at] = closing_price_trading_quote_message_record.total_ask_volume[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> wire[at] = closing_price_trading_quote_message_record.total_bid_volume[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> wire[at] = closing_price_trading_quote_message_record.end_keyword[closing_price_trading_quote_message_at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Trading Quote Message off the wire, 42 bytes from where the cursor stands */
inline decode_closing_price_trading_quote_message(closing_price_trading_quote_message_record) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> closing_price_trading_quote_message_record.message_sequence_number[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
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
  :: closing_price_trading_quote_message_at < 4 -> closing_price_trading_quote_message_record.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> closing_price_trading_quote_message_record.total_ask_volume[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> closing_price_trading_quote_message_record.total_bid_volume[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> closing_price_trading_quote_message_record.end_keyword[closing_price_trading_quote_message_at] = wire[at]; at = at + 1; closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Closing Price Trading Quote Message is what was written, byte for byte */
inline equal_closing_price_trading_quote_message(closing_price_trading_quote_message_read, closing_price_trading_quote_message_written) {
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> assert(closing_price_trading_quote_message_read.message_sequence_number[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.message_sequence_number[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
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
  :: closing_price_trading_quote_message_at < 4 -> assert(closing_price_trading_quote_message_read.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.a_designated_number_for_an_issue_from_krx[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> assert(closing_price_trading_quote_message_read.total_ask_volume[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.total_ask_volume[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 8 -> assert(closing_price_trading_quote_message_read.total_bid_volume[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.total_bid_volume[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
  closing_price_trading_quote_message_at = 0;
  do
  :: closing_price_trading_quote_message_at < 4 -> assert(closing_price_trading_quote_message_read.end_keyword[closing_price_trading_quote_message_at] == closing_price_trading_quote_message_written.end_keyword[closing_price_trading_quote_message_at]); closing_price_trading_quote_message_at = closing_price_trading_quote_message_at + 1
  :: else -> break
  od;
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
    assert(at == 8);
    at = 0;
    decode_polling_data_message(polling_data_message_got);
    assert(at == 8);
    equal_polling_data_message(polling_data_message_got, polling_data_message_sent)
  }
}

/* Securities Quote Mm Lp Quotes Included 10 Level Message: encoded, read back, and compared */
proctype check_securities_quote_mm_lp_quotes_included10_level_message() {
  SecuritiesQuoteMmLpQuotesIncluded10LevelMessage securities_quote_mm_lp_quotes_included10_level_message_sent;
  SecuritiesQuoteMmLpQuotesIncluded10LevelMessage securities_quote_mm_lp_quotes_included10_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_sent, 0)
  :: pattern == 1 -> fill_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_sent, 32)
  :: pattern == 2 -> fill_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_sent, 255)
  :: else -> ramp_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_sent);
    assert(at == 576);
    at = 0;
    decode_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_got);
    assert(at == 576);
    equal_securities_quote_mm_lp_quotes_included10_level_message(securities_quote_mm_lp_quotes_included10_level_message_got, securities_quote_mm_lp_quotes_included10_level_message_sent)
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
    assert(at == 138);
    at = 0;
    decode_securities_order_filled_message(securities_order_filled_message_got);
    assert(at == 138);
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
    assert(at == 59);
    at = 0;
    decode_market_operation_ts_message(market_operation_ts_message_got);
    assert(at == 59);
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
    assert(at == 83);
    at = 0;
    decode_issue_closing_message(issue_closing_message_got);
    assert(at == 83);
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
    assert(at == 89);
    at = 0;
    decode_triggering_removing_vi_message(triggering_removing_vi_message_got);
    assert(at == 89);
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
    assert(at == 42);
    at = 0;
    decode_closing_price_trading_quote_message(closing_price_trading_quote_message_got);
    assert(at == 42);
    equal_closing_price_trading_quote_message(closing_price_trading_quote_message_got, closing_price_trading_quote_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_polling_data_message()
  :: run check_securities_quote_mm_lp_quotes_included10_level_message()
  :: run check_securities_order_filled_message()
  :: run check_market_operation_ts_message()
  :: run check_issue_closing_message()
  :: run check_triggering_removing_vi_message()
  :: run check_closing_price_trading_quote_message()
  fi
}
