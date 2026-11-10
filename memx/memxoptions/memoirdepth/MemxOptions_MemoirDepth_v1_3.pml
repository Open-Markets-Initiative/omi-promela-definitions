/*
 * The Members Exchange Member Order Information Record Depth
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
 *   - a field read in bits
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 56

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Common Header: 18 bytes ------------------------------------------------- */

/* Common Header */
typedef CommonHeader {
  byte message_type;
  byte header_length;
  byte session_id[8];
  byte sequence_number[8]
};

int common_header_at;

/* every byte of Common Header set to one value */
inline fill_common_header(common_header_record, common_header_value) {
  common_header_record.message_type = common_header_value;
  common_header_record.header_length = common_header_value;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.session_id[common_header_at] = common_header_value; common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.sequence_number[common_header_at] = common_header_value; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Common Header set to where it lies, so a field read out of place says so */
inline ramp_common_header(common_header_record, common_header_base) {
  common_header_record.message_type = (common_header_base + 0 + 1) % 256;
  common_header_record.header_length = (common_header_base + 1 + 1) % 256;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.session_id[common_header_at] = (common_header_base + 2 + common_header_at + 1) % 256; common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.sequence_number[common_header_at] = (common_header_base + 10 + common_header_at + 1) % 256; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* Common Header to the wire, 18 bytes from where the cursor stands */
inline encode_common_header(common_header_record) {
  wire[at] = common_header_record.message_type; at = at + 1;
  wire[at] = common_header_record.header_length; at = at + 1;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> wire[at] = common_header_record.session_id[common_header_at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> wire[at] = common_header_record.sequence_number[common_header_at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* Common Header off the wire, 18 bytes from where the cursor stands */
inline decode_common_header(common_header_record) {
  common_header_record.message_type = wire[at]; at = at + 1;
  common_header_record.header_length = wire[at]; at = at + 1;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.session_id[common_header_at] = wire[at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.sequence_number[common_header_at] = wire[at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Common Header is what was written, byte for byte */
inline equal_common_header(common_header_read, common_header_written) {
  assert(common_header_read.message_type == common_header_written.message_type);
  assert(common_header_read.header_length == common_header_written.header_length);
  common_header_at = 0;
  do
  :: common_header_at < 8 -> assert(common_header_read.session_id[common_header_at] == common_header_written.session_id[common_header_at]); common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> assert(common_header_read.sequence_number[common_header_at] == common_header_written.sequence_number[common_header_at]); common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sbe Header: 6 bytes ----------------------------------------------------- */

/* Sbe Header */
typedef SbeHeader {
  byte block_length[2];
  byte template_id;
  byte schema_id;
  byte version[2]
};

int sbe_header_at;

/* every byte of Sbe Header set to one value */
inline fill_sbe_header(sbe_header_record, sbe_header_value) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_record.template_id = sbe_header_value;
  sbe_header_record.schema_id = sbe_header_value;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sbe Header set to where it lies, so a field read out of place says so */
inline ramp_sbe_header(sbe_header_record, sbe_header_base) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = (sbe_header_base + 0 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_record.template_id = (sbe_header_base + 2 + 1) % 256;
  sbe_header_record.schema_id = (sbe_header_base + 3 + 1) % 256;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = (sbe_header_base + 4 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header to the wire, 6 bytes from where the cursor stands */
inline encode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.block_length[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  wire[at] = sbe_header_record.template_id; at = at + 1;
  wire[at] = sbe_header_record.schema_id; at = at + 1;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.version[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header off the wire, 6 bytes from where the cursor stands */
inline decode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_record.template_id = wire[at]; at = at + 1;
  sbe_header_record.schema_id = wire[at]; at = at + 1;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sbe Header is what was written, byte for byte */
inline equal_sbe_header(sbe_header_read, sbe_header_written) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.block_length[sbe_header_at] == sbe_header_written.block_length[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  assert(sbe_header_read.template_id == sbe_header_written.template_id);
  assert(sbe_header_read.schema_id == sbe_header_written.schema_id);
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.version[sbe_header_at] == sbe_header_written.version[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Directory Message: 56 bytes ---------------------------------- */

/* InstrumentDirectoryMessage */
typedef InstrumentDirectoryMessage {
  byte timestamp[8];
  byte symbol[8];
  byte options_product_type;
  byte underlier[6];
  byte osi_root[6];
  byte maturity_date[8];
  byte strike_put_or_call;
  byte strike_price[8];
  byte closing_only;
  byte closing_time[8];
  byte is_test_symbol
};

int instrument_directory_message_at;

/* every byte of Instrument Directory Message set to one value */
inline fill_instrument_directory_message(instrument_directory_message_record, instrument_directory_message_value) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.timestamp[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.symbol[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.options_product_type = instrument_directory_message_value;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.underlier[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.osi_root[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.maturity_date[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.strike_put_or_call = instrument_directory_message_value;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.strike_price[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.closing_only = instrument_directory_message_value;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.closing_time[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.is_test_symbol = instrument_directory_message_value;
  skip
}

/* each byte of Instrument Directory Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_directory_message(instrument_directory_message_record, instrument_directory_message_base) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.timestamp[instrument_directory_message_at] = (instrument_directory_message_base + 0 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.symbol[instrument_directory_message_at] = (instrument_directory_message_base + 8 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.options_product_type = (instrument_directory_message_base + 16 + 1) % 256;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.underlier[instrument_directory_message_at] = (instrument_directory_message_base + 17 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.osi_root[instrument_directory_message_at] = (instrument_directory_message_base + 23 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.maturity_date[instrument_directory_message_at] = (instrument_directory_message_base + 29 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.strike_put_or_call = (instrument_directory_message_base + 37 + 1) % 256;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.strike_price[instrument_directory_message_at] = (instrument_directory_message_base + 38 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.closing_only = (instrument_directory_message_base + 46 + 1) % 256;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.closing_time[instrument_directory_message_at] = (instrument_directory_message_base + 47 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.is_test_symbol = (instrument_directory_message_base + 55 + 1) % 256;
  skip
}

/* Instrument Directory Message to the wire, 56 bytes from where the cursor stands */
inline encode_instrument_directory_message(instrument_directory_message_record) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> wire[at] = instrument_directory_message_record.timestamp[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> wire[at] = instrument_directory_message_record.symbol[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_directory_message_record.options_product_type; at = at + 1;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> wire[at] = instrument_directory_message_record.underlier[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> wire[at] = instrument_directory_message_record.osi_root[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> wire[at] = instrument_directory_message_record.maturity_date[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_directory_message_record.strike_put_or_call; at = at + 1;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> wire[at] = instrument_directory_message_record.strike_price[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_directory_message_record.closing_only; at = at + 1;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> wire[at] = instrument_directory_message_record.closing_time[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_directory_message_record.is_test_symbol; at = at + 1;
  skip
}

/* Instrument Directory Message off the wire, 56 bytes from where the cursor stands */
inline decode_instrument_directory_message(instrument_directory_message_record) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.timestamp[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.symbol[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.options_product_type = wire[at]; at = at + 1;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.underlier[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.osi_root[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.maturity_date[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.strike_put_or_call = wire[at]; at = at + 1;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.strike_price[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.closing_only = wire[at]; at = at + 1;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.closing_time[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.is_test_symbol = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Directory Message is what was written, byte for byte */
inline equal_instrument_directory_message(instrument_directory_message_read, instrument_directory_message_written) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> assert(instrument_directory_message_read.timestamp[instrument_directory_message_at] == instrument_directory_message_written.timestamp[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> assert(instrument_directory_message_read.symbol[instrument_directory_message_at] == instrument_directory_message_written.symbol[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(instrument_directory_message_read.options_product_type == instrument_directory_message_written.options_product_type);
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> assert(instrument_directory_message_read.underlier[instrument_directory_message_at] == instrument_directory_message_written.underlier[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> assert(instrument_directory_message_read.osi_root[instrument_directory_message_at] == instrument_directory_message_written.osi_root[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> assert(instrument_directory_message_read.maturity_date[instrument_directory_message_at] == instrument_directory_message_written.maturity_date[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(instrument_directory_message_read.strike_put_or_call == instrument_directory_message_written.strike_put_or_call);
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> assert(instrument_directory_message_read.strike_price[instrument_directory_message_at] == instrument_directory_message_written.strike_price[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(instrument_directory_message_read.closing_only == instrument_directory_message_written.closing_only);
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> assert(instrument_directory_message_read.closing_time[instrument_directory_message_at] == instrument_directory_message_written.closing_time[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(instrument_directory_message_read.is_test_symbol == instrument_directory_message_written.is_test_symbol);
  skip
}

/* ---- Instrument Trading Status Message: 18 bytes ----------------------------- */

/* InstrumentTradingStatusMessage */
typedef InstrumentTradingStatusMessage {
  byte timestamp[8];
  byte symbol[8];
  byte instrument_trading_status;
  byte instrument_trading_status_reason
};

int instrument_trading_status_message_at;

/* every byte of Instrument Trading Status Message set to one value */
inline fill_instrument_trading_status_message(instrument_trading_status_message_record, instrument_trading_status_message_value) {
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> instrument_trading_status_message_record.timestamp[instrument_trading_status_message_at] = instrument_trading_status_message_value; instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> instrument_trading_status_message_record.symbol[instrument_trading_status_message_at] = instrument_trading_status_message_value; instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_message_record.instrument_trading_status = instrument_trading_status_message_value;
  instrument_trading_status_message_record.instrument_trading_status_reason = instrument_trading_status_message_value;
  skip
}

/* each byte of Instrument Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_trading_status_message(instrument_trading_status_message_record, instrument_trading_status_message_base) {
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> instrument_trading_status_message_record.timestamp[instrument_trading_status_message_at] = (instrument_trading_status_message_base + 0 + instrument_trading_status_message_at + 1) % 256; instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> instrument_trading_status_message_record.symbol[instrument_trading_status_message_at] = (instrument_trading_status_message_base + 8 + instrument_trading_status_message_at + 1) % 256; instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_message_record.instrument_trading_status = (instrument_trading_status_message_base + 16 + 1) % 256;
  instrument_trading_status_message_record.instrument_trading_status_reason = (instrument_trading_status_message_base + 17 + 1) % 256;
  skip
}

/* Instrument Trading Status Message to the wire, 18 bytes from where the cursor stands */
inline encode_instrument_trading_status_message(instrument_trading_status_message_record) {
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> wire[at] = instrument_trading_status_message_record.timestamp[instrument_trading_status_message_at]; at = at + 1; instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> wire[at] = instrument_trading_status_message_record.symbol[instrument_trading_status_message_at]; at = at + 1; instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_trading_status_message_record.instrument_trading_status; at = at + 1;
  wire[at] = instrument_trading_status_message_record.instrument_trading_status_reason; at = at + 1;
  skip
}

/* Instrument Trading Status Message off the wire, 18 bytes from where the cursor stands */
inline decode_instrument_trading_status_message(instrument_trading_status_message_record) {
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> instrument_trading_status_message_record.timestamp[instrument_trading_status_message_at] = wire[at]; at = at + 1; instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> instrument_trading_status_message_record.symbol[instrument_trading_status_message_at] = wire[at]; at = at + 1; instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_message_record.instrument_trading_status = wire[at]; at = at + 1;
  instrument_trading_status_message_record.instrument_trading_status_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Trading Status Message is what was written, byte for byte */
inline equal_instrument_trading_status_message(instrument_trading_status_message_read, instrument_trading_status_message_written) {
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> assert(instrument_trading_status_message_read.timestamp[instrument_trading_status_message_at] == instrument_trading_status_message_written.timestamp[instrument_trading_status_message_at]); instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_message_at = 0;
  do
  :: instrument_trading_status_message_at < 8 -> assert(instrument_trading_status_message_read.symbol[instrument_trading_status_message_at] == instrument_trading_status_message_written.symbol[instrument_trading_status_message_at]); instrument_trading_status_message_at = instrument_trading_status_message_at + 1
  :: else -> break
  od;
  assert(instrument_trading_status_message_read.instrument_trading_status == instrument_trading_status_message_written.instrument_trading_status);
  assert(instrument_trading_status_message_read.instrument_trading_status_reason == instrument_trading_status_message_written.instrument_trading_status_reason);
  skip
}

/* ---- Trading Session Status Message: 9 bytes --------------------------------- */

/* TradingSessionStatusMessage */
typedef TradingSessionStatusMessage {
  byte timestamp[8];
  byte trading_session
};

int trading_session_status_message_at;

/* every byte of Trading Session Status Message set to one value */
inline fill_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_value) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.timestamp[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session = trading_session_status_message_value;
  skip
}

/* each byte of Trading Session Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_base) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.timestamp[trading_session_status_message_at] = (trading_session_status_message_base + 0 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session = (trading_session_status_message_base + 8 + 1) % 256;
  skip
}

/* Trading Session Status Message to the wire, 9 bytes from where the cursor stands */
inline encode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.timestamp[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_status_message_record.trading_session; at = at + 1;
  skip
}

/* Trading Session Status Message off the wire, 9 bytes from where the cursor stands */
inline decode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.timestamp[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Session Status Message is what was written, byte for byte */
inline equal_trading_session_status_message(trading_session_status_message_read, trading_session_status_message_written) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.timestamp[trading_session_status_message_at] == trading_session_status_message_written.timestamp[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  assert(trading_session_status_message_read.trading_session == trading_session_status_message_written.trading_session);
  skip
}

/* ---- Broken Trade Message: 36 bytes ------------------------------------------ */

/* BrokenTradeMessage */
typedef BrokenTradeMessage {
  byte timestamp[8];
  byte symbol[8];
  byte trade_id[8];
  byte original_quantity[4];
  byte original_price[8]
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.symbol[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.trade_id[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.original_quantity[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.original_price[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.symbol[broken_trade_message_at] = (broken_trade_message_base + 8 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.trade_id[broken_trade_message_at] = (broken_trade_message_base + 16 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.original_quantity[broken_trade_message_at] = (broken_trade_message_base + 24 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.original_price[broken_trade_message_at] = (broken_trade_message_base + 28 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message to the wire, 36 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.timestamp[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.symbol[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.trade_id[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.original_quantity[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.original_price[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message off the wire, 36 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.symbol[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.trade_id[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.original_quantity[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.original_price[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.timestamp[broken_trade_message_at] == broken_trade_message_written.timestamp[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.symbol[broken_trade_message_at] == broken_trade_message_written.symbol[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.trade_id[broken_trade_message_at] == broken_trade_message_written.trade_id[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.original_quantity[broken_trade_message_at] == broken_trade_message_written.original_quantity[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.original_price[broken_trade_message_at] == broken_trade_message_written.original_price[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Corrected Trade Message: 48 bytes --------------------------------------- */

/* CorrectedTradeMessage */
typedef CorrectedTradeMessage {
  byte timestamp[8];
  byte symbol[8];
  byte trade_id[8];
  byte original_quantity[4];
  byte original_price[8];
  byte corrected_quantity[4];
  byte corrected_price[8]
};

int corrected_trade_message_at;

/* every byte of Corrected Trade Message set to one value */
inline fill_corrected_trade_message(corrected_trade_message_record, corrected_trade_message_value) {
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.timestamp[corrected_trade_message_at] = corrected_trade_message_value; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.symbol[corrected_trade_message_at] = corrected_trade_message_value; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.trade_id[corrected_trade_message_at] = corrected_trade_message_value; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> corrected_trade_message_record.original_quantity[corrected_trade_message_at] = corrected_trade_message_value; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.original_price[corrected_trade_message_at] = corrected_trade_message_value; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> corrected_trade_message_record.corrected_quantity[corrected_trade_message_at] = corrected_trade_message_value; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.corrected_price[corrected_trade_message_at] = corrected_trade_message_value; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Corrected Trade Message set to where it lies, so a field read out of place says so */
inline ramp_corrected_trade_message(corrected_trade_message_record, corrected_trade_message_base) {
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.timestamp[corrected_trade_message_at] = (corrected_trade_message_base + 0 + corrected_trade_message_at + 1) % 256; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.symbol[corrected_trade_message_at] = (corrected_trade_message_base + 8 + corrected_trade_message_at + 1) % 256; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.trade_id[corrected_trade_message_at] = (corrected_trade_message_base + 16 + corrected_trade_message_at + 1) % 256; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> corrected_trade_message_record.original_quantity[corrected_trade_message_at] = (corrected_trade_message_base + 24 + corrected_trade_message_at + 1) % 256; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.original_price[corrected_trade_message_at] = (corrected_trade_message_base + 28 + corrected_trade_message_at + 1) % 256; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> corrected_trade_message_record.corrected_quantity[corrected_trade_message_at] = (corrected_trade_message_base + 36 + corrected_trade_message_at + 1) % 256; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.corrected_price[corrected_trade_message_at] = (corrected_trade_message_base + 40 + corrected_trade_message_at + 1) % 256; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Corrected Trade Message to the wire, 48 bytes from where the cursor stands */
inline encode_corrected_trade_message(corrected_trade_message_record) {
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> wire[at] = corrected_trade_message_record.timestamp[corrected_trade_message_at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> wire[at] = corrected_trade_message_record.symbol[corrected_trade_message_at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> wire[at] = corrected_trade_message_record.trade_id[corrected_trade_message_at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> wire[at] = corrected_trade_message_record.original_quantity[corrected_trade_message_at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> wire[at] = corrected_trade_message_record.original_price[corrected_trade_message_at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> wire[at] = corrected_trade_message_record.corrected_quantity[corrected_trade_message_at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> wire[at] = corrected_trade_message_record.corrected_price[corrected_trade_message_at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Corrected Trade Message off the wire, 48 bytes from where the cursor stands */
inline decode_corrected_trade_message(corrected_trade_message_record) {
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.timestamp[corrected_trade_message_at] = wire[at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.symbol[corrected_trade_message_at] = wire[at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.trade_id[corrected_trade_message_at] = wire[at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> corrected_trade_message_record.original_quantity[corrected_trade_message_at] = wire[at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.original_price[corrected_trade_message_at] = wire[at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> corrected_trade_message_record.corrected_quantity[corrected_trade_message_at] = wire[at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> corrected_trade_message_record.corrected_price[corrected_trade_message_at] = wire[at]; at = at + 1; corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Corrected Trade Message is what was written, byte for byte */
inline equal_corrected_trade_message(corrected_trade_message_read, corrected_trade_message_written) {
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> assert(corrected_trade_message_read.timestamp[corrected_trade_message_at] == corrected_trade_message_written.timestamp[corrected_trade_message_at]); corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> assert(corrected_trade_message_read.symbol[corrected_trade_message_at] == corrected_trade_message_written.symbol[corrected_trade_message_at]); corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> assert(corrected_trade_message_read.trade_id[corrected_trade_message_at] == corrected_trade_message_written.trade_id[corrected_trade_message_at]); corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> assert(corrected_trade_message_read.original_quantity[corrected_trade_message_at] == corrected_trade_message_written.original_quantity[corrected_trade_message_at]); corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> assert(corrected_trade_message_read.original_price[corrected_trade_message_at] == corrected_trade_message_written.original_price[corrected_trade_message_at]); corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 4 -> assert(corrected_trade_message_read.corrected_quantity[corrected_trade_message_at] == corrected_trade_message_written.corrected_quantity[corrected_trade_message_at]); corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  corrected_trade_message_at = 0;
  do
  :: corrected_trade_message_at < 8 -> assert(corrected_trade_message_read.corrected_price[corrected_trade_message_at] == corrected_trade_message_written.corrected_price[corrected_trade_message_at]); corrected_trade_message_at = corrected_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Complete Message: 16 bytes ------------------------------------- */

/* SnapshotCompleteMessage */
typedef SnapshotCompleteMessage {
  byte timestamp[8];
  byte as_of_sequence_number[8]
};

int snapshot_complete_message_at;

/* every byte of Snapshot Complete Message set to one value */
inline fill_snapshot_complete_message(snapshot_complete_message_record, snapshot_complete_message_value) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.timestamp[snapshot_complete_message_at] = snapshot_complete_message_value; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.as_of_sequence_number[snapshot_complete_message_at] = snapshot_complete_message_value; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Complete Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_complete_message(snapshot_complete_message_record, snapshot_complete_message_base) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.timestamp[snapshot_complete_message_at] = (snapshot_complete_message_base + 0 + snapshot_complete_message_at + 1) % 256; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.as_of_sequence_number[snapshot_complete_message_at] = (snapshot_complete_message_base + 8 + snapshot_complete_message_at + 1) % 256; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Complete Message to the wire, 16 bytes from where the cursor stands */
inline encode_snapshot_complete_message(snapshot_complete_message_record) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> wire[at] = snapshot_complete_message_record.timestamp[snapshot_complete_message_at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> wire[at] = snapshot_complete_message_record.as_of_sequence_number[snapshot_complete_message_at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Complete Message off the wire, 16 bytes from where the cursor stands */
inline decode_snapshot_complete_message(snapshot_complete_message_record) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.timestamp[snapshot_complete_message_at] = wire[at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.as_of_sequence_number[snapshot_complete_message_at] = wire[at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Complete Message is what was written, byte for byte */
inline equal_snapshot_complete_message(snapshot_complete_message_read, snapshot_complete_message_written) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> assert(snapshot_complete_message_read.timestamp[snapshot_complete_message_at] == snapshot_complete_message_written.timestamp[snapshot_complete_message_at]); snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> assert(snapshot_complete_message_read.as_of_sequence_number[snapshot_complete_message_at] == snapshot_complete_message_written.as_of_sequence_number[snapshot_complete_message_at]); snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Added Short Message: 29 bytes ------------------------------------- */

/* OrderAddedShortMessage */
typedef OrderAddedShortMessage {
  byte timestamp[8];
  byte symbol[8];
  byte order_id[8];
  byte side;
  byte quantity_short[2];
  byte price_short[2]
};

int order_added_short_message_at;

/* every byte of Order Added Short Message set to one value */
inline fill_order_added_short_message(order_added_short_message_record, order_added_short_message_value) {
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> order_added_short_message_record.timestamp[order_added_short_message_at] = order_added_short_message_value; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> order_added_short_message_record.symbol[order_added_short_message_at] = order_added_short_message_value; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> order_added_short_message_record.order_id[order_added_short_message_at] = order_added_short_message_value; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_record.side = order_added_short_message_value;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> order_added_short_message_record.quantity_short[order_added_short_message_at] = order_added_short_message_value; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> order_added_short_message_record.price_short[order_added_short_message_at] = order_added_short_message_value; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Added Short Message set to where it lies, so a field read out of place says so */
inline ramp_order_added_short_message(order_added_short_message_record, order_added_short_message_base) {
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> order_added_short_message_record.timestamp[order_added_short_message_at] = (order_added_short_message_base + 0 + order_added_short_message_at + 1) % 256; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> order_added_short_message_record.symbol[order_added_short_message_at] = (order_added_short_message_base + 8 + order_added_short_message_at + 1) % 256; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> order_added_short_message_record.order_id[order_added_short_message_at] = (order_added_short_message_base + 16 + order_added_short_message_at + 1) % 256; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_record.side = (order_added_short_message_base + 24 + 1) % 256;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> order_added_short_message_record.quantity_short[order_added_short_message_at] = (order_added_short_message_base + 25 + order_added_short_message_at + 1) % 256; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> order_added_short_message_record.price_short[order_added_short_message_at] = (order_added_short_message_base + 27 + order_added_short_message_at + 1) % 256; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Short Message to the wire, 29 bytes from where the cursor stands */
inline encode_order_added_short_message(order_added_short_message_record) {
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> wire[at] = order_added_short_message_record.timestamp[order_added_short_message_at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> wire[at] = order_added_short_message_record.symbol[order_added_short_message_at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> wire[at] = order_added_short_message_record.order_id[order_added_short_message_at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  wire[at] = order_added_short_message_record.side; at = at + 1;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> wire[at] = order_added_short_message_record.quantity_short[order_added_short_message_at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> wire[at] = order_added_short_message_record.price_short[order_added_short_message_at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Short Message off the wire, 29 bytes from where the cursor stands */
inline decode_order_added_short_message(order_added_short_message_record) {
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> order_added_short_message_record.timestamp[order_added_short_message_at] = wire[at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> order_added_short_message_record.symbol[order_added_short_message_at] = wire[at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> order_added_short_message_record.order_id[order_added_short_message_at] = wire[at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_record.side = wire[at]; at = at + 1;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> order_added_short_message_record.quantity_short[order_added_short_message_at] = wire[at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> order_added_short_message_record.price_short[order_added_short_message_at] = wire[at]; at = at + 1; order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Added Short Message is what was written, byte for byte */
inline equal_order_added_short_message(order_added_short_message_read, order_added_short_message_written) {
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> assert(order_added_short_message_read.timestamp[order_added_short_message_at] == order_added_short_message_written.timestamp[order_added_short_message_at]); order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> assert(order_added_short_message_read.symbol[order_added_short_message_at] == order_added_short_message_written.symbol[order_added_short_message_at]); order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 8 -> assert(order_added_short_message_read.order_id[order_added_short_message_at] == order_added_short_message_written.order_id[order_added_short_message_at]); order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  assert(order_added_short_message_read.side == order_added_short_message_written.side);
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> assert(order_added_short_message_read.quantity_short[order_added_short_message_at] == order_added_short_message_written.quantity_short[order_added_short_message_at]); order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  order_added_short_message_at = 0;
  do
  :: order_added_short_message_at < 2 -> assert(order_added_short_message_read.price_short[order_added_short_message_at] == order_added_short_message_written.price_short[order_added_short_message_at]); order_added_short_message_at = order_added_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Added Long Message: 37 bytes -------------------------------------- */

/* OrderAddedLongMessage */
typedef OrderAddedLongMessage {
  byte timestamp[8];
  byte symbol[8];
  byte order_id[8];
  byte side;
  byte quantity[4];
  byte price[8]
};

int order_added_long_message_at;

/* every byte of Order Added Long Message set to one value */
inline fill_order_added_long_message(order_added_long_message_record, order_added_long_message_value) {
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.timestamp[order_added_long_message_at] = order_added_long_message_value; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.symbol[order_added_long_message_at] = order_added_long_message_value; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.order_id[order_added_long_message_at] = order_added_long_message_value; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_record.side = order_added_long_message_value;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 4 -> order_added_long_message_record.quantity[order_added_long_message_at] = order_added_long_message_value; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.price[order_added_long_message_at] = order_added_long_message_value; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Added Long Message set to where it lies, so a field read out of place says so */
inline ramp_order_added_long_message(order_added_long_message_record, order_added_long_message_base) {
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.timestamp[order_added_long_message_at] = (order_added_long_message_base + 0 + order_added_long_message_at + 1) % 256; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.symbol[order_added_long_message_at] = (order_added_long_message_base + 8 + order_added_long_message_at + 1) % 256; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.order_id[order_added_long_message_at] = (order_added_long_message_base + 16 + order_added_long_message_at + 1) % 256; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_record.side = (order_added_long_message_base + 24 + 1) % 256;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 4 -> order_added_long_message_record.quantity[order_added_long_message_at] = (order_added_long_message_base + 25 + order_added_long_message_at + 1) % 256; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.price[order_added_long_message_at] = (order_added_long_message_base + 29 + order_added_long_message_at + 1) % 256; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Long Message to the wire, 37 bytes from where the cursor stands */
inline encode_order_added_long_message(order_added_long_message_record) {
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> wire[at] = order_added_long_message_record.timestamp[order_added_long_message_at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> wire[at] = order_added_long_message_record.symbol[order_added_long_message_at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> wire[at] = order_added_long_message_record.order_id[order_added_long_message_at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  wire[at] = order_added_long_message_record.side; at = at + 1;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 4 -> wire[at] = order_added_long_message_record.quantity[order_added_long_message_at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> wire[at] = order_added_long_message_record.price[order_added_long_message_at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Long Message off the wire, 37 bytes from where the cursor stands */
inline decode_order_added_long_message(order_added_long_message_record) {
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.timestamp[order_added_long_message_at] = wire[at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.symbol[order_added_long_message_at] = wire[at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.order_id[order_added_long_message_at] = wire[at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_record.side = wire[at]; at = at + 1;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 4 -> order_added_long_message_record.quantity[order_added_long_message_at] = wire[at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> order_added_long_message_record.price[order_added_long_message_at] = wire[at]; at = at + 1; order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Added Long Message is what was written, byte for byte */
inline equal_order_added_long_message(order_added_long_message_read, order_added_long_message_written) {
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> assert(order_added_long_message_read.timestamp[order_added_long_message_at] == order_added_long_message_written.timestamp[order_added_long_message_at]); order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> assert(order_added_long_message_read.symbol[order_added_long_message_at] == order_added_long_message_written.symbol[order_added_long_message_at]); order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> assert(order_added_long_message_read.order_id[order_added_long_message_at] == order_added_long_message_written.order_id[order_added_long_message_at]); order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  assert(order_added_long_message_read.side == order_added_long_message_written.side);
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 4 -> assert(order_added_long_message_read.quantity[order_added_long_message_at] == order_added_long_message_written.quantity[order_added_long_message_at]); order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  order_added_long_message_at = 0;
  do
  :: order_added_long_message_at < 8 -> assert(order_added_long_message_read.price[order_added_long_message_at] == order_added_long_message_written.price[order_added_long_message_at]); order_added_long_message_at = order_added_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Added Extended Message: 38 bytes ---------------------------------- */

/* OrderAddedExtendedMessage */
typedef OrderAddedExtendedMessage {
  byte timestamp[8];
  byte symbol[8];
  byte order_capacity;
  byte order_id[8];
  byte side;
  byte quantity[4];
  byte price[8]
};

int order_added_extended_message_at;

/* every byte of Order Added Extended Message set to one value */
inline fill_order_added_extended_message(order_added_extended_message_record, order_added_extended_message_value) {
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.timestamp[order_added_extended_message_at] = order_added_extended_message_value; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.symbol[order_added_extended_message_at] = order_added_extended_message_value; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_record.order_capacity = order_added_extended_message_value;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.order_id[order_added_extended_message_at] = order_added_extended_message_value; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_record.side = order_added_extended_message_value;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 4 -> order_added_extended_message_record.quantity[order_added_extended_message_at] = order_added_extended_message_value; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.price[order_added_extended_message_at] = order_added_extended_message_value; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Added Extended Message set to where it lies, so a field read out of place says so */
inline ramp_order_added_extended_message(order_added_extended_message_record, order_added_extended_message_base) {
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.timestamp[order_added_extended_message_at] = (order_added_extended_message_base + 0 + order_added_extended_message_at + 1) % 256; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.symbol[order_added_extended_message_at] = (order_added_extended_message_base + 8 + order_added_extended_message_at + 1) % 256; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_record.order_capacity = (order_added_extended_message_base + 16 + 1) % 256;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.order_id[order_added_extended_message_at] = (order_added_extended_message_base + 17 + order_added_extended_message_at + 1) % 256; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_record.side = (order_added_extended_message_base + 25 + 1) % 256;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 4 -> order_added_extended_message_record.quantity[order_added_extended_message_at] = (order_added_extended_message_base + 26 + order_added_extended_message_at + 1) % 256; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.price[order_added_extended_message_at] = (order_added_extended_message_base + 30 + order_added_extended_message_at + 1) % 256; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Extended Message to the wire, 38 bytes from where the cursor stands */
inline encode_order_added_extended_message(order_added_extended_message_record) {
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> wire[at] = order_added_extended_message_record.timestamp[order_added_extended_message_at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> wire[at] = order_added_extended_message_record.symbol[order_added_extended_message_at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_added_extended_message_record.order_capacity; at = at + 1;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> wire[at] = order_added_extended_message_record.order_id[order_added_extended_message_at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_added_extended_message_record.side; at = at + 1;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 4 -> wire[at] = order_added_extended_message_record.quantity[order_added_extended_message_at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> wire[at] = order_added_extended_message_record.price[order_added_extended_message_at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Extended Message off the wire, 38 bytes from where the cursor stands */
inline decode_order_added_extended_message(order_added_extended_message_record) {
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.timestamp[order_added_extended_message_at] = wire[at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.symbol[order_added_extended_message_at] = wire[at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_record.order_capacity = wire[at]; at = at + 1;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.order_id[order_added_extended_message_at] = wire[at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_record.side = wire[at]; at = at + 1;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 4 -> order_added_extended_message_record.quantity[order_added_extended_message_at] = wire[at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> order_added_extended_message_record.price[order_added_extended_message_at] = wire[at]; at = at + 1; order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Added Extended Message is what was written, byte for byte */
inline equal_order_added_extended_message(order_added_extended_message_read, order_added_extended_message_written) {
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> assert(order_added_extended_message_read.timestamp[order_added_extended_message_at] == order_added_extended_message_written.timestamp[order_added_extended_message_at]); order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> assert(order_added_extended_message_read.symbol[order_added_extended_message_at] == order_added_extended_message_written.symbol[order_added_extended_message_at]); order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  assert(order_added_extended_message_read.order_capacity == order_added_extended_message_written.order_capacity);
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> assert(order_added_extended_message_read.order_id[order_added_extended_message_at] == order_added_extended_message_written.order_id[order_added_extended_message_at]); order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  assert(order_added_extended_message_read.side == order_added_extended_message_written.side);
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 4 -> assert(order_added_extended_message_read.quantity[order_added_extended_message_at] == order_added_extended_message_written.quantity[order_added_extended_message_at]); order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  order_added_extended_message_at = 0;
  do
  :: order_added_extended_message_at < 8 -> assert(order_added_extended_message_read.price[order_added_extended_message_at] == order_added_extended_message_written.price[order_added_extended_message_at]); order_added_extended_message_at = order_added_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Deleted Message: 25 bytes ----------------------------------------- */

/* OrderDeletedMessage */
typedef OrderDeletedMessage {
  byte timestamp[8];
  byte symbol[8];
  byte order_capacity;
  byte order_id[8]
};

int order_deleted_message_at;

/* every byte of Order Deleted Message set to one value */
inline fill_order_deleted_message(order_deleted_message_record, order_deleted_message_value) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.timestamp[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.symbol[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_record.order_capacity = order_deleted_message_value;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_id[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Deleted Message set to where it lies, so a field read out of place says so */
inline ramp_order_deleted_message(order_deleted_message_record, order_deleted_message_base) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.timestamp[order_deleted_message_at] = (order_deleted_message_base + 0 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.symbol[order_deleted_message_at] = (order_deleted_message_base + 8 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_record.order_capacity = (order_deleted_message_base + 16 + 1) % 256;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_id[order_deleted_message_at] = (order_deleted_message_base + 17 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message to the wire, 25 bytes from where the cursor stands */
inline encode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> wire[at] = order_deleted_message_record.timestamp[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> wire[at] = order_deleted_message_record.symbol[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_deleted_message_record.order_capacity; at = at + 1;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> wire[at] = order_deleted_message_record.order_id[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message off the wire, 25 bytes from where the cursor stands */
inline decode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.timestamp[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.symbol[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_record.order_capacity = wire[at]; at = at + 1;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_id[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Deleted Message is what was written, byte for byte */
inline equal_order_deleted_message(order_deleted_message_read, order_deleted_message_written) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> assert(order_deleted_message_read.timestamp[order_deleted_message_at] == order_deleted_message_written.timestamp[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> assert(order_deleted_message_read.symbol[order_deleted_message_at] == order_deleted_message_written.symbol[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  assert(order_deleted_message_read.order_capacity == order_deleted_message_written.order_capacity);
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> assert(order_deleted_message_read.order_id[order_deleted_message_at] == order_deleted_message_written.order_id[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Reduced Message: 42 bytes ----------------------------------------- */

/* OrderReducedMessage */
typedef OrderReducedMessage {
  byte timestamp[8];
  byte symbol[8];
  byte order_capacity;
  byte order_id[8];
  byte side;
  byte quantity[4];
  byte price[8];
  byte quantity_reduced[4]
};

int order_reduced_message_at;

/* every byte of Order Reduced Message set to one value */
inline fill_order_reduced_message(order_reduced_message_record, order_reduced_message_value) {
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.timestamp[order_reduced_message_at] = order_reduced_message_value; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.symbol[order_reduced_message_at] = order_reduced_message_value; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_record.order_capacity = order_reduced_message_value;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.order_id[order_reduced_message_at] = order_reduced_message_value; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_record.side = order_reduced_message_value;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> order_reduced_message_record.quantity[order_reduced_message_at] = order_reduced_message_value; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.price[order_reduced_message_at] = order_reduced_message_value; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> order_reduced_message_record.quantity_reduced[order_reduced_message_at] = order_reduced_message_value; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Reduced Message set to where it lies, so a field read out of place says so */
inline ramp_order_reduced_message(order_reduced_message_record, order_reduced_message_base) {
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.timestamp[order_reduced_message_at] = (order_reduced_message_base + 0 + order_reduced_message_at + 1) % 256; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.symbol[order_reduced_message_at] = (order_reduced_message_base + 8 + order_reduced_message_at + 1) % 256; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_record.order_capacity = (order_reduced_message_base + 16 + 1) % 256;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.order_id[order_reduced_message_at] = (order_reduced_message_base + 17 + order_reduced_message_at + 1) % 256; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_record.side = (order_reduced_message_base + 25 + 1) % 256;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> order_reduced_message_record.quantity[order_reduced_message_at] = (order_reduced_message_base + 26 + order_reduced_message_at + 1) % 256; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.price[order_reduced_message_at] = (order_reduced_message_base + 30 + order_reduced_message_at + 1) % 256; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> order_reduced_message_record.quantity_reduced[order_reduced_message_at] = (order_reduced_message_base + 38 + order_reduced_message_at + 1) % 256; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Reduced Message to the wire, 42 bytes from where the cursor stands */
inline encode_order_reduced_message(order_reduced_message_record) {
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> wire[at] = order_reduced_message_record.timestamp[order_reduced_message_at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> wire[at] = order_reduced_message_record.symbol[order_reduced_message_at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_reduced_message_record.order_capacity; at = at + 1;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> wire[at] = order_reduced_message_record.order_id[order_reduced_message_at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_reduced_message_record.side; at = at + 1;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> wire[at] = order_reduced_message_record.quantity[order_reduced_message_at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> wire[at] = order_reduced_message_record.price[order_reduced_message_at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> wire[at] = order_reduced_message_record.quantity_reduced[order_reduced_message_at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Reduced Message off the wire, 42 bytes from where the cursor stands */
inline decode_order_reduced_message(order_reduced_message_record) {
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.timestamp[order_reduced_message_at] = wire[at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.symbol[order_reduced_message_at] = wire[at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_record.order_capacity = wire[at]; at = at + 1;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.order_id[order_reduced_message_at] = wire[at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_record.side = wire[at]; at = at + 1;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> order_reduced_message_record.quantity[order_reduced_message_at] = wire[at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> order_reduced_message_record.price[order_reduced_message_at] = wire[at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> order_reduced_message_record.quantity_reduced[order_reduced_message_at] = wire[at]; at = at + 1; order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Reduced Message is what was written, byte for byte */
inline equal_order_reduced_message(order_reduced_message_read, order_reduced_message_written) {
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> assert(order_reduced_message_read.timestamp[order_reduced_message_at] == order_reduced_message_written.timestamp[order_reduced_message_at]); order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> assert(order_reduced_message_read.symbol[order_reduced_message_at] == order_reduced_message_written.symbol[order_reduced_message_at]); order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  assert(order_reduced_message_read.order_capacity == order_reduced_message_written.order_capacity);
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> assert(order_reduced_message_read.order_id[order_reduced_message_at] == order_reduced_message_written.order_id[order_reduced_message_at]); order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  assert(order_reduced_message_read.side == order_reduced_message_written.side);
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> assert(order_reduced_message_read.quantity[order_reduced_message_at] == order_reduced_message_written.quantity[order_reduced_message_at]); order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 8 -> assert(order_reduced_message_read.price[order_reduced_message_at] == order_reduced_message_written.price[order_reduced_message_at]); order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  order_reduced_message_at = 0;
  do
  :: order_reduced_message_at < 4 -> assert(order_reduced_message_read.quantity_reduced[order_reduced_message_at] == order_reduced_message_written.quantity_reduced[order_reduced_message_at]); order_reduced_message_at = order_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clear Book Message: 16 bytes -------------------------------------------- */

/* ClearBookMessage */
typedef ClearBookMessage {
  byte timestamp[8];
  byte symbol[8]
};

int clear_book_message_at;

/* every byte of Clear Book Message set to one value */
inline fill_clear_book_message(clear_book_message_record, clear_book_message_value) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> clear_book_message_record.timestamp[clear_book_message_at] = clear_book_message_value; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> clear_book_message_record.symbol[clear_book_message_at] = clear_book_message_value; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clear Book Message set to where it lies, so a field read out of place says so */
inline ramp_clear_book_message(clear_book_message_record, clear_book_message_base) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> clear_book_message_record.timestamp[clear_book_message_at] = (clear_book_message_base + 0 + clear_book_message_at + 1) % 256; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> clear_book_message_record.symbol[clear_book_message_at] = (clear_book_message_base + 8 + clear_book_message_at + 1) % 256; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Clear Book Message to the wire, 16 bytes from where the cursor stands */
inline encode_clear_book_message(clear_book_message_record) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> wire[at] = clear_book_message_record.timestamp[clear_book_message_at]; at = at + 1; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> wire[at] = clear_book_message_record.symbol[clear_book_message_at]; at = at + 1; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Clear Book Message off the wire, 16 bytes from where the cursor stands */
inline decode_clear_book_message(clear_book_message_record) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> clear_book_message_record.timestamp[clear_book_message_at] = wire[at]; at = at + 1; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> clear_book_message_record.symbol[clear_book_message_at] = wire[at]; at = at + 1; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clear Book Message is what was written, byte for byte */
inline equal_clear_book_message(clear_book_message_read, clear_book_message_written) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> assert(clear_book_message_read.timestamp[clear_book_message_at] == clear_book_message_written.timestamp[clear_book_message_at]); clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> assert(clear_book_message_read.symbol[clear_book_message_at] == clear_book_message_written.symbol[clear_book_message_at]); clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Common Header: encoded, read back, and compared */
proctype check_common_header() {
  CommonHeader common_header_sent;
  CommonHeader common_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_common_header(common_header_sent, 0)
  :: pattern == 1 -> fill_common_header(common_header_sent, 32)
  :: pattern == 2 -> fill_common_header(common_header_sent, 255)
  :: else -> ramp_common_header(common_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_common_header(common_header_sent);
    assert(at == 18);
    at = 0;
    decode_common_header(common_header_got);
    assert(at == 18);
    equal_common_header(common_header_got, common_header_sent)
  }
}

/* Sbe Header: encoded, read back, and compared */
proctype check_sbe_header() {
  SbeHeader sbe_header_sent;
  SbeHeader sbe_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sbe_header(sbe_header_sent, 0)
  :: pattern == 1 -> fill_sbe_header(sbe_header_sent, 32)
  :: pattern == 2 -> fill_sbe_header(sbe_header_sent, 255)
  :: else -> ramp_sbe_header(sbe_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sbe_header(sbe_header_sent);
    assert(at == 6);
    at = 0;
    decode_sbe_header(sbe_header_got);
    assert(at == 6);
    equal_sbe_header(sbe_header_got, sbe_header_sent)
  }
}

/* Instrument Directory Message: encoded, read back, and compared */
proctype check_instrument_directory_message() {
  InstrumentDirectoryMessage instrument_directory_message_sent;
  InstrumentDirectoryMessage instrument_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_directory_message(instrument_directory_message_sent, 0)
  :: pattern == 1 -> fill_instrument_directory_message(instrument_directory_message_sent, 32)
  :: pattern == 2 -> fill_instrument_directory_message(instrument_directory_message_sent, 255)
  :: else -> ramp_instrument_directory_message(instrument_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_directory_message(instrument_directory_message_sent);
    assert(at == 56);
    at = 0;
    decode_instrument_directory_message(instrument_directory_message_got);
    assert(at == 56);
    equal_instrument_directory_message(instrument_directory_message_got, instrument_directory_message_sent)
  }
}

/* Instrument Trading Status Message: encoded, read back, and compared */
proctype check_instrument_trading_status_message() {
  InstrumentTradingStatusMessage instrument_trading_status_message_sent;
  InstrumentTradingStatusMessage instrument_trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_trading_status_message(instrument_trading_status_message_sent, 0)
  :: pattern == 1 -> fill_instrument_trading_status_message(instrument_trading_status_message_sent, 32)
  :: pattern == 2 -> fill_instrument_trading_status_message(instrument_trading_status_message_sent, 255)
  :: else -> ramp_instrument_trading_status_message(instrument_trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_trading_status_message(instrument_trading_status_message_sent);
    assert(at == 18);
    at = 0;
    decode_instrument_trading_status_message(instrument_trading_status_message_got);
    assert(at == 18);
    equal_instrument_trading_status_message(instrument_trading_status_message_got, instrument_trading_status_message_sent)
  }
}

/* Trading Session Status Message: encoded, read back, and compared */
proctype check_trading_session_status_message() {
  TradingSessionStatusMessage trading_session_status_message_sent;
  TradingSessionStatusMessage trading_session_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_status_message(trading_session_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_session_status_message(trading_session_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_session_status_message(trading_session_status_message_sent, 255)
  :: else -> ramp_trading_session_status_message(trading_session_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_status_message(trading_session_status_message_sent);
    assert(at == 9);
    at = 0;
    decode_trading_session_status_message(trading_session_status_message_got);
    assert(at == 9);
    equal_trading_session_status_message(trading_session_status_message_got, trading_session_status_message_sent)
  }
}

/* Broken Trade Message: encoded, read back, and compared */
proctype check_broken_trade_message() {
  BrokenTradeMessage broken_trade_message_sent;
  BrokenTradeMessage broken_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broken_trade_message(broken_trade_message_sent, 0)
  :: pattern == 1 -> fill_broken_trade_message(broken_trade_message_sent, 32)
  :: pattern == 2 -> fill_broken_trade_message(broken_trade_message_sent, 255)
  :: else -> ramp_broken_trade_message(broken_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broken_trade_message(broken_trade_message_sent);
    assert(at == 36);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 36);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
  }
}

/* Corrected Trade Message: encoded, read back, and compared */
proctype check_corrected_trade_message() {
  CorrectedTradeMessage corrected_trade_message_sent;
  CorrectedTradeMessage corrected_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_corrected_trade_message(corrected_trade_message_sent, 0)
  :: pattern == 1 -> fill_corrected_trade_message(corrected_trade_message_sent, 32)
  :: pattern == 2 -> fill_corrected_trade_message(corrected_trade_message_sent, 255)
  :: else -> ramp_corrected_trade_message(corrected_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_corrected_trade_message(corrected_trade_message_sent);
    assert(at == 48);
    at = 0;
    decode_corrected_trade_message(corrected_trade_message_got);
    assert(at == 48);
    equal_corrected_trade_message(corrected_trade_message_got, corrected_trade_message_sent)
  }
}

/* Snapshot Complete Message: encoded, read back, and compared */
proctype check_snapshot_complete_message() {
  SnapshotCompleteMessage snapshot_complete_message_sent;
  SnapshotCompleteMessage snapshot_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_complete_message(snapshot_complete_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_complete_message(snapshot_complete_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_complete_message(snapshot_complete_message_sent, 255)
  :: else -> ramp_snapshot_complete_message(snapshot_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_complete_message(snapshot_complete_message_sent);
    assert(at == 16);
    at = 0;
    decode_snapshot_complete_message(snapshot_complete_message_got);
    assert(at == 16);
    equal_snapshot_complete_message(snapshot_complete_message_got, snapshot_complete_message_sent)
  }
}

/* Order Added Short Message: encoded, read back, and compared */
proctype check_order_added_short_message() {
  OrderAddedShortMessage order_added_short_message_sent;
  OrderAddedShortMessage order_added_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_added_short_message(order_added_short_message_sent, 0)
  :: pattern == 1 -> fill_order_added_short_message(order_added_short_message_sent, 32)
  :: pattern == 2 -> fill_order_added_short_message(order_added_short_message_sent, 255)
  :: else -> ramp_order_added_short_message(order_added_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_added_short_message(order_added_short_message_sent);
    assert(at == 29);
    at = 0;
    decode_order_added_short_message(order_added_short_message_got);
    assert(at == 29);
    equal_order_added_short_message(order_added_short_message_got, order_added_short_message_sent)
  }
}

/* Order Added Long Message: encoded, read back, and compared */
proctype check_order_added_long_message() {
  OrderAddedLongMessage order_added_long_message_sent;
  OrderAddedLongMessage order_added_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_added_long_message(order_added_long_message_sent, 0)
  :: pattern == 1 -> fill_order_added_long_message(order_added_long_message_sent, 32)
  :: pattern == 2 -> fill_order_added_long_message(order_added_long_message_sent, 255)
  :: else -> ramp_order_added_long_message(order_added_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_added_long_message(order_added_long_message_sent);
    assert(at == 37);
    at = 0;
    decode_order_added_long_message(order_added_long_message_got);
    assert(at == 37);
    equal_order_added_long_message(order_added_long_message_got, order_added_long_message_sent)
  }
}

/* Order Added Extended Message: encoded, read back, and compared */
proctype check_order_added_extended_message() {
  OrderAddedExtendedMessage order_added_extended_message_sent;
  OrderAddedExtendedMessage order_added_extended_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_added_extended_message(order_added_extended_message_sent, 0)
  :: pattern == 1 -> fill_order_added_extended_message(order_added_extended_message_sent, 32)
  :: pattern == 2 -> fill_order_added_extended_message(order_added_extended_message_sent, 255)
  :: else -> ramp_order_added_extended_message(order_added_extended_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_added_extended_message(order_added_extended_message_sent);
    assert(at == 38);
    at = 0;
    decode_order_added_extended_message(order_added_extended_message_got);
    assert(at == 38);
    equal_order_added_extended_message(order_added_extended_message_got, order_added_extended_message_sent)
  }
}

/* Order Deleted Message: encoded, read back, and compared */
proctype check_order_deleted_message() {
  OrderDeletedMessage order_deleted_message_sent;
  OrderDeletedMessage order_deleted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_deleted_message(order_deleted_message_sent, 0)
  :: pattern == 1 -> fill_order_deleted_message(order_deleted_message_sent, 32)
  :: pattern == 2 -> fill_order_deleted_message(order_deleted_message_sent, 255)
  :: else -> ramp_order_deleted_message(order_deleted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_deleted_message(order_deleted_message_sent);
    assert(at == 25);
    at = 0;
    decode_order_deleted_message(order_deleted_message_got);
    assert(at == 25);
    equal_order_deleted_message(order_deleted_message_got, order_deleted_message_sent)
  }
}

/* Order Reduced Message: encoded, read back, and compared */
proctype check_order_reduced_message() {
  OrderReducedMessage order_reduced_message_sent;
  OrderReducedMessage order_reduced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_reduced_message(order_reduced_message_sent, 0)
  :: pattern == 1 -> fill_order_reduced_message(order_reduced_message_sent, 32)
  :: pattern == 2 -> fill_order_reduced_message(order_reduced_message_sent, 255)
  :: else -> ramp_order_reduced_message(order_reduced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_reduced_message(order_reduced_message_sent);
    assert(at == 42);
    at = 0;
    decode_order_reduced_message(order_reduced_message_got);
    assert(at == 42);
    equal_order_reduced_message(order_reduced_message_got, order_reduced_message_sent)
  }
}

/* Clear Book Message: encoded, read back, and compared */
proctype check_clear_book_message() {
  ClearBookMessage clear_book_message_sent;
  ClearBookMessage clear_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clear_book_message(clear_book_message_sent, 0)
  :: pattern == 1 -> fill_clear_book_message(clear_book_message_sent, 32)
  :: pattern == 2 -> fill_clear_book_message(clear_book_message_sent, 255)
  :: else -> ramp_clear_book_message(clear_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clear_book_message(clear_book_message_sent);
    assert(at == 16);
    at = 0;
    decode_clear_book_message(clear_book_message_got);
    assert(at == 16);
    equal_clear_book_message(clear_book_message_got, clear_book_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_common_header()
  :: run check_sbe_header()
  :: run check_instrument_directory_message()
  :: run check_instrument_trading_status_message()
  :: run check_trading_session_status_message()
  :: run check_broken_trade_message()
  :: run check_corrected_trade_message()
  :: run check_snapshot_complete_message()
  :: run check_order_added_short_message()
  :: run check_order_added_long_message()
  :: run check_order_added_extended_message()
  :: run check_order_deleted_message()
  :: run check_order_reduced_message()
  :: run check_clear_book_message()
  fi
}
