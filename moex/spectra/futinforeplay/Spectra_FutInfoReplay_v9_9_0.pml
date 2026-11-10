/*
 * Moscow Exchange SIMBA Spectra Futures Instrument Replay
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
 *   - a field read in bits
 *   - a run filling what frames it
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *   - a field present only on a condition
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 48

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Sbe Header: 8 bytes ----------------------------------------------------- */

/* Root block length, message template id, message schema id and schema version */
typedef SbeHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
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
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
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
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = (sbe_header_base + 2 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = (sbe_header_base + 4 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = (sbe_header_base + 6 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header to the wire, 8 bytes from where the cursor stands */
inline encode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.block_length[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.template_id[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.schema_id[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.version[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header off the wire, 8 bytes from where the cursor stands */
inline decode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
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
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.template_id[sbe_header_at] == sbe_header_written.template_id[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.schema_id[sbe_header_at] == sbe_header_written.schema_id[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.version[sbe_header_at] == sbe_header_written.version[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Reset Message: 4 bytes ----------------------------------------- */

/* SequenceResetMessage */
typedef SequenceResetMessage {
  byte new_seq_no[4]
};

int sequence_reset_message_at;

/* every byte of Sequence Reset Message set to one value */
inline fill_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_value) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = sequence_reset_message_value; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_base) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = (sequence_reset_message_base + 0 + sequence_reset_message_at + 1) % 256; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset Message to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> wire[at] = sequence_reset_message_record.new_seq_no[sequence_reset_message_at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset Message off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = wire[at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Reset Message is what was written, byte for byte */
inline equal_sequence_reset_message(sequence_reset_message_read, sequence_reset_message_written) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> assert(sequence_reset_message_read.new_seq_no[sequence_reset_message_at] == sequence_reset_message_written.new_seq_no[sequence_reset_message_at]); sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Size: 3 bytes ----------------------------------------------------- */

/* groupSize */
typedef GroupSize {
  byte block_length[2];
  byte num_in_group_uint_8
};

int group_size_at;

/* every byte of Group Size set to one value */
inline fill_group_size(group_size_record, group_size_value) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = group_size_value; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group_uint_8 = group_size_value;
  skip
}

/* each byte of Group Size set to where it lies, so a field read out of place says so */
inline ramp_group_size(group_size_record, group_size_base) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = (group_size_base + 0 + group_size_at + 1) % 256; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group_uint_8 = (group_size_base + 2 + 1) % 256;
  skip
}

/* Group Size to the wire, 3 bytes from where the cursor stands */
inline encode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> wire[at] = group_size_record.block_length[group_size_at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  wire[at] = group_size_record.num_in_group_uint_8; at = at + 1;
  skip
}

/* Group Size off the wire, 3 bytes from where the cursor stands */
inline decode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = wire[at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group_uint_8 = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Size is what was written, byte for byte */
inline equal_group_size(group_size_read, group_size_written) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> assert(group_size_read.block_length[group_size_at] == group_size_written.block_length[group_size_at]); group_size_at = group_size_at + 1
  :: else -> break
  od;
  assert(group_size_read.num_in_group_uint_8 == group_size_written.num_in_group_uint_8);
  skip
}

/* ---- Trading Session Status Message: 48 bytes -------------------------------- */

/* TradingSessionStatusMessage */
typedef TradingSessionStatusMessage {
  byte trad_ses_open_time[8];
  byte trad_ses_close_time[8];
  byte trading_session_id;
  byte exchange_trading_session_id_int_32_null_optional[4];
  byte trad_ses_status;
  byte market_segment_id;
  byte trad_ses_event;
  byte trade_period_id[8];
  byte settl_sess_begin[8];
  byte clr_sess_begin[8]
};

int trading_session_status_message_at;

/* every byte of Trading Session Status Message set to one value */
inline fill_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_value) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.trad_ses_open_time[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.trad_ses_close_time[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session_id = trading_session_status_message_value;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.exchange_trading_session_id_int_32_null_optional[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trad_ses_status = trading_session_status_message_value;
  trading_session_status_message_record.market_segment_id = trading_session_status_message_value;
  trading_session_status_message_record.trad_ses_event = trading_session_status_message_value;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.trade_period_id[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.settl_sess_begin[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.clr_sess_begin[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Session Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_base) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.trad_ses_open_time[trading_session_status_message_at] = (trading_session_status_message_base + 0 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.trad_ses_close_time[trading_session_status_message_at] = (trading_session_status_message_base + 8 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session_id = (trading_session_status_message_base + 16 + 1) % 256;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.exchange_trading_session_id_int_32_null_optional[trading_session_status_message_at] = (trading_session_status_message_base + 17 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trad_ses_status = (trading_session_status_message_base + 21 + 1) % 256;
  trading_session_status_message_record.market_segment_id = (trading_session_status_message_base + 22 + 1) % 256;
  trading_session_status_message_record.trad_ses_event = (trading_session_status_message_base + 23 + 1) % 256;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.trade_period_id[trading_session_status_message_at] = (trading_session_status_message_base + 24 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.settl_sess_begin[trading_session_status_message_at] = (trading_session_status_message_base + 32 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.clr_sess_begin[trading_session_status_message_at] = (trading_session_status_message_base + 40 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status Message to the wire, 48 bytes from where the cursor stands */
inline encode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.trad_ses_open_time[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.trad_ses_close_time[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_status_message_record.trading_session_id; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> wire[at] = trading_session_status_message_record.exchange_trading_session_id_int_32_null_optional[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_status_message_record.trad_ses_status; at = at + 1;
  wire[at] = trading_session_status_message_record.market_segment_id; at = at + 1;
  wire[at] = trading_session_status_message_record.trad_ses_event; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.trade_period_id[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.settl_sess_begin[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.clr_sess_begin[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status Message off the wire, 48 bytes from where the cursor stands */
inline decode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.trad_ses_open_time[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.trad_ses_close_time[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session_id = wire[at]; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.exchange_trading_session_id_int_32_null_optional[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trad_ses_status = wire[at]; at = at + 1;
  trading_session_status_message_record.market_segment_id = wire[at]; at = at + 1;
  trading_session_status_message_record.trad_ses_event = wire[at]; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.trade_period_id[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.settl_sess_begin[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.clr_sess_begin[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Session Status Message is what was written, byte for byte */
inline equal_trading_session_status_message(trading_session_status_message_read, trading_session_status_message_written) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.trad_ses_open_time[trading_session_status_message_at] == trading_session_status_message_written.trad_ses_open_time[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.trad_ses_close_time[trading_session_status_message_at] == trading_session_status_message_written.trad_ses_close_time[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  assert(trading_session_status_message_read.trading_session_id == trading_session_status_message_written.trading_session_id);
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> assert(trading_session_status_message_read.exchange_trading_session_id_int_32_null_optional[trading_session_status_message_at] == trading_session_status_message_written.exchange_trading_session_id_int_32_null_optional[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  assert(trading_session_status_message_read.trad_ses_status == trading_session_status_message_written.trad_ses_status);
  assert(trading_session_status_message_read.market_segment_id == trading_session_status_message_written.market_segment_id);
  assert(trading_session_status_message_read.trad_ses_event == trading_session_status_message_written.trad_ses_event);
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.trade_period_id[trading_session_status_message_at] == trading_session_status_message_written.trade_period_id[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.settl_sess_begin[trading_session_status_message_at] == trading_session_status_message_written.settl_sess_begin[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.clr_sess_begin[trading_session_status_message_at] == trading_session_status_message_written.clr_sess_begin[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Group Status Message: 38 bytes --------------------------------- */

/* SecurityGroupStatusMessage */
typedef SecurityGroupStatusMessage {
  byte security_group_id[8];
  byte halt_type;
  byte trade_mode_mask[4];
  byte group_mask_int_64_null_optional[8];
  byte section_id_int_32_null_optional[4];
  byte base_contract_id_int_32_null_optional[4];
  byte security_trading_status;
  byte status_change_time[8]
};

int security_group_status_message_at;

/* every byte of Security Group Status Message set to one value */
inline fill_security_group_status_message(security_group_status_message_record, security_group_status_message_value) {
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> security_group_status_message_record.security_group_id[security_group_status_message_at] = security_group_status_message_value; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_record.halt_type = security_group_status_message_value;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> security_group_status_message_record.trade_mode_mask[security_group_status_message_at] = security_group_status_message_value; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> security_group_status_message_record.group_mask_int_64_null_optional[security_group_status_message_at] = security_group_status_message_value; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> security_group_status_message_record.section_id_int_32_null_optional[security_group_status_message_at] = security_group_status_message_value; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> security_group_status_message_record.base_contract_id_int_32_null_optional[security_group_status_message_at] = security_group_status_message_value; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_record.security_trading_status = security_group_status_message_value;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> security_group_status_message_record.status_change_time[security_group_status_message_at] = security_group_status_message_value; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Group Status Message set to where it lies, so a field read out of place says so */
inline ramp_security_group_status_message(security_group_status_message_record, security_group_status_message_base) {
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> security_group_status_message_record.security_group_id[security_group_status_message_at] = (security_group_status_message_base + 0 + security_group_status_message_at + 1) % 256; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_record.halt_type = (security_group_status_message_base + 8 + 1) % 256;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> security_group_status_message_record.trade_mode_mask[security_group_status_message_at] = (security_group_status_message_base + 9 + security_group_status_message_at + 1) % 256; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> security_group_status_message_record.group_mask_int_64_null_optional[security_group_status_message_at] = (security_group_status_message_base + 13 + security_group_status_message_at + 1) % 256; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> security_group_status_message_record.section_id_int_32_null_optional[security_group_status_message_at] = (security_group_status_message_base + 21 + security_group_status_message_at + 1) % 256; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> security_group_status_message_record.base_contract_id_int_32_null_optional[security_group_status_message_at] = (security_group_status_message_base + 25 + security_group_status_message_at + 1) % 256; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_record.security_trading_status = (security_group_status_message_base + 29 + 1) % 256;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> security_group_status_message_record.status_change_time[security_group_status_message_at] = (security_group_status_message_base + 30 + security_group_status_message_at + 1) % 256; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Group Status Message to the wire, 38 bytes from where the cursor stands */
inline encode_security_group_status_message(security_group_status_message_record) {
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> wire[at] = security_group_status_message_record.security_group_id[security_group_status_message_at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_group_status_message_record.halt_type; at = at + 1;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> wire[at] = security_group_status_message_record.trade_mode_mask[security_group_status_message_at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> wire[at] = security_group_status_message_record.group_mask_int_64_null_optional[security_group_status_message_at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> wire[at] = security_group_status_message_record.section_id_int_32_null_optional[security_group_status_message_at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> wire[at] = security_group_status_message_record.base_contract_id_int_32_null_optional[security_group_status_message_at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_group_status_message_record.security_trading_status; at = at + 1;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> wire[at] = security_group_status_message_record.status_change_time[security_group_status_message_at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Group Status Message off the wire, 38 bytes from where the cursor stands */
inline decode_security_group_status_message(security_group_status_message_record) {
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> security_group_status_message_record.security_group_id[security_group_status_message_at] = wire[at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_record.halt_type = wire[at]; at = at + 1;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> security_group_status_message_record.trade_mode_mask[security_group_status_message_at] = wire[at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> security_group_status_message_record.group_mask_int_64_null_optional[security_group_status_message_at] = wire[at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> security_group_status_message_record.section_id_int_32_null_optional[security_group_status_message_at] = wire[at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> security_group_status_message_record.base_contract_id_int_32_null_optional[security_group_status_message_at] = wire[at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_record.security_trading_status = wire[at]; at = at + 1;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> security_group_status_message_record.status_change_time[security_group_status_message_at] = wire[at]; at = at + 1; security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Group Status Message is what was written, byte for byte */
inline equal_security_group_status_message(security_group_status_message_read, security_group_status_message_written) {
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> assert(security_group_status_message_read.security_group_id[security_group_status_message_at] == security_group_status_message_written.security_group_id[security_group_status_message_at]); security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  assert(security_group_status_message_read.halt_type == security_group_status_message_written.halt_type);
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> assert(security_group_status_message_read.trade_mode_mask[security_group_status_message_at] == security_group_status_message_written.trade_mode_mask[security_group_status_message_at]); security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> assert(security_group_status_message_read.group_mask_int_64_null_optional[security_group_status_message_at] == security_group_status_message_written.group_mask_int_64_null_optional[security_group_status_message_at]); security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> assert(security_group_status_message_read.section_id_int_32_null_optional[security_group_status_message_at] == security_group_status_message_written.section_id_int_32_null_optional[security_group_status_message_at]); security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 4 -> assert(security_group_status_message_read.base_contract_id_int_32_null_optional[security_group_status_message_at] == security_group_status_message_written.base_contract_id_int_32_null_optional[security_group_status_message_at]); security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  assert(security_group_status_message_read.security_trading_status == security_group_status_message_written.security_trading_status);
  security_group_status_message_at = 0;
  do
  :: security_group_status_message_at < 8 -> assert(security_group_status_message_read.status_change_time[security_group_status_message_at] == security_group_status_message_written.status_change_time[security_group_status_message_at]); security_group_status_message_at = security_group_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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
    assert(at == 8);
    at = 0;
    decode_sbe_header(sbe_header_got);
    assert(at == 8);
    equal_sbe_header(sbe_header_got, sbe_header_sent)
  }
}

/* Sequence Reset Message: encoded, read back, and compared */
proctype check_sequence_reset_message() {
  SequenceResetMessage sequence_reset_message_sent;
  SequenceResetMessage sequence_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_reset_message(sequence_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_reset_message(sequence_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_reset_message(sequence_reset_message_sent, 255)
  :: else -> ramp_sequence_reset_message(sequence_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_reset_message(sequence_reset_message_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_reset_message(sequence_reset_message_got);
    assert(at == 4);
    equal_sequence_reset_message(sequence_reset_message_got, sequence_reset_message_sent)
  }
}

/* Group Size: encoded, read back, and compared */
proctype check_group_size() {
  GroupSize group_size_sent;
  GroupSize group_size_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size(group_size_sent, 0)
  :: pattern == 1 -> fill_group_size(group_size_sent, 32)
  :: pattern == 2 -> fill_group_size(group_size_sent, 255)
  :: else -> ramp_group_size(group_size_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size(group_size_sent);
    assert(at == 3);
    at = 0;
    decode_group_size(group_size_got);
    assert(at == 3);
    equal_group_size(group_size_got, group_size_sent)
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
    assert(at == 48);
    at = 0;
    decode_trading_session_status_message(trading_session_status_message_got);
    assert(at == 48);
    equal_trading_session_status_message(trading_session_status_message_got, trading_session_status_message_sent)
  }
}

/* Security Group Status Message: encoded, read back, and compared */
proctype check_security_group_status_message() {
  SecurityGroupStatusMessage security_group_status_message_sent;
  SecurityGroupStatusMessage security_group_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_group_status_message(security_group_status_message_sent, 0)
  :: pattern == 1 -> fill_security_group_status_message(security_group_status_message_sent, 32)
  :: pattern == 2 -> fill_security_group_status_message(security_group_status_message_sent, 255)
  :: else -> ramp_security_group_status_message(security_group_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_group_status_message(security_group_status_message_sent);
    assert(at == 38);
    at = 0;
    decode_security_group_status_message(security_group_status_message_got);
    assert(at == 38);
    equal_security_group_status_message(security_group_status_message_got, security_group_status_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sbe_header()
  :: run check_sequence_reset_message()
  :: run check_group_size()
  :: run check_trading_session_status_message()
  :: run check_security_group_status_message()
  fi
}
