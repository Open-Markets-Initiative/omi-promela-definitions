/*
 * Koscom Co., Ltd. MDCS Realtime Reference Info and Investor Activities
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
#define WIRE 518

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

/* ---- Krx Index Message: 72 bytes --------------------------------------------- */

/* Krx Index real-time message. Reports current index value, change against previous day, accumulated trading volume, and accumulated trading value for one index. The Index ID field identifies which index group (KRX Index Group 1/2/3, Sector A/B, Gold Spot, or Equity Derivatives) this record belongs to. */
typedef KrxIndexMessage {
  byte index_id[6];
  byte isin_code[12];
  byte calculation_time[6];
  byte index[9];
  byte index_change_sign_against_the_previous_day;
  byte index_change_against_the_previous_day[9];
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[12];
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
  :: krx_index_message_at < 12 -> krx_index_message_record.accumulated_trading_value[krx_index_message_at] = krx_index_message_value; krx_index_message_at = krx_index_message_at + 1
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
  :: krx_index_message_at < 12 -> krx_index_message_record.accumulated_trading_value[krx_index_message_at] = (krx_index_message_base + 55 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_at = 0;
  do
  :: krx_index_message_at < 4 -> krx_index_message_record.filler_4[krx_index_message_at] = (krx_index_message_base + 67 + krx_index_message_at + 1) % 256; krx_index_message_at = krx_index_message_at + 1
  :: else -> break
  od;
  krx_index_message_record.end_keyword = (krx_index_message_base + 71 + 1) % 256;
  skip
}

/* Krx Index Message to the wire, 72 bytes from where the cursor stands */
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
  :: krx_index_message_at < 12 -> wire[at] = krx_index_message_record.accumulated_trading_value[krx_index_message_at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
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

/* Krx Index Message off the wire, 72 bytes from where the cursor stands */
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
  :: krx_index_message_at < 12 -> krx_index_message_record.accumulated_trading_value[krx_index_message_at] = wire[at]; at = at + 1; krx_index_message_at = krx_index_message_at + 1
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
  :: krx_index_message_at < 12 -> assert(krx_index_message_read.accumulated_trading_value[krx_index_message_at] == krx_index_message_written.accumulated_trading_value[krx_index_message_at]); krx_index_message_at = krx_index_message_at + 1
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

/* ---- Krx Estimated Index Message: 72 bytes ----------------------------------- */

/* Krx Estimated Index real-time message. Reports the estimated index value during the pre-opening simultaneous-trading window or during regular session estimation. Identical field layout to the Krx Index Message. */
typedef KrxEstimatedIndexMessage {
  byte index_id[6];
  byte isin_code[12];
  byte calculation_time[6];
  byte index[9];
  byte index_change_sign_against_the_previous_day;
  byte index_change_against_the_previous_day[9];
  byte accumulated_trading_volume[12];
  byte accumulated_trading_value[12];
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
  :: krx_estimated_index_message_at < 12 -> krx_estimated_index_message_record.accumulated_trading_value[krx_estimated_index_message_at] = krx_estimated_index_message_value; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
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
  :: krx_estimated_index_message_at < 12 -> krx_estimated_index_message_record.accumulated_trading_value[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 55 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_at = 0;
  do
  :: krx_estimated_index_message_at < 4 -> krx_estimated_index_message_record.filler_4[krx_estimated_index_message_at] = (krx_estimated_index_message_base + 67 + krx_estimated_index_message_at + 1) % 256; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
  :: else -> break
  od;
  krx_estimated_index_message_record.end_keyword = (krx_estimated_index_message_base + 71 + 1) % 256;
  skip
}

/* Krx Estimated Index Message to the wire, 72 bytes from where the cursor stands */
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
  :: krx_estimated_index_message_at < 12 -> wire[at] = krx_estimated_index_message_record.accumulated_trading_value[krx_estimated_index_message_at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
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

/* Krx Estimated Index Message off the wire, 72 bytes from where the cursor stands */
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
  :: krx_estimated_index_message_at < 12 -> krx_estimated_index_message_record.accumulated_trading_value[krx_estimated_index_message_at] = wire[at]; at = at + 1; krx_estimated_index_message_at = krx_estimated_index_message_at + 1
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
  :: krx_estimated_index_message_at < 12 -> assert(krx_estimated_index_message_read.accumulated_trading_value[krx_estimated_index_message_at] == krx_estimated_index_message_written.accumulated_trading_value[krx_estimated_index_message_at]); krx_estimated_index_message_at = krx_estimated_index_message_at + 1
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

/* ---- Securities Investor Activities Per Industry Message: 100 bytes ---------- */

/* Investor Activities per Industry. Aggregated bid/ask volumes and values per investor category and industry. */
typedef SecuritiesInvestorActivitiesPerIndustryMessage {
  byte calculation_time[6];
  byte investor_code[4];
  byte index_id[6];
  byte isin_code[12];
  byte accumulated_ask_trading_volume[12];
  byte accumulated_ask_trading_value[22];
  byte accumulated_bid_trading_volume[12];
  byte accumulated_bid_trading_value[22];
  byte filler_3[3];
  byte end_keyword
};

int securities_investor_activities_per_industry_message_at;

/* every byte of Securities Investor Activities Per Industry Message set to one value */
inline fill_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_record, securities_investor_activities_per_industry_message_value) {
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> securities_investor_activities_per_industry_message_record.calculation_time[securities_investor_activities_per_industry_message_at] = securities_investor_activities_per_industry_message_value; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 4 -> securities_investor_activities_per_industry_message_record.investor_code[securities_investor_activities_per_industry_message_at] = securities_investor_activities_per_industry_message_value; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> securities_investor_activities_per_industry_message_record.index_id[securities_investor_activities_per_industry_message_at] = securities_investor_activities_per_industry_message_value; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> securities_investor_activities_per_industry_message_record.isin_code[securities_investor_activities_per_industry_message_at] = securities_investor_activities_per_industry_message_value; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> securities_investor_activities_per_industry_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_industry_message_at] = securities_investor_activities_per_industry_message_value; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> securities_investor_activities_per_industry_message_record.accumulated_ask_trading_value[securities_investor_activities_per_industry_message_at] = securities_investor_activities_per_industry_message_value; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> securities_investor_activities_per_industry_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_industry_message_at] = securities_investor_activities_per_industry_message_value; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> securities_investor_activities_per_industry_message_record.accumulated_bid_trading_value[securities_investor_activities_per_industry_message_at] = securities_investor_activities_per_industry_message_value; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 3 -> securities_investor_activities_per_industry_message_record.filler_3[securities_investor_activities_per_industry_message_at] = securities_investor_activities_per_industry_message_value; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_record.end_keyword = securities_investor_activities_per_industry_message_value;
  skip
}

/* each byte of Securities Investor Activities Per Industry Message set to where it lies, so a field read out of place says so */
inline ramp_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_record, securities_investor_activities_per_industry_message_base) {
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> securities_investor_activities_per_industry_message_record.calculation_time[securities_investor_activities_per_industry_message_at] = (securities_investor_activities_per_industry_message_base + 0 + securities_investor_activities_per_industry_message_at + 1) % 256; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 4 -> securities_investor_activities_per_industry_message_record.investor_code[securities_investor_activities_per_industry_message_at] = (securities_investor_activities_per_industry_message_base + 6 + securities_investor_activities_per_industry_message_at + 1) % 256; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> securities_investor_activities_per_industry_message_record.index_id[securities_investor_activities_per_industry_message_at] = (securities_investor_activities_per_industry_message_base + 10 + securities_investor_activities_per_industry_message_at + 1) % 256; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> securities_investor_activities_per_industry_message_record.isin_code[securities_investor_activities_per_industry_message_at] = (securities_investor_activities_per_industry_message_base + 16 + securities_investor_activities_per_industry_message_at + 1) % 256; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> securities_investor_activities_per_industry_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_industry_message_at] = (securities_investor_activities_per_industry_message_base + 28 + securities_investor_activities_per_industry_message_at + 1) % 256; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> securities_investor_activities_per_industry_message_record.accumulated_ask_trading_value[securities_investor_activities_per_industry_message_at] = (securities_investor_activities_per_industry_message_base + 40 + securities_investor_activities_per_industry_message_at + 1) % 256; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> securities_investor_activities_per_industry_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_industry_message_at] = (securities_investor_activities_per_industry_message_base + 62 + securities_investor_activities_per_industry_message_at + 1) % 256; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> securities_investor_activities_per_industry_message_record.accumulated_bid_trading_value[securities_investor_activities_per_industry_message_at] = (securities_investor_activities_per_industry_message_base + 74 + securities_investor_activities_per_industry_message_at + 1) % 256; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 3 -> securities_investor_activities_per_industry_message_record.filler_3[securities_investor_activities_per_industry_message_at] = (securities_investor_activities_per_industry_message_base + 96 + securities_investor_activities_per_industry_message_at + 1) % 256; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_record.end_keyword = (securities_investor_activities_per_industry_message_base + 99 + 1) % 256;
  skip
}

/* Securities Investor Activities Per Industry Message to the wire, 100 bytes from where the cursor stands */
inline encode_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_record) {
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> wire[at] = securities_investor_activities_per_industry_message_record.calculation_time[securities_investor_activities_per_industry_message_at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 4 -> wire[at] = securities_investor_activities_per_industry_message_record.investor_code[securities_investor_activities_per_industry_message_at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> wire[at] = securities_investor_activities_per_industry_message_record.index_id[securities_investor_activities_per_industry_message_at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> wire[at] = securities_investor_activities_per_industry_message_record.isin_code[securities_investor_activities_per_industry_message_at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> wire[at] = securities_investor_activities_per_industry_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_industry_message_at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> wire[at] = securities_investor_activities_per_industry_message_record.accumulated_ask_trading_value[securities_investor_activities_per_industry_message_at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> wire[at] = securities_investor_activities_per_industry_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_industry_message_at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> wire[at] = securities_investor_activities_per_industry_message_record.accumulated_bid_trading_value[securities_investor_activities_per_industry_message_at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 3 -> wire[at] = securities_investor_activities_per_industry_message_record.filler_3[securities_investor_activities_per_industry_message_at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_investor_activities_per_industry_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Investor Activities Per Industry Message off the wire, 100 bytes from where the cursor stands */
inline decode_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_record) {
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> securities_investor_activities_per_industry_message_record.calculation_time[securities_investor_activities_per_industry_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 4 -> securities_investor_activities_per_industry_message_record.investor_code[securities_investor_activities_per_industry_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> securities_investor_activities_per_industry_message_record.index_id[securities_investor_activities_per_industry_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> securities_investor_activities_per_industry_message_record.isin_code[securities_investor_activities_per_industry_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> securities_investor_activities_per_industry_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_industry_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> securities_investor_activities_per_industry_message_record.accumulated_ask_trading_value[securities_investor_activities_per_industry_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> securities_investor_activities_per_industry_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_industry_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> securities_investor_activities_per_industry_message_record.accumulated_bid_trading_value[securities_investor_activities_per_industry_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 3 -> securities_investor_activities_per_industry_message_record.filler_3[securities_investor_activities_per_industry_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Investor Activities Per Industry Message is what was written, byte for byte */
inline equal_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_read, securities_investor_activities_per_industry_message_written) {
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> assert(securities_investor_activities_per_industry_message_read.calculation_time[securities_investor_activities_per_industry_message_at] == securities_investor_activities_per_industry_message_written.calculation_time[securities_investor_activities_per_industry_message_at]); securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 4 -> assert(securities_investor_activities_per_industry_message_read.investor_code[securities_investor_activities_per_industry_message_at] == securities_investor_activities_per_industry_message_written.investor_code[securities_investor_activities_per_industry_message_at]); securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 6 -> assert(securities_investor_activities_per_industry_message_read.index_id[securities_investor_activities_per_industry_message_at] == securities_investor_activities_per_industry_message_written.index_id[securities_investor_activities_per_industry_message_at]); securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> assert(securities_investor_activities_per_industry_message_read.isin_code[securities_investor_activities_per_industry_message_at] == securities_investor_activities_per_industry_message_written.isin_code[securities_investor_activities_per_industry_message_at]); securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> assert(securities_investor_activities_per_industry_message_read.accumulated_ask_trading_volume[securities_investor_activities_per_industry_message_at] == securities_investor_activities_per_industry_message_written.accumulated_ask_trading_volume[securities_investor_activities_per_industry_message_at]); securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> assert(securities_investor_activities_per_industry_message_read.accumulated_ask_trading_value[securities_investor_activities_per_industry_message_at] == securities_investor_activities_per_industry_message_written.accumulated_ask_trading_value[securities_investor_activities_per_industry_message_at]); securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 12 -> assert(securities_investor_activities_per_industry_message_read.accumulated_bid_trading_volume[securities_investor_activities_per_industry_message_at] == securities_investor_activities_per_industry_message_written.accumulated_bid_trading_volume[securities_investor_activities_per_industry_message_at]); securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 22 -> assert(securities_investor_activities_per_industry_message_read.accumulated_bid_trading_value[securities_investor_activities_per_industry_message_at] == securities_investor_activities_per_industry_message_written.accumulated_bid_trading_value[securities_investor_activities_per_industry_message_at]); securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_industry_message_at = 0;
  do
  :: securities_investor_activities_per_industry_message_at < 3 -> assert(securities_investor_activities_per_industry_message_read.filler_3[securities_investor_activities_per_industry_message_at] == securities_investor_activities_per_industry_message_written.filler_3[securities_investor_activities_per_industry_message_at]); securities_investor_activities_per_industry_message_at = securities_investor_activities_per_industry_message_at + 1
  :: else -> break
  od;
  assert(securities_investor_activities_per_industry_message_read.end_keyword == securities_investor_activities_per_industry_message_written.end_keyword);
  skip
}

/* ---- Securities Investor Activities Per Issue Eod Message: 91 bytes ---------- */

/* Investor Activities per Issue EOD. Aggregated bid/ask volumes and values per investor category and ISIN at end-of-day. */
typedef SecuritiesInvestorActivitiesPerIssueEodMessage {
  byte isin_code[12];
  byte a_designated_number_for_an_issue[6];
  byte investor_code[4];
  byte accumulated_ask_trading_volume[12];
  byte accumulated_ask_trading_value[22];
  byte accumulated_bid_trading_volume[12];
  byte accumulated_bid_trading_value[22];
  byte end_keyword
};

int securities_investor_activities_per_issue_eod_message_at;

/* every byte of Securities Investor Activities Per Issue Eod Message set to one value */
inline fill_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_record, securities_investor_activities_per_issue_eod_message_value) {
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> securities_investor_activities_per_issue_eod_message_record.isin_code[securities_investor_activities_per_issue_eod_message_at] = securities_investor_activities_per_issue_eod_message_value; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 6 -> securities_investor_activities_per_issue_eod_message_record.a_designated_number_for_an_issue[securities_investor_activities_per_issue_eod_message_at] = securities_investor_activities_per_issue_eod_message_value; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 4 -> securities_investor_activities_per_issue_eod_message_record.investor_code[securities_investor_activities_per_issue_eod_message_at] = securities_investor_activities_per_issue_eod_message_value; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> securities_investor_activities_per_issue_eod_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_issue_eod_message_at] = securities_investor_activities_per_issue_eod_message_value; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> securities_investor_activities_per_issue_eod_message_record.accumulated_ask_trading_value[securities_investor_activities_per_issue_eod_message_at] = securities_investor_activities_per_issue_eod_message_value; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> securities_investor_activities_per_issue_eod_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_issue_eod_message_at] = securities_investor_activities_per_issue_eod_message_value; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> securities_investor_activities_per_issue_eod_message_record.accumulated_bid_trading_value[securities_investor_activities_per_issue_eod_message_at] = securities_investor_activities_per_issue_eod_message_value; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_record.end_keyword = securities_investor_activities_per_issue_eod_message_value;
  skip
}

/* each byte of Securities Investor Activities Per Issue Eod Message set to where it lies, so a field read out of place says so */
inline ramp_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_record, securities_investor_activities_per_issue_eod_message_base) {
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> securities_investor_activities_per_issue_eod_message_record.isin_code[securities_investor_activities_per_issue_eod_message_at] = (securities_investor_activities_per_issue_eod_message_base + 0 + securities_investor_activities_per_issue_eod_message_at + 1) % 256; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 6 -> securities_investor_activities_per_issue_eod_message_record.a_designated_number_for_an_issue[securities_investor_activities_per_issue_eod_message_at] = (securities_investor_activities_per_issue_eod_message_base + 12 + securities_investor_activities_per_issue_eod_message_at + 1) % 256; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 4 -> securities_investor_activities_per_issue_eod_message_record.investor_code[securities_investor_activities_per_issue_eod_message_at] = (securities_investor_activities_per_issue_eod_message_base + 18 + securities_investor_activities_per_issue_eod_message_at + 1) % 256; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> securities_investor_activities_per_issue_eod_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_issue_eod_message_at] = (securities_investor_activities_per_issue_eod_message_base + 22 + securities_investor_activities_per_issue_eod_message_at + 1) % 256; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> securities_investor_activities_per_issue_eod_message_record.accumulated_ask_trading_value[securities_investor_activities_per_issue_eod_message_at] = (securities_investor_activities_per_issue_eod_message_base + 34 + securities_investor_activities_per_issue_eod_message_at + 1) % 256; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> securities_investor_activities_per_issue_eod_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_issue_eod_message_at] = (securities_investor_activities_per_issue_eod_message_base + 56 + securities_investor_activities_per_issue_eod_message_at + 1) % 256; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> securities_investor_activities_per_issue_eod_message_record.accumulated_bid_trading_value[securities_investor_activities_per_issue_eod_message_at] = (securities_investor_activities_per_issue_eod_message_base + 68 + securities_investor_activities_per_issue_eod_message_at + 1) % 256; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_record.end_keyword = (securities_investor_activities_per_issue_eod_message_base + 90 + 1) % 256;
  skip
}

/* Securities Investor Activities Per Issue Eod Message to the wire, 91 bytes from where the cursor stands */
inline encode_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_record) {
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> wire[at] = securities_investor_activities_per_issue_eod_message_record.isin_code[securities_investor_activities_per_issue_eod_message_at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 6 -> wire[at] = securities_investor_activities_per_issue_eod_message_record.a_designated_number_for_an_issue[securities_investor_activities_per_issue_eod_message_at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 4 -> wire[at] = securities_investor_activities_per_issue_eod_message_record.investor_code[securities_investor_activities_per_issue_eod_message_at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> wire[at] = securities_investor_activities_per_issue_eod_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_issue_eod_message_at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> wire[at] = securities_investor_activities_per_issue_eod_message_record.accumulated_ask_trading_value[securities_investor_activities_per_issue_eod_message_at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> wire[at] = securities_investor_activities_per_issue_eod_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_issue_eod_message_at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> wire[at] = securities_investor_activities_per_issue_eod_message_record.accumulated_bid_trading_value[securities_investor_activities_per_issue_eod_message_at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_investor_activities_per_issue_eod_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Investor Activities Per Issue Eod Message off the wire, 91 bytes from where the cursor stands */
inline decode_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_record) {
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> securities_investor_activities_per_issue_eod_message_record.isin_code[securities_investor_activities_per_issue_eod_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 6 -> securities_investor_activities_per_issue_eod_message_record.a_designated_number_for_an_issue[securities_investor_activities_per_issue_eod_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 4 -> securities_investor_activities_per_issue_eod_message_record.investor_code[securities_investor_activities_per_issue_eod_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> securities_investor_activities_per_issue_eod_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_issue_eod_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> securities_investor_activities_per_issue_eod_message_record.accumulated_ask_trading_value[securities_investor_activities_per_issue_eod_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> securities_investor_activities_per_issue_eod_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_issue_eod_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> securities_investor_activities_per_issue_eod_message_record.accumulated_bid_trading_value[securities_investor_activities_per_issue_eod_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Investor Activities Per Issue Eod Message is what was written, byte for byte */
inline equal_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_read, securities_investor_activities_per_issue_eod_message_written) {
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> assert(securities_investor_activities_per_issue_eod_message_read.isin_code[securities_investor_activities_per_issue_eod_message_at] == securities_investor_activities_per_issue_eod_message_written.isin_code[securities_investor_activities_per_issue_eod_message_at]); securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 6 -> assert(securities_investor_activities_per_issue_eod_message_read.a_designated_number_for_an_issue[securities_investor_activities_per_issue_eod_message_at] == securities_investor_activities_per_issue_eod_message_written.a_designated_number_for_an_issue[securities_investor_activities_per_issue_eod_message_at]); securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 4 -> assert(securities_investor_activities_per_issue_eod_message_read.investor_code[securities_investor_activities_per_issue_eod_message_at] == securities_investor_activities_per_issue_eod_message_written.investor_code[securities_investor_activities_per_issue_eod_message_at]); securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> assert(securities_investor_activities_per_issue_eod_message_read.accumulated_ask_trading_volume[securities_investor_activities_per_issue_eod_message_at] == securities_investor_activities_per_issue_eod_message_written.accumulated_ask_trading_volume[securities_investor_activities_per_issue_eod_message_at]); securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> assert(securities_investor_activities_per_issue_eod_message_read.accumulated_ask_trading_value[securities_investor_activities_per_issue_eod_message_at] == securities_investor_activities_per_issue_eod_message_written.accumulated_ask_trading_value[securities_investor_activities_per_issue_eod_message_at]); securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 12 -> assert(securities_investor_activities_per_issue_eod_message_read.accumulated_bid_trading_volume[securities_investor_activities_per_issue_eod_message_at] == securities_investor_activities_per_issue_eod_message_written.accumulated_bid_trading_volume[securities_investor_activities_per_issue_eod_message_at]); securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_issue_eod_message_at = 0;
  do
  :: securities_investor_activities_per_issue_eod_message_at < 22 -> assert(securities_investor_activities_per_issue_eod_message_read.accumulated_bid_trading_value[securities_investor_activities_per_issue_eod_message_at] == securities_investor_activities_per_issue_eod_message_written.accumulated_bid_trading_value[securities_investor_activities_per_issue_eod_message_at]); securities_investor_activities_per_issue_eod_message_at = securities_investor_activities_per_issue_eod_message_at + 1
  :: else -> break
  od;
  assert(securities_investor_activities_per_issue_eod_message_read.end_keyword == securities_investor_activities_per_issue_eod_message_written.end_keyword);
  skip
}

/* ---- Securities Investor Activities Per Commodities Message: 79 bytes -------- */

/* Investor Activities per Commodities. */
typedef SecuritiesInvestorActivitiesPerCommoditiesMessage {
  byte calculation_time[6];
  byte investor_code[4];
  byte accumulated_ask_trading_volume[12];
  byte accumulated_ask_trading_value[22];
  byte accumulated_bid_trading_volume[12];
  byte accumulated_bid_trading_value[22];
  byte end_keyword
};

int securities_investor_activities_per_commodities_message_at;

/* every byte of Securities Investor Activities Per Commodities Message set to one value */
inline fill_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_record, securities_investor_activities_per_commodities_message_value) {
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 6 -> securities_investor_activities_per_commodities_message_record.calculation_time[securities_investor_activities_per_commodities_message_at] = securities_investor_activities_per_commodities_message_value; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 4 -> securities_investor_activities_per_commodities_message_record.investor_code[securities_investor_activities_per_commodities_message_at] = securities_investor_activities_per_commodities_message_value; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> securities_investor_activities_per_commodities_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_commodities_message_at] = securities_investor_activities_per_commodities_message_value; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> securities_investor_activities_per_commodities_message_record.accumulated_ask_trading_value[securities_investor_activities_per_commodities_message_at] = securities_investor_activities_per_commodities_message_value; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> securities_investor_activities_per_commodities_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_commodities_message_at] = securities_investor_activities_per_commodities_message_value; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> securities_investor_activities_per_commodities_message_record.accumulated_bid_trading_value[securities_investor_activities_per_commodities_message_at] = securities_investor_activities_per_commodities_message_value; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_record.end_keyword = securities_investor_activities_per_commodities_message_value;
  skip
}

/* each byte of Securities Investor Activities Per Commodities Message set to where it lies, so a field read out of place says so */
inline ramp_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_record, securities_investor_activities_per_commodities_message_base) {
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 6 -> securities_investor_activities_per_commodities_message_record.calculation_time[securities_investor_activities_per_commodities_message_at] = (securities_investor_activities_per_commodities_message_base + 0 + securities_investor_activities_per_commodities_message_at + 1) % 256; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 4 -> securities_investor_activities_per_commodities_message_record.investor_code[securities_investor_activities_per_commodities_message_at] = (securities_investor_activities_per_commodities_message_base + 6 + securities_investor_activities_per_commodities_message_at + 1) % 256; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> securities_investor_activities_per_commodities_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_commodities_message_at] = (securities_investor_activities_per_commodities_message_base + 10 + securities_investor_activities_per_commodities_message_at + 1) % 256; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> securities_investor_activities_per_commodities_message_record.accumulated_ask_trading_value[securities_investor_activities_per_commodities_message_at] = (securities_investor_activities_per_commodities_message_base + 22 + securities_investor_activities_per_commodities_message_at + 1) % 256; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> securities_investor_activities_per_commodities_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_commodities_message_at] = (securities_investor_activities_per_commodities_message_base + 44 + securities_investor_activities_per_commodities_message_at + 1) % 256; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> securities_investor_activities_per_commodities_message_record.accumulated_bid_trading_value[securities_investor_activities_per_commodities_message_at] = (securities_investor_activities_per_commodities_message_base + 56 + securities_investor_activities_per_commodities_message_at + 1) % 256; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_record.end_keyword = (securities_investor_activities_per_commodities_message_base + 78 + 1) % 256;
  skip
}

/* Securities Investor Activities Per Commodities Message to the wire, 79 bytes from where the cursor stands */
inline encode_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_record) {
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 6 -> wire[at] = securities_investor_activities_per_commodities_message_record.calculation_time[securities_investor_activities_per_commodities_message_at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 4 -> wire[at] = securities_investor_activities_per_commodities_message_record.investor_code[securities_investor_activities_per_commodities_message_at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> wire[at] = securities_investor_activities_per_commodities_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_commodities_message_at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> wire[at] = securities_investor_activities_per_commodities_message_record.accumulated_ask_trading_value[securities_investor_activities_per_commodities_message_at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> wire[at] = securities_investor_activities_per_commodities_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_commodities_message_at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> wire[at] = securities_investor_activities_per_commodities_message_record.accumulated_bid_trading_value[securities_investor_activities_per_commodities_message_at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_investor_activities_per_commodities_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Investor Activities Per Commodities Message off the wire, 79 bytes from where the cursor stands */
inline decode_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_record) {
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 6 -> securities_investor_activities_per_commodities_message_record.calculation_time[securities_investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 4 -> securities_investor_activities_per_commodities_message_record.investor_code[securities_investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> securities_investor_activities_per_commodities_message_record.accumulated_ask_trading_volume[securities_investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> securities_investor_activities_per_commodities_message_record.accumulated_ask_trading_value[securities_investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> securities_investor_activities_per_commodities_message_record.accumulated_bid_trading_volume[securities_investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> securities_investor_activities_per_commodities_message_record.accumulated_bid_trading_value[securities_investor_activities_per_commodities_message_at] = wire[at]; at = at + 1; securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Investor Activities Per Commodities Message is what was written, byte for byte */
inline equal_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_read, securities_investor_activities_per_commodities_message_written) {
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 6 -> assert(securities_investor_activities_per_commodities_message_read.calculation_time[securities_investor_activities_per_commodities_message_at] == securities_investor_activities_per_commodities_message_written.calculation_time[securities_investor_activities_per_commodities_message_at]); securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 4 -> assert(securities_investor_activities_per_commodities_message_read.investor_code[securities_investor_activities_per_commodities_message_at] == securities_investor_activities_per_commodities_message_written.investor_code[securities_investor_activities_per_commodities_message_at]); securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> assert(securities_investor_activities_per_commodities_message_read.accumulated_ask_trading_volume[securities_investor_activities_per_commodities_message_at] == securities_investor_activities_per_commodities_message_written.accumulated_ask_trading_volume[securities_investor_activities_per_commodities_message_at]); securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> assert(securities_investor_activities_per_commodities_message_read.accumulated_ask_trading_value[securities_investor_activities_per_commodities_message_at] == securities_investor_activities_per_commodities_message_written.accumulated_ask_trading_value[securities_investor_activities_per_commodities_message_at]); securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 12 -> assert(securities_investor_activities_per_commodities_message_read.accumulated_bid_trading_volume[securities_investor_activities_per_commodities_message_at] == securities_investor_activities_per_commodities_message_written.accumulated_bid_trading_volume[securities_investor_activities_per_commodities_message_at]); securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  securities_investor_activities_per_commodities_message_at = 0;
  do
  :: securities_investor_activities_per_commodities_message_at < 22 -> assert(securities_investor_activities_per_commodities_message_read.accumulated_bid_trading_value[securities_investor_activities_per_commodities_message_at] == securities_investor_activities_per_commodities_message_written.accumulated_bid_trading_value[securities_investor_activities_per_commodities_message_at]); securities_investor_activities_per_commodities_message_at = securities_investor_activities_per_commodities_message_at + 1
  :: else -> break
  od;
  assert(securities_investor_activities_per_commodities_message_read.end_keyword == securities_investor_activities_per_commodities_message_written.end_keyword);
  skip
}

/* ---- Securities Short Selling Message: 115 bytes ----------------------------- */

/* Short Selling activity per issue. */
typedef SecuritiesShortSellingMessage {
  byte isin_code[12];
  byte covered_short_selling_trading_volume[12];
  byte covered_short_selling_trading_value[22];
  byte uptick_rule_applied_covered_short_selling_trading_volume[12];
  byte uptick_rule_applied_covered_short_selling_trading_value[22];
  byte uptick_rule_unapplied_covered_short_selling_trading_volume[12];
  byte uptick_rule_unapplied_covered_short_selling_trading_value[22];
  byte end_keyword
};

int securities_short_selling_message_at;

/* every byte of Securities Short Selling Message set to one value */
inline fill_securities_short_selling_message(securities_short_selling_message_record, securities_short_selling_message_value) {
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.isin_code[securities_short_selling_message_at] = securities_short_selling_message_value; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.covered_short_selling_trading_volume[securities_short_selling_message_at] = securities_short_selling_message_value; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> securities_short_selling_message_record.covered_short_selling_trading_value[securities_short_selling_message_at] = securities_short_selling_message_value; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[securities_short_selling_message_at] = securities_short_selling_message_value; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> securities_short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[securities_short_selling_message_at] = securities_short_selling_message_value; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[securities_short_selling_message_at] = securities_short_selling_message_value; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> securities_short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[securities_short_selling_message_at] = securities_short_selling_message_value; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_record.end_keyword = securities_short_selling_message_value;
  skip
}

/* each byte of Securities Short Selling Message set to where it lies, so a field read out of place says so */
inline ramp_securities_short_selling_message(securities_short_selling_message_record, securities_short_selling_message_base) {
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.isin_code[securities_short_selling_message_at] = (securities_short_selling_message_base + 0 + securities_short_selling_message_at + 1) % 256; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.covered_short_selling_trading_volume[securities_short_selling_message_at] = (securities_short_selling_message_base + 12 + securities_short_selling_message_at + 1) % 256; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> securities_short_selling_message_record.covered_short_selling_trading_value[securities_short_selling_message_at] = (securities_short_selling_message_base + 24 + securities_short_selling_message_at + 1) % 256; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[securities_short_selling_message_at] = (securities_short_selling_message_base + 46 + securities_short_selling_message_at + 1) % 256; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> securities_short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[securities_short_selling_message_at] = (securities_short_selling_message_base + 58 + securities_short_selling_message_at + 1) % 256; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[securities_short_selling_message_at] = (securities_short_selling_message_base + 80 + securities_short_selling_message_at + 1) % 256; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> securities_short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[securities_short_selling_message_at] = (securities_short_selling_message_base + 92 + securities_short_selling_message_at + 1) % 256; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_record.end_keyword = (securities_short_selling_message_base + 114 + 1) % 256;
  skip
}

/* Securities Short Selling Message to the wire, 115 bytes from where the cursor stands */
inline encode_securities_short_selling_message(securities_short_selling_message_record) {
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> wire[at] = securities_short_selling_message_record.isin_code[securities_short_selling_message_at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> wire[at] = securities_short_selling_message_record.covered_short_selling_trading_volume[securities_short_selling_message_at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> wire[at] = securities_short_selling_message_record.covered_short_selling_trading_value[securities_short_selling_message_at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> wire[at] = securities_short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[securities_short_selling_message_at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> wire[at] = securities_short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[securities_short_selling_message_at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> wire[at] = securities_short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[securities_short_selling_message_at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> wire[at] = securities_short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[securities_short_selling_message_at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_short_selling_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Short Selling Message off the wire, 115 bytes from where the cursor stands */
inline decode_securities_short_selling_message(securities_short_selling_message_record) {
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.isin_code[securities_short_selling_message_at] = wire[at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.covered_short_selling_trading_volume[securities_short_selling_message_at] = wire[at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> securities_short_selling_message_record.covered_short_selling_trading_value[securities_short_selling_message_at] = wire[at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_volume[securities_short_selling_message_at] = wire[at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> securities_short_selling_message_record.uptick_rule_applied_covered_short_selling_trading_value[securities_short_selling_message_at] = wire[at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> securities_short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_volume[securities_short_selling_message_at] = wire[at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> securities_short_selling_message_record.uptick_rule_unapplied_covered_short_selling_trading_value[securities_short_selling_message_at] = wire[at]; at = at + 1; securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Short Selling Message is what was written, byte for byte */
inline equal_securities_short_selling_message(securities_short_selling_message_read, securities_short_selling_message_written) {
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> assert(securities_short_selling_message_read.isin_code[securities_short_selling_message_at] == securities_short_selling_message_written.isin_code[securities_short_selling_message_at]); securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> assert(securities_short_selling_message_read.covered_short_selling_trading_volume[securities_short_selling_message_at] == securities_short_selling_message_written.covered_short_selling_trading_volume[securities_short_selling_message_at]); securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> assert(securities_short_selling_message_read.covered_short_selling_trading_value[securities_short_selling_message_at] == securities_short_selling_message_written.covered_short_selling_trading_value[securities_short_selling_message_at]); securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> assert(securities_short_selling_message_read.uptick_rule_applied_covered_short_selling_trading_volume[securities_short_selling_message_at] == securities_short_selling_message_written.uptick_rule_applied_covered_short_selling_trading_volume[securities_short_selling_message_at]); securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> assert(securities_short_selling_message_read.uptick_rule_applied_covered_short_selling_trading_value[securities_short_selling_message_at] == securities_short_selling_message_written.uptick_rule_applied_covered_short_selling_trading_value[securities_short_selling_message_at]); securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 12 -> assert(securities_short_selling_message_read.uptick_rule_unapplied_covered_short_selling_trading_volume[securities_short_selling_message_at] == securities_short_selling_message_written.uptick_rule_unapplied_covered_short_selling_trading_volume[securities_short_selling_message_at]); securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  securities_short_selling_message_at = 0;
  do
  :: securities_short_selling_message_at < 22 -> assert(securities_short_selling_message_read.uptick_rule_unapplied_covered_short_selling_trading_value[securities_short_selling_message_at] == securities_short_selling_message_written.uptick_rule_unapplied_covered_short_selling_trading_value[securities_short_selling_message_at]); securities_short_selling_message_at = securities_short_selling_message_at + 1
  :: else -> break
  od;
  assert(securities_short_selling_message_read.end_keyword == securities_short_selling_message_written.end_keyword);
  skip
}

/* ---- Securities Treasury Stocks Traded Message: 52 bytes --------------------- */

/* Treasury Stocks Traded Information. Real-time treasury-stock trade dissemination per issue. */
typedef SecuritiesTreasuryStocksTradedMessage {
  byte session_id[2];
  byte isin_code[12];
  byte a_designated_number_for_an_issue[6];
  byte trading_price[11];
  byte trading_volume[10];
  byte bid_treasury_stock_declaration_id[5];
  byte ask_treasury_stock_declaration_id[5];
  byte end_keyword
};

int securities_treasury_stocks_traded_message_at;

/* every byte of Securities Treasury Stocks Traded Message set to one value */
inline fill_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_record, securities_treasury_stocks_traded_message_value) {
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 2 -> securities_treasury_stocks_traded_message_record.session_id[securities_treasury_stocks_traded_message_at] = securities_treasury_stocks_traded_message_value; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 12 -> securities_treasury_stocks_traded_message_record.isin_code[securities_treasury_stocks_traded_message_at] = securities_treasury_stocks_traded_message_value; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 6 -> securities_treasury_stocks_traded_message_record.a_designated_number_for_an_issue[securities_treasury_stocks_traded_message_at] = securities_treasury_stocks_traded_message_value; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 11 -> securities_treasury_stocks_traded_message_record.trading_price[securities_treasury_stocks_traded_message_at] = securities_treasury_stocks_traded_message_value; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 10 -> securities_treasury_stocks_traded_message_record.trading_volume[securities_treasury_stocks_traded_message_at] = securities_treasury_stocks_traded_message_value; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> securities_treasury_stocks_traded_message_record.bid_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at] = securities_treasury_stocks_traded_message_value; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> securities_treasury_stocks_traded_message_record.ask_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at] = securities_treasury_stocks_traded_message_value; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_record.end_keyword = securities_treasury_stocks_traded_message_value;
  skip
}

/* each byte of Securities Treasury Stocks Traded Message set to where it lies, so a field read out of place says so */
inline ramp_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_record, securities_treasury_stocks_traded_message_base) {
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 2 -> securities_treasury_stocks_traded_message_record.session_id[securities_treasury_stocks_traded_message_at] = (securities_treasury_stocks_traded_message_base + 0 + securities_treasury_stocks_traded_message_at + 1) % 256; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 12 -> securities_treasury_stocks_traded_message_record.isin_code[securities_treasury_stocks_traded_message_at] = (securities_treasury_stocks_traded_message_base + 2 + securities_treasury_stocks_traded_message_at + 1) % 256; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 6 -> securities_treasury_stocks_traded_message_record.a_designated_number_for_an_issue[securities_treasury_stocks_traded_message_at] = (securities_treasury_stocks_traded_message_base + 14 + securities_treasury_stocks_traded_message_at + 1) % 256; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 11 -> securities_treasury_stocks_traded_message_record.trading_price[securities_treasury_stocks_traded_message_at] = (securities_treasury_stocks_traded_message_base + 20 + securities_treasury_stocks_traded_message_at + 1) % 256; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 10 -> securities_treasury_stocks_traded_message_record.trading_volume[securities_treasury_stocks_traded_message_at] = (securities_treasury_stocks_traded_message_base + 31 + securities_treasury_stocks_traded_message_at + 1) % 256; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> securities_treasury_stocks_traded_message_record.bid_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at] = (securities_treasury_stocks_traded_message_base + 41 + securities_treasury_stocks_traded_message_at + 1) % 256; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> securities_treasury_stocks_traded_message_record.ask_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at] = (securities_treasury_stocks_traded_message_base + 46 + securities_treasury_stocks_traded_message_at + 1) % 256; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_record.end_keyword = (securities_treasury_stocks_traded_message_base + 51 + 1) % 256;
  skip
}

/* Securities Treasury Stocks Traded Message to the wire, 52 bytes from where the cursor stands */
inline encode_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_record) {
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 2 -> wire[at] = securities_treasury_stocks_traded_message_record.session_id[securities_treasury_stocks_traded_message_at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 12 -> wire[at] = securities_treasury_stocks_traded_message_record.isin_code[securities_treasury_stocks_traded_message_at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 6 -> wire[at] = securities_treasury_stocks_traded_message_record.a_designated_number_for_an_issue[securities_treasury_stocks_traded_message_at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 11 -> wire[at] = securities_treasury_stocks_traded_message_record.trading_price[securities_treasury_stocks_traded_message_at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 10 -> wire[at] = securities_treasury_stocks_traded_message_record.trading_volume[securities_treasury_stocks_traded_message_at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> wire[at] = securities_treasury_stocks_traded_message_record.bid_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> wire[at] = securities_treasury_stocks_traded_message_record.ask_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_treasury_stocks_traded_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Treasury Stocks Traded Message off the wire, 52 bytes from where the cursor stands */
inline decode_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_record) {
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 2 -> securities_treasury_stocks_traded_message_record.session_id[securities_treasury_stocks_traded_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 12 -> securities_treasury_stocks_traded_message_record.isin_code[securities_treasury_stocks_traded_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 6 -> securities_treasury_stocks_traded_message_record.a_designated_number_for_an_issue[securities_treasury_stocks_traded_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 11 -> securities_treasury_stocks_traded_message_record.trading_price[securities_treasury_stocks_traded_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 10 -> securities_treasury_stocks_traded_message_record.trading_volume[securities_treasury_stocks_traded_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> securities_treasury_stocks_traded_message_record.bid_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> securities_treasury_stocks_traded_message_record.ask_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at] = wire[at]; at = at + 1; securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Treasury Stocks Traded Message is what was written, byte for byte */
inline equal_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_read, securities_treasury_stocks_traded_message_written) {
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 2 -> assert(securities_treasury_stocks_traded_message_read.session_id[securities_treasury_stocks_traded_message_at] == securities_treasury_stocks_traded_message_written.session_id[securities_treasury_stocks_traded_message_at]); securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 12 -> assert(securities_treasury_stocks_traded_message_read.isin_code[securities_treasury_stocks_traded_message_at] == securities_treasury_stocks_traded_message_written.isin_code[securities_treasury_stocks_traded_message_at]); securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 6 -> assert(securities_treasury_stocks_traded_message_read.a_designated_number_for_an_issue[securities_treasury_stocks_traded_message_at] == securities_treasury_stocks_traded_message_written.a_designated_number_for_an_issue[securities_treasury_stocks_traded_message_at]); securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 11 -> assert(securities_treasury_stocks_traded_message_read.trading_price[securities_treasury_stocks_traded_message_at] == securities_treasury_stocks_traded_message_written.trading_price[securities_treasury_stocks_traded_message_at]); securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 10 -> assert(securities_treasury_stocks_traded_message_read.trading_volume[securities_treasury_stocks_traded_message_at] == securities_treasury_stocks_traded_message_written.trading_volume[securities_treasury_stocks_traded_message_at]); securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> assert(securities_treasury_stocks_traded_message_read.bid_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at] == securities_treasury_stocks_traded_message_written.bid_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at]); securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  securities_treasury_stocks_traded_message_at = 0;
  do
  :: securities_treasury_stocks_traded_message_at < 5 -> assert(securities_treasury_stocks_traded_message_read.ask_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at] == securities_treasury_stocks_traded_message_written.ask_treasury_stock_declaration_id[securities_treasury_stocks_traded_message_at]); securities_treasury_stocks_traded_message_at = securities_treasury_stocks_traded_message_at + 1
  :: else -> break
  od;
  assert(securities_treasury_stocks_traded_message_read.end_keyword == securities_treasury_stocks_traded_message_written.end_keyword);
  skip
}

/* ---- Securities Buy In Volume Message: 47 bytes ------------------------------ */

/* Buy-in Volume reference. */
typedef SecuritiesBuyInVolumeMessage {
  byte message_sequence_number[8];
  byte isin_code[12];
  byte transmission_date[8];
  byte buy_in_type_code;
  byte security_group_id[2];
  byte buy_in_volume[15];
  byte end_keyword
};

int securities_buy_in_volume_message_at;

/* every byte of Securities Buy In Volume Message set to one value */
inline fill_securities_buy_in_volume_message(securities_buy_in_volume_message_record, securities_buy_in_volume_message_value) {
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> securities_buy_in_volume_message_record.message_sequence_number[securities_buy_in_volume_message_at] = securities_buy_in_volume_message_value; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 12 -> securities_buy_in_volume_message_record.isin_code[securities_buy_in_volume_message_at] = securities_buy_in_volume_message_value; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> securities_buy_in_volume_message_record.transmission_date[securities_buy_in_volume_message_at] = securities_buy_in_volume_message_value; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_record.buy_in_type_code = securities_buy_in_volume_message_value;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 2 -> securities_buy_in_volume_message_record.security_group_id[securities_buy_in_volume_message_at] = securities_buy_in_volume_message_value; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 15 -> securities_buy_in_volume_message_record.buy_in_volume[securities_buy_in_volume_message_at] = securities_buy_in_volume_message_value; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_record.end_keyword = securities_buy_in_volume_message_value;
  skip
}

/* each byte of Securities Buy In Volume Message set to where it lies, so a field read out of place says so */
inline ramp_securities_buy_in_volume_message(securities_buy_in_volume_message_record, securities_buy_in_volume_message_base) {
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> securities_buy_in_volume_message_record.message_sequence_number[securities_buy_in_volume_message_at] = (securities_buy_in_volume_message_base + 0 + securities_buy_in_volume_message_at + 1) % 256; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 12 -> securities_buy_in_volume_message_record.isin_code[securities_buy_in_volume_message_at] = (securities_buy_in_volume_message_base + 8 + securities_buy_in_volume_message_at + 1) % 256; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> securities_buy_in_volume_message_record.transmission_date[securities_buy_in_volume_message_at] = (securities_buy_in_volume_message_base + 20 + securities_buy_in_volume_message_at + 1) % 256; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_record.buy_in_type_code = (securities_buy_in_volume_message_base + 28 + 1) % 256;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 2 -> securities_buy_in_volume_message_record.security_group_id[securities_buy_in_volume_message_at] = (securities_buy_in_volume_message_base + 29 + securities_buy_in_volume_message_at + 1) % 256; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 15 -> securities_buy_in_volume_message_record.buy_in_volume[securities_buy_in_volume_message_at] = (securities_buy_in_volume_message_base + 31 + securities_buy_in_volume_message_at + 1) % 256; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_record.end_keyword = (securities_buy_in_volume_message_base + 46 + 1) % 256;
  skip
}

/* Securities Buy In Volume Message to the wire, 47 bytes from where the cursor stands */
inline encode_securities_buy_in_volume_message(securities_buy_in_volume_message_record) {
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> wire[at] = securities_buy_in_volume_message_record.message_sequence_number[securities_buy_in_volume_message_at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 12 -> wire[at] = securities_buy_in_volume_message_record.isin_code[securities_buy_in_volume_message_at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> wire[at] = securities_buy_in_volume_message_record.transmission_date[securities_buy_in_volume_message_at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_buy_in_volume_message_record.buy_in_type_code; at = at + 1;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 2 -> wire[at] = securities_buy_in_volume_message_record.security_group_id[securities_buy_in_volume_message_at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 15 -> wire[at] = securities_buy_in_volume_message_record.buy_in_volume[securities_buy_in_volume_message_at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_buy_in_volume_message_record.end_keyword; at = at + 1;
  skip
}

/* Securities Buy In Volume Message off the wire, 47 bytes from where the cursor stands */
inline decode_securities_buy_in_volume_message(securities_buy_in_volume_message_record) {
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> securities_buy_in_volume_message_record.message_sequence_number[securities_buy_in_volume_message_at] = wire[at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 12 -> securities_buy_in_volume_message_record.isin_code[securities_buy_in_volume_message_at] = wire[at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> securities_buy_in_volume_message_record.transmission_date[securities_buy_in_volume_message_at] = wire[at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_record.buy_in_type_code = wire[at]; at = at + 1;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 2 -> securities_buy_in_volume_message_record.security_group_id[securities_buy_in_volume_message_at] = wire[at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 15 -> securities_buy_in_volume_message_record.buy_in_volume[securities_buy_in_volume_message_at] = wire[at]; at = at + 1; securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Buy In Volume Message is what was written, byte for byte */
inline equal_securities_buy_in_volume_message(securities_buy_in_volume_message_read, securities_buy_in_volume_message_written) {
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> assert(securities_buy_in_volume_message_read.message_sequence_number[securities_buy_in_volume_message_at] == securities_buy_in_volume_message_written.message_sequence_number[securities_buy_in_volume_message_at]); securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 12 -> assert(securities_buy_in_volume_message_read.isin_code[securities_buy_in_volume_message_at] == securities_buy_in_volume_message_written.isin_code[securities_buy_in_volume_message_at]); securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 8 -> assert(securities_buy_in_volume_message_read.transmission_date[securities_buy_in_volume_message_at] == securities_buy_in_volume_message_written.transmission_date[securities_buy_in_volume_message_at]); securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  assert(securities_buy_in_volume_message_read.buy_in_type_code == securities_buy_in_volume_message_written.buy_in_type_code);
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 2 -> assert(securities_buy_in_volume_message_read.security_group_id[securities_buy_in_volume_message_at] == securities_buy_in_volume_message_written.security_group_id[securities_buy_in_volume_message_at]); securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  securities_buy_in_volume_message_at = 0;
  do
  :: securities_buy_in_volume_message_at < 15 -> assert(securities_buy_in_volume_message_read.buy_in_volume[securities_buy_in_volume_message_at] == securities_buy_in_volume_message_written.buy_in_volume[securities_buy_in_volume_message_at]); securities_buy_in_volume_message_at = securities_buy_in_volume_message_at + 1
  :: else -> break
  od;
  assert(securities_buy_in_volume_message_read.end_keyword == securities_buy_in_volume_message_written.end_keyword);
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
    assert(at == 72);
    at = 0;
    decode_krx_index_message(krx_index_message_got);
    assert(at == 72);
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
    assert(at == 72);
    at = 0;
    decode_krx_estimated_index_message(krx_estimated_index_message_got);
    assert(at == 72);
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

/* Securities Investor Activities Per Industry Message: encoded, read back, and compared */
proctype check_securities_investor_activities_per_industry_message() {
  SecuritiesInvestorActivitiesPerIndustryMessage securities_investor_activities_per_industry_message_sent;
  SecuritiesInvestorActivitiesPerIndustryMessage securities_investor_activities_per_industry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_sent, 0)
  :: pattern == 1 -> fill_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_sent, 32)
  :: pattern == 2 -> fill_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_sent, 255)
  :: else -> ramp_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_sent);
    assert(at == 100);
    at = 0;
    decode_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_got);
    assert(at == 100);
    equal_securities_investor_activities_per_industry_message(securities_investor_activities_per_industry_message_got, securities_investor_activities_per_industry_message_sent)
  }
}

/* Securities Investor Activities Per Issue Eod Message: encoded, read back, and compared */
proctype check_securities_investor_activities_per_issue_eod_message() {
  SecuritiesInvestorActivitiesPerIssueEodMessage securities_investor_activities_per_issue_eod_message_sent;
  SecuritiesInvestorActivitiesPerIssueEodMessage securities_investor_activities_per_issue_eod_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_sent, 0)
  :: pattern == 1 -> fill_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_sent, 32)
  :: pattern == 2 -> fill_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_sent, 255)
  :: else -> ramp_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_sent);
    assert(at == 91);
    at = 0;
    decode_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_got);
    assert(at == 91);
    equal_securities_investor_activities_per_issue_eod_message(securities_investor_activities_per_issue_eod_message_got, securities_investor_activities_per_issue_eod_message_sent)
  }
}

/* Securities Investor Activities Per Commodities Message: encoded, read back, and compared */
proctype check_securities_investor_activities_per_commodities_message() {
  SecuritiesInvestorActivitiesPerCommoditiesMessage securities_investor_activities_per_commodities_message_sent;
  SecuritiesInvestorActivitiesPerCommoditiesMessage securities_investor_activities_per_commodities_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_sent, 0)
  :: pattern == 1 -> fill_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_sent, 32)
  :: pattern == 2 -> fill_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_sent, 255)
  :: else -> ramp_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_sent);
    assert(at == 79);
    at = 0;
    decode_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_got);
    assert(at == 79);
    equal_securities_investor_activities_per_commodities_message(securities_investor_activities_per_commodities_message_got, securities_investor_activities_per_commodities_message_sent)
  }
}

/* Securities Short Selling Message: encoded, read back, and compared */
proctype check_securities_short_selling_message() {
  SecuritiesShortSellingMessage securities_short_selling_message_sent;
  SecuritiesShortSellingMessage securities_short_selling_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_short_selling_message(securities_short_selling_message_sent, 0)
  :: pattern == 1 -> fill_securities_short_selling_message(securities_short_selling_message_sent, 32)
  :: pattern == 2 -> fill_securities_short_selling_message(securities_short_selling_message_sent, 255)
  :: else -> ramp_securities_short_selling_message(securities_short_selling_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_short_selling_message(securities_short_selling_message_sent);
    assert(at == 115);
    at = 0;
    decode_securities_short_selling_message(securities_short_selling_message_got);
    assert(at == 115);
    equal_securities_short_selling_message(securities_short_selling_message_got, securities_short_selling_message_sent)
  }
}

/* Securities Treasury Stocks Traded Message: encoded, read back, and compared */
proctype check_securities_treasury_stocks_traded_message() {
  SecuritiesTreasuryStocksTradedMessage securities_treasury_stocks_traded_message_sent;
  SecuritiesTreasuryStocksTradedMessage securities_treasury_stocks_traded_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_sent, 0)
  :: pattern == 1 -> fill_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_sent, 32)
  :: pattern == 2 -> fill_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_sent, 255)
  :: else -> ramp_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_sent);
    assert(at == 52);
    at = 0;
    decode_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_got);
    assert(at == 52);
    equal_securities_treasury_stocks_traded_message(securities_treasury_stocks_traded_message_got, securities_treasury_stocks_traded_message_sent)
  }
}

/* Securities Buy In Volume Message: encoded, read back, and compared */
proctype check_securities_buy_in_volume_message() {
  SecuritiesBuyInVolumeMessage securities_buy_in_volume_message_sent;
  SecuritiesBuyInVolumeMessage securities_buy_in_volume_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_buy_in_volume_message(securities_buy_in_volume_message_sent, 0)
  :: pattern == 1 -> fill_securities_buy_in_volume_message(securities_buy_in_volume_message_sent, 32)
  :: pattern == 2 -> fill_securities_buy_in_volume_message(securities_buy_in_volume_message_sent, 255)
  :: else -> ramp_securities_buy_in_volume_message(securities_buy_in_volume_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_buy_in_volume_message(securities_buy_in_volume_message_sent);
    assert(at == 47);
    at = 0;
    decode_securities_buy_in_volume_message(securities_buy_in_volume_message_got);
    assert(at == 47);
    equal_securities_buy_in_volume_message(securities_buy_in_volume_message_got, securities_buy_in_volume_message_sent)
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
  :: run check_securities_investor_activities_per_industry_message()
  :: run check_securities_investor_activities_per_issue_eod_message()
  :: run check_securities_investor_activities_per_commodities_message()
  :: run check_securities_short_selling_message()
  :: run check_securities_treasury_stocks_traded_message()
  :: run check_securities_buy_in_volume_message()
  fi
}
