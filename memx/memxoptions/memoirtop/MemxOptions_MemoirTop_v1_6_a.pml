/*
 * The Members Exchange Member Order Information Record Top
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

/* ---- Options Instrument Status Message: 19 bytes ----------------------------- */

/* OptionsInstrumentStatusMessage */
typedef OptionsInstrumentStatusMessage {
  byte timestamp[8];
  byte symbol[8];
  byte instrument_trading_status;
  byte instrument_trading_status_reason;
  byte trading_session
};

int options_instrument_status_message_at;

/* every byte of Options Instrument Status Message set to one value */
inline fill_options_instrument_status_message(options_instrument_status_message_record, options_instrument_status_message_value) {
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> options_instrument_status_message_record.timestamp[options_instrument_status_message_at] = options_instrument_status_message_value; options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> options_instrument_status_message_record.symbol[options_instrument_status_message_at] = options_instrument_status_message_value; options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  options_instrument_status_message_record.instrument_trading_status = options_instrument_status_message_value;
  options_instrument_status_message_record.instrument_trading_status_reason = options_instrument_status_message_value;
  options_instrument_status_message_record.trading_session = options_instrument_status_message_value;
  skip
}

/* each byte of Options Instrument Status Message set to where it lies, so a field read out of place says so */
inline ramp_options_instrument_status_message(options_instrument_status_message_record, options_instrument_status_message_base) {
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> options_instrument_status_message_record.timestamp[options_instrument_status_message_at] = (options_instrument_status_message_base + 0 + options_instrument_status_message_at + 1) % 256; options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> options_instrument_status_message_record.symbol[options_instrument_status_message_at] = (options_instrument_status_message_base + 8 + options_instrument_status_message_at + 1) % 256; options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  options_instrument_status_message_record.instrument_trading_status = (options_instrument_status_message_base + 16 + 1) % 256;
  options_instrument_status_message_record.instrument_trading_status_reason = (options_instrument_status_message_base + 17 + 1) % 256;
  options_instrument_status_message_record.trading_session = (options_instrument_status_message_base + 18 + 1) % 256;
  skip
}

/* Options Instrument Status Message to the wire, 19 bytes from where the cursor stands */
inline encode_options_instrument_status_message(options_instrument_status_message_record) {
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> wire[at] = options_instrument_status_message_record.timestamp[options_instrument_status_message_at]; at = at + 1; options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> wire[at] = options_instrument_status_message_record.symbol[options_instrument_status_message_at]; at = at + 1; options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  wire[at] = options_instrument_status_message_record.instrument_trading_status; at = at + 1;
  wire[at] = options_instrument_status_message_record.instrument_trading_status_reason; at = at + 1;
  wire[at] = options_instrument_status_message_record.trading_session; at = at + 1;
  skip
}

/* Options Instrument Status Message off the wire, 19 bytes from where the cursor stands */
inline decode_options_instrument_status_message(options_instrument_status_message_record) {
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> options_instrument_status_message_record.timestamp[options_instrument_status_message_at] = wire[at]; at = at + 1; options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> options_instrument_status_message_record.symbol[options_instrument_status_message_at] = wire[at]; at = at + 1; options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  options_instrument_status_message_record.instrument_trading_status = wire[at]; at = at + 1;
  options_instrument_status_message_record.instrument_trading_status_reason = wire[at]; at = at + 1;
  options_instrument_status_message_record.trading_session = wire[at]; at = at + 1;
  skip
}

/* what was read of Options Instrument Status Message is what was written, byte for byte */
inline equal_options_instrument_status_message(options_instrument_status_message_read, options_instrument_status_message_written) {
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> assert(options_instrument_status_message_read.timestamp[options_instrument_status_message_at] == options_instrument_status_message_written.timestamp[options_instrument_status_message_at]); options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  options_instrument_status_message_at = 0;
  do
  :: options_instrument_status_message_at < 8 -> assert(options_instrument_status_message_read.symbol[options_instrument_status_message_at] == options_instrument_status_message_written.symbol[options_instrument_status_message_at]); options_instrument_status_message_at = options_instrument_status_message_at + 1
  :: else -> break
  od;
  assert(options_instrument_status_message_read.instrument_trading_status == options_instrument_status_message_written.instrument_trading_status);
  assert(options_instrument_status_message_read.instrument_trading_status_reason == options_instrument_status_message_written.instrument_trading_status_reason);
  assert(options_instrument_status_message_read.trading_session == options_instrument_status_message_written.trading_session);
  skip
}

/* ---- Underlier Instrument Status Message: 15 bytes --------------------------- */

/* UnderlierInstrumentStatusMessage */
typedef UnderlierInstrumentStatusMessage {
  byte timestamp[8];
  byte trading_session;
  byte underlier[6]
};

int underlier_instrument_status_message_at;

/* every byte of Underlier Instrument Status Message set to one value */
inline fill_underlier_instrument_status_message(underlier_instrument_status_message_record, underlier_instrument_status_message_value) {
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 8 -> underlier_instrument_status_message_record.timestamp[underlier_instrument_status_message_at] = underlier_instrument_status_message_value; underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
  underlier_instrument_status_message_record.trading_session = underlier_instrument_status_message_value;
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 6 -> underlier_instrument_status_message_record.underlier[underlier_instrument_status_message_at] = underlier_instrument_status_message_value; underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlier Instrument Status Message set to where it lies, so a field read out of place says so */
inline ramp_underlier_instrument_status_message(underlier_instrument_status_message_record, underlier_instrument_status_message_base) {
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 8 -> underlier_instrument_status_message_record.timestamp[underlier_instrument_status_message_at] = (underlier_instrument_status_message_base + 0 + underlier_instrument_status_message_at + 1) % 256; underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
  underlier_instrument_status_message_record.trading_session = (underlier_instrument_status_message_base + 8 + 1) % 256;
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 6 -> underlier_instrument_status_message_record.underlier[underlier_instrument_status_message_at] = (underlier_instrument_status_message_base + 9 + underlier_instrument_status_message_at + 1) % 256; underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlier Instrument Status Message to the wire, 15 bytes from where the cursor stands */
inline encode_underlier_instrument_status_message(underlier_instrument_status_message_record) {
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 8 -> wire[at] = underlier_instrument_status_message_record.timestamp[underlier_instrument_status_message_at]; at = at + 1; underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
  wire[at] = underlier_instrument_status_message_record.trading_session; at = at + 1;
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 6 -> wire[at] = underlier_instrument_status_message_record.underlier[underlier_instrument_status_message_at]; at = at + 1; underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlier Instrument Status Message off the wire, 15 bytes from where the cursor stands */
inline decode_underlier_instrument_status_message(underlier_instrument_status_message_record) {
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 8 -> underlier_instrument_status_message_record.timestamp[underlier_instrument_status_message_at] = wire[at]; at = at + 1; underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
  underlier_instrument_status_message_record.trading_session = wire[at]; at = at + 1;
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 6 -> underlier_instrument_status_message_record.underlier[underlier_instrument_status_message_at] = wire[at]; at = at + 1; underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlier Instrument Status Message is what was written, byte for byte */
inline equal_underlier_instrument_status_message(underlier_instrument_status_message_read, underlier_instrument_status_message_written) {
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 8 -> assert(underlier_instrument_status_message_read.timestamp[underlier_instrument_status_message_at] == underlier_instrument_status_message_written.timestamp[underlier_instrument_status_message_at]); underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
  assert(underlier_instrument_status_message_read.trading_session == underlier_instrument_status_message_written.trading_session);
  underlier_instrument_status_message_at = 0;
  do
  :: underlier_instrument_status_message_at < 6 -> assert(underlier_instrument_status_message_read.underlier[underlier_instrument_status_message_at] == underlier_instrument_status_message_written.underlier[underlier_instrument_status_message_at]); underlier_instrument_status_message_at = underlier_instrument_status_message_at + 1
  :: else -> break
  od;
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

/* ---- Best Bid Offer Message: 48 bytes ---------------------------------------- */

/* BestBidOfferMessage */
typedef BestBidOfferMessage {
  byte timestamp[8];
  byte symbol[8];
  byte total_bid_size[4];
  byte cust_bid_size[4];
  byte bid_price[8];
  byte total_offer_size[4];
  byte cust_offer_size[4];
  byte offer_price[8]
};

int best_bid_offer_message_at;

/* every byte of Best Bid Offer Message set to one value */
inline fill_best_bid_offer_message(best_bid_offer_message_record, best_bid_offer_message_value) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.timestamp[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.symbol[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.total_bid_size[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.cust_bid_size[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.bid_price[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.total_offer_size[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.cust_offer_size[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.offer_price[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid Offer Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_offer_message(best_bid_offer_message_record, best_bid_offer_message_base) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.timestamp[best_bid_offer_message_at] = (best_bid_offer_message_base + 0 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.symbol[best_bid_offer_message_at] = (best_bid_offer_message_base + 8 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.total_bid_size[best_bid_offer_message_at] = (best_bid_offer_message_base + 16 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.cust_bid_size[best_bid_offer_message_at] = (best_bid_offer_message_base + 20 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.bid_price[best_bid_offer_message_at] = (best_bid_offer_message_base + 24 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.total_offer_size[best_bid_offer_message_at] = (best_bid_offer_message_base + 32 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.cust_offer_size[best_bid_offer_message_at] = (best_bid_offer_message_base + 36 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.offer_price[best_bid_offer_message_at] = (best_bid_offer_message_base + 40 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Offer Message to the wire, 48 bytes from where the cursor stands */
inline encode_best_bid_offer_message(best_bid_offer_message_record) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> wire[at] = best_bid_offer_message_record.timestamp[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> wire[at] = best_bid_offer_message_record.symbol[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.total_bid_size[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.cust_bid_size[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> wire[at] = best_bid_offer_message_record.bid_price[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.total_offer_size[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.cust_offer_size[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> wire[at] = best_bid_offer_message_record.offer_price[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Offer Message off the wire, 48 bytes from where the cursor stands */
inline decode_best_bid_offer_message(best_bid_offer_message_record) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.timestamp[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.symbol[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.total_bid_size[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.cust_bid_size[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.bid_price[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.total_offer_size[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.cust_offer_size[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.offer_price[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid Offer Message is what was written, byte for byte */
inline equal_best_bid_offer_message(best_bid_offer_message_read, best_bid_offer_message_written) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> assert(best_bid_offer_message_read.timestamp[best_bid_offer_message_at] == best_bid_offer_message_written.timestamp[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> assert(best_bid_offer_message_read.symbol[best_bid_offer_message_at] == best_bid_offer_message_written.symbol[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.total_bid_size[best_bid_offer_message_at] == best_bid_offer_message_written.total_bid_size[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.cust_bid_size[best_bid_offer_message_at] == best_bid_offer_message_written.cust_bid_size[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> assert(best_bid_offer_message_read.bid_price[best_bid_offer_message_at] == best_bid_offer_message_written.bid_price[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.total_offer_size[best_bid_offer_message_at] == best_bid_offer_message_written.total_offer_size[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.cust_offer_size[best_bid_offer_message_at] == best_bid_offer_message_written.cust_offer_size[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> assert(best_bid_offer_message_read.offer_price[best_bid_offer_message_at] == best_bid_offer_message_written.offer_price[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Bid Message: 32 bytes ---------------------------------------------- */

/* BestBidMessage */
typedef BestBidMessage {
  byte timestamp[8];
  byte symbol[8];
  byte total_bid_size[4];
  byte cust_bid_size[4];
  byte bid_price[8]
};

int best_bid_message_at;

/* every byte of Best Bid Message set to one value */
inline fill_best_bid_message(best_bid_message_record, best_bid_message_value) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.timestamp[best_bid_message_at] = best_bid_message_value; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.symbol[best_bid_message_at] = best_bid_message_value; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> best_bid_message_record.total_bid_size[best_bid_message_at] = best_bid_message_value; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> best_bid_message_record.cust_bid_size[best_bid_message_at] = best_bid_message_value; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.bid_price[best_bid_message_at] = best_bid_message_value; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_message(best_bid_message_record, best_bid_message_base) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.timestamp[best_bid_message_at] = (best_bid_message_base + 0 + best_bid_message_at + 1) % 256; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.symbol[best_bid_message_at] = (best_bid_message_base + 8 + best_bid_message_at + 1) % 256; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> best_bid_message_record.total_bid_size[best_bid_message_at] = (best_bid_message_base + 16 + best_bid_message_at + 1) % 256; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> best_bid_message_record.cust_bid_size[best_bid_message_at] = (best_bid_message_base + 20 + best_bid_message_at + 1) % 256; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.bid_price[best_bid_message_at] = (best_bid_message_base + 24 + best_bid_message_at + 1) % 256; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Message to the wire, 32 bytes from where the cursor stands */
inline encode_best_bid_message(best_bid_message_record) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> wire[at] = best_bid_message_record.timestamp[best_bid_message_at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> wire[at] = best_bid_message_record.symbol[best_bid_message_at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> wire[at] = best_bid_message_record.total_bid_size[best_bid_message_at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> wire[at] = best_bid_message_record.cust_bid_size[best_bid_message_at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> wire[at] = best_bid_message_record.bid_price[best_bid_message_at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Message off the wire, 32 bytes from where the cursor stands */
inline decode_best_bid_message(best_bid_message_record) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.timestamp[best_bid_message_at] = wire[at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.symbol[best_bid_message_at] = wire[at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> best_bid_message_record.total_bid_size[best_bid_message_at] = wire[at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> best_bid_message_record.cust_bid_size[best_bid_message_at] = wire[at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.bid_price[best_bid_message_at] = wire[at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid Message is what was written, byte for byte */
inline equal_best_bid_message(best_bid_message_read, best_bid_message_written) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> assert(best_bid_message_read.timestamp[best_bid_message_at] == best_bid_message_written.timestamp[best_bid_message_at]); best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> assert(best_bid_message_read.symbol[best_bid_message_at] == best_bid_message_written.symbol[best_bid_message_at]); best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> assert(best_bid_message_read.total_bid_size[best_bid_message_at] == best_bid_message_written.total_bid_size[best_bid_message_at]); best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> assert(best_bid_message_read.cust_bid_size[best_bid_message_at] == best_bid_message_written.cust_bid_size[best_bid_message_at]); best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> assert(best_bid_message_read.bid_price[best_bid_message_at] == best_bid_message_written.bid_price[best_bid_message_at]); best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Offer Message: 32 bytes -------------------------------------------- */

/* BestOfferMessage */
typedef BestOfferMessage {
  byte timestamp[8];
  byte symbol[8];
  byte total_offer_size[4];
  byte cust_offer_size[4];
  byte offer_price[8]
};

int best_offer_message_at;

/* every byte of Best Offer Message set to one value */
inline fill_best_offer_message(best_offer_message_record, best_offer_message_value) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.timestamp[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.symbol[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.total_offer_size[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.cust_offer_size[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.offer_price[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Offer Message set to where it lies, so a field read out of place says so */
inline ramp_best_offer_message(best_offer_message_record, best_offer_message_base) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.timestamp[best_offer_message_at] = (best_offer_message_base + 0 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.symbol[best_offer_message_at] = (best_offer_message_base + 8 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.total_offer_size[best_offer_message_at] = (best_offer_message_base + 16 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.cust_offer_size[best_offer_message_at] = (best_offer_message_base + 20 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.offer_price[best_offer_message_at] = (best_offer_message_base + 24 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Offer Message to the wire, 32 bytes from where the cursor stands */
inline encode_best_offer_message(best_offer_message_record) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> wire[at] = best_offer_message_record.timestamp[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> wire[at] = best_offer_message_record.symbol[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> wire[at] = best_offer_message_record.total_offer_size[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> wire[at] = best_offer_message_record.cust_offer_size[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> wire[at] = best_offer_message_record.offer_price[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Offer Message off the wire, 32 bytes from where the cursor stands */
inline decode_best_offer_message(best_offer_message_record) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.timestamp[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.symbol[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.total_offer_size[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.cust_offer_size[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.offer_price[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Offer Message is what was written, byte for byte */
inline equal_best_offer_message(best_offer_message_read, best_offer_message_written) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> assert(best_offer_message_read.timestamp[best_offer_message_at] == best_offer_message_written.timestamp[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> assert(best_offer_message_read.symbol[best_offer_message_at] == best_offer_message_written.symbol[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> assert(best_offer_message_read.total_offer_size[best_offer_message_at] == best_offer_message_written.total_offer_size[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> assert(best_offer_message_read.cust_offer_size[best_offer_message_at] == best_offer_message_written.cust_offer_size[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> assert(best_offer_message_read.offer_price[best_offer_message_at] == best_offer_message_written.offer_price[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Bid Short Message: 22 bytes ---------------------------------------- */

/* BestBidShortMessage */
typedef BestBidShortMessage {
  byte timestamp[8];
  byte symbol[8];
  byte total_bid_size_short[2];
  byte cust_bid_size_short[2];
  byte bid_price_short[2]
};

int best_bid_short_message_at;

/* every byte of Best Bid Short Message set to one value */
inline fill_best_bid_short_message(best_bid_short_message_record, best_bid_short_message_value) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> best_bid_short_message_record.timestamp[best_bid_short_message_at] = best_bid_short_message_value; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> best_bid_short_message_record.symbol[best_bid_short_message_at] = best_bid_short_message_value; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.total_bid_size_short[best_bid_short_message_at] = best_bid_short_message_value; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.cust_bid_size_short[best_bid_short_message_at] = best_bid_short_message_value; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.bid_price_short[best_bid_short_message_at] = best_bid_short_message_value; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid Short Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_short_message(best_bid_short_message_record, best_bid_short_message_base) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> best_bid_short_message_record.timestamp[best_bid_short_message_at] = (best_bid_short_message_base + 0 + best_bid_short_message_at + 1) % 256; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> best_bid_short_message_record.symbol[best_bid_short_message_at] = (best_bid_short_message_base + 8 + best_bid_short_message_at + 1) % 256; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.total_bid_size_short[best_bid_short_message_at] = (best_bid_short_message_base + 16 + best_bid_short_message_at + 1) % 256; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.cust_bid_size_short[best_bid_short_message_at] = (best_bid_short_message_base + 18 + best_bid_short_message_at + 1) % 256; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.bid_price_short[best_bid_short_message_at] = (best_bid_short_message_base + 20 + best_bid_short_message_at + 1) % 256; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Short Message to the wire, 22 bytes from where the cursor stands */
inline encode_best_bid_short_message(best_bid_short_message_record) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> wire[at] = best_bid_short_message_record.timestamp[best_bid_short_message_at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> wire[at] = best_bid_short_message_record.symbol[best_bid_short_message_at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> wire[at] = best_bid_short_message_record.total_bid_size_short[best_bid_short_message_at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> wire[at] = best_bid_short_message_record.cust_bid_size_short[best_bid_short_message_at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> wire[at] = best_bid_short_message_record.bid_price_short[best_bid_short_message_at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Short Message off the wire, 22 bytes from where the cursor stands */
inline decode_best_bid_short_message(best_bid_short_message_record) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> best_bid_short_message_record.timestamp[best_bid_short_message_at] = wire[at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> best_bid_short_message_record.symbol[best_bid_short_message_at] = wire[at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.total_bid_size_short[best_bid_short_message_at] = wire[at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.cust_bid_size_short[best_bid_short_message_at] = wire[at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.bid_price_short[best_bid_short_message_at] = wire[at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid Short Message is what was written, byte for byte */
inline equal_best_bid_short_message(best_bid_short_message_read, best_bid_short_message_written) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> assert(best_bid_short_message_read.timestamp[best_bid_short_message_at] == best_bid_short_message_written.timestamp[best_bid_short_message_at]); best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> assert(best_bid_short_message_read.symbol[best_bid_short_message_at] == best_bid_short_message_written.symbol[best_bid_short_message_at]); best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> assert(best_bid_short_message_read.total_bid_size_short[best_bid_short_message_at] == best_bid_short_message_written.total_bid_size_short[best_bid_short_message_at]); best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> assert(best_bid_short_message_read.cust_bid_size_short[best_bid_short_message_at] == best_bid_short_message_written.cust_bid_size_short[best_bid_short_message_at]); best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> assert(best_bid_short_message_read.bid_price_short[best_bid_short_message_at] == best_bid_short_message_written.bid_price_short[best_bid_short_message_at]); best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Offer Short Message: 22 bytes -------------------------------------- */

/* BestOfferShortMessage */
typedef BestOfferShortMessage {
  byte timestamp[8];
  byte symbol[8];
  byte total_offer_size_short[2];
  byte cust_offer_size_short[2];
  byte offer_price_short[2]
};

int best_offer_short_message_at;

/* every byte of Best Offer Short Message set to one value */
inline fill_best_offer_short_message(best_offer_short_message_record, best_offer_short_message_value) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> best_offer_short_message_record.timestamp[best_offer_short_message_at] = best_offer_short_message_value; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> best_offer_short_message_record.symbol[best_offer_short_message_at] = best_offer_short_message_value; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.total_offer_size_short[best_offer_short_message_at] = best_offer_short_message_value; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.cust_offer_size_short[best_offer_short_message_at] = best_offer_short_message_value; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.offer_price_short[best_offer_short_message_at] = best_offer_short_message_value; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Offer Short Message set to where it lies, so a field read out of place says so */
inline ramp_best_offer_short_message(best_offer_short_message_record, best_offer_short_message_base) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> best_offer_short_message_record.timestamp[best_offer_short_message_at] = (best_offer_short_message_base + 0 + best_offer_short_message_at + 1) % 256; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> best_offer_short_message_record.symbol[best_offer_short_message_at] = (best_offer_short_message_base + 8 + best_offer_short_message_at + 1) % 256; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.total_offer_size_short[best_offer_short_message_at] = (best_offer_short_message_base + 16 + best_offer_short_message_at + 1) % 256; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.cust_offer_size_short[best_offer_short_message_at] = (best_offer_short_message_base + 18 + best_offer_short_message_at + 1) % 256; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.offer_price_short[best_offer_short_message_at] = (best_offer_short_message_base + 20 + best_offer_short_message_at + 1) % 256; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Offer Short Message to the wire, 22 bytes from where the cursor stands */
inline encode_best_offer_short_message(best_offer_short_message_record) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> wire[at] = best_offer_short_message_record.timestamp[best_offer_short_message_at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> wire[at] = best_offer_short_message_record.symbol[best_offer_short_message_at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> wire[at] = best_offer_short_message_record.total_offer_size_short[best_offer_short_message_at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> wire[at] = best_offer_short_message_record.cust_offer_size_short[best_offer_short_message_at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> wire[at] = best_offer_short_message_record.offer_price_short[best_offer_short_message_at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Offer Short Message off the wire, 22 bytes from where the cursor stands */
inline decode_best_offer_short_message(best_offer_short_message_record) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> best_offer_short_message_record.timestamp[best_offer_short_message_at] = wire[at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> best_offer_short_message_record.symbol[best_offer_short_message_at] = wire[at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.total_offer_size_short[best_offer_short_message_at] = wire[at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.cust_offer_size_short[best_offer_short_message_at] = wire[at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.offer_price_short[best_offer_short_message_at] = wire[at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Offer Short Message is what was written, byte for byte */
inline equal_best_offer_short_message(best_offer_short_message_read, best_offer_short_message_written) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> assert(best_offer_short_message_read.timestamp[best_offer_short_message_at] == best_offer_short_message_written.timestamp[best_offer_short_message_at]); best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> assert(best_offer_short_message_read.symbol[best_offer_short_message_at] == best_offer_short_message_written.symbol[best_offer_short_message_at]); best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> assert(best_offer_short_message_read.total_offer_size_short[best_offer_short_message_at] == best_offer_short_message_written.total_offer_size_short[best_offer_short_message_at]); best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> assert(best_offer_short_message_read.cust_offer_size_short[best_offer_short_message_at] == best_offer_short_message_written.cust_offer_size_short[best_offer_short_message_at]); best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> assert(best_offer_short_message_read.offer_price_short[best_offer_short_message_at] == best_offer_short_message_written.offer_price_short[best_offer_short_message_at]); best_offer_short_message_at = best_offer_short_message_at + 1
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

/* Options Instrument Status Message: encoded, read back, and compared */
proctype check_options_instrument_status_message() {
  OptionsInstrumentStatusMessage options_instrument_status_message_sent;
  OptionsInstrumentStatusMessage options_instrument_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_instrument_status_message(options_instrument_status_message_sent, 0)
  :: pattern == 1 -> fill_options_instrument_status_message(options_instrument_status_message_sent, 32)
  :: pattern == 2 -> fill_options_instrument_status_message(options_instrument_status_message_sent, 255)
  :: else -> ramp_options_instrument_status_message(options_instrument_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_instrument_status_message(options_instrument_status_message_sent);
    assert(at == 19);
    at = 0;
    decode_options_instrument_status_message(options_instrument_status_message_got);
    assert(at == 19);
    equal_options_instrument_status_message(options_instrument_status_message_got, options_instrument_status_message_sent)
  }
}

/* Underlier Instrument Status Message: encoded, read back, and compared */
proctype check_underlier_instrument_status_message() {
  UnderlierInstrumentStatusMessage underlier_instrument_status_message_sent;
  UnderlierInstrumentStatusMessage underlier_instrument_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlier_instrument_status_message(underlier_instrument_status_message_sent, 0)
  :: pattern == 1 -> fill_underlier_instrument_status_message(underlier_instrument_status_message_sent, 32)
  :: pattern == 2 -> fill_underlier_instrument_status_message(underlier_instrument_status_message_sent, 255)
  :: else -> ramp_underlier_instrument_status_message(underlier_instrument_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlier_instrument_status_message(underlier_instrument_status_message_sent);
    assert(at == 15);
    at = 0;
    decode_underlier_instrument_status_message(underlier_instrument_status_message_got);
    assert(at == 15);
    equal_underlier_instrument_status_message(underlier_instrument_status_message_got, underlier_instrument_status_message_sent)
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

/* Best Bid Offer Message: encoded, read back, and compared */
proctype check_best_bid_offer_message() {
  BestBidOfferMessage best_bid_offer_message_sent;
  BestBidOfferMessage best_bid_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_offer_message(best_bid_offer_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_offer_message(best_bid_offer_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_offer_message(best_bid_offer_message_sent, 255)
  :: else -> ramp_best_bid_offer_message(best_bid_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_offer_message(best_bid_offer_message_sent);
    assert(at == 48);
    at = 0;
    decode_best_bid_offer_message(best_bid_offer_message_got);
    assert(at == 48);
    equal_best_bid_offer_message(best_bid_offer_message_got, best_bid_offer_message_sent)
  }
}

/* Best Bid Message: encoded, read back, and compared */
proctype check_best_bid_message() {
  BestBidMessage best_bid_message_sent;
  BestBidMessage best_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_message(best_bid_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_message(best_bid_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_message(best_bid_message_sent, 255)
  :: else -> ramp_best_bid_message(best_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_message(best_bid_message_sent);
    assert(at == 32);
    at = 0;
    decode_best_bid_message(best_bid_message_got);
    assert(at == 32);
    equal_best_bid_message(best_bid_message_got, best_bid_message_sent)
  }
}

/* Best Offer Message: encoded, read back, and compared */
proctype check_best_offer_message() {
  BestOfferMessage best_offer_message_sent;
  BestOfferMessage best_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_offer_message(best_offer_message_sent, 0)
  :: pattern == 1 -> fill_best_offer_message(best_offer_message_sent, 32)
  :: pattern == 2 -> fill_best_offer_message(best_offer_message_sent, 255)
  :: else -> ramp_best_offer_message(best_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_offer_message(best_offer_message_sent);
    assert(at == 32);
    at = 0;
    decode_best_offer_message(best_offer_message_got);
    assert(at == 32);
    equal_best_offer_message(best_offer_message_got, best_offer_message_sent)
  }
}

/* Best Bid Short Message: encoded, read back, and compared */
proctype check_best_bid_short_message() {
  BestBidShortMessage best_bid_short_message_sent;
  BestBidShortMessage best_bid_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_short_message(best_bid_short_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_short_message(best_bid_short_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_short_message(best_bid_short_message_sent, 255)
  :: else -> ramp_best_bid_short_message(best_bid_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_short_message(best_bid_short_message_sent);
    assert(at == 22);
    at = 0;
    decode_best_bid_short_message(best_bid_short_message_got);
    assert(at == 22);
    equal_best_bid_short_message(best_bid_short_message_got, best_bid_short_message_sent)
  }
}

/* Best Offer Short Message: encoded, read back, and compared */
proctype check_best_offer_short_message() {
  BestOfferShortMessage best_offer_short_message_sent;
  BestOfferShortMessage best_offer_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_offer_short_message(best_offer_short_message_sent, 0)
  :: pattern == 1 -> fill_best_offer_short_message(best_offer_short_message_sent, 32)
  :: pattern == 2 -> fill_best_offer_short_message(best_offer_short_message_sent, 255)
  :: else -> ramp_best_offer_short_message(best_offer_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_offer_short_message(best_offer_short_message_sent);
    assert(at == 22);
    at = 0;
    decode_best_offer_short_message(best_offer_short_message_got);
    assert(at == 22);
    equal_best_offer_short_message(best_offer_short_message_got, best_offer_short_message_sent)
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
  :: run check_options_instrument_status_message()
  :: run check_underlier_instrument_status_message()
  :: run check_broken_trade_message()
  :: run check_corrected_trade_message()
  :: run check_snapshot_complete_message()
  :: run check_best_bid_offer_message()
  :: run check_best_bid_message()
  :: run check_best_offer_message()
  :: run check_best_bid_short_message()
  :: run check_best_offer_short_message()
  :: run check_clear_book_message()
  fi
}
