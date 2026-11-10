/*
 * Athens Exchange Group Athens Exchange Securities Market Relaxed Channel
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
#define WIRE 699

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

/* ---- Apa Post Trade Message: 699 bytes --------------------------------------- */

/* Transmitted whenever a trade is reported to the Ids subsystem, for the Athex Apa post trade transparency service required by Mifid II */
typedef ApaPostTradeMessage {
  byte report_status[4];
  byte trading_date_and_time[20];
  byte trade_id_indicator;
  byte trade_id[52];
  byte venue[4];
  byte transaction_to_be_cleared;
  byte price_notation[4];
  byte price[18];
  byte price_currency[3];
  byte quantity[18];
  byte quantity_currency[3];
  byte notation_of_the_quantity_in_measurement_unit[25];
  byte quantity_in_measurement_unit[18];
  byte notional_amount[18];
  byte notional_currency[3];
  byte instrument_id_type[4];
  byte instrument_id[12];
  byte instrument_full_name[350];
  byte instrument_classification[6];
  byte price_multiplier[18];
  byte underlying_instrument_code[12];
  byte underlying_index_name[25];
  byte term_of_the_underlying_index[7];
  byte option_type[4];
  byte strike_price[18];
  byte strike_price_currency[3];
  byte strike_price_notation[4];
  byte option_exercise_style[4];
  byte maturity_date[8];
  byte expiry_date[8];
  byte delivery_type[4];
  byte type_emission_allowance[4];
  byte otc_post_trade_indicator[4];
  byte deferral_indicator;
  byte lmtf;
  byte fulf;
  byte datf;
  byte fula;
  byte volo;
  byte fulv;
  byte fwaf;
  byte fulj;
  byte idaf;
  byte volw;
  byte coaf
};

int apa_post_trade_message_at;

/* every byte of Apa Post Trade Message set to one value */
inline fill_apa_post_trade_message(apa_post_trade_message_record, apa_post_trade_message_value) {
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.report_status[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 20 -> apa_post_trade_message_record.trading_date_and_time[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_record.trade_id_indicator = apa_post_trade_message_value;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 52 -> apa_post_trade_message_record.trade_id[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.venue[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_record.transaction_to_be_cleared = apa_post_trade_message_value;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.price_notation[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.price[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.price_currency[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.quantity[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.quantity_currency[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> apa_post_trade_message_record.notation_of_the_quantity_in_measurement_unit[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.quantity_in_measurement_unit[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.notional_amount[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.notional_currency[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.instrument_id_type[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> apa_post_trade_message_record.instrument_id[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 350 -> apa_post_trade_message_record.instrument_full_name[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 6 -> apa_post_trade_message_record.instrument_classification[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.price_multiplier[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> apa_post_trade_message_record.underlying_instrument_code[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> apa_post_trade_message_record.underlying_index_name[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 7 -> apa_post_trade_message_record.term_of_the_underlying_index[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.option_type[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.strike_price[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.strike_price_currency[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.strike_price_notation[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.option_exercise_style[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> apa_post_trade_message_record.maturity_date[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> apa_post_trade_message_record.expiry_date[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.delivery_type[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.type_emission_allowance[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.otc_post_trade_indicator[apa_post_trade_message_at] = apa_post_trade_message_value; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_record.deferral_indicator = apa_post_trade_message_value;
  apa_post_trade_message_record.lmtf = apa_post_trade_message_value;
  apa_post_trade_message_record.fulf = apa_post_trade_message_value;
  apa_post_trade_message_record.datf = apa_post_trade_message_value;
  apa_post_trade_message_record.fula = apa_post_trade_message_value;
  apa_post_trade_message_record.volo = apa_post_trade_message_value;
  apa_post_trade_message_record.fulv = apa_post_trade_message_value;
  apa_post_trade_message_record.fwaf = apa_post_trade_message_value;
  apa_post_trade_message_record.fulj = apa_post_trade_message_value;
  apa_post_trade_message_record.idaf = apa_post_trade_message_value;
  apa_post_trade_message_record.volw = apa_post_trade_message_value;
  apa_post_trade_message_record.coaf = apa_post_trade_message_value;
  skip
}

/* each byte of Apa Post Trade Message set to where it lies, so a field read out of place says so */
inline ramp_apa_post_trade_message(apa_post_trade_message_record, apa_post_trade_message_base) {
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.report_status[apa_post_trade_message_at] = (apa_post_trade_message_base + 0 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 20 -> apa_post_trade_message_record.trading_date_and_time[apa_post_trade_message_at] = (apa_post_trade_message_base + 4 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_record.trade_id_indicator = (apa_post_trade_message_base + 24 + 1) % 256;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 52 -> apa_post_trade_message_record.trade_id[apa_post_trade_message_at] = (apa_post_trade_message_base + 25 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.venue[apa_post_trade_message_at] = (apa_post_trade_message_base + 77 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_record.transaction_to_be_cleared = (apa_post_trade_message_base + 81 + 1) % 256;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.price_notation[apa_post_trade_message_at] = (apa_post_trade_message_base + 82 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.price[apa_post_trade_message_at] = (apa_post_trade_message_base + 86 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.price_currency[apa_post_trade_message_at] = (apa_post_trade_message_base + 104 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.quantity[apa_post_trade_message_at] = (apa_post_trade_message_base + 107 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.quantity_currency[apa_post_trade_message_at] = (apa_post_trade_message_base + 125 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> apa_post_trade_message_record.notation_of_the_quantity_in_measurement_unit[apa_post_trade_message_at] = (apa_post_trade_message_base + 128 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.quantity_in_measurement_unit[apa_post_trade_message_at] = (apa_post_trade_message_base + 153 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.notional_amount[apa_post_trade_message_at] = (apa_post_trade_message_base + 171 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.notional_currency[apa_post_trade_message_at] = (apa_post_trade_message_base + 189 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.instrument_id_type[apa_post_trade_message_at] = (apa_post_trade_message_base + 192 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> apa_post_trade_message_record.instrument_id[apa_post_trade_message_at] = (apa_post_trade_message_base + 196 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 350 -> apa_post_trade_message_record.instrument_full_name[apa_post_trade_message_at] = (apa_post_trade_message_base + 208 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 6 -> apa_post_trade_message_record.instrument_classification[apa_post_trade_message_at] = (apa_post_trade_message_base + 558 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.price_multiplier[apa_post_trade_message_at] = (apa_post_trade_message_base + 564 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> apa_post_trade_message_record.underlying_instrument_code[apa_post_trade_message_at] = (apa_post_trade_message_base + 582 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> apa_post_trade_message_record.underlying_index_name[apa_post_trade_message_at] = (apa_post_trade_message_base + 594 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 7 -> apa_post_trade_message_record.term_of_the_underlying_index[apa_post_trade_message_at] = (apa_post_trade_message_base + 619 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.option_type[apa_post_trade_message_at] = (apa_post_trade_message_base + 626 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.strike_price[apa_post_trade_message_at] = (apa_post_trade_message_base + 630 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.strike_price_currency[apa_post_trade_message_at] = (apa_post_trade_message_base + 648 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.strike_price_notation[apa_post_trade_message_at] = (apa_post_trade_message_base + 651 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.option_exercise_style[apa_post_trade_message_at] = (apa_post_trade_message_base + 655 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> apa_post_trade_message_record.maturity_date[apa_post_trade_message_at] = (apa_post_trade_message_base + 659 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> apa_post_trade_message_record.expiry_date[apa_post_trade_message_at] = (apa_post_trade_message_base + 667 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.delivery_type[apa_post_trade_message_at] = (apa_post_trade_message_base + 675 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.type_emission_allowance[apa_post_trade_message_at] = (apa_post_trade_message_base + 679 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.otc_post_trade_indicator[apa_post_trade_message_at] = (apa_post_trade_message_base + 683 + apa_post_trade_message_at + 1) % 256; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_record.deferral_indicator = (apa_post_trade_message_base + 687 + 1) % 256;
  apa_post_trade_message_record.lmtf = (apa_post_trade_message_base + 688 + 1) % 256;
  apa_post_trade_message_record.fulf = (apa_post_trade_message_base + 689 + 1) % 256;
  apa_post_trade_message_record.datf = (apa_post_trade_message_base + 690 + 1) % 256;
  apa_post_trade_message_record.fula = (apa_post_trade_message_base + 691 + 1) % 256;
  apa_post_trade_message_record.volo = (apa_post_trade_message_base + 692 + 1) % 256;
  apa_post_trade_message_record.fulv = (apa_post_trade_message_base + 693 + 1) % 256;
  apa_post_trade_message_record.fwaf = (apa_post_trade_message_base + 694 + 1) % 256;
  apa_post_trade_message_record.fulj = (apa_post_trade_message_base + 695 + 1) % 256;
  apa_post_trade_message_record.idaf = (apa_post_trade_message_base + 696 + 1) % 256;
  apa_post_trade_message_record.volw = (apa_post_trade_message_base + 697 + 1) % 256;
  apa_post_trade_message_record.coaf = (apa_post_trade_message_base + 698 + 1) % 256;
  skip
}

/* Apa Post Trade Message to the wire, 699 bytes from where the cursor stands */
inline encode_apa_post_trade_message(apa_post_trade_message_record) {
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.report_status[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 20 -> wire[at] = apa_post_trade_message_record.trading_date_and_time[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_post_trade_message_record.trade_id_indicator; at = at + 1;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 52 -> wire[at] = apa_post_trade_message_record.trade_id[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.venue[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_post_trade_message_record.transaction_to_be_cleared; at = at + 1;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.price_notation[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> wire[at] = apa_post_trade_message_record.price[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> wire[at] = apa_post_trade_message_record.price_currency[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> wire[at] = apa_post_trade_message_record.quantity[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> wire[at] = apa_post_trade_message_record.quantity_currency[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> wire[at] = apa_post_trade_message_record.notation_of_the_quantity_in_measurement_unit[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> wire[at] = apa_post_trade_message_record.quantity_in_measurement_unit[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> wire[at] = apa_post_trade_message_record.notional_amount[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> wire[at] = apa_post_trade_message_record.notional_currency[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.instrument_id_type[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> wire[at] = apa_post_trade_message_record.instrument_id[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 350 -> wire[at] = apa_post_trade_message_record.instrument_full_name[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 6 -> wire[at] = apa_post_trade_message_record.instrument_classification[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> wire[at] = apa_post_trade_message_record.price_multiplier[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> wire[at] = apa_post_trade_message_record.underlying_instrument_code[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> wire[at] = apa_post_trade_message_record.underlying_index_name[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 7 -> wire[at] = apa_post_trade_message_record.term_of_the_underlying_index[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.option_type[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> wire[at] = apa_post_trade_message_record.strike_price[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> wire[at] = apa_post_trade_message_record.strike_price_currency[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.strike_price_notation[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.option_exercise_style[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> wire[at] = apa_post_trade_message_record.maturity_date[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> wire[at] = apa_post_trade_message_record.expiry_date[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.delivery_type[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.type_emission_allowance[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> wire[at] = apa_post_trade_message_record.otc_post_trade_indicator[apa_post_trade_message_at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_post_trade_message_record.deferral_indicator; at = at + 1;
  wire[at] = apa_post_trade_message_record.lmtf; at = at + 1;
  wire[at] = apa_post_trade_message_record.fulf; at = at + 1;
  wire[at] = apa_post_trade_message_record.datf; at = at + 1;
  wire[at] = apa_post_trade_message_record.fula; at = at + 1;
  wire[at] = apa_post_trade_message_record.volo; at = at + 1;
  wire[at] = apa_post_trade_message_record.fulv; at = at + 1;
  wire[at] = apa_post_trade_message_record.fwaf; at = at + 1;
  wire[at] = apa_post_trade_message_record.fulj; at = at + 1;
  wire[at] = apa_post_trade_message_record.idaf; at = at + 1;
  wire[at] = apa_post_trade_message_record.volw; at = at + 1;
  wire[at] = apa_post_trade_message_record.coaf; at = at + 1;
  skip
}

/* Apa Post Trade Message off the wire, 699 bytes from where the cursor stands */
inline decode_apa_post_trade_message(apa_post_trade_message_record) {
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.report_status[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 20 -> apa_post_trade_message_record.trading_date_and_time[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_record.trade_id_indicator = wire[at]; at = at + 1;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 52 -> apa_post_trade_message_record.trade_id[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.venue[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_record.transaction_to_be_cleared = wire[at]; at = at + 1;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.price_notation[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.price[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.price_currency[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.quantity[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.quantity_currency[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> apa_post_trade_message_record.notation_of_the_quantity_in_measurement_unit[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.quantity_in_measurement_unit[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.notional_amount[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.notional_currency[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.instrument_id_type[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> apa_post_trade_message_record.instrument_id[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 350 -> apa_post_trade_message_record.instrument_full_name[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 6 -> apa_post_trade_message_record.instrument_classification[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.price_multiplier[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> apa_post_trade_message_record.underlying_instrument_code[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> apa_post_trade_message_record.underlying_index_name[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 7 -> apa_post_trade_message_record.term_of_the_underlying_index[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.option_type[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> apa_post_trade_message_record.strike_price[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> apa_post_trade_message_record.strike_price_currency[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.strike_price_notation[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.option_exercise_style[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> apa_post_trade_message_record.maturity_date[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> apa_post_trade_message_record.expiry_date[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.delivery_type[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.type_emission_allowance[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> apa_post_trade_message_record.otc_post_trade_indicator[apa_post_trade_message_at] = wire[at]; at = at + 1; apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_record.deferral_indicator = wire[at]; at = at + 1;
  apa_post_trade_message_record.lmtf = wire[at]; at = at + 1;
  apa_post_trade_message_record.fulf = wire[at]; at = at + 1;
  apa_post_trade_message_record.datf = wire[at]; at = at + 1;
  apa_post_trade_message_record.fula = wire[at]; at = at + 1;
  apa_post_trade_message_record.volo = wire[at]; at = at + 1;
  apa_post_trade_message_record.fulv = wire[at]; at = at + 1;
  apa_post_trade_message_record.fwaf = wire[at]; at = at + 1;
  apa_post_trade_message_record.fulj = wire[at]; at = at + 1;
  apa_post_trade_message_record.idaf = wire[at]; at = at + 1;
  apa_post_trade_message_record.volw = wire[at]; at = at + 1;
  apa_post_trade_message_record.coaf = wire[at]; at = at + 1;
  skip
}

/* what was read of Apa Post Trade Message is what was written, byte for byte */
inline equal_apa_post_trade_message(apa_post_trade_message_read, apa_post_trade_message_written) {
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.report_status[apa_post_trade_message_at] == apa_post_trade_message_written.report_status[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 20 -> assert(apa_post_trade_message_read.trading_date_and_time[apa_post_trade_message_at] == apa_post_trade_message_written.trading_date_and_time[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  assert(apa_post_trade_message_read.trade_id_indicator == apa_post_trade_message_written.trade_id_indicator);
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 52 -> assert(apa_post_trade_message_read.trade_id[apa_post_trade_message_at] == apa_post_trade_message_written.trade_id[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.venue[apa_post_trade_message_at] == apa_post_trade_message_written.venue[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  assert(apa_post_trade_message_read.transaction_to_be_cleared == apa_post_trade_message_written.transaction_to_be_cleared);
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.price_notation[apa_post_trade_message_at] == apa_post_trade_message_written.price_notation[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> assert(apa_post_trade_message_read.price[apa_post_trade_message_at] == apa_post_trade_message_written.price[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> assert(apa_post_trade_message_read.price_currency[apa_post_trade_message_at] == apa_post_trade_message_written.price_currency[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> assert(apa_post_trade_message_read.quantity[apa_post_trade_message_at] == apa_post_trade_message_written.quantity[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> assert(apa_post_trade_message_read.quantity_currency[apa_post_trade_message_at] == apa_post_trade_message_written.quantity_currency[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> assert(apa_post_trade_message_read.notation_of_the_quantity_in_measurement_unit[apa_post_trade_message_at] == apa_post_trade_message_written.notation_of_the_quantity_in_measurement_unit[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> assert(apa_post_trade_message_read.quantity_in_measurement_unit[apa_post_trade_message_at] == apa_post_trade_message_written.quantity_in_measurement_unit[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> assert(apa_post_trade_message_read.notional_amount[apa_post_trade_message_at] == apa_post_trade_message_written.notional_amount[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> assert(apa_post_trade_message_read.notional_currency[apa_post_trade_message_at] == apa_post_trade_message_written.notional_currency[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.instrument_id_type[apa_post_trade_message_at] == apa_post_trade_message_written.instrument_id_type[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> assert(apa_post_trade_message_read.instrument_id[apa_post_trade_message_at] == apa_post_trade_message_written.instrument_id[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 350 -> assert(apa_post_trade_message_read.instrument_full_name[apa_post_trade_message_at] == apa_post_trade_message_written.instrument_full_name[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 6 -> assert(apa_post_trade_message_read.instrument_classification[apa_post_trade_message_at] == apa_post_trade_message_written.instrument_classification[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> assert(apa_post_trade_message_read.price_multiplier[apa_post_trade_message_at] == apa_post_trade_message_written.price_multiplier[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 12 -> assert(apa_post_trade_message_read.underlying_instrument_code[apa_post_trade_message_at] == apa_post_trade_message_written.underlying_instrument_code[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 25 -> assert(apa_post_trade_message_read.underlying_index_name[apa_post_trade_message_at] == apa_post_trade_message_written.underlying_index_name[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 7 -> assert(apa_post_trade_message_read.term_of_the_underlying_index[apa_post_trade_message_at] == apa_post_trade_message_written.term_of_the_underlying_index[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.option_type[apa_post_trade_message_at] == apa_post_trade_message_written.option_type[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 18 -> assert(apa_post_trade_message_read.strike_price[apa_post_trade_message_at] == apa_post_trade_message_written.strike_price[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 3 -> assert(apa_post_trade_message_read.strike_price_currency[apa_post_trade_message_at] == apa_post_trade_message_written.strike_price_currency[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.strike_price_notation[apa_post_trade_message_at] == apa_post_trade_message_written.strike_price_notation[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.option_exercise_style[apa_post_trade_message_at] == apa_post_trade_message_written.option_exercise_style[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> assert(apa_post_trade_message_read.maturity_date[apa_post_trade_message_at] == apa_post_trade_message_written.maturity_date[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 8 -> assert(apa_post_trade_message_read.expiry_date[apa_post_trade_message_at] == apa_post_trade_message_written.expiry_date[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.delivery_type[apa_post_trade_message_at] == apa_post_trade_message_written.delivery_type[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.type_emission_allowance[apa_post_trade_message_at] == apa_post_trade_message_written.type_emission_allowance[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  apa_post_trade_message_at = 0;
  do
  :: apa_post_trade_message_at < 4 -> assert(apa_post_trade_message_read.otc_post_trade_indicator[apa_post_trade_message_at] == apa_post_trade_message_written.otc_post_trade_indicator[apa_post_trade_message_at]); apa_post_trade_message_at = apa_post_trade_message_at + 1
  :: else -> break
  od;
  assert(apa_post_trade_message_read.deferral_indicator == apa_post_trade_message_written.deferral_indicator);
  assert(apa_post_trade_message_read.lmtf == apa_post_trade_message_written.lmtf);
  assert(apa_post_trade_message_read.fulf == apa_post_trade_message_written.fulf);
  assert(apa_post_trade_message_read.datf == apa_post_trade_message_written.datf);
  assert(apa_post_trade_message_read.fula == apa_post_trade_message_written.fula);
  assert(apa_post_trade_message_read.volo == apa_post_trade_message_written.volo);
  assert(apa_post_trade_message_read.fulv == apa_post_trade_message_written.fulv);
  assert(apa_post_trade_message_read.fwaf == apa_post_trade_message_written.fwaf);
  assert(apa_post_trade_message_read.fulj == apa_post_trade_message_written.fulj);
  assert(apa_post_trade_message_read.idaf == apa_post_trade_message_written.idaf);
  assert(apa_post_trade_message_read.volw == apa_post_trade_message_written.volw);
  assert(apa_post_trade_message_read.coaf == apa_post_trade_message_written.coaf);
  skip
}

/* ---- Apa Pre Trade Message: 699 bytes ---------------------------------------- */

/* Transmitted whenever a quote is reported to the Ids subsystem by the Athex Apa service, for the Athex Apa pre trade transparency service */
typedef ApaPreTradeMessage {
  byte report_status[4];
  byte quote_type;
  byte quote_id[52];
  byte event_time[20];
  byte quote_liquidity;
  byte venue_mic[4];
  byte submitting_entity_identification_code[20];
  byte price_notation[4];
  byte price[18];
  byte price_currency[3];
  byte quantity[18];
  byte quantity_currency[3];
  byte notation_of_the_quantity_in_measurement_unit[25];
  byte quantity_in_measurement_unit[18];
  byte notional_amount[18];
  byte notional_currency[3];
  byte instrument_id_type[4];
  byte instrument_id[12];
  byte instrument_full_name[350];
  byte instrument_classification[6];
  byte price_multiplier[18];
  byte underlying_instrument_code[12];
  byte underlying_index_name[25];
  byte term_of_the_underlying_index[7];
  byte option_type[4];
  byte strike_price[18];
  byte strike_price_currency[3];
  byte strike_price_notation[4];
  byte option_exercise_style[4];
  byte maturity_date[8];
  byte expiry_date[8];
  byte delivery_type[4]
};

int apa_pre_trade_message_at;

/* every byte of Apa Pre Trade Message set to one value */
inline fill_apa_pre_trade_message(apa_pre_trade_message_record, apa_pre_trade_message_value) {
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.report_status[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_record.quote_type = apa_pre_trade_message_value;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 52 -> apa_pre_trade_message_record.quote_id[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> apa_pre_trade_message_record.event_time[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_record.quote_liquidity = apa_pre_trade_message_value;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.venue_mic[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> apa_pre_trade_message_record.submitting_entity_identification_code[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.price_notation[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.price[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.price_currency[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.quantity[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.quantity_currency[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> apa_pre_trade_message_record.notation_of_the_quantity_in_measurement_unit[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.quantity_in_measurement_unit[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.notional_amount[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.notional_currency[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.instrument_id_type[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> apa_pre_trade_message_record.instrument_id[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 350 -> apa_pre_trade_message_record.instrument_full_name[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 6 -> apa_pre_trade_message_record.instrument_classification[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.price_multiplier[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> apa_pre_trade_message_record.underlying_instrument_code[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> apa_pre_trade_message_record.underlying_index_name[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 7 -> apa_pre_trade_message_record.term_of_the_underlying_index[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.option_type[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.strike_price[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.strike_price_currency[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.strike_price_notation[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.option_exercise_style[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> apa_pre_trade_message_record.maturity_date[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> apa_pre_trade_message_record.expiry_date[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.delivery_type[apa_pre_trade_message_at] = apa_pre_trade_message_value; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Apa Pre Trade Message set to where it lies, so a field read out of place says so */
inline ramp_apa_pre_trade_message(apa_pre_trade_message_record, apa_pre_trade_message_base) {
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.report_status[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 0 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_record.quote_type = (apa_pre_trade_message_base + 4 + 1) % 256;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 52 -> apa_pre_trade_message_record.quote_id[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 5 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> apa_pre_trade_message_record.event_time[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 57 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_record.quote_liquidity = (apa_pre_trade_message_base + 77 + 1) % 256;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.venue_mic[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 78 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> apa_pre_trade_message_record.submitting_entity_identification_code[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 82 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.price_notation[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 102 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.price[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 106 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.price_currency[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 124 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.quantity[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 127 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.quantity_currency[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 145 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> apa_pre_trade_message_record.notation_of_the_quantity_in_measurement_unit[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 148 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.quantity_in_measurement_unit[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 173 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.notional_amount[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 191 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.notional_currency[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 209 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.instrument_id_type[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 212 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> apa_pre_trade_message_record.instrument_id[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 216 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 350 -> apa_pre_trade_message_record.instrument_full_name[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 228 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 6 -> apa_pre_trade_message_record.instrument_classification[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 578 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.price_multiplier[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 584 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> apa_pre_trade_message_record.underlying_instrument_code[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 602 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> apa_pre_trade_message_record.underlying_index_name[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 614 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 7 -> apa_pre_trade_message_record.term_of_the_underlying_index[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 639 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.option_type[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 646 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.strike_price[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 650 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.strike_price_currency[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 668 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.strike_price_notation[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 671 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.option_exercise_style[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 675 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> apa_pre_trade_message_record.maturity_date[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 679 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> apa_pre_trade_message_record.expiry_date[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 687 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.delivery_type[apa_pre_trade_message_at] = (apa_pre_trade_message_base + 695 + apa_pre_trade_message_at + 1) % 256; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Apa Pre Trade Message to the wire, 699 bytes from where the cursor stands */
inline encode_apa_pre_trade_message(apa_pre_trade_message_record) {
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> wire[at] = apa_pre_trade_message_record.report_status[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_pre_trade_message_record.quote_type; at = at + 1;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 52 -> wire[at] = apa_pre_trade_message_record.quote_id[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> wire[at] = apa_pre_trade_message_record.event_time[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_pre_trade_message_record.quote_liquidity; at = at + 1;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> wire[at] = apa_pre_trade_message_record.venue_mic[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> wire[at] = apa_pre_trade_message_record.submitting_entity_identification_code[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> wire[at] = apa_pre_trade_message_record.price_notation[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> wire[at] = apa_pre_trade_message_record.price[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> wire[at] = apa_pre_trade_message_record.price_currency[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> wire[at] = apa_pre_trade_message_record.quantity[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> wire[at] = apa_pre_trade_message_record.quantity_currency[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> wire[at] = apa_pre_trade_message_record.notation_of_the_quantity_in_measurement_unit[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> wire[at] = apa_pre_trade_message_record.quantity_in_measurement_unit[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> wire[at] = apa_pre_trade_message_record.notional_amount[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> wire[at] = apa_pre_trade_message_record.notional_currency[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> wire[at] = apa_pre_trade_message_record.instrument_id_type[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> wire[at] = apa_pre_trade_message_record.instrument_id[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 350 -> wire[at] = apa_pre_trade_message_record.instrument_full_name[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 6 -> wire[at] = apa_pre_trade_message_record.instrument_classification[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> wire[at] = apa_pre_trade_message_record.price_multiplier[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> wire[at] = apa_pre_trade_message_record.underlying_instrument_code[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> wire[at] = apa_pre_trade_message_record.underlying_index_name[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 7 -> wire[at] = apa_pre_trade_message_record.term_of_the_underlying_index[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> wire[at] = apa_pre_trade_message_record.option_type[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> wire[at] = apa_pre_trade_message_record.strike_price[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> wire[at] = apa_pre_trade_message_record.strike_price_currency[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> wire[at] = apa_pre_trade_message_record.strike_price_notation[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> wire[at] = apa_pre_trade_message_record.option_exercise_style[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> wire[at] = apa_pre_trade_message_record.maturity_date[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> wire[at] = apa_pre_trade_message_record.expiry_date[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> wire[at] = apa_pre_trade_message_record.delivery_type[apa_pre_trade_message_at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Apa Pre Trade Message off the wire, 699 bytes from where the cursor stands */
inline decode_apa_pre_trade_message(apa_pre_trade_message_record) {
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.report_status[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_record.quote_type = wire[at]; at = at + 1;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 52 -> apa_pre_trade_message_record.quote_id[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> apa_pre_trade_message_record.event_time[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_record.quote_liquidity = wire[at]; at = at + 1;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.venue_mic[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> apa_pre_trade_message_record.submitting_entity_identification_code[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.price_notation[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.price[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.price_currency[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.quantity[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.quantity_currency[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> apa_pre_trade_message_record.notation_of_the_quantity_in_measurement_unit[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.quantity_in_measurement_unit[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.notional_amount[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.notional_currency[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.instrument_id_type[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> apa_pre_trade_message_record.instrument_id[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 350 -> apa_pre_trade_message_record.instrument_full_name[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 6 -> apa_pre_trade_message_record.instrument_classification[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.price_multiplier[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> apa_pre_trade_message_record.underlying_instrument_code[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> apa_pre_trade_message_record.underlying_index_name[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 7 -> apa_pre_trade_message_record.term_of_the_underlying_index[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.option_type[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> apa_pre_trade_message_record.strike_price[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> apa_pre_trade_message_record.strike_price_currency[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.strike_price_notation[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.option_exercise_style[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> apa_pre_trade_message_record.maturity_date[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> apa_pre_trade_message_record.expiry_date[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> apa_pre_trade_message_record.delivery_type[apa_pre_trade_message_at] = wire[at]; at = at + 1; apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Apa Pre Trade Message is what was written, byte for byte */
inline equal_apa_pre_trade_message(apa_pre_trade_message_read, apa_pre_trade_message_written) {
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> assert(apa_pre_trade_message_read.report_status[apa_pre_trade_message_at] == apa_pre_trade_message_written.report_status[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  assert(apa_pre_trade_message_read.quote_type == apa_pre_trade_message_written.quote_type);
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 52 -> assert(apa_pre_trade_message_read.quote_id[apa_pre_trade_message_at] == apa_pre_trade_message_written.quote_id[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> assert(apa_pre_trade_message_read.event_time[apa_pre_trade_message_at] == apa_pre_trade_message_written.event_time[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  assert(apa_pre_trade_message_read.quote_liquidity == apa_pre_trade_message_written.quote_liquidity);
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> assert(apa_pre_trade_message_read.venue_mic[apa_pre_trade_message_at] == apa_pre_trade_message_written.venue_mic[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 20 -> assert(apa_pre_trade_message_read.submitting_entity_identification_code[apa_pre_trade_message_at] == apa_pre_trade_message_written.submitting_entity_identification_code[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> assert(apa_pre_trade_message_read.price_notation[apa_pre_trade_message_at] == apa_pre_trade_message_written.price_notation[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> assert(apa_pre_trade_message_read.price[apa_pre_trade_message_at] == apa_pre_trade_message_written.price[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> assert(apa_pre_trade_message_read.price_currency[apa_pre_trade_message_at] == apa_pre_trade_message_written.price_currency[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> assert(apa_pre_trade_message_read.quantity[apa_pre_trade_message_at] == apa_pre_trade_message_written.quantity[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> assert(apa_pre_trade_message_read.quantity_currency[apa_pre_trade_message_at] == apa_pre_trade_message_written.quantity_currency[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> assert(apa_pre_trade_message_read.notation_of_the_quantity_in_measurement_unit[apa_pre_trade_message_at] == apa_pre_trade_message_written.notation_of_the_quantity_in_measurement_unit[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> assert(apa_pre_trade_message_read.quantity_in_measurement_unit[apa_pre_trade_message_at] == apa_pre_trade_message_written.quantity_in_measurement_unit[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> assert(apa_pre_trade_message_read.notional_amount[apa_pre_trade_message_at] == apa_pre_trade_message_written.notional_amount[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> assert(apa_pre_trade_message_read.notional_currency[apa_pre_trade_message_at] == apa_pre_trade_message_written.notional_currency[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> assert(apa_pre_trade_message_read.instrument_id_type[apa_pre_trade_message_at] == apa_pre_trade_message_written.instrument_id_type[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> assert(apa_pre_trade_message_read.instrument_id[apa_pre_trade_message_at] == apa_pre_trade_message_written.instrument_id[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 350 -> assert(apa_pre_trade_message_read.instrument_full_name[apa_pre_trade_message_at] == apa_pre_trade_message_written.instrument_full_name[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 6 -> assert(apa_pre_trade_message_read.instrument_classification[apa_pre_trade_message_at] == apa_pre_trade_message_written.instrument_classification[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> assert(apa_pre_trade_message_read.price_multiplier[apa_pre_trade_message_at] == apa_pre_trade_message_written.price_multiplier[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 12 -> assert(apa_pre_trade_message_read.underlying_instrument_code[apa_pre_trade_message_at] == apa_pre_trade_message_written.underlying_instrument_code[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 25 -> assert(apa_pre_trade_message_read.underlying_index_name[apa_pre_trade_message_at] == apa_pre_trade_message_written.underlying_index_name[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 7 -> assert(apa_pre_trade_message_read.term_of_the_underlying_index[apa_pre_trade_message_at] == apa_pre_trade_message_written.term_of_the_underlying_index[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> assert(apa_pre_trade_message_read.option_type[apa_pre_trade_message_at] == apa_pre_trade_message_written.option_type[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 18 -> assert(apa_pre_trade_message_read.strike_price[apa_pre_trade_message_at] == apa_pre_trade_message_written.strike_price[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 3 -> assert(apa_pre_trade_message_read.strike_price_currency[apa_pre_trade_message_at] == apa_pre_trade_message_written.strike_price_currency[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> assert(apa_pre_trade_message_read.strike_price_notation[apa_pre_trade_message_at] == apa_pre_trade_message_written.strike_price_notation[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> assert(apa_pre_trade_message_read.option_exercise_style[apa_pre_trade_message_at] == apa_pre_trade_message_written.option_exercise_style[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> assert(apa_pre_trade_message_read.maturity_date[apa_pre_trade_message_at] == apa_pre_trade_message_written.maturity_date[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 8 -> assert(apa_pre_trade_message_read.expiry_date[apa_pre_trade_message_at] == apa_pre_trade_message_written.expiry_date[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
  :: else -> break
  od;
  apa_pre_trade_message_at = 0;
  do
  :: apa_pre_trade_message_at < 4 -> assert(apa_pre_trade_message_read.delivery_type[apa_pre_trade_message_at] == apa_pre_trade_message_written.delivery_type[apa_pre_trade_message_at]); apa_pre_trade_message_at = apa_pre_trade_message_at + 1
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

/* Apa Post Trade Message: encoded, read back, and compared */
proctype check_apa_post_trade_message() {
  ApaPostTradeMessage apa_post_trade_message_sent;
  ApaPostTradeMessage apa_post_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_apa_post_trade_message(apa_post_trade_message_sent, 0)
  :: pattern == 1 -> fill_apa_post_trade_message(apa_post_trade_message_sent, 32)
  :: pattern == 2 -> fill_apa_post_trade_message(apa_post_trade_message_sent, 255)
  :: else -> ramp_apa_post_trade_message(apa_post_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_apa_post_trade_message(apa_post_trade_message_sent);
    assert(at == 699);
    at = 0;
    decode_apa_post_trade_message(apa_post_trade_message_got);
    assert(at == 699);
    equal_apa_post_trade_message(apa_post_trade_message_got, apa_post_trade_message_sent)
  }
}

/* Apa Pre Trade Message: encoded, read back, and compared */
proctype check_apa_pre_trade_message() {
  ApaPreTradeMessage apa_pre_trade_message_sent;
  ApaPreTradeMessage apa_pre_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_apa_pre_trade_message(apa_pre_trade_message_sent, 0)
  :: pattern == 1 -> fill_apa_pre_trade_message(apa_pre_trade_message_sent, 32)
  :: pattern == 2 -> fill_apa_pre_trade_message(apa_pre_trade_message_sent, 255)
  :: else -> ramp_apa_pre_trade_message(apa_pre_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_apa_pre_trade_message(apa_pre_trade_message_sent);
    assert(at == 699);
    at = 0;
    decode_apa_pre_trade_message(apa_pre_trade_message_got);
    assert(at == 699);
    equal_apa_pre_trade_message(apa_pre_trade_message_got, apa_pre_trade_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_apa_post_trade_message()
  :: run check_apa_pre_trade_message()
  fi
}
