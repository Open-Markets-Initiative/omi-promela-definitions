/*
 * Koscom Co., Ltd. MDCS Realtime Equity Derivatives
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
#define WIRE 627

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Polling Data Message: 5 bytes ------------------------------------------- */

/* Polling data transmitted at one-minute intervals on every market data feed. Carries Current Time as a heartbeat. */
typedef PollingDataMessage {
  byte current_time[4];
  byte end_keyword
};

int polling_data_message_at;

/* every byte of Polling Data Message set to one value */
inline fill_polling_data_message(polling_data_message_record, polling_data_message_value) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.current_time[polling_data_message_at] = polling_data_message_value; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_record.end_keyword = polling_data_message_value;
  skip
}

/* each byte of Polling Data Message set to where it lies, so a field read out of place says so */
inline ramp_polling_data_message(polling_data_message_record, polling_data_message_base) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.current_time[polling_data_message_at] = (polling_data_message_base + 0 + polling_data_message_at + 1) % 256; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_record.end_keyword = (polling_data_message_base + 4 + 1) % 256;
  skip
}

/* Polling Data Message to the wire, 5 bytes from where the cursor stands */
inline encode_polling_data_message(polling_data_message_record) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> wire[at] = polling_data_message_record.current_time[polling_data_message_at]; at = at + 1; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  wire[at] = polling_data_message_record.end_keyword; at = at + 1;
  skip
}

/* Polling Data Message off the wire, 5 bytes from where the cursor stands */
inline decode_polling_data_message(polling_data_message_record) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> polling_data_message_record.current_time[polling_data_message_at] = wire[at]; at = at + 1; polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  polling_data_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Polling Data Message is what was written, byte for byte */
inline equal_polling_data_message(polling_data_message_read, polling_data_message_written) {
  polling_data_message_at = 0;
  do
  :: polling_data_message_at < 4 -> assert(polling_data_message_read.current_time[polling_data_message_at] == polling_data_message_written.current_time[polling_data_message_at]); polling_data_message_at = polling_data_message_at + 1
  :: else -> break
  od;
  assert(polling_data_message_read.end_keyword == polling_data_message_written.end_keyword);
  skip
}

/* ---- Krx Index Message: 82 bytes --------------------------------------------- */

/* Krx Index real-time message. Reports current index value, change against previous day, accumulated trading volume, and accumulated trading value for one index. The Index ID field identifies which index group (KRX Index Group 1/2/3, Sector A/B, Gold Spot, or Equity Derivatives) this record belongs to. */
typedef KrxIndexMessage {
  byte index_id[6];
  byte isin_code[12];
  byte calculation_time[6];
  byte index[9];
  byte index_change_sign_against_the_previous_day;
  byte index_change_against_the_previous_day[9];
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[22];
  byte filler_4[4];
  byte end_keyword
};

int krx_index_message_at;

/* every byte of Krx Index Message set to one value */
inline fill_krx_index_message(krx_index_message_record, krx_index_message_value) {
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> krx_index_message_record.index_id[krx_index_message_at] = krx_index_message_value; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> krx_index_message_record.isin_code[krx_index_message_at] = krx_index_message_value; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> krx_index_message_record.calculation_time[krx_index_message_at] = krx_index_message_value; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> krx_index_message_record.index[krx_index_message_at] = krx_index_message_value; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_record.index_change_sign_against_the_previous_day = krx_index_message_value;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> krx_index_message_record.index_change_against_the_previous_day[krx_index_message_at] = krx_index_message_value; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> krx_index_message_record.accumulated_trading_volume[krx_index_message_at] = krx_index_message_value; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 22 -> krx_index_message_record.accumulated_trading_value[krx_index_message_at] = krx_index_message_value; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 4 -> krx_index_message_record.filler_4[krx_index_message_at] = krx_index_message_value; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_record.end_keyword = krx_index_message_value;
  skip
}

/* each byte of Krx Index Message set to where it lies, so a field read out of place says so */
inline ramp_krx_index_message(krx_index_message_record, krx_index_message_base) {
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> krx_index_message_record.index_id[krx_index_message_at] = (krx_index_message_base + 0 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> krx_index_message_record.isin_code[krx_index_message_at] = (krx_index_message_base + 6 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> krx_index_message_record.calculation_time[krx_index_message_at] = (krx_index_message_base + 18 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> krx_index_message_record.index[krx_index_message_at] = (krx_index_message_base + 24 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_record.index_change_sign_against_the_previous_day = (krx_index_message_base + 33 + 1) % 256;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> krx_index_message_record.index_change_against_the_previous_day[krx_index_message_at] = (krx_index_message_base + 34 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> krx_index_message_record.accumulated_trading_volume[krx_index_message_at] = (krx_index_message_base + 43 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 22 -> krx_index_message_record.accumulated_trading_value[krx_index_message_at] = (krx_index_message_base + 55 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 4 -> krx_index_message_record.filler_4[krx_index_message_at] = (krx_index_message_base + 77 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_record.end_keyword = (krx_index_message_base + 81 + 1) % 256;
  skip
}

/* Krx Index Message to the wire, 82 bytes from where the cursor stands */
inline encode_krx_index_message(krx_index_message_record) {
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> wire[at] = krx_index_message_record.index_id[krx_index_message_at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> wire[at] = krx_index_message_record.isin_code[krx_index_message_at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> wire[at] = krx_index_message_record.calculation_time[krx_index_message_at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> wire[at] = krx_index_message_record.index[krx_index_message_at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  wire[at] = krx_index_message_record.index_change_sign_against_the_previous_day; at = at + 1;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> wire[at] = krx_index_message_record.index_change_against_the_previous_day[krx_index_message_at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> wire[at] = krx_index_message_record.accumulated_trading_volume[krx_index_message_at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 22 -> wire[at] = krx_index_message_record.accumulated_trading_value[krx_index_message_at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 4 -> wire[at] = krx_index_message_record.filler_4[krx_index_message_at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  wire[at] = krx_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Krx Index Message off the wire, 82 bytes from where the cursor stands */
inline decode_krx_index_message(krx_index_message_record) {
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> krx_index_message_record.index_id[krx_index_message_at] = wire[at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> krx_index_message_record.isin_code[krx_index_message_at] = wire[at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> krx_index_message_record.calculation_time[krx_index_message_at] = wire[at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> krx_index_message_record.index[krx_index_message_at] = wire[at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_record.index_change_sign_against_the_previous_day = wire[at]; at = at + 1;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> krx_index_message_record.index_change_against_the_previous_day[krx_index_message_at] = wire[at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> krx_index_message_record.accumulated_trading_volume[krx_index_message_at] = wire[at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 22 -> krx_index_message_record.accumulated_trading_value[krx_index_message_at] = wire[at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 4 -> krx_index_message_record.filler_4[krx_index_message_at] = wire[at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Krx Index Message is what was written, byte for byte */
inline equal_krx_index_message(krx_index_message_read, krx_index_message_written) {
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> assert(krx_index_message_read.index_id[krx_index_message_at] == krx_index_message_written.index_id[krx_index_message_at]); krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> assert(krx_index_message_read.isin_code[krx_index_message_at] == krx_index_message_written.isin_code[krx_index_message_at]); krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 6 -> assert(krx_index_message_read.calculation_time[krx_index_message_at] == krx_index_message_written.calculation_time[krx_index_message_at]); krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> assert(krx_index_message_read.index[krx_index_message_at] == krx_index_message_written.index[krx_index_message_at]); krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  assert(krx_index_message_read.index_change_sign_against_the_previous_day == krx_index_message_written.index_change_sign_against_the_previous_day);
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 9 -> assert(krx_index_message_read.index_change_against_the_previous_day[krx_index_message_at] == krx_index_message_written.index_change_against_the_previous_day[krx_index_message_at]); krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 12 -> assert(krx_index_message_read.accumulated_trading_volume[krx_index_message_at] == krx_index_message_written.accumulated_trading_volume[krx_index_message_at]); krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 22 -> assert(krx_index_message_read.accumulated_trading_value[krx_index_message_at] == krx_index_message_written.accumulated_trading_value[krx_index_message_at]); krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 4 -> assert(krx_index_message_read.filler_4[krx_index_message_at] == krx_index_message_written.filler_4[krx_index_message_at]); krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  assert(krx_index_message_read.end_keyword == krx_index_message_written.end_keyword);
  skip
}

/* ---- Krx Estimated Index Message: 82 bytes ----------------------------------- */

/* Krx Estimated Index real-time message. Reports the estimated index value during the pre-opening simultaneous-trading window or during regular session estimation. Identical field layout to the Krx Index Message. */
typedef KrxEstimatedIndexMessage {
  byte index_id[6];
  byte isin_code[12];
  byte calculation_time[6];
  byte index[9];
  byte index_change_sign_against_the_previous_day;
  byte index_change_against_the_previous_day[9];
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[22];
  byte filler_4[4];
  byte end_keyword
};

int krx_estimated_index_message_at;

/* every byte of Krx Estimated Index Message set to one value */
inline fill_krx_estimated_index_message(krx_estimated_index_message_record, krx_estimated_index_message_value) {
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> krx_estimated_index_message_record.index_id[krx_estimated_index_message_at] = krx_estimated_index_message_value; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> krx_estimated_index_message_record.isin_code[krx_estimated_index_message_at] = krx_estimated_index_message_value; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> krx_estimated_index_message_record.calculation_time[krx_estimated_index_message_at] = krx_estimated_index_message_value; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> krx_estimated_index_message_record.index[krx_estimated_index_message_at] = krx_estimated_index_message_value; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_record.index_change_sign_against_the_previous_day = krx_estimated_index_message_value;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> krx_estimated_index_message_record.index_change_against_the_previous_day[krx_estimated_index_message_at] = krx_estimated_index_message_value; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> krx_estimated_index_message_record.accumulated_trading_volume[krx_estimated_index_message_at] = krx_estimated_index_message_value; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 22 -> krx_estimated_index_message_record.accumulated_trading_value[krx_estimated_index_message_at] = krx_estimated_index_message_value; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 4 -> krx_estimated_index_message_record.filler_4[krx_estimated_index_message_at] = krx_estimated_index_message_value; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_record.end_keyword = krx_estimated_index_message_value;
  skip
}

/* each byte of Krx Estimated Index Message set to where it lies, so a field read out of place says so */
inline ramp_krx_estimated_index_message(krx_estimated_index_message_record, krx_estimated_index_message_base) {
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> krx_estimated_index_message_record.index_id[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 0 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> krx_estimated_index_message_record.isin_code[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 6 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> krx_estimated_index_message_record.calculation_time[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 18 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> krx_estimated_index_message_record.index[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 24 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_record.index_change_sign_against_the_previous_day = (krx_estimated_index_message_base + 33 + 1) % 256;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> krx_estimated_index_message_record.index_change_against_the_previous_day[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 34 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> krx_estimated_index_message_record.accumulated_trading_volume[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 43 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 22 -> krx_estimated_index_message_record.accumulated_trading_value[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 55 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 4 -> krx_estimated_index_message_record.filler_4[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 77 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_record.end_keyword = (krx_estimated_index_message_base + 81 + 1) % 256;
  skip
}

/* Krx Estimated Index Message to the wire, 82 bytes from where the cursor stands */
inline encode_krx_estimated_index_message(krx_estimated_index_message_record) {
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> wire[at] = krx_estimated_index_message_record.index_id[krx_estimated_index_message_at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> wire[at] = krx_estimated_index_message_record.isin_code[krx_estimated_index_message_at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> wire[at] = krx_estimated_index_message_record.calculation_time[krx_estimated_index_message_at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> wire[at] = krx_estimated_index_message_record.index[krx_estimated_index_message_at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  wire[at] = krx_estimated_index_message_record.index_change_sign_against_the_previous_day; at = at + 1;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> wire[at] = krx_estimated_index_message_record.index_change_against_the_previous_day[krx_estimated_index_message_at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> wire[at] = krx_estimated_index_message_record.accumulated_trading_volume[krx_estimated_index_message_at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 22 -> wire[at] = krx_estimated_index_message_record.accumulated_trading_value[krx_estimated_index_message_at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 4 -> wire[at] = krx_estimated_index_message_record.filler_4[krx_estimated_index_message_at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  wire[at] = krx_estimated_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Krx Estimated Index Message off the wire, 82 bytes from where the cursor stands */
inline decode_krx_estimated_index_message(krx_estimated_index_message_record) {
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> krx_estimated_index_message_record.index_id[krx_estimated_index_message_at] = wire[at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> krx_estimated_index_message_record.isin_code[krx_estimated_index_message_at] = wire[at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> krx_estimated_index_message_record.calculation_time[krx_estimated_index_message_at] = wire[at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> krx_estimated_index_message_record.index[krx_estimated_index_message_at] = wire[at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_record.index_change_sign_against_the_previous_day = wire[at]; at = at + 1;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> krx_estimated_index_message_record.index_change_against_the_previous_day[krx_estimated_index_message_at] = wire[at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> krx_estimated_index_message_record.accumulated_trading_volume[krx_estimated_index_message_at] = wire[at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 22 -> krx_estimated_index_message_record.accumulated_trading_value[krx_estimated_index_message_at] = wire[at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 4 -> krx_estimated_index_message_record.filler_4[krx_estimated_index_message_at] = wire[at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Krx Estimated Index Message is what was written, byte for byte */
inline equal_krx_estimated_index_message(krx_estimated_index_message_read, krx_estimated_index_message_written) {
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> assert(krx_estimated_index_message_read.index_id[krx_estimated_index_message_at] == krx_estimated_index_message_written.index_id[krx_estimated_index_message_at]); krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> assert(krx_estimated_index_message_read.isin_code[krx_estimated_index_message_at] == krx_estimated_index_message_written.isin_code[krx_estimated_index_message_at]); krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 6 -> assert(krx_estimated_index_message_read.calculation_time[krx_estimated_index_message_at] == krx_estimated_index_message_written.calculation_time[krx_estimated_index_message_at]); krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> assert(krx_estimated_index_message_read.index[krx_estimated_index_message_at] == krx_estimated_index_message_written.index[krx_estimated_index_message_at]); krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  assert(krx_estimated_index_message_read.index_change_sign_against_the_previous_day == krx_estimated_index_message_written.index_change_sign_against_the_previous_day);
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 9 -> assert(krx_estimated_index_message_read.index_change_against_the_previous_day[krx_estimated_index_message_at] == krx_estimated_index_message_written.index_change_against_the_previous_day[krx_estimated_index_message_at]); krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 12 -> assert(krx_estimated_index_message_read.accumulated_trading_volume[krx_estimated_index_message_at] == krx_estimated_index_message_written.accumulated_trading_volume[krx_estimated_index_message_at]); krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 22 -> assert(krx_estimated_index_message_read.accumulated_trading_value[krx_estimated_index_message_at] == krx_estimated_index_message_written.accumulated_trading_value[krx_estimated_index_message_at]); krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 4 -> assert(krx_estimated_index_message_read.filler_4[krx_estimated_index_message_at] == krx_estimated_index_message_written.filler_4[krx_estimated_index_message_at]); krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  assert(krx_estimated_index_message_read.end_keyword == krx_estimated_index_message_written.end_keyword);
  skip
}

/* ---- Global Index Message: 59 bytes ------------------------------------------ */

/* Global Index real-time message. Reports the current value of a foreign index referenced by KRX (e.g. Korea-Taiwan IT Premier, Korea-China Index) in the index's native currency. */
typedef GlobalIndexMessage {
  byte index_id[6];
  byte isin_code[12];
  byte business_date[8];
  byte calculation_time[6];
  byte index[9];
  byte index_change_sign_against_the_previous_day;
  byte index_change_against_the_previous_day[9];
  byte currency_code[3];
  byte filler_4[4];
  byte end_keyword
};

int global_index_message_at;

/* every byte of Global Index Message set to one value */
inline fill_global_index_message(global_index_message_record, global_index_message_value) {
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> global_index_message_record.index_id[global_index_message_at] = global_index_message_value; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 12 -> global_index_message_record.isin_code[global_index_message_at] = global_index_message_value; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 8 -> global_index_message_record.business_date[global_index_message_at] = global_index_message_value; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> global_index_message_record.calculation_time[global_index_message_at] = global_index_message_value; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> global_index_message_record.index[global_index_message_at] = global_index_message_value; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_record.index_change_sign_against_the_previous_day = global_index_message_value;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> global_index_message_record.index_change_against_the_previous_day[global_index_message_at] = global_index_message_value; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 3 -> global_index_message_record.currency_code[global_index_message_at] = global_index_message_value; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 4 -> global_index_message_record.filler_4[global_index_message_at] = global_index_message_value; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_record.end_keyword = global_index_message_value;
  skip
}

/* each byte of Global Index Message set to where it lies, so a field read out of place says so */
inline ramp_global_index_message(global_index_message_record, global_index_message_base) {
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> global_index_message_record.index_id[global_index_message_at] = (global_index_message_base + 0 + global_index_message_at + 1) % 256; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 12 -> global_index_message_record.isin_code[global_index_message_at] = (global_index_message_base + 6 + global_index_message_at + 1) % 256; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 8 -> global_index_message_record.business_date[global_index_message_at] = (global_index_message_base + 18 + global_index_message_at + 1) % 256; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> global_index_message_record.calculation_time[global_index_message_at] = (global_index_message_base + 26 + global_index_message_at + 1) % 256; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> global_index_message_record.index[global_index_message_at] = (global_index_message_base + 32 + global_index_message_at + 1) % 256; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_record.index_change_sign_against_the_previous_day = (global_index_message_base + 41 + 1) % 256;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> global_index_message_record.index_change_against_the_previous_day[global_index_message_at] = (global_index_message_base + 42 + global_index_message_at + 1) % 256; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 3 -> global_index_message_record.currency_code[global_index_message_at] = (global_index_message_base + 51 + global_index_message_at + 1) % 256; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 4 -> global_index_message_record.filler_4[global_index_message_at] = (global_index_message_base + 54 + global_index_message_at + 1) % 256; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_record.end_keyword = (global_index_message_base + 58 + 1) % 256;
  skip
}

/* Global Index Message to the wire, 59 bytes from where the cursor stands */
inline encode_global_index_message(global_index_message_record) {
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> wire[at] = global_index_message_record.index_id[global_index_message_at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 12 -> wire[at] = global_index_message_record.isin_code[global_index_message_at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 8 -> wire[at] = global_index_message_record.business_date[global_index_message_at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> wire[at] = global_index_message_record.calculation_time[global_index_message_at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> wire[at] = global_index_message_record.index[global_index_message_at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  wire[at] = global_index_message_record.index_change_sign_against_the_previous_day; at = at + 1;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> wire[at] = global_index_message_record.index_change_against_the_previous_day[global_index_message_at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 3 -> wire[at] = global_index_message_record.currency_code[global_index_message_at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 4 -> wire[at] = global_index_message_record.filler_4[global_index_message_at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  wire[at] = global_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Global Index Message off the wire, 59 bytes from where the cursor stands */
inline decode_global_index_message(global_index_message_record) {
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> global_index_message_record.index_id[global_index_message_at] = wire[at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 12 -> global_index_message_record.isin_code[global_index_message_at] = wire[at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 8 -> global_index_message_record.business_date[global_index_message_at] = wire[at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> global_index_message_record.calculation_time[global_index_message_at] = wire[at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> global_index_message_record.index[global_index_message_at] = wire[at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_record.index_change_sign_against_the_previous_day = wire[at]; at = at + 1;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> global_index_message_record.index_change_against_the_previous_day[global_index_message_at] = wire[at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 3 -> global_index_message_record.currency_code[global_index_message_at] = wire[at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 4 -> global_index_message_record.filler_4[global_index_message_at] = wire[at]; at = at + 1; global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Global Index Message is what was written, byte for byte */
inline equal_global_index_message(global_index_message_read, global_index_message_written) {
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> assert(global_index_message_read.index_id[global_index_message_at] == global_index_message_written.index_id[global_index_message_at]); global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 12 -> assert(global_index_message_read.isin_code[global_index_message_at] == global_index_message_written.isin_code[global_index_message_at]); global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 8 -> assert(global_index_message_read.business_date[global_index_message_at] == global_index_message_written.business_date[global_index_message_at]); global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 6 -> assert(global_index_message_read.calculation_time[global_index_message_at] == global_index_message_written.calculation_time[global_index_message_at]); global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> assert(global_index_message_read.index[global_index_message_at] == global_index_message_written.index[global_index_message_at]); global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  assert(global_index_message_read.index_change_sign_against_the_previous_day == global_index_message_written.index_change_sign_against_the_previous_day);
  global_index_message_at = 0;
  do
  :: global_index_message_at < 9 -> assert(global_index_message_read.index_change_against_the_previous_day[global_index_message_at] == global_index_message_written.index_change_against_the_previous_day[global_index_message_at]); global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 3 -> assert(global_index_message_read.currency_code[global_index_message_at] == global_index_message_written.currency_code[global_index_message_at]); global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  global_index_message_at = 0;
  do
  :: global_index_message_at < 4 -> assert(global_index_message_read.filler_4[global_index_message_at] == global_index_message_written.filler_4[global_index_message_at]); global_index_message_at = global_index_message_at + 1
  :: else -> break
  od;
  assert(global_index_message_read.end_keyword == global_index_message_written.end_keyword);
  skip
}

/* ---- Bond Prime Index Message: 177 bytes ------------------------------------- */

/* Bond Prime Index intraday calculation. Reports clean and total-earnings index values plus their weighted variants and average duration / convexity / yield for one Group Code and Maturity Code pair. */
typedef BondPrimeIndexMessage {
  byte calculating_date[8];
  byte calculating_time[8];
  byte group_code[5];
  byte maturity_code[3];
  byte clean_price_index_krx[16];
  byte total_earnings_index[16];
  byte clean_price_index_weight[16];
  byte total_earnings_index_weight[16];
  byte weight_of_clean_index_value_for_integrity_index_weight[16];
  byte weight_of_sum_index_value_for_integrity_index_weight[16];
  byte average_duration[16];
  byte average_convexity[16];
  byte average_yld[16];
  byte transmission_time[8];
  byte end_keyword
};

int bond_prime_index_message_at;

/* every byte of Bond Prime Index Message set to one value */
inline fill_bond_prime_index_message(bond_prime_index_message_record, bond_prime_index_message_value) {
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> bond_prime_index_message_record.calculating_date[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> bond_prime_index_message_record.calculating_time[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 5 -> bond_prime_index_message_record.group_code[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 3 -> bond_prime_index_message_record.maturity_code[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.clean_price_index_krx[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.total_earnings_index[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.clean_price_index_weight[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.total_earnings_index_weight[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.weight_of_clean_index_value_for_integrity_index_weight[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.weight_of_sum_index_value_for_integrity_index_weight[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.average_duration[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.average_convexity[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.average_yld[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> bond_prime_index_message_record.transmission_time[bond_prime_index_message_at] = bond_prime_index_message_value; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_record.end_keyword = bond_prime_index_message_value;
  skip
}

/* each byte of Bond Prime Index Message set to where it lies, so a field read out of place says so */
inline ramp_bond_prime_index_message(bond_prime_index_message_record, bond_prime_index_message_base) {
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> bond_prime_index_message_record.calculating_date[bond_prime_index_message_at] = (bond_prime_index_message_base + 0 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> bond_prime_index_message_record.calculating_time[bond_prime_index_message_at] = (bond_prime_index_message_base + 8 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 5 -> bond_prime_index_message_record.group_code[bond_prime_index_message_at] = (bond_prime_index_message_base + 16 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 3 -> bond_prime_index_message_record.maturity_code[bond_prime_index_message_at] = (bond_prime_index_message_base + 21 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.clean_price_index_krx[bond_prime_index_message_at] = (bond_prime_index_message_base + 24 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.total_earnings_index[bond_prime_index_message_at] = (bond_prime_index_message_base + 40 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.clean_price_index_weight[bond_prime_index_message_at] = (bond_prime_index_message_base + 56 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.total_earnings_index_weight[bond_prime_index_message_at] = (bond_prime_index_message_base + 72 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.weight_of_clean_index_value_for_integrity_index_weight[bond_prime_index_message_at] = (bond_prime_index_message_base + 88 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.weight_of_sum_index_value_for_integrity_index_weight[bond_prime_index_message_at] = (bond_prime_index_message_base + 104 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.average_duration[bond_prime_index_message_at] = (bond_prime_index_message_base + 120 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.average_convexity[bond_prime_index_message_at] = (bond_prime_index_message_base + 136 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.average_yld[bond_prime_index_message_at] = (bond_prime_index_message_base + 152 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> bond_prime_index_message_record.transmission_time[bond_prime_index_message_at] = (bond_prime_index_message_base + 168 + bond_prime_index_message_at + 1) % 256; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_record.end_keyword = (bond_prime_index_message_base + 176 + 1) % 256;
  skip
}

/* Bond Prime Index Message to the wire, 177 bytes from where the cursor stands */
inline encode_bond_prime_index_message(bond_prime_index_message_record) {
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> wire[at] = bond_prime_index_message_record.calculating_date[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> wire[at] = bond_prime_index_message_record.calculating_time[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 5 -> wire[at] = bond_prime_index_message_record.group_code[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 3 -> wire[at] = bond_prime_index_message_record.maturity_code[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> wire[at] = bond_prime_index_message_record.clean_price_index_krx[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> wire[at] = bond_prime_index_message_record.total_earnings_index[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> wire[at] = bond_prime_index_message_record.clean_price_index_weight[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> wire[at] = bond_prime_index_message_record.total_earnings_index_weight[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> wire[at] = bond_prime_index_message_record.weight_of_clean_index_value_for_integrity_index_weight[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> wire[at] = bond_prime_index_message_record.weight_of_sum_index_value_for_integrity_index_weight[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> wire[at] = bond_prime_index_message_record.average_duration[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> wire[at] = bond_prime_index_message_record.average_convexity[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> wire[at] = bond_prime_index_message_record.average_yld[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> wire[at] = bond_prime_index_message_record.transmission_time[bond_prime_index_message_at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_prime_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Bond Prime Index Message off the wire, 177 bytes from where the cursor stands */
inline decode_bond_prime_index_message(bond_prime_index_message_record) {
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> bond_prime_index_message_record.calculating_date[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> bond_prime_index_message_record.calculating_time[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 5 -> bond_prime_index_message_record.group_code[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 3 -> bond_prime_index_message_record.maturity_code[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.clean_price_index_krx[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.total_earnings_index[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.clean_price_index_weight[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.total_earnings_index_weight[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.weight_of_clean_index_value_for_integrity_index_weight[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.weight_of_sum_index_value_for_integrity_index_weight[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.average_duration[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.average_convexity[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> bond_prime_index_message_record.average_yld[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> bond_prime_index_message_record.transmission_time[bond_prime_index_message_at] = wire[at]; at = at + 1; bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Bond Prime Index Message is what was written, byte for byte */
inline equal_bond_prime_index_message(bond_prime_index_message_read, bond_prime_index_message_written) {
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> assert(bond_prime_index_message_read.calculating_date[bond_prime_index_message_at] == bond_prime_index_message_written.calculating_date[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> assert(bond_prime_index_message_read.calculating_time[bond_prime_index_message_at] == bond_prime_index_message_written.calculating_time[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 5 -> assert(bond_prime_index_message_read.group_code[bond_prime_index_message_at] == bond_prime_index_message_written.group_code[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 3 -> assert(bond_prime_index_message_read.maturity_code[bond_prime_index_message_at] == bond_prime_index_message_written.maturity_code[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> assert(bond_prime_index_message_read.clean_price_index_krx[bond_prime_index_message_at] == bond_prime_index_message_written.clean_price_index_krx[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> assert(bond_prime_index_message_read.total_earnings_index[bond_prime_index_message_at] == bond_prime_index_message_written.total_earnings_index[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> assert(bond_prime_index_message_read.clean_price_index_weight[bond_prime_index_message_at] == bond_prime_index_message_written.clean_price_index_weight[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> assert(bond_prime_index_message_read.total_earnings_index_weight[bond_prime_index_message_at] == bond_prime_index_message_written.total_earnings_index_weight[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> assert(bond_prime_index_message_read.weight_of_clean_index_value_for_integrity_index_weight[bond_prime_index_message_at] == bond_prime_index_message_written.weight_of_clean_index_value_for_integrity_index_weight[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> assert(bond_prime_index_message_read.weight_of_sum_index_value_for_integrity_index_weight[bond_prime_index_message_at] == bond_prime_index_message_written.weight_of_sum_index_value_for_integrity_index_weight[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> assert(bond_prime_index_message_read.average_duration[bond_prime_index_message_at] == bond_prime_index_message_written.average_duration[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> assert(bond_prime_index_message_read.average_convexity[bond_prime_index_message_at] == bond_prime_index_message_written.average_convexity[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 16 -> assert(bond_prime_index_message_read.average_yld[bond_prime_index_message_at] == bond_prime_index_message_written.average_yld[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  bond_prime_index_message_at = 0;
  do
  :: bond_prime_index_message_at < 8 -> assert(bond_prime_index_message_read.transmission_time[bond_prime_index_message_at] == bond_prime_index_message_written.transmission_time[bond_prime_index_message_at]); bond_prime_index_message_at = bond_prime_index_message_at + 1
  :: else -> break
  od;
  assert(bond_prime_index_message_read.end_keyword == bond_prime_index_message_written.end_keyword);
  skip
}

/* ---- Bond Ktb Index Message: 114 bytes --------------------------------------- */

/* Bond KTB Index intraday calculation. Reports total profit, clean price, market price, call and zero re-investment indices, futures basis price, duration, convexity, and YTM for one KTB-based Bond Index ID. */
typedef BondKtbIndexMessage {
  byte bond_index_id[6];
  byte base_date[8];
  byte base_time[6];
  byte total_profit_index[11];
  byte clean_price_index_ktb[11];
  byte market_price_index_ktb[11];
  byte call_re_investment_index_ktb[11];
  byte zero_re_investment_index_ktb[11];
  byte futures_basis_price[10];
  byte duration[7];
  byte convexity[7];
  byte average_ytm[7];
  byte average_forward_ytm[7];
  byte end_keyword
};

int bond_ktb_index_message_at;

/* every byte of Bond Ktb Index Message set to one value */
inline fill_bond_ktb_index_message(bond_ktb_index_message_record, bond_ktb_index_message_value) {
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> bond_ktb_index_message_record.bond_index_id[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 8 -> bond_ktb_index_message_record.base_date[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> bond_ktb_index_message_record.base_time[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.total_profit_index[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.clean_price_index_ktb[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.market_price_index_ktb[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.call_re_investment_index_ktb[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.zero_re_investment_index_ktb[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 10 -> bond_ktb_index_message_record.futures_basis_price[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.duration[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.convexity[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.average_ytm[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.average_forward_ytm[bond_ktb_index_message_at] = bond_ktb_index_message_value; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_record.end_keyword = bond_ktb_index_message_value;
  skip
}

/* each byte of Bond Ktb Index Message set to where it lies, so a field read out of place says so */
inline ramp_bond_ktb_index_message(bond_ktb_index_message_record, bond_ktb_index_message_base) {
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> bond_ktb_index_message_record.bond_index_id[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 0 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 8 -> bond_ktb_index_message_record.base_date[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 6 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> bond_ktb_index_message_record.base_time[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 14 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.total_profit_index[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 20 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.clean_price_index_ktb[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 31 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.market_price_index_ktb[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 42 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.call_re_investment_index_ktb[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 53 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.zero_re_investment_index_ktb[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 64 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 10 -> bond_ktb_index_message_record.futures_basis_price[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 75 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.duration[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 85 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.convexity[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 92 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.average_ytm[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 99 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.average_forward_ytm[bond_ktb_index_message_at] = (bond_ktb_index_message_base + 106 + bond_ktb_index_message_at + 1) % 256; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_record.end_keyword = (bond_ktb_index_message_base + 113 + 1) % 256;
  skip
}

/* Bond Ktb Index Message to the wire, 114 bytes from where the cursor stands */
inline encode_bond_ktb_index_message(bond_ktb_index_message_record) {
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> wire[at] = bond_ktb_index_message_record.bond_index_id[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 8 -> wire[at] = bond_ktb_index_message_record.base_date[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> wire[at] = bond_ktb_index_message_record.base_time[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> wire[at] = bond_ktb_index_message_record.total_profit_index[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> wire[at] = bond_ktb_index_message_record.clean_price_index_ktb[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> wire[at] = bond_ktb_index_message_record.market_price_index_ktb[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> wire[at] = bond_ktb_index_message_record.call_re_investment_index_ktb[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> wire[at] = bond_ktb_index_message_record.zero_re_investment_index_ktb[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 10 -> wire[at] = bond_ktb_index_message_record.futures_basis_price[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> wire[at] = bond_ktb_index_message_record.duration[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> wire[at] = bond_ktb_index_message_record.convexity[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> wire[at] = bond_ktb_index_message_record.average_ytm[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> wire[at] = bond_ktb_index_message_record.average_forward_ytm[bond_ktb_index_message_at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_ktb_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Bond Ktb Index Message off the wire, 114 bytes from where the cursor stands */
inline decode_bond_ktb_index_message(bond_ktb_index_message_record) {
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> bond_ktb_index_message_record.bond_index_id[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 8 -> bond_ktb_index_message_record.base_date[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> bond_ktb_index_message_record.base_time[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.total_profit_index[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.clean_price_index_ktb[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.market_price_index_ktb[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.call_re_investment_index_ktb[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> bond_ktb_index_message_record.zero_re_investment_index_ktb[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 10 -> bond_ktb_index_message_record.futures_basis_price[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.duration[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.convexity[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.average_ytm[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> bond_ktb_index_message_record.average_forward_ytm[bond_ktb_index_message_at] = wire[at]; at = at + 1; bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Bond Ktb Index Message is what was written, byte for byte */
inline equal_bond_ktb_index_message(bond_ktb_index_message_read, bond_ktb_index_message_written) {
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> assert(bond_ktb_index_message_read.bond_index_id[bond_ktb_index_message_at] == bond_ktb_index_message_written.bond_index_id[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 8 -> assert(bond_ktb_index_message_read.base_date[bond_ktb_index_message_at] == bond_ktb_index_message_written.base_date[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 6 -> assert(bond_ktb_index_message_read.base_time[bond_ktb_index_message_at] == bond_ktb_index_message_written.base_time[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> assert(bond_ktb_index_message_read.total_profit_index[bond_ktb_index_message_at] == bond_ktb_index_message_written.total_profit_index[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> assert(bond_ktb_index_message_read.clean_price_index_ktb[bond_ktb_index_message_at] == bond_ktb_index_message_written.clean_price_index_ktb[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> assert(bond_ktb_index_message_read.market_price_index_ktb[bond_ktb_index_message_at] == bond_ktb_index_message_written.market_price_index_ktb[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> assert(bond_ktb_index_message_read.call_re_investment_index_ktb[bond_ktb_index_message_at] == bond_ktb_index_message_written.call_re_investment_index_ktb[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 11 -> assert(bond_ktb_index_message_read.zero_re_investment_index_ktb[bond_ktb_index_message_at] == bond_ktb_index_message_written.zero_re_investment_index_ktb[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 10 -> assert(bond_ktb_index_message_read.futures_basis_price[bond_ktb_index_message_at] == bond_ktb_index_message_written.futures_basis_price[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> assert(bond_ktb_index_message_read.duration[bond_ktb_index_message_at] == bond_ktb_index_message_written.duration[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> assert(bond_ktb_index_message_read.convexity[bond_ktb_index_message_at] == bond_ktb_index_message_written.convexity[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> assert(bond_ktb_index_message_read.average_ytm[bond_ktb_index_message_at] == bond_ktb_index_message_written.average_ytm[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_message_at = 0;
  do
  :: bond_ktb_index_message_at < 7 -> assert(bond_ktb_index_message_read.average_forward_ytm[bond_ktb_index_message_at] == bond_ktb_index_message_written.average_forward_ytm[bond_ktb_index_message_at]); bond_ktb_index_message_at = bond_ktb_index_message_at + 1
  :: else -> break
  od;
  assert(bond_ktb_index_message_read.end_keyword == bond_ktb_index_message_written.end_keyword);
  skip
}

/* ---- Bond Ktb Index Term Structure Message: 61 bytes ------------------------- */

/* Bond KTB Index TermStructure. One record per ISIN constituent of a KTB Index showing its basis price, clean price, YTM, and the Index Constituent flag. */
typedef BondKtbIndexTermStructureMessage {
  byte bond_index_id[6];
  byte base_date[8];
  byte base_time[6];
  byte isin_code[12];
  byte basis_price[10];
  byte clean_price[10];
  byte average_ytm[7];
  byte index_constituent;
  byte end_keyword
};

int bond_ktb_index_term_structure_message_at;

/* every byte of Bond Ktb Index Term Structure Message set to one value */
inline fill_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_record, bond_ktb_index_term_structure_message_value) {
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> bond_ktb_index_term_structure_message_record.bond_index_id[bond_ktb_index_term_structure_message_at] = bond_ktb_index_term_structure_message_value; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 8 -> bond_ktb_index_term_structure_message_record.base_date[bond_ktb_index_term_structure_message_at] = bond_ktb_index_term_structure_message_value; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> bond_ktb_index_term_structure_message_record.base_time[bond_ktb_index_term_structure_message_at] = bond_ktb_index_term_structure_message_value; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 12 -> bond_ktb_index_term_structure_message_record.isin_code[bond_ktb_index_term_structure_message_at] = bond_ktb_index_term_structure_message_value; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> bond_ktb_index_term_structure_message_record.basis_price[bond_ktb_index_term_structure_message_at] = bond_ktb_index_term_structure_message_value; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> bond_ktb_index_term_structure_message_record.clean_price[bond_ktb_index_term_structure_message_at] = bond_ktb_index_term_structure_message_value; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 7 -> bond_ktb_index_term_structure_message_record.average_ytm[bond_ktb_index_term_structure_message_at] = bond_ktb_index_term_structure_message_value; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_record.index_constituent = bond_ktb_index_term_structure_message_value;
  bond_ktb_index_term_structure_message_record.end_keyword = bond_ktb_index_term_structure_message_value;
  skip
}

/* each byte of Bond Ktb Index Term Structure Message set to where it lies, so a field read out of place says so */
inline ramp_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_record, bond_ktb_index_term_structure_message_base) {
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> bond_ktb_index_term_structure_message_record.bond_index_id[bond_ktb_index_term_structure_message_at] = (bond_ktb_index_term_structure_message_base + 0 + bond_ktb_index_term_structure_message_at + 1) % 256; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 8 -> bond_ktb_index_term_structure_message_record.base_date[bond_ktb_index_term_structure_message_at] = (bond_ktb_index_term_structure_message_base + 6 + bond_ktb_index_term_structure_message_at + 1) % 256; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> bond_ktb_index_term_structure_message_record.base_time[bond_ktb_index_term_structure_message_at] = (bond_ktb_index_term_structure_message_base + 14 + bond_ktb_index_term_structure_message_at + 1) % 256; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 12 -> bond_ktb_index_term_structure_message_record.isin_code[bond_ktb_index_term_structure_message_at] = (bond_ktb_index_term_structure_message_base + 20 + bond_ktb_index_term_structure_message_at + 1) % 256; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> bond_ktb_index_term_structure_message_record.basis_price[bond_ktb_index_term_structure_message_at] = (bond_ktb_index_term_structure_message_base + 32 + bond_ktb_index_term_structure_message_at + 1) % 256; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> bond_ktb_index_term_structure_message_record.clean_price[bond_ktb_index_term_structure_message_at] = (bond_ktb_index_term_structure_message_base + 42 + bond_ktb_index_term_structure_message_at + 1) % 256; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 7 -> bond_ktb_index_term_structure_message_record.average_ytm[bond_ktb_index_term_structure_message_at] = (bond_ktb_index_term_structure_message_base + 52 + bond_ktb_index_term_structure_message_at + 1) % 256; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_record.index_constituent = (bond_ktb_index_term_structure_message_base + 59 + 1) % 256;
  bond_ktb_index_term_structure_message_record.end_keyword = (bond_ktb_index_term_structure_message_base + 60 + 1) % 256;
  skip
}

/* Bond Ktb Index Term Structure Message to the wire, 61 bytes from where the cursor stands */
inline encode_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_record) {
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> wire[at] = bond_ktb_index_term_structure_message_record.bond_index_id[bond_ktb_index_term_structure_message_at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 8 -> wire[at] = bond_ktb_index_term_structure_message_record.base_date[bond_ktb_index_term_structure_message_at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> wire[at] = bond_ktb_index_term_structure_message_record.base_time[bond_ktb_index_term_structure_message_at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 12 -> wire[at] = bond_ktb_index_term_structure_message_record.isin_code[bond_ktb_index_term_structure_message_at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> wire[at] = bond_ktb_index_term_structure_message_record.basis_price[bond_ktb_index_term_structure_message_at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> wire[at] = bond_ktb_index_term_structure_message_record.clean_price[bond_ktb_index_term_structure_message_at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 7 -> wire[at] = bond_ktb_index_term_structure_message_record.average_ytm[bond_ktb_index_term_structure_message_at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_ktb_index_term_structure_message_record.index_constituent; at = at + 1;
  wire[at] = bond_ktb_index_term_structure_message_record.end_keyword; at = at + 1;
  skip
}

/* Bond Ktb Index Term Structure Message off the wire, 61 bytes from where the cursor stands */
inline decode_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_record) {
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> bond_ktb_index_term_structure_message_record.bond_index_id[bond_ktb_index_term_structure_message_at] = wire[at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 8 -> bond_ktb_index_term_structure_message_record.base_date[bond_ktb_index_term_structure_message_at] = wire[at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> bond_ktb_index_term_structure_message_record.base_time[bond_ktb_index_term_structure_message_at] = wire[at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 12 -> bond_ktb_index_term_structure_message_record.isin_code[bond_ktb_index_term_structure_message_at] = wire[at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> bond_ktb_index_term_structure_message_record.basis_price[bond_ktb_index_term_structure_message_at] = wire[at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> bond_ktb_index_term_structure_message_record.clean_price[bond_ktb_index_term_structure_message_at] = wire[at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 7 -> bond_ktb_index_term_structure_message_record.average_ytm[bond_ktb_index_term_structure_message_at] = wire[at]; at = at + 1; bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_record.index_constituent = wire[at]; at = at + 1;
  bond_ktb_index_term_structure_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Bond Ktb Index Term Structure Message is what was written, byte for byte */
inline equal_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_read, bond_ktb_index_term_structure_message_written) {
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> assert(bond_ktb_index_term_structure_message_read.bond_index_id[bond_ktb_index_term_structure_message_at] == bond_ktb_index_term_structure_message_written.bond_index_id[bond_ktb_index_term_structure_message_at]); bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 8 -> assert(bond_ktb_index_term_structure_message_read.base_date[bond_ktb_index_term_structure_message_at] == bond_ktb_index_term_structure_message_written.base_date[bond_ktb_index_term_structure_message_at]); bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 6 -> assert(bond_ktb_index_term_structure_message_read.base_time[bond_ktb_index_term_structure_message_at] == bond_ktb_index_term_structure_message_written.base_time[bond_ktb_index_term_structure_message_at]); bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 12 -> assert(bond_ktb_index_term_structure_message_read.isin_code[bond_ktb_index_term_structure_message_at] == bond_ktb_index_term_structure_message_written.isin_code[bond_ktb_index_term_structure_message_at]); bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> assert(bond_ktb_index_term_structure_message_read.basis_price[bond_ktb_index_term_structure_message_at] == bond_ktb_index_term_structure_message_written.basis_price[bond_ktb_index_term_structure_message_at]); bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 10 -> assert(bond_ktb_index_term_structure_message_read.clean_price[bond_ktb_index_term_structure_message_at] == bond_ktb_index_term_structure_message_written.clean_price[bond_ktb_index_term_structure_message_at]); bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  bond_ktb_index_term_structure_message_at = 0;
  do
  :: bond_ktb_index_term_structure_message_at < 7 -> assert(bond_ktb_index_term_structure_message_read.average_ytm[bond_ktb_index_term_structure_message_at] == bond_ktb_index_term_structure_message_written.average_ytm[bond_ktb_index_term_structure_message_at]); bond_ktb_index_term_structure_message_at = bond_ktb_index_term_structure_message_at + 1
  :: else -> break
  od;
  assert(bond_ktb_index_term_structure_message_read.index_constituent == bond_ktb_index_term_structure_message_written.index_constituent);
  assert(bond_ktb_index_term_structure_message_read.end_keyword == bond_ktb_index_term_structure_message_written.end_keyword);
  skip
}

/* ---- Bond Index Krx Message: 518 bytes --------------------------------------- */

/* KRX Aggregate Bond Index (AA- or higher) end-of-day index data. Reports clean-price, total-earnings, market-price, and re-investment indices, their weighted variants, integrity-index weights, average duration, convexity, yield, coupon, remaining maturity, spread, market capitalization, and accumulated cash flows for one Bond Index ID. */
typedef BondIndexKrxMessage {
  byte message_sequence_number[8];
  byte calculating_date[8];
  byte index_id[6];
  byte clean_price_index_krx[16];
  byte total_earnings_index[16];
  byte market_price_index_krx[16];
  byte zero_re_investment_index_krx[16];
  byte call_re_investment_index_krx[16];
  byte clean_price_index_weight[16];
  byte total_earnings_index_weight[16];
  byte market_price_index_weight[16];
  byte zero_re_investment_index_weight[16];
  byte call_re_investment_index_weight[16];
  byte weight_of_clean_index_value_for_integrity_index_weight[16];
  byte weight_of_sum_index_value_for_integrity_index_weight[16];
  byte weight_of_zero_re_investment_index_value_for_integrity_index_weight[16];
  byte weight_of_call_re_investment_index_value_for_integrity_index_weight[16];
  byte average_duration[16];
  byte average_convexity[16];
  byte average_yld[16];
  byte average_coupon_price[16];
  byte average_remaining_maturity_price[16];
  byte average_current_yield[16];
  byte average_spread_sign;
  byte average_spread[16];
  byte index_number_of_securities[8];
  byte issued_amount[20];
  byte issued_amount_weight[16];
  byte index_market_capitalization[20];
  byte market_capitalization_weight[16];
  byte accumulated_cash[26];
  byte cash_inflow[26];
  byte reinvest_call_cash[26];
  byte end_keyword
};

int bond_index_krx_message_at;

/* every byte of Bond Index Krx Message set to one value */
inline fill_bond_index_krx_message(bond_index_krx_message_record, bond_index_krx_message_value) {
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> bond_index_krx_message_record.message_sequence_number[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> bond_index_krx_message_record.calculating_date[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 6 -> bond_index_krx_message_record.index_id[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.clean_price_index_krx[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.total_earnings_index[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.market_price_index_krx[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.zero_re_investment_index_krx[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.call_re_investment_index_krx[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.clean_price_index_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.total_earnings_index_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.market_price_index_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.zero_re_investment_index_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.call_re_investment_index_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_clean_index_value_for_integrity_index_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_sum_index_value_for_integrity_index_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_zero_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_call_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_duration[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_convexity[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_yld[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_coupon_price[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_remaining_maturity_price[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_current_yield[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_record.average_spread_sign = bond_index_krx_message_value;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_spread[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> bond_index_krx_message_record.index_number_of_securities[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> bond_index_krx_message_record.issued_amount[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.issued_amount_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> bond_index_krx_message_record.index_market_capitalization[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.market_capitalization_weight[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> bond_index_krx_message_record.accumulated_cash[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> bond_index_krx_message_record.cash_inflow[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> bond_index_krx_message_record.reinvest_call_cash[bond_index_krx_message_at] = bond_index_krx_message_value; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_record.end_keyword = bond_index_krx_message_value;
  skip
}

/* each byte of Bond Index Krx Message set to where it lies, so a field read out of place says so */
inline ramp_bond_index_krx_message(bond_index_krx_message_record, bond_index_krx_message_base) {
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> bond_index_krx_message_record.message_sequence_number[bond_index_krx_message_at] = (bond_index_krx_message_base + 0 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> bond_index_krx_message_record.calculating_date[bond_index_krx_message_at] = (bond_index_krx_message_base + 8 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 6 -> bond_index_krx_message_record.index_id[bond_index_krx_message_at] = (bond_index_krx_message_base + 16 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.clean_price_index_krx[bond_index_krx_message_at] = (bond_index_krx_message_base + 22 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.total_earnings_index[bond_index_krx_message_at] = (bond_index_krx_message_base + 38 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.market_price_index_krx[bond_index_krx_message_at] = (bond_index_krx_message_base + 54 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.zero_re_investment_index_krx[bond_index_krx_message_at] = (bond_index_krx_message_base + 70 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.call_re_investment_index_krx[bond_index_krx_message_at] = (bond_index_krx_message_base + 86 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.clean_price_index_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 102 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.total_earnings_index_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 118 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.market_price_index_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 134 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.zero_re_investment_index_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 150 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.call_re_investment_index_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 166 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_clean_index_value_for_integrity_index_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 182 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_sum_index_value_for_integrity_index_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 198 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_zero_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 214 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_call_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 230 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_duration[bond_index_krx_message_at] = (bond_index_krx_message_base + 246 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_convexity[bond_index_krx_message_at] = (bond_index_krx_message_base + 262 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_yld[bond_index_krx_message_at] = (bond_index_krx_message_base + 278 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_coupon_price[bond_index_krx_message_at] = (bond_index_krx_message_base + 294 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_remaining_maturity_price[bond_index_krx_message_at] = (bond_index_krx_message_base + 310 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_current_yield[bond_index_krx_message_at] = (bond_index_krx_message_base + 326 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_record.average_spread_sign = (bond_index_krx_message_base + 342 + 1) % 256;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_spread[bond_index_krx_message_at] = (bond_index_krx_message_base + 343 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> bond_index_krx_message_record.index_number_of_securities[bond_index_krx_message_at] = (bond_index_krx_message_base + 359 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> bond_index_krx_message_record.issued_amount[bond_index_krx_message_at] = (bond_index_krx_message_base + 367 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.issued_amount_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 387 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> bond_index_krx_message_record.index_market_capitalization[bond_index_krx_message_at] = (bond_index_krx_message_base + 403 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.market_capitalization_weight[bond_index_krx_message_at] = (bond_index_krx_message_base + 423 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> bond_index_krx_message_record.accumulated_cash[bond_index_krx_message_at] = (bond_index_krx_message_base + 439 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> bond_index_krx_message_record.cash_inflow[bond_index_krx_message_at] = (bond_index_krx_message_base + 465 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> bond_index_krx_message_record.reinvest_call_cash[bond_index_krx_message_at] = (bond_index_krx_message_base + 491 + bond_index_krx_message_at + 1) % 256; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_record.end_keyword = (bond_index_krx_message_base + 517 + 1) % 256;
  skip
}

/* Bond Index Krx Message to the wire, 518 bytes from where the cursor stands */
inline encode_bond_index_krx_message(bond_index_krx_message_record) {
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> wire[at] = bond_index_krx_message_record.message_sequence_number[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> wire[at] = bond_index_krx_message_record.calculating_date[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 6 -> wire[at] = bond_index_krx_message_record.index_id[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.clean_price_index_krx[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.total_earnings_index[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.market_price_index_krx[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.zero_re_investment_index_krx[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.call_re_investment_index_krx[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.clean_price_index_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.total_earnings_index_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.market_price_index_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.zero_re_investment_index_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.call_re_investment_index_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.weight_of_clean_index_value_for_integrity_index_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.weight_of_sum_index_value_for_integrity_index_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.weight_of_zero_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.weight_of_call_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.average_duration[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.average_convexity[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.average_yld[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.average_coupon_price[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.average_remaining_maturity_price[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.average_current_yield[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_index_krx_message_record.average_spread_sign; at = at + 1;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.average_spread[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> wire[at] = bond_index_krx_message_record.index_number_of_securities[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> wire[at] = bond_index_krx_message_record.issued_amount[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.issued_amount_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> wire[at] = bond_index_krx_message_record.index_market_capitalization[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> wire[at] = bond_index_krx_message_record.market_capitalization_weight[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> wire[at] = bond_index_krx_message_record.accumulated_cash[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> wire[at] = bond_index_krx_message_record.cash_inflow[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> wire[at] = bond_index_krx_message_record.reinvest_call_cash[bond_index_krx_message_at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_index_krx_message_record.end_keyword; at = at + 1;
  skip
}

/* Bond Index Krx Message off the wire, 518 bytes from where the cursor stands */
inline decode_bond_index_krx_message(bond_index_krx_message_record) {
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> bond_index_krx_message_record.message_sequence_number[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> bond_index_krx_message_record.calculating_date[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 6 -> bond_index_krx_message_record.index_id[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.clean_price_index_krx[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.total_earnings_index[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.market_price_index_krx[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.zero_re_investment_index_krx[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.call_re_investment_index_krx[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.clean_price_index_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.total_earnings_index_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.market_price_index_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.zero_re_investment_index_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.call_re_investment_index_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_clean_index_value_for_integrity_index_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_sum_index_value_for_integrity_index_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_zero_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.weight_of_call_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_duration[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_convexity[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_yld[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_coupon_price[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_remaining_maturity_price[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_current_yield[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_record.average_spread_sign = wire[at]; at = at + 1;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.average_spread[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> bond_index_krx_message_record.index_number_of_securities[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> bond_index_krx_message_record.issued_amount[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.issued_amount_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> bond_index_krx_message_record.index_market_capitalization[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> bond_index_krx_message_record.market_capitalization_weight[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> bond_index_krx_message_record.accumulated_cash[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> bond_index_krx_message_record.cash_inflow[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> bond_index_krx_message_record.reinvest_call_cash[bond_index_krx_message_at] = wire[at]; at = at + 1; bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Bond Index Krx Message is what was written, byte for byte */
inline equal_bond_index_krx_message(bond_index_krx_message_read, bond_index_krx_message_written) {
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> assert(bond_index_krx_message_read.message_sequence_number[bond_index_krx_message_at] == bond_index_krx_message_written.message_sequence_number[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> assert(bond_index_krx_message_read.calculating_date[bond_index_krx_message_at] == bond_index_krx_message_written.calculating_date[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 6 -> assert(bond_index_krx_message_read.index_id[bond_index_krx_message_at] == bond_index_krx_message_written.index_id[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.clean_price_index_krx[bond_index_krx_message_at] == bond_index_krx_message_written.clean_price_index_krx[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.total_earnings_index[bond_index_krx_message_at] == bond_index_krx_message_written.total_earnings_index[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.market_price_index_krx[bond_index_krx_message_at] == bond_index_krx_message_written.market_price_index_krx[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.zero_re_investment_index_krx[bond_index_krx_message_at] == bond_index_krx_message_written.zero_re_investment_index_krx[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.call_re_investment_index_krx[bond_index_krx_message_at] == bond_index_krx_message_written.call_re_investment_index_krx[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.clean_price_index_weight[bond_index_krx_message_at] == bond_index_krx_message_written.clean_price_index_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.total_earnings_index_weight[bond_index_krx_message_at] == bond_index_krx_message_written.total_earnings_index_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.market_price_index_weight[bond_index_krx_message_at] == bond_index_krx_message_written.market_price_index_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.zero_re_investment_index_weight[bond_index_krx_message_at] == bond_index_krx_message_written.zero_re_investment_index_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.call_re_investment_index_weight[bond_index_krx_message_at] == bond_index_krx_message_written.call_re_investment_index_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.weight_of_clean_index_value_for_integrity_index_weight[bond_index_krx_message_at] == bond_index_krx_message_written.weight_of_clean_index_value_for_integrity_index_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.weight_of_sum_index_value_for_integrity_index_weight[bond_index_krx_message_at] == bond_index_krx_message_written.weight_of_sum_index_value_for_integrity_index_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.weight_of_zero_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at] == bond_index_krx_message_written.weight_of_zero_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.weight_of_call_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at] == bond_index_krx_message_written.weight_of_call_re_investment_index_value_for_integrity_index_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.average_duration[bond_index_krx_message_at] == bond_index_krx_message_written.average_duration[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.average_convexity[bond_index_krx_message_at] == bond_index_krx_message_written.average_convexity[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.average_yld[bond_index_krx_message_at] == bond_index_krx_message_written.average_yld[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.average_coupon_price[bond_index_krx_message_at] == bond_index_krx_message_written.average_coupon_price[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.average_remaining_maturity_price[bond_index_krx_message_at] == bond_index_krx_message_written.average_remaining_maturity_price[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.average_current_yield[bond_index_krx_message_at] == bond_index_krx_message_written.average_current_yield[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  assert(bond_index_krx_message_read.average_spread_sign == bond_index_krx_message_written.average_spread_sign);
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.average_spread[bond_index_krx_message_at] == bond_index_krx_message_written.average_spread[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 8 -> assert(bond_index_krx_message_read.index_number_of_securities[bond_index_krx_message_at] == bond_index_krx_message_written.index_number_of_securities[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> assert(bond_index_krx_message_read.issued_amount[bond_index_krx_message_at] == bond_index_krx_message_written.issued_amount[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.issued_amount_weight[bond_index_krx_message_at] == bond_index_krx_message_written.issued_amount_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 20 -> assert(bond_index_krx_message_read.index_market_capitalization[bond_index_krx_message_at] == bond_index_krx_message_written.index_market_capitalization[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 16 -> assert(bond_index_krx_message_read.market_capitalization_weight[bond_index_krx_message_at] == bond_index_krx_message_written.market_capitalization_weight[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> assert(bond_index_krx_message_read.accumulated_cash[bond_index_krx_message_at] == bond_index_krx_message_written.accumulated_cash[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> assert(bond_index_krx_message_read.cash_inflow[bond_index_krx_message_at] == bond_index_krx_message_written.cash_inflow[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  bond_index_krx_message_at = 0;
  do
  :: bond_index_krx_message_at < 26 -> assert(bond_index_krx_message_read.reinvest_call_cash[bond_index_krx_message_at] == bond_index_krx_message_written.reinvest_call_cash[bond_index_krx_message_at]); bond_index_krx_message_at = bond_index_krx_message_at + 1
  :: else -> break
  od;
  assert(bond_index_krx_message_read.end_keyword == bond_index_krx_message_written.end_keyword);
  skip
}

/* ---- Equity Derivatives Underlying Snapshot Kospi Message: 131 bytes --------- */

/* Equity Derivatives Underlying Asset Snapshot for KOSPI underlying. Periodic snapshot of underlying-asset state for equity-derivatives reference. */
typedef EquityDerivativesUnderlyingSnapshotKospiMessage {
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte price_change_against_previous_day;
  byte a_price_change_against_the_previous_day[11];
  byte trading_price[11];
  byte opening_price[11];
  byte todays_high[11];
  byte todays_low[11];
  byte closing_price_type_code;
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[22];
  byte trading_halt;
  byte the_best_ask[11];
  byte the_best_bid[11];
  byte end_keyword
};

int equity_derivatives_underlying_snapshot_kospi_message_at;

/* every byte of Equity Derivatives Underlying Snapshot Kospi Message set to one value */
inline fill_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_record, equity_derivatives_underlying_snapshot_kospi_message_value) {
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_message_record.board_id[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_message_record.session_id[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_message_record.isin_code[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.price_change_against_previous_day = equity_derivatives_underlying_snapshot_kospi_message_value;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.trading_price[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.opening_price[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.todays_high[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.todays_low[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.closing_price_type_code = equity_derivatives_underlying_snapshot_kospi_message_value;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 22 -> equity_derivatives_underlying_snapshot_kospi_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.trading_halt = equity_derivatives_underlying_snapshot_kospi_message_value;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kospi_message_at] = equity_derivatives_underlying_snapshot_kospi_message_value; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.end_keyword = equity_derivatives_underlying_snapshot_kospi_message_value;
  skip
}

/* each byte of Equity Derivatives Underlying Snapshot Kospi Message set to where it lies, so a field read out of place says so */
inline ramp_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_record, equity_derivatives_underlying_snapshot_kospi_message_base) {
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_message_record.board_id[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 0 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_message_record.session_id[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 2 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_message_record.isin_code[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 4 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.price_change_against_previous_day = (equity_derivatives_underlying_snapshot_kospi_message_base + 16 + 1) % 256;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 17 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.trading_price[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 28 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.opening_price[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 39 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.todays_high[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 50 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.todays_low[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 61 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.closing_price_type_code = (equity_derivatives_underlying_snapshot_kospi_message_base + 72 + 1) % 256;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 73 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 22 -> equity_derivatives_underlying_snapshot_kospi_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 85 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.trading_halt = (equity_derivatives_underlying_snapshot_kospi_message_base + 107 + 1) % 256;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 108 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kospi_message_at] = (equity_derivatives_underlying_snapshot_kospi_message_base + 119 + equity_derivatives_underlying_snapshot_kospi_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.end_keyword = (equity_derivatives_underlying_snapshot_kospi_message_base + 130 + 1) % 256;
  skip
}

/* Equity Derivatives Underlying Snapshot Kospi Message to the wire, 131 bytes from where the cursor stands */
inline encode_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_record) {
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.board_id[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.session_id[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.isin_code[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.price_change_against_previous_day; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.trading_price[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.opening_price[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.todays_high[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.todays_low[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.closing_price_type_code; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 22 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.trading_halt; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kospi_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kospi_message_record.end_keyword; at = at + 1;
  skip
}

/* Equity Derivatives Underlying Snapshot Kospi Message off the wire, 131 bytes from where the cursor stands */
inline decode_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_record) {
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_message_record.board_id[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_message_record.session_id[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_message_record.isin_code[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.price_change_against_previous_day = wire[at]; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.trading_price[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.opening_price[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.todays_high[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.todays_low[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.closing_price_type_code = wire[at]; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 22 -> equity_derivatives_underlying_snapshot_kospi_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.trading_halt = wire[at]; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kospi_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Equity Derivatives Underlying Snapshot Kospi Message is what was written, byte for byte */
inline equal_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_read, equity_derivatives_underlying_snapshot_kospi_message_written) {
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.board_id[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.board_id[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 2 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.session_id[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.session_id[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.isin_code[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.isin_code[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kospi_message_read.price_change_against_previous_day == equity_derivatives_underlying_snapshot_kospi_message_written.price_change_against_previous_day);
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.trading_price[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.trading_price[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.opening_price[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.opening_price[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.todays_high[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.todays_high[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.todays_low[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.todays_low[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kospi_message_read.closing_price_type_code == equity_derivatives_underlying_snapshot_kospi_message_written.closing_price_type_code);
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 12 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 22 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kospi_message_read.trading_halt == equity_derivatives_underlying_snapshot_kospi_message_written.trading_halt);
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.the_best_ask[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.the_best_ask[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_message_read.the_best_bid[equity_derivatives_underlying_snapshot_kospi_message_at] == equity_derivatives_underlying_snapshot_kospi_message_written.the_best_bid[equity_derivatives_underlying_snapshot_kospi_message_at]); equity_derivatives_underlying_snapshot_kospi_message_at = equity_derivatives_underlying_snapshot_kospi_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kospi_message_read.end_keyword == equity_derivatives_underlying_snapshot_kospi_message_written.end_keyword);
  skip
}

/* ---- Equity Derivatives Underlying Snapshot Kosdaq Message: 131 bytes -------- */

/* Equity Derivatives Underlying Asset Snapshot for KOSDAQ underlying. Identical wire shape to the KOSPI variant. */
typedef EquityDerivativesUnderlyingSnapshotKosdaqMessage {
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte price_change_against_previous_day;
  byte a_price_change_against_the_previous_day[11];
  byte trading_price[11];
  byte opening_price[11];
  byte todays_high[11];
  byte todays_low[11];
  byte closing_price_type_code;
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[22];
  byte trading_halt;
  byte the_best_ask[11];
  byte the_best_bid[11];
  byte end_keyword
};

int equity_derivatives_underlying_snapshot_kosdaq_message_at;

/* every byte of Equity Derivatives Underlying Snapshot Kosdaq Message set to one value */
inline fill_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_record, equity_derivatives_underlying_snapshot_kosdaq_message_value) {
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.board_id[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.session_id[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.isin_code[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.price_change_against_previous_day = equity_derivatives_underlying_snapshot_kosdaq_message_value;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.trading_price[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.opening_price[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.todays_high[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.todays_low[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.closing_price_type_code = equity_derivatives_underlying_snapshot_kosdaq_message_value;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 22 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.trading_halt = equity_derivatives_underlying_snapshot_kosdaq_message_value;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kosdaq_message_at] = equity_derivatives_underlying_snapshot_kosdaq_message_value; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.end_keyword = equity_derivatives_underlying_snapshot_kosdaq_message_value;
  skip
}

/* each byte of Equity Derivatives Underlying Snapshot Kosdaq Message set to where it lies, so a field read out of place says so */
inline ramp_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_record, equity_derivatives_underlying_snapshot_kosdaq_message_base) {
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.board_id[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 0 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.session_id[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 2 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.isin_code[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 4 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.price_change_against_previous_day = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 16 + 1) % 256;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 17 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.trading_price[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 28 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.opening_price[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 39 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.todays_high[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 50 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.todays_low[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 61 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.closing_price_type_code = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 72 + 1) % 256;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 73 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 22 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 85 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.trading_halt = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 107 + 1) % 256;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 108 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kosdaq_message_at] = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 119 + equity_derivatives_underlying_snapshot_kosdaq_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.end_keyword = (equity_derivatives_underlying_snapshot_kosdaq_message_base + 130 + 1) % 256;
  skip
}

/* Equity Derivatives Underlying Snapshot Kosdaq Message to the wire, 131 bytes from where the cursor stands */
inline encode_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_record) {
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.board_id[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.session_id[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.isin_code[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.price_change_against_previous_day; at = at + 1;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.trading_price[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.opening_price[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.todays_high[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.todays_low[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.closing_price_type_code; at = at + 1;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 22 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.trading_halt; at = at + 1;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kosdaq_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kosdaq_message_record.end_keyword; at = at + 1;
  skip
}

/* Equity Derivatives Underlying Snapshot Kosdaq Message off the wire, 131 bytes from where the cursor stands */
inline decode_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_record) {
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.board_id[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.session_id[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.isin_code[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.price_change_against_previous_day = wire[at]; at = at + 1;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.trading_price[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.opening_price[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.todays_high[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.todays_low[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.closing_price_type_code = wire[at]; at = at + 1;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 22 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.trading_halt = wire[at]; at = at + 1;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> equity_derivatives_underlying_snapshot_kosdaq_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kosdaq_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Equity Derivatives Underlying Snapshot Kosdaq Message is what was written, byte for byte */
inline equal_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_read, equity_derivatives_underlying_snapshot_kosdaq_message_written) {
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.board_id[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.board_id[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 2 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.session_id[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.session_id[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.isin_code[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.isin_code[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.price_change_against_previous_day == equity_derivatives_underlying_snapshot_kosdaq_message_written.price_change_against_previous_day);
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.trading_price[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.trading_price[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.opening_price[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.opening_price[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.todays_high[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.todays_high[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.todays_low[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.todays_low[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.closing_price_type_code == equity_derivatives_underlying_snapshot_kosdaq_message_written.closing_price_type_code);
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 12 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 22 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.accumulated_trading_value[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.accumulated_trading_value[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.trading_halt == equity_derivatives_underlying_snapshot_kosdaq_message_written.trading_halt);
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.the_best_ask[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.the_best_ask[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kosdaq_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kosdaq_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.the_best_bid[equity_derivatives_underlying_snapshot_kosdaq_message_at] == equity_derivatives_underlying_snapshot_kosdaq_message_written.the_best_bid[equity_derivatives_underlying_snapshot_kosdaq_message_at]); equity_derivatives_underlying_snapshot_kosdaq_message_at = equity_derivatives_underlying_snapshot_kosdaq_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kosdaq_message_read.end_keyword == equity_derivatives_underlying_snapshot_kosdaq_message_written.end_keyword);
  skip
}

/* ---- Equity Derivatives Underlying Snapshot Kospi Mm Lp Included Message: 131 bytes ---- */

/* Equity Derivatives Underlying Asset Snapshot for KOSPI underlying with MM/LP included. Identical wire shape. */
typedef EquityDerivativesUnderlyingSnapshotKospiMmLpIncludedMessage {
  byte board_id[2];
  byte session_id[2];
  byte isin_code[12];
  byte price_change_against_previous_day;
  byte a_price_change_against_the_previous_day[11];
  byte trading_price[11];
  byte opening_price[11];
  byte todays_high[11];
  byte todays_low[11];
  byte closing_price_type_code;
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[22];
  byte trading_halt;
  byte the_best_ask[11];
  byte the_best_bid[11];
  byte end_keyword
};

int equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at;

/* every byte of Equity Derivatives Underlying Snapshot Kospi Mm Lp Included Message set to one value */
inline fill_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record, equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value) {
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.board_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.session_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.isin_code[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.price_change_against_previous_day = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.trading_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.opening_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.todays_high[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.todays_low[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.closing_price_type_code = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 22 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.trading_halt = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.end_keyword = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_value;
  skip
}

/* each byte of Equity Derivatives Underlying Snapshot Kospi Mm Lp Included Message set to where it lies, so a field read out of place says so */
inline ramp_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record, equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base) {
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.board_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 0 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.session_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 2 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.isin_code[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 4 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.price_change_against_previous_day = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 16 + 1) % 256;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 17 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.trading_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 28 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.opening_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 39 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.todays_high[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 50 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.todays_low[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 61 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.closing_price_type_code = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 72 + 1) % 256;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 73 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 22 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 85 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.trading_halt = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 107 + 1) % 256;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 108 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 119 + equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1) % 256; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.end_keyword = (equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_base + 130 + 1) % 256;
  skip
}

/* Equity Derivatives Underlying Snapshot Kospi Mm Lp Included Message to the wire, 131 bytes from where the cursor stands */
inline encode_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record) {
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.board_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.session_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.isin_code[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.price_change_against_previous_day; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.trading_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.opening_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.todays_high[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.todays_low[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.closing_price_type_code; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 22 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.trading_halt; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.end_keyword; at = at + 1;
  skip
}

/* Equity Derivatives Underlying Snapshot Kospi Mm Lp Included Message off the wire, 131 bytes from where the cursor stands */
inline decode_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record) {
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.board_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.session_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.isin_code[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.price_change_against_previous_day = wire[at]; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.trading_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.opening_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.todays_high[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.todays_low[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.closing_price_type_code = wire[at]; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 22 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.trading_halt = wire[at]; at = at + 1;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.the_best_ask[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.the_best_bid[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] = wire[at]; at = at + 1; equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Equity Derivatives Underlying Snapshot Kospi Mm Lp Included Message is what was written, byte for byte */
inline equal_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read, equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written) {
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.board_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.board_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 2 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.session_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.session_id[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.isin_code[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.isin_code[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.price_change_against_previous_day == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.price_change_against_previous_day);
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.a_price_change_against_the_previous_day[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.trading_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.trading_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.opening_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.opening_price[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.todays_high[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.todays_high[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.todays_low[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.todays_low[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.closing_price_type_code == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.closing_price_type_code);
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 12 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.accumulated_trading_volume[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 22 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.accumulated_trading_value[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.trading_halt == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.trading_halt);
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.the_best_ask[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.the_best_ask[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = 0;
  do
  :: equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at < 11 -> assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.the_best_bid[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at] == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.the_best_bid[equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at]); equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at = equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_at + 1
  :: else -> break
  od;
  assert(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_read.end_keyword == equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_written.end_keyword);
  skip
}

/* ---- Securities Equities Batch Data Message: 627 bytes ----------------------- */

/* Equities Batch Data. Comprehensive per-issue reference data dumped at start-of-day for KOSPI/KOSDAQ/KONEX equities. */
typedef SecuritiesEquitiesBatchDataMessage {
  byte message_sequence_number[8];
  byte total_number_of_instruments_of_the_contract[6];
  byte business_date[8];
  byte isin_code[12];
  byte a_designated_number_for_an_issue[6];
  byte abbreviated_issue_code[9];
  byte abbreviated_issue_name[40];
  byte abbreviated_issue_name_in_en[40];
  byte group_number[5];
  byte market_operation_product_id[3];
  byte security_group_id[2];
  byte discrete_time_trading;
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
  byte yesterdays_closing_price_type_code;
  byte yesterdays_closing_price[11];
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
  byte credit_order_possibillity;
  byte limit_order_permission_type_code[5];
  byte market_price_order_permission_type_code[5];
  byte conditioned_order_permission_type_code[5];
  byte best_favorable_order_permission_type_code[5];
  byte first_best_order_permission_type_code[5];
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
  byte pre_market_possibility;
  byte end_keyword
};

int securities_equities_batch_data_message_at;

/* every byte of Securities Equities Batch Data Message set to one value */
inline fill_securities_equities_batch_data_message(securities_equities_batch_data_message_record, securities_equities_batch_data_message_value) {
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.message_sequence_number[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.total_number_of_instruments_of_the_contract[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.business_date[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> securities_equities_batch_data_message_record.isin_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.a_designated_number_for_an_issue[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 9 -> securities_equities_batch_data_message_record.abbreviated_issue_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> securities_equities_batch_data_message_record.abbreviated_issue_name[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> securities_equities_batch_data_message_record.abbreviated_issue_name_in_en[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.group_number[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.market_operation_product_id[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.security_group_id[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.discrete_time_trading = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.rights_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.par_value_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.an_issue_of_which_base_price_is_settled_with_a_todays_single_price = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.reevaluation_reason_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.base_price_change = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.random_end_trigger_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.market_alert = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.market_alert_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.korea_corporate_governance_stock_price_index_kogi = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.issue_for_administration = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.unfaithful_disclosure = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.back_door_listing = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.trading_halt = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 10 -> securities_equities_batch_data_message_record.industry_id[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.small_medium_sized_business = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.section_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.investment_institution_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.base_price[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.yesterdays_closing_price_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.yesterdays_closing_price[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> securities_equities_batch_data_message_record.yesterdays_accumulated_trading_amount[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> securities_equities_batch_data_message_record.yesterdays_accumulated_trading_value[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.upper_limit_price[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.lower_limit_price[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.substitute_price_of_securities[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.par_value[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.issuing_price[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.listing_date[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 16 -> securities_equities_batch_data_message_record.number_of_listed_shares[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.liquidation_trade = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.the_establishment_date[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.maturity_date[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.exercising_period[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.expiration_date_for_right[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> securities_equities_batch_data_message_record.exercise_price_of_elw_or_bw[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> securities_equities_batch_data_message_record.capital[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.credit_order_possibillity = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.limit_order_permission_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.market_price_order_permission_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.conditioned_order_permission_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.best_favorable_order_permission_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.first_best_order_permission_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.mid_price_order_permission_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.stop_limit_price_order_permission_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.capital_increase_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.other_stock_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.national_stock = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.appraised_price[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.lowest_order_price[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.highest_order_price[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.unit_of_volume_in_main_board[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.lot_size_after_hours_trading[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.rei_ts_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> securities_equities_batch_data_message_record.target_stock_isin_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.currency_iso_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.country_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.market_making_possibility = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.closing_price_trading_possibility_in_the_after_hours = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.closing_price_trading_in_the_pre_opening_market = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.block_trading_in_the_pre_opening_market = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.basket_trading_in_the_pre_opening_market = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.announcement_of_estimated_trading_price = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.short_selling = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> securities_equities_batch_data_message_record.etf_tracking_difference[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.regs = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.spac = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.tax_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> securities_equities_batch_data_message_record.appraisal_ratio_of_substitute_price[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.investment_caution_issue = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.delisting_date[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.short_term_overheat_issue_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.etf_replication_methods_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.expiration_date[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.distribution_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.calculation_of_redemption_price_start_date[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.calculation_of_redemption_price_end_date[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.etp_product_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.index_calculation_institution_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.index_market_classification_id[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.index_sequence_number[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.tracking_index_leverage_inverse_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.reference_index_leverage_inverse_type_code[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.index_asset_classification_id_1[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.index_asset_classification_id_2[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.ipo_underwriter_member_number[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.lp_order = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.low_liquidity = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.abnormal_rise = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 23 -> securities_equities_batch_data_message_record.upper_limit_quantity[securities_equities_batch_data_message_at] = securities_equities_batch_data_message_value; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.investment_precaution_issue = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.preferred_stocks_with_lesser_shares = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.spac_merger = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.segment_type_code = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.after_market_possibility = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.pre_market_possibility = securities_equities_batch_data_message_value;
  securities_equities_batch_data_message_record.end_keyword = securities_equities_batch_data_message_value;
  skip
}

/* each byte of Securities Equities Batch Data Message set to where it lies, so a field read out of place says so */
inline ramp_securities_equities_batch_data_message(securities_equities_batch_data_message_record, securities_equities_batch_data_message_base) {
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.message_sequence_number[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 0 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.total_number_of_instruments_of_the_contract[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 8 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.business_date[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 14 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> securities_equities_batch_data_message_record.isin_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 22 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.a_designated_number_for_an_issue[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 34 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 9 -> securities_equities_batch_data_message_record.abbreviated_issue_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 40 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> securities_equities_batch_data_message_record.abbreviated_issue_name[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 49 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> securities_equities_batch_data_message_record.abbreviated_issue_name_in_en[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 89 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.group_number[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 129 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.market_operation_product_id[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 134 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.security_group_id[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 137 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.discrete_time_trading = (securities_equities_batch_data_message_base + 139 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.rights_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 140 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.par_value_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 142 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.an_issue_of_which_base_price_is_settled_with_a_todays_single_price = (securities_equities_batch_data_message_base + 144 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.reevaluation_reason_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 145 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.base_price_change = (securities_equities_batch_data_message_base + 147 + 1) % 256;
  securities_equities_batch_data_message_record.random_end_trigger_code = (securities_equities_batch_data_message_base + 148 + 1) % 256;
  securities_equities_batch_data_message_record.market_alert = (securities_equities_batch_data_message_base + 149 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.market_alert_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 150 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.korea_corporate_governance_stock_price_index_kogi = (securities_equities_batch_data_message_base + 152 + 1) % 256;
  securities_equities_batch_data_message_record.issue_for_administration = (securities_equities_batch_data_message_base + 153 + 1) % 256;
  securities_equities_batch_data_message_record.unfaithful_disclosure = (securities_equities_batch_data_message_base + 154 + 1) % 256;
  securities_equities_batch_data_message_record.back_door_listing = (securities_equities_batch_data_message_base + 155 + 1) % 256;
  securities_equities_batch_data_message_record.trading_halt = (securities_equities_batch_data_message_base + 156 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 10 -> securities_equities_batch_data_message_record.industry_id[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 157 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.small_medium_sized_business = (securities_equities_batch_data_message_base + 167 + 1) % 256;
  securities_equities_batch_data_message_record.section_type_code = (securities_equities_batch_data_message_base + 168 + 1) % 256;
  securities_equities_batch_data_message_record.investment_institution_type_code = (securities_equities_batch_data_message_base + 169 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.base_price[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 170 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.yesterdays_closing_price_type_code = (securities_equities_batch_data_message_base + 181 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.yesterdays_closing_price[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 182 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> securities_equities_batch_data_message_record.yesterdays_accumulated_trading_amount[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 193 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> securities_equities_batch_data_message_record.yesterdays_accumulated_trading_value[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 205 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.upper_limit_price[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 227 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.lower_limit_price[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 238 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.substitute_price_of_securities[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 249 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.par_value[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 260 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.issuing_price[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 271 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.listing_date[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 282 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 16 -> securities_equities_batch_data_message_record.number_of_listed_shares[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 290 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.liquidation_trade = (securities_equities_batch_data_message_base + 306 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.the_establishment_date[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 307 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.maturity_date[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 315 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.exercising_period[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 323 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.expiration_date_for_right[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 331 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> securities_equities_batch_data_message_record.exercise_price_of_elw_or_bw[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 339 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> securities_equities_batch_data_message_record.capital[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 352 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.credit_order_possibillity = (securities_equities_batch_data_message_base + 374 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.limit_order_permission_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 375 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.market_price_order_permission_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 380 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.conditioned_order_permission_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 385 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.best_favorable_order_permission_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 390 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.first_best_order_permission_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 395 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.mid_price_order_permission_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 400 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.stop_limit_price_order_permission_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 405 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.capital_increase_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 410 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.other_stock_type_code = (securities_equities_batch_data_message_base + 412 + 1) % 256;
  securities_equities_batch_data_message_record.national_stock = (securities_equities_batch_data_message_base + 413 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.appraised_price[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 414 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.lowest_order_price[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 425 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.highest_order_price[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 436 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.unit_of_volume_in_main_board[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 447 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.lot_size_after_hours_trading[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 458 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.rei_ts_type_code = (securities_equities_batch_data_message_base + 469 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> securities_equities_batch_data_message_record.target_stock_isin_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 470 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.currency_iso_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 482 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.country_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 485 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.market_making_possibility = (securities_equities_batch_data_message_base + 488 + 1) % 256;
  securities_equities_batch_data_message_record.closing_price_trading_possibility_in_the_after_hours = (securities_equities_batch_data_message_base + 489 + 1) % 256;
  securities_equities_batch_data_message_record.closing_price_trading_in_the_pre_opening_market = (securities_equities_batch_data_message_base + 490 + 1) % 256;
  securities_equities_batch_data_message_record.block_trading_in_the_pre_opening_market = (securities_equities_batch_data_message_base + 491 + 1) % 256;
  securities_equities_batch_data_message_record.basket_trading_in_the_pre_opening_market = (securities_equities_batch_data_message_base + 492 + 1) % 256;
  securities_equities_batch_data_message_record.announcement_of_estimated_trading_price = (securities_equities_batch_data_message_base + 493 + 1) % 256;
  securities_equities_batch_data_message_record.short_selling = (securities_equities_batch_data_message_base + 494 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> securities_equities_batch_data_message_record.etf_tracking_difference[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 495 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.regs = (securities_equities_batch_data_message_base + 508 + 1) % 256;
  securities_equities_batch_data_message_record.spac = (securities_equities_batch_data_message_base + 509 + 1) % 256;
  securities_equities_batch_data_message_record.tax_type_code = (securities_equities_batch_data_message_base + 510 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> securities_equities_batch_data_message_record.appraisal_ratio_of_substitute_price[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 511 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.investment_caution_issue = (securities_equities_batch_data_message_base + 524 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.delisting_date[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 525 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.short_term_overheat_issue_type_code = (securities_equities_batch_data_message_base + 533 + 1) % 256;
  securities_equities_batch_data_message_record.etf_replication_methods_type_code = (securities_equities_batch_data_message_base + 534 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.expiration_date[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 535 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.distribution_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 543 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.calculation_of_redemption_price_start_date[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 545 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.calculation_of_redemption_price_end_date[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 553 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.etp_product_type_code = (securities_equities_batch_data_message_base + 561 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.index_calculation_institution_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 562 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.index_market_classification_id[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 564 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.index_sequence_number[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 570 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.tracking_index_leverage_inverse_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 573 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.reference_index_leverage_inverse_type_code[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 575 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.index_asset_classification_id_1[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 577 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.index_asset_classification_id_2[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 583 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.ipo_underwriter_member_number[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 589 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.lp_order = (securities_equities_batch_data_message_base + 594 + 1) % 256;
  securities_equities_batch_data_message_record.low_liquidity = (securities_equities_batch_data_message_base + 595 + 1) % 256;
  securities_equities_batch_data_message_record.abnormal_rise = (securities_equities_batch_data_message_base + 596 + 1) % 256;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 23 -> securities_equities_batch_data_message_record.upper_limit_quantity[securities_equities_batch_data_message_at] = (securities_equities_batch_data_message_base + 597 + securities_equities_batch_data_message_at + 1) % 256; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.investment_precaution_issue = (securities_equities_batch_data_message_base + 620 + 1) % 256;
  securities_equities_batch_data_message_record.preferred_stocks_with_lesser_shares = (securities_equities_batch_data_message_base + 621 + 1) % 256;
  securities_equities_batch_data_message_record.spac_merger = (securities_equities_batch_data_message_base + 622 + 1) % 256;
  securities_equities_batch_data_message_record.segment_type_code = (securities_equities_batch_data_message_base + 623 + 1) % 256;
  securities_equities_batch_data_message_record.after_market_possibility = (securities_equities_batch_data_message_base + 624 + 1) % 256;
  securities_equities_batch_data_message_record.pre_market_possibility = (securities_equities_batch_data_message_base + 625 + 1) % 256;
  securities_equities_batch_data_message_record.end_keyword = (securities_equities_batch_data_message_base + 626 + 1) % 256;
  skip
}

/* Securities Equities Batch Data Message to the wire, 627 bytes from where the cursor stands */
inline encode_securities_equities_batch_data_message(securities_equities_batch_data_message_record) {
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.message_sequence_number[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> wire[at] = securities_equities_batch_data_message_record.total_number_of_instruments_of_the_contract[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.business_date[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> wire[at] = securities_equities_batch_data_message_record.isin_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> wire[at] = securities_equities_batch_data_message_record.a_designated_number_for_an_issue[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 9 -> wire[at] = securities_equities_batch_data_message_record.abbreviated_issue_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> wire[at] = securities_equities_batch_data_message_record.abbreviated_issue_name[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> wire[at] = securities_equities_batch_data_message_record.abbreviated_issue_name_in_en[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> wire[at] = securities_equities_batch_data_message_record.group_number[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> wire[at] = securities_equities_batch_data_message_record.market_operation_product_id[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.security_group_id[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.discrete_time_trading; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.rights_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.par_value_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.an_issue_of_which_base_price_is_settled_with_a_todays_single_price; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.reevaluation_reason_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.base_price_change; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.random_end_trigger_code; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.market_alert; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.market_alert_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.korea_corporate_governance_stock_price_index_kogi; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.issue_for_administration; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.unfaithful_disclosure; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.back_door_listing; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.trading_halt; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 10 -> wire[at] = securities_equities_batch_data_message_record.industry_id[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.small_medium_sized_business; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.section_type_code; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.investment_institution_type_code; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.base_price[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.yesterdays_closing_price_type_code; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.yesterdays_closing_price[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> wire[at] = securities_equities_batch_data_message_record.yesterdays_accumulated_trading_amount[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> wire[at] = securities_equities_batch_data_message_record.yesterdays_accumulated_trading_value[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.upper_limit_price[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.lower_limit_price[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.substitute_price_of_securities[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.par_value[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.issuing_price[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.listing_date[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 16 -> wire[at] = securities_equities_batch_data_message_record.number_of_listed_shares[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.liquidation_trade; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.the_establishment_date[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.maturity_date[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.exercising_period[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.expiration_date_for_right[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> wire[at] = securities_equities_batch_data_message_record.exercise_price_of_elw_or_bw[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> wire[at] = securities_equities_batch_data_message_record.capital[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.credit_order_possibillity; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> wire[at] = securities_equities_batch_data_message_record.limit_order_permission_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> wire[at] = securities_equities_batch_data_message_record.market_price_order_permission_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> wire[at] = securities_equities_batch_data_message_record.conditioned_order_permission_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> wire[at] = securities_equities_batch_data_message_record.best_favorable_order_permission_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> wire[at] = securities_equities_batch_data_message_record.first_best_order_permission_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> wire[at] = securities_equities_batch_data_message_record.mid_price_order_permission_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> wire[at] = securities_equities_batch_data_message_record.stop_limit_price_order_permission_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.capital_increase_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.other_stock_type_code; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.national_stock; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.appraised_price[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.lowest_order_price[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.highest_order_price[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.unit_of_volume_in_main_board[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> wire[at] = securities_equities_batch_data_message_record.lot_size_after_hours_trading[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.rei_ts_type_code; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> wire[at] = securities_equities_batch_data_message_record.target_stock_isin_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> wire[at] = securities_equities_batch_data_message_record.currency_iso_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> wire[at] = securities_equities_batch_data_message_record.country_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.market_making_possibility; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.closing_price_trading_possibility_in_the_after_hours; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.closing_price_trading_in_the_pre_opening_market; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.block_trading_in_the_pre_opening_market; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.basket_trading_in_the_pre_opening_market; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.announcement_of_estimated_trading_price; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.short_selling; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> wire[at] = securities_equities_batch_data_message_record.etf_tracking_difference[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.regs; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.spac; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.tax_type_code; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> wire[at] = securities_equities_batch_data_message_record.appraisal_ratio_of_substitute_price[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.investment_caution_issue; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.delisting_date[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.short_term_overheat_issue_type_code; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.etf_replication_methods_type_code; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.expiration_date[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.distribution_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.calculation_of_redemption_price_start_date[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> wire[at] = securities_equities_batch_data_message_record.calculation_of_redemption_price_end_date[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.etp_product_type_code; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.index_calculation_institution_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> wire[at] = securities_equities_batch_data_message_record.index_market_classification_id[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> wire[at] = securities_equities_batch_data_message_record.index_sequence_number[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.tracking_index_leverage_inverse_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> wire[at] = securities_equities_batch_data_message_record.reference_index_leverage_inverse_type_code[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> wire[at] = securities_equities_batch_data_message_record.index_asset_classification_id_1[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> wire[at] = securities_equities_batch_data_message_record.index_asset_classification_id_2[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> wire[at] = securities_equities_batch_data_message_record.ipo_underwriter_member_number[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.lp_order; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.low_liquidity; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.abnormal_rise; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 23 -> wire[at] = securities_equities_batch_data_message_record.upper_limit_quantity[securities_equities_batch_data_message_at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equities_batch_data_message_record.investment_precaution_issue; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.preferred_stocks_with_lesser_shares; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.spac_merger; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.segment_type_code; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.after_market_possibility; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.pre_market_possibility; at = at + 1;
  wire[at] = securities_equities_batch_data_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Equities Batch Data Message off the wire, 627 bytes from where the cursor stands */
inline decode_securities_equities_batch_data_message(securities_equities_batch_data_message_record) {
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.message_sequence_number[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.total_number_of_instruments_of_the_contract[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.business_date[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> securities_equities_batch_data_message_record.isin_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.a_designated_number_for_an_issue[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 9 -> securities_equities_batch_data_message_record.abbreviated_issue_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> securities_equities_batch_data_message_record.abbreviated_issue_name[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> securities_equities_batch_data_message_record.abbreviated_issue_name_in_en[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.group_number[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.market_operation_product_id[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.security_group_id[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.discrete_time_trading = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.rights_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.par_value_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.an_issue_of_which_base_price_is_settled_with_a_todays_single_price = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.reevaluation_reason_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.base_price_change = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.random_end_trigger_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.market_alert = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.market_alert_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.korea_corporate_governance_stock_price_index_kogi = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.issue_for_administration = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.unfaithful_disclosure = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.back_door_listing = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.trading_halt = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 10 -> securities_equities_batch_data_message_record.industry_id[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.small_medium_sized_business = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.section_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.investment_institution_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.base_price[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.yesterdays_closing_price_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.yesterdays_closing_price[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> securities_equities_batch_data_message_record.yesterdays_accumulated_trading_amount[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> securities_equities_batch_data_message_record.yesterdays_accumulated_trading_value[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.upper_limit_price[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.lower_limit_price[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.substitute_price_of_securities[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.par_value[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.issuing_price[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.listing_date[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 16 -> securities_equities_batch_data_message_record.number_of_listed_shares[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.liquidation_trade = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.the_establishment_date[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.maturity_date[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.exercising_period[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.expiration_date_for_right[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> securities_equities_batch_data_message_record.exercise_price_of_elw_or_bw[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> securities_equities_batch_data_message_record.capital[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.credit_order_possibillity = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.limit_order_permission_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.market_price_order_permission_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.conditioned_order_permission_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.best_favorable_order_permission_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.first_best_order_permission_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.mid_price_order_permission_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.stop_limit_price_order_permission_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.capital_increase_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.other_stock_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.national_stock = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.appraised_price[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.lowest_order_price[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.highest_order_price[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.unit_of_volume_in_main_board[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> securities_equities_batch_data_message_record.lot_size_after_hours_trading[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.rei_ts_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> securities_equities_batch_data_message_record.target_stock_isin_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.currency_iso_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.country_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.market_making_possibility = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.closing_price_trading_possibility_in_the_after_hours = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.closing_price_trading_in_the_pre_opening_market = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.block_trading_in_the_pre_opening_market = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.basket_trading_in_the_pre_opening_market = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.announcement_of_estimated_trading_price = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.short_selling = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> securities_equities_batch_data_message_record.etf_tracking_difference[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.regs = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.spac = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.tax_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> securities_equities_batch_data_message_record.appraisal_ratio_of_substitute_price[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.investment_caution_issue = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.delisting_date[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.short_term_overheat_issue_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.etf_replication_methods_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.expiration_date[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.distribution_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.calculation_of_redemption_price_start_date[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> securities_equities_batch_data_message_record.calculation_of_redemption_price_end_date[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.etp_product_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.index_calculation_institution_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.index_market_classification_id[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> securities_equities_batch_data_message_record.index_sequence_number[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.tracking_index_leverage_inverse_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> securities_equities_batch_data_message_record.reference_index_leverage_inverse_type_code[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.index_asset_classification_id_1[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> securities_equities_batch_data_message_record.index_asset_classification_id_2[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> securities_equities_batch_data_message_record.ipo_underwriter_member_number[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.lp_order = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.low_liquidity = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.abnormal_rise = wire[at]; at = at + 1;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 23 -> securities_equities_batch_data_message_record.upper_limit_quantity[securities_equities_batch_data_message_at] = wire[at]; at = at + 1; securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_record.investment_precaution_issue = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.preferred_stocks_with_lesser_shares = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.spac_merger = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.segment_type_code = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.after_market_possibility = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.pre_market_possibility = wire[at]; at = at + 1;
  securities_equities_batch_data_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Equities Batch Data Message is what was written, byte for byte */
inline equal_securities_equities_batch_data_message(securities_equities_batch_data_message_read, securities_equities_batch_data_message_written) {
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.message_sequence_number[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.message_sequence_number[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> assert(securities_equities_batch_data_message_read.total_number_of_instruments_of_the_contract[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.total_number_of_instruments_of_the_contract[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.business_date[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.business_date[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> assert(securities_equities_batch_data_message_read.isin_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.isin_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> assert(securities_equities_batch_data_message_read.a_designated_number_for_an_issue[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.a_designated_number_for_an_issue[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 9 -> assert(securities_equities_batch_data_message_read.abbreviated_issue_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.abbreviated_issue_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> assert(securities_equities_batch_data_message_read.abbreviated_issue_name[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.abbreviated_issue_name[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 40 -> assert(securities_equities_batch_data_message_read.abbreviated_issue_name_in_en[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.abbreviated_issue_name_in_en[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> assert(securities_equities_batch_data_message_read.group_number[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.group_number[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> assert(securities_equities_batch_data_message_read.market_operation_product_id[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.market_operation_product_id[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.security_group_id[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.security_group_id[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.discrete_time_trading == securities_equities_batch_data_message_written.discrete_time_trading);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.rights_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.rights_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.par_value_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.par_value_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.an_issue_of_which_base_price_is_settled_with_a_todays_single_price == securities_equities_batch_data_message_written.an_issue_of_which_base_price_is_settled_with_a_todays_single_price);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.reevaluation_reason_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.reevaluation_reason_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.base_price_change == securities_equities_batch_data_message_written.base_price_change);
  assert(securities_equities_batch_data_message_read.random_end_trigger_code == securities_equities_batch_data_message_written.random_end_trigger_code);
  assert(securities_equities_batch_data_message_read.market_alert == securities_equities_batch_data_message_written.market_alert);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.market_alert_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.market_alert_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.korea_corporate_governance_stock_price_index_kogi == securities_equities_batch_data_message_written.korea_corporate_governance_stock_price_index_kogi);
  assert(securities_equities_batch_data_message_read.issue_for_administration == securities_equities_batch_data_message_written.issue_for_administration);
  assert(securities_equities_batch_data_message_read.unfaithful_disclosure == securities_equities_batch_data_message_written.unfaithful_disclosure);
  assert(securities_equities_batch_data_message_read.back_door_listing == securities_equities_batch_data_message_written.back_door_listing);
  assert(securities_equities_batch_data_message_read.trading_halt == securities_equities_batch_data_message_written.trading_halt);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 10 -> assert(securities_equities_batch_data_message_read.industry_id[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.industry_id[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.small_medium_sized_business == securities_equities_batch_data_message_written.small_medium_sized_business);
  assert(securities_equities_batch_data_message_read.section_type_code == securities_equities_batch_data_message_written.section_type_code);
  assert(securities_equities_batch_data_message_read.investment_institution_type_code == securities_equities_batch_data_message_written.investment_institution_type_code);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.base_price[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.base_price[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.yesterdays_closing_price_type_code == securities_equities_batch_data_message_written.yesterdays_closing_price_type_code);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.yesterdays_closing_price[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.yesterdays_closing_price[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> assert(securities_equities_batch_data_message_read.yesterdays_accumulated_trading_amount[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.yesterdays_accumulated_trading_amount[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> assert(securities_equities_batch_data_message_read.yesterdays_accumulated_trading_value[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.yesterdays_accumulated_trading_value[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.upper_limit_price[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.upper_limit_price[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.lower_limit_price[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.lower_limit_price[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.substitute_price_of_securities[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.substitute_price_of_securities[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.par_value[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.par_value[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.issuing_price[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.issuing_price[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.listing_date[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.listing_date[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 16 -> assert(securities_equities_batch_data_message_read.number_of_listed_shares[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.number_of_listed_shares[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.liquidation_trade == securities_equities_batch_data_message_written.liquidation_trade);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.the_establishment_date[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.the_establishment_date[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.maturity_date[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.maturity_date[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.exercising_period[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.exercising_period[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.expiration_date_for_right[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.expiration_date_for_right[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> assert(securities_equities_batch_data_message_read.exercise_price_of_elw_or_bw[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.exercise_price_of_elw_or_bw[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 22 -> assert(securities_equities_batch_data_message_read.capital[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.capital[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.credit_order_possibillity == securities_equities_batch_data_message_written.credit_order_possibillity);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> assert(securities_equities_batch_data_message_read.limit_order_permission_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.limit_order_permission_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> assert(securities_equities_batch_data_message_read.market_price_order_permission_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.market_price_order_permission_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> assert(securities_equities_batch_data_message_read.conditioned_order_permission_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.conditioned_order_permission_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> assert(securities_equities_batch_data_message_read.best_favorable_order_permission_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.best_favorable_order_permission_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> assert(securities_equities_batch_data_message_read.first_best_order_permission_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.first_best_order_permission_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> assert(securities_equities_batch_data_message_read.mid_price_order_permission_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.mid_price_order_permission_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> assert(securities_equities_batch_data_message_read.stop_limit_price_order_permission_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.stop_limit_price_order_permission_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.capital_increase_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.capital_increase_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.other_stock_type_code == securities_equities_batch_data_message_written.other_stock_type_code);
  assert(securities_equities_batch_data_message_read.national_stock == securities_equities_batch_data_message_written.national_stock);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.appraised_price[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.appraised_price[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.lowest_order_price[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.lowest_order_price[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.highest_order_price[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.highest_order_price[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.unit_of_volume_in_main_board[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.unit_of_volume_in_main_board[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 11 -> assert(securities_equities_batch_data_message_read.lot_size_after_hours_trading[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.lot_size_after_hours_trading[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.rei_ts_type_code == securities_equities_batch_data_message_written.rei_ts_type_code);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 12 -> assert(securities_equities_batch_data_message_read.target_stock_isin_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.target_stock_isin_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> assert(securities_equities_batch_data_message_read.currency_iso_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.currency_iso_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> assert(securities_equities_batch_data_message_read.country_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.country_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.market_making_possibility == securities_equities_batch_data_message_written.market_making_possibility);
  assert(securities_equities_batch_data_message_read.closing_price_trading_possibility_in_the_after_hours == securities_equities_batch_data_message_written.closing_price_trading_possibility_in_the_after_hours);
  assert(securities_equities_batch_data_message_read.closing_price_trading_in_the_pre_opening_market == securities_equities_batch_data_message_written.closing_price_trading_in_the_pre_opening_market);
  assert(securities_equities_batch_data_message_read.block_trading_in_the_pre_opening_market == securities_equities_batch_data_message_written.block_trading_in_the_pre_opening_market);
  assert(securities_equities_batch_data_message_read.basket_trading_in_the_pre_opening_market == securities_equities_batch_data_message_written.basket_trading_in_the_pre_opening_market);
  assert(securities_equities_batch_data_message_read.announcement_of_estimated_trading_price == securities_equities_batch_data_message_written.announcement_of_estimated_trading_price);
  assert(securities_equities_batch_data_message_read.short_selling == securities_equities_batch_data_message_written.short_selling);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> assert(securities_equities_batch_data_message_read.etf_tracking_difference[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.etf_tracking_difference[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.regs == securities_equities_batch_data_message_written.regs);
  assert(securities_equities_batch_data_message_read.spac == securities_equities_batch_data_message_written.spac);
  assert(securities_equities_batch_data_message_read.tax_type_code == securities_equities_batch_data_message_written.tax_type_code);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 13 -> assert(securities_equities_batch_data_message_read.appraisal_ratio_of_substitute_price[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.appraisal_ratio_of_substitute_price[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.investment_caution_issue == securities_equities_batch_data_message_written.investment_caution_issue);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.delisting_date[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.delisting_date[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.short_term_overheat_issue_type_code == securities_equities_batch_data_message_written.short_term_overheat_issue_type_code);
  assert(securities_equities_batch_data_message_read.etf_replication_methods_type_code == securities_equities_batch_data_message_written.etf_replication_methods_type_code);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.expiration_date[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.expiration_date[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.distribution_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.distribution_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.calculation_of_redemption_price_start_date[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.calculation_of_redemption_price_start_date[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 8 -> assert(securities_equities_batch_data_message_read.calculation_of_redemption_price_end_date[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.calculation_of_redemption_price_end_date[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.etp_product_type_code == securities_equities_batch_data_message_written.etp_product_type_code);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.index_calculation_institution_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.index_calculation_institution_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> assert(securities_equities_batch_data_message_read.index_market_classification_id[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.index_market_classification_id[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 3 -> assert(securities_equities_batch_data_message_read.index_sequence_number[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.index_sequence_number[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.tracking_index_leverage_inverse_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.tracking_index_leverage_inverse_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 2 -> assert(securities_equities_batch_data_message_read.reference_index_leverage_inverse_type_code[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.reference_index_leverage_inverse_type_code[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> assert(securities_equities_batch_data_message_read.index_asset_classification_id_1[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.index_asset_classification_id_1[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 6 -> assert(securities_equities_batch_data_message_read.index_asset_classification_id_2[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.index_asset_classification_id_2[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 5 -> assert(securities_equities_batch_data_message_read.ipo_underwriter_member_number[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.ipo_underwriter_member_number[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.lp_order == securities_equities_batch_data_message_written.lp_order);
  assert(securities_equities_batch_data_message_read.low_liquidity == securities_equities_batch_data_message_written.low_liquidity);
  assert(securities_equities_batch_data_message_read.abnormal_rise == securities_equities_batch_data_message_written.abnormal_rise);
  securities_equities_batch_data_message_at = 0;
  do
  :: securities_equities_batch_data_message_at < 23 -> assert(securities_equities_batch_data_message_read.upper_limit_quantity[securities_equities_batch_data_message_at] == securities_equities_batch_data_message_written.upper_limit_quantity[securities_equities_batch_data_message_at]); securities_equities_batch_data_message_at = securities_equities_batch_data_message_at + 1
  :: else -> break
  od;
  assert(securities_equities_batch_data_message_read.investment_precaution_issue == securities_equities_batch_data_message_written.investment_precaution_issue);
  assert(securities_equities_batch_data_message_read.preferred_stocks_with_lesser_shares == securities_equities_batch_data_message_written.preferred_stocks_with_lesser_shares);
  assert(securities_equities_batch_data_message_read.spac_merger == securities_equities_batch_data_message_written.spac_merger);
  assert(securities_equities_batch_data_message_read.segment_type_code == securities_equities_batch_data_message_written.segment_type_code);
  assert(securities_equities_batch_data_message_read.after_market_possibility == securities_equities_batch_data_message_written.after_market_possibility);
  assert(securities_equities_batch_data_message_read.pre_market_possibility == securities_equities_batch_data_message_written.pre_market_possibility);
  assert(securities_equities_batch_data_message_read.end_keyword == securities_equities_batch_data_message_written.end_keyword);
  skip
}

/* ---- Securities Closing Date Message: 25 bytes ------------------------------- */

/* Closing Date reference. Per-issue closing date assignments. */
typedef SecuritiesClosingDateMessage {
  byte message_sequence_number[8];
  byte isin_code[12];
  byte closing_date[4];
  byte end_keyword
};

int securities_closing_date_message_at;

/* every byte of Securities Closing Date Message set to one value */
inline fill_securities_closing_date_message(securities_closing_date_message_record, securities_closing_date_message_value) {
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 8 -> securities_closing_date_message_record.message_sequence_number[securities_closing_date_message_at] = securities_closing_date_message_value; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 12 -> securities_closing_date_message_record.isin_code[securities_closing_date_message_at] = securities_closing_date_message_value; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 4 -> securities_closing_date_message_record.closing_date[securities_closing_date_message_at] = securities_closing_date_message_value; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_record.end_keyword = securities_closing_date_message_value;
  skip
}

/* each byte of Securities Closing Date Message set to where it lies, so a field read out of place says so */
inline ramp_securities_closing_date_message(securities_closing_date_message_record, securities_closing_date_message_base) {
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 8 -> securities_closing_date_message_record.message_sequence_number[securities_closing_date_message_at] = (securities_closing_date_message_base + 0 + securities_closing_date_message_at + 1) % 256; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 12 -> securities_closing_date_message_record.isin_code[securities_closing_date_message_at] = (securities_closing_date_message_base + 8 + securities_closing_date_message_at + 1) % 256; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 4 -> securities_closing_date_message_record.closing_date[securities_closing_date_message_at] = (securities_closing_date_message_base + 20 + securities_closing_date_message_at + 1) % 256; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_record.end_keyword = (securities_closing_date_message_base + 24 + 1) % 256;
  skip
}

/* Securities Closing Date Message to the wire, 25 bytes from where the cursor stands */
inline encode_securities_closing_date_message(securities_closing_date_message_record) {
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 8 -> wire[at] = securities_closing_date_message_record.message_sequence_number[securities_closing_date_message_at]; at = at + 1; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 12 -> wire[at] = securities_closing_date_message_record.isin_code[securities_closing_date_message_at]; at = at + 1; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 4 -> wire[at] = securities_closing_date_message_record.closing_date[securities_closing_date_message_at]; at = at + 1; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_closing_date_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Closing Date Message off the wire, 25 bytes from where the cursor stands */
inline decode_securities_closing_date_message(securities_closing_date_message_record) {
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 8 -> securities_closing_date_message_record.message_sequence_number[securities_closing_date_message_at] = wire[at]; at = at + 1; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 12 -> securities_closing_date_message_record.isin_code[securities_closing_date_message_at] = wire[at]; at = at + 1; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 4 -> securities_closing_date_message_record.closing_date[securities_closing_date_message_at] = wire[at]; at = at + 1; securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Closing Date Message is what was written, byte for byte */
inline equal_securities_closing_date_message(securities_closing_date_message_read, securities_closing_date_message_written) {
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 8 -> assert(securities_closing_date_message_read.message_sequence_number[securities_closing_date_message_at] == securities_closing_date_message_written.message_sequence_number[securities_closing_date_message_at]); securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 12 -> assert(securities_closing_date_message_read.isin_code[securities_closing_date_message_at] == securities_closing_date_message_written.isin_code[securities_closing_date_message_at]); securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  securities_closing_date_message_at = 0;
  do
  :: securities_closing_date_message_at < 4 -> assert(securities_closing_date_message_read.closing_date[securities_closing_date_message_at] == securities_closing_date_message_written.closing_date[securities_closing_date_message_at]); securities_closing_date_message_at = securities_closing_date_message_at + 1
  :: else -> break
  od;
  assert(securities_closing_date_message_read.end_keyword == securities_closing_date_message_written.end_keyword);
  skip
}

/* ---- Securities Mm Lp Information Message: 192 bytes ------------------------- */

/* MM/LP Information. Market maker and liquidity provider assignments per issue. */
typedef SecuritiesMmLpInformationMessage {
  byte message_sequence_number[8];
  byte isin_code[12];
  byte market_participant_number[5];
  byte lp_start_date[8];
  byte lp_end_date[8];
  byte minimum_order_volume[11];
  byte maximum_volume_of_multiple_order[11];
  byte bid_ask_spread_unit_code;
  byte upper_limit_of_bid_ask_spread[22];
  byte spread_multiple_for_market_holidays[11];
  byte an_obligatory_time_interval_to_place_an_order[6];
  byte minimum_ask_price[22];
  byte maximum_bid_price[22];
  byte minimum_order_price[22];
  byte maximum_order_price[22];
  byte end_keyword
};

int securities_mm_lp_information_message_at;

/* every byte of Securities Mm Lp Information Message set to one value */
inline fill_securities_mm_lp_information_message(securities_mm_lp_information_message_record, securities_mm_lp_information_message_value) {
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> securities_mm_lp_information_message_record.message_sequence_number[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 12 -> securities_mm_lp_information_message_record.isin_code[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 5 -> securities_mm_lp_information_message_record.market_participant_number[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> securities_mm_lp_information_message_record.lp_start_date[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> securities_mm_lp_information_message_record.lp_end_date[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> securities_mm_lp_information_message_record.minimum_order_volume[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> securities_mm_lp_information_message_record.maximum_volume_of_multiple_order[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_record.bid_ask_spread_unit_code = securities_mm_lp_information_message_value;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.upper_limit_of_bid_ask_spread[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> securities_mm_lp_information_message_record.spread_multiple_for_market_holidays[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 6 -> securities_mm_lp_information_message_record.an_obligatory_time_interval_to_place_an_order[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.minimum_ask_price[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.maximum_bid_price[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.minimum_order_price[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.maximum_order_price[securities_mm_lp_information_message_at] = securities_mm_lp_information_message_value; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_record.end_keyword = securities_mm_lp_information_message_value;
  skip
}

/* each byte of Securities Mm Lp Information Message set to where it lies, so a field read out of place says so */
inline ramp_securities_mm_lp_information_message(securities_mm_lp_information_message_record, securities_mm_lp_information_message_base) {
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> securities_mm_lp_information_message_record.message_sequence_number[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 0 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 12 -> securities_mm_lp_information_message_record.isin_code[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 8 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 5 -> securities_mm_lp_information_message_record.market_participant_number[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 20 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> securities_mm_lp_information_message_record.lp_start_date[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 25 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> securities_mm_lp_information_message_record.lp_end_date[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 33 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> securities_mm_lp_information_message_record.minimum_order_volume[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 41 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> securities_mm_lp_information_message_record.maximum_volume_of_multiple_order[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 52 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_record.bid_ask_spread_unit_code = (securities_mm_lp_information_message_base + 63 + 1) % 256;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.upper_limit_of_bid_ask_spread[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 64 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> securities_mm_lp_information_message_record.spread_multiple_for_market_holidays[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 86 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 6 -> securities_mm_lp_information_message_record.an_obligatory_time_interval_to_place_an_order[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 97 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.minimum_ask_price[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 103 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.maximum_bid_price[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 125 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.minimum_order_price[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 147 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.maximum_order_price[securities_mm_lp_information_message_at] = (securities_mm_lp_information_message_base + 169 + securities_mm_lp_information_message_at + 1) % 256; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_record.end_keyword = (securities_mm_lp_information_message_base + 191 + 1) % 256;
  skip
}

/* Securities Mm Lp Information Message to the wire, 192 bytes from where the cursor stands */
inline encode_securities_mm_lp_information_message(securities_mm_lp_information_message_record) {
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> wire[at] = securities_mm_lp_information_message_record.message_sequence_number[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 12 -> wire[at] = securities_mm_lp_information_message_record.isin_code[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 5 -> wire[at] = securities_mm_lp_information_message_record.market_participant_number[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> wire[at] = securities_mm_lp_information_message_record.lp_start_date[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> wire[at] = securities_mm_lp_information_message_record.lp_end_date[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> wire[at] = securities_mm_lp_information_message_record.minimum_order_volume[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> wire[at] = securities_mm_lp_information_message_record.maximum_volume_of_multiple_order[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_mm_lp_information_message_record.bid_ask_spread_unit_code; at = at + 1;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> wire[at] = securities_mm_lp_information_message_record.upper_limit_of_bid_ask_spread[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> wire[at] = securities_mm_lp_information_message_record.spread_multiple_for_market_holidays[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 6 -> wire[at] = securities_mm_lp_information_message_record.an_obligatory_time_interval_to_place_an_order[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> wire[at] = securities_mm_lp_information_message_record.minimum_ask_price[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> wire[at] = securities_mm_lp_information_message_record.maximum_bid_price[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> wire[at] = securities_mm_lp_information_message_record.minimum_order_price[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> wire[at] = securities_mm_lp_information_message_record.maximum_order_price[securities_mm_lp_information_message_at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_mm_lp_information_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Mm Lp Information Message off the wire, 192 bytes from where the cursor stands */
inline decode_securities_mm_lp_information_message(securities_mm_lp_information_message_record) {
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> securities_mm_lp_information_message_record.message_sequence_number[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 12 -> securities_mm_lp_information_message_record.isin_code[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 5 -> securities_mm_lp_information_message_record.market_participant_number[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> securities_mm_lp_information_message_record.lp_start_date[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> securities_mm_lp_information_message_record.lp_end_date[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> securities_mm_lp_information_message_record.minimum_order_volume[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> securities_mm_lp_information_message_record.maximum_volume_of_multiple_order[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_record.bid_ask_spread_unit_code = wire[at]; at = at + 1;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.upper_limit_of_bid_ask_spread[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> securities_mm_lp_information_message_record.spread_multiple_for_market_holidays[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 6 -> securities_mm_lp_information_message_record.an_obligatory_time_interval_to_place_an_order[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.minimum_ask_price[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.maximum_bid_price[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.minimum_order_price[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> securities_mm_lp_information_message_record.maximum_order_price[securities_mm_lp_information_message_at] = wire[at]; at = at + 1; securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Mm Lp Information Message is what was written, byte for byte */
inline equal_securities_mm_lp_information_message(securities_mm_lp_information_message_read, securities_mm_lp_information_message_written) {
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> assert(securities_mm_lp_information_message_read.message_sequence_number[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.message_sequence_number[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 12 -> assert(securities_mm_lp_information_message_read.isin_code[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.isin_code[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 5 -> assert(securities_mm_lp_information_message_read.market_participant_number[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.market_participant_number[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> assert(securities_mm_lp_information_message_read.lp_start_date[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.lp_start_date[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 8 -> assert(securities_mm_lp_information_message_read.lp_end_date[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.lp_end_date[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> assert(securities_mm_lp_information_message_read.minimum_order_volume[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.minimum_order_volume[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> assert(securities_mm_lp_information_message_read.maximum_volume_of_multiple_order[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.maximum_volume_of_multiple_order[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  assert(securities_mm_lp_information_message_read.bid_ask_spread_unit_code == securities_mm_lp_information_message_written.bid_ask_spread_unit_code);
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> assert(securities_mm_lp_information_message_read.upper_limit_of_bid_ask_spread[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.upper_limit_of_bid_ask_spread[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 11 -> assert(securities_mm_lp_information_message_read.spread_multiple_for_market_holidays[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.spread_multiple_for_market_holidays[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 6 -> assert(securities_mm_lp_information_message_read.an_obligatory_time_interval_to_place_an_order[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.an_obligatory_time_interval_to_place_an_order[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> assert(securities_mm_lp_information_message_read.minimum_ask_price[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.minimum_ask_price[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> assert(securities_mm_lp_information_message_read.maximum_bid_price[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.maximum_bid_price[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> assert(securities_mm_lp_information_message_read.minimum_order_price[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.minimum_order_price[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  securities_mm_lp_information_message_at = 0;
  do
  :: securities_mm_lp_information_message_at < 22 -> assert(securities_mm_lp_information_message_read.maximum_order_price[securities_mm_lp_information_message_at] == securities_mm_lp_information_message_written.maximum_order_price[securities_mm_lp_information_message_at]); securities_mm_lp_information_message_at = securities_mm_lp_information_message_at + 1
  :: else -> break
  od;
  assert(securities_mm_lp_information_message_read.end_keyword == securities_mm_lp_information_message_written.end_keyword);
  skip
}

/* ---- Securities Member Information Message: 202 bytes ------------------------ */

/* Member firm information reference data (IFMSBTD0012) — Securities C STK variant. */
typedef SecuritiesMemberInformationMessage {
  byte message_sequence_number[8];
  byte business_date[8];
  byte market_participant_number[5];
  byte name_of_a_market_participant_in_kr[80];
  byte name_of_a_market_participant_in_en[80];
  byte an_abbreviated_name_of_a_market_participant_in_kr[20];
  byte end_keyword
};

int securities_member_information_message_at;

/* every byte of Securities Member Information Message set to one value */
inline fill_securities_member_information_message(securities_member_information_message_record, securities_member_information_message_value) {
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> securities_member_information_message_record.message_sequence_number[securities_member_information_message_at] = securities_member_information_message_value; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> securities_member_information_message_record.business_date[securities_member_information_message_at] = securities_member_information_message_value; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 5 -> securities_member_information_message_record.market_participant_number[securities_member_information_message_at] = securities_member_information_message_value; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> securities_member_information_message_record.name_of_a_market_participant_in_kr[securities_member_information_message_at] = securities_member_information_message_value; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> securities_member_information_message_record.name_of_a_market_participant_in_en[securities_member_information_message_at] = securities_member_information_message_value; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 20 -> securities_member_information_message_record.an_abbreviated_name_of_a_market_participant_in_kr[securities_member_information_message_at] = securities_member_information_message_value; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_record.end_keyword = securities_member_information_message_value;
  skip
}

/* each byte of Securities Member Information Message set to where it lies, so a field read out of place says so */
inline ramp_securities_member_information_message(securities_member_information_message_record, securities_member_information_message_base) {
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> securities_member_information_message_record.message_sequence_number[securities_member_information_message_at] = (securities_member_information_message_base + 0 + securities_member_information_message_at + 1) % 256; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> securities_member_information_message_record.business_date[securities_member_information_message_at] = (securities_member_information_message_base + 8 + securities_member_information_message_at + 1) % 256; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 5 -> securities_member_information_message_record.market_participant_number[securities_member_information_message_at] = (securities_member_information_message_base + 16 + securities_member_information_message_at + 1) % 256; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> securities_member_information_message_record.name_of_a_market_participant_in_kr[securities_member_information_message_at] = (securities_member_information_message_base + 21 + securities_member_information_message_at + 1) % 256; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> securities_member_information_message_record.name_of_a_market_participant_in_en[securities_member_information_message_at] = (securities_member_information_message_base + 101 + securities_member_information_message_at + 1) % 256; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 20 -> securities_member_information_message_record.an_abbreviated_name_of_a_market_participant_in_kr[securities_member_information_message_at] = (securities_member_information_message_base + 181 + securities_member_information_message_at + 1) % 256; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_record.end_keyword = (securities_member_information_message_base + 201 + 1) % 256;
  skip
}

/* Securities Member Information Message to the wire, 202 bytes from where the cursor stands */
inline encode_securities_member_information_message(securities_member_information_message_record) {
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> wire[at] = securities_member_information_message_record.message_sequence_number[securities_member_information_message_at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> wire[at] = securities_member_information_message_record.business_date[securities_member_information_message_at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 5 -> wire[at] = securities_member_information_message_record.market_participant_number[securities_member_information_message_at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> wire[at] = securities_member_information_message_record.name_of_a_market_participant_in_kr[securities_member_information_message_at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> wire[at] = securities_member_information_message_record.name_of_a_market_participant_in_en[securities_member_information_message_at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 20 -> wire[at] = securities_member_information_message_record.an_abbreviated_name_of_a_market_participant_in_kr[securities_member_information_message_at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_member_information_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Member Information Message off the wire, 202 bytes from where the cursor stands */
inline decode_securities_member_information_message(securities_member_information_message_record) {
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> securities_member_information_message_record.message_sequence_number[securities_member_information_message_at] = wire[at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> securities_member_information_message_record.business_date[securities_member_information_message_at] = wire[at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 5 -> securities_member_information_message_record.market_participant_number[securities_member_information_message_at] = wire[at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> securities_member_information_message_record.name_of_a_market_participant_in_kr[securities_member_information_message_at] = wire[at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> securities_member_information_message_record.name_of_a_market_participant_in_en[securities_member_information_message_at] = wire[at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 20 -> securities_member_information_message_record.an_abbreviated_name_of_a_market_participant_in_kr[securities_member_information_message_at] = wire[at]; at = at + 1; securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Member Information Message is what was written, byte for byte */
inline equal_securities_member_information_message(securities_member_information_message_read, securities_member_information_message_written) {
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> assert(securities_member_information_message_read.message_sequence_number[securities_member_information_message_at] == securities_member_information_message_written.message_sequence_number[securities_member_information_message_at]); securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 8 -> assert(securities_member_information_message_read.business_date[securities_member_information_message_at] == securities_member_information_message_written.business_date[securities_member_information_message_at]); securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 5 -> assert(securities_member_information_message_read.market_participant_number[securities_member_information_message_at] == securities_member_information_message_written.market_participant_number[securities_member_information_message_at]); securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> assert(securities_member_information_message_read.name_of_a_market_participant_in_kr[securities_member_information_message_at] == securities_member_information_message_written.name_of_a_market_participant_in_kr[securities_member_information_message_at]); securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 80 -> assert(securities_member_information_message_read.name_of_a_market_participant_in_en[securities_member_information_message_at] == securities_member_information_message_written.name_of_a_market_participant_in_en[securities_member_information_message_at]); securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  securities_member_information_message_at = 0;
  do
  :: securities_member_information_message_at < 20 -> assert(securities_member_information_message_read.an_abbreviated_name_of_a_market_participant_in_kr[securities_member_information_message_at] == securities_member_information_message_written.an_abbreviated_name_of_a_market_participant_in_kr[securities_member_information_message_at]); securities_member_information_message_at = securities_member_information_message_at + 1
  :: else -> break
  od;
  assert(securities_member_information_message_read.end_keyword == securities_member_information_message_written.end_keyword);
  skip
}

/* ---- Securities Treasury Stocks Batch Message: 130 bytes --------------------- */

/* Treasury Stocks Batch reference data. */
typedef SecuritiesTreasuryStocksBatchMessage {
  byte message_sequence_number[8];
  byte isin_code[12];
  byte treasury_stock_report_id[5];
  byte treasury_stock_ask_bid_type_code;
  byte treasury_stock_application_date[8];
  byte treasury_stock_trading_start_date[8];
  byte treasury_stock_trading_end_date[8];
  byte trearsury_stock_trading_method_type_code;
  byte market_participant_number[5];
  byte buying_volume_open_single_price_session[12];
  byte buying_volume_regular_session[12];
  byte buying_volume_block_trading_in_off_hours_session[12];
  byte accumulated_trading_quantity[15];
  byte accumulated_trading_value[22];
  byte end_keyword
};

int securities_treasury_stocks_batch_message_at;

/* every byte of Securities Treasury Stocks Batch Message set to one value */
inline fill_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_record, securities_treasury_stocks_batch_message_value) {
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.message_sequence_number[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.isin_code[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> securities_treasury_stocks_batch_message_record.treasury_stock_report_id[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_record.treasury_stock_ask_bid_type_code = securities_treasury_stocks_batch_message_value;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.treasury_stock_application_date[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.treasury_stock_trading_start_date[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.treasury_stock_trading_end_date[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_record.trearsury_stock_trading_method_type_code = securities_treasury_stocks_batch_message_value;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> securities_treasury_stocks_batch_message_record.market_participant_number[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.buying_volume_open_single_price_session[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.buying_volume_regular_session[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.buying_volume_block_trading_in_off_hours_session[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 15 -> securities_treasury_stocks_batch_message_record.accumulated_trading_quantity[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 22 -> securities_treasury_stocks_batch_message_record.accumulated_trading_value[securities_treasury_stocks_batch_message_at] = securities_treasury_stocks_batch_message_value; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_record.end_keyword = securities_treasury_stocks_batch_message_value;
  skip
}

/* each byte of Securities Treasury Stocks Batch Message set to where it lies, so a field read out of place says so */
inline ramp_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_record, securities_treasury_stocks_batch_message_base) {
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.message_sequence_number[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 0 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.isin_code[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 8 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> securities_treasury_stocks_batch_message_record.treasury_stock_report_id[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 20 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_record.treasury_stock_ask_bid_type_code = (securities_treasury_stocks_batch_message_base + 25 + 1) % 256;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.treasury_stock_application_date[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 26 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.treasury_stock_trading_start_date[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 34 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.treasury_stock_trading_end_date[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 42 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_record.trearsury_stock_trading_method_type_code = (securities_treasury_stocks_batch_message_base + 50 + 1) % 256;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> securities_treasury_stocks_batch_message_record.market_participant_number[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 51 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.buying_volume_open_single_price_session[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 56 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.buying_volume_regular_session[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 68 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.buying_volume_block_trading_in_off_hours_session[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 80 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 15 -> securities_treasury_stocks_batch_message_record.accumulated_trading_quantity[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 92 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 22 -> securities_treasury_stocks_batch_message_record.accumulated_trading_value[securities_treasury_stocks_batch_message_at] = (securities_treasury_stocks_batch_message_base + 107 + securities_treasury_stocks_batch_message_at + 1) % 256; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_record.end_keyword = (securities_treasury_stocks_batch_message_base + 129 + 1) % 256;
  skip
}

/* Securities Treasury Stocks Batch Message to the wire, 130 bytes from where the cursor stands */
inline encode_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_record) {
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> wire[at] = securities_treasury_stocks_batch_message_record.message_sequence_number[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> wire[at] = securities_treasury_stocks_batch_message_record.isin_code[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> wire[at] = securities_treasury_stocks_batch_message_record.treasury_stock_report_id[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_treasury_stocks_batch_message_record.treasury_stock_ask_bid_type_code; at = at + 1;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> wire[at] = securities_treasury_stocks_batch_message_record.treasury_stock_application_date[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> wire[at] = securities_treasury_stocks_batch_message_record.treasury_stock_trading_start_date[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> wire[at] = securities_treasury_stocks_batch_message_record.treasury_stock_trading_end_date[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_treasury_stocks_batch_message_record.trearsury_stock_trading_method_type_code; at = at + 1;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> wire[at] = securities_treasury_stocks_batch_message_record.market_participant_number[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> wire[at] = securities_treasury_stocks_batch_message_record.buying_volume_open_single_price_session[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> wire[at] = securities_treasury_stocks_batch_message_record.buying_volume_regular_session[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> wire[at] = securities_treasury_stocks_batch_message_record.buying_volume_block_trading_in_off_hours_session[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 15 -> wire[at] = securities_treasury_stocks_batch_message_record.accumulated_trading_quantity[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 22 -> wire[at] = securities_treasury_stocks_batch_message_record.accumulated_trading_value[securities_treasury_stocks_batch_message_at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_treasury_stocks_batch_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Treasury Stocks Batch Message off the wire, 130 bytes from where the cursor stands */
inline decode_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_record) {
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.message_sequence_number[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.isin_code[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> securities_treasury_stocks_batch_message_record.treasury_stock_report_id[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_record.treasury_stock_ask_bid_type_code = wire[at]; at = at + 1;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.treasury_stock_application_date[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.treasury_stock_trading_start_date[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> securities_treasury_stocks_batch_message_record.treasury_stock_trading_end_date[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_record.trearsury_stock_trading_method_type_code = wire[at]; at = at + 1;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> securities_treasury_stocks_batch_message_record.market_participant_number[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.buying_volume_open_single_price_session[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.buying_volume_regular_session[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> securities_treasury_stocks_batch_message_record.buying_volume_block_trading_in_off_hours_session[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 15 -> securities_treasury_stocks_batch_message_record.accumulated_trading_quantity[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 22 -> securities_treasury_stocks_batch_message_record.accumulated_trading_value[securities_treasury_stocks_batch_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Treasury Stocks Batch Message is what was written, byte for byte */
inline equal_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_read, securities_treasury_stocks_batch_message_written) {
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> assert(securities_treasury_stocks_batch_message_read.message_sequence_number[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.message_sequence_number[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> assert(securities_treasury_stocks_batch_message_read.isin_code[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.isin_code[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> assert(securities_treasury_stocks_batch_message_read.treasury_stock_report_id[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.treasury_stock_report_id[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  assert(securities_treasury_stocks_batch_message_read.treasury_stock_ask_bid_type_code == securities_treasury_stocks_batch_message_written.treasury_stock_ask_bid_type_code);
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> assert(securities_treasury_stocks_batch_message_read.treasury_stock_application_date[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.treasury_stock_application_date[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> assert(securities_treasury_stocks_batch_message_read.treasury_stock_trading_start_date[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.treasury_stock_trading_start_date[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 8 -> assert(securities_treasury_stocks_batch_message_read.treasury_stock_trading_end_date[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.treasury_stock_trading_end_date[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  assert(securities_treasury_stocks_batch_message_read.trearsury_stock_trading_method_type_code == securities_treasury_stocks_batch_message_written.trearsury_stock_trading_method_type_code);
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 5 -> assert(securities_treasury_stocks_batch_message_read.market_participant_number[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.market_participant_number[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> assert(securities_treasury_stocks_batch_message_read.buying_volume_open_single_price_session[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.buying_volume_open_single_price_session[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> assert(securities_treasury_stocks_batch_message_read.buying_volume_regular_session[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.buying_volume_regular_session[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 12 -> assert(securities_treasury_stocks_batch_message_read.buying_volume_block_trading_in_off_hours_session[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.buying_volume_block_trading_in_off_hours_session[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 15 -> assert(securities_treasury_stocks_batch_message_read.accumulated_trading_quantity[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.accumulated_trading_quantity[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_batch_message_at = 0;
  do
  :: securities_treasury_stocks_batch_message_at < 22 -> assert(securities_treasury_stocks_batch_message_read.accumulated_trading_value[securities_treasury_stocks_batch_message_at] == securities_treasury_stocks_batch_message_written.accumulated_trading_value[securities_treasury_stocks_batch_message_at]); securities_treasury_stocks_batch_message_at = securities_treasury_stocks_batch_message_at + 1
  :: else -> break
  od;
  assert(securities_treasury_stocks_batch_message_read.end_keyword == securities_treasury_stocks_batch_message_written.end_keyword);
  skip
}

/* ---- Securities Equity Index Indicator Message: 180 bytes -------------------- */

/* Equity Index Indicator. Real-time index value indicators for equity-derivatives underlying. */
typedef SecuritiesEquityIndexIndicatorMessage {
  byte message_sequence_number[8];
  byte isin_code[12];
  byte a_designated_number_for_an_issue[6];
  byte security_group_id[2];
  byte eps_calculation;
  byte eps[22];
  byte loss_category;
  byte per[13];
  byte bps_calculation;
  byte bps[22];
  byte pbr[13];
  byte dps_calculation;
  byte dps[22];
  byte dividend_yield[13];
  byte market_capitalization_type_code;
  byte filler_1;
  byte index_classification_level_1[6];
  byte index_classification_level_2[6];
  byte index_classification_level_3[6];
  byte kospi_200_sector_code_1;
  byte kospi_200_sector_code_2;
  byte kospi;
  byte kosdaq;
  byte kospi_100;
  byte kospi_50;
  byte kosdaq_150;
  byte krx_100;
  byte krx_300;
  byte kospi_200_high_dividend_yield_index;
  byte krx_bbig_index;
  byte krx_secondary_battery_top_10_index;
  byte krx_bio_top_10_index;
  byte korea_value_up_index;
  byte filler_8[8];
  byte end_keyword
};

int securities_equity_index_indicator_message_at;

/* every byte of Securities Equity Index Indicator Message set to one value */
inline fill_securities_equity_index_indicator_message(securities_equity_index_indicator_message_record, securities_equity_index_indicator_message_value) {
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> securities_equity_index_indicator_message_record.message_sequence_number[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 12 -> securities_equity_index_indicator_message_record.isin_code[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.a_designated_number_for_an_issue[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 2 -> securities_equity_index_indicator_message_record.security_group_id[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.eps_calculation = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> securities_equity_index_indicator_message_record.eps[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.loss_category = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> securities_equity_index_indicator_message_record.per[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.bps_calculation = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> securities_equity_index_indicator_message_record.bps[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> securities_equity_index_indicator_message_record.pbr[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.dps_calculation = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> securities_equity_index_indicator_message_record.dps[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> securities_equity_index_indicator_message_record.dividend_yield[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.market_capitalization_type_code = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.filler_1 = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.index_classification_level_1[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.index_classification_level_2[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.index_classification_level_3[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.kospi_200_sector_code_1 = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.kospi_200_sector_code_2 = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.kospi = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.kosdaq = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.kospi_100 = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.kospi_50 = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.kosdaq_150 = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.krx_100 = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.krx_300 = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.kospi_200_high_dividend_yield_index = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.krx_bbig_index = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.krx_secondary_battery_top_10_index = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.krx_bio_top_10_index = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_record.korea_value_up_index = securities_equity_index_indicator_message_value;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> securities_equity_index_indicator_message_record.filler_8[securities_equity_index_indicator_message_at] = securities_equity_index_indicator_message_value; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.end_keyword = securities_equity_index_indicator_message_value;
  skip
}

/* each byte of Securities Equity Index Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_securities_equity_index_indicator_message(securities_equity_index_indicator_message_record, securities_equity_index_indicator_message_base) {
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> securities_equity_index_indicator_message_record.message_sequence_number[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 0 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 12 -> securities_equity_index_indicator_message_record.isin_code[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 8 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.a_designated_number_for_an_issue[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 20 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 2 -> securities_equity_index_indicator_message_record.security_group_id[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 26 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.eps_calculation = (securities_equity_index_indicator_message_base + 28 + 1) % 256;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> securities_equity_index_indicator_message_record.eps[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 29 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.loss_category = (securities_equity_index_indicator_message_base + 51 + 1) % 256;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> securities_equity_index_indicator_message_record.per[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 52 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.bps_calculation = (securities_equity_index_indicator_message_base + 65 + 1) % 256;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> securities_equity_index_indicator_message_record.bps[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 66 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> securities_equity_index_indicator_message_record.pbr[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 88 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.dps_calculation = (securities_equity_index_indicator_message_base + 101 + 1) % 256;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> securities_equity_index_indicator_message_record.dps[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 102 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> securities_equity_index_indicator_message_record.dividend_yield[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 124 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.market_capitalization_type_code = (securities_equity_index_indicator_message_base + 137 + 1) % 256;
  securities_equity_index_indicator_message_record.filler_1 = (securities_equity_index_indicator_message_base + 138 + 1) % 256;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.index_classification_level_1[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 139 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.index_classification_level_2[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 145 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.index_classification_level_3[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 151 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.kospi_200_sector_code_1 = (securities_equity_index_indicator_message_base + 157 + 1) % 256;
  securities_equity_index_indicator_message_record.kospi_200_sector_code_2 = (securities_equity_index_indicator_message_base + 158 + 1) % 256;
  securities_equity_index_indicator_message_record.kospi = (securities_equity_index_indicator_message_base + 159 + 1) % 256;
  securities_equity_index_indicator_message_record.kosdaq = (securities_equity_index_indicator_message_base + 160 + 1) % 256;
  securities_equity_index_indicator_message_record.kospi_100 = (securities_equity_index_indicator_message_base + 161 + 1) % 256;
  securities_equity_index_indicator_message_record.kospi_50 = (securities_equity_index_indicator_message_base + 162 + 1) % 256;
  securities_equity_index_indicator_message_record.kosdaq_150 = (securities_equity_index_indicator_message_base + 163 + 1) % 256;
  securities_equity_index_indicator_message_record.krx_100 = (securities_equity_index_indicator_message_base + 164 + 1) % 256;
  securities_equity_index_indicator_message_record.krx_300 = (securities_equity_index_indicator_message_base + 165 + 1) % 256;
  securities_equity_index_indicator_message_record.kospi_200_high_dividend_yield_index = (securities_equity_index_indicator_message_base + 166 + 1) % 256;
  securities_equity_index_indicator_message_record.krx_bbig_index = (securities_equity_index_indicator_message_base + 167 + 1) % 256;
  securities_equity_index_indicator_message_record.krx_secondary_battery_top_10_index = (securities_equity_index_indicator_message_base + 168 + 1) % 256;
  securities_equity_index_indicator_message_record.krx_bio_top_10_index = (securities_equity_index_indicator_message_base + 169 + 1) % 256;
  securities_equity_index_indicator_message_record.korea_value_up_index = (securities_equity_index_indicator_message_base + 170 + 1) % 256;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> securities_equity_index_indicator_message_record.filler_8[securities_equity_index_indicator_message_at] = (securities_equity_index_indicator_message_base + 171 + securities_equity_index_indicator_message_at + 1) % 256; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.end_keyword = (securities_equity_index_indicator_message_base + 179 + 1) % 256;
  skip
}

/* Securities Equity Index Indicator Message to the wire, 180 bytes from where the cursor stands */
inline encode_securities_equity_index_indicator_message(securities_equity_index_indicator_message_record) {
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> wire[at] = securities_equity_index_indicator_message_record.message_sequence_number[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 12 -> wire[at] = securities_equity_index_indicator_message_record.isin_code[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> wire[at] = securities_equity_index_indicator_message_record.a_designated_number_for_an_issue[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 2 -> wire[at] = securities_equity_index_indicator_message_record.security_group_id[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equity_index_indicator_message_record.eps_calculation; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> wire[at] = securities_equity_index_indicator_message_record.eps[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equity_index_indicator_message_record.loss_category; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> wire[at] = securities_equity_index_indicator_message_record.per[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equity_index_indicator_message_record.bps_calculation; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> wire[at] = securities_equity_index_indicator_message_record.bps[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> wire[at] = securities_equity_index_indicator_message_record.pbr[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equity_index_indicator_message_record.dps_calculation; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> wire[at] = securities_equity_index_indicator_message_record.dps[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> wire[at] = securities_equity_index_indicator_message_record.dividend_yield[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equity_index_indicator_message_record.market_capitalization_type_code; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.filler_1; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> wire[at] = securities_equity_index_indicator_message_record.index_classification_level_1[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> wire[at] = securities_equity_index_indicator_message_record.index_classification_level_2[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> wire[at] = securities_equity_index_indicator_message_record.index_classification_level_3[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equity_index_indicator_message_record.kospi_200_sector_code_1; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.kospi_200_sector_code_2; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.kospi; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.kosdaq; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.kospi_100; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.kospi_50; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.kosdaq_150; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.krx_100; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.krx_300; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.kospi_200_high_dividend_yield_index; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.krx_bbig_index; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.krx_secondary_battery_top_10_index; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.krx_bio_top_10_index; at = at + 1;
  wire[at] = securities_equity_index_indicator_message_record.korea_value_up_index; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> wire[at] = securities_equity_index_indicator_message_record.filler_8[securities_equity_index_indicator_message_at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_equity_index_indicator_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Equity Index Indicator Message off the wire, 180 bytes from where the cursor stands */
inline decode_securities_equity_index_indicator_message(securities_equity_index_indicator_message_record) {
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> securities_equity_index_indicator_message_record.message_sequence_number[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 12 -> securities_equity_index_indicator_message_record.isin_code[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.a_designated_number_for_an_issue[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 2 -> securities_equity_index_indicator_message_record.security_group_id[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.eps_calculation = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> securities_equity_index_indicator_message_record.eps[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.loss_category = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> securities_equity_index_indicator_message_record.per[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.bps_calculation = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> securities_equity_index_indicator_message_record.bps[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> securities_equity_index_indicator_message_record.pbr[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.dps_calculation = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> securities_equity_index_indicator_message_record.dps[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> securities_equity_index_indicator_message_record.dividend_yield[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.market_capitalization_type_code = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.filler_1 = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.index_classification_level_1[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.index_classification_level_2[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> securities_equity_index_indicator_message_record.index_classification_level_3[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.kospi_200_sector_code_1 = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.kospi_200_sector_code_2 = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.kospi = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.kosdaq = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.kospi_100 = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.kospi_50 = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.kosdaq_150 = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.krx_100 = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.krx_300 = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.kospi_200_high_dividend_yield_index = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.krx_bbig_index = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.krx_secondary_battery_top_10_index = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.krx_bio_top_10_index = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_record.korea_value_up_index = wire[at]; at = at + 1;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> securities_equity_index_indicator_message_record.filler_8[securities_equity_index_indicator_message_at] = wire[at]; at = at + 1; securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Equity Index Indicator Message is what was written, byte for byte */
inline equal_securities_equity_index_indicator_message(securities_equity_index_indicator_message_read, securities_equity_index_indicator_message_written) {
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> assert(securities_equity_index_indicator_message_read.message_sequence_number[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.message_sequence_number[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 12 -> assert(securities_equity_index_indicator_message_read.isin_code[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.isin_code[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> assert(securities_equity_index_indicator_message_read.a_designated_number_for_an_issue[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.a_designated_number_for_an_issue[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 2 -> assert(securities_equity_index_indicator_message_read.security_group_id[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.security_group_id[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  assert(securities_equity_index_indicator_message_read.eps_calculation == securities_equity_index_indicator_message_written.eps_calculation);
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> assert(securities_equity_index_indicator_message_read.eps[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.eps[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  assert(securities_equity_index_indicator_message_read.loss_category == securities_equity_index_indicator_message_written.loss_category);
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> assert(securities_equity_index_indicator_message_read.per[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.per[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  assert(securities_equity_index_indicator_message_read.bps_calculation == securities_equity_index_indicator_message_written.bps_calculation);
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> assert(securities_equity_index_indicator_message_read.bps[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.bps[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> assert(securities_equity_index_indicator_message_read.pbr[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.pbr[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  assert(securities_equity_index_indicator_message_read.dps_calculation == securities_equity_index_indicator_message_written.dps_calculation);
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 22 -> assert(securities_equity_index_indicator_message_read.dps[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.dps[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 13 -> assert(securities_equity_index_indicator_message_read.dividend_yield[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.dividend_yield[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  assert(securities_equity_index_indicator_message_read.market_capitalization_type_code == securities_equity_index_indicator_message_written.market_capitalization_type_code);
  assert(securities_equity_index_indicator_message_read.filler_1 == securities_equity_index_indicator_message_written.filler_1);
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> assert(securities_equity_index_indicator_message_read.index_classification_level_1[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.index_classification_level_1[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> assert(securities_equity_index_indicator_message_read.index_classification_level_2[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.index_classification_level_2[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 6 -> assert(securities_equity_index_indicator_message_read.index_classification_level_3[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.index_classification_level_3[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  assert(securities_equity_index_indicator_message_read.kospi_200_sector_code_1 == securities_equity_index_indicator_message_written.kospi_200_sector_code_1);
  assert(securities_equity_index_indicator_message_read.kospi_200_sector_code_2 == securities_equity_index_indicator_message_written.kospi_200_sector_code_2);
  assert(securities_equity_index_indicator_message_read.kospi == securities_equity_index_indicator_message_written.kospi);
  assert(securities_equity_index_indicator_message_read.kosdaq == securities_equity_index_indicator_message_written.kosdaq);
  assert(securities_equity_index_indicator_message_read.kospi_100 == securities_equity_index_indicator_message_written.kospi_100);
  assert(securities_equity_index_indicator_message_read.kospi_50 == securities_equity_index_indicator_message_written.kospi_50);
  assert(securities_equity_index_indicator_message_read.kosdaq_150 == securities_equity_index_indicator_message_written.kosdaq_150);
  assert(securities_equity_index_indicator_message_read.krx_100 == securities_equity_index_indicator_message_written.krx_100);
  assert(securities_equity_index_indicator_message_read.krx_300 == securities_equity_index_indicator_message_written.krx_300);
  assert(securities_equity_index_indicator_message_read.kospi_200_high_dividend_yield_index == securities_equity_index_indicator_message_written.kospi_200_high_dividend_yield_index);
  assert(securities_equity_index_indicator_message_read.krx_bbig_index == securities_equity_index_indicator_message_written.krx_bbig_index);
  assert(securities_equity_index_indicator_message_read.krx_secondary_battery_top_10_index == securities_equity_index_indicator_message_written.krx_secondary_battery_top_10_index);
  assert(securities_equity_index_indicator_message_read.krx_bio_top_10_index == securities_equity_index_indicator_message_written.krx_bio_top_10_index);
  assert(securities_equity_index_indicator_message_read.korea_value_up_index == securities_equity_index_indicator_message_written.korea_value_up_index);
  securities_equity_index_indicator_message_at = 0;
  do
  :: securities_equity_index_indicator_message_at < 8 -> assert(securities_equity_index_indicator_message_read.filler_8[securities_equity_index_indicator_message_at] == securities_equity_index_indicator_message_written.filler_8[securities_equity_index_indicator_message_at]); securities_equity_index_indicator_message_at = securities_equity_index_indicator_message_at + 1
  :: else -> break
  od;
  assert(securities_equity_index_indicator_message_read.end_keyword == securities_equity_index_indicator_message_written.end_keyword);
  skip
}

/* ---- Securities Dividend Yield Per Industry Message: 31 bytes ---------------- */

/* Dividend Yield per Industry reference (IFMSBTD0003) — KOSPI variant. */
typedef SecuritiesDividendYieldPerIndustryMessage {
  byte message_sequence_number[8];
  byte index_id[6];
  byte dividend_yield[13];
  byte filler_3[3];
  byte end_keyword
};

int securities_dividend_yield_per_industry_message_at;

/* every byte of Securities Dividend Yield Per Industry Message set to one value */
inline fill_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_record, securities_dividend_yield_per_industry_message_value) {
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 8 -> securities_dividend_yield_per_industry_message_record.message_sequence_number[securities_dividend_yield_per_industry_message_at] = securities_dividend_yield_per_industry_message_value; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 6 -> securities_dividend_yield_per_industry_message_record.index_id[securities_dividend_yield_per_industry_message_at] = securities_dividend_yield_per_industry_message_value; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 13 -> securities_dividend_yield_per_industry_message_record.dividend_yield[securities_dividend_yield_per_industry_message_at] = securities_dividend_yield_per_industry_message_value; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 3 -> securities_dividend_yield_per_industry_message_record.filler_3[securities_dividend_yield_per_industry_message_at] = securities_dividend_yield_per_industry_message_value; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_record.end_keyword = securities_dividend_yield_per_industry_message_value;
  skip
}

/* each byte of Securities Dividend Yield Per Industry Message set to where it lies, so a field read out of place says so */
inline ramp_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_record, securities_dividend_yield_per_industry_message_base) {
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 8 -> securities_dividend_yield_per_industry_message_record.message_sequence_number[securities_dividend_yield_per_industry_message_at] = (securities_dividend_yield_per_industry_message_base + 0 + securities_dividend_yield_per_industry_message_at + 1) % 256; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 6 -> securities_dividend_yield_per_industry_message_record.index_id[securities_dividend_yield_per_industry_message_at] = (securities_dividend_yield_per_industry_message_base + 8 + securities_dividend_yield_per_industry_message_at + 1) % 256; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 13 -> securities_dividend_yield_per_industry_message_record.dividend_yield[securities_dividend_yield_per_industry_message_at] = (securities_dividend_yield_per_industry_message_base + 14 + securities_dividend_yield_per_industry_message_at + 1) % 256; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 3 -> securities_dividend_yield_per_industry_message_record.filler_3[securities_dividend_yield_per_industry_message_at] = (securities_dividend_yield_per_industry_message_base + 27 + securities_dividend_yield_per_industry_message_at + 1) % 256; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_record.end_keyword = (securities_dividend_yield_per_industry_message_base + 30 + 1) % 256;
  skip
}

/* Securities Dividend Yield Per Industry Message to the wire, 31 bytes from where the cursor stands */
inline encode_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_record) {
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 8 -> wire[at] = securities_dividend_yield_per_industry_message_record.message_sequence_number[securities_dividend_yield_per_industry_message_at]; at = at + 1; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 6 -> wire[at] = securities_dividend_yield_per_industry_message_record.index_id[securities_dividend_yield_per_industry_message_at]; at = at + 1; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 13 -> wire[at] = securities_dividend_yield_per_industry_message_record.dividend_yield[securities_dividend_yield_per_industry_message_at]; at = at + 1; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 3 -> wire[at] = securities_dividend_yield_per_industry_message_record.filler_3[securities_dividend_yield_per_industry_message_at]; at = at + 1; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_dividend_yield_per_industry_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Dividend Yield Per Industry Message off the wire, 31 bytes from where the cursor stands */
inline decode_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_record) {
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 8 -> securities_dividend_yield_per_industry_message_record.message_sequence_number[securities_dividend_yield_per_industry_message_at] = wire[at]; at = at + 1; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 6 -> securities_dividend_yield_per_industry_message_record.index_id[securities_dividend_yield_per_industry_message_at] = wire[at]; at = at + 1; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 13 -> securities_dividend_yield_per_industry_message_record.dividend_yield[securities_dividend_yield_per_industry_message_at] = wire[at]; at = at + 1; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 3 -> securities_dividend_yield_per_industry_message_record.filler_3[securities_dividend_yield_per_industry_message_at] = wire[at]; at = at + 1; securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Dividend Yield Per Industry Message is what was written, byte for byte */
inline equal_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_read, securities_dividend_yield_per_industry_message_written) {
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 8 -> assert(securities_dividend_yield_per_industry_message_read.message_sequence_number[securities_dividend_yield_per_industry_message_at] == securities_dividend_yield_per_industry_message_written.message_sequence_number[securities_dividend_yield_per_industry_message_at]); securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 6 -> assert(securities_dividend_yield_per_industry_message_read.index_id[securities_dividend_yield_per_industry_message_at] == securities_dividend_yield_per_industry_message_written.index_id[securities_dividend_yield_per_industry_message_at]); securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 13 -> assert(securities_dividend_yield_per_industry_message_read.dividend_yield[securities_dividend_yield_per_industry_message_at] == securities_dividend_yield_per_industry_message_written.dividend_yield[securities_dividend_yield_per_industry_message_at]); securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  securities_dividend_yield_per_industry_message_at = 0;
  do
  :: securities_dividend_yield_per_industry_message_at < 3 -> assert(securities_dividend_yield_per_industry_message_read.filler_3[securities_dividend_yield_per_industry_message_at] == securities_dividend_yield_per_industry_message_written.filler_3[securities_dividend_yield_per_industry_message_at]); securities_dividend_yield_per_industry_message_at = securities_dividend_yield_per_industry_message_at + 1
  :: else -> break
  od;
  assert(securities_dividend_yield_per_industry_message_read.end_keyword == securities_dividend_yield_per_industry_message_written.end_keyword);
  skip
}

/* ---- Bonds Batch Data Message: 303 bytes ------------------------------------- */

/* Bonds Batch Data. Per-issue reference data dumped at start-of-day for General Bonds, KTB, and Baby Bonds. */
typedef BondsBatchDataMessage {
  byte message_sequence_number[8];
  byte total_number_of_instruments_of_the_contract[6];
  byte business_date[8];
  byte isin_code[12];
  byte a_designated_number_for_an_issue[6];
  byte retail_bond_type_code[2];
  byte abbreviated_issue_name[40];
  byte abbreviated_issue_name_in_en[40];
  byte market_operation_product_id[3];
  byte bond_listing_type_code;
  byte bond_category_code[6];
  byte bond_guaranteed_type_code;
  byte coupon_payment_type_code[2];
  byte listing_date[8];
  byte issue_date[8];
  byte redemption_date[8];
  byte sale_date[8];
  byte bond_issuance_rate[13];
  byte coupon_rate[14];
  byte monthly_cycle_of_coupon_payment[4];
  byte coupon_payment_timing_code;
  byte interest_payment;
  byte coupon_payment_date_type_code;
  byte decimal_point_of_coupon_type_code;
  byte pre_issue_sale_coupon_payment_type_code;
  byte issuing_amount[22];
  byte listed_amount[22];
  byte redemption_ratio_at_maturity[13];
  byte amortization_type_code;
  byte number_of_months_for_grace[4];
  byte number_of_amortization[5];
  byte trading_halt;
  byte prior_coupon_payment_date[8];
  byte next_coupon_payment_date[8];
  byte perpetual_bond_maturity_structure_status;
  byte strip_bond_type_code;
  byte base_price[11];
  byte liquidation_trade;
  byte investment_caution_bond_type_code;
  byte end_keyword
};

int bonds_batch_data_message_at;

/* every byte of Bonds Batch Data Message set to one value */
inline fill_bonds_batch_data_message(bonds_batch_data_message_record, bonds_batch_data_message_value) {
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.message_sequence_number[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> bonds_batch_data_message_record.total_number_of_instruments_of_the_contract[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.business_date[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 12 -> bonds_batch_data_message_record.isin_code[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> bonds_batch_data_message_record.a_designated_number_for_an_issue[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> bonds_batch_data_message_record.retail_bond_type_code[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> bonds_batch_data_message_record.abbreviated_issue_name[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> bonds_batch_data_message_record.abbreviated_issue_name_in_en[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 3 -> bonds_batch_data_message_record.market_operation_product_id[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.bond_listing_type_code = bonds_batch_data_message_value;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> bonds_batch_data_message_record.bond_category_code[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.bond_guaranteed_type_code = bonds_batch_data_message_value;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> bonds_batch_data_message_record.coupon_payment_type_code[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.listing_date[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.issue_date[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.redemption_date[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.sale_date[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> bonds_batch_data_message_record.bond_issuance_rate[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 14 -> bonds_batch_data_message_record.coupon_rate[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> bonds_batch_data_message_record.monthly_cycle_of_coupon_payment[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.coupon_payment_timing_code = bonds_batch_data_message_value;
  bonds_batch_data_message_record.interest_payment = bonds_batch_data_message_value;
  bonds_batch_data_message_record.coupon_payment_date_type_code = bonds_batch_data_message_value;
  bonds_batch_data_message_record.decimal_point_of_coupon_type_code = bonds_batch_data_message_value;
  bonds_batch_data_message_record.pre_issue_sale_coupon_payment_type_code = bonds_batch_data_message_value;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> bonds_batch_data_message_record.issuing_amount[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> bonds_batch_data_message_record.listed_amount[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> bonds_batch_data_message_record.redemption_ratio_at_maturity[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.amortization_type_code = bonds_batch_data_message_value;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> bonds_batch_data_message_record.number_of_months_for_grace[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 5 -> bonds_batch_data_message_record.number_of_amortization[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.trading_halt = bonds_batch_data_message_value;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.prior_coupon_payment_date[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.next_coupon_payment_date[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.perpetual_bond_maturity_structure_status = bonds_batch_data_message_value;
  bonds_batch_data_message_record.strip_bond_type_code = bonds_batch_data_message_value;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 11 -> bonds_batch_data_message_record.base_price[bonds_batch_data_message_at] = bonds_batch_data_message_value; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.liquidation_trade = bonds_batch_data_message_value;
  bonds_batch_data_message_record.investment_caution_bond_type_code = bonds_batch_data_message_value;
  bonds_batch_data_message_record.end_keyword = bonds_batch_data_message_value;
  skip
}

/* each byte of Bonds Batch Data Message set to where it lies, so a field read out of place says so */
inline ramp_bonds_batch_data_message(bonds_batch_data_message_record, bonds_batch_data_message_base) {
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.message_sequence_number[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 0 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> bonds_batch_data_message_record.total_number_of_instruments_of_the_contract[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 8 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.business_date[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 14 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 12 -> bonds_batch_data_message_record.isin_code[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 22 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> bonds_batch_data_message_record.a_designated_number_for_an_issue[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 34 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> bonds_batch_data_message_record.retail_bond_type_code[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 40 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> bonds_batch_data_message_record.abbreviated_issue_name[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 42 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> bonds_batch_data_message_record.abbreviated_issue_name_in_en[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 82 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 3 -> bonds_batch_data_message_record.market_operation_product_id[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 122 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.bond_listing_type_code = (bonds_batch_data_message_base + 125 + 1) % 256;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> bonds_batch_data_message_record.bond_category_code[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 126 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.bond_guaranteed_type_code = (bonds_batch_data_message_base + 132 + 1) % 256;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> bonds_batch_data_message_record.coupon_payment_type_code[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 133 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.listing_date[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 135 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.issue_date[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 143 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.redemption_date[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 151 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.sale_date[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 159 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> bonds_batch_data_message_record.bond_issuance_rate[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 167 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 14 -> bonds_batch_data_message_record.coupon_rate[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 180 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> bonds_batch_data_message_record.monthly_cycle_of_coupon_payment[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 194 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.coupon_payment_timing_code = (bonds_batch_data_message_base + 198 + 1) % 256;
  bonds_batch_data_message_record.interest_payment = (bonds_batch_data_message_base + 199 + 1) % 256;
  bonds_batch_data_message_record.coupon_payment_date_type_code = (bonds_batch_data_message_base + 200 + 1) % 256;
  bonds_batch_data_message_record.decimal_point_of_coupon_type_code = (bonds_batch_data_message_base + 201 + 1) % 256;
  bonds_batch_data_message_record.pre_issue_sale_coupon_payment_type_code = (bonds_batch_data_message_base + 202 + 1) % 256;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> bonds_batch_data_message_record.issuing_amount[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 203 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> bonds_batch_data_message_record.listed_amount[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 225 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> bonds_batch_data_message_record.redemption_ratio_at_maturity[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 247 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.amortization_type_code = (bonds_batch_data_message_base + 260 + 1) % 256;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> bonds_batch_data_message_record.number_of_months_for_grace[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 261 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 5 -> bonds_batch_data_message_record.number_of_amortization[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 265 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.trading_halt = (bonds_batch_data_message_base + 270 + 1) % 256;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.prior_coupon_payment_date[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 271 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.next_coupon_payment_date[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 279 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.perpetual_bond_maturity_structure_status = (bonds_batch_data_message_base + 287 + 1) % 256;
  bonds_batch_data_message_record.strip_bond_type_code = (bonds_batch_data_message_base + 288 + 1) % 256;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 11 -> bonds_batch_data_message_record.base_price[bonds_batch_data_message_at] = (bonds_batch_data_message_base + 289 + bonds_batch_data_message_at + 1) % 256; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.liquidation_trade = (bonds_batch_data_message_base + 300 + 1) % 256;
  bonds_batch_data_message_record.investment_caution_bond_type_code = (bonds_batch_data_message_base + 301 + 1) % 256;
  bonds_batch_data_message_record.end_keyword = (bonds_batch_data_message_base + 302 + 1) % 256;
  skip
}

/* Bonds Batch Data Message to the wire, 303 bytes from where the cursor stands */
inline encode_bonds_batch_data_message(bonds_batch_data_message_record) {
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> wire[at] = bonds_batch_data_message_record.message_sequence_number[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> wire[at] = bonds_batch_data_message_record.total_number_of_instruments_of_the_contract[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> wire[at] = bonds_batch_data_message_record.business_date[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 12 -> wire[at] = bonds_batch_data_message_record.isin_code[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> wire[at] = bonds_batch_data_message_record.a_designated_number_for_an_issue[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> wire[at] = bonds_batch_data_message_record.retail_bond_type_code[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> wire[at] = bonds_batch_data_message_record.abbreviated_issue_name[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> wire[at] = bonds_batch_data_message_record.abbreviated_issue_name_in_en[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 3 -> wire[at] = bonds_batch_data_message_record.market_operation_product_id[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = bonds_batch_data_message_record.bond_listing_type_code; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> wire[at] = bonds_batch_data_message_record.bond_category_code[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = bonds_batch_data_message_record.bond_guaranteed_type_code; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> wire[at] = bonds_batch_data_message_record.coupon_payment_type_code[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> wire[at] = bonds_batch_data_message_record.listing_date[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> wire[at] = bonds_batch_data_message_record.issue_date[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> wire[at] = bonds_batch_data_message_record.redemption_date[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> wire[at] = bonds_batch_data_message_record.sale_date[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> wire[at] = bonds_batch_data_message_record.bond_issuance_rate[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 14 -> wire[at] = bonds_batch_data_message_record.coupon_rate[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> wire[at] = bonds_batch_data_message_record.monthly_cycle_of_coupon_payment[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = bonds_batch_data_message_record.coupon_payment_timing_code; at = at + 1;
  wire[at] = bonds_batch_data_message_record.interest_payment; at = at + 1;
  wire[at] = bonds_batch_data_message_record.coupon_payment_date_type_code; at = at + 1;
  wire[at] = bonds_batch_data_message_record.decimal_point_of_coupon_type_code; at = at + 1;
  wire[at] = bonds_batch_data_message_record.pre_issue_sale_coupon_payment_type_code; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> wire[at] = bonds_batch_data_message_record.issuing_amount[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> wire[at] = bonds_batch_data_message_record.listed_amount[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> wire[at] = bonds_batch_data_message_record.redemption_ratio_at_maturity[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = bonds_batch_data_message_record.amortization_type_code; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> wire[at] = bonds_batch_data_message_record.number_of_months_for_grace[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 5 -> wire[at] = bonds_batch_data_message_record.number_of_amortization[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = bonds_batch_data_message_record.trading_halt; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> wire[at] = bonds_batch_data_message_record.prior_coupon_payment_date[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> wire[at] = bonds_batch_data_message_record.next_coupon_payment_date[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = bonds_batch_data_message_record.perpetual_bond_maturity_structure_status; at = at + 1;
  wire[at] = bonds_batch_data_message_record.strip_bond_type_code; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 11 -> wire[at] = bonds_batch_data_message_record.base_price[bonds_batch_data_message_at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = bonds_batch_data_message_record.liquidation_trade; at = at + 1;
  wire[at] = bonds_batch_data_message_record.investment_caution_bond_type_code; at = at + 1;
  wire[at] = bonds_batch_data_message_record.end_keyword; at = at + 1;
  skip
}

/* Bonds Batch Data Message off the wire, 303 bytes from where the cursor stands */
inline decode_bonds_batch_data_message(bonds_batch_data_message_record) {
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.message_sequence_number[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> bonds_batch_data_message_record.total_number_of_instruments_of_the_contract[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.business_date[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 12 -> bonds_batch_data_message_record.isin_code[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> bonds_batch_data_message_record.a_designated_number_for_an_issue[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> bonds_batch_data_message_record.retail_bond_type_code[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> bonds_batch_data_message_record.abbreviated_issue_name[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> bonds_batch_data_message_record.abbreviated_issue_name_in_en[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 3 -> bonds_batch_data_message_record.market_operation_product_id[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.bond_listing_type_code = wire[at]; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> bonds_batch_data_message_record.bond_category_code[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.bond_guaranteed_type_code = wire[at]; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> bonds_batch_data_message_record.coupon_payment_type_code[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.listing_date[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.issue_date[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.redemption_date[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.sale_date[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> bonds_batch_data_message_record.bond_issuance_rate[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 14 -> bonds_batch_data_message_record.coupon_rate[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> bonds_batch_data_message_record.monthly_cycle_of_coupon_payment[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.coupon_payment_timing_code = wire[at]; at = at + 1;
  bonds_batch_data_message_record.interest_payment = wire[at]; at = at + 1;
  bonds_batch_data_message_record.coupon_payment_date_type_code = wire[at]; at = at + 1;
  bonds_batch_data_message_record.decimal_point_of_coupon_type_code = wire[at]; at = at + 1;
  bonds_batch_data_message_record.pre_issue_sale_coupon_payment_type_code = wire[at]; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> bonds_batch_data_message_record.issuing_amount[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> bonds_batch_data_message_record.listed_amount[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> bonds_batch_data_message_record.redemption_ratio_at_maturity[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.amortization_type_code = wire[at]; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> bonds_batch_data_message_record.number_of_months_for_grace[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 5 -> bonds_batch_data_message_record.number_of_amortization[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.trading_halt = wire[at]; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.prior_coupon_payment_date[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> bonds_batch_data_message_record.next_coupon_payment_date[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.perpetual_bond_maturity_structure_status = wire[at]; at = at + 1;
  bonds_batch_data_message_record.strip_bond_type_code = wire[at]; at = at + 1;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 11 -> bonds_batch_data_message_record.base_price[bonds_batch_data_message_at] = wire[at]; at = at + 1; bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_record.liquidation_trade = wire[at]; at = at + 1;
  bonds_batch_data_message_record.investment_caution_bond_type_code = wire[at]; at = at + 1;
  bonds_batch_data_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Bonds Batch Data Message is what was written, byte for byte */
inline equal_bonds_batch_data_message(bonds_batch_data_message_read, bonds_batch_data_message_written) {
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> assert(bonds_batch_data_message_read.message_sequence_number[bonds_batch_data_message_at] == bonds_batch_data_message_written.message_sequence_number[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> assert(bonds_batch_data_message_read.total_number_of_instruments_of_the_contract[bonds_batch_data_message_at] == bonds_batch_data_message_written.total_number_of_instruments_of_the_contract[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> assert(bonds_batch_data_message_read.business_date[bonds_batch_data_message_at] == bonds_batch_data_message_written.business_date[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 12 -> assert(bonds_batch_data_message_read.isin_code[bonds_batch_data_message_at] == bonds_batch_data_message_written.isin_code[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> assert(bonds_batch_data_message_read.a_designated_number_for_an_issue[bonds_batch_data_message_at] == bonds_batch_data_message_written.a_designated_number_for_an_issue[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> assert(bonds_batch_data_message_read.retail_bond_type_code[bonds_batch_data_message_at] == bonds_batch_data_message_written.retail_bond_type_code[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> assert(bonds_batch_data_message_read.abbreviated_issue_name[bonds_batch_data_message_at] == bonds_batch_data_message_written.abbreviated_issue_name[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 40 -> assert(bonds_batch_data_message_read.abbreviated_issue_name_in_en[bonds_batch_data_message_at] == bonds_batch_data_message_written.abbreviated_issue_name_in_en[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 3 -> assert(bonds_batch_data_message_read.market_operation_product_id[bonds_batch_data_message_at] == bonds_batch_data_message_written.market_operation_product_id[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  assert(bonds_batch_data_message_read.bond_listing_type_code == bonds_batch_data_message_written.bond_listing_type_code);
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 6 -> assert(bonds_batch_data_message_read.bond_category_code[bonds_batch_data_message_at] == bonds_batch_data_message_written.bond_category_code[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  assert(bonds_batch_data_message_read.bond_guaranteed_type_code == bonds_batch_data_message_written.bond_guaranteed_type_code);
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 2 -> assert(bonds_batch_data_message_read.coupon_payment_type_code[bonds_batch_data_message_at] == bonds_batch_data_message_written.coupon_payment_type_code[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> assert(bonds_batch_data_message_read.listing_date[bonds_batch_data_message_at] == bonds_batch_data_message_written.listing_date[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> assert(bonds_batch_data_message_read.issue_date[bonds_batch_data_message_at] == bonds_batch_data_message_written.issue_date[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> assert(bonds_batch_data_message_read.redemption_date[bonds_batch_data_message_at] == bonds_batch_data_message_written.redemption_date[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> assert(bonds_batch_data_message_read.sale_date[bonds_batch_data_message_at] == bonds_batch_data_message_written.sale_date[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> assert(bonds_batch_data_message_read.bond_issuance_rate[bonds_batch_data_message_at] == bonds_batch_data_message_written.bond_issuance_rate[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 14 -> assert(bonds_batch_data_message_read.coupon_rate[bonds_batch_data_message_at] == bonds_batch_data_message_written.coupon_rate[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> assert(bonds_batch_data_message_read.monthly_cycle_of_coupon_payment[bonds_batch_data_message_at] == bonds_batch_data_message_written.monthly_cycle_of_coupon_payment[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  assert(bonds_batch_data_message_read.coupon_payment_timing_code == bonds_batch_data_message_written.coupon_payment_timing_code);
  assert(bonds_batch_data_message_read.interest_payment == bonds_batch_data_message_written.interest_payment);
  assert(bonds_batch_data_message_read.coupon_payment_date_type_code == bonds_batch_data_message_written.coupon_payment_date_type_code);
  assert(bonds_batch_data_message_read.decimal_point_of_coupon_type_code == bonds_batch_data_message_written.decimal_point_of_coupon_type_code);
  assert(bonds_batch_data_message_read.pre_issue_sale_coupon_payment_type_code == bonds_batch_data_message_written.pre_issue_sale_coupon_payment_type_code);
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> assert(bonds_batch_data_message_read.issuing_amount[bonds_batch_data_message_at] == bonds_batch_data_message_written.issuing_amount[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 22 -> assert(bonds_batch_data_message_read.listed_amount[bonds_batch_data_message_at] == bonds_batch_data_message_written.listed_amount[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 13 -> assert(bonds_batch_data_message_read.redemption_ratio_at_maturity[bonds_batch_data_message_at] == bonds_batch_data_message_written.redemption_ratio_at_maturity[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  assert(bonds_batch_data_message_read.amortization_type_code == bonds_batch_data_message_written.amortization_type_code);
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 4 -> assert(bonds_batch_data_message_read.number_of_months_for_grace[bonds_batch_data_message_at] == bonds_batch_data_message_written.number_of_months_for_grace[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 5 -> assert(bonds_batch_data_message_read.number_of_amortization[bonds_batch_data_message_at] == bonds_batch_data_message_written.number_of_amortization[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  assert(bonds_batch_data_message_read.trading_halt == bonds_batch_data_message_written.trading_halt);
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> assert(bonds_batch_data_message_read.prior_coupon_payment_date[bonds_batch_data_message_at] == bonds_batch_data_message_written.prior_coupon_payment_date[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 8 -> assert(bonds_batch_data_message_read.next_coupon_payment_date[bonds_batch_data_message_at] == bonds_batch_data_message_written.next_coupon_payment_date[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  assert(bonds_batch_data_message_read.perpetual_bond_maturity_structure_status == bonds_batch_data_message_written.perpetual_bond_maturity_structure_status);
  assert(bonds_batch_data_message_read.strip_bond_type_code == bonds_batch_data_message_written.strip_bond_type_code);
  bonds_batch_data_message_at = 0;
  do
  :: bonds_batch_data_message_at < 11 -> assert(bonds_batch_data_message_read.base_price[bonds_batch_data_message_at] == bonds_batch_data_message_written.base_price[bonds_batch_data_message_at]); bonds_batch_data_message_at = bonds_batch_data_message_at + 1
  :: else -> break
  od;
  assert(bonds_batch_data_message_read.liquidation_trade == bonds_batch_data_message_written.liquidation_trade);
  assert(bonds_batch_data_message_read.investment_caution_bond_type_code == bonds_batch_data_message_written.investment_caution_bond_type_code);
  assert(bonds_batch_data_message_read.end_keyword == bonds_batch_data_message_written.end_keyword);
  skip
}

/* ---- Repo Batch Data Message: 95 bytes --------------------------------------- */

/* REPO Batch Data. Per-issue reference data dumped at start-of-day for REPO instruments. */
typedef RepoBatchDataMessage {
  byte message_sequence_number[8];
  byte total_number_of_instruments_of_the_contract[6];
  byte business_date[8];
  byte isin_code[12];
  byte a_designated_number_for_an_issue[6];
  byte market_operation_product_id[3];
  byte abbreviated_issue_name[40];
  byte market_value[11];
  byte end_keyword
};

int repo_batch_data_message_at;

/* every byte of Repo Batch Data Message set to one value */
inline fill_repo_batch_data_message(repo_batch_data_message_record, repo_batch_data_message_value) {
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> repo_batch_data_message_record.message_sequence_number[repo_batch_data_message_at] = repo_batch_data_message_value; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> repo_batch_data_message_record.total_number_of_instruments_of_the_contract[repo_batch_data_message_at] = repo_batch_data_message_value; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> repo_batch_data_message_record.business_date[repo_batch_data_message_at] = repo_batch_data_message_value; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 12 -> repo_batch_data_message_record.isin_code[repo_batch_data_message_at] = repo_batch_data_message_value; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> repo_batch_data_message_record.a_designated_number_for_an_issue[repo_batch_data_message_at] = repo_batch_data_message_value; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 3 -> repo_batch_data_message_record.market_operation_product_id[repo_batch_data_message_at] = repo_batch_data_message_value; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 40 -> repo_batch_data_message_record.abbreviated_issue_name[repo_batch_data_message_at] = repo_batch_data_message_value; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 11 -> repo_batch_data_message_record.market_value[repo_batch_data_message_at] = repo_batch_data_message_value; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_record.end_keyword = repo_batch_data_message_value;
  skip
}

/* each byte of Repo Batch Data Message set to where it lies, so a field read out of place says so */
inline ramp_repo_batch_data_message(repo_batch_data_message_record, repo_batch_data_message_base) {
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> repo_batch_data_message_record.message_sequence_number[repo_batch_data_message_at] = (repo_batch_data_message_base + 0 + repo_batch_data_message_at + 1) % 256; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> repo_batch_data_message_record.total_number_of_instruments_of_the_contract[repo_batch_data_message_at] = (repo_batch_data_message_base + 8 + repo_batch_data_message_at + 1) % 256; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> repo_batch_data_message_record.business_date[repo_batch_data_message_at] = (repo_batch_data_message_base + 14 + repo_batch_data_message_at + 1) % 256; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 12 -> repo_batch_data_message_record.isin_code[repo_batch_data_message_at] = (repo_batch_data_message_base + 22 + repo_batch_data_message_at + 1) % 256; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> repo_batch_data_message_record.a_designated_number_for_an_issue[repo_batch_data_message_at] = (repo_batch_data_message_base + 34 + repo_batch_data_message_at + 1) % 256; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 3 -> repo_batch_data_message_record.market_operation_product_id[repo_batch_data_message_at] = (repo_batch_data_message_base + 40 + repo_batch_data_message_at + 1) % 256; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 40 -> repo_batch_data_message_record.abbreviated_issue_name[repo_batch_data_message_at] = (repo_batch_data_message_base + 43 + repo_batch_data_message_at + 1) % 256; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 11 -> repo_batch_data_message_record.market_value[repo_batch_data_message_at] = (repo_batch_data_message_base + 83 + repo_batch_data_message_at + 1) % 256; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_record.end_keyword = (repo_batch_data_message_base + 94 + 1) % 256;
  skip
}

/* Repo Batch Data Message to the wire, 95 bytes from where the cursor stands */
inline encode_repo_batch_data_message(repo_batch_data_message_record) {
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> wire[at] = repo_batch_data_message_record.message_sequence_number[repo_batch_data_message_at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> wire[at] = repo_batch_data_message_record.total_number_of_instruments_of_the_contract[repo_batch_data_message_at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> wire[at] = repo_batch_data_message_record.business_date[repo_batch_data_message_at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 12 -> wire[at] = repo_batch_data_message_record.isin_code[repo_batch_data_message_at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> wire[at] = repo_batch_data_message_record.a_designated_number_for_an_issue[repo_batch_data_message_at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 3 -> wire[at] = repo_batch_data_message_record.market_operation_product_id[repo_batch_data_message_at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 40 -> wire[at] = repo_batch_data_message_record.abbreviated_issue_name[repo_batch_data_message_at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 11 -> wire[at] = repo_batch_data_message_record.market_value[repo_batch_data_message_at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  wire[at] = repo_batch_data_message_record.end_keyword; at = at + 1;
  skip
}

/* Repo Batch Data Message off the wire, 95 bytes from where the cursor stands */
inline decode_repo_batch_data_message(repo_batch_data_message_record) {
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> repo_batch_data_message_record.message_sequence_number[repo_batch_data_message_at] = wire[at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> repo_batch_data_message_record.total_number_of_instruments_of_the_contract[repo_batch_data_message_at] = wire[at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> repo_batch_data_message_record.business_date[repo_batch_data_message_at] = wire[at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 12 -> repo_batch_data_message_record.isin_code[repo_batch_data_message_at] = wire[at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> repo_batch_data_message_record.a_designated_number_for_an_issue[repo_batch_data_message_at] = wire[at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 3 -> repo_batch_data_message_record.market_operation_product_id[repo_batch_data_message_at] = wire[at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 40 -> repo_batch_data_message_record.abbreviated_issue_name[repo_batch_data_message_at] = wire[at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 11 -> repo_batch_data_message_record.market_value[repo_batch_data_message_at] = wire[at]; at = at + 1; repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Repo Batch Data Message is what was written, byte for byte */
inline equal_repo_batch_data_message(repo_batch_data_message_read, repo_batch_data_message_written) {
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> assert(repo_batch_data_message_read.message_sequence_number[repo_batch_data_message_at] == repo_batch_data_message_written.message_sequence_number[repo_batch_data_message_at]); repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> assert(repo_batch_data_message_read.total_number_of_instruments_of_the_contract[repo_batch_data_message_at] == repo_batch_data_message_written.total_number_of_instruments_of_the_contract[repo_batch_data_message_at]); repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 8 -> assert(repo_batch_data_message_read.business_date[repo_batch_data_message_at] == repo_batch_data_message_written.business_date[repo_batch_data_message_at]); repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 12 -> assert(repo_batch_data_message_read.isin_code[repo_batch_data_message_at] == repo_batch_data_message_written.isin_code[repo_batch_data_message_at]); repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 6 -> assert(repo_batch_data_message_read.a_designated_number_for_an_issue[repo_batch_data_message_at] == repo_batch_data_message_written.a_designated_number_for_an_issue[repo_batch_data_message_at]); repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 3 -> assert(repo_batch_data_message_read.market_operation_product_id[repo_batch_data_message_at] == repo_batch_data_message_written.market_operation_product_id[repo_batch_data_message_at]); repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 40 -> assert(repo_batch_data_message_read.abbreviated_issue_name[repo_batch_data_message_at] == repo_batch_data_message_written.abbreviated_issue_name[repo_batch_data_message_at]); repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  repo_batch_data_message_at = 0;
  do
  :: repo_batch_data_message_at < 11 -> assert(repo_batch_data_message_read.market_value[repo_batch_data_message_at] == repo_batch_data_message_written.market_value[repo_batch_data_message_at]); repo_batch_data_message_at = repo_batch_data_message_at + 1
  :: else -> break
  od;
  assert(repo_batch_data_message_read.end_keyword == repo_batch_data_message_written.end_keyword);
  skip
}

/* ---- Issue Event Message: 43 bytes ------------------------------------------- */

/* Issue Event. Per-issue lifecycle event log. */
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

/* ---- Corporate Bonds Reference Message: 240 bytes ---------------------------- */

/* Corporate Bonds related to Securities and Baby Bonds Issue reference data. */
typedef CorporateBondsReferenceMessage {
  byte message_sequence_number[8];
  byte isin_code[12];
  byte abbreviated_issue_name[40];
  byte issue_date[8];
  byte redemption_date[8];
  byte listing_date[8];
  byte coupon_payment_type_code[2];
  byte issuing_amount[22];
  byte listed_amount[22];
  byte coupon_payment_timing_code;
  byte number_of_months_for_grace[4];
  byte number_of_amortization[5];
  byte interest_payment;
  byte coupon_payment_date_type_code;
  byte coupon_rate[14];
  byte substitute_price_of_securities[11];
  byte isin[12];
  byte date_to_start_exercising[8];
  byte date_to_end_exercising[8];
  byte record_date_of_dividend_payout;
  byte exercise_ratio[7];
  byte yield_to_maturity[13];
  byte corporate_bonds_related_to_securities_exercise_price[11];
  byte abbreviated_issue_code[9];
  byte baby_bonds_type_code[3];
  byte end_keyword
};

int corporate_bonds_reference_message_at;

/* every byte of Corporate Bonds Reference Message set to one value */
inline fill_corporate_bonds_reference_message(corporate_bonds_reference_message_record, corporate_bonds_reference_message_value) {
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.message_sequence_number[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> corporate_bonds_reference_message_record.isin_code[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 40 -> corporate_bonds_reference_message_record.abbreviated_issue_name[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.issue_date[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.redemption_date[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.listing_date[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 2 -> corporate_bonds_reference_message_record.coupon_payment_type_code[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> corporate_bonds_reference_message_record.issuing_amount[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> corporate_bonds_reference_message_record.listed_amount[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.coupon_payment_timing_code = corporate_bonds_reference_message_value;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 4 -> corporate_bonds_reference_message_record.number_of_months_for_grace[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 5 -> corporate_bonds_reference_message_record.number_of_amortization[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.interest_payment = corporate_bonds_reference_message_value;
  corporate_bonds_reference_message_record.coupon_payment_date_type_code = corporate_bonds_reference_message_value;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 14 -> corporate_bonds_reference_message_record.coupon_rate[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> corporate_bonds_reference_message_record.substitute_price_of_securities[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> corporate_bonds_reference_message_record.isin[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.date_to_start_exercising[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.date_to_end_exercising[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.record_date_of_dividend_payout = corporate_bonds_reference_message_value;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 7 -> corporate_bonds_reference_message_record.exercise_ratio[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 13 -> corporate_bonds_reference_message_record.yield_to_maturity[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> corporate_bonds_reference_message_record.corporate_bonds_related_to_securities_exercise_price[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 9 -> corporate_bonds_reference_message_record.abbreviated_issue_code[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 3 -> corporate_bonds_reference_message_record.baby_bonds_type_code[corporate_bonds_reference_message_at] = corporate_bonds_reference_message_value; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.end_keyword = corporate_bonds_reference_message_value;
  skip
}

/* each byte of Corporate Bonds Reference Message set to where it lies, so a field read out of place says so */
inline ramp_corporate_bonds_reference_message(corporate_bonds_reference_message_record, corporate_bonds_reference_message_base) {
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.message_sequence_number[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 0 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> corporate_bonds_reference_message_record.isin_code[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 8 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 40 -> corporate_bonds_reference_message_record.abbreviated_issue_name[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 20 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.issue_date[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 60 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.redemption_date[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 68 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.listing_date[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 76 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 2 -> corporate_bonds_reference_message_record.coupon_payment_type_code[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 84 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> corporate_bonds_reference_message_record.issuing_amount[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 86 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> corporate_bonds_reference_message_record.listed_amount[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 108 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.coupon_payment_timing_code = (corporate_bonds_reference_message_base + 130 + 1) % 256;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 4 -> corporate_bonds_reference_message_record.number_of_months_for_grace[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 131 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 5 -> corporate_bonds_reference_message_record.number_of_amortization[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 135 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.interest_payment = (corporate_bonds_reference_message_base + 140 + 1) % 256;
  corporate_bonds_reference_message_record.coupon_payment_date_type_code = (corporate_bonds_reference_message_base + 141 + 1) % 256;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 14 -> corporate_bonds_reference_message_record.coupon_rate[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 142 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> corporate_bonds_reference_message_record.substitute_price_of_securities[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 156 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> corporate_bonds_reference_message_record.isin[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 167 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.date_to_start_exercising[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 179 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.date_to_end_exercising[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 187 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.record_date_of_dividend_payout = (corporate_bonds_reference_message_base + 195 + 1) % 256;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 7 -> corporate_bonds_reference_message_record.exercise_ratio[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 196 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 13 -> corporate_bonds_reference_message_record.yield_to_maturity[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 203 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> corporate_bonds_reference_message_record.corporate_bonds_related_to_securities_exercise_price[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 216 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 9 -> corporate_bonds_reference_message_record.abbreviated_issue_code[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 227 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 3 -> corporate_bonds_reference_message_record.baby_bonds_type_code[corporate_bonds_reference_message_at] = (corporate_bonds_reference_message_base + 236 + corporate_bonds_reference_message_at + 1) % 256; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.end_keyword = (corporate_bonds_reference_message_base + 239 + 1) % 256;
  skip
}

/* Corporate Bonds Reference Message to the wire, 240 bytes from where the cursor stands */
inline encode_corporate_bonds_reference_message(corporate_bonds_reference_message_record) {
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> wire[at] = corporate_bonds_reference_message_record.message_sequence_number[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> wire[at] = corporate_bonds_reference_message_record.isin_code[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 40 -> wire[at] = corporate_bonds_reference_message_record.abbreviated_issue_name[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> wire[at] = corporate_bonds_reference_message_record.issue_date[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> wire[at] = corporate_bonds_reference_message_record.redemption_date[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> wire[at] = corporate_bonds_reference_message_record.listing_date[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 2 -> wire[at] = corporate_bonds_reference_message_record.coupon_payment_type_code[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> wire[at] = corporate_bonds_reference_message_record.issuing_amount[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> wire[at] = corporate_bonds_reference_message_record.listed_amount[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  wire[at] = corporate_bonds_reference_message_record.coupon_payment_timing_code; at = at + 1;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 4 -> wire[at] = corporate_bonds_reference_message_record.number_of_months_for_grace[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 5 -> wire[at] = corporate_bonds_reference_message_record.number_of_amortization[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  wire[at] = corporate_bonds_reference_message_record.interest_payment; at = at + 1;
  wire[at] = corporate_bonds_reference_message_record.coupon_payment_date_type_code; at = at + 1;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 14 -> wire[at] = corporate_bonds_reference_message_record.coupon_rate[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> wire[at] = corporate_bonds_reference_message_record.substitute_price_of_securities[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> wire[at] = corporate_bonds_reference_message_record.isin[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> wire[at] = corporate_bonds_reference_message_record.date_to_start_exercising[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> wire[at] = corporate_bonds_reference_message_record.date_to_end_exercising[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  wire[at] = corporate_bonds_reference_message_record.record_date_of_dividend_payout; at = at + 1;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 7 -> wire[at] = corporate_bonds_reference_message_record.exercise_ratio[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 13 -> wire[at] = corporate_bonds_reference_message_record.yield_to_maturity[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> wire[at] = corporate_bonds_reference_message_record.corporate_bonds_related_to_securities_exercise_price[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 9 -> wire[at] = corporate_bonds_reference_message_record.abbreviated_issue_code[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 3 -> wire[at] = corporate_bonds_reference_message_record.baby_bonds_type_code[corporate_bonds_reference_message_at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  wire[at] = corporate_bonds_reference_message_record.end_keyword; at = at + 1;
  skip
}

/* Corporate Bonds Reference Message off the wire, 240 bytes from where the cursor stands */
inline decode_corporate_bonds_reference_message(corporate_bonds_reference_message_record) {
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.message_sequence_number[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> corporate_bonds_reference_message_record.isin_code[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 40 -> corporate_bonds_reference_message_record.abbreviated_issue_name[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.issue_date[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.redemption_date[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.listing_date[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 2 -> corporate_bonds_reference_message_record.coupon_payment_type_code[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> corporate_bonds_reference_message_record.issuing_amount[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> corporate_bonds_reference_message_record.listed_amount[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.coupon_payment_timing_code = wire[at]; at = at + 1;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 4 -> corporate_bonds_reference_message_record.number_of_months_for_grace[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 5 -> corporate_bonds_reference_message_record.number_of_amortization[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.interest_payment = wire[at]; at = at + 1;
  corporate_bonds_reference_message_record.coupon_payment_date_type_code = wire[at]; at = at + 1;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 14 -> corporate_bonds_reference_message_record.coupon_rate[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> corporate_bonds_reference_message_record.substitute_price_of_securities[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> corporate_bonds_reference_message_record.isin[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.date_to_start_exercising[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> corporate_bonds_reference_message_record.date_to_end_exercising[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.record_date_of_dividend_payout = wire[at]; at = at + 1;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 7 -> corporate_bonds_reference_message_record.exercise_ratio[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 13 -> corporate_bonds_reference_message_record.yield_to_maturity[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> corporate_bonds_reference_message_record.corporate_bonds_related_to_securities_exercise_price[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 9 -> corporate_bonds_reference_message_record.abbreviated_issue_code[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 3 -> corporate_bonds_reference_message_record.baby_bonds_type_code[corporate_bonds_reference_message_at] = wire[at]; at = at + 1; corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Corporate Bonds Reference Message is what was written, byte for byte */
inline equal_corporate_bonds_reference_message(corporate_bonds_reference_message_read, corporate_bonds_reference_message_written) {
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> assert(corporate_bonds_reference_message_read.message_sequence_number[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.message_sequence_number[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> assert(corporate_bonds_reference_message_read.isin_code[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.isin_code[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 40 -> assert(corporate_bonds_reference_message_read.abbreviated_issue_name[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.abbreviated_issue_name[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> assert(corporate_bonds_reference_message_read.issue_date[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.issue_date[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> assert(corporate_bonds_reference_message_read.redemption_date[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.redemption_date[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> assert(corporate_bonds_reference_message_read.listing_date[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.listing_date[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 2 -> assert(corporate_bonds_reference_message_read.coupon_payment_type_code[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.coupon_payment_type_code[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> assert(corporate_bonds_reference_message_read.issuing_amount[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.issuing_amount[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 22 -> assert(corporate_bonds_reference_message_read.listed_amount[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.listed_amount[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  assert(corporate_bonds_reference_message_read.coupon_payment_timing_code == corporate_bonds_reference_message_written.coupon_payment_timing_code);
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 4 -> assert(corporate_bonds_reference_message_read.number_of_months_for_grace[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.number_of_months_for_grace[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 5 -> assert(corporate_bonds_reference_message_read.number_of_amortization[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.number_of_amortization[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  assert(corporate_bonds_reference_message_read.interest_payment == corporate_bonds_reference_message_written.interest_payment);
  assert(corporate_bonds_reference_message_read.coupon_payment_date_type_code == corporate_bonds_reference_message_written.coupon_payment_date_type_code);
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 14 -> assert(corporate_bonds_reference_message_read.coupon_rate[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.coupon_rate[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> assert(corporate_bonds_reference_message_read.substitute_price_of_securities[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.substitute_price_of_securities[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 12 -> assert(corporate_bonds_reference_message_read.isin[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.isin[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> assert(corporate_bonds_reference_message_read.date_to_start_exercising[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.date_to_start_exercising[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 8 -> assert(corporate_bonds_reference_message_read.date_to_end_exercising[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.date_to_end_exercising[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  assert(corporate_bonds_reference_message_read.record_date_of_dividend_payout == corporate_bonds_reference_message_written.record_date_of_dividend_payout);
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 7 -> assert(corporate_bonds_reference_message_read.exercise_ratio[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.exercise_ratio[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 13 -> assert(corporate_bonds_reference_message_read.yield_to_maturity[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.yield_to_maturity[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 11 -> assert(corporate_bonds_reference_message_read.corporate_bonds_related_to_securities_exercise_price[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.corporate_bonds_related_to_securities_exercise_price[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 9 -> assert(corporate_bonds_reference_message_read.abbreviated_issue_code[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.abbreviated_issue_code[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  corporate_bonds_reference_message_at = 0;
  do
  :: corporate_bonds_reference_message_at < 3 -> assert(corporate_bonds_reference_message_read.baby_bonds_type_code[corporate_bonds_reference_message_at] == corporate_bonds_reference_message_written.baby_bonds_type_code[corporate_bonds_reference_message_at]); corporate_bonds_reference_message_at = corporate_bonds_reference_message_at + 1
  :: else -> break
  od;
  assert(corporate_bonds_reference_message_read.end_keyword == corporate_bonds_reference_message_written.end_keyword);
  skip
}

/* ---- Regular Bonds Installment Repayment Date Message: 29 bytes -------------- */

/* Regular Bonds installment repayment date. */
typedef RegularBondsInstallmentRepaymentDateMessage {
  byte message_sequence_number[8];
  byte isin_code[12];
  byte installment_repayment_date[8];
  byte end_keyword
};

int regular_bonds_installment_repayment_date_message_at;

/* every byte of Regular Bonds Installment Repayment Date Message set to one value */
inline fill_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_record, regular_bonds_installment_repayment_date_message_value) {
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> regular_bonds_installment_repayment_date_message_record.message_sequence_number[regular_bonds_installment_repayment_date_message_at] = regular_bonds_installment_repayment_date_message_value; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 12 -> regular_bonds_installment_repayment_date_message_record.isin_code[regular_bonds_installment_repayment_date_message_at] = regular_bonds_installment_repayment_date_message_value; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> regular_bonds_installment_repayment_date_message_record.installment_repayment_date[regular_bonds_installment_repayment_date_message_at] = regular_bonds_installment_repayment_date_message_value; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_record.end_keyword = regular_bonds_installment_repayment_date_message_value;
  skip
}

/* each byte of Regular Bonds Installment Repayment Date Message set to where it lies, so a field read out of place says so */
inline ramp_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_record, regular_bonds_installment_repayment_date_message_base) {
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> regular_bonds_installment_repayment_date_message_record.message_sequence_number[regular_bonds_installment_repayment_date_message_at] = (regular_bonds_installment_repayment_date_message_base + 0 + regular_bonds_installment_repayment_date_message_at + 1) % 256; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 12 -> regular_bonds_installment_repayment_date_message_record.isin_code[regular_bonds_installment_repayment_date_message_at] = (regular_bonds_installment_repayment_date_message_base + 8 + regular_bonds_installment_repayment_date_message_at + 1) % 256; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> regular_bonds_installment_repayment_date_message_record.installment_repayment_date[regular_bonds_installment_repayment_date_message_at] = (regular_bonds_installment_repayment_date_message_base + 20 + regular_bonds_installment_repayment_date_message_at + 1) % 256; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_record.end_keyword = (regular_bonds_installment_repayment_date_message_base + 28 + 1) % 256;
  skip
}

/* Regular Bonds Installment Repayment Date Message to the wire, 29 bytes from where the cursor stands */
inline encode_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_record) {
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> wire[at] = regular_bonds_installment_repayment_date_message_record.message_sequence_number[regular_bonds_installment_repayment_date_message_at]; at = at + 1; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 12 -> wire[at] = regular_bonds_installment_repayment_date_message_record.isin_code[regular_bonds_installment_repayment_date_message_at]; at = at + 1; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> wire[at] = regular_bonds_installment_repayment_date_message_record.installment_repayment_date[regular_bonds_installment_repayment_date_message_at]; at = at + 1; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  wire[at] = regular_bonds_installment_repayment_date_message_record.end_keyword; at = at + 1;
  skip
}

/* Regular Bonds Installment Repayment Date Message off the wire, 29 bytes from where the cursor stands */
inline decode_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_record) {
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> regular_bonds_installment_repayment_date_message_record.message_sequence_number[regular_bonds_installment_repayment_date_message_at] = wire[at]; at = at + 1; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 12 -> regular_bonds_installment_repayment_date_message_record.isin_code[regular_bonds_installment_repayment_date_message_at] = wire[at]; at = at + 1; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> regular_bonds_installment_repayment_date_message_record.installment_repayment_date[regular_bonds_installment_repayment_date_message_at] = wire[at]; at = at + 1; regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Regular Bonds Installment Repayment Date Message is what was written, byte for byte */
inline equal_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_read, regular_bonds_installment_repayment_date_message_written) {
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> assert(regular_bonds_installment_repayment_date_message_read.message_sequence_number[regular_bonds_installment_repayment_date_message_at] == regular_bonds_installment_repayment_date_message_written.message_sequence_number[regular_bonds_installment_repayment_date_message_at]); regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 12 -> assert(regular_bonds_installment_repayment_date_message_read.isin_code[regular_bonds_installment_repayment_date_message_at] == regular_bonds_installment_repayment_date_message_written.isin_code[regular_bonds_installment_repayment_date_message_at]); regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  regular_bonds_installment_repayment_date_message_at = 0;
  do
  :: regular_bonds_installment_repayment_date_message_at < 8 -> assert(regular_bonds_installment_repayment_date_message_read.installment_repayment_date[regular_bonds_installment_repayment_date_message_at] == regular_bonds_installment_repayment_date_message_written.installment_repayment_date[regular_bonds_installment_repayment_date_message_at]); regular_bonds_installment_repayment_date_message_at = regular_bonds_installment_repayment_date_message_at + 1
  :: else -> break
  od;
  assert(regular_bonds_installment_repayment_date_message_read.end_keyword == regular_bonds_installment_repayment_date_message_written.end_keyword);
  skip
}

/* ---- Repo Classification Data Message: 39 bytes ------------------------------ */

/* REPO Classification Data. */
typedef RepoClassificationDataMessage {
  byte message_sequence_number[8];
  byte business_date[8];
  byte repo_classification_code[2];
  byte repo_classification_name[20];
  byte end_keyword
};

int repo_classification_data_message_at;

/* every byte of Repo Classification Data Message set to one value */
inline fill_repo_classification_data_message(repo_classification_data_message_record, repo_classification_data_message_value) {
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> repo_classification_data_message_record.message_sequence_number[repo_classification_data_message_at] = repo_classification_data_message_value; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> repo_classification_data_message_record.business_date[repo_classification_data_message_at] = repo_classification_data_message_value; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 2 -> repo_classification_data_message_record.repo_classification_code[repo_classification_data_message_at] = repo_classification_data_message_value; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 20 -> repo_classification_data_message_record.repo_classification_name[repo_classification_data_message_at] = repo_classification_data_message_value; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_record.end_keyword = repo_classification_data_message_value;
  skip
}

/* each byte of Repo Classification Data Message set to where it lies, so a field read out of place says so */
inline ramp_repo_classification_data_message(repo_classification_data_message_record, repo_classification_data_message_base) {
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> repo_classification_data_message_record.message_sequence_number[repo_classification_data_message_at] = (repo_classification_data_message_base + 0 + repo_classification_data_message_at + 1) % 256; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> repo_classification_data_message_record.business_date[repo_classification_data_message_at] = (repo_classification_data_message_base + 8 + repo_classification_data_message_at + 1) % 256; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 2 -> repo_classification_data_message_record.repo_classification_code[repo_classification_data_message_at] = (repo_classification_data_message_base + 16 + repo_classification_data_message_at + 1) % 256; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 20 -> repo_classification_data_message_record.repo_classification_name[repo_classification_data_message_at] = (repo_classification_data_message_base + 18 + repo_classification_data_message_at + 1) % 256; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_record.end_keyword = (repo_classification_data_message_base + 38 + 1) % 256;
  skip
}

/* Repo Classification Data Message to the wire, 39 bytes from where the cursor stands */
inline encode_repo_classification_data_message(repo_classification_data_message_record) {
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> wire[at] = repo_classification_data_message_record.message_sequence_number[repo_classification_data_message_at]; at = at + 1; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> wire[at] = repo_classification_data_message_record.business_date[repo_classification_data_message_at]; at = at + 1; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 2 -> wire[at] = repo_classification_data_message_record.repo_classification_code[repo_classification_data_message_at]; at = at + 1; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 20 -> wire[at] = repo_classification_data_message_record.repo_classification_name[repo_classification_data_message_at]; at = at + 1; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  wire[at] = repo_classification_data_message_record.end_keyword; at = at + 1;
  skip
}

/* Repo Classification Data Message off the wire, 39 bytes from where the cursor stands */
inline decode_repo_classification_data_message(repo_classification_data_message_record) {
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> repo_classification_data_message_record.message_sequence_number[repo_classification_data_message_at] = wire[at]; at = at + 1; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> repo_classification_data_message_record.business_date[repo_classification_data_message_at] = wire[at]; at = at + 1; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 2 -> repo_classification_data_message_record.repo_classification_code[repo_classification_data_message_at] = wire[at]; at = at + 1; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 20 -> repo_classification_data_message_record.repo_classification_name[repo_classification_data_message_at] = wire[at]; at = at + 1; repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Repo Classification Data Message is what was written, byte for byte */
inline equal_repo_classification_data_message(repo_classification_data_message_read, repo_classification_data_message_written) {
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> assert(repo_classification_data_message_read.message_sequence_number[repo_classification_data_message_at] == repo_classification_data_message_written.message_sequence_number[repo_classification_data_message_at]); repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 8 -> assert(repo_classification_data_message_read.business_date[repo_classification_data_message_at] == repo_classification_data_message_written.business_date[repo_classification_data_message_at]); repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 2 -> assert(repo_classification_data_message_read.repo_classification_code[repo_classification_data_message_at] == repo_classification_data_message_written.repo_classification_code[repo_classification_data_message_at]); repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  repo_classification_data_message_at = 0;
  do
  :: repo_classification_data_message_at < 20 -> assert(repo_classification_data_message_read.repo_classification_name[repo_classification_data_message_at] == repo_classification_data_message_written.repo_classification_name[repo_classification_data_message_at]); repo_classification_data_message_at = repo_classification_data_message_at + 1
  :: else -> break
  od;
  assert(repo_classification_data_message_read.end_keyword == repo_classification_data_message_written.end_keyword);
  skip
}

/* ---- Repo Trade Availability Per Term Message: 54 bytes ---------------------- */

/* REPO Trade Availability per Term. */
typedef RepoTradeAvailabilityPerTermMessage {
  byte message_sequence_number[8];
  byte isin_code[12];
  byte number_of_repo_trade_periods[3];
  byte repo_trade_period_1[3];
  byte repo_trade_period_2[3];
  byte repo_trade_period_3[3];
  byte repo_trade_period_4[3];
  byte repo_trade_period_5[3];
  byte repo_trade_period_6[3];
  byte repo_trade_period_7[3];
  byte repo_trade_period_8[3];
  byte repo_trade_period_9[3];
  byte repo_trade_period_10[3];
  byte end_keyword
};

int repo_trade_availability_per_term_message_at;

/* every byte of Repo Trade Availability Per Term Message set to one value */
inline fill_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_record, repo_trade_availability_per_term_message_value) {
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 8 -> repo_trade_availability_per_term_message_record.message_sequence_number[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 12 -> repo_trade_availability_per_term_message_record.isin_code[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.number_of_repo_trade_periods[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_1[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_2[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_3[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_4[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_5[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_6[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_7[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_8[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_9[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_10[repo_trade_availability_per_term_message_at] = repo_trade_availability_per_term_message_value; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_record.end_keyword = repo_trade_availability_per_term_message_value;
  skip
}

/* each byte of Repo Trade Availability Per Term Message set to where it lies, so a field read out of place says so */
inline ramp_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_record, repo_trade_availability_per_term_message_base) {
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 8 -> repo_trade_availability_per_term_message_record.message_sequence_number[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 0 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 12 -> repo_trade_availability_per_term_message_record.isin_code[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 8 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.number_of_repo_trade_periods[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 20 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_1[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 23 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_2[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 26 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_3[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 29 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_4[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 32 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_5[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 35 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_6[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 38 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_7[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 41 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_8[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 44 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_9[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 47 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_10[repo_trade_availability_per_term_message_at] = (repo_trade_availability_per_term_message_base + 50 + repo_trade_availability_per_term_message_at + 1) % 256; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_record.end_keyword = (repo_trade_availability_per_term_message_base + 53 + 1) % 256;
  skip
}

/* Repo Trade Availability Per Term Message to the wire, 54 bytes from where the cursor stands */
inline encode_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_record) {
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 8 -> wire[at] = repo_trade_availability_per_term_message_record.message_sequence_number[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 12 -> wire[at] = repo_trade_availability_per_term_message_record.isin_code[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.number_of_repo_trade_periods[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_1[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_2[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_3[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_4[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_5[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_6[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_7[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_8[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_9[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> wire[at] = repo_trade_availability_per_term_message_record.repo_trade_period_10[repo_trade_availability_per_term_message_at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  wire[at] = repo_trade_availability_per_term_message_record.end_keyword; at = at + 1;
  skip
}

/* Repo Trade Availability Per Term Message off the wire, 54 bytes from where the cursor stands */
inline decode_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_record) {
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 8 -> repo_trade_availability_per_term_message_record.message_sequence_number[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 12 -> repo_trade_availability_per_term_message_record.isin_code[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.number_of_repo_trade_periods[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_1[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_2[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_3[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_4[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_5[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_6[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_7[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_8[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_9[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> repo_trade_availability_per_term_message_record.repo_trade_period_10[repo_trade_availability_per_term_message_at] = wire[at]; at = at + 1; repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Repo Trade Availability Per Term Message is what was written, byte for byte */
inline equal_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_read, repo_trade_availability_per_term_message_written) {
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 8 -> assert(repo_trade_availability_per_term_message_read.message_sequence_number[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.message_sequence_number[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 12 -> assert(repo_trade_availability_per_term_message_read.isin_code[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.isin_code[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.number_of_repo_trade_periods[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.number_of_repo_trade_periods[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_1[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_1[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_2[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_2[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_3[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_3[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_4[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_4[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_5[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_5[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_6[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_6[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_7[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_7[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_8[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_8[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_9[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_9[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  repo_trade_availability_per_term_message_at = 0;
  do
  :: repo_trade_availability_per_term_message_at < 3 -> assert(repo_trade_availability_per_term_message_read.repo_trade_period_10[repo_trade_availability_per_term_message_at] == repo_trade_availability_per_term_message_written.repo_trade_period_10[repo_trade_availability_per_term_message_at]); repo_trade_availability_per_term_message_at = repo_trade_availability_per_term_message_at + 1
  :: else -> break
  od;
  assert(repo_trade_availability_per_term_message_read.end_keyword == repo_trade_availability_per_term_message_written.end_keyword);
  skip
}

/* ---- Retail Bonds Type Code Message: 52 bytes -------------------------------- */

/* Retail Bonds Type Code reference (IFMSBTD0018) — Bonds A BND variant. */
typedef RetailBondsTypeCodeMessage {
  byte message_sequence_number[8];
  byte retail_bond_type_code[2];
  byte retail_bond_category_name[20];
  byte retail_bond_category_name_in_en[20];
  byte retail_bond_generated_quotes;
  byte end_keyword
};

int retail_bonds_type_code_message_at;

/* every byte of Retail Bonds Type Code Message set to one value */
inline fill_retail_bonds_type_code_message(retail_bonds_type_code_message_record, retail_bonds_type_code_message_value) {
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 8 -> retail_bonds_type_code_message_record.message_sequence_number[retail_bonds_type_code_message_at] = retail_bonds_type_code_message_value; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 2 -> retail_bonds_type_code_message_record.retail_bond_type_code[retail_bonds_type_code_message_at] = retail_bonds_type_code_message_value; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> retail_bonds_type_code_message_record.retail_bond_category_name[retail_bonds_type_code_message_at] = retail_bonds_type_code_message_value; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> retail_bonds_type_code_message_record.retail_bond_category_name_in_en[retail_bonds_type_code_message_at] = retail_bonds_type_code_message_value; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_record.retail_bond_generated_quotes = retail_bonds_type_code_message_value;
  retail_bonds_type_code_message_record.end_keyword = retail_bonds_type_code_message_value;
  skip
}

/* each byte of Retail Bonds Type Code Message set to where it lies, so a field read out of place says so */
inline ramp_retail_bonds_type_code_message(retail_bonds_type_code_message_record, retail_bonds_type_code_message_base) {
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 8 -> retail_bonds_type_code_message_record.message_sequence_number[retail_bonds_type_code_message_at] = (retail_bonds_type_code_message_base + 0 + retail_bonds_type_code_message_at + 1) % 256; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 2 -> retail_bonds_type_code_message_record.retail_bond_type_code[retail_bonds_type_code_message_at] = (retail_bonds_type_code_message_base + 8 + retail_bonds_type_code_message_at + 1) % 256; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> retail_bonds_type_code_message_record.retail_bond_category_name[retail_bonds_type_code_message_at] = (retail_bonds_type_code_message_base + 10 + retail_bonds_type_code_message_at + 1) % 256; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> retail_bonds_type_code_message_record.retail_bond_category_name_in_en[retail_bonds_type_code_message_at] = (retail_bonds_type_code_message_base + 30 + retail_bonds_type_code_message_at + 1) % 256; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_record.retail_bond_generated_quotes = (retail_bonds_type_code_message_base + 50 + 1) % 256;
  retail_bonds_type_code_message_record.end_keyword = (retail_bonds_type_code_message_base + 51 + 1) % 256;
  skip
}

/* Retail Bonds Type Code Message to the wire, 52 bytes from where the cursor stands */
inline encode_retail_bonds_type_code_message(retail_bonds_type_code_message_record) {
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 8 -> wire[at] = retail_bonds_type_code_message_record.message_sequence_number[retail_bonds_type_code_message_at]; at = at + 1; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 2 -> wire[at] = retail_bonds_type_code_message_record.retail_bond_type_code[retail_bonds_type_code_message_at]; at = at + 1; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> wire[at] = retail_bonds_type_code_message_record.retail_bond_category_name[retail_bonds_type_code_message_at]; at = at + 1; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> wire[at] = retail_bonds_type_code_message_record.retail_bond_category_name_in_en[retail_bonds_type_code_message_at]; at = at + 1; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  wire[at] = retail_bonds_type_code_message_record.retail_bond_generated_quotes; at = at + 1;
  wire[at] = retail_bonds_type_code_message_record.end_keyword; at = at + 1;
  skip
}

/* Retail Bonds Type Code Message off the wire, 52 bytes from where the cursor stands */
inline decode_retail_bonds_type_code_message(retail_bonds_type_code_message_record) {
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 8 -> retail_bonds_type_code_message_record.message_sequence_number[retail_bonds_type_code_message_at] = wire[at]; at = at + 1; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 2 -> retail_bonds_type_code_message_record.retail_bond_type_code[retail_bonds_type_code_message_at] = wire[at]; at = at + 1; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> retail_bonds_type_code_message_record.retail_bond_category_name[retail_bonds_type_code_message_at] = wire[at]; at = at + 1; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> retail_bonds_type_code_message_record.retail_bond_category_name_in_en[retail_bonds_type_code_message_at] = wire[at]; at = at + 1; retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_record.retail_bond_generated_quotes = wire[at]; at = at + 1;
  retail_bonds_type_code_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Retail Bonds Type Code Message is what was written, byte for byte */
inline equal_retail_bonds_type_code_message(retail_bonds_type_code_message_read, retail_bonds_type_code_message_written) {
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 8 -> assert(retail_bonds_type_code_message_read.message_sequence_number[retail_bonds_type_code_message_at] == retail_bonds_type_code_message_written.message_sequence_number[retail_bonds_type_code_message_at]); retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 2 -> assert(retail_bonds_type_code_message_read.retail_bond_type_code[retail_bonds_type_code_message_at] == retail_bonds_type_code_message_written.retail_bond_type_code[retail_bonds_type_code_message_at]); retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> assert(retail_bonds_type_code_message_read.retail_bond_category_name[retail_bonds_type_code_message_at] == retail_bonds_type_code_message_written.retail_bond_category_name[retail_bonds_type_code_message_at]); retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  retail_bonds_type_code_message_at = 0;
  do
  :: retail_bonds_type_code_message_at < 20 -> assert(retail_bonds_type_code_message_read.retail_bond_category_name_in_en[retail_bonds_type_code_message_at] == retail_bonds_type_code_message_written.retail_bond_category_name_in_en[retail_bonds_type_code_message_at]); retail_bonds_type_code_message_at = retail_bonds_type_code_message_at + 1
  :: else -> break
  od;
  assert(retail_bonds_type_code_message_read.retail_bond_generated_quotes == retail_bonds_type_code_message_written.retail_bond_generated_quotes);
  assert(retail_bonds_type_code_message_read.end_keyword == retail_bonds_type_code_message_written.end_keyword);
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

/* Krx Index Message: encoded, read back, and compared */
proctype check_krx_index_message() {
  KrxIndexMessage krx_index_message_sent;
  KrxIndexMessage krx_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_krx_index_message(krx_index_message_sent, 0)
  :: pattern == 1 -> fill_krx_index_message(krx_index_message_sent, 32)
  :: pattern == 2 -> fill_krx_index_message(krx_index_message_sent, 255)
  :: else -> ramp_krx_index_message(krx_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_krx_index_message(krx_index_message_sent);
    assert(at == 82);
    at = 0;
    decode_krx_index_message(krx_index_message_got);
    assert(at == 82);
    equal_krx_index_message(krx_index_message_got, krx_index_message_sent)
  }
}

/* Krx Estimated Index Message: encoded, read back, and compared */
proctype check_krx_estimated_index_message() {
  KrxEstimatedIndexMessage krx_estimated_index_message_sent;
  KrxEstimatedIndexMessage krx_estimated_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_krx_estimated_index_message(krx_estimated_index_message_sent, 0)
  :: pattern == 1 -> fill_krx_estimated_index_message(krx_estimated_index_message_sent, 32)
  :: pattern == 2 -> fill_krx_estimated_index_message(krx_estimated_index_message_sent, 255)
  :: else -> ramp_krx_estimated_index_message(krx_estimated_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_krx_estimated_index_message(krx_estimated_index_message_sent);
    assert(at == 82);
    at = 0;
    decode_krx_estimated_index_message(krx_estimated_index_message_got);
    assert(at == 82);
    equal_krx_estimated_index_message(krx_estimated_index_message_got, krx_estimated_index_message_sent)
  }
}

/* Global Index Message: encoded, read back, and compared */
proctype check_global_index_message() {
  GlobalIndexMessage global_index_message_sent;
  GlobalIndexMessage global_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_global_index_message(global_index_message_sent, 0)
  :: pattern == 1 -> fill_global_index_message(global_index_message_sent, 32)
  :: pattern == 2 -> fill_global_index_message(global_index_message_sent, 255)
  :: else -> ramp_global_index_message(global_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_global_index_message(global_index_message_sent);
    assert(at == 59);
    at = 0;
    decode_global_index_message(global_index_message_got);
    assert(at == 59);
    equal_global_index_message(global_index_message_got, global_index_message_sent)
  }
}

/* Bond Prime Index Message: encoded, read back, and compared */
proctype check_bond_prime_index_message() {
  BondPrimeIndexMessage bond_prime_index_message_sent;
  BondPrimeIndexMessage bond_prime_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bond_prime_index_message(bond_prime_index_message_sent, 0)
  :: pattern == 1 -> fill_bond_prime_index_message(bond_prime_index_message_sent, 32)
  :: pattern == 2 -> fill_bond_prime_index_message(bond_prime_index_message_sent, 255)
  :: else -> ramp_bond_prime_index_message(bond_prime_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bond_prime_index_message(bond_prime_index_message_sent);
    assert(at == 177);
    at = 0;
    decode_bond_prime_index_message(bond_prime_index_message_got);
    assert(at == 177);
    equal_bond_prime_index_message(bond_prime_index_message_got, bond_prime_index_message_sent)
  }
}

/* Bond Ktb Index Message: encoded, read back, and compared */
proctype check_bond_ktb_index_message() {
  BondKtbIndexMessage bond_ktb_index_message_sent;
  BondKtbIndexMessage bond_ktb_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bond_ktb_index_message(bond_ktb_index_message_sent, 0)
  :: pattern == 1 -> fill_bond_ktb_index_message(bond_ktb_index_message_sent, 32)
  :: pattern == 2 -> fill_bond_ktb_index_message(bond_ktb_index_message_sent, 255)
  :: else -> ramp_bond_ktb_index_message(bond_ktb_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bond_ktb_index_message(bond_ktb_index_message_sent);
    assert(at == 114);
    at = 0;
    decode_bond_ktb_index_message(bond_ktb_index_message_got);
    assert(at == 114);
    equal_bond_ktb_index_message(bond_ktb_index_message_got, bond_ktb_index_message_sent)
  }
}

/* Bond Ktb Index Term Structure Message: encoded, read back, and compared */
proctype check_bond_ktb_index_term_structure_message() {
  BondKtbIndexTermStructureMessage bond_ktb_index_term_structure_message_sent;
  BondKtbIndexTermStructureMessage bond_ktb_index_term_structure_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_sent, 0)
  :: pattern == 1 -> fill_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_sent, 32)
  :: pattern == 2 -> fill_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_sent, 255)
  :: else -> ramp_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_sent);
    assert(at == 61);
    at = 0;
    decode_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_got);
    assert(at == 61);
    equal_bond_ktb_index_term_structure_message(bond_ktb_index_term_structure_message_got, bond_ktb_index_term_structure_message_sent)
  }
}

/* Bond Index Krx Message: encoded, read back, and compared */
proctype check_bond_index_krx_message() {
  BondIndexKrxMessage bond_index_krx_message_sent;
  BondIndexKrxMessage bond_index_krx_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bond_index_krx_message(bond_index_krx_message_sent, 0)
  :: pattern == 1 -> fill_bond_index_krx_message(bond_index_krx_message_sent, 32)
  :: pattern == 2 -> fill_bond_index_krx_message(bond_index_krx_message_sent, 255)
  :: else -> ramp_bond_index_krx_message(bond_index_krx_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bond_index_krx_message(bond_index_krx_message_sent);
    assert(at == 518);
    at = 0;
    decode_bond_index_krx_message(bond_index_krx_message_got);
    assert(at == 518);
    equal_bond_index_krx_message(bond_index_krx_message_got, bond_index_krx_message_sent)
  }
}

/* Equity Derivatives Underlying Snapshot Kospi Message: encoded, read back, and compared */
proctype check_equity_derivatives_underlying_snapshot_kospi_message() {
  EquityDerivativesUnderlyingSnapshotKospiMessage equity_derivatives_underlying_snapshot_kospi_message_sent;
  EquityDerivativesUnderlyingSnapshotKospiMessage equity_derivatives_underlying_snapshot_kospi_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_sent, 0)
  :: pattern == 1 -> fill_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_sent, 32)
  :: pattern == 2 -> fill_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_sent, 255)
  :: else -> ramp_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_sent);
    assert(at == 131);
    at = 0;
    decode_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_got);
    assert(at == 131);
    equal_equity_derivatives_underlying_snapshot_kospi_message(equity_derivatives_underlying_snapshot_kospi_message_got, equity_derivatives_underlying_snapshot_kospi_message_sent)
  }
}

/* Equity Derivatives Underlying Snapshot Kosdaq Message: encoded, read back, and compared */
proctype check_equity_derivatives_underlying_snapshot_kosdaq_message() {
  EquityDerivativesUnderlyingSnapshotKosdaqMessage equity_derivatives_underlying_snapshot_kosdaq_message_sent;
  EquityDerivativesUnderlyingSnapshotKosdaqMessage equity_derivatives_underlying_snapshot_kosdaq_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_sent, 0)
  :: pattern == 1 -> fill_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_sent, 32)
  :: pattern == 2 -> fill_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_sent, 255)
  :: else -> ramp_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_sent);
    assert(at == 131);
    at = 0;
    decode_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_got);
    assert(at == 131);
    equal_equity_derivatives_underlying_snapshot_kosdaq_message(equity_derivatives_underlying_snapshot_kosdaq_message_got, equity_derivatives_underlying_snapshot_kosdaq_message_sent)
  }
}

/* Equity Derivatives Underlying Snapshot Kospi Mm Lp Included Message: encoded, read back, and compared */
proctype check_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message() {
  EquityDerivativesUnderlyingSnapshotKospiMmLpIncludedMessage equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_sent;
  EquityDerivativesUnderlyingSnapshotKospiMmLpIncludedMessage equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_sent, 0)
  :: pattern == 1 -> fill_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_sent, 32)
  :: pattern == 2 -> fill_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_sent, 255)
  :: else -> ramp_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_sent);
    assert(at == 131);
    at = 0;
    decode_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_got);
    assert(at == 131);
    equal_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message(equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_got, equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message_sent)
  }
}

/* Securities Equities Batch Data Message: encoded, read back, and compared */
proctype check_securities_equities_batch_data_message() {
  SecuritiesEquitiesBatchDataMessage securities_equities_batch_data_message_sent;
  SecuritiesEquitiesBatchDataMessage securities_equities_batch_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_equities_batch_data_message(securities_equities_batch_data_message_sent, 0)
  :: pattern == 1 -> fill_securities_equities_batch_data_message(securities_equities_batch_data_message_sent, 32)
  :: pattern == 2 -> fill_securities_equities_batch_data_message(securities_equities_batch_data_message_sent, 255)
  :: else -> ramp_securities_equities_batch_data_message(securities_equities_batch_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_equities_batch_data_message(securities_equities_batch_data_message_sent);
    assert(at == 627);
    at = 0;
    decode_securities_equities_batch_data_message(securities_equities_batch_data_message_got);
    assert(at == 627);
    equal_securities_equities_batch_data_message(securities_equities_batch_data_message_got, securities_equities_batch_data_message_sent)
  }
}

/* Securities Closing Date Message: encoded, read back, and compared */
proctype check_securities_closing_date_message() {
  SecuritiesClosingDateMessage securities_closing_date_message_sent;
  SecuritiesClosingDateMessage securities_closing_date_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_closing_date_message(securities_closing_date_message_sent, 0)
  :: pattern == 1 -> fill_securities_closing_date_message(securities_closing_date_message_sent, 32)
  :: pattern == 2 -> fill_securities_closing_date_message(securities_closing_date_message_sent, 255)
  :: else -> ramp_securities_closing_date_message(securities_closing_date_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_closing_date_message(securities_closing_date_message_sent);
    assert(at == 25);
    at = 0;
    decode_securities_closing_date_message(securities_closing_date_message_got);
    assert(at == 25);
    equal_securities_closing_date_message(securities_closing_date_message_got, securities_closing_date_message_sent)
  }
}

/* Securities Mm Lp Information Message: encoded, read back, and compared */
proctype check_securities_mm_lp_information_message() {
  SecuritiesMmLpInformationMessage securities_mm_lp_information_message_sent;
  SecuritiesMmLpInformationMessage securities_mm_lp_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_mm_lp_information_message(securities_mm_lp_information_message_sent, 0)
  :: pattern == 1 -> fill_securities_mm_lp_information_message(securities_mm_lp_information_message_sent, 32)
  :: pattern == 2 -> fill_securities_mm_lp_information_message(securities_mm_lp_information_message_sent, 255)
  :: else -> ramp_securities_mm_lp_information_message(securities_mm_lp_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_mm_lp_information_message(securities_mm_lp_information_message_sent);
    assert(at == 192);
    at = 0;
    decode_securities_mm_lp_information_message(securities_mm_lp_information_message_got);
    assert(at == 192);
    equal_securities_mm_lp_information_message(securities_mm_lp_information_message_got, securities_mm_lp_information_message_sent)
  }
}

/* Securities Member Information Message: encoded, read back, and compared */
proctype check_securities_member_information_message() {
  SecuritiesMemberInformationMessage securities_member_information_message_sent;
  SecuritiesMemberInformationMessage securities_member_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_member_information_message(securities_member_information_message_sent, 0)
  :: pattern == 1 -> fill_securities_member_information_message(securities_member_information_message_sent, 32)
  :: pattern == 2 -> fill_securities_member_information_message(securities_member_information_message_sent, 255)
  :: else -> ramp_securities_member_information_message(securities_member_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_member_information_message(securities_member_information_message_sent);
    assert(at == 202);
    at = 0;
    decode_securities_member_information_message(securities_member_information_message_got);
    assert(at == 202);
    equal_securities_member_information_message(securities_member_information_message_got, securities_member_information_message_sent)
  }
}

/* Securities Treasury Stocks Batch Message: encoded, read back, and compared */
proctype check_securities_treasury_stocks_batch_message() {
  SecuritiesTreasuryStocksBatchMessage securities_treasury_stocks_batch_message_sent;
  SecuritiesTreasuryStocksBatchMessage securities_treasury_stocks_batch_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_sent, 0)
  :: pattern == 1 -> fill_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_sent, 32)
  :: pattern == 2 -> fill_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_sent, 255)
  :: else -> ramp_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_sent);
    assert(at == 130);
    at = 0;
    decode_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_got);
    assert(at == 130);
    equal_securities_treasury_stocks_batch_message(securities_treasury_stocks_batch_message_got, securities_treasury_stocks_batch_message_sent)
  }
}

/* Securities Equity Index Indicator Message: encoded, read back, and compared */
proctype check_securities_equity_index_indicator_message() {
  SecuritiesEquityIndexIndicatorMessage securities_equity_index_indicator_message_sent;
  SecuritiesEquityIndexIndicatorMessage securities_equity_index_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_equity_index_indicator_message(securities_equity_index_indicator_message_sent, 0)
  :: pattern == 1 -> fill_securities_equity_index_indicator_message(securities_equity_index_indicator_message_sent, 32)
  :: pattern == 2 -> fill_securities_equity_index_indicator_message(securities_equity_index_indicator_message_sent, 255)
  :: else -> ramp_securities_equity_index_indicator_message(securities_equity_index_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_equity_index_indicator_message(securities_equity_index_indicator_message_sent);
    assert(at == 180);
    at = 0;
    decode_securities_equity_index_indicator_message(securities_equity_index_indicator_message_got);
    assert(at == 180);
    equal_securities_equity_index_indicator_message(securities_equity_index_indicator_message_got, securities_equity_index_indicator_message_sent)
  }
}

/* Securities Dividend Yield Per Industry Message: encoded, read back, and compared */
proctype check_securities_dividend_yield_per_industry_message() {
  SecuritiesDividendYieldPerIndustryMessage securities_dividend_yield_per_industry_message_sent;
  SecuritiesDividendYieldPerIndustryMessage securities_dividend_yield_per_industry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_sent, 0)
  :: pattern == 1 -> fill_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_sent, 32)
  :: pattern == 2 -> fill_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_sent, 255)
  :: else -> ramp_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_sent);
    assert(at == 31);
    at = 0;
    decode_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_got);
    assert(at == 31);
    equal_securities_dividend_yield_per_industry_message(securities_dividend_yield_per_industry_message_got, securities_dividend_yield_per_industry_message_sent)
  }
}

/* Bonds Batch Data Message: encoded, read back, and compared */
proctype check_bonds_batch_data_message() {
  BondsBatchDataMessage bonds_batch_data_message_sent;
  BondsBatchDataMessage bonds_batch_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bonds_batch_data_message(bonds_batch_data_message_sent, 0)
  :: pattern == 1 -> fill_bonds_batch_data_message(bonds_batch_data_message_sent, 32)
  :: pattern == 2 -> fill_bonds_batch_data_message(bonds_batch_data_message_sent, 255)
  :: else -> ramp_bonds_batch_data_message(bonds_batch_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bonds_batch_data_message(bonds_batch_data_message_sent);
    assert(at == 303);
    at = 0;
    decode_bonds_batch_data_message(bonds_batch_data_message_got);
    assert(at == 303);
    equal_bonds_batch_data_message(bonds_batch_data_message_got, bonds_batch_data_message_sent)
  }
}

/* Repo Batch Data Message: encoded, read back, and compared */
proctype check_repo_batch_data_message() {
  RepoBatchDataMessage repo_batch_data_message_sent;
  RepoBatchDataMessage repo_batch_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_repo_batch_data_message(repo_batch_data_message_sent, 0)
  :: pattern == 1 -> fill_repo_batch_data_message(repo_batch_data_message_sent, 32)
  :: pattern == 2 -> fill_repo_batch_data_message(repo_batch_data_message_sent, 255)
  :: else -> ramp_repo_batch_data_message(repo_batch_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_repo_batch_data_message(repo_batch_data_message_sent);
    assert(at == 95);
    at = 0;
    decode_repo_batch_data_message(repo_batch_data_message_got);
    assert(at == 95);
    equal_repo_batch_data_message(repo_batch_data_message_got, repo_batch_data_message_sent)
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

/* Corporate Bonds Reference Message: encoded, read back, and compared */
proctype check_corporate_bonds_reference_message() {
  CorporateBondsReferenceMessage corporate_bonds_reference_message_sent;
  CorporateBondsReferenceMessage corporate_bonds_reference_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_corporate_bonds_reference_message(corporate_bonds_reference_message_sent, 0)
  :: pattern == 1 -> fill_corporate_bonds_reference_message(corporate_bonds_reference_message_sent, 32)
  :: pattern == 2 -> fill_corporate_bonds_reference_message(corporate_bonds_reference_message_sent, 255)
  :: else -> ramp_corporate_bonds_reference_message(corporate_bonds_reference_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_corporate_bonds_reference_message(corporate_bonds_reference_message_sent);
    assert(at == 240);
    at = 0;
    decode_corporate_bonds_reference_message(corporate_bonds_reference_message_got);
    assert(at == 240);
    equal_corporate_bonds_reference_message(corporate_bonds_reference_message_got, corporate_bonds_reference_message_sent)
  }
}

/* Regular Bonds Installment Repayment Date Message: encoded, read back, and compared */
proctype check_regular_bonds_installment_repayment_date_message() {
  RegularBondsInstallmentRepaymentDateMessage regular_bonds_installment_repayment_date_message_sent;
  RegularBondsInstallmentRepaymentDateMessage regular_bonds_installment_repayment_date_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_sent, 0)
  :: pattern == 1 -> fill_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_sent, 32)
  :: pattern == 2 -> fill_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_sent, 255)
  :: else -> ramp_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_sent);
    assert(at == 29);
    at = 0;
    decode_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_got);
    assert(at == 29);
    equal_regular_bonds_installment_repayment_date_message(regular_bonds_installment_repayment_date_message_got, regular_bonds_installment_repayment_date_message_sent)
  }
}

/* Repo Classification Data Message: encoded, read back, and compared */
proctype check_repo_classification_data_message() {
  RepoClassificationDataMessage repo_classification_data_message_sent;
  RepoClassificationDataMessage repo_classification_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_repo_classification_data_message(repo_classification_data_message_sent, 0)
  :: pattern == 1 -> fill_repo_classification_data_message(repo_classification_data_message_sent, 32)
  :: pattern == 2 -> fill_repo_classification_data_message(repo_classification_data_message_sent, 255)
  :: else -> ramp_repo_classification_data_message(repo_classification_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_repo_classification_data_message(repo_classification_data_message_sent);
    assert(at == 39);
    at = 0;
    decode_repo_classification_data_message(repo_classification_data_message_got);
    assert(at == 39);
    equal_repo_classification_data_message(repo_classification_data_message_got, repo_classification_data_message_sent)
  }
}

/* Repo Trade Availability Per Term Message: encoded, read back, and compared */
proctype check_repo_trade_availability_per_term_message() {
  RepoTradeAvailabilityPerTermMessage repo_trade_availability_per_term_message_sent;
  RepoTradeAvailabilityPerTermMessage repo_trade_availability_per_term_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_sent, 0)
  :: pattern == 1 -> fill_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_sent, 32)
  :: pattern == 2 -> fill_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_sent, 255)
  :: else -> ramp_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_sent);
    assert(at == 54);
    at = 0;
    decode_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_got);
    assert(at == 54);
    equal_repo_trade_availability_per_term_message(repo_trade_availability_per_term_message_got, repo_trade_availability_per_term_message_sent)
  }
}

/* Retail Bonds Type Code Message: encoded, read back, and compared */
proctype check_retail_bonds_type_code_message() {
  RetailBondsTypeCodeMessage retail_bonds_type_code_message_sent;
  RetailBondsTypeCodeMessage retail_bonds_type_code_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retail_bonds_type_code_message(retail_bonds_type_code_message_sent, 0)
  :: pattern == 1 -> fill_retail_bonds_type_code_message(retail_bonds_type_code_message_sent, 32)
  :: pattern == 2 -> fill_retail_bonds_type_code_message(retail_bonds_type_code_message_sent, 255)
  :: else -> ramp_retail_bonds_type_code_message(retail_bonds_type_code_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retail_bonds_type_code_message(retail_bonds_type_code_message_sent);
    assert(at == 52);
    at = 0;
    decode_retail_bonds_type_code_message(retail_bonds_type_code_message_got);
    assert(at == 52);
    equal_retail_bonds_type_code_message(retail_bonds_type_code_message_got, retail_bonds_type_code_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_polling_data_message()
  :: run check_krx_index_message()
  :: run check_krx_estimated_index_message()
  :: run check_global_index_message()
  :: run check_bond_prime_index_message()
  :: run check_bond_ktb_index_message()
  :: run check_bond_ktb_index_term_structure_message()
  :: run check_bond_index_krx_message()
  :: run check_equity_derivatives_underlying_snapshot_kospi_message()
  :: run check_equity_derivatives_underlying_snapshot_kosdaq_message()
  :: run check_equity_derivatives_underlying_snapshot_kospi_mm_lp_included_message()
  :: run check_securities_equities_batch_data_message()
  :: run check_securities_closing_date_message()
  :: run check_securities_mm_lp_information_message()
  :: run check_securities_member_information_message()
  :: run check_securities_treasury_stocks_batch_message()
  :: run check_securities_equity_index_indicator_message()
  :: run check_securities_dividend_yield_per_industry_message()
  :: run check_bonds_batch_data_message()
  :: run check_repo_batch_data_message()
  :: run check_issue_event_message()
  :: run check_corporate_bonds_reference_message()
  :: run check_regular_bonds_installment_repayment_date_message()
  :: run check_repo_classification_data_message()
  :: run check_repo_trade_availability_per_term_message()
  :: run check_retail_bonds_type_code_message()
  fi
}
