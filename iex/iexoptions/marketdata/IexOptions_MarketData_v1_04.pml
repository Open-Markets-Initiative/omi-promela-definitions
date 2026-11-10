/*
 * Investors Exchange Market Data
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
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *   - a field present only on a condition
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 68

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* Iex Options Sbe message header — message identifiers and length of message root */
typedef MessageHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
  byte version[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 8 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.block_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.template_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.schema_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.version[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 8 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.block_length[message_header_at] == message_header_written.block_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.template_id[message_header_at] == message_header_written.template_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.schema_id[message_header_at] == message_header_written.schema_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.version[message_header_at] == message_header_written.version[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Ref Data Message: 31 bytes ----------------------------------- */

/* UnderlyingRefDataMessage */
typedef UnderlyingRefDataMessage {
  byte time[8];
  byte underlying_id[4];
  byte underlying_symbol[16];
  byte exchange_code;
  byte mpv_group;
  byte close_indicator
};

int underlying_ref_data_message_at;

/* every byte of Underlying Ref Data Message set to one value */
inline fill_underlying_ref_data_message(underlying_ref_data_message_record, underlying_ref_data_message_value) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> underlying_ref_data_message_record.time[underlying_ref_data_message_at] = underlying_ref_data_message_value; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> underlying_ref_data_message_record.underlying_id[underlying_ref_data_message_at] = underlying_ref_data_message_value; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 16 -> underlying_ref_data_message_record.underlying_symbol[underlying_ref_data_message_at] = underlying_ref_data_message_value; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_record.exchange_code = underlying_ref_data_message_value;
  underlying_ref_data_message_record.mpv_group = underlying_ref_data_message_value;
  underlying_ref_data_message_record.close_indicator = underlying_ref_data_message_value;
  skip
}

/* each byte of Underlying Ref Data Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_ref_data_message(underlying_ref_data_message_record, underlying_ref_data_message_base) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> underlying_ref_data_message_record.time[underlying_ref_data_message_at] = (underlying_ref_data_message_base + 0 + underlying_ref_data_message_at + 1) % 256; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> underlying_ref_data_message_record.underlying_id[underlying_ref_data_message_at] = (underlying_ref_data_message_base + 8 + underlying_ref_data_message_at + 1) % 256; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 16 -> underlying_ref_data_message_record.underlying_symbol[underlying_ref_data_message_at] = (underlying_ref_data_message_base + 12 + underlying_ref_data_message_at + 1) % 256; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_record.exchange_code = (underlying_ref_data_message_base + 28 + 1) % 256;
  underlying_ref_data_message_record.mpv_group = (underlying_ref_data_message_base + 29 + 1) % 256;
  underlying_ref_data_message_record.close_indicator = (underlying_ref_data_message_base + 30 + 1) % 256;
  skip
}

/* Underlying Ref Data Message to the wire, 31 bytes from where the cursor stands */
inline encode_underlying_ref_data_message(underlying_ref_data_message_record) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> wire[at] = underlying_ref_data_message_record.time[underlying_ref_data_message_at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> wire[at] = underlying_ref_data_message_record.underlying_id[underlying_ref_data_message_at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 16 -> wire[at] = underlying_ref_data_message_record.underlying_symbol[underlying_ref_data_message_at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_ref_data_message_record.exchange_code; at = at + 1;
  wire[at] = underlying_ref_data_message_record.mpv_group; at = at + 1;
  wire[at] = underlying_ref_data_message_record.close_indicator; at = at + 1;
  skip
}

/* Underlying Ref Data Message off the wire, 31 bytes from where the cursor stands */
inline decode_underlying_ref_data_message(underlying_ref_data_message_record) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> underlying_ref_data_message_record.time[underlying_ref_data_message_at] = wire[at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> underlying_ref_data_message_record.underlying_id[underlying_ref_data_message_at] = wire[at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 16 -> underlying_ref_data_message_record.underlying_symbol[underlying_ref_data_message_at] = wire[at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_record.exchange_code = wire[at]; at = at + 1;
  underlying_ref_data_message_record.mpv_group = wire[at]; at = at + 1;
  underlying_ref_data_message_record.close_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Underlying Ref Data Message is what was written, byte for byte */
inline equal_underlying_ref_data_message(underlying_ref_data_message_read, underlying_ref_data_message_written) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> assert(underlying_ref_data_message_read.time[underlying_ref_data_message_at] == underlying_ref_data_message_written.time[underlying_ref_data_message_at]); underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> assert(underlying_ref_data_message_read.underlying_id[underlying_ref_data_message_at] == underlying_ref_data_message_written.underlying_id[underlying_ref_data_message_at]); underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 16 -> assert(underlying_ref_data_message_read.underlying_symbol[underlying_ref_data_message_at] == underlying_ref_data_message_written.underlying_symbol[underlying_ref_data_message_at]); underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  assert(underlying_ref_data_message_read.exchange_code == underlying_ref_data_message_written.exchange_code);
  assert(underlying_ref_data_message_read.mpv_group == underlying_ref_data_message_written.mpv_group);
  assert(underlying_ref_data_message_read.close_indicator == underlying_ref_data_message_written.close_indicator);
  skip
}

/* ---- Symbol Mapping Message: 68 bytes ---------------------------------------- */

/* SymbolMappingMessage */
typedef SymbolMappingMessage {
  byte time[8];
  byte instrument_id[4];
  byte osi_symbol[32];
  byte trading_ring;
  byte closing_only_series;
  byte underlying_id[4];
  byte maturity_date[8];
  byte option_type;
  byte strike_price[8];
  byte orp_enablement
};

int symbol_mapping_message_at;

/* every byte of Symbol Mapping Message set to one value */
inline fill_symbol_mapping_message(symbol_mapping_message_record, symbol_mapping_message_value) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.time[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> symbol_mapping_message_record.instrument_id[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 32 -> symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.trading_ring = symbol_mapping_message_value;
  symbol_mapping_message_record.closing_only_series = symbol_mapping_message_value;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> symbol_mapping_message_record.underlying_id[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.maturity_date[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.option_type = symbol_mapping_message_value;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.strike_price[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.orp_enablement = symbol_mapping_message_value;
  skip
}

/* each byte of Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_mapping_message(symbol_mapping_message_record, symbol_mapping_message_base) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.time[symbol_mapping_message_at] = (symbol_mapping_message_base + 0 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> symbol_mapping_message_record.instrument_id[symbol_mapping_message_at] = (symbol_mapping_message_base + 8 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 32 -> symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at] = (symbol_mapping_message_base + 12 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.trading_ring = (symbol_mapping_message_base + 44 + 1) % 256;
  symbol_mapping_message_record.closing_only_series = (symbol_mapping_message_base + 45 + 1) % 256;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> symbol_mapping_message_record.underlying_id[symbol_mapping_message_at] = (symbol_mapping_message_base + 46 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.maturity_date[symbol_mapping_message_at] = (symbol_mapping_message_base + 50 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.option_type = (symbol_mapping_message_base + 58 + 1) % 256;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.strike_price[symbol_mapping_message_at] = (symbol_mapping_message_base + 59 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.orp_enablement = (symbol_mapping_message_base + 67 + 1) % 256;
  skip
}

/* Symbol Mapping Message to the wire, 68 bytes from where the cursor stands */
inline encode_symbol_mapping_message(symbol_mapping_message_record) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> wire[at] = symbol_mapping_message_record.time[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> wire[at] = symbol_mapping_message_record.instrument_id[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 32 -> wire[at] = symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_mapping_message_record.trading_ring; at = at + 1;
  wire[at] = symbol_mapping_message_record.closing_only_series; at = at + 1;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> wire[at] = symbol_mapping_message_record.underlying_id[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> wire[at] = symbol_mapping_message_record.maturity_date[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_mapping_message_record.option_type; at = at + 1;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> wire[at] = symbol_mapping_message_record.strike_price[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_mapping_message_record.orp_enablement; at = at + 1;
  skip
}

/* Symbol Mapping Message off the wire, 68 bytes from where the cursor stands */
inline decode_symbol_mapping_message(symbol_mapping_message_record) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.time[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> symbol_mapping_message_record.instrument_id[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 32 -> symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.trading_ring = wire[at]; at = at + 1;
  symbol_mapping_message_record.closing_only_series = wire[at]; at = at + 1;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> symbol_mapping_message_record.underlying_id[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.maturity_date[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.option_type = wire[at]; at = at + 1;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.strike_price[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.orp_enablement = wire[at]; at = at + 1;
  skip
}

/* what was read of Symbol Mapping Message is what was written, byte for byte */
inline equal_symbol_mapping_message(symbol_mapping_message_read, symbol_mapping_message_written) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> assert(symbol_mapping_message_read.time[symbol_mapping_message_at] == symbol_mapping_message_written.time[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> assert(symbol_mapping_message_read.instrument_id[symbol_mapping_message_at] == symbol_mapping_message_written.instrument_id[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 32 -> assert(symbol_mapping_message_read.osi_symbol[symbol_mapping_message_at] == symbol_mapping_message_written.osi_symbol[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(symbol_mapping_message_read.trading_ring == symbol_mapping_message_written.trading_ring);
  assert(symbol_mapping_message_read.closing_only_series == symbol_mapping_message_written.closing_only_series);
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 4 -> assert(symbol_mapping_message_read.underlying_id[symbol_mapping_message_at] == symbol_mapping_message_written.underlying_id[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> assert(symbol_mapping_message_read.maturity_date[symbol_mapping_message_at] == symbol_mapping_message_written.maturity_date[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(symbol_mapping_message_read.option_type == symbol_mapping_message_written.option_type);
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> assert(symbol_mapping_message_read.strike_price[symbol_mapping_message_at] == symbol_mapping_message_written.strike_price[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(symbol_mapping_message_read.orp_enablement == symbol_mapping_message_written.orp_enablement);
  skip
}

/* ---- Instrument Clear Message: 12 bytes -------------------------------------- */

/* InstrumentClearMessage */
typedef InstrumentClearMessage {
  byte time[8];
  byte instrument_id[4]
};

int instrument_clear_message_at;

/* every byte of Instrument Clear Message set to one value */
inline fill_instrument_clear_message(instrument_clear_message_record, instrument_clear_message_value) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> instrument_clear_message_record.time[instrument_clear_message_at] = instrument_clear_message_value; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> instrument_clear_message_record.instrument_id[instrument_clear_message_at] = instrument_clear_message_value; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Clear Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_clear_message(instrument_clear_message_record, instrument_clear_message_base) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> instrument_clear_message_record.time[instrument_clear_message_at] = (instrument_clear_message_base + 0 + instrument_clear_message_at + 1) % 256; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> instrument_clear_message_record.instrument_id[instrument_clear_message_at] = (instrument_clear_message_base + 8 + instrument_clear_message_at + 1) % 256; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Clear Message to the wire, 12 bytes from where the cursor stands */
inline encode_instrument_clear_message(instrument_clear_message_record) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> wire[at] = instrument_clear_message_record.time[instrument_clear_message_at]; at = at + 1; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> wire[at] = instrument_clear_message_record.instrument_id[instrument_clear_message_at]; at = at + 1; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Clear Message off the wire, 12 bytes from where the cursor stands */
inline decode_instrument_clear_message(instrument_clear_message_record) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> instrument_clear_message_record.time[instrument_clear_message_at] = wire[at]; at = at + 1; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> instrument_clear_message_record.instrument_id[instrument_clear_message_at] = wire[at]; at = at + 1; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Clear Message is what was written, byte for byte */
inline equal_instrument_clear_message(instrument_clear_message_read, instrument_clear_message_written) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> assert(instrument_clear_message_read.time[instrument_clear_message_at] == instrument_clear_message_written.time[instrument_clear_message_at]); instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> assert(instrument_clear_message_read.instrument_id[instrument_clear_message_at] == instrument_clear_message_written.instrument_id[instrument_clear_message_at]); instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 13 bytes ---------------------------------------- */

/* TradingStatusMessage */
typedef TradingStatusMessage {
  byte time[8];
  byte instrument_id[4];
  byte trading_status
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.time[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.instrument_id[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.time[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.instrument_id[trading_status_message_at] = (trading_status_message_base + 8 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = (trading_status_message_base + 12 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 13 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.time[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.instrument_id[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 13 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.time[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.instrument_id[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.time[trading_status_message_at] == trading_status_message_written.time[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.instrument_id[trading_status_message_at] == trading_status_message_written.instrument_id[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  skip
}

/* ---- Options Auction Summary Message: 25 bytes ------------------------------- */

/* OptionsAuctionSummaryMessage */
typedef OptionsAuctionSummaryMessage {
  byte time[8];
  byte instrument_id[4];
  byte auction_summary_type;
  byte price[8];
  byte contracts[4]
};

int options_auction_summary_message_at;

/* every byte of Options Auction Summary Message set to one value */
inline fill_options_auction_summary_message(options_auction_summary_message_record, options_auction_summary_message_value) {
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> options_auction_summary_message_record.time[options_auction_summary_message_at] = options_auction_summary_message_value; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> options_auction_summary_message_record.instrument_id[options_auction_summary_message_at] = options_auction_summary_message_value; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_record.auction_summary_type = options_auction_summary_message_value;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> options_auction_summary_message_record.price[options_auction_summary_message_at] = options_auction_summary_message_value; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> options_auction_summary_message_record.contracts[options_auction_summary_message_at] = options_auction_summary_message_value; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_options_auction_summary_message(options_auction_summary_message_record, options_auction_summary_message_base) {
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> options_auction_summary_message_record.time[options_auction_summary_message_at] = (options_auction_summary_message_base + 0 + options_auction_summary_message_at + 1) % 256; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> options_auction_summary_message_record.instrument_id[options_auction_summary_message_at] = (options_auction_summary_message_base + 8 + options_auction_summary_message_at + 1) % 256; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_record.auction_summary_type = (options_auction_summary_message_base + 12 + 1) % 256;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> options_auction_summary_message_record.price[options_auction_summary_message_at] = (options_auction_summary_message_base + 13 + options_auction_summary_message_at + 1) % 256; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> options_auction_summary_message_record.contracts[options_auction_summary_message_at] = (options_auction_summary_message_base + 21 + options_auction_summary_message_at + 1) % 256; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Auction Summary Message to the wire, 25 bytes from where the cursor stands */
inline encode_options_auction_summary_message(options_auction_summary_message_record) {
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> wire[at] = options_auction_summary_message_record.time[options_auction_summary_message_at]; at = at + 1; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> wire[at] = options_auction_summary_message_record.instrument_id[options_auction_summary_message_at]; at = at + 1; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = options_auction_summary_message_record.auction_summary_type; at = at + 1;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> wire[at] = options_auction_summary_message_record.price[options_auction_summary_message_at]; at = at + 1; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> wire[at] = options_auction_summary_message_record.contracts[options_auction_summary_message_at]; at = at + 1; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Auction Summary Message off the wire, 25 bytes from where the cursor stands */
inline decode_options_auction_summary_message(options_auction_summary_message_record) {
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> options_auction_summary_message_record.time[options_auction_summary_message_at] = wire[at]; at = at + 1; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> options_auction_summary_message_record.instrument_id[options_auction_summary_message_at] = wire[at]; at = at + 1; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_record.auction_summary_type = wire[at]; at = at + 1;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> options_auction_summary_message_record.price[options_auction_summary_message_at] = wire[at]; at = at + 1; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> options_auction_summary_message_record.contracts[options_auction_summary_message_at] = wire[at]; at = at + 1; options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Auction Summary Message is what was written, byte for byte */
inline equal_options_auction_summary_message(options_auction_summary_message_read, options_auction_summary_message_written) {
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> assert(options_auction_summary_message_read.time[options_auction_summary_message_at] == options_auction_summary_message_written.time[options_auction_summary_message_at]); options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> assert(options_auction_summary_message_read.instrument_id[options_auction_summary_message_at] == options_auction_summary_message_written.instrument_id[options_auction_summary_message_at]); options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  assert(options_auction_summary_message_read.auction_summary_type == options_auction_summary_message_written.auction_summary_type);
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 8 -> assert(options_auction_summary_message_read.price[options_auction_summary_message_at] == options_auction_summary_message_written.price[options_auction_summary_message_at]); options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  options_auction_summary_message_at = 0;
  do
  :: options_auction_summary_message_at < 4 -> assert(options_auction_summary_message_read.contracts[options_auction_summary_message_at] == options_auction_summary_message_written.contracts[options_auction_summary_message_at]); options_auction_summary_message_at = options_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Auction Width Update Message: 13 bytes -------------------------- */

/* OptionsAuctionWidthUpdateMessage */
typedef OptionsAuctionWidthUpdateMessage {
  byte time[8];
  byte underlying_id[4];
  byte quote_relief_multiplier
};

int options_auction_width_update_message_at;

/* every byte of Options Auction Width Update Message set to one value */
inline fill_options_auction_width_update_message(options_auction_width_update_message_record, options_auction_width_update_message_value) {
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 8 -> options_auction_width_update_message_record.time[options_auction_width_update_message_at] = options_auction_width_update_message_value; options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 4 -> options_auction_width_update_message_record.underlying_id[options_auction_width_update_message_at] = options_auction_width_update_message_value; options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  options_auction_width_update_message_record.quote_relief_multiplier = options_auction_width_update_message_value;
  skip
}

/* each byte of Options Auction Width Update Message set to where it lies, so a field read out of place says so */
inline ramp_options_auction_width_update_message(options_auction_width_update_message_record, options_auction_width_update_message_base) {
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 8 -> options_auction_width_update_message_record.time[options_auction_width_update_message_at] = (options_auction_width_update_message_base + 0 + options_auction_width_update_message_at + 1) % 256; options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 4 -> options_auction_width_update_message_record.underlying_id[options_auction_width_update_message_at] = (options_auction_width_update_message_base + 8 + options_auction_width_update_message_at + 1) % 256; options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  options_auction_width_update_message_record.quote_relief_multiplier = (options_auction_width_update_message_base + 12 + 1) % 256;
  skip
}

/* Options Auction Width Update Message to the wire, 13 bytes from where the cursor stands */
inline encode_options_auction_width_update_message(options_auction_width_update_message_record) {
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 8 -> wire[at] = options_auction_width_update_message_record.time[options_auction_width_update_message_at]; at = at + 1; options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 4 -> wire[at] = options_auction_width_update_message_record.underlying_id[options_auction_width_update_message_at]; at = at + 1; options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  wire[at] = options_auction_width_update_message_record.quote_relief_multiplier; at = at + 1;
  skip
}

/* Options Auction Width Update Message off the wire, 13 bytes from where the cursor stands */
inline decode_options_auction_width_update_message(options_auction_width_update_message_record) {
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 8 -> options_auction_width_update_message_record.time[options_auction_width_update_message_at] = wire[at]; at = at + 1; options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 4 -> options_auction_width_update_message_record.underlying_id[options_auction_width_update_message_at] = wire[at]; at = at + 1; options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  options_auction_width_update_message_record.quote_relief_multiplier = wire[at]; at = at + 1;
  skip
}

/* what was read of Options Auction Width Update Message is what was written, byte for byte */
inline equal_options_auction_width_update_message(options_auction_width_update_message_read, options_auction_width_update_message_written) {
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 8 -> assert(options_auction_width_update_message_read.time[options_auction_width_update_message_at] == options_auction_width_update_message_written.time[options_auction_width_update_message_at]); options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  options_auction_width_update_message_at = 0;
  do
  :: options_auction_width_update_message_at < 4 -> assert(options_auction_width_update_message_read.underlying_id[options_auction_width_update_message_at] == options_auction_width_update_message_written.underlying_id[options_auction_width_update_message_at]); options_auction_width_update_message_at = options_auction_width_update_message_at + 1
  :: else -> break
  od;
  assert(options_auction_width_update_message_read.quote_relief_multiplier == options_auction_width_update_message_written.quote_relief_multiplier);
  skip
}

/* ---- Liquidity Event Notification Message: 39 bytes -------------------------- */

/* LiquidityEventNotificationMessage */
typedef LiquidityEventNotificationMessage {
  byte time[8];
  byte instrument_id[4];
  byte event_id[4];
  byte liquidity_event_type;
  byte side;
  byte price[8];
  byte contracts[4];
  byte capacity;
  byte participant_id[4];
  byte event_end_offset[4]
};

int liquidity_event_notification_message_at;

/* every byte of Liquidity Event Notification Message set to one value */
inline fill_liquidity_event_notification_message(liquidity_event_notification_message_record, liquidity_event_notification_message_value) {
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> liquidity_event_notification_message_record.time[liquidity_event_notification_message_at] = liquidity_event_notification_message_value; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.instrument_id[liquidity_event_notification_message_at] = liquidity_event_notification_message_value; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.event_id[liquidity_event_notification_message_at] = liquidity_event_notification_message_value; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_record.liquidity_event_type = liquidity_event_notification_message_value;
  liquidity_event_notification_message_record.side = liquidity_event_notification_message_value;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> liquidity_event_notification_message_record.price[liquidity_event_notification_message_at] = liquidity_event_notification_message_value; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.contracts[liquidity_event_notification_message_at] = liquidity_event_notification_message_value; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_record.capacity = liquidity_event_notification_message_value;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.participant_id[liquidity_event_notification_message_at] = liquidity_event_notification_message_value; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.event_end_offset[liquidity_event_notification_message_at] = liquidity_event_notification_message_value; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Liquidity Event Notification Message set to where it lies, so a field read out of place says so */
inline ramp_liquidity_event_notification_message(liquidity_event_notification_message_record, liquidity_event_notification_message_base) {
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> liquidity_event_notification_message_record.time[liquidity_event_notification_message_at] = (liquidity_event_notification_message_base + 0 + liquidity_event_notification_message_at + 1) % 256; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.instrument_id[liquidity_event_notification_message_at] = (liquidity_event_notification_message_base + 8 + liquidity_event_notification_message_at + 1) % 256; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.event_id[liquidity_event_notification_message_at] = (liquidity_event_notification_message_base + 12 + liquidity_event_notification_message_at + 1) % 256; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_record.liquidity_event_type = (liquidity_event_notification_message_base + 16 + 1) % 256;
  liquidity_event_notification_message_record.side = (liquidity_event_notification_message_base + 17 + 1) % 256;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> liquidity_event_notification_message_record.price[liquidity_event_notification_message_at] = (liquidity_event_notification_message_base + 18 + liquidity_event_notification_message_at + 1) % 256; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.contracts[liquidity_event_notification_message_at] = (liquidity_event_notification_message_base + 26 + liquidity_event_notification_message_at + 1) % 256; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_record.capacity = (liquidity_event_notification_message_base + 30 + 1) % 256;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.participant_id[liquidity_event_notification_message_at] = (liquidity_event_notification_message_base + 31 + liquidity_event_notification_message_at + 1) % 256; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.event_end_offset[liquidity_event_notification_message_at] = (liquidity_event_notification_message_base + 35 + liquidity_event_notification_message_at + 1) % 256; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Event Notification Message to the wire, 39 bytes from where the cursor stands */
inline encode_liquidity_event_notification_message(liquidity_event_notification_message_record) {
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> wire[at] = liquidity_event_notification_message_record.time[liquidity_event_notification_message_at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> wire[at] = liquidity_event_notification_message_record.instrument_id[liquidity_event_notification_message_at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> wire[at] = liquidity_event_notification_message_record.event_id[liquidity_event_notification_message_at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_event_notification_message_record.liquidity_event_type; at = at + 1;
  wire[at] = liquidity_event_notification_message_record.side; at = at + 1;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> wire[at] = liquidity_event_notification_message_record.price[liquidity_event_notification_message_at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> wire[at] = liquidity_event_notification_message_record.contracts[liquidity_event_notification_message_at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_event_notification_message_record.capacity; at = at + 1;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> wire[at] = liquidity_event_notification_message_record.participant_id[liquidity_event_notification_message_at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> wire[at] = liquidity_event_notification_message_record.event_end_offset[liquidity_event_notification_message_at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Event Notification Message off the wire, 39 bytes from where the cursor stands */
inline decode_liquidity_event_notification_message(liquidity_event_notification_message_record) {
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> liquidity_event_notification_message_record.time[liquidity_event_notification_message_at] = wire[at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.instrument_id[liquidity_event_notification_message_at] = wire[at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.event_id[liquidity_event_notification_message_at] = wire[at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_record.liquidity_event_type = wire[at]; at = at + 1;
  liquidity_event_notification_message_record.side = wire[at]; at = at + 1;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> liquidity_event_notification_message_record.price[liquidity_event_notification_message_at] = wire[at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.contracts[liquidity_event_notification_message_at] = wire[at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_record.capacity = wire[at]; at = at + 1;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.participant_id[liquidity_event_notification_message_at] = wire[at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> liquidity_event_notification_message_record.event_end_offset[liquidity_event_notification_message_at] = wire[at]; at = at + 1; liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Liquidity Event Notification Message is what was written, byte for byte */
inline equal_liquidity_event_notification_message(liquidity_event_notification_message_read, liquidity_event_notification_message_written) {
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> assert(liquidity_event_notification_message_read.time[liquidity_event_notification_message_at] == liquidity_event_notification_message_written.time[liquidity_event_notification_message_at]); liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> assert(liquidity_event_notification_message_read.instrument_id[liquidity_event_notification_message_at] == liquidity_event_notification_message_written.instrument_id[liquidity_event_notification_message_at]); liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> assert(liquidity_event_notification_message_read.event_id[liquidity_event_notification_message_at] == liquidity_event_notification_message_written.event_id[liquidity_event_notification_message_at]); liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  assert(liquidity_event_notification_message_read.liquidity_event_type == liquidity_event_notification_message_written.liquidity_event_type);
  assert(liquidity_event_notification_message_read.side == liquidity_event_notification_message_written.side);
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 8 -> assert(liquidity_event_notification_message_read.price[liquidity_event_notification_message_at] == liquidity_event_notification_message_written.price[liquidity_event_notification_message_at]); liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> assert(liquidity_event_notification_message_read.contracts[liquidity_event_notification_message_at] == liquidity_event_notification_message_written.contracts[liquidity_event_notification_message_at]); liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  assert(liquidity_event_notification_message_read.capacity == liquidity_event_notification_message_written.capacity);
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> assert(liquidity_event_notification_message_read.participant_id[liquidity_event_notification_message_at] == liquidity_event_notification_message_written.participant_id[liquidity_event_notification_message_at]); liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_event_notification_message_at = 0;
  do
  :: liquidity_event_notification_message_at < 4 -> assert(liquidity_event_notification_message_read.event_end_offset[liquidity_event_notification_message_at] == liquidity_event_notification_message_written.event_end_offset[liquidity_event_notification_message_at]); liquidity_event_notification_message_at = liquidity_event_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Liquidity Event Execution Message: 36 bytes ----------------------------- */

/* LiquidityEventExecutionMessage */
typedef LiquidityEventExecutionMessage {
  byte time[8];
  byte instrument_id[4];
  byte event_id[4];
  byte trade_id[8];
  byte price[8];
  byte contracts[4]
};

int liquidity_event_execution_message_at;

/* every byte of Liquidity Event Execution Message set to one value */
inline fill_liquidity_event_execution_message(liquidity_event_execution_message_record, liquidity_event_execution_message_value) {
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> liquidity_event_execution_message_record.time[liquidity_event_execution_message_at] = liquidity_event_execution_message_value; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> liquidity_event_execution_message_record.instrument_id[liquidity_event_execution_message_at] = liquidity_event_execution_message_value; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> liquidity_event_execution_message_record.event_id[liquidity_event_execution_message_at] = liquidity_event_execution_message_value; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> liquidity_event_execution_message_record.trade_id[liquidity_event_execution_message_at] = liquidity_event_execution_message_value; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> liquidity_event_execution_message_record.price[liquidity_event_execution_message_at] = liquidity_event_execution_message_value; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> liquidity_event_execution_message_record.contracts[liquidity_event_execution_message_at] = liquidity_event_execution_message_value; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Liquidity Event Execution Message set to where it lies, so a field read out of place says so */
inline ramp_liquidity_event_execution_message(liquidity_event_execution_message_record, liquidity_event_execution_message_base) {
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> liquidity_event_execution_message_record.time[liquidity_event_execution_message_at] = (liquidity_event_execution_message_base + 0 + liquidity_event_execution_message_at + 1) % 256; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> liquidity_event_execution_message_record.instrument_id[liquidity_event_execution_message_at] = (liquidity_event_execution_message_base + 8 + liquidity_event_execution_message_at + 1) % 256; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> liquidity_event_execution_message_record.event_id[liquidity_event_execution_message_at] = (liquidity_event_execution_message_base + 12 + liquidity_event_execution_message_at + 1) % 256; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> liquidity_event_execution_message_record.trade_id[liquidity_event_execution_message_at] = (liquidity_event_execution_message_base + 16 + liquidity_event_execution_message_at + 1) % 256; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> liquidity_event_execution_message_record.price[liquidity_event_execution_message_at] = (liquidity_event_execution_message_base + 24 + liquidity_event_execution_message_at + 1) % 256; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> liquidity_event_execution_message_record.contracts[liquidity_event_execution_message_at] = (liquidity_event_execution_message_base + 32 + liquidity_event_execution_message_at + 1) % 256; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Event Execution Message to the wire, 36 bytes from where the cursor stands */
inline encode_liquidity_event_execution_message(liquidity_event_execution_message_record) {
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> wire[at] = liquidity_event_execution_message_record.time[liquidity_event_execution_message_at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> wire[at] = liquidity_event_execution_message_record.instrument_id[liquidity_event_execution_message_at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> wire[at] = liquidity_event_execution_message_record.event_id[liquidity_event_execution_message_at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> wire[at] = liquidity_event_execution_message_record.trade_id[liquidity_event_execution_message_at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> wire[at] = liquidity_event_execution_message_record.price[liquidity_event_execution_message_at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> wire[at] = liquidity_event_execution_message_record.contracts[liquidity_event_execution_message_at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Event Execution Message off the wire, 36 bytes from where the cursor stands */
inline decode_liquidity_event_execution_message(liquidity_event_execution_message_record) {
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> liquidity_event_execution_message_record.time[liquidity_event_execution_message_at] = wire[at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> liquidity_event_execution_message_record.instrument_id[liquidity_event_execution_message_at] = wire[at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> liquidity_event_execution_message_record.event_id[liquidity_event_execution_message_at] = wire[at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> liquidity_event_execution_message_record.trade_id[liquidity_event_execution_message_at] = wire[at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> liquidity_event_execution_message_record.price[liquidity_event_execution_message_at] = wire[at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> liquidity_event_execution_message_record.contracts[liquidity_event_execution_message_at] = wire[at]; at = at + 1; liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Liquidity Event Execution Message is what was written, byte for byte */
inline equal_liquidity_event_execution_message(liquidity_event_execution_message_read, liquidity_event_execution_message_written) {
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> assert(liquidity_event_execution_message_read.time[liquidity_event_execution_message_at] == liquidity_event_execution_message_written.time[liquidity_event_execution_message_at]); liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> assert(liquidity_event_execution_message_read.instrument_id[liquidity_event_execution_message_at] == liquidity_event_execution_message_written.instrument_id[liquidity_event_execution_message_at]); liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> assert(liquidity_event_execution_message_read.event_id[liquidity_event_execution_message_at] == liquidity_event_execution_message_written.event_id[liquidity_event_execution_message_at]); liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> assert(liquidity_event_execution_message_read.trade_id[liquidity_event_execution_message_at] == liquidity_event_execution_message_written.trade_id[liquidity_event_execution_message_at]); liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 8 -> assert(liquidity_event_execution_message_read.price[liquidity_event_execution_message_at] == liquidity_event_execution_message_written.price[liquidity_event_execution_message_at]); liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  liquidity_event_execution_message_at = 0;
  do
  :: liquidity_event_execution_message_at < 4 -> assert(liquidity_event_execution_message_read.contracts[liquidity_event_execution_message_at] == liquidity_event_execution_message_written.contracts[liquidity_event_execution_message_at]); liquidity_event_execution_message_at = liquidity_event_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Liquidity Event Cancel Message: 16 bytes -------------------------------- */

/* LiquidityEventCancelMessage */
typedef LiquidityEventCancelMessage {
  byte time[8];
  byte instrument_id[4];
  byte event_id[4]
};

int liquidity_event_cancel_message_at;

/* every byte of Liquidity Event Cancel Message set to one value */
inline fill_liquidity_event_cancel_message(liquidity_event_cancel_message_record, liquidity_event_cancel_message_value) {
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 8 -> liquidity_event_cancel_message_record.time[liquidity_event_cancel_message_at] = liquidity_event_cancel_message_value; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> liquidity_event_cancel_message_record.instrument_id[liquidity_event_cancel_message_at] = liquidity_event_cancel_message_value; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> liquidity_event_cancel_message_record.event_id[liquidity_event_cancel_message_at] = liquidity_event_cancel_message_value; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Liquidity Event Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_liquidity_event_cancel_message(liquidity_event_cancel_message_record, liquidity_event_cancel_message_base) {
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 8 -> liquidity_event_cancel_message_record.time[liquidity_event_cancel_message_at] = (liquidity_event_cancel_message_base + 0 + liquidity_event_cancel_message_at + 1) % 256; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> liquidity_event_cancel_message_record.instrument_id[liquidity_event_cancel_message_at] = (liquidity_event_cancel_message_base + 8 + liquidity_event_cancel_message_at + 1) % 256; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> liquidity_event_cancel_message_record.event_id[liquidity_event_cancel_message_at] = (liquidity_event_cancel_message_base + 12 + liquidity_event_cancel_message_at + 1) % 256; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Event Cancel Message to the wire, 16 bytes from where the cursor stands */
inline encode_liquidity_event_cancel_message(liquidity_event_cancel_message_record) {
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 8 -> wire[at] = liquidity_event_cancel_message_record.time[liquidity_event_cancel_message_at]; at = at + 1; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> wire[at] = liquidity_event_cancel_message_record.instrument_id[liquidity_event_cancel_message_at]; at = at + 1; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> wire[at] = liquidity_event_cancel_message_record.event_id[liquidity_event_cancel_message_at]; at = at + 1; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Event Cancel Message off the wire, 16 bytes from where the cursor stands */
inline decode_liquidity_event_cancel_message(liquidity_event_cancel_message_record) {
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 8 -> liquidity_event_cancel_message_record.time[liquidity_event_cancel_message_at] = wire[at]; at = at + 1; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> liquidity_event_cancel_message_record.instrument_id[liquidity_event_cancel_message_at] = wire[at]; at = at + 1; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> liquidity_event_cancel_message_record.event_id[liquidity_event_cancel_message_at] = wire[at]; at = at + 1; liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Liquidity Event Cancel Message is what was written, byte for byte */
inline equal_liquidity_event_cancel_message(liquidity_event_cancel_message_read, liquidity_event_cancel_message_written) {
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 8 -> assert(liquidity_event_cancel_message_read.time[liquidity_event_cancel_message_at] == liquidity_event_cancel_message_written.time[liquidity_event_cancel_message_at]); liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> assert(liquidity_event_cancel_message_read.instrument_id[liquidity_event_cancel_message_at] == liquidity_event_cancel_message_written.instrument_id[liquidity_event_cancel_message_at]); liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  liquidity_event_cancel_message_at = 0;
  do
  :: liquidity_event_cancel_message_at < 4 -> assert(liquidity_event_cancel_message_read.event_id[liquidity_event_cancel_message_at] == liquidity_event_cancel_message_written.event_id[liquidity_event_cancel_message_at]); liquidity_event_cancel_message_at = liquidity_event_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Non Customer Message: 33 bytes -------------------------------- */

/* AddOrderNonCustomerMessage */
typedef AddOrderNonCustomerMessage {
  byte time[8];
  byte instrument_id[4];
  byte order_id[8];
  byte side;
  byte price[8];
  byte contracts[4]
};

int add_order_non_customer_message_at;

/* every byte of Add Order Non Customer Message set to one value */
inline fill_add_order_non_customer_message(add_order_non_customer_message_record, add_order_non_customer_message_value) {
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> add_order_non_customer_message_record.time[add_order_non_customer_message_at] = add_order_non_customer_message_value; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> add_order_non_customer_message_record.instrument_id[add_order_non_customer_message_at] = add_order_non_customer_message_value; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> add_order_non_customer_message_record.order_id[add_order_non_customer_message_at] = add_order_non_customer_message_value; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_record.side = add_order_non_customer_message_value;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> add_order_non_customer_message_record.price[add_order_non_customer_message_at] = add_order_non_customer_message_value; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> add_order_non_customer_message_record.contracts[add_order_non_customer_message_at] = add_order_non_customer_message_value; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Non Customer Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_non_customer_message(add_order_non_customer_message_record, add_order_non_customer_message_base) {
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> add_order_non_customer_message_record.time[add_order_non_customer_message_at] = (add_order_non_customer_message_base + 0 + add_order_non_customer_message_at + 1) % 256; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> add_order_non_customer_message_record.instrument_id[add_order_non_customer_message_at] = (add_order_non_customer_message_base + 8 + add_order_non_customer_message_at + 1) % 256; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> add_order_non_customer_message_record.order_id[add_order_non_customer_message_at] = (add_order_non_customer_message_base + 12 + add_order_non_customer_message_at + 1) % 256; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_record.side = (add_order_non_customer_message_base + 20 + 1) % 256;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> add_order_non_customer_message_record.price[add_order_non_customer_message_at] = (add_order_non_customer_message_base + 21 + add_order_non_customer_message_at + 1) % 256; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> add_order_non_customer_message_record.contracts[add_order_non_customer_message_at] = (add_order_non_customer_message_base + 29 + add_order_non_customer_message_at + 1) % 256; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Non Customer Message to the wire, 33 bytes from where the cursor stands */
inline encode_add_order_non_customer_message(add_order_non_customer_message_record) {
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> wire[at] = add_order_non_customer_message_record.time[add_order_non_customer_message_at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> wire[at] = add_order_non_customer_message_record.instrument_id[add_order_non_customer_message_at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> wire[at] = add_order_non_customer_message_record.order_id[add_order_non_customer_message_at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_non_customer_message_record.side; at = at + 1;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> wire[at] = add_order_non_customer_message_record.price[add_order_non_customer_message_at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> wire[at] = add_order_non_customer_message_record.contracts[add_order_non_customer_message_at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Non Customer Message off the wire, 33 bytes from where the cursor stands */
inline decode_add_order_non_customer_message(add_order_non_customer_message_record) {
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> add_order_non_customer_message_record.time[add_order_non_customer_message_at] = wire[at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> add_order_non_customer_message_record.instrument_id[add_order_non_customer_message_at] = wire[at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> add_order_non_customer_message_record.order_id[add_order_non_customer_message_at] = wire[at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_record.side = wire[at]; at = at + 1;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> add_order_non_customer_message_record.price[add_order_non_customer_message_at] = wire[at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> add_order_non_customer_message_record.contracts[add_order_non_customer_message_at] = wire[at]; at = at + 1; add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Non Customer Message is what was written, byte for byte */
inline equal_add_order_non_customer_message(add_order_non_customer_message_read, add_order_non_customer_message_written) {
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> assert(add_order_non_customer_message_read.time[add_order_non_customer_message_at] == add_order_non_customer_message_written.time[add_order_non_customer_message_at]); add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> assert(add_order_non_customer_message_read.instrument_id[add_order_non_customer_message_at] == add_order_non_customer_message_written.instrument_id[add_order_non_customer_message_at]); add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> assert(add_order_non_customer_message_read.order_id[add_order_non_customer_message_at] == add_order_non_customer_message_written.order_id[add_order_non_customer_message_at]); add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  assert(add_order_non_customer_message_read.side == add_order_non_customer_message_written.side);
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 8 -> assert(add_order_non_customer_message_read.price[add_order_non_customer_message_at] == add_order_non_customer_message_written.price[add_order_non_customer_message_at]); add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  add_order_non_customer_message_at = 0;
  do
  :: add_order_non_customer_message_at < 4 -> assert(add_order_non_customer_message_read.contracts[add_order_non_customer_message_at] == add_order_non_customer_message_written.contracts[add_order_non_customer_message_at]); add_order_non_customer_message_at = add_order_non_customer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Customer Message: 34 bytes ------------------------------------ */

/* AddOrderCustomerMessage */
typedef AddOrderCustomerMessage {
  byte time[8];
  byte instrument_id[4];
  byte order_id[8];
  byte side;
  byte price[8];
  byte contracts[4];
  byte customer_indicator
};

int add_order_customer_message_at;

/* every byte of Add Order Customer Message set to one value */
inline fill_add_order_customer_message(add_order_customer_message_record, add_order_customer_message_value) {
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> add_order_customer_message_record.time[add_order_customer_message_at] = add_order_customer_message_value; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> add_order_customer_message_record.instrument_id[add_order_customer_message_at] = add_order_customer_message_value; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> add_order_customer_message_record.order_id[add_order_customer_message_at] = add_order_customer_message_value; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_record.side = add_order_customer_message_value;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> add_order_customer_message_record.price[add_order_customer_message_at] = add_order_customer_message_value; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> add_order_customer_message_record.contracts[add_order_customer_message_at] = add_order_customer_message_value; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_record.customer_indicator = add_order_customer_message_value;
  skip
}

/* each byte of Add Order Customer Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_customer_message(add_order_customer_message_record, add_order_customer_message_base) {
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> add_order_customer_message_record.time[add_order_customer_message_at] = (add_order_customer_message_base + 0 + add_order_customer_message_at + 1) % 256; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> add_order_customer_message_record.instrument_id[add_order_customer_message_at] = (add_order_customer_message_base + 8 + add_order_customer_message_at + 1) % 256; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> add_order_customer_message_record.order_id[add_order_customer_message_at] = (add_order_customer_message_base + 12 + add_order_customer_message_at + 1) % 256; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_record.side = (add_order_customer_message_base + 20 + 1) % 256;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> add_order_customer_message_record.price[add_order_customer_message_at] = (add_order_customer_message_base + 21 + add_order_customer_message_at + 1) % 256; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> add_order_customer_message_record.contracts[add_order_customer_message_at] = (add_order_customer_message_base + 29 + add_order_customer_message_at + 1) % 256; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_record.customer_indicator = (add_order_customer_message_base + 33 + 1) % 256;
  skip
}

/* Add Order Customer Message to the wire, 34 bytes from where the cursor stands */
inline encode_add_order_customer_message(add_order_customer_message_record) {
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> wire[at] = add_order_customer_message_record.time[add_order_customer_message_at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> wire[at] = add_order_customer_message_record.instrument_id[add_order_customer_message_at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> wire[at] = add_order_customer_message_record.order_id[add_order_customer_message_at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_customer_message_record.side; at = at + 1;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> wire[at] = add_order_customer_message_record.price[add_order_customer_message_at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> wire[at] = add_order_customer_message_record.contracts[add_order_customer_message_at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_customer_message_record.customer_indicator; at = at + 1;
  skip
}

/* Add Order Customer Message off the wire, 34 bytes from where the cursor stands */
inline decode_add_order_customer_message(add_order_customer_message_record) {
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> add_order_customer_message_record.time[add_order_customer_message_at] = wire[at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> add_order_customer_message_record.instrument_id[add_order_customer_message_at] = wire[at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> add_order_customer_message_record.order_id[add_order_customer_message_at] = wire[at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_record.side = wire[at]; at = at + 1;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> add_order_customer_message_record.price[add_order_customer_message_at] = wire[at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> add_order_customer_message_record.contracts[add_order_customer_message_at] = wire[at]; at = at + 1; add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_record.customer_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Customer Message is what was written, byte for byte */
inline equal_add_order_customer_message(add_order_customer_message_read, add_order_customer_message_written) {
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> assert(add_order_customer_message_read.time[add_order_customer_message_at] == add_order_customer_message_written.time[add_order_customer_message_at]); add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> assert(add_order_customer_message_read.instrument_id[add_order_customer_message_at] == add_order_customer_message_written.instrument_id[add_order_customer_message_at]); add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> assert(add_order_customer_message_read.order_id[add_order_customer_message_at] == add_order_customer_message_written.order_id[add_order_customer_message_at]); add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  assert(add_order_customer_message_read.side == add_order_customer_message_written.side);
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 8 -> assert(add_order_customer_message_read.price[add_order_customer_message_at] == add_order_customer_message_written.price[add_order_customer_message_at]); add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  add_order_customer_message_at = 0;
  do
  :: add_order_customer_message_at < 4 -> assert(add_order_customer_message_read.contracts[add_order_customer_message_at] == add_order_customer_message_written.contracts[add_order_customer_message_at]); add_order_customer_message_at = add_order_customer_message_at + 1
  :: else -> break
  od;
  assert(add_order_customer_message_read.customer_indicator == add_order_customer_message_written.customer_indicator);
  skip
}

/* ---- Modify Order Message: 33 bytes ------------------------------------------ */

/* ModifyOrderMessage */
typedef ModifyOrderMessage {
  byte time[8];
  byte instrument_id[4];
  byte order_id[8];
  byte price[8];
  byte contracts[4];
  byte mod_flag
};

int modify_order_message_at;

/* every byte of Modify Order Message set to one value */
inline fill_modify_order_message(modify_order_message_record, modify_order_message_value) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.time[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.instrument_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.contracts[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.mod_flag = modify_order_message_value;
  skip
}

/* each byte of Modify Order Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_message(modify_order_message_record, modify_order_message_base) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.time[modify_order_message_at] = (modify_order_message_base + 0 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.instrument_id[modify_order_message_at] = (modify_order_message_base + 8 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = (modify_order_message_base + 12 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = (modify_order_message_base + 20 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.contracts[modify_order_message_at] = (modify_order_message_base + 28 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.mod_flag = (modify_order_message_base + 32 + 1) % 256;
  skip
}

/* Modify Order Message to the wire, 33 bytes from where the cursor stands */
inline encode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.time[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.instrument_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.order_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.price[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.contracts[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_message_record.mod_flag; at = at + 1;
  skip
}

/* Modify Order Message off the wire, 33 bytes from where the cursor stands */
inline decode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.time[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.instrument_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.contracts[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.mod_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Order Message is what was written, byte for byte */
inline equal_modify_order_message(modify_order_message_read, modify_order_message_written) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.time[modify_order_message_at] == modify_order_message_written.time[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.instrument_id[modify_order_message_at] == modify_order_message_written.instrument_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.order_id[modify_order_message_at] == modify_order_message_written.order_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.price[modify_order_message_at] == modify_order_message_written.price[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.contracts[modify_order_message_at] == modify_order_message_written.contracts[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  assert(modify_order_message_read.mod_flag == modify_order_message_written.mod_flag);
  skip
}

/* ---- Delete Order Message: 20 bytes ------------------------------------------ */

/* DeleteOrderMessage */
typedef DeleteOrderMessage {
  byte time[8];
  byte instrument_id[4];
  byte order_id[8]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.time[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.instrument_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.time[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.instrument_id[delete_order_message_at] = (delete_order_message_base + 8 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 12 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 20 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.time[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.instrument_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 20 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.time[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.instrument_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.time[delete_order_message_at] == delete_order_message_written.time[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.instrument_id[delete_order_message_at] == delete_order_message_written.instrument_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Execution Message: 45 bytes --------------------------------------- */

/* OrderExecutionMessage */
typedef OrderExecutionMessage {
  byte time[8];
  byte instrument_id[4];
  byte order_id[8];
  byte trade_id[8];
  byte price[8];
  byte executed_contracts[4];
  byte remaining_contracts[4];
  byte trade_condition
};

int order_execution_message_at;

/* every byte of Order Execution Message set to one value */
inline fill_order_execution_message(order_execution_message_record, order_execution_message_value) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.time[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.instrument_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.order_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.trade_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.price[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.executed_contracts[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.remaining_contracts[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.trade_condition = order_execution_message_value;
  skip
}

/* each byte of Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_order_execution_message(order_execution_message_record, order_execution_message_base) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.time[order_execution_message_at] = (order_execution_message_base + 0 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.instrument_id[order_execution_message_at] = (order_execution_message_base + 8 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.order_id[order_execution_message_at] = (order_execution_message_base + 12 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.trade_id[order_execution_message_at] = (order_execution_message_base + 20 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.price[order_execution_message_at] = (order_execution_message_base + 28 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.executed_contracts[order_execution_message_at] = (order_execution_message_base + 36 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.remaining_contracts[order_execution_message_at] = (order_execution_message_base + 40 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.trade_condition = (order_execution_message_base + 44 + 1) % 256;
  skip
}

/* Order Execution Message to the wire, 45 bytes from where the cursor stands */
inline encode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.time[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.instrument_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.order_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.trade_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.price[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.executed_contracts[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.remaining_contracts[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.trade_condition; at = at + 1;
  skip
}

/* Order Execution Message off the wire, 45 bytes from where the cursor stands */
inline decode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.time[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.instrument_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.order_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.trade_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.price[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.executed_contracts[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.remaining_contracts[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Execution Message is what was written, byte for byte */
inline equal_order_execution_message(order_execution_message_read, order_execution_message_written) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.time[order_execution_message_at] == order_execution_message_written.time[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.instrument_id[order_execution_message_at] == order_execution_message_written.instrument_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.order_id[order_execution_message_at] == order_execution_message_written.order_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.trade_id[order_execution_message_at] == order_execution_message_written.trade_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.price[order_execution_message_at] == order_execution_message_written.price[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.executed_contracts[order_execution_message_at] == order_execution_message_written.executed_contracts[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.remaining_contracts[order_execution_message_at] == order_execution_message_written.remaining_contracts[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.trade_condition == order_execution_message_written.trade_condition);
  skip
}

/* ---- Deep Trade Break Message: 20 bytes -------------------------------------- */

/* DEEPTradeBreakMessage */
typedef DeepTradeBreakMessage {
  byte time[8];
  byte instrument_id[4];
  byte trade_id[8]
};

int deep_trade_break_message_at;

/* every byte of Deep Trade Break Message set to one value */
inline fill_deep_trade_break_message(deep_trade_break_message_record, deep_trade_break_message_value) {
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> deep_trade_break_message_record.time[deep_trade_break_message_at] = deep_trade_break_message_value; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 4 -> deep_trade_break_message_record.instrument_id[deep_trade_break_message_at] = deep_trade_break_message_value; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> deep_trade_break_message_record.trade_id[deep_trade_break_message_at] = deep_trade_break_message_value; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Deep Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_deep_trade_break_message(deep_trade_break_message_record, deep_trade_break_message_base) {
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> deep_trade_break_message_record.time[deep_trade_break_message_at] = (deep_trade_break_message_base + 0 + deep_trade_break_message_at + 1) % 256; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 4 -> deep_trade_break_message_record.instrument_id[deep_trade_break_message_at] = (deep_trade_break_message_base + 8 + deep_trade_break_message_at + 1) % 256; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> deep_trade_break_message_record.trade_id[deep_trade_break_message_at] = (deep_trade_break_message_base + 12 + deep_trade_break_message_at + 1) % 256; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Deep Trade Break Message to the wire, 20 bytes from where the cursor stands */
inline encode_deep_trade_break_message(deep_trade_break_message_record) {
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> wire[at] = deep_trade_break_message_record.time[deep_trade_break_message_at]; at = at + 1; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 4 -> wire[at] = deep_trade_break_message_record.instrument_id[deep_trade_break_message_at]; at = at + 1; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> wire[at] = deep_trade_break_message_record.trade_id[deep_trade_break_message_at]; at = at + 1; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Deep Trade Break Message off the wire, 20 bytes from where the cursor stands */
inline decode_deep_trade_break_message(deep_trade_break_message_record) {
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> deep_trade_break_message_record.time[deep_trade_break_message_at] = wire[at]; at = at + 1; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 4 -> deep_trade_break_message_record.instrument_id[deep_trade_break_message_at] = wire[at]; at = at + 1; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> deep_trade_break_message_record.trade_id[deep_trade_break_message_at] = wire[at]; at = at + 1; deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Deep Trade Break Message is what was written, byte for byte */
inline equal_deep_trade_break_message(deep_trade_break_message_read, deep_trade_break_message_written) {
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> assert(deep_trade_break_message_read.time[deep_trade_break_message_at] == deep_trade_break_message_written.time[deep_trade_break_message_at]); deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 4 -> assert(deep_trade_break_message_read.instrument_id[deep_trade_break_message_at] == deep_trade_break_message_written.instrument_id[deep_trade_break_message_at]); deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  deep_trade_break_message_at = 0;
  do
  :: deep_trade_break_message_at < 8 -> assert(deep_trade_break_message_read.trade_id[deep_trade_break_message_at] == deep_trade_break_message_written.trade_id[deep_trade_break_message_at]); deep_trade_break_message_at = deep_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Update No Customer Interest Message: 37 bytes --------------------- */

/* QuoteUpdateNoCustomerInterestMessage */
typedef QuoteUpdateNoCustomerInterestMessage {
  byte time[8];
  byte instrument_id[4];
  byte bid_size[4];
  byte bid_price[8];
  byte ask_size[4];
  byte ask_price[8];
  byte status_status_type
};

int quote_update_no_customer_interest_message_at;

/* every byte of Quote Update No Customer Interest Message set to one value */
inline fill_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_record, quote_update_no_customer_interest_message_value) {
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> quote_update_no_customer_interest_message_record.time[quote_update_no_customer_interest_message_at] = quote_update_no_customer_interest_message_value; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> quote_update_no_customer_interest_message_record.instrument_id[quote_update_no_customer_interest_message_at] = quote_update_no_customer_interest_message_value; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> quote_update_no_customer_interest_message_record.bid_size[quote_update_no_customer_interest_message_at] = quote_update_no_customer_interest_message_value; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> quote_update_no_customer_interest_message_record.bid_price[quote_update_no_customer_interest_message_at] = quote_update_no_customer_interest_message_value; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> quote_update_no_customer_interest_message_record.ask_size[quote_update_no_customer_interest_message_at] = quote_update_no_customer_interest_message_value; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> quote_update_no_customer_interest_message_record.ask_price[quote_update_no_customer_interest_message_at] = quote_update_no_customer_interest_message_value; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_record.status_status_type = quote_update_no_customer_interest_message_value;
  skip
}

/* each byte of Quote Update No Customer Interest Message set to where it lies, so a field read out of place says so */
inline ramp_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_record, quote_update_no_customer_interest_message_base) {
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> quote_update_no_customer_interest_message_record.time[quote_update_no_customer_interest_message_at] = (quote_update_no_customer_interest_message_base + 0 + quote_update_no_customer_interest_message_at + 1) % 256; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> quote_update_no_customer_interest_message_record.instrument_id[quote_update_no_customer_interest_message_at] = (quote_update_no_customer_interest_message_base + 8 + quote_update_no_customer_interest_message_at + 1) % 256; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> quote_update_no_customer_interest_message_record.bid_size[quote_update_no_customer_interest_message_at] = (quote_update_no_customer_interest_message_base + 12 + quote_update_no_customer_interest_message_at + 1) % 256; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> quote_update_no_customer_interest_message_record.bid_price[quote_update_no_customer_interest_message_at] = (quote_update_no_customer_interest_message_base + 16 + quote_update_no_customer_interest_message_at + 1) % 256; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> quote_update_no_customer_interest_message_record.ask_size[quote_update_no_customer_interest_message_at] = (quote_update_no_customer_interest_message_base + 24 + quote_update_no_customer_interest_message_at + 1) % 256; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> quote_update_no_customer_interest_message_record.ask_price[quote_update_no_customer_interest_message_at] = (quote_update_no_customer_interest_message_base + 28 + quote_update_no_customer_interest_message_at + 1) % 256; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_record.status_status_type = (quote_update_no_customer_interest_message_base + 36 + 1) % 256;
  skip
}

/* Quote Update No Customer Interest Message to the wire, 37 bytes from where the cursor stands */
inline encode_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_record) {
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> wire[at] = quote_update_no_customer_interest_message_record.time[quote_update_no_customer_interest_message_at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> wire[at] = quote_update_no_customer_interest_message_record.instrument_id[quote_update_no_customer_interest_message_at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> wire[at] = quote_update_no_customer_interest_message_record.bid_size[quote_update_no_customer_interest_message_at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> wire[at] = quote_update_no_customer_interest_message_record.bid_price[quote_update_no_customer_interest_message_at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> wire[at] = quote_update_no_customer_interest_message_record.ask_size[quote_update_no_customer_interest_message_at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> wire[at] = quote_update_no_customer_interest_message_record.ask_price[quote_update_no_customer_interest_message_at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_update_no_customer_interest_message_record.status_status_type; at = at + 1;
  skip
}

/* Quote Update No Customer Interest Message off the wire, 37 bytes from where the cursor stands */
inline decode_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_record) {
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> quote_update_no_customer_interest_message_record.time[quote_update_no_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> quote_update_no_customer_interest_message_record.instrument_id[quote_update_no_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> quote_update_no_customer_interest_message_record.bid_size[quote_update_no_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> quote_update_no_customer_interest_message_record.bid_price[quote_update_no_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> quote_update_no_customer_interest_message_record.ask_size[quote_update_no_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> quote_update_no_customer_interest_message_record.ask_price[quote_update_no_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_record.status_status_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Update No Customer Interest Message is what was written, byte for byte */
inline equal_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_read, quote_update_no_customer_interest_message_written) {
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> assert(quote_update_no_customer_interest_message_read.time[quote_update_no_customer_interest_message_at] == quote_update_no_customer_interest_message_written.time[quote_update_no_customer_interest_message_at]); quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> assert(quote_update_no_customer_interest_message_read.instrument_id[quote_update_no_customer_interest_message_at] == quote_update_no_customer_interest_message_written.instrument_id[quote_update_no_customer_interest_message_at]); quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> assert(quote_update_no_customer_interest_message_read.bid_size[quote_update_no_customer_interest_message_at] == quote_update_no_customer_interest_message_written.bid_size[quote_update_no_customer_interest_message_at]); quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> assert(quote_update_no_customer_interest_message_read.bid_price[quote_update_no_customer_interest_message_at] == quote_update_no_customer_interest_message_written.bid_price[quote_update_no_customer_interest_message_at]); quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 4 -> assert(quote_update_no_customer_interest_message_read.ask_size[quote_update_no_customer_interest_message_at] == quote_update_no_customer_interest_message_written.ask_size[quote_update_no_customer_interest_message_at]); quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_no_customer_interest_message_at = 0;
  do
  :: quote_update_no_customer_interest_message_at < 8 -> assert(quote_update_no_customer_interest_message_read.ask_price[quote_update_no_customer_interest_message_at] == quote_update_no_customer_interest_message_written.ask_price[quote_update_no_customer_interest_message_at]); quote_update_no_customer_interest_message_at = quote_update_no_customer_interest_message_at + 1
  :: else -> break
  od;
  assert(quote_update_no_customer_interest_message_read.status_status_type == quote_update_no_customer_interest_message_written.status_status_type);
  skip
}

/* ---- Quote Update Customer Interest Message: 45 bytes ------------------------ */

/* QuoteUpdateCustomerInterestMessage */
typedef QuoteUpdateCustomerInterestMessage {
  byte time[8];
  byte instrument_id[4];
  byte bid_size[4];
  byte bid_customer_size[4];
  byte bid_price[8];
  byte ask_size[4];
  byte ask_customer_size[4];
  byte ask_price[8];
  byte status_status_type
};

int quote_update_customer_interest_message_at;

/* every byte of Quote Update Customer Interest Message set to one value */
inline fill_quote_update_customer_interest_message(quote_update_customer_interest_message_record, quote_update_customer_interest_message_value) {
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> quote_update_customer_interest_message_record.time[quote_update_customer_interest_message_at] = quote_update_customer_interest_message_value; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.instrument_id[quote_update_customer_interest_message_at] = quote_update_customer_interest_message_value; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.bid_size[quote_update_customer_interest_message_at] = quote_update_customer_interest_message_value; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.bid_customer_size[quote_update_customer_interest_message_at] = quote_update_customer_interest_message_value; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> quote_update_customer_interest_message_record.bid_price[quote_update_customer_interest_message_at] = quote_update_customer_interest_message_value; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.ask_size[quote_update_customer_interest_message_at] = quote_update_customer_interest_message_value; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.ask_customer_size[quote_update_customer_interest_message_at] = quote_update_customer_interest_message_value; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> quote_update_customer_interest_message_record.ask_price[quote_update_customer_interest_message_at] = quote_update_customer_interest_message_value; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_record.status_status_type = quote_update_customer_interest_message_value;
  skip
}

/* each byte of Quote Update Customer Interest Message set to where it lies, so a field read out of place says so */
inline ramp_quote_update_customer_interest_message(quote_update_customer_interest_message_record, quote_update_customer_interest_message_base) {
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> quote_update_customer_interest_message_record.time[quote_update_customer_interest_message_at] = (quote_update_customer_interest_message_base + 0 + quote_update_customer_interest_message_at + 1) % 256; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.instrument_id[quote_update_customer_interest_message_at] = (quote_update_customer_interest_message_base + 8 + quote_update_customer_interest_message_at + 1) % 256; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.bid_size[quote_update_customer_interest_message_at] = (quote_update_customer_interest_message_base + 12 + quote_update_customer_interest_message_at + 1) % 256; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.bid_customer_size[quote_update_customer_interest_message_at] = (quote_update_customer_interest_message_base + 16 + quote_update_customer_interest_message_at + 1) % 256; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> quote_update_customer_interest_message_record.bid_price[quote_update_customer_interest_message_at] = (quote_update_customer_interest_message_base + 20 + quote_update_customer_interest_message_at + 1) % 256; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.ask_size[quote_update_customer_interest_message_at] = (quote_update_customer_interest_message_base + 28 + quote_update_customer_interest_message_at + 1) % 256; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.ask_customer_size[quote_update_customer_interest_message_at] = (quote_update_customer_interest_message_base + 32 + quote_update_customer_interest_message_at + 1) % 256; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> quote_update_customer_interest_message_record.ask_price[quote_update_customer_interest_message_at] = (quote_update_customer_interest_message_base + 36 + quote_update_customer_interest_message_at + 1) % 256; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_record.status_status_type = (quote_update_customer_interest_message_base + 44 + 1) % 256;
  skip
}

/* Quote Update Customer Interest Message to the wire, 45 bytes from where the cursor stands */
inline encode_quote_update_customer_interest_message(quote_update_customer_interest_message_record) {
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> wire[at] = quote_update_customer_interest_message_record.time[quote_update_customer_interest_message_at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> wire[at] = quote_update_customer_interest_message_record.instrument_id[quote_update_customer_interest_message_at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> wire[at] = quote_update_customer_interest_message_record.bid_size[quote_update_customer_interest_message_at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> wire[at] = quote_update_customer_interest_message_record.bid_customer_size[quote_update_customer_interest_message_at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> wire[at] = quote_update_customer_interest_message_record.bid_price[quote_update_customer_interest_message_at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> wire[at] = quote_update_customer_interest_message_record.ask_size[quote_update_customer_interest_message_at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> wire[at] = quote_update_customer_interest_message_record.ask_customer_size[quote_update_customer_interest_message_at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> wire[at] = quote_update_customer_interest_message_record.ask_price[quote_update_customer_interest_message_at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_update_customer_interest_message_record.status_status_type; at = at + 1;
  skip
}

/* Quote Update Customer Interest Message off the wire, 45 bytes from where the cursor stands */
inline decode_quote_update_customer_interest_message(quote_update_customer_interest_message_record) {
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> quote_update_customer_interest_message_record.time[quote_update_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.instrument_id[quote_update_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.bid_size[quote_update_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.bid_customer_size[quote_update_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> quote_update_customer_interest_message_record.bid_price[quote_update_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.ask_size[quote_update_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> quote_update_customer_interest_message_record.ask_customer_size[quote_update_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> quote_update_customer_interest_message_record.ask_price[quote_update_customer_interest_message_at] = wire[at]; at = at + 1; quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_record.status_status_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Update Customer Interest Message is what was written, byte for byte */
inline equal_quote_update_customer_interest_message(quote_update_customer_interest_message_read, quote_update_customer_interest_message_written) {
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> assert(quote_update_customer_interest_message_read.time[quote_update_customer_interest_message_at] == quote_update_customer_interest_message_written.time[quote_update_customer_interest_message_at]); quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> assert(quote_update_customer_interest_message_read.instrument_id[quote_update_customer_interest_message_at] == quote_update_customer_interest_message_written.instrument_id[quote_update_customer_interest_message_at]); quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> assert(quote_update_customer_interest_message_read.bid_size[quote_update_customer_interest_message_at] == quote_update_customer_interest_message_written.bid_size[quote_update_customer_interest_message_at]); quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> assert(quote_update_customer_interest_message_read.bid_customer_size[quote_update_customer_interest_message_at] == quote_update_customer_interest_message_written.bid_customer_size[quote_update_customer_interest_message_at]); quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> assert(quote_update_customer_interest_message_read.bid_price[quote_update_customer_interest_message_at] == quote_update_customer_interest_message_written.bid_price[quote_update_customer_interest_message_at]); quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> assert(quote_update_customer_interest_message_read.ask_size[quote_update_customer_interest_message_at] == quote_update_customer_interest_message_written.ask_size[quote_update_customer_interest_message_at]); quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 4 -> assert(quote_update_customer_interest_message_read.ask_customer_size[quote_update_customer_interest_message_at] == quote_update_customer_interest_message_written.ask_customer_size[quote_update_customer_interest_message_at]); quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  quote_update_customer_interest_message_at = 0;
  do
  :: quote_update_customer_interest_message_at < 8 -> assert(quote_update_customer_interest_message_read.ask_price[quote_update_customer_interest_message_at] == quote_update_customer_interest_message_written.ask_price[quote_update_customer_interest_message_at]); quote_update_customer_interest_message_at = quote_update_customer_interest_message_at + 1
  :: else -> break
  od;
  assert(quote_update_customer_interest_message_read.status_status_type == quote_update_customer_interest_message_written.status_status_type);
  skip
}

/* ---- Trade Message: 33 bytes ------------------------------------------------- */

/* TradeMessage */
typedef TradeMessage {
  byte time[8];
  byte instrument_id[4];
  byte trade_id[8];
  byte price[8];
  byte contracts[4];
  byte trade_condition
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.time[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.instrument_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.contracts[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = trade_message_value;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.time[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.instrument_id[trade_message_at] = (trade_message_base + 8 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_id[trade_message_at] = (trade_message_base + 12 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = (trade_message_base + 20 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.contracts[trade_message_at] = (trade_message_base + 28 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = (trade_message_base + 32 + 1) % 256;
  skip
}

/* Trade Message to the wire, 33 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.time[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.instrument_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.trade_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.contracts[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_condition; at = at + 1;
  skip
}

/* Trade Message off the wire, 33 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.time[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.instrument_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.contracts[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.time[trade_message_at] == trade_message_written.time[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.instrument_id[trade_message_at] == trade_message_written.instrument_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.trade_id[trade_message_at] == trade_message_written.trade_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.contracts[trade_message_at] == trade_message_written.contracts[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_condition == trade_message_written.trade_condition);
  skip
}

/* ---- Trade Correction Message: 41 bytes -------------------------------------- */

/* TradeCorrectionMessage */
typedef TradeCorrectionMessage {
  byte time[8];
  byte instrument_id[4];
  byte original_trade_id[8];
  byte trade_id[8];
  byte price[8];
  byte contracts[4];
  byte trade_condition
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.time[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.instrument_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.contracts[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.trade_condition = trade_correction_message_value;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.time[trade_correction_message_at] = (trade_correction_message_base + 0 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.instrument_id[trade_correction_message_at] = (trade_correction_message_base + 8 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = (trade_correction_message_base + 12 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trade_id[trade_correction_message_at] = (trade_correction_message_base + 20 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.price[trade_correction_message_at] = (trade_correction_message_base + 28 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.contracts[trade_correction_message_at] = (trade_correction_message_base + 36 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.trade_condition = (trade_correction_message_base + 40 + 1) % 256;
  skip
}

/* Trade Correction Message to the wire, 41 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.time[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.instrument_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.original_trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.contracts[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.trade_condition; at = at + 1;
  skip
}

/* Trade Correction Message off the wire, 41 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.time[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.instrument_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.contracts[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.time[trade_correction_message_at] == trade_correction_message_written.time[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.instrument_id[trade_correction_message_at] == trade_correction_message_written.instrument_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.original_trade_id[trade_correction_message_at] == trade_correction_message_written.original_trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.trade_id[trade_correction_message_at] == trade_correction_message_written.trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.price[trade_correction_message_at] == trade_correction_message_written.price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.contracts[trade_correction_message_at] == trade_correction_message_written.contracts[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.trade_condition == trade_correction_message_written.trade_condition);
  skip
}

/* ---- Tops Trade Break Message: 21 bytes -------------------------------------- */

/* TOPSTradeBreakMessage */
typedef TopsTradeBreakMessage {
  byte time[8];
  byte instrument_id[4];
  byte trade_id[8];
  byte trade_condition
};

int tops_trade_break_message_at;

/* every byte of Tops Trade Break Message set to one value */
inline fill_tops_trade_break_message(tops_trade_break_message_record, tops_trade_break_message_value) {
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> tops_trade_break_message_record.time[tops_trade_break_message_at] = tops_trade_break_message_value; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 4 -> tops_trade_break_message_record.instrument_id[tops_trade_break_message_at] = tops_trade_break_message_value; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> tops_trade_break_message_record.trade_id[tops_trade_break_message_at] = tops_trade_break_message_value; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_record.trade_condition = tops_trade_break_message_value;
  skip
}

/* each byte of Tops Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_tops_trade_break_message(tops_trade_break_message_record, tops_trade_break_message_base) {
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> tops_trade_break_message_record.time[tops_trade_break_message_at] = (tops_trade_break_message_base + 0 + tops_trade_break_message_at + 1) % 256; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 4 -> tops_trade_break_message_record.instrument_id[tops_trade_break_message_at] = (tops_trade_break_message_base + 8 + tops_trade_break_message_at + 1) % 256; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> tops_trade_break_message_record.trade_id[tops_trade_break_message_at] = (tops_trade_break_message_base + 12 + tops_trade_break_message_at + 1) % 256; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_record.trade_condition = (tops_trade_break_message_base + 20 + 1) % 256;
  skip
}

/* Tops Trade Break Message to the wire, 21 bytes from where the cursor stands */
inline encode_tops_trade_break_message(tops_trade_break_message_record) {
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> wire[at] = tops_trade_break_message_record.time[tops_trade_break_message_at]; at = at + 1; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 4 -> wire[at] = tops_trade_break_message_record.instrument_id[tops_trade_break_message_at]; at = at + 1; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> wire[at] = tops_trade_break_message_record.trade_id[tops_trade_break_message_at]; at = at + 1; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  wire[at] = tops_trade_break_message_record.trade_condition; at = at + 1;
  skip
}

/* Tops Trade Break Message off the wire, 21 bytes from where the cursor stands */
inline decode_tops_trade_break_message(tops_trade_break_message_record) {
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> tops_trade_break_message_record.time[tops_trade_break_message_at] = wire[at]; at = at + 1; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 4 -> tops_trade_break_message_record.instrument_id[tops_trade_break_message_at] = wire[at]; at = at + 1; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> tops_trade_break_message_record.trade_id[tops_trade_break_message_at] = wire[at]; at = at + 1; tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Tops Trade Break Message is what was written, byte for byte */
inline equal_tops_trade_break_message(tops_trade_break_message_read, tops_trade_break_message_written) {
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> assert(tops_trade_break_message_read.time[tops_trade_break_message_at] == tops_trade_break_message_written.time[tops_trade_break_message_at]); tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 4 -> assert(tops_trade_break_message_read.instrument_id[tops_trade_break_message_at] == tops_trade_break_message_written.instrument_id[tops_trade_break_message_at]); tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  tops_trade_break_message_at = 0;
  do
  :: tops_trade_break_message_at < 8 -> assert(tops_trade_break_message_read.trade_id[tops_trade_break_message_at] == tops_trade_break_message_written.trade_id[tops_trade_break_message_at]); tops_trade_break_message_at = tops_trade_break_message_at + 1
  :: else -> break
  od;
  assert(tops_trade_break_message_read.trade_condition == tops_trade_break_message_written.trade_condition);
  skip
}

/* ---- Heartbeat Message: 12 bytes --------------------------------------------- */

/* HeartbeatMessage */
typedef HeartbeatMessage {
  byte channel_id[4];
  byte sequence_number[8]
};

int heartbeat_message_at;

/* every byte of Heartbeat Message set to one value */
inline fill_heartbeat_message(heartbeat_message_record, heartbeat_message_value) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.channel_id[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> heartbeat_message_record.sequence_number[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_message(heartbeat_message_record, heartbeat_message_base) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.channel_id[heartbeat_message_at] = (heartbeat_message_base + 0 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> heartbeat_message_record.sequence_number[heartbeat_message_at] = (heartbeat_message_base + 4 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message to the wire, 12 bytes from where the cursor stands */
inline encode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> wire[at] = heartbeat_message_record.channel_id[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> wire[at] = heartbeat_message_record.sequence_number[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message off the wire, 12 bytes from where the cursor stands */
inline decode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.channel_id[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> heartbeat_message_record.sequence_number[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Message is what was written, byte for byte */
inline equal_heartbeat_message(heartbeat_message_read, heartbeat_message_written) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> assert(heartbeat_message_read.channel_id[heartbeat_message_at] == heartbeat_message_written.channel_id[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> assert(heartbeat_message_read.sequence_number[heartbeat_message_at] == heartbeat_message_written.sequence_number[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message List Group Encoding: 2 bytes ------------------------------------ */

/* messageListGroupEncoding */
typedef MessageListGroupEncoding {
  byte block_length_short;
  byte num_in_group
};

/* every byte of Message List Group Encoding set to one value */
inline fill_message_list_group_encoding(message_list_group_encoding_record, message_list_group_encoding_value) {
  message_list_group_encoding_record.block_length_short = message_list_group_encoding_value;
  message_list_group_encoding_record.num_in_group = message_list_group_encoding_value;
  skip
}

/* each byte of Message List Group Encoding set to where it lies, so a field read out of place says so */
inline ramp_message_list_group_encoding(message_list_group_encoding_record, message_list_group_encoding_base) {
  message_list_group_encoding_record.block_length_short = (message_list_group_encoding_base + 0 + 1) % 256;
  message_list_group_encoding_record.num_in_group = (message_list_group_encoding_base + 1 + 1) % 256;
  skip
}

/* Message List Group Encoding to the wire, 2 bytes from where the cursor stands */
inline encode_message_list_group_encoding(message_list_group_encoding_record) {
  wire[at] = message_list_group_encoding_record.block_length_short; at = at + 1;
  wire[at] = message_list_group_encoding_record.num_in_group; at = at + 1;
  skip
}

/* Message List Group Encoding off the wire, 2 bytes from where the cursor stands */
inline decode_message_list_group_encoding(message_list_group_encoding_record) {
  message_list_group_encoding_record.block_length_short = wire[at]; at = at + 1;
  message_list_group_encoding_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Message List Group Encoding is what was written, byte for byte */
inline equal_message_list_group_encoding(message_list_group_encoding_read, message_list_group_encoding_written) {
  assert(message_list_group_encoding_read.block_length_short == message_list_group_encoding_written.block_length_short);
  assert(message_list_group_encoding_read.num_in_group == message_list_group_encoding_written.num_in_group);
  skip
}

/* ---- Session Shutdown Message: 12 bytes -------------------------------------- */

/* SessionShutdownMessage */
typedef SessionShutdownMessage {
  byte channel_id[4];
  byte sequence_number[8]
};

int session_shutdown_message_at;

/* every byte of Session Shutdown Message set to one value */
inline fill_session_shutdown_message(session_shutdown_message_record, session_shutdown_message_value) {
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 4 -> session_shutdown_message_record.channel_id[session_shutdown_message_at] = session_shutdown_message_value; session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 8 -> session_shutdown_message_record.sequence_number[session_shutdown_message_at] = session_shutdown_message_value; session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Session Shutdown Message set to where it lies, so a field read out of place says so */
inline ramp_session_shutdown_message(session_shutdown_message_record, session_shutdown_message_base) {
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 4 -> session_shutdown_message_record.channel_id[session_shutdown_message_at] = (session_shutdown_message_base + 0 + session_shutdown_message_at + 1) % 256; session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 8 -> session_shutdown_message_record.sequence_number[session_shutdown_message_at] = (session_shutdown_message_base + 4 + session_shutdown_message_at + 1) % 256; session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  skip
}

/* Session Shutdown Message to the wire, 12 bytes from where the cursor stands */
inline encode_session_shutdown_message(session_shutdown_message_record) {
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 4 -> wire[at] = session_shutdown_message_record.channel_id[session_shutdown_message_at]; at = at + 1; session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 8 -> wire[at] = session_shutdown_message_record.sequence_number[session_shutdown_message_at]; at = at + 1; session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  skip
}

/* Session Shutdown Message off the wire, 12 bytes from where the cursor stands */
inline decode_session_shutdown_message(session_shutdown_message_record) {
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 4 -> session_shutdown_message_record.channel_id[session_shutdown_message_at] = wire[at]; at = at + 1; session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 8 -> session_shutdown_message_record.sequence_number[session_shutdown_message_at] = wire[at]; at = at + 1; session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Session Shutdown Message is what was written, byte for byte */
inline equal_session_shutdown_message(session_shutdown_message_read, session_shutdown_message_written) {
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 4 -> assert(session_shutdown_message_read.channel_id[session_shutdown_message_at] == session_shutdown_message_written.channel_id[session_shutdown_message_at]); session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  session_shutdown_message_at = 0;
  do
  :: session_shutdown_message_at < 8 -> assert(session_shutdown_message_read.sequence_number[session_shutdown_message_at] == session_shutdown_message_written.sequence_number[session_shutdown_message_at]); session_shutdown_message_at = session_shutdown_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Number Reset Message: 20 bytes --------------------------------- */

/* SequenceNumberResetMessage */
typedef SequenceNumberResetMessage {
  byte channel_id[4];
  byte sequence_number[8];
  byte sequence_time[8]
};

int sequence_number_reset_message_at;

/* every byte of Sequence Number Reset Message set to one value */
inline fill_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_value) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.channel_id[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> sequence_number_reset_message_record.sequence_number[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> sequence_number_reset_message_record.sequence_time[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Number Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_base) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.channel_id[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 0 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> sequence_number_reset_message_record.sequence_number[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 4 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> sequence_number_reset_message_record.sequence_time[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 12 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Number Reset Message to the wire, 20 bytes from where the cursor stands */
inline encode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> wire[at] = sequence_number_reset_message_record.channel_id[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> wire[at] = sequence_number_reset_message_record.sequence_number[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> wire[at] = sequence_number_reset_message_record.sequence_time[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Number Reset Message off the wire, 20 bytes from where the cursor stands */
inline decode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.channel_id[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> sequence_number_reset_message_record.sequence_number[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> sequence_number_reset_message_record.sequence_time[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Number Reset Message is what was written, byte for byte */
inline equal_sequence_number_reset_message(sequence_number_reset_message_read, sequence_number_reset_message_written) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> assert(sequence_number_reset_message_read.channel_id[sequence_number_reset_message_at] == sequence_number_reset_message_written.channel_id[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> assert(sequence_number_reset_message_read.sequence_number[sequence_number_reset_message_at] == sequence_number_reset_message_written.sequence_number[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 8 -> assert(sequence_number_reset_message_read.sequence_time[sequence_number_reset_message_at] == sequence_number_reset_message_written.sequence_time[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request Message: 41 bytes -------------------------------- */

/* RetransmissionRequestMessage */
typedef RetransmissionRequestMessage {
  byte begin_sequence[8];
  byte end_sequence[8];
  byte logon_id[16];
  byte request_id[4];
  byte channel_id[4];
  byte feed
};

int retransmission_request_message_at;

/* every byte of Retransmission Request Message set to one value */
inline fill_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_value) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> retransmission_request_message_record.begin_sequence[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> retransmission_request_message_record.end_sequence[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 16 -> retransmission_request_message_record.logon_id[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.request_id[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.channel_id[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_record.feed = retransmission_request_message_value;
  skip
}

/* each byte of Retransmission Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_base) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> retransmission_request_message_record.begin_sequence[retransmission_request_message_at] = (retransmission_request_message_base + 0 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> retransmission_request_message_record.end_sequence[retransmission_request_message_at] = (retransmission_request_message_base + 8 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 16 -> retransmission_request_message_record.logon_id[retransmission_request_message_at] = (retransmission_request_message_base + 16 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.request_id[retransmission_request_message_at] = (retransmission_request_message_base + 32 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.channel_id[retransmission_request_message_at] = (retransmission_request_message_base + 36 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_record.feed = (retransmission_request_message_base + 40 + 1) % 256;
  skip
}

/* Retransmission Request Message to the wire, 41 bytes from where the cursor stands */
inline encode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> wire[at] = retransmission_request_message_record.begin_sequence[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> wire[at] = retransmission_request_message_record.end_sequence[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 16 -> wire[at] = retransmission_request_message_record.logon_id[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.request_id[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.channel_id[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_request_message_record.feed; at = at + 1;
  skip
}

/* Retransmission Request Message off the wire, 41 bytes from where the cursor stands */
inline decode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> retransmission_request_message_record.begin_sequence[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> retransmission_request_message_record.end_sequence[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 16 -> retransmission_request_message_record.logon_id[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.request_id[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.channel_id[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_record.feed = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmission Request Message is what was written, byte for byte */
inline equal_retransmission_request_message(retransmission_request_message_read, retransmission_request_message_written) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> assert(retransmission_request_message_read.begin_sequence[retransmission_request_message_at] == retransmission_request_message_written.begin_sequence[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 8 -> assert(retransmission_request_message_read.end_sequence[retransmission_request_message_at] == retransmission_request_message_written.end_sequence[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 16 -> assert(retransmission_request_message_read.logon_id[retransmission_request_message_at] == retransmission_request_message_written.logon_id[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.request_id[retransmission_request_message_at] == retransmission_request_message_written.request_id[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.channel_id[retransmission_request_message_at] == retransmission_request_message_written.channel_id[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  assert(retransmission_request_message_read.feed == retransmission_request_message_written.feed);
  skip
}

/* ---- Retransmission Response Message: 26 bytes ------------------------------- */

/* RetransmissionResponseMessage */
typedef RetransmissionResponseMessage {
  byte logon_id[16];
  byte request_id[4];
  byte channel_id[4];
  byte feed;
  byte status_retransmission_status_type
};

int retransmission_response_message_at;

/* every byte of Retransmission Response Message set to one value */
inline fill_retransmission_response_message(retransmission_response_message_record, retransmission_response_message_value) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 16 -> retransmission_response_message_record.logon_id[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.request_id[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.channel_id[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.feed = retransmission_response_message_value;
  retransmission_response_message_record.status_retransmission_status_type = retransmission_response_message_value;
  skip
}

/* each byte of Retransmission Response Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_response_message(retransmission_response_message_record, retransmission_response_message_base) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 16 -> retransmission_response_message_record.logon_id[retransmission_response_message_at] = (retransmission_response_message_base + 0 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.request_id[retransmission_response_message_at] = (retransmission_response_message_base + 16 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.channel_id[retransmission_response_message_at] = (retransmission_response_message_base + 20 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.feed = (retransmission_response_message_base + 24 + 1) % 256;
  retransmission_response_message_record.status_retransmission_status_type = (retransmission_response_message_base + 25 + 1) % 256;
  skip
}

/* Retransmission Response Message to the wire, 26 bytes from where the cursor stands */
inline encode_retransmission_response_message(retransmission_response_message_record) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 16 -> wire[at] = retransmission_response_message_record.logon_id[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> wire[at] = retransmission_response_message_record.request_id[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> wire[at] = retransmission_response_message_record.channel_id[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_response_message_record.feed; at = at + 1;
  wire[at] = retransmission_response_message_record.status_retransmission_status_type; at = at + 1;
  skip
}

/* Retransmission Response Message off the wire, 26 bytes from where the cursor stands */
inline decode_retransmission_response_message(retransmission_response_message_record) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 16 -> retransmission_response_message_record.logon_id[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.request_id[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.channel_id[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.feed = wire[at]; at = at + 1;
  retransmission_response_message_record.status_retransmission_status_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmission Response Message is what was written, byte for byte */
inline equal_retransmission_response_message(retransmission_response_message_read, retransmission_response_message_written) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 16 -> assert(retransmission_response_message_read.logon_id[retransmission_response_message_at] == retransmission_response_message_written.logon_id[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> assert(retransmission_response_message_read.request_id[retransmission_response_message_at] == retransmission_response_message_written.request_id[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> assert(retransmission_response_message_read.channel_id[retransmission_response_message_at] == retransmission_response_message_written.channel_id[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  assert(retransmission_response_message_read.feed == retransmission_response_message_written.feed);
  assert(retransmission_response_message_read.status_retransmission_status_type == retransmission_response_message_written.status_retransmission_status_type);
  skip
}

/* ---- Snapshot Header Message: 20 bytes --------------------------------------- */

/* SnapshotHeaderMessage */
typedef SnapshotHeaderMessage {
  byte snapshot_id[4];
  byte current_packet_number[4];
  byte total_packet_count[4];
  byte as_of_sequence_number[8]
};

int snapshot_header_message_at;

/* every byte of Snapshot Header Message set to one value */
inline fill_snapshot_header_message(snapshot_header_message_record, snapshot_header_message_value) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> snapshot_header_message_record.snapshot_id[snapshot_header_message_at] = snapshot_header_message_value; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> snapshot_header_message_record.current_packet_number[snapshot_header_message_at] = snapshot_header_message_value; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> snapshot_header_message_record.total_packet_count[snapshot_header_message_at] = snapshot_header_message_value; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.as_of_sequence_number[snapshot_header_message_at] = snapshot_header_message_value; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Header Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_header_message(snapshot_header_message_record, snapshot_header_message_base) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> snapshot_header_message_record.snapshot_id[snapshot_header_message_at] = (snapshot_header_message_base + 0 + snapshot_header_message_at + 1) % 256; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> snapshot_header_message_record.current_packet_number[snapshot_header_message_at] = (snapshot_header_message_base + 4 + snapshot_header_message_at + 1) % 256; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> snapshot_header_message_record.total_packet_count[snapshot_header_message_at] = (snapshot_header_message_base + 8 + snapshot_header_message_at + 1) % 256; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.as_of_sequence_number[snapshot_header_message_at] = (snapshot_header_message_base + 12 + snapshot_header_message_at + 1) % 256; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Header Message to the wire, 20 bytes from where the cursor stands */
inline encode_snapshot_header_message(snapshot_header_message_record) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> wire[at] = snapshot_header_message_record.snapshot_id[snapshot_header_message_at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> wire[at] = snapshot_header_message_record.current_packet_number[snapshot_header_message_at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> wire[at] = snapshot_header_message_record.total_packet_count[snapshot_header_message_at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> wire[at] = snapshot_header_message_record.as_of_sequence_number[snapshot_header_message_at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Header Message off the wire, 20 bytes from where the cursor stands */
inline decode_snapshot_header_message(snapshot_header_message_record) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> snapshot_header_message_record.snapshot_id[snapshot_header_message_at] = wire[at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> snapshot_header_message_record.current_packet_number[snapshot_header_message_at] = wire[at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> snapshot_header_message_record.total_packet_count[snapshot_header_message_at] = wire[at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.as_of_sequence_number[snapshot_header_message_at] = wire[at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Header Message is what was written, byte for byte */
inline equal_snapshot_header_message(snapshot_header_message_read, snapshot_header_message_written) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> assert(snapshot_header_message_read.snapshot_id[snapshot_header_message_at] == snapshot_header_message_written.snapshot_id[snapshot_header_message_at]); snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> assert(snapshot_header_message_read.current_packet_number[snapshot_header_message_at] == snapshot_header_message_written.current_packet_number[snapshot_header_message_at]); snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 4 -> assert(snapshot_header_message_read.total_packet_count[snapshot_header_message_at] == snapshot_header_message_written.total_packet_count[snapshot_header_message_at]); snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> assert(snapshot_header_message_read.as_of_sequence_number[snapshot_header_message_at] == snapshot_header_message_written.as_of_sequence_number[snapshot_header_message_at]); snapshot_header_message_at = snapshot_header_message_at + 1
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Underlying Ref Data Message: encoded, read back, and compared */
proctype check_underlying_ref_data_message() {
  UnderlyingRefDataMessage underlying_ref_data_message_sent;
  UnderlyingRefDataMessage underlying_ref_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_ref_data_message(underlying_ref_data_message_sent, 0)
  :: pattern == 1 -> fill_underlying_ref_data_message(underlying_ref_data_message_sent, 32)
  :: pattern == 2 -> fill_underlying_ref_data_message(underlying_ref_data_message_sent, 255)
  :: else -> ramp_underlying_ref_data_message(underlying_ref_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_ref_data_message(underlying_ref_data_message_sent);
    assert(at == 31);
    at = 0;
    decode_underlying_ref_data_message(underlying_ref_data_message_got);
    assert(at == 31);
    equal_underlying_ref_data_message(underlying_ref_data_message_got, underlying_ref_data_message_sent)
  }
}

/* Symbol Mapping Message: encoded, read back, and compared */
proctype check_symbol_mapping_message() {
  SymbolMappingMessage symbol_mapping_message_sent;
  SymbolMappingMessage symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_mapping_message(symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_symbol_mapping_message(symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_symbol_mapping_message(symbol_mapping_message_sent, 255)
  :: else -> ramp_symbol_mapping_message(symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_mapping_message(symbol_mapping_message_sent);
    assert(at == 68);
    at = 0;
    decode_symbol_mapping_message(symbol_mapping_message_got);
    assert(at == 68);
    equal_symbol_mapping_message(symbol_mapping_message_got, symbol_mapping_message_sent)
  }
}

/* Instrument Clear Message: encoded, read back, and compared */
proctype check_instrument_clear_message() {
  InstrumentClearMessage instrument_clear_message_sent;
  InstrumentClearMessage instrument_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_clear_message(instrument_clear_message_sent, 0)
  :: pattern == 1 -> fill_instrument_clear_message(instrument_clear_message_sent, 32)
  :: pattern == 2 -> fill_instrument_clear_message(instrument_clear_message_sent, 255)
  :: else -> ramp_instrument_clear_message(instrument_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_clear_message(instrument_clear_message_sent);
    assert(at == 12);
    at = 0;
    decode_instrument_clear_message(instrument_clear_message_got);
    assert(at == 12);
    equal_instrument_clear_message(instrument_clear_message_got, instrument_clear_message_sent)
  }
}

/* Trading Status Message: encoded, read back, and compared */
proctype check_trading_status_message() {
  TradingStatusMessage trading_status_message_sent;
  TradingStatusMessage trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_message(trading_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_message(trading_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_message(trading_status_message_sent, 255)
  :: else -> ramp_trading_status_message(trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_message(trading_status_message_sent);
    assert(at == 13);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 13);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Options Auction Summary Message: encoded, read back, and compared */
proctype check_options_auction_summary_message() {
  OptionsAuctionSummaryMessage options_auction_summary_message_sent;
  OptionsAuctionSummaryMessage options_auction_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_auction_summary_message(options_auction_summary_message_sent, 0)
  :: pattern == 1 -> fill_options_auction_summary_message(options_auction_summary_message_sent, 32)
  :: pattern == 2 -> fill_options_auction_summary_message(options_auction_summary_message_sent, 255)
  :: else -> ramp_options_auction_summary_message(options_auction_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_auction_summary_message(options_auction_summary_message_sent);
    assert(at == 25);
    at = 0;
    decode_options_auction_summary_message(options_auction_summary_message_got);
    assert(at == 25);
    equal_options_auction_summary_message(options_auction_summary_message_got, options_auction_summary_message_sent)
  }
}

/* Options Auction Width Update Message: encoded, read back, and compared */
proctype check_options_auction_width_update_message() {
  OptionsAuctionWidthUpdateMessage options_auction_width_update_message_sent;
  OptionsAuctionWidthUpdateMessage options_auction_width_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_auction_width_update_message(options_auction_width_update_message_sent, 0)
  :: pattern == 1 -> fill_options_auction_width_update_message(options_auction_width_update_message_sent, 32)
  :: pattern == 2 -> fill_options_auction_width_update_message(options_auction_width_update_message_sent, 255)
  :: else -> ramp_options_auction_width_update_message(options_auction_width_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_auction_width_update_message(options_auction_width_update_message_sent);
    assert(at == 13);
    at = 0;
    decode_options_auction_width_update_message(options_auction_width_update_message_got);
    assert(at == 13);
    equal_options_auction_width_update_message(options_auction_width_update_message_got, options_auction_width_update_message_sent)
  }
}

/* Liquidity Event Notification Message: encoded, read back, and compared */
proctype check_liquidity_event_notification_message() {
  LiquidityEventNotificationMessage liquidity_event_notification_message_sent;
  LiquidityEventNotificationMessage liquidity_event_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_event_notification_message(liquidity_event_notification_message_sent, 0)
  :: pattern == 1 -> fill_liquidity_event_notification_message(liquidity_event_notification_message_sent, 32)
  :: pattern == 2 -> fill_liquidity_event_notification_message(liquidity_event_notification_message_sent, 255)
  :: else -> ramp_liquidity_event_notification_message(liquidity_event_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_event_notification_message(liquidity_event_notification_message_sent);
    assert(at == 39);
    at = 0;
    decode_liquidity_event_notification_message(liquidity_event_notification_message_got);
    assert(at == 39);
    equal_liquidity_event_notification_message(liquidity_event_notification_message_got, liquidity_event_notification_message_sent)
  }
}

/* Liquidity Event Execution Message: encoded, read back, and compared */
proctype check_liquidity_event_execution_message() {
  LiquidityEventExecutionMessage liquidity_event_execution_message_sent;
  LiquidityEventExecutionMessage liquidity_event_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_event_execution_message(liquidity_event_execution_message_sent, 0)
  :: pattern == 1 -> fill_liquidity_event_execution_message(liquidity_event_execution_message_sent, 32)
  :: pattern == 2 -> fill_liquidity_event_execution_message(liquidity_event_execution_message_sent, 255)
  :: else -> ramp_liquidity_event_execution_message(liquidity_event_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_event_execution_message(liquidity_event_execution_message_sent);
    assert(at == 36);
    at = 0;
    decode_liquidity_event_execution_message(liquidity_event_execution_message_got);
    assert(at == 36);
    equal_liquidity_event_execution_message(liquidity_event_execution_message_got, liquidity_event_execution_message_sent)
  }
}

/* Liquidity Event Cancel Message: encoded, read back, and compared */
proctype check_liquidity_event_cancel_message() {
  LiquidityEventCancelMessage liquidity_event_cancel_message_sent;
  LiquidityEventCancelMessage liquidity_event_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_event_cancel_message(liquidity_event_cancel_message_sent, 0)
  :: pattern == 1 -> fill_liquidity_event_cancel_message(liquidity_event_cancel_message_sent, 32)
  :: pattern == 2 -> fill_liquidity_event_cancel_message(liquidity_event_cancel_message_sent, 255)
  :: else -> ramp_liquidity_event_cancel_message(liquidity_event_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_event_cancel_message(liquidity_event_cancel_message_sent);
    assert(at == 16);
    at = 0;
    decode_liquidity_event_cancel_message(liquidity_event_cancel_message_got);
    assert(at == 16);
    equal_liquidity_event_cancel_message(liquidity_event_cancel_message_got, liquidity_event_cancel_message_sent)
  }
}

/* Add Order Non Customer Message: encoded, read back, and compared */
proctype check_add_order_non_customer_message() {
  AddOrderNonCustomerMessage add_order_non_customer_message_sent;
  AddOrderNonCustomerMessage add_order_non_customer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_non_customer_message(add_order_non_customer_message_sent, 0)
  :: pattern == 1 -> fill_add_order_non_customer_message(add_order_non_customer_message_sent, 32)
  :: pattern == 2 -> fill_add_order_non_customer_message(add_order_non_customer_message_sent, 255)
  :: else -> ramp_add_order_non_customer_message(add_order_non_customer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_non_customer_message(add_order_non_customer_message_sent);
    assert(at == 33);
    at = 0;
    decode_add_order_non_customer_message(add_order_non_customer_message_got);
    assert(at == 33);
    equal_add_order_non_customer_message(add_order_non_customer_message_got, add_order_non_customer_message_sent)
  }
}

/* Add Order Customer Message: encoded, read back, and compared */
proctype check_add_order_customer_message() {
  AddOrderCustomerMessage add_order_customer_message_sent;
  AddOrderCustomerMessage add_order_customer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_customer_message(add_order_customer_message_sent, 0)
  :: pattern == 1 -> fill_add_order_customer_message(add_order_customer_message_sent, 32)
  :: pattern == 2 -> fill_add_order_customer_message(add_order_customer_message_sent, 255)
  :: else -> ramp_add_order_customer_message(add_order_customer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_customer_message(add_order_customer_message_sent);
    assert(at == 34);
    at = 0;
    decode_add_order_customer_message(add_order_customer_message_got);
    assert(at == 34);
    equal_add_order_customer_message(add_order_customer_message_got, add_order_customer_message_sent)
  }
}

/* Modify Order Message: encoded, read back, and compared */
proctype check_modify_order_message() {
  ModifyOrderMessage modify_order_message_sent;
  ModifyOrderMessage modify_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_message(modify_order_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_message(modify_order_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_message(modify_order_message_sent, 255)
  :: else -> ramp_modify_order_message(modify_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_message(modify_order_message_sent);
    assert(at == 33);
    at = 0;
    decode_modify_order_message(modify_order_message_got);
    assert(at == 33);
    equal_modify_order_message(modify_order_message_got, modify_order_message_sent)
  }
}

/* Delete Order Message: encoded, read back, and compared */
proctype check_delete_order_message() {
  DeleteOrderMessage delete_order_message_sent;
  DeleteOrderMessage delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order_message(delete_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_order_message(delete_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_order_message(delete_order_message_sent, 255)
  :: else -> ramp_delete_order_message(delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order_message(delete_order_message_sent);
    assert(at == 20);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 20);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Order Execution Message: encoded, read back, and compared */
proctype check_order_execution_message() {
  OrderExecutionMessage order_execution_message_sent;
  OrderExecutionMessage order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_message(order_execution_message_sent, 0)
  :: pattern == 1 -> fill_order_execution_message(order_execution_message_sent, 32)
  :: pattern == 2 -> fill_order_execution_message(order_execution_message_sent, 255)
  :: else -> ramp_order_execution_message(order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_message(order_execution_message_sent);
    assert(at == 45);
    at = 0;
    decode_order_execution_message(order_execution_message_got);
    assert(at == 45);
    equal_order_execution_message(order_execution_message_got, order_execution_message_sent)
  }
}

/* Deep Trade Break Message: encoded, read back, and compared */
proctype check_deep_trade_break_message() {
  DeepTradeBreakMessage deep_trade_break_message_sent;
  DeepTradeBreakMessage deep_trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_deep_trade_break_message(deep_trade_break_message_sent, 0)
  :: pattern == 1 -> fill_deep_trade_break_message(deep_trade_break_message_sent, 32)
  :: pattern == 2 -> fill_deep_trade_break_message(deep_trade_break_message_sent, 255)
  :: else -> ramp_deep_trade_break_message(deep_trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_deep_trade_break_message(deep_trade_break_message_sent);
    assert(at == 20);
    at = 0;
    decode_deep_trade_break_message(deep_trade_break_message_got);
    assert(at == 20);
    equal_deep_trade_break_message(deep_trade_break_message_got, deep_trade_break_message_sent)
  }
}

/* Quote Update No Customer Interest Message: encoded, read back, and compared */
proctype check_quote_update_no_customer_interest_message() {
  QuoteUpdateNoCustomerInterestMessage quote_update_no_customer_interest_message_sent;
  QuoteUpdateNoCustomerInterestMessage quote_update_no_customer_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_sent, 0)
  :: pattern == 1 -> fill_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_sent, 32)
  :: pattern == 2 -> fill_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_sent, 255)
  :: else -> ramp_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_sent);
    assert(at == 37);
    at = 0;
    decode_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_got);
    assert(at == 37);
    equal_quote_update_no_customer_interest_message(quote_update_no_customer_interest_message_got, quote_update_no_customer_interest_message_sent)
  }
}

/* Quote Update Customer Interest Message: encoded, read back, and compared */
proctype check_quote_update_customer_interest_message() {
  QuoteUpdateCustomerInterestMessage quote_update_customer_interest_message_sent;
  QuoteUpdateCustomerInterestMessage quote_update_customer_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_update_customer_interest_message(quote_update_customer_interest_message_sent, 0)
  :: pattern == 1 -> fill_quote_update_customer_interest_message(quote_update_customer_interest_message_sent, 32)
  :: pattern == 2 -> fill_quote_update_customer_interest_message(quote_update_customer_interest_message_sent, 255)
  :: else -> ramp_quote_update_customer_interest_message(quote_update_customer_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_update_customer_interest_message(quote_update_customer_interest_message_sent);
    assert(at == 45);
    at = 0;
    decode_quote_update_customer_interest_message(quote_update_customer_interest_message_got);
    assert(at == 45);
    equal_quote_update_customer_interest_message(quote_update_customer_interest_message_got, quote_update_customer_interest_message_sent)
  }
}

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 33);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 33);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Trade Correction Message: encoded, read back, and compared */
proctype check_trade_correction_message() {
  TradeCorrectionMessage trade_correction_message_sent;
  TradeCorrectionMessage trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correction_message(trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_trade_correction_message(trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_trade_correction_message(trade_correction_message_sent, 255)
  :: else -> ramp_trade_correction_message(trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correction_message(trade_correction_message_sent);
    assert(at == 41);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 41);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Tops Trade Break Message: encoded, read back, and compared */
proctype check_tops_trade_break_message() {
  TopsTradeBreakMessage tops_trade_break_message_sent;
  TopsTradeBreakMessage tops_trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tops_trade_break_message(tops_trade_break_message_sent, 0)
  :: pattern == 1 -> fill_tops_trade_break_message(tops_trade_break_message_sent, 32)
  :: pattern == 2 -> fill_tops_trade_break_message(tops_trade_break_message_sent, 255)
  :: else -> ramp_tops_trade_break_message(tops_trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tops_trade_break_message(tops_trade_break_message_sent);
    assert(at == 21);
    at = 0;
    decode_tops_trade_break_message(tops_trade_break_message_got);
    assert(at == 21);
    equal_tops_trade_break_message(tops_trade_break_message_got, tops_trade_break_message_sent)
  }
}

/* Heartbeat Message: encoded, read back, and compared */
proctype check_heartbeat_message() {
  HeartbeatMessage heartbeat_message_sent;
  HeartbeatMessage heartbeat_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_message(heartbeat_message_sent, 0)
  :: pattern == 1 -> fill_heartbeat_message(heartbeat_message_sent, 32)
  :: pattern == 2 -> fill_heartbeat_message(heartbeat_message_sent, 255)
  :: else -> ramp_heartbeat_message(heartbeat_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_message(heartbeat_message_sent);
    assert(at == 12);
    at = 0;
    decode_heartbeat_message(heartbeat_message_got);
    assert(at == 12);
    equal_heartbeat_message(heartbeat_message_got, heartbeat_message_sent)
  }
}

/* Message List Group Encoding: encoded, read back, and compared */
proctype check_message_list_group_encoding() {
  MessageListGroupEncoding message_list_group_encoding_sent;
  MessageListGroupEncoding message_list_group_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_list_group_encoding(message_list_group_encoding_sent, 0)
  :: pattern == 1 -> fill_message_list_group_encoding(message_list_group_encoding_sent, 32)
  :: pattern == 2 -> fill_message_list_group_encoding(message_list_group_encoding_sent, 255)
  :: else -> ramp_message_list_group_encoding(message_list_group_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_list_group_encoding(message_list_group_encoding_sent);
    assert(at == 2);
    at = 0;
    decode_message_list_group_encoding(message_list_group_encoding_got);
    assert(at == 2);
    equal_message_list_group_encoding(message_list_group_encoding_got, message_list_group_encoding_sent)
  }
}

/* Session Shutdown Message: encoded, read back, and compared */
proctype check_session_shutdown_message() {
  SessionShutdownMessage session_shutdown_message_sent;
  SessionShutdownMessage session_shutdown_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_session_shutdown_message(session_shutdown_message_sent, 0)
  :: pattern == 1 -> fill_session_shutdown_message(session_shutdown_message_sent, 32)
  :: pattern == 2 -> fill_session_shutdown_message(session_shutdown_message_sent, 255)
  :: else -> ramp_session_shutdown_message(session_shutdown_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_session_shutdown_message(session_shutdown_message_sent);
    assert(at == 12);
    at = 0;
    decode_session_shutdown_message(session_shutdown_message_got);
    assert(at == 12);
    equal_session_shutdown_message(session_shutdown_message_got, session_shutdown_message_sent)
  }
}

/* Sequence Number Reset Message: encoded, read back, and compared */
proctype check_sequence_number_reset_message() {
  SequenceNumberResetMessage sequence_number_reset_message_sent;
  SequenceNumberResetMessage sequence_number_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 255)
  :: else -> ramp_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_number_reset_message(sequence_number_reset_message_sent);
    assert(at == 20);
    at = 0;
    decode_sequence_number_reset_message(sequence_number_reset_message_got);
    assert(at == 20);
    equal_sequence_number_reset_message(sequence_number_reset_message_got, sequence_number_reset_message_sent)
  }
}

/* Retransmission Request Message: encoded, read back, and compared */
proctype check_retransmission_request_message() {
  RetransmissionRequestMessage retransmission_request_message_sent;
  RetransmissionRequestMessage retransmission_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request_message(retransmission_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_request_message(retransmission_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_request_message(retransmission_request_message_sent, 255)
  :: else -> ramp_retransmission_request_message(retransmission_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request_message(retransmission_request_message_sent);
    assert(at == 41);
    at = 0;
    decode_retransmission_request_message(retransmission_request_message_got);
    assert(at == 41);
    equal_retransmission_request_message(retransmission_request_message_got, retransmission_request_message_sent)
  }
}

/* Retransmission Response Message: encoded, read back, and compared */
proctype check_retransmission_response_message() {
  RetransmissionResponseMessage retransmission_response_message_sent;
  RetransmissionResponseMessage retransmission_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_response_message(retransmission_response_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_response_message(retransmission_response_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_response_message(retransmission_response_message_sent, 255)
  :: else -> ramp_retransmission_response_message(retransmission_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_response_message(retransmission_response_message_sent);
    assert(at == 26);
    at = 0;
    decode_retransmission_response_message(retransmission_response_message_got);
    assert(at == 26);
    equal_retransmission_response_message(retransmission_response_message_got, retransmission_response_message_sent)
  }
}

/* Snapshot Header Message: encoded, read back, and compared */
proctype check_snapshot_header_message() {
  SnapshotHeaderMessage snapshot_header_message_sent;
  SnapshotHeaderMessage snapshot_header_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_header_message(snapshot_header_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_header_message(snapshot_header_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_header_message(snapshot_header_message_sent, 255)
  :: else -> ramp_snapshot_header_message(snapshot_header_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_header_message(snapshot_header_message_sent);
    assert(at == 20);
    at = 0;
    decode_snapshot_header_message(snapshot_header_message_got);
    assert(at == 20);
    equal_snapshot_header_message(snapshot_header_message_got, snapshot_header_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_underlying_ref_data_message()
  :: run check_symbol_mapping_message()
  :: run check_instrument_clear_message()
  :: run check_trading_status_message()
  :: run check_options_auction_summary_message()
  :: run check_options_auction_width_update_message()
  :: run check_liquidity_event_notification_message()
  :: run check_liquidity_event_execution_message()
  :: run check_liquidity_event_cancel_message()
  :: run check_add_order_non_customer_message()
  :: run check_add_order_customer_message()
  :: run check_modify_order_message()
  :: run check_delete_order_message()
  :: run check_order_execution_message()
  :: run check_deep_trade_break_message()
  :: run check_quote_update_no_customer_interest_message()
  :: run check_quote_update_customer_interest_message()
  :: run check_trade_message()
  :: run check_trade_correction_message()
  :: run check_tops_trade_break_message()
  :: run check_heartbeat_message()
  :: run check_message_list_group_encoding()
  :: run check_session_shutdown_message()
  :: run check_sequence_number_reset_message()
  :: run check_retransmission_request_message()
  :: run check_retransmission_response_message()
  :: run check_snapshot_header_message()
  fi
}
