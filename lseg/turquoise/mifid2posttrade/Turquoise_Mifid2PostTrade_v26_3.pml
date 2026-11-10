/*
 * London Stock Exchange MiFID II Post Trade
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 307

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Unit Header: 8 bytes ---------------------------------------------------- */

typedef UnitHeader {
  byte length[2];
  byte message_count;
  byte market_data_group;
  byte sequence_number[4]
};

int unit_header_at;

/* every byte of Unit Header set to one value */
inline fill_unit_header(unit_header_record, unit_header_value) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> unit_header_record.length[unit_header_at] = unit_header_value; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  unit_header_record.message_count = unit_header_value;
  unit_header_record.market_data_group = unit_header_value;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> unit_header_record.sequence_number[unit_header_at] = unit_header_value; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unit Header set to where it lies, so a field read out of place says so */
inline ramp_unit_header(unit_header_record, unit_header_base) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> unit_header_record.length[unit_header_at] = (unit_header_base + 0 + unit_header_at + 1) % 256; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  unit_header_record.message_count = (unit_header_base + 2 + 1) % 256;
  unit_header_record.market_data_group = (unit_header_base + 3 + 1) % 256;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> unit_header_record.sequence_number[unit_header_at] = (unit_header_base + 4 + unit_header_at + 1) % 256; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Header to the wire, 8 bytes from where the cursor stands */
inline encode_unit_header(unit_header_record) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> wire[at] = unit_header_record.length[unit_header_at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  wire[at] = unit_header_record.message_count; at = at + 1;
  wire[at] = unit_header_record.market_data_group; at = at + 1;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> wire[at] = unit_header_record.sequence_number[unit_header_at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Header off the wire, 8 bytes from where the cursor stands */
inline decode_unit_header(unit_header_record) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> unit_header_record.length[unit_header_at] = wire[at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  unit_header_record.message_count = wire[at]; at = at + 1;
  unit_header_record.market_data_group = wire[at]; at = at + 1;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> unit_header_record.sequence_number[unit_header_at] = wire[at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unit Header is what was written, byte for byte */
inline equal_unit_header(unit_header_read, unit_header_written) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> assert(unit_header_read.length[unit_header_at] == unit_header_written.length[unit_header_at]); unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  assert(unit_header_read.message_count == unit_header_written.message_count);
  assert(unit_header_read.market_data_group == unit_header_written.market_data_group);
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> assert(unit_header_read.sequence_number[unit_header_at] == unit_header_written.sequence_number[unit_header_at]); unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Gtp Udp Message Header */
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

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* Sent to indicate the start and end of the day. */
typedef SystemEventMessage {
  byte timestamp[8];
  byte event_code;
  byte source_venue[2]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.source_venue[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.source_venue[system_event_message_at] = (system_event_message_base + 9 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.source_venue[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.source_venue[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.source_venue[system_event_message_at] == system_event_message_written.source_venue[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Status Message: 27 bytes ------------------------------------- */

/* Used to communicate scheduled and unscheduled session changes */
typedef InstrumentStatusMessage {
  byte timestamp[8];
  byte instrument[8];
  byte source_venue[2];
  byte trading_status;
  byte session_change_reason;
  byte new_end_time[6];
  byte order_book_type
};

int instrument_status_message_at;

/* every byte of Instrument Status Message set to one value */
inline fill_instrument_status_message(instrument_status_message_record, instrument_status_message_value) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.timestamp[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.instrument[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> instrument_status_message_record.source_venue[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.trading_status = instrument_status_message_value;
  instrument_status_message_record.session_change_reason = instrument_status_message_value;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> instrument_status_message_record.new_end_time[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.order_book_type = instrument_status_message_value;
  skip
}

/* each byte of Instrument Status Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_status_message(instrument_status_message_record, instrument_status_message_base) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.timestamp[instrument_status_message_at] = (instrument_status_message_base + 0 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.instrument[instrument_status_message_at] = (instrument_status_message_base + 8 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> instrument_status_message_record.source_venue[instrument_status_message_at] = (instrument_status_message_base + 16 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.trading_status = (instrument_status_message_base + 18 + 1) % 256;
  instrument_status_message_record.session_change_reason = (instrument_status_message_base + 19 + 1) % 256;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> instrument_status_message_record.new_end_time[instrument_status_message_at] = (instrument_status_message_base + 20 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.order_book_type = (instrument_status_message_base + 26 + 1) % 256;
  skip
}

/* Instrument Status Message to the wire, 27 bytes from where the cursor stands */
inline encode_instrument_status_message(instrument_status_message_record) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> wire[at] = instrument_status_message_record.timestamp[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> wire[at] = instrument_status_message_record.instrument[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> wire[at] = instrument_status_message_record.source_venue[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_status_message_record.trading_status; at = at + 1;
  wire[at] = instrument_status_message_record.session_change_reason; at = at + 1;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> wire[at] = instrument_status_message_record.new_end_time[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_status_message_record.order_book_type; at = at + 1;
  skip
}

/* Instrument Status Message off the wire, 27 bytes from where the cursor stands */
inline decode_instrument_status_message(instrument_status_message_record) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.timestamp[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.instrument[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> instrument_status_message_record.source_venue[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.trading_status = wire[at]; at = at + 1;
  instrument_status_message_record.session_change_reason = wire[at]; at = at + 1;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> instrument_status_message_record.new_end_time[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.order_book_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Status Message is what was written, byte for byte */
inline equal_instrument_status_message(instrument_status_message_read, instrument_status_message_written) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> assert(instrument_status_message_read.timestamp[instrument_status_message_at] == instrument_status_message_written.timestamp[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> assert(instrument_status_message_read.instrument[instrument_status_message_at] == instrument_status_message_written.instrument[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> assert(instrument_status_message_read.source_venue[instrument_status_message_at] == instrument_status_message_written.source_venue[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  assert(instrument_status_message_read.trading_status == instrument_status_message_written.trading_status);
  assert(instrument_status_message_read.session_change_reason == instrument_status_message_written.session_change_reason);
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> assert(instrument_status_message_read.new_end_time[instrument_status_message_at] == instrument_status_message_written.new_end_time[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  assert(instrument_status_message_read.order_book_type == instrument_status_message_written.order_book_type);
  skip
}

/* ---- Mifid Ii Trade Message: 289 bytes --------------------------------------- */

/* Sent to represent different types of MiFID compliant trades published by markets */
typedef MifidIiTradeMessage {
  byte timestamp[8];
  byte source_venue[2];
  byte instrument[8];
  byte transaction_identification_code[52];
  byte trade_type;
  byte auction_type;
  byte mi_fid_price[20];
  byte mi_fid_quantity[20];
  byte trading_date_and_time[30];
  byte instrument_identification_code_type[4];
  byte instrument_identification_code[12];
  byte price_notation[4];
  byte price_major_currency[3];
  byte notional_amount[20];
  byte notional_currency[3];
  byte venue_of_execution[4];
  byte publication_date_and_time[30];
  byte pt_ref_price_waiver_flag[4];
  byte trading_system[4];
  byte market_closing_price_flag[4];
  byte pt_algo_trade[4];
  byte pt_cancellation_flag[4];
  byte pt_amendment_flag[4];
  byte reserved_1;
  byte reserved_3[3];
  byte reserved_20[20];
  byte reserved_4[4];
  byte trade_qualifier;
  byte market_mechanism;
  byte trading_mode;
  byte transaction_category;
  byte negotiation_indicator;
  byte agency_cross_indicator;
  byte modification_indicator;
  byte reference_price_indicator;
  byte special_dividend_indicator;
  byte off_book_automated_indicator;
  byte price_formation_indicator;
  byte algorithmic_indicator;
  byte post_trade_deferral_reason;
  byte deferral_enrichment_type;
  byte duplicative_indicator
};

int mifid_ii_trade_message_at;

/* every byte of Mifid Ii Trade Message set to one value */
inline fill_mifid_ii_trade_message(mifid_ii_trade_message_record, mifid_ii_trade_message_value) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.timestamp[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> mifid_ii_trade_message_record.source_venue[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.instrument[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> mifid_ii_trade_message_record.transaction_identification_code[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_type = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.auction_type = mifid_ii_trade_message_value;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_price[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_quantity[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> mifid_ii_trade_message_record.trading_date_and_time[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.instrument_identification_code_type[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> mifid_ii_trade_message_record.instrument_identification_code[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.price_notation[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.price_major_currency[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.notional_amount[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.notional_currency[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.venue_of_execution[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> mifid_ii_trade_message_record.publication_date_and_time[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_ref_price_waiver_flag[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.trading_system[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.market_closing_price_flag[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_algo_trade[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_cancellation_flag[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_amendment_flag[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.reserved_1 = mifid_ii_trade_message_value;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.reserved_3[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.reserved_20[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.reserved_4[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_qualifier = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.market_mechanism = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.trading_mode = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.transaction_category = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.negotiation_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.agency_cross_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.modification_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.reference_price_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.special_dividend_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.off_book_automated_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.price_formation_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.algorithmic_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.post_trade_deferral_reason = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.deferral_enrichment_type = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.duplicative_indicator = mifid_ii_trade_message_value;
  skip
}

/* each byte of Mifid Ii Trade Message set to where it lies, so a field read out of place says so */
inline ramp_mifid_ii_trade_message(mifid_ii_trade_message_record, mifid_ii_trade_message_base) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.timestamp[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 0 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> mifid_ii_trade_message_record.source_venue[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 8 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.instrument[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 10 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> mifid_ii_trade_message_record.transaction_identification_code[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 18 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_type = (mifid_ii_trade_message_base + 70 + 1) % 256;
  mifid_ii_trade_message_record.auction_type = (mifid_ii_trade_message_base + 71 + 1) % 256;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_price[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 72 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_quantity[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 92 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> mifid_ii_trade_message_record.trading_date_and_time[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 112 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.instrument_identification_code_type[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 142 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> mifid_ii_trade_message_record.instrument_identification_code[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 146 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.price_notation[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 158 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.price_major_currency[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 162 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.notional_amount[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 165 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.notional_currency[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 185 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.venue_of_execution[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 188 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> mifid_ii_trade_message_record.publication_date_and_time[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 192 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_ref_price_waiver_flag[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 222 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.trading_system[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 226 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.market_closing_price_flag[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 230 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_algo_trade[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 234 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_cancellation_flag[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 238 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_amendment_flag[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 242 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.reserved_1 = (mifid_ii_trade_message_base + 246 + 1) % 256;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.reserved_3[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 247 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.reserved_20[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 250 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.reserved_4[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 270 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_qualifier = (mifid_ii_trade_message_base + 274 + 1) % 256;
  mifid_ii_trade_message_record.market_mechanism = (mifid_ii_trade_message_base + 275 + 1) % 256;
  mifid_ii_trade_message_record.trading_mode = (mifid_ii_trade_message_base + 276 + 1) % 256;
  mifid_ii_trade_message_record.transaction_category = (mifid_ii_trade_message_base + 277 + 1) % 256;
  mifid_ii_trade_message_record.negotiation_indicator = (mifid_ii_trade_message_base + 278 + 1) % 256;
  mifid_ii_trade_message_record.agency_cross_indicator = (mifid_ii_trade_message_base + 279 + 1) % 256;
  mifid_ii_trade_message_record.modification_indicator = (mifid_ii_trade_message_base + 280 + 1) % 256;
  mifid_ii_trade_message_record.reference_price_indicator = (mifid_ii_trade_message_base + 281 + 1) % 256;
  mifid_ii_trade_message_record.special_dividend_indicator = (mifid_ii_trade_message_base + 282 + 1) % 256;
  mifid_ii_trade_message_record.off_book_automated_indicator = (mifid_ii_trade_message_base + 283 + 1) % 256;
  mifid_ii_trade_message_record.price_formation_indicator = (mifid_ii_trade_message_base + 284 + 1) % 256;
  mifid_ii_trade_message_record.algorithmic_indicator = (mifid_ii_trade_message_base + 285 + 1) % 256;
  mifid_ii_trade_message_record.post_trade_deferral_reason = (mifid_ii_trade_message_base + 286 + 1) % 256;
  mifid_ii_trade_message_record.deferral_enrichment_type = (mifid_ii_trade_message_base + 287 + 1) % 256;
  mifid_ii_trade_message_record.duplicative_indicator = (mifid_ii_trade_message_base + 288 + 1) % 256;
  skip
}

/* Mifid Ii Trade Message to the wire, 289 bytes from where the cursor stands */
inline encode_mifid_ii_trade_message(mifid_ii_trade_message_record) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> wire[at] = mifid_ii_trade_message_record.timestamp[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> wire[at] = mifid_ii_trade_message_record.source_venue[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> wire[at] = mifid_ii_trade_message_record.instrument[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> wire[at] = mifid_ii_trade_message_record.transaction_identification_code[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_message_record.trade_type; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.auction_type; at = at + 1;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> wire[at] = mifid_ii_trade_message_record.mi_fid_price[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> wire[at] = mifid_ii_trade_message_record.mi_fid_quantity[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> wire[at] = mifid_ii_trade_message_record.trading_date_and_time[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.instrument_identification_code_type[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> wire[at] = mifid_ii_trade_message_record.instrument_identification_code[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.price_notation[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> wire[at] = mifid_ii_trade_message_record.price_major_currency[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> wire[at] = mifid_ii_trade_message_record.notional_amount[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> wire[at] = mifid_ii_trade_message_record.notional_currency[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.venue_of_execution[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> wire[at] = mifid_ii_trade_message_record.publication_date_and_time[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.pt_ref_price_waiver_flag[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.trading_system[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.market_closing_price_flag[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.pt_algo_trade[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.pt_cancellation_flag[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.pt_amendment_flag[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_message_record.reserved_1; at = at + 1;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> wire[at] = mifid_ii_trade_message_record.reserved_3[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> wire[at] = mifid_ii_trade_message_record.reserved_20[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.reserved_4[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_message_record.trade_qualifier; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.market_mechanism; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.trading_mode; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.transaction_category; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.negotiation_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.agency_cross_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.modification_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.reference_price_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.special_dividend_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.off_book_automated_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.price_formation_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.algorithmic_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.post_trade_deferral_reason; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.deferral_enrichment_type; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.duplicative_indicator; at = at + 1;
  skip
}

/* Mifid Ii Trade Message off the wire, 289 bytes from where the cursor stands */
inline decode_mifid_ii_trade_message(mifid_ii_trade_message_record) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.timestamp[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> mifid_ii_trade_message_record.source_venue[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.instrument[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> mifid_ii_trade_message_record.transaction_identification_code[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_type = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.auction_type = wire[at]; at = at + 1;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_price[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_quantity[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> mifid_ii_trade_message_record.trading_date_and_time[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.instrument_identification_code_type[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> mifid_ii_trade_message_record.instrument_identification_code[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.price_notation[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.price_major_currency[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.notional_amount[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.notional_currency[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.venue_of_execution[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> mifid_ii_trade_message_record.publication_date_and_time[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_ref_price_waiver_flag[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.trading_system[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.market_closing_price_flag[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_algo_trade[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_cancellation_flag[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_amendment_flag[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.reserved_1 = wire[at]; at = at + 1;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.reserved_3[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.reserved_20[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.reserved_4[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_qualifier = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.market_mechanism = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.trading_mode = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.transaction_category = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.negotiation_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.agency_cross_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.modification_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.reference_price_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.special_dividend_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.off_book_automated_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.price_formation_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.algorithmic_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.post_trade_deferral_reason = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.deferral_enrichment_type = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.duplicative_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Mifid Ii Trade Message is what was written, byte for byte */
inline equal_mifid_ii_trade_message(mifid_ii_trade_message_read, mifid_ii_trade_message_written) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> assert(mifid_ii_trade_message_read.timestamp[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.timestamp[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> assert(mifid_ii_trade_message_read.source_venue[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.source_venue[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> assert(mifid_ii_trade_message_read.instrument[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.instrument[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> assert(mifid_ii_trade_message_read.transaction_identification_code[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.transaction_identification_code[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_message_read.trade_type == mifid_ii_trade_message_written.trade_type);
  assert(mifid_ii_trade_message_read.auction_type == mifid_ii_trade_message_written.auction_type);
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> assert(mifid_ii_trade_message_read.mi_fid_price[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.mi_fid_price[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> assert(mifid_ii_trade_message_read.mi_fid_quantity[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.mi_fid_quantity[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> assert(mifid_ii_trade_message_read.trading_date_and_time[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.trading_date_and_time[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.instrument_identification_code_type[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.instrument_identification_code_type[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> assert(mifid_ii_trade_message_read.instrument_identification_code[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.instrument_identification_code[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.price_notation[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.price_notation[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> assert(mifid_ii_trade_message_read.price_major_currency[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.price_major_currency[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> assert(mifid_ii_trade_message_read.notional_amount[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.notional_amount[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> assert(mifid_ii_trade_message_read.notional_currency[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.notional_currency[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.venue_of_execution[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.venue_of_execution[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 30 -> assert(mifid_ii_trade_message_read.publication_date_and_time[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.publication_date_and_time[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.pt_ref_price_waiver_flag[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.pt_ref_price_waiver_flag[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.trading_system[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.trading_system[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.market_closing_price_flag[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.market_closing_price_flag[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.pt_algo_trade[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.pt_algo_trade[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.pt_cancellation_flag[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.pt_cancellation_flag[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.pt_amendment_flag[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.pt_amendment_flag[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_message_read.reserved_1 == mifid_ii_trade_message_written.reserved_1);
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> assert(mifid_ii_trade_message_read.reserved_3[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.reserved_3[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> assert(mifid_ii_trade_message_read.reserved_20[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.reserved_20[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.reserved_4[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.reserved_4[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_message_read.trade_qualifier == mifid_ii_trade_message_written.trade_qualifier);
  assert(mifid_ii_trade_message_read.market_mechanism == mifid_ii_trade_message_written.market_mechanism);
  assert(mifid_ii_trade_message_read.trading_mode == mifid_ii_trade_message_written.trading_mode);
  assert(mifid_ii_trade_message_read.transaction_category == mifid_ii_trade_message_written.transaction_category);
  assert(mifid_ii_trade_message_read.negotiation_indicator == mifid_ii_trade_message_written.negotiation_indicator);
  assert(mifid_ii_trade_message_read.agency_cross_indicator == mifid_ii_trade_message_written.agency_cross_indicator);
  assert(mifid_ii_trade_message_read.modification_indicator == mifid_ii_trade_message_written.modification_indicator);
  assert(mifid_ii_trade_message_read.reference_price_indicator == mifid_ii_trade_message_written.reference_price_indicator);
  assert(mifid_ii_trade_message_read.special_dividend_indicator == mifid_ii_trade_message_written.special_dividend_indicator);
  assert(mifid_ii_trade_message_read.off_book_automated_indicator == mifid_ii_trade_message_written.off_book_automated_indicator);
  assert(mifid_ii_trade_message_read.price_formation_indicator == mifid_ii_trade_message_written.price_formation_indicator);
  assert(mifid_ii_trade_message_read.algorithmic_indicator == mifid_ii_trade_message_written.algorithmic_indicator);
  assert(mifid_ii_trade_message_read.post_trade_deferral_reason == mifid_ii_trade_message_written.post_trade_deferral_reason);
  assert(mifid_ii_trade_message_read.deferral_enrichment_type == mifid_ii_trade_message_written.deferral_enrichment_type);
  assert(mifid_ii_trade_message_read.duplicative_indicator == mifid_ii_trade_message_written.duplicative_indicator);
  skip
}

/* ---- Mifid Ii Trade Cross Message: 307 bytes --------------------------------- */

/* Sent to indicate a MiFID compliant cross trade */
typedef MifidIiTradeCrossMessage {
  byte timestamp[8];
  byte source_venue[2];
  byte instrument[8];
  byte transaction_identification_code[52];
  byte cross_id[20];
  byte cross_type;
  byte mi_fid_price[20];
  byte mi_fid_quantity[20];
  byte trading_date_and_time[30];
  byte instrument_identification_code_type[4];
  byte instrument_identification_code[12];
  byte price_notation[4];
  byte price_major_currency[3];
  byte notional_amount[20];
  byte notional_currency[3];
  byte venue_of_execution[4];
  byte publication_date_and_time[30];
  byte reserved_4[4];
  byte nt_pre_trade_waiver_flag[4];
  byte pt_algo_trade[4];
  byte second_reserved_4[4];
  byte pt_cancellation_flag[4];
  byte pt_amendment_flag[4];
  byte reserved_1;
  byte reserved_3[3];
  byte reserved_20[20];
  byte trading_system[4];
  byte market_mechanism;
  byte trading_mode;
  byte transaction_category;
  byte negotiation_indicator;
  byte agency_cross_indicator;
  byte modification_indicator;
  byte reference_price_indicator;
  byte special_dividend_indicator;
  byte off_book_automated_indicator;
  byte price_formation_indicator;
  byte algorithmic_indicator;
  byte post_trade_deferral_reason;
  byte deferral_enrichment_type;
  byte duplicative_indicator
};

int mifid_ii_trade_cross_message_at;

/* every byte of Mifid Ii Trade Cross Message set to one value */
inline fill_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_record, mifid_ii_trade_cross_message_value) {
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> mifid_ii_trade_cross_message_record.timestamp[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 2 -> mifid_ii_trade_cross_message_record.source_venue[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> mifid_ii_trade_cross_message_record.instrument[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 52 -> mifid_ii_trade_cross_message_record.transaction_identification_code[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.cross_id[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_record.cross_type = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.mi_fid_price[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.mi_fid_quantity[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> mifid_ii_trade_cross_message_record.trading_date_and_time[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.instrument_identification_code_type[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 12 -> mifid_ii_trade_cross_message_record.instrument_identification_code[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.price_notation[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> mifid_ii_trade_cross_message_record.price_major_currency[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.notional_amount[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> mifid_ii_trade_cross_message_record.notional_currency[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.venue_of_execution[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> mifid_ii_trade_cross_message_record.publication_date_and_time[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.reserved_4[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.nt_pre_trade_waiver_flag[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.pt_algo_trade[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.second_reserved_4[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.pt_cancellation_flag[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.pt_amendment_flag[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_record.reserved_1 = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> mifid_ii_trade_cross_message_record.reserved_3[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.reserved_20[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.trading_system[mifid_ii_trade_cross_message_at] = mifid_ii_trade_cross_message_value; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_record.market_mechanism = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.trading_mode = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.transaction_category = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.negotiation_indicator = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.agency_cross_indicator = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.modification_indicator = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.reference_price_indicator = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.special_dividend_indicator = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.off_book_automated_indicator = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.price_formation_indicator = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.algorithmic_indicator = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.post_trade_deferral_reason = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.deferral_enrichment_type = mifid_ii_trade_cross_message_value;
  mifid_ii_trade_cross_message_record.duplicative_indicator = mifid_ii_trade_cross_message_value;
  skip
}

/* each byte of Mifid Ii Trade Cross Message set to where it lies, so a field read out of place says so */
inline ramp_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_record, mifid_ii_trade_cross_message_base) {
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> mifid_ii_trade_cross_message_record.timestamp[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 0 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 2 -> mifid_ii_trade_cross_message_record.source_venue[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 8 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> mifid_ii_trade_cross_message_record.instrument[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 10 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 52 -> mifid_ii_trade_cross_message_record.transaction_identification_code[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 18 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.cross_id[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 70 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_record.cross_type = (mifid_ii_trade_cross_message_base + 90 + 1) % 256;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.mi_fid_price[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 91 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.mi_fid_quantity[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 111 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> mifid_ii_trade_cross_message_record.trading_date_and_time[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 131 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.instrument_identification_code_type[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 161 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 12 -> mifid_ii_trade_cross_message_record.instrument_identification_code[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 165 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.price_notation[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 177 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> mifid_ii_trade_cross_message_record.price_major_currency[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 181 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.notional_amount[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 184 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> mifid_ii_trade_cross_message_record.notional_currency[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 204 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.venue_of_execution[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 207 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> mifid_ii_trade_cross_message_record.publication_date_and_time[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 211 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.reserved_4[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 241 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.nt_pre_trade_waiver_flag[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 245 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.pt_algo_trade[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 249 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.second_reserved_4[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 253 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.pt_cancellation_flag[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 257 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.pt_amendment_flag[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 261 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_record.reserved_1 = (mifid_ii_trade_cross_message_base + 265 + 1) % 256;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> mifid_ii_trade_cross_message_record.reserved_3[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 266 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.reserved_20[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 269 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.trading_system[mifid_ii_trade_cross_message_at] = (mifid_ii_trade_cross_message_base + 289 + mifid_ii_trade_cross_message_at + 1) % 256; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_record.market_mechanism = (mifid_ii_trade_cross_message_base + 293 + 1) % 256;
  mifid_ii_trade_cross_message_record.trading_mode = (mifid_ii_trade_cross_message_base + 294 + 1) % 256;
  mifid_ii_trade_cross_message_record.transaction_category = (mifid_ii_trade_cross_message_base + 295 + 1) % 256;
  mifid_ii_trade_cross_message_record.negotiation_indicator = (mifid_ii_trade_cross_message_base + 296 + 1) % 256;
  mifid_ii_trade_cross_message_record.agency_cross_indicator = (mifid_ii_trade_cross_message_base + 297 + 1) % 256;
  mifid_ii_trade_cross_message_record.modification_indicator = (mifid_ii_trade_cross_message_base + 298 + 1) % 256;
  mifid_ii_trade_cross_message_record.reference_price_indicator = (mifid_ii_trade_cross_message_base + 299 + 1) % 256;
  mifid_ii_trade_cross_message_record.special_dividend_indicator = (mifid_ii_trade_cross_message_base + 300 + 1) % 256;
  mifid_ii_trade_cross_message_record.off_book_automated_indicator = (mifid_ii_trade_cross_message_base + 301 + 1) % 256;
  mifid_ii_trade_cross_message_record.price_formation_indicator = (mifid_ii_trade_cross_message_base + 302 + 1) % 256;
  mifid_ii_trade_cross_message_record.algorithmic_indicator = (mifid_ii_trade_cross_message_base + 303 + 1) % 256;
  mifid_ii_trade_cross_message_record.post_trade_deferral_reason = (mifid_ii_trade_cross_message_base + 304 + 1) % 256;
  mifid_ii_trade_cross_message_record.deferral_enrichment_type = (mifid_ii_trade_cross_message_base + 305 + 1) % 256;
  mifid_ii_trade_cross_message_record.duplicative_indicator = (mifid_ii_trade_cross_message_base + 306 + 1) % 256;
  skip
}

/* Mifid Ii Trade Cross Message to the wire, 307 bytes from where the cursor stands */
inline encode_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_record) {
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> wire[at] = mifid_ii_trade_cross_message_record.timestamp[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 2 -> wire[at] = mifid_ii_trade_cross_message_record.source_venue[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> wire[at] = mifid_ii_trade_cross_message_record.instrument[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 52 -> wire[at] = mifid_ii_trade_cross_message_record.transaction_identification_code[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> wire[at] = mifid_ii_trade_cross_message_record.cross_id[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_cross_message_record.cross_type; at = at + 1;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> wire[at] = mifid_ii_trade_cross_message_record.mi_fid_price[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> wire[at] = mifid_ii_trade_cross_message_record.mi_fid_quantity[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> wire[at] = mifid_ii_trade_cross_message_record.trading_date_and_time[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.instrument_identification_code_type[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 12 -> wire[at] = mifid_ii_trade_cross_message_record.instrument_identification_code[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.price_notation[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> wire[at] = mifid_ii_trade_cross_message_record.price_major_currency[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> wire[at] = mifid_ii_trade_cross_message_record.notional_amount[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> wire[at] = mifid_ii_trade_cross_message_record.notional_currency[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.venue_of_execution[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> wire[at] = mifid_ii_trade_cross_message_record.publication_date_and_time[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.reserved_4[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.nt_pre_trade_waiver_flag[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.pt_algo_trade[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.second_reserved_4[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.pt_cancellation_flag[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.pt_amendment_flag[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_cross_message_record.reserved_1; at = at + 1;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> wire[at] = mifid_ii_trade_cross_message_record.reserved_3[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> wire[at] = mifid_ii_trade_cross_message_record.reserved_20[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> wire[at] = mifid_ii_trade_cross_message_record.trading_system[mifid_ii_trade_cross_message_at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_cross_message_record.market_mechanism; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.trading_mode; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.transaction_category; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.negotiation_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.agency_cross_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.modification_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.reference_price_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.special_dividend_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.off_book_automated_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.price_formation_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.algorithmic_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.post_trade_deferral_reason; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.deferral_enrichment_type; at = at + 1;
  wire[at] = mifid_ii_trade_cross_message_record.duplicative_indicator; at = at + 1;
  skip
}

/* Mifid Ii Trade Cross Message off the wire, 307 bytes from where the cursor stands */
inline decode_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_record) {
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> mifid_ii_trade_cross_message_record.timestamp[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 2 -> mifid_ii_trade_cross_message_record.source_venue[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> mifid_ii_trade_cross_message_record.instrument[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 52 -> mifid_ii_trade_cross_message_record.transaction_identification_code[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.cross_id[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_record.cross_type = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.mi_fid_price[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.mi_fid_quantity[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> mifid_ii_trade_cross_message_record.trading_date_and_time[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.instrument_identification_code_type[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 12 -> mifid_ii_trade_cross_message_record.instrument_identification_code[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.price_notation[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> mifid_ii_trade_cross_message_record.price_major_currency[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.notional_amount[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> mifid_ii_trade_cross_message_record.notional_currency[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.venue_of_execution[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> mifid_ii_trade_cross_message_record.publication_date_and_time[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.reserved_4[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.nt_pre_trade_waiver_flag[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.pt_algo_trade[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.second_reserved_4[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.pt_cancellation_flag[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.pt_amendment_flag[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_record.reserved_1 = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> mifid_ii_trade_cross_message_record.reserved_3[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> mifid_ii_trade_cross_message_record.reserved_20[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> mifid_ii_trade_cross_message_record.trading_system[mifid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_record.market_mechanism = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.trading_mode = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.transaction_category = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.negotiation_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.agency_cross_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.modification_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.reference_price_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.special_dividend_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.off_book_automated_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.price_formation_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.algorithmic_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.post_trade_deferral_reason = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.deferral_enrichment_type = wire[at]; at = at + 1;
  mifid_ii_trade_cross_message_record.duplicative_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Mifid Ii Trade Cross Message is what was written, byte for byte */
inline equal_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_read, mifid_ii_trade_cross_message_written) {
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> assert(mifid_ii_trade_cross_message_read.timestamp[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.timestamp[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 2 -> assert(mifid_ii_trade_cross_message_read.source_venue[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.source_venue[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 8 -> assert(mifid_ii_trade_cross_message_read.instrument[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.instrument[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 52 -> assert(mifid_ii_trade_cross_message_read.transaction_identification_code[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.transaction_identification_code[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> assert(mifid_ii_trade_cross_message_read.cross_id[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.cross_id[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_cross_message_read.cross_type == mifid_ii_trade_cross_message_written.cross_type);
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> assert(mifid_ii_trade_cross_message_read.mi_fid_price[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.mi_fid_price[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> assert(mifid_ii_trade_cross_message_read.mi_fid_quantity[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.mi_fid_quantity[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> assert(mifid_ii_trade_cross_message_read.trading_date_and_time[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.trading_date_and_time[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.instrument_identification_code_type[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.instrument_identification_code_type[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 12 -> assert(mifid_ii_trade_cross_message_read.instrument_identification_code[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.instrument_identification_code[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.price_notation[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.price_notation[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> assert(mifid_ii_trade_cross_message_read.price_major_currency[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.price_major_currency[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> assert(mifid_ii_trade_cross_message_read.notional_amount[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.notional_amount[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> assert(mifid_ii_trade_cross_message_read.notional_currency[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.notional_currency[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.venue_of_execution[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.venue_of_execution[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 30 -> assert(mifid_ii_trade_cross_message_read.publication_date_and_time[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.publication_date_and_time[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.reserved_4[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.reserved_4[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.nt_pre_trade_waiver_flag[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.nt_pre_trade_waiver_flag[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.pt_algo_trade[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.pt_algo_trade[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.second_reserved_4[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.second_reserved_4[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.pt_cancellation_flag[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.pt_cancellation_flag[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.pt_amendment_flag[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.pt_amendment_flag[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_cross_message_read.reserved_1 == mifid_ii_trade_cross_message_written.reserved_1);
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 3 -> assert(mifid_ii_trade_cross_message_read.reserved_3[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.reserved_3[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 20 -> assert(mifid_ii_trade_cross_message_read.reserved_20[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.reserved_20[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_cross_message_at = 0;
  do
  :: mifid_ii_trade_cross_message_at < 4 -> assert(mifid_ii_trade_cross_message_read.trading_system[mifid_ii_trade_cross_message_at] == mifid_ii_trade_cross_message_written.trading_system[mifid_ii_trade_cross_message_at]); mifid_ii_trade_cross_message_at = mifid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_cross_message_read.market_mechanism == mifid_ii_trade_cross_message_written.market_mechanism);
  assert(mifid_ii_trade_cross_message_read.trading_mode == mifid_ii_trade_cross_message_written.trading_mode);
  assert(mifid_ii_trade_cross_message_read.transaction_category == mifid_ii_trade_cross_message_written.transaction_category);
  assert(mifid_ii_trade_cross_message_read.negotiation_indicator == mifid_ii_trade_cross_message_written.negotiation_indicator);
  assert(mifid_ii_trade_cross_message_read.agency_cross_indicator == mifid_ii_trade_cross_message_written.agency_cross_indicator);
  assert(mifid_ii_trade_cross_message_read.modification_indicator == mifid_ii_trade_cross_message_written.modification_indicator);
  assert(mifid_ii_trade_cross_message_read.reference_price_indicator == mifid_ii_trade_cross_message_written.reference_price_indicator);
  assert(mifid_ii_trade_cross_message_read.special_dividend_indicator == mifid_ii_trade_cross_message_written.special_dividend_indicator);
  assert(mifid_ii_trade_cross_message_read.off_book_automated_indicator == mifid_ii_trade_cross_message_written.off_book_automated_indicator);
  assert(mifid_ii_trade_cross_message_read.price_formation_indicator == mifid_ii_trade_cross_message_written.price_formation_indicator);
  assert(mifid_ii_trade_cross_message_read.algorithmic_indicator == mifid_ii_trade_cross_message_written.algorithmic_indicator);
  assert(mifid_ii_trade_cross_message_read.post_trade_deferral_reason == mifid_ii_trade_cross_message_written.post_trade_deferral_reason);
  assert(mifid_ii_trade_cross_message_read.deferral_enrichment_type == mifid_ii_trade_cross_message_written.deferral_enrichment_type);
  assert(mifid_ii_trade_cross_message_read.duplicative_indicator == mifid_ii_trade_cross_message_written.duplicative_indicator);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Unit Header: encoded, read back, and compared */
proctype check_unit_header() {
  UnitHeader unit_header_sent;
  UnitHeader unit_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unit_header(unit_header_sent, 0)
  :: pattern == 1 -> fill_unit_header(unit_header_sent, 32)
  :: pattern == 2 -> fill_unit_header(unit_header_sent, 255)
  :: else -> ramp_unit_header(unit_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unit_header(unit_header_sent);
    assert(at == 8);
    at = 0;
    decode_unit_header(unit_header_got);
    assert(at == 8);
    equal_unit_header(unit_header_got, unit_header_sent)
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
    assert(at == 11);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 11);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
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
    assert(at == 27);
    at = 0;
    decode_instrument_status_message(instrument_status_message_got);
    assert(at == 27);
    equal_instrument_status_message(instrument_status_message_got, instrument_status_message_sent)
  }
}

/* Mifid Ii Trade Message: encoded, read back, and compared */
proctype check_mifid_ii_trade_message() {
  MifidIiTradeMessage mifid_ii_trade_message_sent;
  MifidIiTradeMessage mifid_ii_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mifid_ii_trade_message(mifid_ii_trade_message_sent, 0)
  :: pattern == 1 -> fill_mifid_ii_trade_message(mifid_ii_trade_message_sent, 32)
  :: pattern == 2 -> fill_mifid_ii_trade_message(mifid_ii_trade_message_sent, 255)
  :: else -> ramp_mifid_ii_trade_message(mifid_ii_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mifid_ii_trade_message(mifid_ii_trade_message_sent);
    assert(at == 289);
    at = 0;
    decode_mifid_ii_trade_message(mifid_ii_trade_message_got);
    assert(at == 289);
    equal_mifid_ii_trade_message(mifid_ii_trade_message_got, mifid_ii_trade_message_sent)
  }
}

/* Mifid Ii Trade Cross Message: encoded, read back, and compared */
proctype check_mifid_ii_trade_cross_message() {
  MifidIiTradeCrossMessage mifid_ii_trade_cross_message_sent;
  MifidIiTradeCrossMessage mifid_ii_trade_cross_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_sent, 0)
  :: pattern == 1 -> fill_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_sent, 32)
  :: pattern == 2 -> fill_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_sent, 255)
  :: else -> ramp_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_sent);
    assert(at == 307);
    at = 0;
    decode_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_got);
    assert(at == 307);
    equal_mifid_ii_trade_cross_message(mifid_ii_trade_cross_message_got, mifid_ii_trade_cross_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_unit_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_instrument_status_message()
  :: run check_mifid_ii_trade_message()
  :: run check_mifid_ii_trade_cross_message()
  fi
}
