/*
 * The Securities Industry Automation Corporation 
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
 *   - the dispatch that chooses a message by its type
 *   - a field present only on a condition
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 205

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- SIP Block Timestamp: 8 bytes -------------------------------------------- */

/* Cta packet timestamp */
typedef SIPBlockTimestamp {
  byte seconds[4];
  byte nanoseconds[4]
};

int s_i_p_block_timestamp_at;

/* every byte of SIP Block Timestamp set to one value */
inline fill_s_i_p_block_timestamp(s_i_p_block_timestamp_record, s_i_p_block_timestamp_value) {
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> s_i_p_block_timestamp_record.seconds[s_i_p_block_timestamp_at] = s_i_p_block_timestamp_value; s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> s_i_p_block_timestamp_record.nanoseconds[s_i_p_block_timestamp_at] = s_i_p_block_timestamp_value; s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of SIP Block Timestamp set to where it lies, so a field read out of place says so */
inline ramp_s_i_p_block_timestamp(s_i_p_block_timestamp_record, s_i_p_block_timestamp_base) {
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> s_i_p_block_timestamp_record.seconds[s_i_p_block_timestamp_at] = (s_i_p_block_timestamp_base + 0 + s_i_p_block_timestamp_at + 1) % 256; s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> s_i_p_block_timestamp_record.nanoseconds[s_i_p_block_timestamp_at] = (s_i_p_block_timestamp_base + 4 + s_i_p_block_timestamp_at + 1) % 256; s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* SIP Block Timestamp to the wire, 8 bytes from where the cursor stands */
inline encode_s_i_p_block_timestamp(s_i_p_block_timestamp_record) {
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> wire[at] = s_i_p_block_timestamp_record.seconds[s_i_p_block_timestamp_at]; at = at + 1; s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> wire[at] = s_i_p_block_timestamp_record.nanoseconds[s_i_p_block_timestamp_at]; at = at + 1; s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* SIP Block Timestamp off the wire, 8 bytes from where the cursor stands */
inline decode_s_i_p_block_timestamp(s_i_p_block_timestamp_record) {
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> s_i_p_block_timestamp_record.seconds[s_i_p_block_timestamp_at] = wire[at]; at = at + 1; s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> s_i_p_block_timestamp_record.nanoseconds[s_i_p_block_timestamp_at] = wire[at]; at = at + 1; s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of SIP Block Timestamp is what was written, byte for byte */
inline equal_s_i_p_block_timestamp(s_i_p_block_timestamp_read, s_i_p_block_timestamp_written) {
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> assert(s_i_p_block_timestamp_read.seconds[s_i_p_block_timestamp_at] == s_i_p_block_timestamp_written.seconds[s_i_p_block_timestamp_at]); s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  s_i_p_block_timestamp_at = 0;
  do
  :: s_i_p_block_timestamp_at < 4 -> assert(s_i_p_block_timestamp_read.nanoseconds[s_i_p_block_timestamp_at] == s_i_p_block_timestamp_written.nanoseconds[s_i_p_block_timestamp_at]); s_i_p_block_timestamp_at = s_i_p_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Block Header: 20 bytes -------------------------------------------------- */

/* Cta Output packet header */
typedef BlockHeader {
  byte version;
  byte block_size[2];
  byte data_feed_indicator;
  byte retransmission_indicator;
  byte block_sequence_number[4];
  byte messages_in_block;
  SIPBlockTimestamp s_i_p_block_timestamp;
  byte block_checksum[2]
};

int block_header_at;

/* every byte of Block Header set to one value */
inline fill_block_header(block_header_record, block_header_value) {
  block_header_record.version = block_header_value;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.data_feed_indicator = block_header_value;
  block_header_record.retransmission_indicator = block_header_value;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = block_header_value;
  fill_s_i_p_block_timestamp(block_header_record.s_i_p_block_timestamp, block_header_value);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Header set to where it lies, so a field read out of place says so */
inline ramp_block_header(block_header_record, block_header_base) {
  block_header_record.version = (block_header_base + 0 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = (block_header_base + 1 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.data_feed_indicator = (block_header_base + 3 + 1) % 256;
  block_header_record.retransmission_indicator = (block_header_base + 4 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = (block_header_base + 5 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = (block_header_base + 9 + 1) % 256;
  ramp_s_i_p_block_timestamp(block_header_record.s_i_p_block_timestamp, block_header_base + 10);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = (block_header_base + 18 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header to the wire, 20 bytes from where the cursor stands */
inline encode_block_header(block_header_record) {
  wire[at] = block_header_record.version; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_size[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.data_feed_indicator; at = at + 1;
  wire[at] = block_header_record.retransmission_indicator; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> wire[at] = block_header_record.block_sequence_number[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.messages_in_block; at = at + 1;
  encode_s_i_p_block_timestamp(block_header_record.s_i_p_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_checksum[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header off the wire, 20 bytes from where the cursor stands */
inline decode_block_header(block_header_record) {
  block_header_record.version = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.data_feed_indicator = wire[at]; at = at + 1;
  block_header_record.retransmission_indicator = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = wire[at]; at = at + 1;
  decode_s_i_p_block_timestamp(block_header_record.s_i_p_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Header is what was written, byte for byte */
inline equal_block_header(block_header_read, block_header_written) {
  assert(block_header_read.version == block_header_written.version);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_size[block_header_at] == block_header_written.block_size[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.data_feed_indicator == block_header_written.data_feed_indicator);
  assert(block_header_read.retransmission_indicator == block_header_written.retransmission_indicator);
  block_header_at = 0;
  do
  :: block_header_at < 4 -> assert(block_header_read.block_sequence_number[block_header_at] == block_header_written.block_sequence_number[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.messages_in_block == block_header_written.messages_in_block);
  equal_s_i_p_block_timestamp(block_header_read.s_i_p_block_timestamp, block_header_written.s_i_p_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_checksum[block_header_at] == block_header_written.block_checksum[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Timestamp 1: 8 bytes ---------------------------------------------------- */

/* Timestamp 1 */
typedef Timestamp1 {
  byte seconds[4];
  byte nanoseconds[4]
};

int timestamp1_at;

/* every byte of Timestamp 1 set to one value */
inline fill_timestamp1(timestamp1_record, timestamp1_value) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.seconds[timestamp1_at] = timestamp1_value; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.nanoseconds[timestamp1_at] = timestamp1_value; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp 1 set to where it lies, so a field read out of place says so */
inline ramp_timestamp1(timestamp1_record, timestamp1_base) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.seconds[timestamp1_at] = (timestamp1_base + 0 + timestamp1_at + 1) % 256; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.nanoseconds[timestamp1_at] = (timestamp1_base + 4 + timestamp1_at + 1) % 256; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp 1 to the wire, 8 bytes from where the cursor stands */
inline encode_timestamp1(timestamp1_record) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> wire[at] = timestamp1_record.seconds[timestamp1_at]; at = at + 1; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> wire[at] = timestamp1_record.nanoseconds[timestamp1_at]; at = at + 1; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp 1 off the wire, 8 bytes from where the cursor stands */
inline decode_timestamp1(timestamp1_record) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.seconds[timestamp1_at] = wire[at]; at = at + 1; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.nanoseconds[timestamp1_at] = wire[at]; at = at + 1; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp 1 is what was written, byte for byte */
inline equal_timestamp1(timestamp1_read, timestamp1_written) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> assert(timestamp1_read.seconds[timestamp1_at] == timestamp1_written.seconds[timestamp1_at]); timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> assert(timestamp1_read.nanoseconds[timestamp1_at] == timestamp1_written.nanoseconds[timestamp1_at]); timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Reference Data Message: 205 bytes -------------------------------- */

/* Symbol Reference Data Message */
typedef SymbolReferenceDataMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte prior_security_symbol[11];
  byte primary_listing_market_participant_id;
  byte primary_listing_market_previous_closing_price[8];
  byte consolidated_closing_price[8];
  byte round_lot_size[2];
  byte reserved;
  byte luld_tier;
  byte luld_leverage_ratio[4];
  byte test;
  byte ipo;
  byte financial_status_indicator;
  byte short_sale_restriction_indicator;
  byte halt_reason;
  byte instrument_type;
  byte second_reserved;
  byte third_reserved;
  byte reserved_128[128]
};

int symbol_reference_data_message_at;

/* every byte of Symbol Reference Data Message set to one value */
inline fill_symbol_reference_data_message(symbol_reference_data_message_record, symbol_reference_data_message_value) {
  symbol_reference_data_message_record.participant_id = symbol_reference_data_message_value;
  fill_timestamp1(symbol_reference_data_message_record.timestamp_1, symbol_reference_data_message_value);
  symbol_reference_data_message_record.message_id = symbol_reference_data_message_value;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> symbol_reference_data_message_record.transaction_id[symbol_reference_data_message_at] = symbol_reference_data_message_value; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> symbol_reference_data_message_record.participant_reference_number[symbol_reference_data_message_at] = symbol_reference_data_message_value; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> symbol_reference_data_message_record.security_symbol[symbol_reference_data_message_at] = symbol_reference_data_message_value; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> symbol_reference_data_message_record.prior_security_symbol[symbol_reference_data_message_at] = symbol_reference_data_message_value; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_record.primary_listing_market_participant_id = symbol_reference_data_message_value;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> symbol_reference_data_message_record.primary_listing_market_previous_closing_price[symbol_reference_data_message_at] = symbol_reference_data_message_value; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> symbol_reference_data_message_record.consolidated_closing_price[symbol_reference_data_message_at] = symbol_reference_data_message_value; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 2 -> symbol_reference_data_message_record.round_lot_size[symbol_reference_data_message_at] = symbol_reference_data_message_value; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_record.reserved = symbol_reference_data_message_value;
  symbol_reference_data_message_record.luld_tier = symbol_reference_data_message_value;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> symbol_reference_data_message_record.luld_leverage_ratio[symbol_reference_data_message_at] = symbol_reference_data_message_value; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_record.test = symbol_reference_data_message_value;
  symbol_reference_data_message_record.ipo = symbol_reference_data_message_value;
  symbol_reference_data_message_record.financial_status_indicator = symbol_reference_data_message_value;
  symbol_reference_data_message_record.short_sale_restriction_indicator = symbol_reference_data_message_value;
  symbol_reference_data_message_record.halt_reason = symbol_reference_data_message_value;
  symbol_reference_data_message_record.instrument_type = symbol_reference_data_message_value;
  symbol_reference_data_message_record.second_reserved = symbol_reference_data_message_value;
  symbol_reference_data_message_record.third_reserved = symbol_reference_data_message_value;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 128 -> symbol_reference_data_message_record.reserved_128[symbol_reference_data_message_at] = symbol_reference_data_message_value; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Reference Data Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_reference_data_message(symbol_reference_data_message_record, symbol_reference_data_message_base) {
  symbol_reference_data_message_record.participant_id = (symbol_reference_data_message_base + 0 + 1) % 256;
  ramp_timestamp1(symbol_reference_data_message_record.timestamp_1, symbol_reference_data_message_base + 1);
  symbol_reference_data_message_record.message_id = (symbol_reference_data_message_base + 9 + 1) % 256;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> symbol_reference_data_message_record.transaction_id[symbol_reference_data_message_at] = (symbol_reference_data_message_base + 10 + symbol_reference_data_message_at + 1) % 256; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> symbol_reference_data_message_record.participant_reference_number[symbol_reference_data_message_at] = (symbol_reference_data_message_base + 14 + symbol_reference_data_message_at + 1) % 256; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> symbol_reference_data_message_record.security_symbol[symbol_reference_data_message_at] = (symbol_reference_data_message_base + 22 + symbol_reference_data_message_at + 1) % 256; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> symbol_reference_data_message_record.prior_security_symbol[symbol_reference_data_message_at] = (symbol_reference_data_message_base + 33 + symbol_reference_data_message_at + 1) % 256; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_record.primary_listing_market_participant_id = (symbol_reference_data_message_base + 44 + 1) % 256;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> symbol_reference_data_message_record.primary_listing_market_previous_closing_price[symbol_reference_data_message_at] = (symbol_reference_data_message_base + 45 + symbol_reference_data_message_at + 1) % 256; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> symbol_reference_data_message_record.consolidated_closing_price[symbol_reference_data_message_at] = (symbol_reference_data_message_base + 53 + symbol_reference_data_message_at + 1) % 256; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 2 -> symbol_reference_data_message_record.round_lot_size[symbol_reference_data_message_at] = (symbol_reference_data_message_base + 61 + symbol_reference_data_message_at + 1) % 256; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_record.reserved = (symbol_reference_data_message_base + 63 + 1) % 256;
  symbol_reference_data_message_record.luld_tier = (symbol_reference_data_message_base + 64 + 1) % 256;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> symbol_reference_data_message_record.luld_leverage_ratio[symbol_reference_data_message_at] = (symbol_reference_data_message_base + 65 + symbol_reference_data_message_at + 1) % 256; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_record.test = (symbol_reference_data_message_base + 69 + 1) % 256;
  symbol_reference_data_message_record.ipo = (symbol_reference_data_message_base + 70 + 1) % 256;
  symbol_reference_data_message_record.financial_status_indicator = (symbol_reference_data_message_base + 71 + 1) % 256;
  symbol_reference_data_message_record.short_sale_restriction_indicator = (symbol_reference_data_message_base + 72 + 1) % 256;
  symbol_reference_data_message_record.halt_reason = (symbol_reference_data_message_base + 73 + 1) % 256;
  symbol_reference_data_message_record.instrument_type = (symbol_reference_data_message_base + 74 + 1) % 256;
  symbol_reference_data_message_record.second_reserved = (symbol_reference_data_message_base + 75 + 1) % 256;
  symbol_reference_data_message_record.third_reserved = (symbol_reference_data_message_base + 76 + 1) % 256;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 128 -> symbol_reference_data_message_record.reserved_128[symbol_reference_data_message_at] = (symbol_reference_data_message_base + 77 + symbol_reference_data_message_at + 1) % 256; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Reference Data Message to the wire, 205 bytes from where the cursor stands */
inline encode_symbol_reference_data_message(symbol_reference_data_message_record) {
  wire[at] = symbol_reference_data_message_record.participant_id; at = at + 1;
  encode_timestamp1(symbol_reference_data_message_record.timestamp_1);
  wire[at] = symbol_reference_data_message_record.message_id; at = at + 1;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> wire[at] = symbol_reference_data_message_record.transaction_id[symbol_reference_data_message_at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> wire[at] = symbol_reference_data_message_record.participant_reference_number[symbol_reference_data_message_at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> wire[at] = symbol_reference_data_message_record.security_symbol[symbol_reference_data_message_at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> wire[at] = symbol_reference_data_message_record.prior_security_symbol[symbol_reference_data_message_at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_reference_data_message_record.primary_listing_market_participant_id; at = at + 1;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> wire[at] = symbol_reference_data_message_record.primary_listing_market_previous_closing_price[symbol_reference_data_message_at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> wire[at] = symbol_reference_data_message_record.consolidated_closing_price[symbol_reference_data_message_at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 2 -> wire[at] = symbol_reference_data_message_record.round_lot_size[symbol_reference_data_message_at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_reference_data_message_record.reserved; at = at + 1;
  wire[at] = symbol_reference_data_message_record.luld_tier; at = at + 1;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> wire[at] = symbol_reference_data_message_record.luld_leverage_ratio[symbol_reference_data_message_at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_reference_data_message_record.test; at = at + 1;
  wire[at] = symbol_reference_data_message_record.ipo; at = at + 1;
  wire[at] = symbol_reference_data_message_record.financial_status_indicator; at = at + 1;
  wire[at] = symbol_reference_data_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = symbol_reference_data_message_record.halt_reason; at = at + 1;
  wire[at] = symbol_reference_data_message_record.instrument_type; at = at + 1;
  wire[at] = symbol_reference_data_message_record.second_reserved; at = at + 1;
  wire[at] = symbol_reference_data_message_record.third_reserved; at = at + 1;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 128 -> wire[at] = symbol_reference_data_message_record.reserved_128[symbol_reference_data_message_at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Reference Data Message off the wire, 205 bytes from where the cursor stands */
inline decode_symbol_reference_data_message(symbol_reference_data_message_record) {
  symbol_reference_data_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(symbol_reference_data_message_record.timestamp_1);
  symbol_reference_data_message_record.message_id = wire[at]; at = at + 1;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> symbol_reference_data_message_record.transaction_id[symbol_reference_data_message_at] = wire[at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> symbol_reference_data_message_record.participant_reference_number[symbol_reference_data_message_at] = wire[at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> symbol_reference_data_message_record.security_symbol[symbol_reference_data_message_at] = wire[at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> symbol_reference_data_message_record.prior_security_symbol[symbol_reference_data_message_at] = wire[at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> symbol_reference_data_message_record.primary_listing_market_previous_closing_price[symbol_reference_data_message_at] = wire[at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> symbol_reference_data_message_record.consolidated_closing_price[symbol_reference_data_message_at] = wire[at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 2 -> symbol_reference_data_message_record.round_lot_size[symbol_reference_data_message_at] = wire[at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_record.reserved = wire[at]; at = at + 1;
  symbol_reference_data_message_record.luld_tier = wire[at]; at = at + 1;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> symbol_reference_data_message_record.luld_leverage_ratio[symbol_reference_data_message_at] = wire[at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_record.test = wire[at]; at = at + 1;
  symbol_reference_data_message_record.ipo = wire[at]; at = at + 1;
  symbol_reference_data_message_record.financial_status_indicator = wire[at]; at = at + 1;
  symbol_reference_data_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  symbol_reference_data_message_record.halt_reason = wire[at]; at = at + 1;
  symbol_reference_data_message_record.instrument_type = wire[at]; at = at + 1;
  symbol_reference_data_message_record.second_reserved = wire[at]; at = at + 1;
  symbol_reference_data_message_record.third_reserved = wire[at]; at = at + 1;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 128 -> symbol_reference_data_message_record.reserved_128[symbol_reference_data_message_at] = wire[at]; at = at + 1; symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Reference Data Message is what was written, byte for byte */
inline equal_symbol_reference_data_message(symbol_reference_data_message_read, symbol_reference_data_message_written) {
  assert(symbol_reference_data_message_read.participant_id == symbol_reference_data_message_written.participant_id);
  equal_timestamp1(symbol_reference_data_message_read.timestamp_1, symbol_reference_data_message_written.timestamp_1);
  assert(symbol_reference_data_message_read.message_id == symbol_reference_data_message_written.message_id);
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> assert(symbol_reference_data_message_read.transaction_id[symbol_reference_data_message_at] == symbol_reference_data_message_written.transaction_id[symbol_reference_data_message_at]); symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> assert(symbol_reference_data_message_read.participant_reference_number[symbol_reference_data_message_at] == symbol_reference_data_message_written.participant_reference_number[symbol_reference_data_message_at]); symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> assert(symbol_reference_data_message_read.security_symbol[symbol_reference_data_message_at] == symbol_reference_data_message_written.security_symbol[symbol_reference_data_message_at]); symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 11 -> assert(symbol_reference_data_message_read.prior_security_symbol[symbol_reference_data_message_at] == symbol_reference_data_message_written.prior_security_symbol[symbol_reference_data_message_at]); symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  assert(symbol_reference_data_message_read.primary_listing_market_participant_id == symbol_reference_data_message_written.primary_listing_market_participant_id);
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> assert(symbol_reference_data_message_read.primary_listing_market_previous_closing_price[symbol_reference_data_message_at] == symbol_reference_data_message_written.primary_listing_market_previous_closing_price[symbol_reference_data_message_at]); symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 8 -> assert(symbol_reference_data_message_read.consolidated_closing_price[symbol_reference_data_message_at] == symbol_reference_data_message_written.consolidated_closing_price[symbol_reference_data_message_at]); symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 2 -> assert(symbol_reference_data_message_read.round_lot_size[symbol_reference_data_message_at] == symbol_reference_data_message_written.round_lot_size[symbol_reference_data_message_at]); symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  assert(symbol_reference_data_message_read.reserved == symbol_reference_data_message_written.reserved);
  assert(symbol_reference_data_message_read.luld_tier == symbol_reference_data_message_written.luld_tier);
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 4 -> assert(symbol_reference_data_message_read.luld_leverage_ratio[symbol_reference_data_message_at] == symbol_reference_data_message_written.luld_leverage_ratio[symbol_reference_data_message_at]); symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  assert(symbol_reference_data_message_read.test == symbol_reference_data_message_written.test);
  assert(symbol_reference_data_message_read.ipo == symbol_reference_data_message_written.ipo);
  assert(symbol_reference_data_message_read.financial_status_indicator == symbol_reference_data_message_written.financial_status_indicator);
  assert(symbol_reference_data_message_read.short_sale_restriction_indicator == symbol_reference_data_message_written.short_sale_restriction_indicator);
  assert(symbol_reference_data_message_read.halt_reason == symbol_reference_data_message_written.halt_reason);
  assert(symbol_reference_data_message_read.instrument_type == symbol_reference_data_message_written.instrument_type);
  assert(symbol_reference_data_message_read.second_reserved == symbol_reference_data_message_written.second_reserved);
  assert(symbol_reference_data_message_read.third_reserved == symbol_reference_data_message_written.third_reserved);
  symbol_reference_data_message_at = 0;
  do
  :: symbol_reference_data_message_at < 128 -> assert(symbol_reference_data_message_read.reserved_128[symbol_reference_data_message_at] == symbol_reference_data_message_written.reserved_128[symbol_reference_data_message_at]); symbol_reference_data_message_at = symbol_reference_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Day Message: 22 bytes ------------------------------------------ */

/* Start of Day Message */
typedef StartOfDayMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int start_of_day_message_at;

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  start_of_day_message_record.participant_id = start_of_day_message_value;
  fill_timestamp1(start_of_day_message_record.timestamp_1, start_of_day_message_value);
  start_of_day_message_record.message_id = start_of_day_message_value;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> start_of_day_message_record.transaction_id[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_reference_number[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  start_of_day_message_record.participant_id = (start_of_day_message_base + 0 + 1) % 256;
  ramp_timestamp1(start_of_day_message_record.timestamp_1, start_of_day_message_base + 1);
  start_of_day_message_record.message_id = (start_of_day_message_base + 9 + 1) % 256;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> start_of_day_message_record.transaction_id[start_of_day_message_at] = (start_of_day_message_base + 10 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_reference_number[start_of_day_message_at] = (start_of_day_message_base + 14 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message to the wire, 22 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  wire[at] = start_of_day_message_record.participant_id; at = at + 1;
  encode_timestamp1(start_of_day_message_record.timestamp_1);
  wire[at] = start_of_day_message_record.message_id; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> wire[at] = start_of_day_message_record.transaction_id[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.participant_reference_number[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message off the wire, 22 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  start_of_day_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(start_of_day_message_record.timestamp_1);
  start_of_day_message_record.message_id = wire[at]; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> start_of_day_message_record.transaction_id[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_reference_number[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  assert(start_of_day_message_read.participant_id == start_of_day_message_written.participant_id);
  equal_timestamp1(start_of_day_message_read.timestamp_1, start_of_day_message_written.timestamp_1);
  assert(start_of_day_message_read.message_id == start_of_day_message_written.message_id);
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> assert(start_of_day_message_read.transaction_id[start_of_day_message_at] == start_of_day_message_written.transaction_id[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.participant_reference_number[start_of_day_message_at] == start_of_day_message_written.participant_reference_number[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Finra Close Message: 22 bytes ------------------------------------------- */

/* FINRA Close Message */
typedef FinraCloseMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int finra_close_message_at;

/* every byte of Finra Close Message set to one value */
inline fill_finra_close_message(finra_close_message_record, finra_close_message_value) {
  finra_close_message_record.participant_id = finra_close_message_value;
  fill_timestamp1(finra_close_message_record.timestamp_1, finra_close_message_value);
  finra_close_message_record.message_id = finra_close_message_value;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> finra_close_message_record.transaction_id[finra_close_message_at] = finra_close_message_value; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> finra_close_message_record.participant_reference_number[finra_close_message_at] = finra_close_message_value; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Finra Close Message set to where it lies, so a field read out of place says so */
inline ramp_finra_close_message(finra_close_message_record, finra_close_message_base) {
  finra_close_message_record.participant_id = (finra_close_message_base + 0 + 1) % 256;
  ramp_timestamp1(finra_close_message_record.timestamp_1, finra_close_message_base + 1);
  finra_close_message_record.message_id = (finra_close_message_base + 9 + 1) % 256;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> finra_close_message_record.transaction_id[finra_close_message_at] = (finra_close_message_base + 10 + finra_close_message_at + 1) % 256; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> finra_close_message_record.participant_reference_number[finra_close_message_at] = (finra_close_message_base + 14 + finra_close_message_at + 1) % 256; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Close Message to the wire, 22 bytes from where the cursor stands */
inline encode_finra_close_message(finra_close_message_record) {
  wire[at] = finra_close_message_record.participant_id; at = at + 1;
  encode_timestamp1(finra_close_message_record.timestamp_1);
  wire[at] = finra_close_message_record.message_id; at = at + 1;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> wire[at] = finra_close_message_record.transaction_id[finra_close_message_at]; at = at + 1; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> wire[at] = finra_close_message_record.participant_reference_number[finra_close_message_at]; at = at + 1; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Close Message off the wire, 22 bytes from where the cursor stands */
inline decode_finra_close_message(finra_close_message_record) {
  finra_close_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(finra_close_message_record.timestamp_1);
  finra_close_message_record.message_id = wire[at]; at = at + 1;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> finra_close_message_record.transaction_id[finra_close_message_at] = wire[at]; at = at + 1; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> finra_close_message_record.participant_reference_number[finra_close_message_at] = wire[at]; at = at + 1; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Finra Close Message is what was written, byte for byte */
inline equal_finra_close_message(finra_close_message_read, finra_close_message_written) {
  assert(finra_close_message_read.participant_id == finra_close_message_written.participant_id);
  equal_timestamp1(finra_close_message_read.timestamp_1, finra_close_message_written.timestamp_1);
  assert(finra_close_message_read.message_id == finra_close_message_written.message_id);
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> assert(finra_close_message_read.transaction_id[finra_close_message_at] == finra_close_message_written.transaction_id[finra_close_message_at]); finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> assert(finra_close_message_read.participant_reference_number[finra_close_message_at] == finra_close_message_written.participant_reference_number[finra_close_message_at]); finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset Block Sequence Number Message: 22 bytes --------------------------- */

/* Reset Block Sequence Number Message */
typedef ResetBlockSequenceNumberMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int reset_block_sequence_number_message_at;

/* every byte of Reset Block Sequence Number Message set to one value */
inline fill_reset_block_sequence_number_message(reset_block_sequence_number_message_record, reset_block_sequence_number_message_value) {
  reset_block_sequence_number_message_record.participant_id = reset_block_sequence_number_message_value;
  fill_timestamp1(reset_block_sequence_number_message_record.timestamp_1, reset_block_sequence_number_message_value);
  reset_block_sequence_number_message_record.message_id = reset_block_sequence_number_message_value;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at] = reset_block_sequence_number_message_value; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at] = reset_block_sequence_number_message_value; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset Block Sequence Number Message set to where it lies, so a field read out of place says so */
inline ramp_reset_block_sequence_number_message(reset_block_sequence_number_message_record, reset_block_sequence_number_message_base) {
  reset_block_sequence_number_message_record.participant_id = (reset_block_sequence_number_message_base + 0 + 1) % 256;
  ramp_timestamp1(reset_block_sequence_number_message_record.timestamp_1, reset_block_sequence_number_message_base + 1);
  reset_block_sequence_number_message_record.message_id = (reset_block_sequence_number_message_base + 9 + 1) % 256;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at] = (reset_block_sequence_number_message_base + 10 + reset_block_sequence_number_message_at + 1) % 256; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at] = (reset_block_sequence_number_message_base + 14 + reset_block_sequence_number_message_at + 1) % 256; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Block Sequence Number Message to the wire, 22 bytes from where the cursor stands */
inline encode_reset_block_sequence_number_message(reset_block_sequence_number_message_record) {
  wire[at] = reset_block_sequence_number_message_record.participant_id; at = at + 1;
  encode_timestamp1(reset_block_sequence_number_message_record.timestamp_1);
  wire[at] = reset_block_sequence_number_message_record.message_id; at = at + 1;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> wire[at] = reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> wire[at] = reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Block Sequence Number Message off the wire, 22 bytes from where the cursor stands */
inline decode_reset_block_sequence_number_message(reset_block_sequence_number_message_record) {
  reset_block_sequence_number_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(reset_block_sequence_number_message_record.timestamp_1);
  reset_block_sequence_number_message_record.message_id = wire[at]; at = at + 1;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at] = wire[at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at] = wire[at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset Block Sequence Number Message is what was written, byte for byte */
inline equal_reset_block_sequence_number_message(reset_block_sequence_number_message_read, reset_block_sequence_number_message_written) {
  assert(reset_block_sequence_number_message_read.participant_id == reset_block_sequence_number_message_written.participant_id);
  equal_timestamp1(reset_block_sequence_number_message_read.timestamp_1, reset_block_sequence_number_message_written.timestamp_1);
  assert(reset_block_sequence_number_message_read.message_id == reset_block_sequence_number_message_written.message_id);
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> assert(reset_block_sequence_number_message_read.transaction_id[reset_block_sequence_number_message_at] == reset_block_sequence_number_message_written.transaction_id[reset_block_sequence_number_message_at]); reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> assert(reset_block_sequence_number_message_read.participant_reference_number[reset_block_sequence_number_message_at] == reset_block_sequence_number_message_written.participant_reference_number[reset_block_sequence_number_message_at]); reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Finra Open Message: 22 bytes -------------------------------------------- */

/* FINRA Open Message */
typedef FinraOpenMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int finra_open_message_at;

/* every byte of Finra Open Message set to one value */
inline fill_finra_open_message(finra_open_message_record, finra_open_message_value) {
  finra_open_message_record.participant_id = finra_open_message_value;
  fill_timestamp1(finra_open_message_record.timestamp_1, finra_open_message_value);
  finra_open_message_record.message_id = finra_open_message_value;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> finra_open_message_record.transaction_id[finra_open_message_at] = finra_open_message_value; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> finra_open_message_record.participant_reference_number[finra_open_message_at] = finra_open_message_value; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Finra Open Message set to where it lies, so a field read out of place says so */
inline ramp_finra_open_message(finra_open_message_record, finra_open_message_base) {
  finra_open_message_record.participant_id = (finra_open_message_base + 0 + 1) % 256;
  ramp_timestamp1(finra_open_message_record.timestamp_1, finra_open_message_base + 1);
  finra_open_message_record.message_id = (finra_open_message_base + 9 + 1) % 256;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> finra_open_message_record.transaction_id[finra_open_message_at] = (finra_open_message_base + 10 + finra_open_message_at + 1) % 256; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> finra_open_message_record.participant_reference_number[finra_open_message_at] = (finra_open_message_base + 14 + finra_open_message_at + 1) % 256; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Open Message to the wire, 22 bytes from where the cursor stands */
inline encode_finra_open_message(finra_open_message_record) {
  wire[at] = finra_open_message_record.participant_id; at = at + 1;
  encode_timestamp1(finra_open_message_record.timestamp_1);
  wire[at] = finra_open_message_record.message_id; at = at + 1;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> wire[at] = finra_open_message_record.transaction_id[finra_open_message_at]; at = at + 1; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> wire[at] = finra_open_message_record.participant_reference_number[finra_open_message_at]; at = at + 1; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Open Message off the wire, 22 bytes from where the cursor stands */
inline decode_finra_open_message(finra_open_message_record) {
  finra_open_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(finra_open_message_record.timestamp_1);
  finra_open_message_record.message_id = wire[at]; at = at + 1;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> finra_open_message_record.transaction_id[finra_open_message_at] = wire[at]; at = at + 1; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> finra_open_message_record.participant_reference_number[finra_open_message_at] = wire[at]; at = at + 1; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Finra Open Message is what was written, byte for byte */
inline equal_finra_open_message(finra_open_message_read, finra_open_message_written) {
  assert(finra_open_message_read.participant_id == finra_open_message_written.participant_id);
  equal_timestamp1(finra_open_message_read.timestamp_1, finra_open_message_written.timestamp_1);
  assert(finra_open_message_read.message_id == finra_open_message_written.message_id);
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> assert(finra_open_message_read.transaction_id[finra_open_message_at] == finra_open_message_written.transaction_id[finra_open_message_at]); finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> assert(finra_open_message_read.participant_reference_number[finra_open_message_at] == finra_open_message_written.participant_reference_number[finra_open_message_at]); finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Disaster Recovery Data Center Activation Message: 22 bytes -------------- */

/* Disaster Recovery Data Center Activation Message */
typedef DisasterRecoveryDataCenterActivationMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int disaster_recovery_data_center_activation_message_at;

/* every byte of Disaster Recovery Data Center Activation Message set to one value */
inline fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record, disaster_recovery_data_center_activation_message_value) {
  disaster_recovery_data_center_activation_message_record.participant_id = disaster_recovery_data_center_activation_message_value;
  fill_timestamp1(disaster_recovery_data_center_activation_message_record.timestamp_1, disaster_recovery_data_center_activation_message_value);
  disaster_recovery_data_center_activation_message_record.message_id = disaster_recovery_data_center_activation_message_value;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at] = disaster_recovery_data_center_activation_message_value; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at] = disaster_recovery_data_center_activation_message_value; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Disaster Recovery Data Center Activation Message set to where it lies, so a field read out of place says so */
inline ramp_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record, disaster_recovery_data_center_activation_message_base) {
  disaster_recovery_data_center_activation_message_record.participant_id = (disaster_recovery_data_center_activation_message_base + 0 + 1) % 256;
  ramp_timestamp1(disaster_recovery_data_center_activation_message_record.timestamp_1, disaster_recovery_data_center_activation_message_base + 1);
  disaster_recovery_data_center_activation_message_record.message_id = (disaster_recovery_data_center_activation_message_base + 9 + 1) % 256;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at] = (disaster_recovery_data_center_activation_message_base + 10 + disaster_recovery_data_center_activation_message_at + 1) % 256; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at] = (disaster_recovery_data_center_activation_message_base + 14 + disaster_recovery_data_center_activation_message_at + 1) % 256; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Data Center Activation Message to the wire, 22 bytes from where the cursor stands */
inline encode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record) {
  wire[at] = disaster_recovery_data_center_activation_message_record.participant_id; at = at + 1;
  encode_timestamp1(disaster_recovery_data_center_activation_message_record.timestamp_1);
  wire[at] = disaster_recovery_data_center_activation_message_record.message_id; at = at + 1;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> wire[at] = disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> wire[at] = disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Data Center Activation Message off the wire, 22 bytes from where the cursor stands */
inline decode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record) {
  disaster_recovery_data_center_activation_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(disaster_recovery_data_center_activation_message_record.timestamp_1);
  disaster_recovery_data_center_activation_message_record.message_id = wire[at]; at = at + 1;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at] = wire[at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at] = wire[at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Disaster Recovery Data Center Activation Message is what was written, byte for byte */
inline equal_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_read, disaster_recovery_data_center_activation_message_written) {
  assert(disaster_recovery_data_center_activation_message_read.participant_id == disaster_recovery_data_center_activation_message_written.participant_id);
  equal_timestamp1(disaster_recovery_data_center_activation_message_read.timestamp_1, disaster_recovery_data_center_activation_message_written.timestamp_1);
  assert(disaster_recovery_data_center_activation_message_read.message_id == disaster_recovery_data_center_activation_message_written.message_id);
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> assert(disaster_recovery_data_center_activation_message_read.transaction_id[disaster_recovery_data_center_activation_message_at] == disaster_recovery_data_center_activation_message_written.transaction_id[disaster_recovery_data_center_activation_message_at]); disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> assert(disaster_recovery_data_center_activation_message_read.participant_reference_number[disaster_recovery_data_center_activation_message_at] == disaster_recovery_data_center_activation_message_written.participant_reference_number[disaster_recovery_data_center_activation_message_at]); disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Line Integrity Message: 22 bytes ---------------------------------------- */

/* Line Integrity Message */
typedef LineIntegrityMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int line_integrity_message_at;

/* every byte of Line Integrity Message set to one value */
inline fill_line_integrity_message(line_integrity_message_record, line_integrity_message_value) {
  line_integrity_message_record.participant_id = line_integrity_message_value;
  fill_timestamp1(line_integrity_message_record.timestamp_1, line_integrity_message_value);
  line_integrity_message_record.message_id = line_integrity_message_value;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> line_integrity_message_record.transaction_id[line_integrity_message_at] = line_integrity_message_value; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> line_integrity_message_record.participant_reference_number[line_integrity_message_at] = line_integrity_message_value; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Line Integrity Message set to where it lies, so a field read out of place says so */
inline ramp_line_integrity_message(line_integrity_message_record, line_integrity_message_base) {
  line_integrity_message_record.participant_id = (line_integrity_message_base + 0 + 1) % 256;
  ramp_timestamp1(line_integrity_message_record.timestamp_1, line_integrity_message_base + 1);
  line_integrity_message_record.message_id = (line_integrity_message_base + 9 + 1) % 256;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> line_integrity_message_record.transaction_id[line_integrity_message_at] = (line_integrity_message_base + 10 + line_integrity_message_at + 1) % 256; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> line_integrity_message_record.participant_reference_number[line_integrity_message_at] = (line_integrity_message_base + 14 + line_integrity_message_at + 1) % 256; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Line Integrity Message to the wire, 22 bytes from where the cursor stands */
inline encode_line_integrity_message(line_integrity_message_record) {
  wire[at] = line_integrity_message_record.participant_id; at = at + 1;
  encode_timestamp1(line_integrity_message_record.timestamp_1);
  wire[at] = line_integrity_message_record.message_id; at = at + 1;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> wire[at] = line_integrity_message_record.transaction_id[line_integrity_message_at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> wire[at] = line_integrity_message_record.participant_reference_number[line_integrity_message_at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Line Integrity Message off the wire, 22 bytes from where the cursor stands */
inline decode_line_integrity_message(line_integrity_message_record) {
  line_integrity_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(line_integrity_message_record.timestamp_1);
  line_integrity_message_record.message_id = wire[at]; at = at + 1;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> line_integrity_message_record.transaction_id[line_integrity_message_at] = wire[at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> line_integrity_message_record.participant_reference_number[line_integrity_message_at] = wire[at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Line Integrity Message is what was written, byte for byte */
inline equal_line_integrity_message(line_integrity_message_read, line_integrity_message_written) {
  assert(line_integrity_message_read.participant_id == line_integrity_message_written.participant_id);
  equal_timestamp1(line_integrity_message_read.timestamp_1, line_integrity_message_written.timestamp_1);
  assert(line_integrity_message_read.message_id == line_integrity_message_written.message_id);
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> assert(line_integrity_message_read.transaction_id[line_integrity_message_at] == line_integrity_message_written.transaction_id[line_integrity_message_at]); line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> assert(line_integrity_message_read.participant_reference_number[line_integrity_message_at] == line_integrity_message_written.participant_reference_number[line_integrity_message_at]); line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Day Message: 22 bytes -------------------------------------------- */

/* End of Day Message */
typedef EndOfDayMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int end_of_day_message_at;

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  end_of_day_message_record.participant_id = end_of_day_message_value;
  fill_timestamp1(end_of_day_message_record.timestamp_1, end_of_day_message_value);
  end_of_day_message_record.message_id = end_of_day_message_value;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> end_of_day_message_record.transaction_id[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_reference_number[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  end_of_day_message_record.participant_id = (end_of_day_message_base + 0 + 1) % 256;
  ramp_timestamp1(end_of_day_message_record.timestamp_1, end_of_day_message_base + 1);
  end_of_day_message_record.message_id = (end_of_day_message_base + 9 + 1) % 256;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> end_of_day_message_record.transaction_id[end_of_day_message_at] = (end_of_day_message_base + 10 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_reference_number[end_of_day_message_at] = (end_of_day_message_base + 14 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message to the wire, 22 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  wire[at] = end_of_day_message_record.participant_id; at = at + 1;
  encode_timestamp1(end_of_day_message_record.timestamp_1);
  wire[at] = end_of_day_message_record.message_id; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> wire[at] = end_of_day_message_record.transaction_id[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.participant_reference_number[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message off the wire, 22 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  end_of_day_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(end_of_day_message_record.timestamp_1);
  end_of_day_message_record.message_id = wire[at]; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> end_of_day_message_record.transaction_id[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_reference_number[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  assert(end_of_day_message_read.participant_id == end_of_day_message_written.participant_id);
  equal_timestamp1(end_of_day_message_read.timestamp_1, end_of_day_message_written.timestamp_1);
  assert(end_of_day_message_read.message_id == end_of_day_message_written.message_id);
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> assert(end_of_day_message_read.transaction_id[end_of_day_message_at] == end_of_day_message_written.transaction_id[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.participant_reference_number[end_of_day_message_at] == end_of_day_message_written.participant_reference_number[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Wide Circuit Breaker Decline Level Status Message: 47 bytes ------ */

/* Reports the calculated Level 1, Level 2 and Level 3 threshold values for the current trading day necessary to trigger a circuit breaker */
typedef MarketWideCircuitBreakerDeclineLevelStatusMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte mwcb_level_1[8];
  byte mwcb_level_2[8];
  byte mwcb_level_3[8];
  byte reserved
};

int market_wide_circuit_breaker_decline_level_status_message_at;

/* every byte of Market Wide Circuit Breaker Decline Level Status Message set to one value */
inline fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record, market_wide_circuit_breaker_decline_level_status_message_value) {
  market_wide_circuit_breaker_decline_level_status_message_record.participant_id = market_wide_circuit_breaker_decline_level_status_message_value;
  fill_timestamp1(market_wide_circuit_breaker_decline_level_status_message_record.timestamp_1, market_wide_circuit_breaker_decline_level_status_message_value);
  market_wide_circuit_breaker_decline_level_status_message_record.message_id = market_wide_circuit_breaker_decline_level_status_message_value;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_record.reserved = market_wide_circuit_breaker_decline_level_status_message_value;
  skip
}

/* each byte of Market Wide Circuit Breaker Decline Level Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record, market_wide_circuit_breaker_decline_level_status_message_base) {
  market_wide_circuit_breaker_decline_level_status_message_record.participant_id = (market_wide_circuit_breaker_decline_level_status_message_base + 0 + 1) % 256;
  ramp_timestamp1(market_wide_circuit_breaker_decline_level_status_message_record.timestamp_1, market_wide_circuit_breaker_decline_level_status_message_base + 1);
  market_wide_circuit_breaker_decline_level_status_message_record.message_id = (market_wide_circuit_breaker_decline_level_status_message_base + 9 + 1) % 256;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 10 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 14 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 22 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 30 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 38 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_record.reserved = (market_wide_circuit_breaker_decline_level_status_message_base + 46 + 1) % 256;
  skip
}

/* Market Wide Circuit Breaker Decline Level Status Message to the wire, 47 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record) {
  wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.participant_id; at = at + 1;
  encode_timestamp1(market_wide_circuit_breaker_decline_level_status_message_record.timestamp_1);
  wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.message_id; at = at + 1;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.reserved; at = at + 1;
  skip
}

/* Market Wide Circuit Breaker Decline Level Status Message off the wire, 47 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record) {
  market_wide_circuit_breaker_decline_level_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(market_wide_circuit_breaker_decline_level_status_message_record.timestamp_1);
  market_wide_circuit_breaker_decline_level_status_message_record.message_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_record.reserved = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Wide Circuit Breaker Decline Level Status Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_read, market_wide_circuit_breaker_decline_level_status_message_written) {
  assert(market_wide_circuit_breaker_decline_level_status_message_read.participant_id == market_wide_circuit_breaker_decline_level_status_message_written.participant_id);
  equal_timestamp1(market_wide_circuit_breaker_decline_level_status_message_read.timestamp_1, market_wide_circuit_breaker_decline_level_status_message_written.timestamp_1);
  assert(market_wide_circuit_breaker_decline_level_status_message_read.message_id == market_wide_circuit_breaker_decline_level_status_message_written.message_id);
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  assert(market_wide_circuit_breaker_decline_level_status_message_read.reserved == market_wide_circuit_breaker_decline_level_status_message_written.reserved);
  skip
}

/* ---- Market Wide Circuit Breaker Status Message: 24 bytes -------------------- */

/* Reports the Market-Wide Circuit Breaker threshold Level that has been breached */
typedef MarketWideCircuitBreakerStatusMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte market_wide_circuit_breaker_level_indicator;
  byte reserved
};

int market_wide_circuit_breaker_status_message_at;

/* every byte of Market Wide Circuit Breaker Status Message set to one value */
inline fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_value) {
  market_wide_circuit_breaker_status_message_record.participant_id = market_wide_circuit_breaker_status_message_value;
  fill_timestamp1(market_wide_circuit_breaker_status_message_record.timestamp_1, market_wide_circuit_breaker_status_message_value);
  market_wide_circuit_breaker_status_message_record.message_id = market_wide_circuit_breaker_status_message_value;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at] = market_wide_circuit_breaker_status_message_value; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at] = market_wide_circuit_breaker_status_message_value; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator = market_wide_circuit_breaker_status_message_value;
  market_wide_circuit_breaker_status_message_record.reserved = market_wide_circuit_breaker_status_message_value;
  skip
}

/* each byte of Market Wide Circuit Breaker Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_base) {
  market_wide_circuit_breaker_status_message_record.participant_id = (market_wide_circuit_breaker_status_message_base + 0 + 1) % 256;
  ramp_timestamp1(market_wide_circuit_breaker_status_message_record.timestamp_1, market_wide_circuit_breaker_status_message_base + 1);
  market_wide_circuit_breaker_status_message_record.message_id = (market_wide_circuit_breaker_status_message_base + 9 + 1) % 256;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at] = (market_wide_circuit_breaker_status_message_base + 10 + market_wide_circuit_breaker_status_message_at + 1) % 256; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at] = (market_wide_circuit_breaker_status_message_base + 14 + market_wide_circuit_breaker_status_message_at + 1) % 256; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator = (market_wide_circuit_breaker_status_message_base + 22 + 1) % 256;
  market_wide_circuit_breaker_status_message_record.reserved = (market_wide_circuit_breaker_status_message_base + 23 + 1) % 256;
  skip
}

/* Market Wide Circuit Breaker Status Message to the wire, 24 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  wire[at] = market_wide_circuit_breaker_status_message_record.participant_id; at = at + 1;
  encode_timestamp1(market_wide_circuit_breaker_status_message_record.timestamp_1);
  wire[at] = market_wide_circuit_breaker_status_message_record.message_id; at = at + 1;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> wire[at] = market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  wire[at] = market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator; at = at + 1;
  wire[at] = market_wide_circuit_breaker_status_message_record.reserved; at = at + 1;
  skip
}

/* Market Wide Circuit Breaker Status Message off the wire, 24 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  market_wide_circuit_breaker_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(market_wide_circuit_breaker_status_message_record.timestamp_1);
  market_wide_circuit_breaker_status_message_record.message_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator = wire[at]; at = at + 1;
  market_wide_circuit_breaker_status_message_record.reserved = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Wide Circuit Breaker Status Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_read, market_wide_circuit_breaker_status_message_written) {
  assert(market_wide_circuit_breaker_status_message_read.participant_id == market_wide_circuit_breaker_status_message_written.participant_id);
  equal_timestamp1(market_wide_circuit_breaker_status_message_read.timestamp_1, market_wide_circuit_breaker_status_message_written.timestamp_1);
  assert(market_wide_circuit_breaker_status_message_read.message_id == market_wide_circuit_breaker_status_message_written.message_id);
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> assert(market_wide_circuit_breaker_status_message_read.transaction_id[market_wide_circuit_breaker_status_message_at] == market_wide_circuit_breaker_status_message_written.transaction_id[market_wide_circuit_breaker_status_message_at]); market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> assert(market_wide_circuit_breaker_status_message_read.participant_reference_number[market_wide_circuit_breaker_status_message_at] == market_wide_circuit_breaker_status_message_written.participant_reference_number[market_wide_circuit_breaker_status_message_at]); market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  assert(market_wide_circuit_breaker_status_message_read.market_wide_circuit_breaker_level_indicator == market_wide_circuit_breaker_status_message_written.market_wide_circuit_breaker_level_indicator);
  assert(market_wide_circuit_breaker_status_message_read.reserved == market_wide_circuit_breaker_status_message_written.reserved);
  skip
}

/* ---- Auction Status Message: 124 bytes --------------------------------------- */

/* Used when a Participant in a CTA eligible security, Local Issue or Bonds reports requires Auction Information */
typedef AuctionStatusMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  byte auction_collar_reference_price[8];
  byte auction_collar_upper_threshold_price[8];
  byte auction_collar_lower_threshold_price[8];
  byte number_of_extensions;
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte reserved_62[62]
};

int auction_status_message_at;

/* every byte of Auction Status Message set to one value */
inline fill_auction_status_message(auction_status_message_record, auction_status_message_value) {
  auction_status_message_record.participant_id = auction_status_message_value;
  fill_timestamp1(auction_status_message_record.timestamp_1, auction_status_message_value);
  auction_status_message_record.message_id = auction_status_message_value;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> auction_status_message_record.transaction_id[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.participant_reference_number[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = auction_status_message_value;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = auction_status_message_value;
  auction_status_message_record.short_sale_restriction_indicator = auction_status_message_value;
  auction_status_message_record.primary_listing_market_participant_id = auction_status_message_value;
  auction_status_message_record.financial_status_indicator = auction_status_message_value;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> auction_status_message_record.reserved_62[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Status Message set to where it lies, so a field read out of place says so */
inline ramp_auction_status_message(auction_status_message_record, auction_status_message_base) {
  auction_status_message_record.participant_id = (auction_status_message_base + 0 + 1) % 256;
  ramp_timestamp1(auction_status_message_record.timestamp_1, auction_status_message_base + 1);
  auction_status_message_record.message_id = (auction_status_message_base + 9 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> auction_status_message_record.transaction_id[auction_status_message_at] = (auction_status_message_base + 10 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.participant_reference_number[auction_status_message_at] = (auction_status_message_base + 14 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol[auction_status_message_at] = (auction_status_message_base + 22 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = (auction_status_message_base + 33 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = (auction_status_message_base + 34 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = (auction_status_message_base + 42 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = (auction_status_message_base + 50 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = (auction_status_message_base + 58 + 1) % 256;
  auction_status_message_record.short_sale_restriction_indicator = (auction_status_message_base + 59 + 1) % 256;
  auction_status_message_record.primary_listing_market_participant_id = (auction_status_message_base + 60 + 1) % 256;
  auction_status_message_record.financial_status_indicator = (auction_status_message_base + 61 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> auction_status_message_record.reserved_62[auction_status_message_at] = (auction_status_message_base + 62 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Status Message to the wire, 124 bytes from where the cursor stands */
inline encode_auction_status_message(auction_status_message_record) {
  wire[at] = auction_status_message_record.participant_id; at = at + 1;
  encode_timestamp1(auction_status_message_record.timestamp_1);
  wire[at] = auction_status_message_record.message_id; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> wire[at] = auction_status_message_record.transaction_id[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.participant_reference_number[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> wire[at] = auction_status_message_record.security_symbol[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_status_message_record.instrument_type; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.auction_collar_reference_price[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_status_message_record.number_of_extensions; at = at + 1;
  wire[at] = auction_status_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = auction_status_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = auction_status_message_record.financial_status_indicator; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> wire[at] = auction_status_message_record.reserved_62[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Status Message off the wire, 124 bytes from where the cursor stands */
inline decode_auction_status_message(auction_status_message_record) {
  auction_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(auction_status_message_record.timestamp_1);
  auction_status_message_record.message_id = wire[at]; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> auction_status_message_record.transaction_id[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.participant_reference_number[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = wire[at]; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = wire[at]; at = at + 1;
  auction_status_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  auction_status_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  auction_status_message_record.financial_status_indicator = wire[at]; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> auction_status_message_record.reserved_62[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Status Message is what was written, byte for byte */
inline equal_auction_status_message(auction_status_message_read, auction_status_message_written) {
  assert(auction_status_message_read.participant_id == auction_status_message_written.participant_id);
  equal_timestamp1(auction_status_message_read.timestamp_1, auction_status_message_written.timestamp_1);
  assert(auction_status_message_read.message_id == auction_status_message_written.message_id);
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> assert(auction_status_message_read.transaction_id[auction_status_message_at] == auction_status_message_written.transaction_id[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.participant_reference_number[auction_status_message_at] == auction_status_message_written.participant_reference_number[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> assert(auction_status_message_read.security_symbol[auction_status_message_at] == auction_status_message_written.security_symbol[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  assert(auction_status_message_read.instrument_type == auction_status_message_written.instrument_type);
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.auction_collar_reference_price[auction_status_message_at] == auction_status_message_written.auction_collar_reference_price[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.auction_collar_upper_threshold_price[auction_status_message_at] == auction_status_message_written.auction_collar_upper_threshold_price[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.auction_collar_lower_threshold_price[auction_status_message_at] == auction_status_message_written.auction_collar_lower_threshold_price[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  assert(auction_status_message_read.number_of_extensions == auction_status_message_written.number_of_extensions);
  assert(auction_status_message_read.short_sale_restriction_indicator == auction_status_message_written.short_sale_restriction_indicator);
  assert(auction_status_message_read.primary_listing_market_participant_id == auction_status_message_written.primary_listing_market_participant_id);
  assert(auction_status_message_read.financial_status_indicator == auction_status_message_written.financial_status_indicator);
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> assert(auction_status_message_read.reserved_62[auction_status_message_at] == auction_status_message_written.reserved_62[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Timestamp 2: 8 bytes ---------------------------------------------------- */

/* Timestamp 2 */
typedef Timestamp2 {
  byte seconds[4];
  byte nanoseconds[4]
};

int timestamp2_at;

/* every byte of Timestamp 2 set to one value */
inline fill_timestamp2(timestamp2_record, timestamp2_value) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.seconds[timestamp2_at] = timestamp2_value; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.nanoseconds[timestamp2_at] = timestamp2_value; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp 2 set to where it lies, so a field read out of place says so */
inline ramp_timestamp2(timestamp2_record, timestamp2_base) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.seconds[timestamp2_at] = (timestamp2_base + 0 + timestamp2_at + 1) % 256; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.nanoseconds[timestamp2_at] = (timestamp2_base + 4 + timestamp2_at + 1) % 256; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp 2 to the wire, 8 bytes from where the cursor stands */
inline encode_timestamp2(timestamp2_record) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> wire[at] = timestamp2_record.seconds[timestamp2_at]; at = at + 1; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> wire[at] = timestamp2_record.nanoseconds[timestamp2_at]; at = at + 1; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp 2 off the wire, 8 bytes from where the cursor stands */
inline decode_timestamp2(timestamp2_record) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.seconds[timestamp2_at] = wire[at]; at = at + 1; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.nanoseconds[timestamp2_at] = wire[at]; at = at + 1; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp 2 is what was written, byte for byte */
inline equal_timestamp2(timestamp2_read, timestamp2_written) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> assert(timestamp2_read.seconds[timestamp2_at] == timestamp2_written.seconds[timestamp2_at]); timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> assert(timestamp2_read.nanoseconds[timestamp2_at] == timestamp2_written.nanoseconds[timestamp2_at]); timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* SIP Block Timestamp: encoded, read back, and compared */
proctype check_s_i_p_block_timestamp() {
  SIPBlockTimestamp s_i_p_block_timestamp_sent;
  SIPBlockTimestamp s_i_p_block_timestamp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_s_i_p_block_timestamp(s_i_p_block_timestamp_sent, 0)
  :: pattern == 1 -> fill_s_i_p_block_timestamp(s_i_p_block_timestamp_sent, 32)
  :: pattern == 2 -> fill_s_i_p_block_timestamp(s_i_p_block_timestamp_sent, 255)
  :: else -> ramp_s_i_p_block_timestamp(s_i_p_block_timestamp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_s_i_p_block_timestamp(s_i_p_block_timestamp_sent);
    assert(at == 8);
    at = 0;
    decode_s_i_p_block_timestamp(s_i_p_block_timestamp_got);
    assert(at == 8);
    equal_s_i_p_block_timestamp(s_i_p_block_timestamp_got, s_i_p_block_timestamp_sent)
  }
}

/* Block Header: encoded, read back, and compared */
proctype check_block_header() {
  BlockHeader block_header_sent;
  BlockHeader block_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_header(block_header_sent, 0)
  :: pattern == 1 -> fill_block_header(block_header_sent, 32)
  :: pattern == 2 -> fill_block_header(block_header_sent, 255)
  :: else -> ramp_block_header(block_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_header(block_header_sent);
    assert(at == 20);
    at = 0;
    decode_block_header(block_header_got);
    assert(at == 20);
    equal_block_header(block_header_got, block_header_sent)
  }
}

/* Timestamp 1: encoded, read back, and compared */
proctype check_timestamp1() {
  Timestamp1 timestamp1_sent;
  Timestamp1 timestamp1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp1(timestamp1_sent, 0)
  :: pattern == 1 -> fill_timestamp1(timestamp1_sent, 32)
  :: pattern == 2 -> fill_timestamp1(timestamp1_sent, 255)
  :: else -> ramp_timestamp1(timestamp1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp1(timestamp1_sent);
    assert(at == 8);
    at = 0;
    decode_timestamp1(timestamp1_got);
    assert(at == 8);
    equal_timestamp1(timestamp1_got, timestamp1_sent)
  }
}

/* Symbol Reference Data Message: encoded, read back, and compared */
proctype check_symbol_reference_data_message() {
  SymbolReferenceDataMessage symbol_reference_data_message_sent;
  SymbolReferenceDataMessage symbol_reference_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_reference_data_message(symbol_reference_data_message_sent, 0)
  :: pattern == 1 -> fill_symbol_reference_data_message(symbol_reference_data_message_sent, 32)
  :: pattern == 2 -> fill_symbol_reference_data_message(symbol_reference_data_message_sent, 255)
  :: else -> ramp_symbol_reference_data_message(symbol_reference_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_reference_data_message(symbol_reference_data_message_sent);
    assert(at == 205);
    at = 0;
    decode_symbol_reference_data_message(symbol_reference_data_message_got);
    assert(at == 205);
    equal_symbol_reference_data_message(symbol_reference_data_message_got, symbol_reference_data_message_sent)
  }
}

/* Start Of Day Message: encoded, read back, and compared */
proctype check_start_of_day_message() {
  StartOfDayMessage start_of_day_message_sent;
  StartOfDayMessage start_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_day_message(start_of_day_message_sent, 0)
  :: pattern == 1 -> fill_start_of_day_message(start_of_day_message_sent, 32)
  :: pattern == 2 -> fill_start_of_day_message(start_of_day_message_sent, 255)
  :: else -> ramp_start_of_day_message(start_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_day_message(start_of_day_message_sent);
    assert(at == 22);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 22);
    equal_start_of_day_message(start_of_day_message_got, start_of_day_message_sent)
  }
}

/* Finra Close Message: encoded, read back, and compared */
proctype check_finra_close_message() {
  FinraCloseMessage finra_close_message_sent;
  FinraCloseMessage finra_close_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_finra_close_message(finra_close_message_sent, 0)
  :: pattern == 1 -> fill_finra_close_message(finra_close_message_sent, 32)
  :: pattern == 2 -> fill_finra_close_message(finra_close_message_sent, 255)
  :: else -> ramp_finra_close_message(finra_close_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_finra_close_message(finra_close_message_sent);
    assert(at == 22);
    at = 0;
    decode_finra_close_message(finra_close_message_got);
    assert(at == 22);
    equal_finra_close_message(finra_close_message_got, finra_close_message_sent)
  }
}

/* Reset Block Sequence Number Message: encoded, read back, and compared */
proctype check_reset_block_sequence_number_message() {
  ResetBlockSequenceNumberMessage reset_block_sequence_number_message_sent;
  ResetBlockSequenceNumberMessage reset_block_sequence_number_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 0)
  :: pattern == 1 -> fill_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 32)
  :: pattern == 2 -> fill_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 255)
  :: else -> ramp_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_block_sequence_number_message(reset_block_sequence_number_message_sent);
    assert(at == 22);
    at = 0;
    decode_reset_block_sequence_number_message(reset_block_sequence_number_message_got);
    assert(at == 22);
    equal_reset_block_sequence_number_message(reset_block_sequence_number_message_got, reset_block_sequence_number_message_sent)
  }
}

/* Finra Open Message: encoded, read back, and compared */
proctype check_finra_open_message() {
  FinraOpenMessage finra_open_message_sent;
  FinraOpenMessage finra_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_finra_open_message(finra_open_message_sent, 0)
  :: pattern == 1 -> fill_finra_open_message(finra_open_message_sent, 32)
  :: pattern == 2 -> fill_finra_open_message(finra_open_message_sent, 255)
  :: else -> ramp_finra_open_message(finra_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_finra_open_message(finra_open_message_sent);
    assert(at == 22);
    at = 0;
    decode_finra_open_message(finra_open_message_got);
    assert(at == 22);
    equal_finra_open_message(finra_open_message_got, finra_open_message_sent)
  }
}

/* Disaster Recovery Data Center Activation Message: encoded, read back, and compared */
proctype check_disaster_recovery_data_center_activation_message() {
  DisasterRecoveryDataCenterActivationMessage disaster_recovery_data_center_activation_message_sent;
  DisasterRecoveryDataCenterActivationMessage disaster_recovery_data_center_activation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 0)
  :: pattern == 1 -> fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 32)
  :: pattern == 2 -> fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 255)
  :: else -> ramp_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent);
    assert(at == 22);
    at = 0;
    decode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_got);
    assert(at == 22);
    equal_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_got, disaster_recovery_data_center_activation_message_sent)
  }
}

/* Line Integrity Message: encoded, read back, and compared */
proctype check_line_integrity_message() {
  LineIntegrityMessage line_integrity_message_sent;
  LineIntegrityMessage line_integrity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_line_integrity_message(line_integrity_message_sent, 0)
  :: pattern == 1 -> fill_line_integrity_message(line_integrity_message_sent, 32)
  :: pattern == 2 -> fill_line_integrity_message(line_integrity_message_sent, 255)
  :: else -> ramp_line_integrity_message(line_integrity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_line_integrity_message(line_integrity_message_sent);
    assert(at == 22);
    at = 0;
    decode_line_integrity_message(line_integrity_message_got);
    assert(at == 22);
    equal_line_integrity_message(line_integrity_message_got, line_integrity_message_sent)
  }
}

/* End Of Day Message: encoded, read back, and compared */
proctype check_end_of_day_message() {
  EndOfDayMessage end_of_day_message_sent;
  EndOfDayMessage end_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_day_message(end_of_day_message_sent, 0)
  :: pattern == 1 -> fill_end_of_day_message(end_of_day_message_sent, 32)
  :: pattern == 2 -> fill_end_of_day_message(end_of_day_message_sent, 255)
  :: else -> ramp_end_of_day_message(end_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_day_message(end_of_day_message_sent);
    assert(at == 22);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 22);
    equal_end_of_day_message(end_of_day_message_got, end_of_day_message_sent)
  }
}

/* Market Wide Circuit Breaker Decline Level Status Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_decline_level_status_message() {
  MarketWideCircuitBreakerDeclineLevelStatusMessage market_wide_circuit_breaker_decline_level_status_message_sent;
  MarketWideCircuitBreakerDeclineLevelStatusMessage market_wide_circuit_breaker_decline_level_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent);
    assert(at == 47);
    at = 0;
    decode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_got);
    assert(at == 47);
    equal_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_got, market_wide_circuit_breaker_decline_level_status_message_sent)
  }
}

/* Market Wide Circuit Breaker Status Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_status_message() {
  MarketWideCircuitBreakerStatusMessage market_wide_circuit_breaker_status_message_sent;
  MarketWideCircuitBreakerStatusMessage market_wide_circuit_breaker_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent);
    assert(at == 24);
    at = 0;
    decode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_got);
    assert(at == 24);
    equal_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_got, market_wide_circuit_breaker_status_message_sent)
  }
}

/* Auction Status Message: encoded, read back, and compared */
proctype check_auction_status_message() {
  AuctionStatusMessage auction_status_message_sent;
  AuctionStatusMessage auction_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_status_message(auction_status_message_sent, 0)
  :: pattern == 1 -> fill_auction_status_message(auction_status_message_sent, 32)
  :: pattern == 2 -> fill_auction_status_message(auction_status_message_sent, 255)
  :: else -> ramp_auction_status_message(auction_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_status_message(auction_status_message_sent);
    assert(at == 124);
    at = 0;
    decode_auction_status_message(auction_status_message_got);
    assert(at == 124);
    equal_auction_status_message(auction_status_message_got, auction_status_message_sent)
  }
}

/* Timestamp 2: encoded, read back, and compared */
proctype check_timestamp2() {
  Timestamp2 timestamp2_sent;
  Timestamp2 timestamp2_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp2(timestamp2_sent, 0)
  :: pattern == 1 -> fill_timestamp2(timestamp2_sent, 32)
  :: pattern == 2 -> fill_timestamp2(timestamp2_sent, 255)
  :: else -> ramp_timestamp2(timestamp2_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp2(timestamp2_sent);
    assert(at == 8);
    at = 0;
    decode_timestamp2(timestamp2_got);
    assert(at == 8);
    equal_timestamp2(timestamp2_got, timestamp2_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_s_i_p_block_timestamp()
  :: run check_block_header()
  :: run check_timestamp1()
  :: run check_symbol_reference_data_message()
  :: run check_start_of_day_message()
  :: run check_finra_close_message()
  :: run check_reset_block_sequence_number_message()
  :: run check_finra_open_message()
  :: run check_disaster_recovery_data_center_activation_message()
  :: run check_line_integrity_message()
  :: run check_end_of_day_message()
  :: run check_market_wide_circuit_breaker_decline_level_status_message()
  :: run check_market_wide_circuit_breaker_status_message()
  :: run check_auction_status_message()
  :: run check_timestamp2()
  fi
}
