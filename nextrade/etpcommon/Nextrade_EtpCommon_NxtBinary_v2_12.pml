/*
 * Nextrade Nextrade Etp Market Data Common
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
#define WIRE 654

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

/* ---- Equities Snapshot Mm Lp Quotes Included 10 Level Message: 654 bytes ----- */

/* Snapshot and final status are provided with certain intervals per issue and board - MM/LP Quotes Included * 10 Level Best Order on Ask/Bid. */
typedef EquitiesSnapshotMmLpQuotesIncluded10LevelMessage {
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte price_change_against_previous_day;
  byte a_price_change_against_the_previous_day[8];
  byte upper_limit_price[8];
  byte lower_limit_price[8];
  byte current_price[8];
  byte opening_price[8];
  byte todays_high[8];
  byte todays_low[8];
  byte accumulated_trading_volume[8];
  byte accumulated_trading_value[16];
  byte final_ask_bid_type_code;
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
  byte closing_price_type_code;
  byte trading_halt;
  byte knock_out_elw_type_code;
  byte knock_out_elw_triggering_time[9];
  byte mid_price[8];
  byte total_mid_price_ask_volume_total_ask_volume_on_mid_price[8];
  byte total_mid_price_bid_volume_total_bid_volume_on_mid_price[8];
  byte end_keyword[4]
};

int equities_snapshot_mm_lp_quotes_included10_level_message_at;

/* every byte of Equities Snapshot Mm Lp Quotes Included 10 Level Message set to one value */
inline fill_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_record, equities_snapshot_mm_lp_quotes_included10_level_message_value) {
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.board_id[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.session_id[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 12 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.isin_code[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.a_designated_number_for_an_issue_from_krx[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.price_change_against_previous_day = equities_snapshot_mm_lp_quotes_included10_level_message_value;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.a_price_change_against_the_previous_day[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.upper_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lower_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.current_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.opening_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.todays_high[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.todays_low[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.accumulated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 16 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.accumulated_trading_value[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.final_ask_bid_type_code = equities_snapshot_mm_lp_quotes_included10_level_message_value;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_ask_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_bid_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.estimated_trading_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.estimated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.closing_price_type_code = equities_snapshot_mm_lp_quotes_included10_level_message_value;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.trading_halt = equities_snapshot_mm_lp_quotes_included10_level_message_value;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.knock_out_elw_type_code = equities_snapshot_mm_lp_quotes_included10_level_message_value;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 9 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.knock_out_elw_triggering_time[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.end_keyword[equities_snapshot_mm_lp_quotes_included10_level_message_at] = equities_snapshot_mm_lp_quotes_included10_level_message_value; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Equities Snapshot Mm Lp Quotes Included 10 Level Message set to where it lies, so a field read out of place says so */
inline ramp_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_record, equities_snapshot_mm_lp_quotes_included10_level_message_base) {
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.board_id[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 0 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.session_id[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 2 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 12 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.isin_code[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 4 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.a_designated_number_for_an_issue_from_krx[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 16 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.price_change_against_previous_day = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 20 + 1) % 256;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.a_price_change_against_the_previous_day[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 21 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.upper_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 29 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lower_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 37 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.current_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 45 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.opening_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 53 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.todays_high[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 61 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.todays_low[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 69 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.accumulated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 77 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 16 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.accumulated_trading_value[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 85 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.final_ask_bid_type_code = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 101 + 1) % 256;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 102 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 110 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 118 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 126 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 134 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 142 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 150 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 158 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 166 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 174 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 182 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 190 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 198 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 206 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 214 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 222 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 230 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 238 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 246 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 254 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 262 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 270 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 278 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 286 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 294 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 302 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 310 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 318 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 326 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 334 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 342 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 350 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 358 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 366 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 374 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 382 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 390 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 398 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 406 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 414 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 422 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 430 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 438 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 446 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 454 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 462 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 470 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 478 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 486 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 494 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 502 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 510 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 518 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 526 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 534 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 542 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 550 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 558 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 566 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 574 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_ask_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 582 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_bid_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 590 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.estimated_trading_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 598 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.estimated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 606 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.closing_price_type_code = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 614 + 1) % 256;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.trading_halt = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 615 + 1) % 256;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.knock_out_elw_type_code = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 616 + 1) % 256;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 9 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.knock_out_elw_triggering_time[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 617 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 626 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 634 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 642 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.end_keyword[equities_snapshot_mm_lp_quotes_included10_level_message_at] = (equities_snapshot_mm_lp_quotes_included10_level_message_base + 650 + equities_snapshot_mm_lp_quotes_included10_level_message_at + 1) % 256; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equities Snapshot Mm Lp Quotes Included 10 Level Message to the wire, 654 bytes from where the cursor stands */
inline encode_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_record) {
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.board_id[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.session_id[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 12 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.isin_code[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.a_designated_number_for_an_issue_from_krx[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.price_change_against_previous_day; at = at + 1;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.a_price_change_against_the_previous_day[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.upper_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lower_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.current_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.opening_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.todays_high[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.todays_low[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.accumulated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 16 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.accumulated_trading_value[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.final_ask_bid_type_code; at = at + 1;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.total_ask_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.total_bid_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.estimated_trading_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.estimated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.closing_price_type_code; at = at + 1;
  wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.trading_halt; at = at + 1;
  wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.knock_out_elw_type_code; at = at + 1;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 9 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.knock_out_elw_triggering_time[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> wire[at] = equities_snapshot_mm_lp_quotes_included10_level_message_record.end_keyword[equities_snapshot_mm_lp_quotes_included10_level_message_at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equities Snapshot Mm Lp Quotes Included 10 Level Message off the wire, 654 bytes from where the cursor stands */
inline decode_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_record) {
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.board_id[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.session_id[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 12 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.isin_code[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.a_designated_number_for_an_issue_from_krx[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.price_change_against_previous_day = wire[at]; at = at + 1;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.a_price_change_against_the_previous_day[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.upper_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lower_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.current_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.opening_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.todays_high[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.todays_low[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.accumulated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 16 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.accumulated_trading_value[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.final_ask_bid_type_code = wire[at]; at = at + 1;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.lp_bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_ask_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_bid_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.estimated_trading_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.estimated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.closing_price_type_code = wire[at]; at = at + 1;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.trading_halt = wire[at]; at = at + 1;
  equities_snapshot_mm_lp_quotes_included10_level_message_record.knock_out_elw_type_code = wire[at]; at = at + 1;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 9 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.knock_out_elw_triggering_time[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> equities_snapshot_mm_lp_quotes_included10_level_message_record.end_keyword[equities_snapshot_mm_lp_quotes_included10_level_message_at] = wire[at]; at = at + 1; equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Equities Snapshot Mm Lp Quotes Included 10 Level Message is what was written, byte for byte */
inline equal_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_read, equities_snapshot_mm_lp_quotes_included10_level_message_written) {
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.board_id[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.board_id[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 2 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.session_id[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.session_id[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 12 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.isin_code[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.isin_code[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.a_designated_number_for_an_issue_from_krx[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.a_designated_number_for_an_issue_from_krx[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.price_change_against_previous_day == equities_snapshot_mm_lp_quotes_included10_level_message_written.price_change_against_previous_day);
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.a_price_change_against_the_previous_day[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.a_price_change_against_the_previous_day[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.upper_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.upper_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lower_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lower_limit_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.current_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.current_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.opening_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.opening_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.todays_high[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.todays_high[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.todays_low[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.todays_low[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.accumulated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.accumulated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 16 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.accumulated_trading_value[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.accumulated_trading_value[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.final_ask_bid_type_code == equities_snapshot_mm_lp_quotes_included10_level_message_written.final_ask_bid_type_code);
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_1_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_1_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_2_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_2_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_3_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_3_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_4_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_4_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_5_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_5_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_6_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_6_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_7_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_7_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_8_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_8_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_9_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_9_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_10_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_ask_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.lp_bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.lp_bid_level_10_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.total_ask_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.total_ask_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.total_bid_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.total_bid_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.estimated_trading_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.estimated_trading_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.estimated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.estimated_trading_volume[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.closing_price_type_code == equities_snapshot_mm_lp_quotes_included10_level_message_written.closing_price_type_code);
  assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.trading_halt == equities_snapshot_mm_lp_quotes_included10_level_message_written.trading_halt);
  assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.knock_out_elw_type_code == equities_snapshot_mm_lp_quotes_included10_level_message_written.knock_out_elw_type_code);
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 9 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.knock_out_elw_triggering_time[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.knock_out_elw_triggering_time[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.total_mid_price_ask_volume_total_ask_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 8 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.total_mid_price_bid_volume_total_bid_volume_on_mid_price[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  equities_snapshot_mm_lp_quotes_included10_level_message_at = 0;
  do
  :: equities_snapshot_mm_lp_quotes_included10_level_message_at < 4 -> assert(equities_snapshot_mm_lp_quotes_included10_level_message_read.end_keyword[equities_snapshot_mm_lp_quotes_included10_level_message_at] == equities_snapshot_mm_lp_quotes_included10_level_message_written.end_keyword[equities_snapshot_mm_lp_quotes_included10_level_message_at]); equities_snapshot_mm_lp_quotes_included10_level_message_at = equities_snapshot_mm_lp_quotes_included10_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Investor Activities Per Commodities Message: 62 bytes ------------------- */

/* Investor Activities per Commodities. */
typedef InvestorActivitiesPerCommoditiesMessage {
  byte calculation_time[6];
  byte investor_code[4];
  byte accumulated_ask_trading_volume[8];
  byte accumulated_ask_trading_value[16];
  byte accumulated_bid_trading_volume[8];
  byte accumulated_bid_trading_value[16];
  byte end_keyword[4]
};

int investor_activities_per_commodities_message_at;

/* every byte of Investor Activities Per Commodities Message set to one value */
inline fill_investor_activities_per_commodities_message(investor_activities_per_commodities_message_record, investor_activities_per_commodities_message_value) {
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 6 -> investor_activities_per_commodities_message_record.calculation_time[investor_activities_per_commodities_message_at] = investor_activities_per_commodities_message_value; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> investor_activities_per_commodities_message_record.investor_code[investor_activities_per_commodities_message_at] = investor_activities_per_commodities_message_value; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> investor_activities_per_commodities_message_record.accumulated_ask_trading_volume[investor_activities_per_commodities_message_at] = investor_activities_per_commodities_message_value; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> investor_activities_per_commodities_message_record.accumulated_ask_trading_value[investor_activities_per_commodities_message_at] = investor_activities_per_commodities_message_value; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> investor_activities_per_commodities_message_record.accumulated_bid_trading_volume[investor_activities_per_commodities_message_at] = investor_activities_per_commodities_message_value; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> investor_activities_per_commodities_message_record.accumulated_bid_trading_value[investor_activities_per_commodities_message_at] = investor_activities_per_commodities_message_value; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> investor_activities_per_commodities_message_record.end_keyword[investor_activities_per_commodities_message_at] = investor_activities_per_commodities_message_value; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Investor Activities Per Commodities Message set to where it lies, so a field read out of place says so */
inline ramp_investor_activities_per_commodities_message(investor_activities_per_commodities_message_record, investor_activities_per_commodities_message_base) {
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 6 -> investor_activities_per_commodities_message_record.calculation_time[investor_activities_per_commodities_message_at] = (investor_activities_per_commodities_message_base + 0 + investor_activities_per_commodities_message_at + 1) % 256; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> investor_activities_per_commodities_message_record.investor_code[investor_activities_per_commodities_message_at] = (investor_activities_per_commodities_message_base + 6 + investor_activities_per_commodities_message_at + 1) % 256; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> investor_activities_per_commodities_message_record.accumulated_ask_trading_volume[investor_activities_per_commodities_message_at] = (investor_activities_per_commodities_message_base + 10 + investor_activities_per_commodities_message_at + 1) % 256; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> investor_activities_per_commodities_message_record.accumulated_ask_trading_value[investor_activities_per_commodities_message_at] = (investor_activities_per_commodities_message_base + 18 + investor_activities_per_commodities_message_at + 1) % 256; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> investor_activities_per_commodities_message_record.accumulated_bid_trading_volume[investor_activities_per_commodities_message_at] = (investor_activities_per_commodities_message_base + 34 + investor_activities_per_commodities_message_at + 1) % 256; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> investor_activities_per_commodities_message_record.accumulated_bid_trading_value[investor_activities_per_commodities_message_at] = (investor_activities_per_commodities_message_base + 42 + investor_activities_per_commodities_message_at + 1) % 256; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> investor_activities_per_commodities_message_record.end_keyword[investor_activities_per_commodities_message_at] = (investor_activities_per_commodities_message_base + 58 + investor_activities_per_commodities_message_at + 1) % 256; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  skip
}

/* Investor Activities Per Commodities Message to the wire, 62 bytes from where the cursor stands */
inline encode_investor_activities_per_commodities_message(investor_activities_per_commodities_message_record) {
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 6 -> wire[at] = investor_activities_per_commodities_message_record.calculation_time[investor_activities_per_commodities_message_at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> wire[at] = investor_activities_per_commodities_message_record.investor_code[investor_activities_per_commodities_message_at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> wire[at] = investor_activities_per_commodities_message_record.accumulated_ask_trading_volume[investor_activities_per_commodities_message_at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> wire[at] = investor_activities_per_commodities_message_record.accumulated_ask_trading_value[investor_activities_per_commodities_message_at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> wire[at] = investor_activities_per_commodities_message_record.accumulated_bid_trading_volume[investor_activities_per_commodities_message_at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> wire[at] = investor_activities_per_commodities_message_record.accumulated_bid_trading_value[investor_activities_per_commodities_message_at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> wire[at] = investor_activities_per_commodities_message_record.end_keyword[investor_activities_per_commodities_message_at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  skip
}

/* Investor Activities Per Commodities Message off the wire, 62 bytes from where the cursor stands */
inline decode_investor_activities_per_commodities_message(investor_activities_per_commodities_message_record) {
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 6 -> investor_activities_per_commodities_message_record.calculation_time[investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> investor_activities_per_commodities_message_record.investor_code[investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> investor_activities_per_commodities_message_record.accumulated_ask_trading_volume[investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> investor_activities_per_commodities_message_record.accumulated_ask_trading_value[investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> investor_activities_per_commodities_message_record.accumulated_bid_trading_volume[investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> investor_activities_per_commodities_message_record.accumulated_bid_trading_value[investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> investor_activities_per_commodities_message_record.end_keyword[investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Investor Activities Per Commodities Message is what was written, byte for byte */
inline equal_investor_activities_per_commodities_message(investor_activities_per_commodities_message_read, investor_activities_per_commodities_message_written) {
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 6 -> assert(investor_activities_per_commodities_message_read.calculation_time[investor_activities_per_commodities_message_at] == investor_activities_per_commodities_message_written.calculation_time[investor_activities_per_commodities_message_at]); investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> assert(investor_activities_per_commodities_message_read.investor_code[investor_activities_per_commodities_message_at] == investor_activities_per_commodities_message_written.investor_code[investor_activities_per_commodities_message_at]); investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> assert(investor_activities_per_commodities_message_read.accumulated_ask_trading_volume[investor_activities_per_commodities_message_at] == investor_activities_per_commodities_message_written.accumulated_ask_trading_volume[investor_activities_per_commodities_message_at]); investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> assert(investor_activities_per_commodities_message_read.accumulated_ask_trading_value[investor_activities_per_commodities_message_at] == investor_activities_per_commodities_message_written.accumulated_ask_trading_value[investor_activities_per_commodities_message_at]); investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 8 -> assert(investor_activities_per_commodities_message_read.accumulated_bid_trading_volume[investor_activities_per_commodities_message_at] == investor_activities_per_commodities_message_written.accumulated_bid_trading_volume[investor_activities_per_commodities_message_at]); investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 16 -> assert(investor_activities_per_commodities_message_read.accumulated_bid_trading_value[investor_activities_per_commodities_message_at] == investor_activities_per_commodities_message_written.accumulated_bid_trading_value[investor_activities_per_commodities_message_at]); investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  investor_activities_per_commodities_message_at = 0;
  do
  :: investor_activities_per_commodities_message_at < 4 -> assert(investor_activities_per_commodities_message_read.end_keyword[investor_activities_per_commodities_message_at] == investor_activities_per_commodities_message_written.end_keyword[investor_activities_per_commodities_message_at]); investor_activities_per_commodities_message_at = investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Etp Constituents Message: 203 bytes ------------------------------------- */

/* Constituents of Structured Products. */
typedef EtpConstituentsMessage {
  byte message_sequence_number[4];
  byte index_calculation_institution_type_code[2];
  byte index_market_classification_id[6];
  byte index_sequence_number[3];
  byte index_leverage_inverse_type_code[2];
  byte index_name[80];
  byte index_name_in_en[80];
  byte index_asset_classification_id_1[6];
  byte index_asset_classification_id_2[6];
  byte index_id[6];
  byte filler_4[4];
  byte end_keyword[4]
};

int etp_constituents_message_at;

/* every byte of Etp Constituents Message set to one value */
inline fill_etp_constituents_message(etp_constituents_message_record, etp_constituents_message_value) {
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> etp_constituents_message_record.message_sequence_number[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> etp_constituents_message_record.index_calculation_institution_type_code[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_market_classification_id[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 3 -> etp_constituents_message_record.index_sequence_number[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> etp_constituents_message_record.index_leverage_inverse_type_code[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> etp_constituents_message_record.index_name[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> etp_constituents_message_record.index_name_in_en[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_asset_classification_id_1[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_asset_classification_id_2[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_id[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> etp_constituents_message_record.filler_4[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> etp_constituents_message_record.end_keyword[etp_constituents_message_at] = etp_constituents_message_value; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Etp Constituents Message set to where it lies, so a field read out of place says so */
inline ramp_etp_constituents_message(etp_constituents_message_record, etp_constituents_message_base) {
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> etp_constituents_message_record.message_sequence_number[etp_constituents_message_at] = (etp_constituents_message_base + 0 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> etp_constituents_message_record.index_calculation_institution_type_code[etp_constituents_message_at] = (etp_constituents_message_base + 4 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_market_classification_id[etp_constituents_message_at] = (etp_constituents_message_base + 6 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 3 -> etp_constituents_message_record.index_sequence_number[etp_constituents_message_at] = (etp_constituents_message_base + 12 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> etp_constituents_message_record.index_leverage_inverse_type_code[etp_constituents_message_at] = (etp_constituents_message_base + 15 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> etp_constituents_message_record.index_name[etp_constituents_message_at] = (etp_constituents_message_base + 17 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> etp_constituents_message_record.index_name_in_en[etp_constituents_message_at] = (etp_constituents_message_base + 97 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_asset_classification_id_1[etp_constituents_message_at] = (etp_constituents_message_base + 177 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_asset_classification_id_2[etp_constituents_message_at] = (etp_constituents_message_base + 183 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_id[etp_constituents_message_at] = (etp_constituents_message_base + 189 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> etp_constituents_message_record.filler_4[etp_constituents_message_at] = (etp_constituents_message_base + 195 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> etp_constituents_message_record.end_keyword[etp_constituents_message_at] = (etp_constituents_message_base + 199 + etp_constituents_message_at + 1) % 256; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  skip
}

/* Etp Constituents Message to the wire, 203 bytes from where the cursor stands */
inline encode_etp_constituents_message(etp_constituents_message_record) {
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> wire[at] = etp_constituents_message_record.message_sequence_number[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> wire[at] = etp_constituents_message_record.index_calculation_institution_type_code[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> wire[at] = etp_constituents_message_record.index_market_classification_id[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 3 -> wire[at] = etp_constituents_message_record.index_sequence_number[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> wire[at] = etp_constituents_message_record.index_leverage_inverse_type_code[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> wire[at] = etp_constituents_message_record.index_name[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> wire[at] = etp_constituents_message_record.index_name_in_en[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> wire[at] = etp_constituents_message_record.index_asset_classification_id_1[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> wire[at] = etp_constituents_message_record.index_asset_classification_id_2[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> wire[at] = etp_constituents_message_record.index_id[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> wire[at] = etp_constituents_message_record.filler_4[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> wire[at] = etp_constituents_message_record.end_keyword[etp_constituents_message_at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  skip
}

/* Etp Constituents Message off the wire, 203 bytes from where the cursor stands */
inline decode_etp_constituents_message(etp_constituents_message_record) {
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> etp_constituents_message_record.message_sequence_number[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> etp_constituents_message_record.index_calculation_institution_type_code[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_market_classification_id[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 3 -> etp_constituents_message_record.index_sequence_number[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> etp_constituents_message_record.index_leverage_inverse_type_code[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> etp_constituents_message_record.index_name[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> etp_constituents_message_record.index_name_in_en[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_asset_classification_id_1[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_asset_classification_id_2[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> etp_constituents_message_record.index_id[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> etp_constituents_message_record.filler_4[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> etp_constituents_message_record.end_keyword[etp_constituents_message_at] = wire[at]; at = at + 1; etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Etp Constituents Message is what was written, byte for byte */
inline equal_etp_constituents_message(etp_constituents_message_read, etp_constituents_message_written) {
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> assert(etp_constituents_message_read.message_sequence_number[etp_constituents_message_at] == etp_constituents_message_written.message_sequence_number[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> assert(etp_constituents_message_read.index_calculation_institution_type_code[etp_constituents_message_at] == etp_constituents_message_written.index_calculation_institution_type_code[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> assert(etp_constituents_message_read.index_market_classification_id[etp_constituents_message_at] == etp_constituents_message_written.index_market_classification_id[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 3 -> assert(etp_constituents_message_read.index_sequence_number[etp_constituents_message_at] == etp_constituents_message_written.index_sequence_number[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 2 -> assert(etp_constituents_message_read.index_leverage_inverse_type_code[etp_constituents_message_at] == etp_constituents_message_written.index_leverage_inverse_type_code[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> assert(etp_constituents_message_read.index_name[etp_constituents_message_at] == etp_constituents_message_written.index_name[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 80 -> assert(etp_constituents_message_read.index_name_in_en[etp_constituents_message_at] == etp_constituents_message_written.index_name_in_en[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> assert(etp_constituents_message_read.index_asset_classification_id_1[etp_constituents_message_at] == etp_constituents_message_written.index_asset_classification_id_1[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> assert(etp_constituents_message_read.index_asset_classification_id_2[etp_constituents_message_at] == etp_constituents_message_written.index_asset_classification_id_2[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 6 -> assert(etp_constituents_message_read.index_id[etp_constituents_message_at] == etp_constituents_message_written.index_id[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> assert(etp_constituents_message_read.filler_4[etp_constituents_message_at] == etp_constituents_message_written.filler_4[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  etp_constituents_message_at = 0;
  do
  :: etp_constituents_message_at < 4 -> assert(etp_constituents_message_read.end_keyword[etp_constituents_message_at] == etp_constituents_message_written.end_keyword[etp_constituents_message_at]); etp_constituents_message_at = etp_constituents_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mm Lp Information Message: 169 bytes ------------------------------------ */

/* Details. */
typedef MmLpInformationMessage {
  byte message_sequence_number[4];
  byte isin_code[12];
  byte market_participant_number[5];
  byte board_id[2];
  byte market_making_lp_type_code;
  byte lp_start_date[8];
  byte lp_end_date[8];
  byte minimum_order_volume[8];
  byte maximum_volume_of_multiple_order[8];
  byte bid_ask_spread_unit_code;
  byte main_market_bid_ask_spread_value[16];
  byte spread_multiple_for_market_holidays[8];
  byte an_obligatory_time_interval_to_place_an_order[4];
  byte minimum_ask_price[16];
  byte maximum_bid_price[16];
  byte minimum_order_price[16];
  byte maximum_order_price[16];
  byte extended_market_bid_ask_spread_value[16];
  byte end_keyword[4]
};

int mm_lp_information_message_at;

/* every byte of Mm Lp Information Message set to one value */
inline fill_mm_lp_information_message(mm_lp_information_message_record, mm_lp_information_message_value) {
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> mm_lp_information_message_record.message_sequence_number[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 12 -> mm_lp_information_message_record.isin_code[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 5 -> mm_lp_information_message_record.market_participant_number[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 2 -> mm_lp_information_message_record.board_id[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_record.market_making_lp_type_code = mm_lp_information_message_value;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.lp_start_date[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.lp_end_date[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.minimum_order_volume[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.maximum_volume_of_multiple_order[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_record.bid_ask_spread_unit_code = mm_lp_information_message_value;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.main_market_bid_ask_spread_value[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.spread_multiple_for_market_holidays[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> mm_lp_information_message_record.an_obligatory_time_interval_to_place_an_order[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.minimum_ask_price[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.maximum_bid_price[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.minimum_order_price[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.maximum_order_price[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.extended_market_bid_ask_spread_value[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> mm_lp_information_message_record.end_keyword[mm_lp_information_message_at] = mm_lp_information_message_value; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mm Lp Information Message set to where it lies, so a field read out of place says so */
inline ramp_mm_lp_information_message(mm_lp_information_message_record, mm_lp_information_message_base) {
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> mm_lp_information_message_record.message_sequence_number[mm_lp_information_message_at] = (mm_lp_information_message_base + 0 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 12 -> mm_lp_information_message_record.isin_code[mm_lp_information_message_at] = (mm_lp_information_message_base + 4 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 5 -> mm_lp_information_message_record.market_participant_number[mm_lp_information_message_at] = (mm_lp_information_message_base + 16 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 2 -> mm_lp_information_message_record.board_id[mm_lp_information_message_at] = (mm_lp_information_message_base + 21 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_record.market_making_lp_type_code = (mm_lp_information_message_base + 23 + 1) % 256;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.lp_start_date[mm_lp_information_message_at] = (mm_lp_information_message_base + 24 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.lp_end_date[mm_lp_information_message_at] = (mm_lp_information_message_base + 32 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.minimum_order_volume[mm_lp_information_message_at] = (mm_lp_information_message_base + 40 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.maximum_volume_of_multiple_order[mm_lp_information_message_at] = (mm_lp_information_message_base + 48 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_record.bid_ask_spread_unit_code = (mm_lp_information_message_base + 56 + 1) % 256;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.main_market_bid_ask_spread_value[mm_lp_information_message_at] = (mm_lp_information_message_base + 57 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.spread_multiple_for_market_holidays[mm_lp_information_message_at] = (mm_lp_information_message_base + 73 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> mm_lp_information_message_record.an_obligatory_time_interval_to_place_an_order[mm_lp_information_message_at] = (mm_lp_information_message_base + 81 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.minimum_ask_price[mm_lp_information_message_at] = (mm_lp_information_message_base + 85 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.maximum_bid_price[mm_lp_information_message_at] = (mm_lp_information_message_base + 101 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.minimum_order_price[mm_lp_information_message_at] = (mm_lp_information_message_base + 117 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.maximum_order_price[mm_lp_information_message_at] = (mm_lp_information_message_base + 133 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.extended_market_bid_ask_spread_value[mm_lp_information_message_at] = (mm_lp_information_message_base + 149 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> mm_lp_information_message_record.end_keyword[mm_lp_information_message_at] = (mm_lp_information_message_base + 165 + mm_lp_information_message_at + 1) % 256; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mm Lp Information Message to the wire, 169 bytes from where the cursor stands */
inline encode_mm_lp_information_message(mm_lp_information_message_record) {
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> wire[at] = mm_lp_information_message_record.message_sequence_number[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 12 -> wire[at] = mm_lp_information_message_record.isin_code[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 5 -> wire[at] = mm_lp_information_message_record.market_participant_number[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 2 -> wire[at] = mm_lp_information_message_record.board_id[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  wire[at] = mm_lp_information_message_record.market_making_lp_type_code; at = at + 1;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> wire[at] = mm_lp_information_message_record.lp_start_date[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> wire[at] = mm_lp_information_message_record.lp_end_date[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> wire[at] = mm_lp_information_message_record.minimum_order_volume[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> wire[at] = mm_lp_information_message_record.maximum_volume_of_multiple_order[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  wire[at] = mm_lp_information_message_record.bid_ask_spread_unit_code; at = at + 1;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> wire[at] = mm_lp_information_message_record.main_market_bid_ask_spread_value[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> wire[at] = mm_lp_information_message_record.spread_multiple_for_market_holidays[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> wire[at] = mm_lp_information_message_record.an_obligatory_time_interval_to_place_an_order[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> wire[at] = mm_lp_information_message_record.minimum_ask_price[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> wire[at] = mm_lp_information_message_record.maximum_bid_price[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> wire[at] = mm_lp_information_message_record.minimum_order_price[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> wire[at] = mm_lp_information_message_record.maximum_order_price[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> wire[at] = mm_lp_information_message_record.extended_market_bid_ask_spread_value[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> wire[at] = mm_lp_information_message_record.end_keyword[mm_lp_information_message_at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mm Lp Information Message off the wire, 169 bytes from where the cursor stands */
inline decode_mm_lp_information_message(mm_lp_information_message_record) {
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> mm_lp_information_message_record.message_sequence_number[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 12 -> mm_lp_information_message_record.isin_code[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 5 -> mm_lp_information_message_record.market_participant_number[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 2 -> mm_lp_information_message_record.board_id[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_record.market_making_lp_type_code = wire[at]; at = at + 1;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.lp_start_date[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.lp_end_date[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.minimum_order_volume[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.maximum_volume_of_multiple_order[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_record.bid_ask_spread_unit_code = wire[at]; at = at + 1;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.main_market_bid_ask_spread_value[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> mm_lp_information_message_record.spread_multiple_for_market_holidays[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> mm_lp_information_message_record.an_obligatory_time_interval_to_place_an_order[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.minimum_ask_price[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.maximum_bid_price[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.minimum_order_price[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.maximum_order_price[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> mm_lp_information_message_record.extended_market_bid_ask_spread_value[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> mm_lp_information_message_record.end_keyword[mm_lp_information_message_at] = wire[at]; at = at + 1; mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mm Lp Information Message is what was written, byte for byte */
inline equal_mm_lp_information_message(mm_lp_information_message_read, mm_lp_information_message_written) {
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> assert(mm_lp_information_message_read.message_sequence_number[mm_lp_information_message_at] == mm_lp_information_message_written.message_sequence_number[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 12 -> assert(mm_lp_information_message_read.isin_code[mm_lp_information_message_at] == mm_lp_information_message_written.isin_code[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 5 -> assert(mm_lp_information_message_read.market_participant_number[mm_lp_information_message_at] == mm_lp_information_message_written.market_participant_number[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 2 -> assert(mm_lp_information_message_read.board_id[mm_lp_information_message_at] == mm_lp_information_message_written.board_id[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  assert(mm_lp_information_message_read.market_making_lp_type_code == mm_lp_information_message_written.market_making_lp_type_code);
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> assert(mm_lp_information_message_read.lp_start_date[mm_lp_information_message_at] == mm_lp_information_message_written.lp_start_date[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> assert(mm_lp_information_message_read.lp_end_date[mm_lp_information_message_at] == mm_lp_information_message_written.lp_end_date[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> assert(mm_lp_information_message_read.minimum_order_volume[mm_lp_information_message_at] == mm_lp_information_message_written.minimum_order_volume[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> assert(mm_lp_information_message_read.maximum_volume_of_multiple_order[mm_lp_information_message_at] == mm_lp_information_message_written.maximum_volume_of_multiple_order[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  assert(mm_lp_information_message_read.bid_ask_spread_unit_code == mm_lp_information_message_written.bid_ask_spread_unit_code);
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> assert(mm_lp_information_message_read.main_market_bid_ask_spread_value[mm_lp_information_message_at] == mm_lp_information_message_written.main_market_bid_ask_spread_value[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 8 -> assert(mm_lp_information_message_read.spread_multiple_for_market_holidays[mm_lp_information_message_at] == mm_lp_information_message_written.spread_multiple_for_market_holidays[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> assert(mm_lp_information_message_read.an_obligatory_time_interval_to_place_an_order[mm_lp_information_message_at] == mm_lp_information_message_written.an_obligatory_time_interval_to_place_an_order[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> assert(mm_lp_information_message_read.minimum_ask_price[mm_lp_information_message_at] == mm_lp_information_message_written.minimum_ask_price[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> assert(mm_lp_information_message_read.maximum_bid_price[mm_lp_information_message_at] == mm_lp_information_message_written.maximum_bid_price[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> assert(mm_lp_information_message_read.minimum_order_price[mm_lp_information_message_at] == mm_lp_information_message_written.minimum_order_price[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> assert(mm_lp_information_message_read.maximum_order_price[mm_lp_information_message_at] == mm_lp_information_message_written.maximum_order_price[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 16 -> assert(mm_lp_information_message_read.extended_market_bid_ask_spread_value[mm_lp_information_message_at] == mm_lp_information_message_written.extended_market_bid_ask_spread_value[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  mm_lp_information_message_at = 0;
  do
  :: mm_lp_information_message_at < 4 -> assert(mm_lp_information_message_read.end_keyword[mm_lp_information_message_at] == mm_lp_information_message_written.end_keyword[mm_lp_information_message_at]); mm_lp_information_message_at = mm_lp_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Operation Schedule Message: 82 bytes ----------------------------- */

/* The data is provided when a Market Operation Schedule event is disclosed. */
typedef MarketOperationScheduleMessage {
  byte market_operation_product_id[3];
  byte board_id[2];
  byte board_event_id[3];
  byte start_time_of_a_board_event[9];
  byte board_event_group_code[4];
  byte session_start_end_code[2];
  byte session_id[2];
  byte isin_code[12];
  byte isin_code_of_a_common_stock[12];
  byte product_id[11];
  byte trading_halt_reason_code[3];
  byte trading_halt_type_code;
  byte step_applied[4];
  byte price_limit_range_expansion_for_base_issue_type_code;
  byte expected_time_of_expanding_price_limit_range[9];
  byte end_keyword[4]
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
  :: market_operation_schedule_message_at < 4 -> market_operation_schedule_message_record.board_event_group_code[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
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
  :: market_operation_schedule_message_at < 4 -> market_operation_schedule_message_record.step_applied[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.price_limit_range_expansion_for_base_issue_type_code = market_operation_schedule_message_value;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> market_operation_schedule_message_record.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 4 -> market_operation_schedule_message_record.end_keyword[market_operation_schedule_message_at] = market_operation_schedule_message_value; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
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
  :: market_operation_schedule_message_at < 4 -> market_operation_schedule_message_record.board_event_group_code[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 17 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.session_start_end_code[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 21 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 2 -> market_operation_schedule_message_record.session_id[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 23 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> market_operation_schedule_message_record.isin_code[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 25 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 12 -> market_operation_schedule_message_record.isin_code_of_a_common_stock[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 37 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 11 -> market_operation_schedule_message_record.product_id[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 49 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 3 -> market_operation_schedule_message_record.trading_halt_reason_code[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 60 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.trading_halt_type_code = (market_operation_schedule_message_base + 63 + 1) % 256;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 4 -> market_operation_schedule_message_record.step_applied[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 64 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.price_limit_range_expansion_for_base_issue_type_code = (market_operation_schedule_message_base + 68 + 1) % 256;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> market_operation_schedule_message_record.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 69 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 4 -> market_operation_schedule_message_record.end_keyword[market_operation_schedule_message_at] = (market_operation_schedule_message_base + 78 + market_operation_schedule_message_at + 1) % 256; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Operation Schedule Message to the wire, 82 bytes from where the cursor stands */
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
  :: market_operation_schedule_message_at < 4 -> wire[at] = market_operation_schedule_message_record.board_event_group_code[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
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
  :: market_operation_schedule_message_at < 4 -> wire[at] = market_operation_schedule_message_record.step_applied[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  wire[at] = market_operation_schedule_message_record.price_limit_range_expansion_for_base_issue_type_code; at = at + 1;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> wire[at] = market_operation_schedule_message_record.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 4 -> wire[at] = market_operation_schedule_message_record.end_keyword[market_operation_schedule_message_at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Operation Schedule Message off the wire, 82 bytes from where the cursor stands */
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
  :: market_operation_schedule_message_at < 4 -> market_operation_schedule_message_record.board_event_group_code[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
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
  :: market_operation_schedule_message_at < 4 -> market_operation_schedule_message_record.step_applied[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_record.price_limit_range_expansion_for_base_issue_type_code = wire[at]; at = at + 1;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> market_operation_schedule_message_record.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 4 -> market_operation_schedule_message_record.end_keyword[market_operation_schedule_message_at] = wire[at]; at = at + 1; market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
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
  :: market_operation_schedule_message_at < 4 -> assert(market_operation_schedule_message_read.board_event_group_code[market_operation_schedule_message_at] == market_operation_schedule_message_written.board_event_group_code[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
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
  :: market_operation_schedule_message_at < 4 -> assert(market_operation_schedule_message_read.step_applied[market_operation_schedule_message_at] == market_operation_schedule_message_written.step_applied[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  assert(market_operation_schedule_message_read.price_limit_range_expansion_for_base_issue_type_code == market_operation_schedule_message_written.price_limit_range_expansion_for_base_issue_type_code);
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 9 -> assert(market_operation_schedule_message_read.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at] == market_operation_schedule_message_written.expected_time_of_expanding_price_limit_range[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  market_operation_schedule_message_at = 0;
  do
  :: market_operation_schedule_message_at < 4 -> assert(market_operation_schedule_message_read.end_keyword[market_operation_schedule_message_at] == market_operation_schedule_message_written.end_keyword[market_operation_schedule_message_at]); market_operation_schedule_message_at = market_operation_schedule_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Member Firm Imposing Lifting Sanctions Message: 41 bytes ---------------- */

/* The data is provided when a sanction is imposed on a member firm or lifted. */
typedef MemberFirmImposingLiftingSanctionsMessage {
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte disclosing_data_type_code[3];
  byte disclosure_time[9];
  byte member_number[5];
  byte member_firm_trust_principal_type_code[4];
  byte end_keyword[4]
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
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> member_firm_imposing_lifting_sanctions_message_record.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at] = member_firm_imposing_lifting_sanctions_message_value; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
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
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> member_firm_imposing_lifting_sanctions_message_record.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at] = member_firm_imposing_lifting_sanctions_message_value; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> member_firm_imposing_lifting_sanctions_message_record.end_keyword[member_firm_imposing_lifting_sanctions_message_at] = member_firm_imposing_lifting_sanctions_message_value; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
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
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> member_firm_imposing_lifting_sanctions_message_record.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 12 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 3 -> member_firm_imposing_lifting_sanctions_message_record.disclosing_data_type_code[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 16 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 9 -> member_firm_imposing_lifting_sanctions_message_record.disclosure_time[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 19 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 5 -> member_firm_imposing_lifting_sanctions_message_record.member_number[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 28 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> member_firm_imposing_lifting_sanctions_message_record.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 33 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> member_firm_imposing_lifting_sanctions_message_record.end_keyword[member_firm_imposing_lifting_sanctions_message_at] = (member_firm_imposing_lifting_sanctions_message_base + 37 + member_firm_imposing_lifting_sanctions_message_at + 1) % 256; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
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
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> wire[at] = member_firm_imposing_lifting_sanctions_message_record.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
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
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> wire[at] = member_firm_imposing_lifting_sanctions_message_record.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> wire[at] = member_firm_imposing_lifting_sanctions_message_record.end_keyword[member_firm_imposing_lifting_sanctions_message_at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
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
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> member_firm_imposing_lifting_sanctions_message_record.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at] = wire[at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
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
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> member_firm_imposing_lifting_sanctions_message_record.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at] = wire[at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> member_firm_imposing_lifting_sanctions_message_record.end_keyword[member_firm_imposing_lifting_sanctions_message_at] = wire[at]; at = at + 1; member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
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
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> assert(member_firm_imposing_lifting_sanctions_message_read.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at] == member_firm_imposing_lifting_sanctions_message_written.a_designated_number_for_an_issue_from_krx[member_firm_imposing_lifting_sanctions_message_at]); member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
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
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> assert(member_firm_imposing_lifting_sanctions_message_read.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at] == member_firm_imposing_lifting_sanctions_message_written.member_firm_trust_principal_type_code[member_firm_imposing_lifting_sanctions_message_at]); member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  member_firm_imposing_lifting_sanctions_message_at = 0;
  do
  :: member_firm_imposing_lifting_sanctions_message_at < 4 -> assert(member_firm_imposing_lifting_sanctions_message_read.end_keyword[member_firm_imposing_lifting_sanctions_message_at] == member_firm_imposing_lifting_sanctions_message_written.end_keyword[member_firm_imposing_lifting_sanctions_message_at]); member_firm_imposing_lifting_sanctions_message_at = member_firm_imposing_lifting_sanctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Top Five Traders Activities Message: 310 bytes -------------------------- */

/* Top Five Traders' Activities (including only Regular Board). */
typedef TopFiveTradersActivitiesMessage {
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte member_number_1_for_ask[5];
  byte ask_trading_volume_1[8];
  byte ask_trading_value_1[16];
  byte member_number_1_for_bid[5];
  byte bid_trading_volume_1[8];
  byte bid_trading_value_1[16];
  byte member_number_2_for_ask[5];
  byte ask_trading_volume_2[8];
  byte ask_trading_value_2[16];
  byte member_number_2_for_bid[5];
  byte bid_trading_volume_2[8];
  byte bid_trading_value_2[16];
  byte member_number_3_for_ask[5];
  byte ask_trading_volume_3[8];
  byte ask_trading_value_3[16];
  byte member_number_3_for_bid[5];
  byte bid_trading_volume_3[8];
  byte bid_trading_value_3[16];
  byte member_number_4_for_ask[5];
  byte ask_trading_volume_4[8];
  byte ask_trading_value_4[16];
  byte member_number_4_for_bid[5];
  byte bid_trading_volume_4[8];
  byte bid_trading_value_4[16];
  byte member_number_5_for_ask[5];
  byte ask_trading_volume_5[8];
  byte ask_trading_value_5[16];
  byte member_number_5_for_bid[5];
  byte bid_trading_volume_5[8];
  byte bid_trading_value_5[16];
  byte end_keyword[4]
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
  :: top_five_traders_activities_message_at < 4 -> top_five_traders_activities_message_record.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_1[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_1[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_1[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_1[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_2[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_2[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_2[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_2[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_3[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_3[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_3[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_3[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_4[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_4[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_4[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_4[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_ask[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_5[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_5[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_bid[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_5[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_5[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 4 -> top_five_traders_activities_message_record.end_keyword[top_five_traders_activities_message_at] = top_five_traders_activities_message_value; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
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
  :: top_five_traders_activities_message_at < 4 -> top_five_traders_activities_message_record.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 12 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 16 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_1[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 21 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_1[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 29 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 45 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_1[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 50 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_1[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 58 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 74 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_2[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 79 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_2[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 87 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 103 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_2[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 108 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_2[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 116 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 132 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_3[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 137 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_3[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 145 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 161 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_3[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 166 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_3[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 174 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 190 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_4[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 195 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_4[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 203 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 219 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_4[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 224 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_4[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 232 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_ask[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 248 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_5[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 253 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_5[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 261 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_bid[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 277 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_5[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 282 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_5[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 290 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 4 -> top_five_traders_activities_message_record.end_keyword[top_five_traders_activities_message_at] = (top_five_traders_activities_message_base + 306 + top_five_traders_activities_message_at + 1) % 256; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Five Traders Activities Message to the wire, 310 bytes from where the cursor stands */
inline encode_top_five_traders_activities_message(top_five_traders_activities_message_record) {
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> wire[at] = top_five_traders_activities_message_record.isin_code[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 4 -> wire[at] = top_five_traders_activities_message_record.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_1_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_1[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_1[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_1_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_1[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_1[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_2_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_2[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_2[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_2_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_2[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_2[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_3_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_3[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_3[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_3_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_3[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_3[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_4_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_4[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_4[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_4_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_4[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_4[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_5_for_ask[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.ask_trading_volume_5[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.ask_trading_value_5[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> wire[at] = top_five_traders_activities_message_record.member_number_5_for_bid[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> wire[at] = top_five_traders_activities_message_record.bid_trading_volume_5[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> wire[at] = top_five_traders_activities_message_record.bid_trading_value_5[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 4 -> wire[at] = top_five_traders_activities_message_record.end_keyword[top_five_traders_activities_message_at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Five Traders Activities Message off the wire, 310 bytes from where the cursor stands */
inline decode_top_five_traders_activities_message(top_five_traders_activities_message_record) {
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 12 -> top_five_traders_activities_message_record.isin_code[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 4 -> top_five_traders_activities_message_record.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_1[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_1[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_1_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_1[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_1[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_2[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_2[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_2_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_2[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_2[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_3[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_3[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_3_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_3[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_3[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_4[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_4[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_4_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_4[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_4[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_ask[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.ask_trading_volume_5[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.ask_trading_value_5[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> top_five_traders_activities_message_record.member_number_5_for_bid[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> top_five_traders_activities_message_record.bid_trading_volume_5[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> top_five_traders_activities_message_record.bid_trading_value_5[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 4 -> top_five_traders_activities_message_record.end_keyword[top_five_traders_activities_message_at] = wire[at]; at = at + 1; top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
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
  :: top_five_traders_activities_message_at < 4 -> assert(top_five_traders_activities_message_read.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.a_designated_number_for_an_issue_from_krx[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_1_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_1_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.ask_trading_volume_1[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_1[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.ask_trading_value_1[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_1[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_1_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_1_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.bid_trading_volume_1[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_1[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.bid_trading_value_1[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_1[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_2_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_2_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.ask_trading_volume_2[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_2[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.ask_trading_value_2[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_2[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_2_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_2_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.bid_trading_volume_2[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_2[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.bid_trading_value_2[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_2[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_3_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_3_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.ask_trading_volume_3[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_3[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.ask_trading_value_3[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_3[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_3_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_3_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.bid_trading_volume_3[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_3[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.bid_trading_value_3[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_3[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_4_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_4_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.ask_trading_volume_4[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_4[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.ask_trading_value_4[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_4[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_4_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_4_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.bid_trading_volume_4[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_4[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.bid_trading_value_4[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_4[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_5_for_ask[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_5_for_ask[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.ask_trading_volume_5[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_volume_5[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.ask_trading_value_5[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.ask_trading_value_5[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 5 -> assert(top_five_traders_activities_message_read.member_number_5_for_bid[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.member_number_5_for_bid[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 8 -> assert(top_five_traders_activities_message_read.bid_trading_volume_5[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_volume_5[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 16 -> assert(top_five_traders_activities_message_read.bid_trading_value_5[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.bid_trading_value_5[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  top_five_traders_activities_message_at = 0;
  do
  :: top_five_traders_activities_message_at < 4 -> assert(top_five_traders_activities_message_read.end_keyword[top_five_traders_activities_message_at] == top_five_traders_activities_message_written.end_keyword[top_five_traders_activities_message_at]); top_five_traders_activities_message_at = top_five_traders_activities_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Equities Batch Data Message: 551 bytes ---------------------------------- */

/* Details. */
typedef EquitiesBatchDataMessage {
  byte message_sequence_number[4];
  byte total_number_of_instruments_of_the_contract[4];
  byte business_date[8];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
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
  byte base_price[8];
  byte yesterdays_closing_price_type_code_krx;
  byte yesterdays_closing_price_krx[8];
  byte yesterdays_accumulated_trading_amount[8];
  byte yesterdays_accumulated_trading_value[16];
  byte upper_limit_price[8];
  byte lower_limit_price[8];
  byte substitute_price_of_securities[8];
  byte par_value[8];
  byte issuing_price[8];
  byte listing_date[8];
  byte number_of_listed_shares[8];
  byte liquidation_trade;
  byte the_establishment_date[8];
  byte maturity_date[8];
  byte exercising_period[8];
  byte expiration_date_for_right[8];
  byte exercise_price_of_elw_or_bw[8];
  byte capital[16];
  byte credit_order_possibility;
  byte limit_order_permission_type_code[4];
  byte market_price_order_permission_type_code[4];
  byte conditioned_order_permission_type_code[4];
  byte best_favorable_order_permission_type_code[4];
  byte first_best_order_permission_type[4];
  byte mid_price_order_permission_type_code[4];
  byte stop_limit_price_order_permission_type_code[4];
  byte capital_increase_type_code[2];
  byte other_stock_type_code;
  byte national_stock;
  byte appraised_price[8];
  byte lowest_order_price[8];
  byte highest_order_price[8];
  byte unit_of_volume_in_main_board[8];
  byte lot_size_after_hours_trading[8];
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
  byte etf_tracking_difference[8];
  byte regs;
  byte spac;
  byte tax_type_code;
  byte appraisal_ratio_of_substitute_price[8];
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
  byte upper_limit_quantity[16];
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
  byte yesterdays_closing_price_nxt[8];
  byte competition_board_trade_permission_code[4];
  byte negotiation_possible_or_not_before_main_market;
  byte end_keyword[4]
};

int equities_batch_data_message_at;

/* every byte of Equities Batch Data Message set to one value */
inline fill_equities_batch_data_message(equities_batch_data_message_record, equities_batch_data_message_value) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.message_sequence_number[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.total_number_of_instruments_of_the_contract[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.base_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_krx = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.yesterdays_closing_price_krx[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.yesterdays_accumulated_trading_amount[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.yesterdays_accumulated_trading_value[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.upper_limit_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.lower_limit_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.substitute_price_of_securities[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.par_value[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.issuing_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.listing_date[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.number_of_listed_shares[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.exercise_price_of_elw_or_bw[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.capital[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.credit_order_possibility = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.limit_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.market_price_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.conditioned_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.best_favorable_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.first_best_order_permission_type[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.mid_price_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.stop_limit_price_order_permission_type_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.appraised_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.lowest_order_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.highest_order_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.unit_of_volume_in_main_board[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.lot_size_after_hours_trading[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.etf_tracking_difference[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.regs = equities_batch_data_message_value;
  equities_batch_data_message_record.spac = equities_batch_data_message_value;
  equities_batch_data_message_record.tax_type_code = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.appraisal_ratio_of_substitute_price[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.upper_limit_quantity[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.yesterdays_closing_price_nxt[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.competition_board_trade_permission_code[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.negotiation_possible_or_not_before_main_market = equities_batch_data_message_value;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.end_keyword[equities_batch_data_message_at] = equities_batch_data_message_value; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Equities Batch Data Message set to where it lies, so a field read out of place says so */
inline ramp_equities_batch_data_message(equities_batch_data_message_record, equities_batch_data_message_base) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.message_sequence_number[equities_batch_data_message_at] = (equities_batch_data_message_base + 0 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.total_number_of_instruments_of_the_contract[equities_batch_data_message_at] = (equities_batch_data_message_base + 4 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.business_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 8 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.isin_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 16 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at] = (equities_batch_data_message_base + 28 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 9 -> equities_batch_data_message_record.abbreviated_issue_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 32 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> equities_batch_data_message_record.abbreviated_issue_name[equities_batch_data_message_at] = (equities_batch_data_message_base + 41 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 40 -> equities_batch_data_message_record.abbreviated_issue_name_in_en[equities_batch_data_message_at] = (equities_batch_data_message_base + 81 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.group_number[equities_batch_data_message_at] = (equities_batch_data_message_base + 121 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.market_operation_product_id[equities_batch_data_message_at] = (equities_batch_data_message_base + 126 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.security_group_id[equities_batch_data_message_at] = (equities_batch_data_message_base + 129 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.unit_trading = (equities_batch_data_message_base + 131 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.rights_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 132 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.par_value_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 134 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.an_issue_of_which_base_price_is_settled_with_a_todays_single_price = (equities_batch_data_message_base + 136 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.reevaluation_reason_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 137 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.base_price_change = (equities_batch_data_message_base + 139 + 1) % 256;
  equities_batch_data_message_record.random_end_trigger_code = (equities_batch_data_message_base + 140 + 1) % 256;
  equities_batch_data_message_record.market_alert = (equities_batch_data_message_base + 141 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.market_alert_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 142 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.korea_corporate_governance_stock_price_index_kogi = (equities_batch_data_message_base + 144 + 1) % 256;
  equities_batch_data_message_record.issue_for_administration = (equities_batch_data_message_base + 145 + 1) % 256;
  equities_batch_data_message_record.unfaithful_disclosure = (equities_batch_data_message_base + 146 + 1) % 256;
  equities_batch_data_message_record.back_door_listing = (equities_batch_data_message_base + 147 + 1) % 256;
  equities_batch_data_message_record.trading_halt = (equities_batch_data_message_base + 148 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 10 -> equities_batch_data_message_record.industry_id[equities_batch_data_message_at] = (equities_batch_data_message_base + 149 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.small_medium_sized_business = (equities_batch_data_message_base + 159 + 1) % 256;
  equities_batch_data_message_record.section_type_code = (equities_batch_data_message_base + 160 + 1) % 256;
  equities_batch_data_message_record.investment_institution_type_code = (equities_batch_data_message_base + 161 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.base_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 162 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_krx = (equities_batch_data_message_base + 170 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.yesterdays_closing_price_krx[equities_batch_data_message_at] = (equities_batch_data_message_base + 171 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.yesterdays_accumulated_trading_amount[equities_batch_data_message_at] = (equities_batch_data_message_base + 179 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.yesterdays_accumulated_trading_value[equities_batch_data_message_at] = (equities_batch_data_message_base + 187 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.upper_limit_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 203 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.lower_limit_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 211 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.substitute_price_of_securities[equities_batch_data_message_at] = (equities_batch_data_message_base + 219 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.par_value[equities_batch_data_message_at] = (equities_batch_data_message_base + 227 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.issuing_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 235 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.listing_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 243 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.number_of_listed_shares[equities_batch_data_message_at] = (equities_batch_data_message_base + 251 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.liquidation_trade = (equities_batch_data_message_base + 259 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.the_establishment_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 260 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.maturity_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 268 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.exercising_period[equities_batch_data_message_at] = (equities_batch_data_message_base + 276 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.expiration_date_for_right[equities_batch_data_message_at] = (equities_batch_data_message_base + 284 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.exercise_price_of_elw_or_bw[equities_batch_data_message_at] = (equities_batch_data_message_base + 292 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.capital[equities_batch_data_message_at] = (equities_batch_data_message_base + 300 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.credit_order_possibility = (equities_batch_data_message_base + 316 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.limit_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 317 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.market_price_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 321 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.conditioned_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 325 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.best_favorable_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 329 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.first_best_order_permission_type[equities_batch_data_message_at] = (equities_batch_data_message_base + 333 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.mid_price_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 337 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.stop_limit_price_order_permission_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 341 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.capital_increase_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 345 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.other_stock_type_code = (equities_batch_data_message_base + 347 + 1) % 256;
  equities_batch_data_message_record.national_stock = (equities_batch_data_message_base + 348 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.appraised_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 349 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.lowest_order_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 357 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.highest_order_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 365 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.unit_of_volume_in_main_board[equities_batch_data_message_at] = (equities_batch_data_message_base + 373 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.lot_size_after_hours_trading[equities_batch_data_message_at] = (equities_batch_data_message_base + 381 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.rei_ts_type_code = (equities_batch_data_message_base + 389 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 12 -> equities_batch_data_message_record.target_stock_isin_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 390 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.currency_iso_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 402 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.country_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 405 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.market_making_possibility = (equities_batch_data_message_base + 408 + 1) % 256;
  equities_batch_data_message_record.closing_price_trading_possibility_in_the_after_hours = (equities_batch_data_message_base + 409 + 1) % 256;
  equities_batch_data_message_record.closing_price_trading_in_the_pre_opening_market = (equities_batch_data_message_base + 410 + 1) % 256;
  equities_batch_data_message_record.block_trading_in_the_pre_opening_market = (equities_batch_data_message_base + 411 + 1) % 256;
  equities_batch_data_message_record.basket_trading_in_the_pre_opening_market = (equities_batch_data_message_base + 412 + 1) % 256;
  equities_batch_data_message_record.announcement_of_estimated_trading_price = (equities_batch_data_message_base + 413 + 1) % 256;
  equities_batch_data_message_record.short_selling = (equities_batch_data_message_base + 414 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.etf_tracking_difference[equities_batch_data_message_at] = (equities_batch_data_message_base + 415 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.regs = (equities_batch_data_message_base + 423 + 1) % 256;
  equities_batch_data_message_record.spac = (equities_batch_data_message_base + 424 + 1) % 256;
  equities_batch_data_message_record.tax_type_code = (equities_batch_data_message_base + 425 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.appraisal_ratio_of_substitute_price[equities_batch_data_message_at] = (equities_batch_data_message_base + 426 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.investment_caution_issue = (equities_batch_data_message_base + 434 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.delisting_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 435 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.short_term_overheat_issue_type_code = (equities_batch_data_message_base + 443 + 1) % 256;
  equities_batch_data_message_record.etf_replication_methods_type_code = (equities_batch_data_message_base + 444 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.expiration_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 445 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.distribution_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 453 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.calculation_of_redemption_price_start_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 455 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.calculation_of_redemption_price_end_date[equities_batch_data_message_at] = (equities_batch_data_message_base + 463 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.etp_product_type_code = (equities_batch_data_message_base + 471 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.index_calculation_institution_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 472 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_market_classification_id[equities_batch_data_message_at] = (equities_batch_data_message_base + 474 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 3 -> equities_batch_data_message_record.index_sequence_number[equities_batch_data_message_at] = (equities_batch_data_message_base + 480 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.tracking_index_leverage_inverse_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 483 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 2 -> equities_batch_data_message_record.reference_index_leverage_inverse_type_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 485 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_asset_classification_id_1[equities_batch_data_message_at] = (equities_batch_data_message_base + 487 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 6 -> equities_batch_data_message_record.index_asset_classification_id_2[equities_batch_data_message_at] = (equities_batch_data_message_base + 493 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 5 -> equities_batch_data_message_record.ipo_underwriter_member_number[equities_batch_data_message_at] = (equities_batch_data_message_base + 499 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.lp_order = (equities_batch_data_message_base + 504 + 1) % 256;
  equities_batch_data_message_record.low_liquidity = (equities_batch_data_message_base + 505 + 1) % 256;
  equities_batch_data_message_record.abnormal_rise = (equities_batch_data_message_base + 506 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.upper_limit_quantity[equities_batch_data_message_at] = (equities_batch_data_message_base + 507 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.investment_precaution_issue = (equities_batch_data_message_base + 523 + 1) % 256;
  equities_batch_data_message_record.preferred_stocks_with_lesser_shares = (equities_batch_data_message_base + 524 + 1) % 256;
  equities_batch_data_message_record.spac_merger = (equities_batch_data_message_base + 525 + 1) % 256;
  equities_batch_data_message_record.segment_type_code = (equities_batch_data_message_base + 526 + 1) % 256;
  equities_batch_data_message_record.after_market_possibility = (equities_batch_data_message_base + 527 + 1) % 256;
  equities_batch_data_message_record.choice_on_competitive_trading = (equities_batch_data_message_base + 528 + 1) % 256;
  equities_batch_data_message_record.limit_on_competitive_trading_volume = (equities_batch_data_message_base + 529 + 1) % 256;
  equities_batch_data_message_record.occurrence_of_reasons_prohibiting_competitive_trading = (equities_batch_data_message_base + 530 + 1) % 256;
  equities_batch_data_message_record.approval_on_competitive_trading = (equities_batch_data_message_base + 531 + 1) % 256;
  equities_batch_data_message_record.approval_on_negotiation_trading = (equities_batch_data_message_base + 532 + 1) % 256;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_nxt = (equities_batch_data_message_base + 533 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.yesterdays_closing_price_nxt[equities_batch_data_message_at] = (equities_batch_data_message_base + 534 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.competition_board_trade_permission_code[equities_batch_data_message_at] = (equities_batch_data_message_base + 542 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.negotiation_possible_or_not_before_main_market = (equities_batch_data_message_base + 546 + 1) % 256;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.end_keyword[equities_batch_data_message_at] = (equities_batch_data_message_base + 547 + equities_batch_data_message_at + 1) % 256; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equities Batch Data Message to the wire, 551 bytes from where the cursor stands */
inline encode_equities_batch_data_message(equities_batch_data_message_record) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.message_sequence_number[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.total_number_of_instruments_of_the_contract[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.base_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.yesterdays_closing_price_type_code_krx; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.yesterdays_closing_price_krx[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.yesterdays_accumulated_trading_amount[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> wire[at] = equities_batch_data_message_record.yesterdays_accumulated_trading_value[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.upper_limit_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.lower_limit_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.substitute_price_of_securities[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.par_value[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.issuing_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.listing_date[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.number_of_listed_shares[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.exercise_price_of_elw_or_bw[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> wire[at] = equities_batch_data_message_record.capital[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.credit_order_possibility; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.limit_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.market_price_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.conditioned_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.best_favorable_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.first_best_order_permission_type[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.mid_price_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.stop_limit_price_order_permission_type_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.appraised_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.lowest_order_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.highest_order_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.unit_of_volume_in_main_board[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.lot_size_after_hours_trading[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.etf_tracking_difference[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.regs; at = at + 1;
  wire[at] = equities_batch_data_message_record.spac; at = at + 1;
  wire[at] = equities_batch_data_message_record.tax_type_code; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.appraisal_ratio_of_substitute_price[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 16 -> wire[at] = equities_batch_data_message_record.upper_limit_quantity[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> wire[at] = equities_batch_data_message_record.yesterdays_closing_price_nxt[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.competition_board_trade_permission_code[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_batch_data_message_record.negotiation_possible_or_not_before_main_market; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> wire[at] = equities_batch_data_message_record.end_keyword[equities_batch_data_message_at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equities Batch Data Message off the wire, 551 bytes from where the cursor stands */
inline decode_equities_batch_data_message(equities_batch_data_message_record) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.message_sequence_number[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.total_number_of_instruments_of_the_contract[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.base_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.yesterdays_closing_price_type_code_krx = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.yesterdays_closing_price_krx[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.yesterdays_accumulated_trading_amount[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.yesterdays_accumulated_trading_value[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.upper_limit_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.lower_limit_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.substitute_price_of_securities[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.par_value[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.issuing_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.listing_date[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.number_of_listed_shares[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.exercise_price_of_elw_or_bw[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.capital[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.credit_order_possibility = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.limit_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.market_price_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.conditioned_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.best_favorable_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.first_best_order_permission_type[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.mid_price_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.stop_limit_price_order_permission_type_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.appraised_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.lowest_order_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.highest_order_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.unit_of_volume_in_main_board[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.lot_size_after_hours_trading[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.etf_tracking_difference[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.regs = wire[at]; at = at + 1;
  equities_batch_data_message_record.spac = wire[at]; at = at + 1;
  equities_batch_data_message_record.tax_type_code = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.appraisal_ratio_of_substitute_price[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 16 -> equities_batch_data_message_record.upper_limit_quantity[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> equities_batch_data_message_record.yesterdays_closing_price_nxt[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.competition_board_trade_permission_code[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_record.negotiation_possible_or_not_before_main_market = wire[at]; at = at + 1;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> equities_batch_data_message_record.end_keyword[equities_batch_data_message_at] = wire[at]; at = at + 1; equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Equities Batch Data Message is what was written, byte for byte */
inline equal_equities_batch_data_message(equities_batch_data_message_read, equities_batch_data_message_written) {
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.message_sequence_number[equities_batch_data_message_at] == equities_batch_data_message_written.message_sequence_number[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.total_number_of_instruments_of_the_contract[equities_batch_data_message_at] == equities_batch_data_message_written.total_number_of_instruments_of_the_contract[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at] == equities_batch_data_message_written.a_designated_number_for_an_issue_from_krx[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.base_price[equities_batch_data_message_at] == equities_batch_data_message_written.base_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.yesterdays_closing_price_type_code_krx == equities_batch_data_message_written.yesterdays_closing_price_type_code_krx);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.yesterdays_closing_price_krx[equities_batch_data_message_at] == equities_batch_data_message_written.yesterdays_closing_price_krx[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.yesterdays_accumulated_trading_amount[equities_batch_data_message_at] == equities_batch_data_message_written.yesterdays_accumulated_trading_amount[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> assert(equities_batch_data_message_read.yesterdays_accumulated_trading_value[equities_batch_data_message_at] == equities_batch_data_message_written.yesterdays_accumulated_trading_value[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.upper_limit_price[equities_batch_data_message_at] == equities_batch_data_message_written.upper_limit_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.lower_limit_price[equities_batch_data_message_at] == equities_batch_data_message_written.lower_limit_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.substitute_price_of_securities[equities_batch_data_message_at] == equities_batch_data_message_written.substitute_price_of_securities[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.par_value[equities_batch_data_message_at] == equities_batch_data_message_written.par_value[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.issuing_price[equities_batch_data_message_at] == equities_batch_data_message_written.issuing_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.listing_date[equities_batch_data_message_at] == equities_batch_data_message_written.listing_date[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.number_of_listed_shares[equities_batch_data_message_at] == equities_batch_data_message_written.number_of_listed_shares[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.exercise_price_of_elw_or_bw[equities_batch_data_message_at] == equities_batch_data_message_written.exercise_price_of_elw_or_bw[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 16 -> assert(equities_batch_data_message_read.capital[equities_batch_data_message_at] == equities_batch_data_message_written.capital[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.credit_order_possibility == equities_batch_data_message_written.credit_order_possibility);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.limit_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.limit_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.market_price_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.market_price_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.conditioned_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.conditioned_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.best_favorable_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.best_favorable_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.first_best_order_permission_type[equities_batch_data_message_at] == equities_batch_data_message_written.first_best_order_permission_type[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.mid_price_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.mid_price_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.stop_limit_price_order_permission_type_code[equities_batch_data_message_at] == equities_batch_data_message_written.stop_limit_price_order_permission_type_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.appraised_price[equities_batch_data_message_at] == equities_batch_data_message_written.appraised_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.lowest_order_price[equities_batch_data_message_at] == equities_batch_data_message_written.lowest_order_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.highest_order_price[equities_batch_data_message_at] == equities_batch_data_message_written.highest_order_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.unit_of_volume_in_main_board[equities_batch_data_message_at] == equities_batch_data_message_written.unit_of_volume_in_main_board[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.lot_size_after_hours_trading[equities_batch_data_message_at] == equities_batch_data_message_written.lot_size_after_hours_trading[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.etf_tracking_difference[equities_batch_data_message_at] == equities_batch_data_message_written.etf_tracking_difference[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.regs == equities_batch_data_message_written.regs);
  assert(equities_batch_data_message_read.spac == equities_batch_data_message_written.spac);
  assert(equities_batch_data_message_read.tax_type_code == equities_batch_data_message_written.tax_type_code);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.appraisal_ratio_of_substitute_price[equities_batch_data_message_at] == equities_batch_data_message_written.appraisal_ratio_of_substitute_price[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 16 -> assert(equities_batch_data_message_read.upper_limit_quantity[equities_batch_data_message_at] == equities_batch_data_message_written.upper_limit_quantity[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
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
  :: equities_batch_data_message_at < 8 -> assert(equities_batch_data_message_read.yesterdays_closing_price_nxt[equities_batch_data_message_at] == equities_batch_data_message_written.yesterdays_closing_price_nxt[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.competition_board_trade_permission_code[equities_batch_data_message_at] == equities_batch_data_message_written.competition_board_trade_permission_code[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(equities_batch_data_message_read.negotiation_possible_or_not_before_main_market == equities_batch_data_message_written.negotiation_possible_or_not_before_main_market);
  equities_batch_data_message_at = 0;
  do
  :: equities_batch_data_message_at < 4 -> assert(equities_batch_data_message_read.end_keyword[equities_batch_data_message_at] == equities_batch_data_message_written.end_keyword[equities_batch_data_message_at]); equities_batch_data_message_at = equities_batch_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Member Information Message: 201 bytes ----------------------------------- */

/* Details. */
typedef MemberInformationMessage {
  byte message_sequence_number[4];
  byte business_date[8];
  byte market_participant_number[5];
  byte name_of_a_market_participant_in_kr[80];
  byte name_of_a_market_participant_in_en[80];
  byte an_abbreviated_name_of_a_market_participant_in_kr[20];
  byte end_keyword[4]
};

int member_information_message_at;

/* every byte of Member Information Message set to one value */
inline fill_member_information_message(member_information_message_record, member_information_message_value) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> member_information_message_record.message_sequence_number[member_information_message_at] = member_information_message_value; member_information_message_at = member_information_message_at + 1
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
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> member_information_message_record.end_keyword[member_information_message_at] = member_information_message_value; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Member Information Message set to where it lies, so a field read out of place says so */
inline ramp_member_information_message(member_information_message_record, member_information_message_base) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> member_information_message_record.message_sequence_number[member_information_message_at] = (member_information_message_base + 0 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 8 -> member_information_message_record.business_date[member_information_message_at] = (member_information_message_base + 4 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 5 -> member_information_message_record.market_participant_number[member_information_message_at] = (member_information_message_base + 12 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> member_information_message_record.name_of_a_market_participant_in_kr[member_information_message_at] = (member_information_message_base + 17 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 80 -> member_information_message_record.name_of_a_market_participant_in_en[member_information_message_at] = (member_information_message_base + 97 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 20 -> member_information_message_record.an_abbreviated_name_of_a_market_participant_in_kr[member_information_message_at] = (member_information_message_base + 177 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> member_information_message_record.end_keyword[member_information_message_at] = (member_information_message_base + 197 + member_information_message_at + 1) % 256; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Member Information Message to the wire, 201 bytes from where the cursor stands */
inline encode_member_information_message(member_information_message_record) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> wire[at] = member_information_message_record.message_sequence_number[member_information_message_at]; at = at + 1; member_information_message_at = member_information_message_at + 1
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
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> wire[at] = member_information_message_record.end_keyword[member_information_message_at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Member Information Message off the wire, 201 bytes from where the cursor stands */
inline decode_member_information_message(member_information_message_record) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> member_information_message_record.message_sequence_number[member_information_message_at] = wire[at]; at = at + 1; member_information_message_at = member_information_message_at + 1
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
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> member_information_message_record.end_keyword[member_information_message_at] = wire[at]; at = at + 1; member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Member Information Message is what was written, byte for byte */
inline equal_member_information_message(member_information_message_read, member_information_message_written) {
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> assert(member_information_message_read.message_sequence_number[member_information_message_at] == member_information_message_written.message_sequence_number[member_information_message_at]); member_information_message_at = member_information_message_at + 1
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
  member_information_message_at = 0;
  do
  :: member_information_message_at < 4 -> assert(member_information_message_read.end_keyword[member_information_message_at] == member_information_message_written.end_keyword[member_information_message_at]); member_information_message_at = member_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Issue Event Message: 42 bytes ------------------------------------------- */

/* Details. */
typedef IssueEventMessage {
  byte message_sequence_number[4];
  byte isin_code[12];
  byte event_type_code[2];
  byte event_reason_code[4];
  byte event_start_date[8];
  byte event_end_date[8];
  byte end_keyword[4]
};

int issue_event_message_at;

/* every byte of Issue Event Message set to one value */
inline fill_issue_event_message(issue_event_message_record, issue_event_message_value) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.message_sequence_number[issue_event_message_at] = issue_event_message_value; issue_event_message_at = issue_event_message_at + 1
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
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.end_keyword[issue_event_message_at] = issue_event_message_value; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Issue Event Message set to where it lies, so a field read out of place says so */
inline ramp_issue_event_message(issue_event_message_record, issue_event_message_base) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.message_sequence_number[issue_event_message_at] = (issue_event_message_base + 0 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 12 -> issue_event_message_record.isin_code[issue_event_message_at] = (issue_event_message_base + 4 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 2 -> issue_event_message_record.event_type_code[issue_event_message_at] = (issue_event_message_base + 16 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.event_reason_code[issue_event_message_at] = (issue_event_message_base + 18 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.event_start_date[issue_event_message_at] = (issue_event_message_base + 22 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 8 -> issue_event_message_record.event_end_date[issue_event_message_at] = (issue_event_message_base + 30 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.end_keyword[issue_event_message_at] = (issue_event_message_base + 38 + issue_event_message_at + 1) % 256; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Event Message to the wire, 42 bytes from where the cursor stands */
inline encode_issue_event_message(issue_event_message_record) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> wire[at] = issue_event_message_record.message_sequence_number[issue_event_message_at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
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
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> wire[at] = issue_event_message_record.end_keyword[issue_event_message_at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Event Message off the wire, 42 bytes from where the cursor stands */
inline decode_issue_event_message(issue_event_message_record) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.message_sequence_number[issue_event_message_at] = wire[at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
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
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> issue_event_message_record.end_keyword[issue_event_message_at] = wire[at]; at = at + 1; issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Issue Event Message is what was written, byte for byte */
inline equal_issue_event_message(issue_event_message_read, issue_event_message_written) {
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> assert(issue_event_message_read.message_sequence_number[issue_event_message_at] == issue_event_message_written.message_sequence_number[issue_event_message_at]); issue_event_message_at = issue_event_message_at + 1
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
  issue_event_message_at = 0;
  do
  :: issue_event_message_at < 4 -> assert(issue_event_message_read.end_keyword[issue_event_message_at] == issue_event_message_written.end_keyword[issue_event_message_at]); issue_event_message_at = issue_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Block Basket Trade Data Message: 46 bytes ------------------------------- */

/* Block/Basket Trade Data in NXT. */
typedef BlockBasketTradeDataMessage {
  byte board_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte accumulated_trading_volume[8];
  byte accumulated_trading_value[16];
  byte end_keyword[4]
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
  :: block_basket_trade_data_message_at < 4 -> block_basket_trade_data_message_record.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at] = block_basket_trade_data_message_value; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 8 -> block_basket_trade_data_message_record.accumulated_trading_volume[block_basket_trade_data_message_at] = block_basket_trade_data_message_value; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 16 -> block_basket_trade_data_message_record.accumulated_trading_value[block_basket_trade_data_message_at] = block_basket_trade_data_message_value; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 4 -> block_basket_trade_data_message_record.end_keyword[block_basket_trade_data_message_at] = block_basket_trade_data_message_value; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
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
  :: block_basket_trade_data_message_at < 4 -> block_basket_trade_data_message_record.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at] = (block_basket_trade_data_message_base + 14 + block_basket_trade_data_message_at + 1) % 256; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 8 -> block_basket_trade_data_message_record.accumulated_trading_volume[block_basket_trade_data_message_at] = (block_basket_trade_data_message_base + 18 + block_basket_trade_data_message_at + 1) % 256; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 16 -> block_basket_trade_data_message_record.accumulated_trading_value[block_basket_trade_data_message_at] = (block_basket_trade_data_message_base + 26 + block_basket_trade_data_message_at + 1) % 256; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 4 -> block_basket_trade_data_message_record.end_keyword[block_basket_trade_data_message_at] = (block_basket_trade_data_message_base + 42 + block_basket_trade_data_message_at + 1) % 256; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Block Basket Trade Data Message to the wire, 46 bytes from where the cursor stands */
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
  :: block_basket_trade_data_message_at < 4 -> wire[at] = block_basket_trade_data_message_record.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 8 -> wire[at] = block_basket_trade_data_message_record.accumulated_trading_volume[block_basket_trade_data_message_at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 16 -> wire[at] = block_basket_trade_data_message_record.accumulated_trading_value[block_basket_trade_data_message_at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 4 -> wire[at] = block_basket_trade_data_message_record.end_keyword[block_basket_trade_data_message_at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Block Basket Trade Data Message off the wire, 46 bytes from where the cursor stands */
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
  :: block_basket_trade_data_message_at < 4 -> block_basket_trade_data_message_record.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at] = wire[at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 8 -> block_basket_trade_data_message_record.accumulated_trading_volume[block_basket_trade_data_message_at] = wire[at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 16 -> block_basket_trade_data_message_record.accumulated_trading_value[block_basket_trade_data_message_at] = wire[at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 4 -> block_basket_trade_data_message_record.end_keyword[block_basket_trade_data_message_at] = wire[at]; at = at + 1; block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
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
  :: block_basket_trade_data_message_at < 4 -> assert(block_basket_trade_data_message_read.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at] == block_basket_trade_data_message_written.a_designated_number_for_an_issue_from_krx[block_basket_trade_data_message_at]); block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 8 -> assert(block_basket_trade_data_message_read.accumulated_trading_volume[block_basket_trade_data_message_at] == block_basket_trade_data_message_written.accumulated_trading_volume[block_basket_trade_data_message_at]); block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 16 -> assert(block_basket_trade_data_message_read.accumulated_trading_value[block_basket_trade_data_message_at] == block_basket_trade_data_message_written.accumulated_trading_value[block_basket_trade_data_message_at]); block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  block_basket_trade_data_message_at = 0;
  do
  :: block_basket_trade_data_message_at < 4 -> assert(block_basket_trade_data_message_read.end_keyword[block_basket_trade_data_message_at] == block_basket_trade_data_message_written.end_keyword[block_basket_trade_data_message_at]); block_basket_trade_data_message_at = block_basket_trade_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Investor Activities Per An Issue Eod Message: 72 bytes ------------------ */

/* Investor Activities per an issue_EOD. */
typedef InvestorActivitiesPerAnIssueEodMessage {
  byte isin_code[12];
  byte a_designated_number_for_an_issue_from_krx[4];
  byte investor_code[4];
  byte accumulated_ask_trading_volume[8];
  byte accumulated_ask_trading_value[16];
  byte accumulated_bid_trading_volume[8];
  byte accumulated_bid_trading_value[16];
  byte end_keyword[4]
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
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.investor_code[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.end_keyword[investor_activities_per_an_issue_eod_message_at] = investor_activities_per_an_issue_eod_message_value; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
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
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 12 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.investor_code[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 16 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 20 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 28 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 44 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 52 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.end_keyword[investor_activities_per_an_issue_eod_message_at] = (investor_activities_per_an_issue_eod_message_base + 68 + investor_activities_per_an_issue_eod_message_at + 1) % 256; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  skip
}

/* Investor Activities Per An Issue Eod Message to the wire, 72 bytes from where the cursor stands */
inline encode_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_record) {
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> wire[at] = investor_activities_per_an_issue_eod_message_record.isin_code[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> wire[at] = investor_activities_per_an_issue_eod_message_record.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> wire[at] = investor_activities_per_an_issue_eod_message_record.investor_code[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> wire[at] = investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> wire[at] = investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> wire[at] = investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> wire[at] = investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> wire[at] = investor_activities_per_an_issue_eod_message_record.end_keyword[investor_activities_per_an_issue_eod_message_at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  skip
}

/* Investor Activities Per An Issue Eod Message off the wire, 72 bytes from where the cursor stands */
inline decode_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_record) {
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 12 -> investor_activities_per_an_issue_eod_message_record.isin_code[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.investor_code[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> investor_activities_per_an_issue_eod_message_record.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> investor_activities_per_an_issue_eod_message_record.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> investor_activities_per_an_issue_eod_message_record.end_keyword[investor_activities_per_an_issue_eod_message_at] = wire[at]; at = at + 1; investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
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
  :: investor_activities_per_an_issue_eod_message_at < 4 -> assert(investor_activities_per_an_issue_eod_message_read.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.a_designated_number_for_an_issue_from_krx[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> assert(investor_activities_per_an_issue_eod_message_read.investor_code[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.investor_code[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> assert(investor_activities_per_an_issue_eod_message_read.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.accumulated_ask_trading_volume[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> assert(investor_activities_per_an_issue_eod_message_read.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.accumulated_ask_trading_value[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 8 -> assert(investor_activities_per_an_issue_eod_message_read.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.accumulated_bid_trading_volume[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 16 -> assert(investor_activities_per_an_issue_eod_message_read.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.accumulated_bid_trading_value[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  investor_activities_per_an_issue_eod_message_at = 0;
  do
  :: investor_activities_per_an_issue_eod_message_at < 4 -> assert(investor_activities_per_an_issue_eod_message_read.end_keyword[investor_activities_per_an_issue_eod_message_at] == investor_activities_per_an_issue_eod_message_written.end_keyword[investor_activities_per_an_issue_eod_message_at]); investor_activities_per_an_issue_eod_message_at = investor_activities_per_an_issue_eod_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Selling Message: 88 bytes ----------------------------------------- */

/* Short Selling. */
typedef ShortSellingMessage {
  byte isin_code[12];
  byte covered_short_selling_trading_volume[8];
  byte covered_short_selling_trading_value[16];
  byte uptick_rule_applied_covered_short_selling_trading_volume[8];
  byte uptick_rule_applied_covered_short_selling_trading_value[16];
  byte uptick_rule_unapplied_covered_short_selling_trading_volume[8];
  byte uptick_rule_unapplied_covered_short_selling_trading_value[16];
  byte end_keyword[4]
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
  :: short_selling_message_at < 8 -> short_selling_message_record.covered_short_selling_trading_volume[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> short_selling_message_record.covered_short_selling_trading_value[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 4 -> short_selling_message_record.end_keyword[short_selling_message_at] = short_selling_message_value; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
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
  :: short_selling_message_at < 8 -> short_selling_message_record.covered_short_selling_trading_volume[short_selling_message_at] = (short_selling_message_base + 12 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> short_selling_message_record.covered_short_selling_trading_value[short_selling_message_at] = (short_selling_message_base + 20 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at] = (short_selling_message_base + 36 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at] = (short_selling_message_base + 44 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at] = (short_selling_message_base + 60 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at] = (short_selling_message_base + 68 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 4 -> short_selling_message_record.end_keyword[short_selling_message_at] = (short_selling_message_base + 84 + short_selling_message_at + 1) % 256; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Selling Message to the wire, 88 bytes from where the cursor stands */
inline encode_short_selling_message(short_selling_message_record) {
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> wire[at] = short_selling_message_record.isin_code[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> wire[at] = short_selling_message_record.covered_short_selling_trading_volume[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> wire[at] = short_selling_message_record.covered_short_selling_trading_value[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> wire[at] = short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> wire[at] = short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> wire[at] = short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> wire[at] = short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 4 -> wire[at] = short_selling_message_record.end_keyword[short_selling_message_at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Selling Message off the wire, 88 bytes from where the cursor stands */
inline decode_short_selling_message(short_selling_message_record) {
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 12 -> short_selling_message_record.isin_code[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> short_selling_message_record.covered_short_selling_trading_volume[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> short_selling_message_record.covered_short_selling_trading_value[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 4 -> short_selling_message_record.end_keyword[short_selling_message_at] = wire[at]; at = at + 1; short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
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
  :: short_selling_message_at < 8 -> assert(short_selling_message_read.covered_short_selling_trading_volume[short_selling_message_at] == short_selling_message_written.covered_short_selling_trading_volume[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> assert(short_selling_message_read.covered_short_selling_trading_value[short_selling_message_at] == short_selling_message_written.covered_short_selling_trading_value[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> assert(short_selling_message_read.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at] == short_selling_message_written.uptick_rule_applied_covered_short_selling_trading_volume[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> assert(short_selling_message_read.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at] == short_selling_message_written.uptick_rule_applied_covered_short_selling_trading_value[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 8 -> assert(short_selling_message_read.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at] == short_selling_message_written.uptick_rule_unapplied_covered_short_selling_trading_volume[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 16 -> assert(short_selling_message_read.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at] == short_selling_message_written.uptick_rule_unapplied_covered_short_selling_trading_value[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  short_selling_message_at = 0;
  do
  :: short_selling_message_at < 4 -> assert(short_selling_message_read.end_keyword[short_selling_message_at] == short_selling_message_written.end_keyword[short_selling_message_at]); short_selling_message_at = short_selling_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Brokers Acitity Information Message: 69 bytes --------------------------- */

/* Information on Brokers Activity in NXT market. */
typedef BrokersAcitityInformationMessage {
  byte isin_code[12];
  byte member_number[5];
  byte accumulated_ask_trading_volume[8];
  byte accumulated_ask_trading_value[16];
  byte accumulated_bid_trading_volume[8];
  byte accumulated_bid_trading_value[16];
  byte end_keyword[4]
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
  :: brokers_acitity_information_message_at < 8 -> brokers_acitity_information_message_record.accumulated_ask_trading_volume[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> brokers_acitity_information_message_record.accumulated_ask_trading_value[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 8 -> brokers_acitity_information_message_record.accumulated_bid_trading_volume[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> brokers_acitity_information_message_record.accumulated_bid_trading_value[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 4 -> brokers_acitity_information_message_record.end_keyword[brokers_acitity_information_message_at] = brokers_acitity_information_message_value; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
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
  :: brokers_acitity_information_message_at < 8 -> brokers_acitity_information_message_record.accumulated_ask_trading_volume[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 17 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> brokers_acitity_information_message_record.accumulated_ask_trading_value[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 25 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 8 -> brokers_acitity_information_message_record.accumulated_bid_trading_volume[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 41 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> brokers_acitity_information_message_record.accumulated_bid_trading_value[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 49 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 4 -> brokers_acitity_information_message_record.end_keyword[brokers_acitity_information_message_at] = (brokers_acitity_information_message_base + 65 + brokers_acitity_information_message_at + 1) % 256; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Brokers Acitity Information Message to the wire, 69 bytes from where the cursor stands */
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
  :: brokers_acitity_information_message_at < 8 -> wire[at] = brokers_acitity_information_message_record.accumulated_ask_trading_volume[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> wire[at] = brokers_acitity_information_message_record.accumulated_ask_trading_value[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 8 -> wire[at] = brokers_acitity_information_message_record.accumulated_bid_trading_volume[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> wire[at] = brokers_acitity_information_message_record.accumulated_bid_trading_value[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 4 -> wire[at] = brokers_acitity_information_message_record.end_keyword[brokers_acitity_information_message_at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Brokers Acitity Information Message off the wire, 69 bytes from where the cursor stands */
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
  :: brokers_acitity_information_message_at < 8 -> brokers_acitity_information_message_record.accumulated_ask_trading_volume[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> brokers_acitity_information_message_record.accumulated_ask_trading_value[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 8 -> brokers_acitity_information_message_record.accumulated_bid_trading_volume[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> brokers_acitity_information_message_record.accumulated_bid_trading_value[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 4 -> brokers_acitity_information_message_record.end_keyword[brokers_acitity_information_message_at] = wire[at]; at = at + 1; brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
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
  :: brokers_acitity_information_message_at < 8 -> assert(brokers_acitity_information_message_read.accumulated_ask_trading_volume[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.accumulated_ask_trading_volume[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> assert(brokers_acitity_information_message_read.accumulated_ask_trading_value[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.accumulated_ask_trading_value[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 8 -> assert(brokers_acitity_information_message_read.accumulated_bid_trading_volume[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.accumulated_bid_trading_volume[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 16 -> assert(brokers_acitity_information_message_read.accumulated_bid_trading_value[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.accumulated_bid_trading_value[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  brokers_acitity_information_message_at = 0;
  do
  :: brokers_acitity_information_message_at < 4 -> assert(brokers_acitity_information_message_read.end_keyword[brokers_acitity_information_message_at] == brokers_acitity_information_message_written.end_keyword[brokers_acitity_information_message_at]); brokers_acitity_information_message_at = brokers_acitity_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Activity By Session Per An Issue Message: 92 bytes -------------- */

/* Trading Activity by session for each issue and market. */
typedef TradingActivityBySessionPerAnIssueMessage {
  byte isin_code[12];
  byte total_number_of_tradable_issues_on_competitive_trading[4];
  byte pre_market_accumulated_trading_volume[8];
  byte pre_market_accumulated_trading_value[16];
  byte main_market_accumulated_trading_volume[8];
  byte main_market_accumulated_trading_value[16];
  byte after_market_accumulated_trading_volume[8];
  byte after_market_accumulated_trading_value[16];
  byte end_keyword[4]
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
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> trading_activity_by_session_per_an_issue_message_record.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> trading_activity_by_session_per_an_issue_message_record.end_keyword[trading_activity_by_session_per_an_issue_message_at] = trading_activity_by_session_per_an_issue_message_value; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
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
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> trading_activity_by_session_per_an_issue_message_record.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 12 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 16 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 24 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 40 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 48 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 64 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 72 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> trading_activity_by_session_per_an_issue_message_record.end_keyword[trading_activity_by_session_per_an_issue_message_at] = (trading_activity_by_session_per_an_issue_message_base + 88 + trading_activity_by_session_per_an_issue_message_at + 1) % 256; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Activity By Session Per An Issue Message to the wire, 92 bytes from where the cursor stands */
inline encode_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_record) {
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.isin_code[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> wire[at] = trading_activity_by_session_per_an_issue_message_record.end_keyword[trading_activity_by_session_per_an_issue_message_at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Activity By Session Per An Issue Message off the wire, 92 bytes from where the cursor stands */
inline decode_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_record) {
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 12 -> trading_activity_by_session_per_an_issue_message_record.isin_code[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> trading_activity_by_session_per_an_issue_message_record.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> trading_activity_by_session_per_an_issue_message_record.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> trading_activity_by_session_per_an_issue_message_record.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> trading_activity_by_session_per_an_issue_message_record.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> trading_activity_by_session_per_an_issue_message_record.end_keyword[trading_activity_by_session_per_an_issue_message_at] = wire[at]; at = at + 1; trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
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
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> assert(trading_activity_by_session_per_an_issue_message_read.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.total_number_of_tradable_issues_on_competitive_trading[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> assert(trading_activity_by_session_per_an_issue_message_read.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.pre_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> assert(trading_activity_by_session_per_an_issue_message_read.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.pre_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> assert(trading_activity_by_session_per_an_issue_message_read.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.main_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> assert(trading_activity_by_session_per_an_issue_message_read.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.main_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 8 -> assert(trading_activity_by_session_per_an_issue_message_read.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.after_market_accumulated_trading_volume[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 16 -> assert(trading_activity_by_session_per_an_issue_message_read.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.after_market_accumulated_trading_value[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
  :: else -> break
  od;
  trading_activity_by_session_per_an_issue_message_at = 0;
  do
  :: trading_activity_by_session_per_an_issue_message_at < 4 -> assert(trading_activity_by_session_per_an_issue_message_read.end_keyword[trading_activity_by_session_per_an_issue_message_at] == trading_activity_by_session_per_an_issue_message_written.end_keyword[trading_activity_by_session_per_an_issue_message_at]); trading_activity_by_session_per_an_issue_message_at = trading_activity_by_session_per_an_issue_message_at + 1
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

/* Equities Snapshot Mm Lp Quotes Included 10 Level Message: encoded, read back, and compared */
proctype check_equities_snapshot_mm_lp_quotes_included10_level_message() {
  EquitiesSnapshotMmLpQuotesIncluded10LevelMessage equities_snapshot_mm_lp_quotes_included10_level_message_sent;
  EquitiesSnapshotMmLpQuotesIncluded10LevelMessage equities_snapshot_mm_lp_quotes_included10_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_sent, 0)
  :: pattern == 1 -> fill_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_sent, 32)
  :: pattern == 2 -> fill_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_sent, 255)
  :: else -> ramp_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_sent);
    assert(at == 654);
    at = 0;
    decode_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_got);
    assert(at == 654);
    equal_equities_snapshot_mm_lp_quotes_included10_level_message(equities_snapshot_mm_lp_quotes_included10_level_message_got, equities_snapshot_mm_lp_quotes_included10_level_message_sent)
  }
}

/* Investor Activities Per Commodities Message: encoded, read back, and compared */
proctype check_investor_activities_per_commodities_message() {
  InvestorActivitiesPerCommoditiesMessage investor_activities_per_commodities_message_sent;
  InvestorActivitiesPerCommoditiesMessage investor_activities_per_commodities_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_investor_activities_per_commodities_message(investor_activities_per_commodities_message_sent, 0)
  :: pattern == 1 -> fill_investor_activities_per_commodities_message(investor_activities_per_commodities_message_sent, 32)
  :: pattern == 2 -> fill_investor_activities_per_commodities_message(investor_activities_per_commodities_message_sent, 255)
  :: else -> ramp_investor_activities_per_commodities_message(investor_activities_per_commodities_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_investor_activities_per_commodities_message(investor_activities_per_commodities_message_sent);
    assert(at == 62);
    at = 0;
    decode_investor_activities_per_commodities_message(investor_activities_per_commodities_message_got);
    assert(at == 62);
    equal_investor_activities_per_commodities_message(investor_activities_per_commodities_message_got, investor_activities_per_commodities_message_sent)
  }
}

/* Etp Constituents Message: encoded, read back, and compared */
proctype check_etp_constituents_message() {
  EtpConstituentsMessage etp_constituents_message_sent;
  EtpConstituentsMessage etp_constituents_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etp_constituents_message(etp_constituents_message_sent, 0)
  :: pattern == 1 -> fill_etp_constituents_message(etp_constituents_message_sent, 32)
  :: pattern == 2 -> fill_etp_constituents_message(etp_constituents_message_sent, 255)
  :: else -> ramp_etp_constituents_message(etp_constituents_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etp_constituents_message(etp_constituents_message_sent);
    assert(at == 203);
    at = 0;
    decode_etp_constituents_message(etp_constituents_message_got);
    assert(at == 203);
    equal_etp_constituents_message(etp_constituents_message_got, etp_constituents_message_sent)
  }
}

/* Mm Lp Information Message: encoded, read back, and compared */
proctype check_mm_lp_information_message() {
  MmLpInformationMessage mm_lp_information_message_sent;
  MmLpInformationMessage mm_lp_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mm_lp_information_message(mm_lp_information_message_sent, 0)
  :: pattern == 1 -> fill_mm_lp_information_message(mm_lp_information_message_sent, 32)
  :: pattern == 2 -> fill_mm_lp_information_message(mm_lp_information_message_sent, 255)
  :: else -> ramp_mm_lp_information_message(mm_lp_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mm_lp_information_message(mm_lp_information_message_sent);
    assert(at == 169);
    at = 0;
    decode_mm_lp_information_message(mm_lp_information_message_got);
    assert(at == 169);
    equal_mm_lp_information_message(mm_lp_information_message_got, mm_lp_information_message_sent)
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
    assert(at == 82);
    at = 0;
    decode_market_operation_schedule_message(market_operation_schedule_message_got);
    assert(at == 82);
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
    assert(at == 310);
    at = 0;
    decode_top_five_traders_activities_message(top_five_traders_activities_message_got);
    assert(at == 310);
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
    assert(at == 551);
    at = 0;
    decode_equities_batch_data_message(equities_batch_data_message_got);
    assert(at == 551);
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
    assert(at == 201);
    at = 0;
    decode_member_information_message(member_information_message_got);
    assert(at == 201);
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
    assert(at == 42);
    at = 0;
    decode_issue_event_message(issue_event_message_got);
    assert(at == 42);
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
    assert(at == 46);
    at = 0;
    decode_block_basket_trade_data_message(block_basket_trade_data_message_got);
    assert(at == 46);
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
    assert(at == 72);
    at = 0;
    decode_investor_activities_per_an_issue_eod_message(investor_activities_per_an_issue_eod_message_got);
    assert(at == 72);
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
    assert(at == 88);
    at = 0;
    decode_short_selling_message(short_selling_message_got);
    assert(at == 88);
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
    assert(at == 69);
    at = 0;
    decode_brokers_acitity_information_message(brokers_acitity_information_message_got);
    assert(at == 69);
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
    assert(at == 92);
    at = 0;
    decode_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_got);
    assert(at == 92);
    equal_trading_activity_by_session_per_an_issue_message(trading_activity_by_session_per_an_issue_message_got, trading_activity_by_session_per_an_issue_message_sent)
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
  :: run check_equities_snapshot_mm_lp_quotes_included10_level_message()
  :: run check_investor_activities_per_commodities_message()
  :: run check_etp_constituents_message()
  :: run check_mm_lp_information_message()
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
