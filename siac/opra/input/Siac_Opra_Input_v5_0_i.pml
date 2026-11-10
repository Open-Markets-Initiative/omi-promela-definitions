/*
 * The Securities Industry Automation Corporation Input
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
 *   - a Reassemble rule
 *   - a run counted by a field
 *   - the dispatch that chooses a message by its type
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 65

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Block Timestamp: 8 bytes ------------------------------------------------ */

/* Opra block timestamp */
typedef BlockTimestamp {
  byte seconds[4];
  byte nanoseconds[4]
};

int block_timestamp_at;

/* every byte of Block Timestamp set to one value */
inline fill_block_timestamp(block_timestamp_record, block_timestamp_value) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.seconds[block_timestamp_at] = block_timestamp_value; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.nanoseconds[block_timestamp_at] = block_timestamp_value; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Timestamp set to where it lies, so a field read out of place says so */
inline ramp_block_timestamp(block_timestamp_record, block_timestamp_base) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.seconds[block_timestamp_at] = (block_timestamp_base + 0 + block_timestamp_at + 1) % 256; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.nanoseconds[block_timestamp_at] = (block_timestamp_base + 4 + block_timestamp_at + 1) % 256; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Block Timestamp to the wire, 8 bytes from where the cursor stands */
inline encode_block_timestamp(block_timestamp_record) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> wire[at] = block_timestamp_record.seconds[block_timestamp_at]; at = at + 1; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> wire[at] = block_timestamp_record.nanoseconds[block_timestamp_at]; at = at + 1; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Block Timestamp off the wire, 8 bytes from where the cursor stands */
inline decode_block_timestamp(block_timestamp_record) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.seconds[block_timestamp_at] = wire[at]; at = at + 1; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.nanoseconds[block_timestamp_at] = wire[at]; at = at + 1; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Timestamp is what was written, byte for byte */
inline equal_block_timestamp(block_timestamp_read, block_timestamp_written) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> assert(block_timestamp_read.seconds[block_timestamp_at] == block_timestamp_written.seconds[block_timestamp_at]); block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> assert(block_timestamp_read.nanoseconds[block_timestamp_at] == block_timestamp_written.nanoseconds[block_timestamp_at]); block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Block Header: 21 bytes -------------------------------------------------- */

/* Opra Tcp block header */
typedef BlockHeader {
  byte version;
  byte block_size[2];
  byte reserved;
  byte second_reserved;
  byte third_reserved;
  byte block_sequence_number[4];
  byte messages_in_block;
  BlockTimestamp block_timestamp;
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
  block_header_record.reserved = block_header_value;
  block_header_record.second_reserved = block_header_value;
  block_header_record.third_reserved = block_header_value;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = block_header_value;
  fill_block_timestamp(block_header_record.block_timestamp, block_header_value);
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
  block_header_record.reserved = (block_header_base + 3 + 1) % 256;
  block_header_record.second_reserved = (block_header_base + 4 + 1) % 256;
  block_header_record.third_reserved = (block_header_base + 5 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = (block_header_base + 6 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = (block_header_base + 10 + 1) % 256;
  ramp_block_timestamp(block_header_record.block_timestamp, block_header_base + 11);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = (block_header_base + 19 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header to the wire, 21 bytes from where the cursor stands */
inline encode_block_header(block_header_record) {
  wire[at] = block_header_record.version; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_size[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.reserved; at = at + 1;
  wire[at] = block_header_record.second_reserved; at = at + 1;
  wire[at] = block_header_record.third_reserved; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> wire[at] = block_header_record.block_sequence_number[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.messages_in_block; at = at + 1;
  encode_block_timestamp(block_header_record.block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_checksum[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header off the wire, 21 bytes from where the cursor stands */
inline decode_block_header(block_header_record) {
  block_header_record.version = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.reserved = wire[at]; at = at + 1;
  block_header_record.second_reserved = wire[at]; at = at + 1;
  block_header_record.third_reserved = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = wire[at]; at = at + 1;
  decode_block_timestamp(block_header_record.block_timestamp);
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
  assert(block_header_read.reserved == block_header_written.reserved);
  assert(block_header_read.second_reserved == block_header_written.second_reserved);
  assert(block_header_read.third_reserved == block_header_written.third_reserved);
  block_header_at = 0;
  do
  :: block_header_at < 4 -> assert(block_header_read.block_sequence_number[block_header_at] == block_header_written.block_sequence_number[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.messages_in_block == block_header_written.messages_in_block);
  equal_block_timestamp(block_header_read.block_timestamp, block_header_written.block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_checksum[block_header_at] == block_header_written.block_checksum[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

/* Opra Message Header first level dispatch */
typedef MessageHeader {
  byte participant_id;
  byte message_category
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.participant_id = message_header_value;
  message_header_record.message_category = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.participant_id = (message_header_base + 0 + 1) % 256;
  message_header_record.message_category = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.participant_id; at = at + 1;
  wire[at] = message_header_record.message_category; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.participant_id = wire[at]; at = at + 1;
  message_header_record.message_category = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.participant_id == message_header_written.participant_id);
  assert(message_header_read.message_category == message_header_written.message_category);
  skip
}

/* ---- Expiration Block: 3 bytes ----------------------------------------------- */

/* Expiration Block */
typedef ExpirationBlock {
  byte expiration_month;
  byte expiration_day;
  byte expiration_year
};

/* every byte of Expiration Block set to one value */
inline fill_expiration_block(expiration_block_record, expiration_block_value) {
  expiration_block_record.expiration_month = expiration_block_value;
  expiration_block_record.expiration_day = expiration_block_value;
  expiration_block_record.expiration_year = expiration_block_value;
  skip
}

/* each byte of Expiration Block set to where it lies, so a field read out of place says so */
inline ramp_expiration_block(expiration_block_record, expiration_block_base) {
  expiration_block_record.expiration_month = (expiration_block_base + 0 + 1) % 256;
  expiration_block_record.expiration_day = (expiration_block_base + 1 + 1) % 256;
  expiration_block_record.expiration_year = (expiration_block_base + 2 + 1) % 256;
  skip
}

/* Expiration Block to the wire, 3 bytes from where the cursor stands */
inline encode_expiration_block(expiration_block_record) {
  wire[at] = expiration_block_record.expiration_month; at = at + 1;
  wire[at] = expiration_block_record.expiration_day; at = at + 1;
  wire[at] = expiration_block_record.expiration_year; at = at + 1;
  skip
}

/* Expiration Block off the wire, 3 bytes from where the cursor stands */
inline decode_expiration_block(expiration_block_record) {
  expiration_block_record.expiration_month = wire[at]; at = at + 1;
  expiration_block_record.expiration_day = wire[at]; at = at + 1;
  expiration_block_record.expiration_year = wire[at]; at = at + 1;
  skip
}

/* what was read of Expiration Block is what was written, byte for byte */
inline equal_expiration_block(expiration_block_read, expiration_block_written) {
  assert(expiration_block_read.expiration_month == expiration_block_written.expiration_month);
  assert(expiration_block_read.expiration_day == expiration_block_written.expiration_day);
  assert(expiration_block_read.expiration_year == expiration_block_written.expiration_year);
  skip
}

/* ---- Equity And Index Last Sale Message: 36 bytes ---------------------------- */

/* Equity and Index Last Sale message used to report equity and index options last sale information */
typedef EquityAndIndexLastSaleMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte security_symbol[5];
  byte reserved_1;
  ExpirationBlock expiration_block;
  byte strike_price_denominator_code;
  byte strike_price[4];
  byte volume[4];
  byte premium_price_denominator_code;
  byte premium_price[4];
  byte trade_identifier[4];
  byte reserved_4[4]
};

int equity_and_index_last_sale_message_at;

/* every byte of Equity And Index Last Sale Message set to one value */
inline fill_equity_and_index_last_sale_message(equity_and_index_last_sale_message_record, equity_and_index_last_sale_message_value) {
  equity_and_index_last_sale_message_record.session_indicator = equity_and_index_last_sale_message_value;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.participant_reference_number[equity_and_index_last_sale_message_at] = equity_and_index_last_sale_message_value; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 5 -> equity_and_index_last_sale_message_record.security_symbol[equity_and_index_last_sale_message_at] = equity_and_index_last_sale_message_value; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_record.reserved_1 = equity_and_index_last_sale_message_value;
  fill_expiration_block(equity_and_index_last_sale_message_record.expiration_block, equity_and_index_last_sale_message_value);
  equity_and_index_last_sale_message_record.strike_price_denominator_code = equity_and_index_last_sale_message_value;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.strike_price[equity_and_index_last_sale_message_at] = equity_and_index_last_sale_message_value; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.volume[equity_and_index_last_sale_message_at] = equity_and_index_last_sale_message_value; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_record.premium_price_denominator_code = equity_and_index_last_sale_message_value;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.premium_price[equity_and_index_last_sale_message_at] = equity_and_index_last_sale_message_value; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.trade_identifier[equity_and_index_last_sale_message_at] = equity_and_index_last_sale_message_value; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.reserved_4[equity_and_index_last_sale_message_at] = equity_and_index_last_sale_message_value; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Equity And Index Last Sale Message set to where it lies, so a field read out of place says so */
inline ramp_equity_and_index_last_sale_message(equity_and_index_last_sale_message_record, equity_and_index_last_sale_message_base) {
  equity_and_index_last_sale_message_record.session_indicator = (equity_and_index_last_sale_message_base + 0 + 1) % 256;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.participant_reference_number[equity_and_index_last_sale_message_at] = (equity_and_index_last_sale_message_base + 1 + equity_and_index_last_sale_message_at + 1) % 256; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 5 -> equity_and_index_last_sale_message_record.security_symbol[equity_and_index_last_sale_message_at] = (equity_and_index_last_sale_message_base + 5 + equity_and_index_last_sale_message_at + 1) % 256; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_record.reserved_1 = (equity_and_index_last_sale_message_base + 10 + 1) % 256;
  ramp_expiration_block(equity_and_index_last_sale_message_record.expiration_block, equity_and_index_last_sale_message_base + 11);
  equity_and_index_last_sale_message_record.strike_price_denominator_code = (equity_and_index_last_sale_message_base + 14 + 1) % 256;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.strike_price[equity_and_index_last_sale_message_at] = (equity_and_index_last_sale_message_base + 15 + equity_and_index_last_sale_message_at + 1) % 256; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.volume[equity_and_index_last_sale_message_at] = (equity_and_index_last_sale_message_base + 19 + equity_and_index_last_sale_message_at + 1) % 256; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_record.premium_price_denominator_code = (equity_and_index_last_sale_message_base + 23 + 1) % 256;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.premium_price[equity_and_index_last_sale_message_at] = (equity_and_index_last_sale_message_base + 24 + equity_and_index_last_sale_message_at + 1) % 256; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.trade_identifier[equity_and_index_last_sale_message_at] = (equity_and_index_last_sale_message_base + 28 + equity_and_index_last_sale_message_at + 1) % 256; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.reserved_4[equity_and_index_last_sale_message_at] = (equity_and_index_last_sale_message_base + 32 + equity_and_index_last_sale_message_at + 1) % 256; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equity And Index Last Sale Message to the wire, 36 bytes from where the cursor stands */
inline encode_equity_and_index_last_sale_message(equity_and_index_last_sale_message_record) {
  wire[at] = equity_and_index_last_sale_message_record.session_indicator; at = at + 1;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> wire[at] = equity_and_index_last_sale_message_record.participant_reference_number[equity_and_index_last_sale_message_at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 5 -> wire[at] = equity_and_index_last_sale_message_record.security_symbol[equity_and_index_last_sale_message_at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_and_index_last_sale_message_record.reserved_1; at = at + 1;
  encode_expiration_block(equity_and_index_last_sale_message_record.expiration_block);
  wire[at] = equity_and_index_last_sale_message_record.strike_price_denominator_code; at = at + 1;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> wire[at] = equity_and_index_last_sale_message_record.strike_price[equity_and_index_last_sale_message_at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> wire[at] = equity_and_index_last_sale_message_record.volume[equity_and_index_last_sale_message_at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_and_index_last_sale_message_record.premium_price_denominator_code; at = at + 1;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> wire[at] = equity_and_index_last_sale_message_record.premium_price[equity_and_index_last_sale_message_at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> wire[at] = equity_and_index_last_sale_message_record.trade_identifier[equity_and_index_last_sale_message_at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> wire[at] = equity_and_index_last_sale_message_record.reserved_4[equity_and_index_last_sale_message_at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equity And Index Last Sale Message off the wire, 36 bytes from where the cursor stands */
inline decode_equity_and_index_last_sale_message(equity_and_index_last_sale_message_record) {
  equity_and_index_last_sale_message_record.session_indicator = wire[at]; at = at + 1;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.participant_reference_number[equity_and_index_last_sale_message_at] = wire[at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 5 -> equity_and_index_last_sale_message_record.security_symbol[equity_and_index_last_sale_message_at] = wire[at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_record.reserved_1 = wire[at]; at = at + 1;
  decode_expiration_block(equity_and_index_last_sale_message_record.expiration_block);
  equity_and_index_last_sale_message_record.strike_price_denominator_code = wire[at]; at = at + 1;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.strike_price[equity_and_index_last_sale_message_at] = wire[at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.volume[equity_and_index_last_sale_message_at] = wire[at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_record.premium_price_denominator_code = wire[at]; at = at + 1;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.premium_price[equity_and_index_last_sale_message_at] = wire[at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.trade_identifier[equity_and_index_last_sale_message_at] = wire[at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> equity_and_index_last_sale_message_record.reserved_4[equity_and_index_last_sale_message_at] = wire[at]; at = at + 1; equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Equity And Index Last Sale Message is what was written, byte for byte */
inline equal_equity_and_index_last_sale_message(equity_and_index_last_sale_message_read, equity_and_index_last_sale_message_written) {
  assert(equity_and_index_last_sale_message_read.session_indicator == equity_and_index_last_sale_message_written.session_indicator);
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> assert(equity_and_index_last_sale_message_read.participant_reference_number[equity_and_index_last_sale_message_at] == equity_and_index_last_sale_message_written.participant_reference_number[equity_and_index_last_sale_message_at]); equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 5 -> assert(equity_and_index_last_sale_message_read.security_symbol[equity_and_index_last_sale_message_at] == equity_and_index_last_sale_message_written.security_symbol[equity_and_index_last_sale_message_at]); equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  assert(equity_and_index_last_sale_message_read.reserved_1 == equity_and_index_last_sale_message_written.reserved_1);
  equal_expiration_block(equity_and_index_last_sale_message_read.expiration_block, equity_and_index_last_sale_message_written.expiration_block);
  assert(equity_and_index_last_sale_message_read.strike_price_denominator_code == equity_and_index_last_sale_message_written.strike_price_denominator_code);
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> assert(equity_and_index_last_sale_message_read.strike_price[equity_and_index_last_sale_message_at] == equity_and_index_last_sale_message_written.strike_price[equity_and_index_last_sale_message_at]); equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> assert(equity_and_index_last_sale_message_read.volume[equity_and_index_last_sale_message_at] == equity_and_index_last_sale_message_written.volume[equity_and_index_last_sale_message_at]); equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  assert(equity_and_index_last_sale_message_read.premium_price_denominator_code == equity_and_index_last_sale_message_written.premium_price_denominator_code);
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> assert(equity_and_index_last_sale_message_read.premium_price[equity_and_index_last_sale_message_at] == equity_and_index_last_sale_message_written.premium_price[equity_and_index_last_sale_message_at]); equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> assert(equity_and_index_last_sale_message_read.trade_identifier[equity_and_index_last_sale_message_at] == equity_and_index_last_sale_message_written.trade_identifier[equity_and_index_last_sale_message_at]); equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  equity_and_index_last_sale_message_at = 0;
  do
  :: equity_and_index_last_sale_message_at < 4 -> assert(equity_and_index_last_sale_message_read.reserved_4[equity_and_index_last_sale_message_at] == equity_and_index_last_sale_message_written.reserved_4[equity_and_index_last_sale_message_at]); equity_and_index_last_sale_message_at = equity_and_index_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Equity And Index End Of Day Summary Message: 65 bytes ------------------- */

/* Equity and Index End of Day Summary message providing per symbol open high low last net change and underlying information */
typedef EquityAndIndexEndOfDaySummaryMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte security_symbol[5];
  byte reserved_1;
  ExpirationBlock expiration_block;
  byte strike_price_denominator_code;
  byte strike_price[4];
  byte volume[4];
  byte open_interest_volume[4];
  byte premium_price_denominator_code;
  byte open_price[4];
  byte high_price[4];
  byte low_price[4];
  byte last_price[4];
  byte net_change[4];
  byte underlying_price_denominator_code;
  byte underlying_price[8];
  byte bid_price[4];
  byte offer_price[4]
};

int equity_and_index_end_of_day_summary_message_at;

/* every byte of Equity And Index End Of Day Summary Message set to one value */
inline fill_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_record, equity_and_index_end_of_day_summary_message_value) {
  equity_and_index_end_of_day_summary_message_record.session_indicator = equity_and_index_end_of_day_summary_message_value;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.participant_reference_number[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 5 -> equity_and_index_end_of_day_summary_message_record.security_symbol[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_record.reserved_1 = equity_and_index_end_of_day_summary_message_value;
  fill_expiration_block(equity_and_index_end_of_day_summary_message_record.expiration_block, equity_and_index_end_of_day_summary_message_value);
  equity_and_index_end_of_day_summary_message_record.strike_price_denominator_code = equity_and_index_end_of_day_summary_message_value;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.strike_price[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.volume[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.open_interest_volume[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_record.premium_price_denominator_code = equity_and_index_end_of_day_summary_message_value;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.open_price[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.high_price[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.low_price[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.last_price[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.net_change[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_record.underlying_price_denominator_code = equity_and_index_end_of_day_summary_message_value;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 8 -> equity_and_index_end_of_day_summary_message_record.underlying_price[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.bid_price[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.offer_price[equity_and_index_end_of_day_summary_message_at] = equity_and_index_end_of_day_summary_message_value; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Equity And Index End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_record, equity_and_index_end_of_day_summary_message_base) {
  equity_and_index_end_of_day_summary_message_record.session_indicator = (equity_and_index_end_of_day_summary_message_base + 0 + 1) % 256;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.participant_reference_number[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 1 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 5 -> equity_and_index_end_of_day_summary_message_record.security_symbol[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 5 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_record.reserved_1 = (equity_and_index_end_of_day_summary_message_base + 10 + 1) % 256;
  ramp_expiration_block(equity_and_index_end_of_day_summary_message_record.expiration_block, equity_and_index_end_of_day_summary_message_base + 11);
  equity_and_index_end_of_day_summary_message_record.strike_price_denominator_code = (equity_and_index_end_of_day_summary_message_base + 14 + 1) % 256;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.strike_price[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 15 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.volume[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 19 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.open_interest_volume[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 23 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_record.premium_price_denominator_code = (equity_and_index_end_of_day_summary_message_base + 27 + 1) % 256;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.open_price[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 28 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.high_price[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 32 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.low_price[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 36 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.last_price[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 40 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.net_change[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 44 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_record.underlying_price_denominator_code = (equity_and_index_end_of_day_summary_message_base + 48 + 1) % 256;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 8 -> equity_and_index_end_of_day_summary_message_record.underlying_price[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 49 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.bid_price[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 57 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.offer_price[equity_and_index_end_of_day_summary_message_at] = (equity_and_index_end_of_day_summary_message_base + 61 + equity_and_index_end_of_day_summary_message_at + 1) % 256; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equity And Index End Of Day Summary Message to the wire, 65 bytes from where the cursor stands */
inline encode_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_record) {
  wire[at] = equity_and_index_end_of_day_summary_message_record.session_indicator; at = at + 1;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.participant_reference_number[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 5 -> wire[at] = equity_and_index_end_of_day_summary_message_record.security_symbol[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_and_index_end_of_day_summary_message_record.reserved_1; at = at + 1;
  encode_expiration_block(equity_and_index_end_of_day_summary_message_record.expiration_block);
  wire[at] = equity_and_index_end_of_day_summary_message_record.strike_price_denominator_code; at = at + 1;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.strike_price[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.volume[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.open_interest_volume[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_and_index_end_of_day_summary_message_record.premium_price_denominator_code; at = at + 1;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.open_price[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.high_price[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.low_price[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.last_price[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.net_change[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = equity_and_index_end_of_day_summary_message_record.underlying_price_denominator_code; at = at + 1;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 8 -> wire[at] = equity_and_index_end_of_day_summary_message_record.underlying_price[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.bid_price[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> wire[at] = equity_and_index_end_of_day_summary_message_record.offer_price[equity_and_index_end_of_day_summary_message_at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equity And Index End Of Day Summary Message off the wire, 65 bytes from where the cursor stands */
inline decode_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_record) {
  equity_and_index_end_of_day_summary_message_record.session_indicator = wire[at]; at = at + 1;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.participant_reference_number[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 5 -> equity_and_index_end_of_day_summary_message_record.security_symbol[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_record.reserved_1 = wire[at]; at = at + 1;
  decode_expiration_block(equity_and_index_end_of_day_summary_message_record.expiration_block);
  equity_and_index_end_of_day_summary_message_record.strike_price_denominator_code = wire[at]; at = at + 1;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.strike_price[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.volume[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.open_interest_volume[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_record.premium_price_denominator_code = wire[at]; at = at + 1;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.open_price[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.high_price[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.low_price[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.last_price[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.net_change[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_record.underlying_price_denominator_code = wire[at]; at = at + 1;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 8 -> equity_and_index_end_of_day_summary_message_record.underlying_price[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.bid_price[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> equity_and_index_end_of_day_summary_message_record.offer_price[equity_and_index_end_of_day_summary_message_at] = wire[at]; at = at + 1; equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Equity And Index End Of Day Summary Message is what was written, byte for byte */
inline equal_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_read, equity_and_index_end_of_day_summary_message_written) {
  assert(equity_and_index_end_of_day_summary_message_read.session_indicator == equity_and_index_end_of_day_summary_message_written.session_indicator);
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.participant_reference_number[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.participant_reference_number[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 5 -> assert(equity_and_index_end_of_day_summary_message_read.security_symbol[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.security_symbol[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(equity_and_index_end_of_day_summary_message_read.reserved_1 == equity_and_index_end_of_day_summary_message_written.reserved_1);
  equal_expiration_block(equity_and_index_end_of_day_summary_message_read.expiration_block, equity_and_index_end_of_day_summary_message_written.expiration_block);
  assert(equity_and_index_end_of_day_summary_message_read.strike_price_denominator_code == equity_and_index_end_of_day_summary_message_written.strike_price_denominator_code);
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.strike_price[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.strike_price[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.volume[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.volume[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.open_interest_volume[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.open_interest_volume[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(equity_and_index_end_of_day_summary_message_read.premium_price_denominator_code == equity_and_index_end_of_day_summary_message_written.premium_price_denominator_code);
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.open_price[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.open_price[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.high_price[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.high_price[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.low_price[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.low_price[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.last_price[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.last_price[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.net_change[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.net_change[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(equity_and_index_end_of_day_summary_message_read.underlying_price_denominator_code == equity_and_index_end_of_day_summary_message_written.underlying_price_denominator_code);
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 8 -> assert(equity_and_index_end_of_day_summary_message_read.underlying_price[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.underlying_price[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.bid_price[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.bid_price[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  equity_and_index_end_of_day_summary_message_at = 0;
  do
  :: equity_and_index_end_of_day_summary_message_at < 4 -> assert(equity_and_index_end_of_day_summary_message_read.offer_price[equity_and_index_end_of_day_summary_message_at] == equity_and_index_end_of_day_summary_message_written.offer_price[equity_and_index_end_of_day_summary_message_at]); equity_and_index_end_of_day_summary_message_at = equity_and_index_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Equity And Index Quote Message: 36 bytes --------------------------- */

/* Long Equity and Index Quote message containing a full quote using four byte integers for prices and sizes */
typedef LongEquityAndIndexQuoteMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte security_symbol[5];
  byte reserved_1;
  ExpirationBlock expiration_block;
  byte strike_price_denominator_code;
  byte strike_price[4];
  byte premium_price_denominator_code;
  byte bid_price[4];
  byte bid_size[4];
  byte offer_price[4];
  byte offer_size[4]
};

int long_equity_and_index_quote_message_at;

/* every byte of Long Equity And Index Quote Message set to one value */
inline fill_long_equity_and_index_quote_message(long_equity_and_index_quote_message_record, long_equity_and_index_quote_message_value) {
  long_equity_and_index_quote_message_record.session_indicator = long_equity_and_index_quote_message_value;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.participant_reference_number[long_equity_and_index_quote_message_at] = long_equity_and_index_quote_message_value; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 5 -> long_equity_and_index_quote_message_record.security_symbol[long_equity_and_index_quote_message_at] = long_equity_and_index_quote_message_value; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_record.reserved_1 = long_equity_and_index_quote_message_value;
  fill_expiration_block(long_equity_and_index_quote_message_record.expiration_block, long_equity_and_index_quote_message_value);
  long_equity_and_index_quote_message_record.strike_price_denominator_code = long_equity_and_index_quote_message_value;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.strike_price[long_equity_and_index_quote_message_at] = long_equity_and_index_quote_message_value; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_record.premium_price_denominator_code = long_equity_and_index_quote_message_value;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.bid_price[long_equity_and_index_quote_message_at] = long_equity_and_index_quote_message_value; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.bid_size[long_equity_and_index_quote_message_at] = long_equity_and_index_quote_message_value; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.offer_price[long_equity_and_index_quote_message_at] = long_equity_and_index_quote_message_value; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.offer_size[long_equity_and_index_quote_message_at] = long_equity_and_index_quote_message_value; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Equity And Index Quote Message set to where it lies, so a field read out of place says so */
inline ramp_long_equity_and_index_quote_message(long_equity_and_index_quote_message_record, long_equity_and_index_quote_message_base) {
  long_equity_and_index_quote_message_record.session_indicator = (long_equity_and_index_quote_message_base + 0 + 1) % 256;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.participant_reference_number[long_equity_and_index_quote_message_at] = (long_equity_and_index_quote_message_base + 1 + long_equity_and_index_quote_message_at + 1) % 256; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 5 -> long_equity_and_index_quote_message_record.security_symbol[long_equity_and_index_quote_message_at] = (long_equity_and_index_quote_message_base + 5 + long_equity_and_index_quote_message_at + 1) % 256; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_record.reserved_1 = (long_equity_and_index_quote_message_base + 10 + 1) % 256;
  ramp_expiration_block(long_equity_and_index_quote_message_record.expiration_block, long_equity_and_index_quote_message_base + 11);
  long_equity_and_index_quote_message_record.strike_price_denominator_code = (long_equity_and_index_quote_message_base + 14 + 1) % 256;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.strike_price[long_equity_and_index_quote_message_at] = (long_equity_and_index_quote_message_base + 15 + long_equity_and_index_quote_message_at + 1) % 256; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_record.premium_price_denominator_code = (long_equity_and_index_quote_message_base + 19 + 1) % 256;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.bid_price[long_equity_and_index_quote_message_at] = (long_equity_and_index_quote_message_base + 20 + long_equity_and_index_quote_message_at + 1) % 256; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.bid_size[long_equity_and_index_quote_message_at] = (long_equity_and_index_quote_message_base + 24 + long_equity_and_index_quote_message_at + 1) % 256; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.offer_price[long_equity_and_index_quote_message_at] = (long_equity_and_index_quote_message_base + 28 + long_equity_and_index_quote_message_at + 1) % 256; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.offer_size[long_equity_and_index_quote_message_at] = (long_equity_and_index_quote_message_base + 32 + long_equity_and_index_quote_message_at + 1) % 256; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Equity And Index Quote Message to the wire, 36 bytes from where the cursor stands */
inline encode_long_equity_and_index_quote_message(long_equity_and_index_quote_message_record) {
  wire[at] = long_equity_and_index_quote_message_record.session_indicator; at = at + 1;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> wire[at] = long_equity_and_index_quote_message_record.participant_reference_number[long_equity_and_index_quote_message_at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 5 -> wire[at] = long_equity_and_index_quote_message_record.security_symbol[long_equity_and_index_quote_message_at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = long_equity_and_index_quote_message_record.reserved_1; at = at + 1;
  encode_expiration_block(long_equity_and_index_quote_message_record.expiration_block);
  wire[at] = long_equity_and_index_quote_message_record.strike_price_denominator_code; at = at + 1;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> wire[at] = long_equity_and_index_quote_message_record.strike_price[long_equity_and_index_quote_message_at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = long_equity_and_index_quote_message_record.premium_price_denominator_code; at = at + 1;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> wire[at] = long_equity_and_index_quote_message_record.bid_price[long_equity_and_index_quote_message_at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> wire[at] = long_equity_and_index_quote_message_record.bid_size[long_equity_and_index_quote_message_at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> wire[at] = long_equity_and_index_quote_message_record.offer_price[long_equity_and_index_quote_message_at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> wire[at] = long_equity_and_index_quote_message_record.offer_size[long_equity_and_index_quote_message_at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Equity And Index Quote Message off the wire, 36 bytes from where the cursor stands */
inline decode_long_equity_and_index_quote_message(long_equity_and_index_quote_message_record) {
  long_equity_and_index_quote_message_record.session_indicator = wire[at]; at = at + 1;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.participant_reference_number[long_equity_and_index_quote_message_at] = wire[at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 5 -> long_equity_and_index_quote_message_record.security_symbol[long_equity_and_index_quote_message_at] = wire[at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_record.reserved_1 = wire[at]; at = at + 1;
  decode_expiration_block(long_equity_and_index_quote_message_record.expiration_block);
  long_equity_and_index_quote_message_record.strike_price_denominator_code = wire[at]; at = at + 1;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.strike_price[long_equity_and_index_quote_message_at] = wire[at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_record.premium_price_denominator_code = wire[at]; at = at + 1;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.bid_price[long_equity_and_index_quote_message_at] = wire[at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.bid_size[long_equity_and_index_quote_message_at] = wire[at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.offer_price[long_equity_and_index_quote_message_at] = wire[at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> long_equity_and_index_quote_message_record.offer_size[long_equity_and_index_quote_message_at] = wire[at]; at = at + 1; long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Equity And Index Quote Message is what was written, byte for byte */
inline equal_long_equity_and_index_quote_message(long_equity_and_index_quote_message_read, long_equity_and_index_quote_message_written) {
  assert(long_equity_and_index_quote_message_read.session_indicator == long_equity_and_index_quote_message_written.session_indicator);
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> assert(long_equity_and_index_quote_message_read.participant_reference_number[long_equity_and_index_quote_message_at] == long_equity_and_index_quote_message_written.participant_reference_number[long_equity_and_index_quote_message_at]); long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 5 -> assert(long_equity_and_index_quote_message_read.security_symbol[long_equity_and_index_quote_message_at] == long_equity_and_index_quote_message_written.security_symbol[long_equity_and_index_quote_message_at]); long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  assert(long_equity_and_index_quote_message_read.reserved_1 == long_equity_and_index_quote_message_written.reserved_1);
  equal_expiration_block(long_equity_and_index_quote_message_read.expiration_block, long_equity_and_index_quote_message_written.expiration_block);
  assert(long_equity_and_index_quote_message_read.strike_price_denominator_code == long_equity_and_index_quote_message_written.strike_price_denominator_code);
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> assert(long_equity_and_index_quote_message_read.strike_price[long_equity_and_index_quote_message_at] == long_equity_and_index_quote_message_written.strike_price[long_equity_and_index_quote_message_at]); long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  assert(long_equity_and_index_quote_message_read.premium_price_denominator_code == long_equity_and_index_quote_message_written.premium_price_denominator_code);
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> assert(long_equity_and_index_quote_message_read.bid_price[long_equity_and_index_quote_message_at] == long_equity_and_index_quote_message_written.bid_price[long_equity_and_index_quote_message_at]); long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> assert(long_equity_and_index_quote_message_read.bid_size[long_equity_and_index_quote_message_at] == long_equity_and_index_quote_message_written.bid_size[long_equity_and_index_quote_message_at]); long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> assert(long_equity_and_index_quote_message_read.offer_price[long_equity_and_index_quote_message_at] == long_equity_and_index_quote_message_written.offer_price[long_equity_and_index_quote_message_at]); long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  long_equity_and_index_quote_message_at = 0;
  do
  :: long_equity_and_index_quote_message_at < 4 -> assert(long_equity_and_index_quote_message_read.offer_size[long_equity_and_index_quote_message_at] == long_equity_and_index_quote_message_written.offer_size[long_equity_and_index_quote_message_at]); long_equity_and_index_quote_message_at = long_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Equity And Index Quote Message: 22 bytes -------------------------- */

/* Short Equity and Index Quote message containing a short quote using two byte unsigned integers for prices and sizes */
typedef ShortEquityAndIndexQuoteMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte security_symbol_short[4];
  ExpirationBlock expiration_block;
  byte strike_price_short[2];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte offer_price_short[2];
  byte offer_size_short[2]
};

int short_equity_and_index_quote_message_at;

/* every byte of Short Equity And Index Quote Message set to one value */
inline fill_short_equity_and_index_quote_message(short_equity_and_index_quote_message_record, short_equity_and_index_quote_message_value) {
  short_equity_and_index_quote_message_record.session_indicator = short_equity_and_index_quote_message_value;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> short_equity_and_index_quote_message_record.participant_reference_number[short_equity_and_index_quote_message_at] = short_equity_and_index_quote_message_value; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> short_equity_and_index_quote_message_record.security_symbol_short[short_equity_and_index_quote_message_at] = short_equity_and_index_quote_message_value; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  fill_expiration_block(short_equity_and_index_quote_message_record.expiration_block, short_equity_and_index_quote_message_value);
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.strike_price_short[short_equity_and_index_quote_message_at] = short_equity_and_index_quote_message_value; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.bid_price_short[short_equity_and_index_quote_message_at] = short_equity_and_index_quote_message_value; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.bid_size_short[short_equity_and_index_quote_message_at] = short_equity_and_index_quote_message_value; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.offer_price_short[short_equity_and_index_quote_message_at] = short_equity_and_index_quote_message_value; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.offer_size_short[short_equity_and_index_quote_message_at] = short_equity_and_index_quote_message_value; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Equity And Index Quote Message set to where it lies, so a field read out of place says so */
inline ramp_short_equity_and_index_quote_message(short_equity_and_index_quote_message_record, short_equity_and_index_quote_message_base) {
  short_equity_and_index_quote_message_record.session_indicator = (short_equity_and_index_quote_message_base + 0 + 1) % 256;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> short_equity_and_index_quote_message_record.participant_reference_number[short_equity_and_index_quote_message_at] = (short_equity_and_index_quote_message_base + 1 + short_equity_and_index_quote_message_at + 1) % 256; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> short_equity_and_index_quote_message_record.security_symbol_short[short_equity_and_index_quote_message_at] = (short_equity_and_index_quote_message_base + 5 + short_equity_and_index_quote_message_at + 1) % 256; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  ramp_expiration_block(short_equity_and_index_quote_message_record.expiration_block, short_equity_and_index_quote_message_base + 9);
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.strike_price_short[short_equity_and_index_quote_message_at] = (short_equity_and_index_quote_message_base + 12 + short_equity_and_index_quote_message_at + 1) % 256; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.bid_price_short[short_equity_and_index_quote_message_at] = (short_equity_and_index_quote_message_base + 14 + short_equity_and_index_quote_message_at + 1) % 256; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.bid_size_short[short_equity_and_index_quote_message_at] = (short_equity_and_index_quote_message_base + 16 + short_equity_and_index_quote_message_at + 1) % 256; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.offer_price_short[short_equity_and_index_quote_message_at] = (short_equity_and_index_quote_message_base + 18 + short_equity_and_index_quote_message_at + 1) % 256; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.offer_size_short[short_equity_and_index_quote_message_at] = (short_equity_and_index_quote_message_base + 20 + short_equity_and_index_quote_message_at + 1) % 256; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Equity And Index Quote Message to the wire, 22 bytes from where the cursor stands */
inline encode_short_equity_and_index_quote_message(short_equity_and_index_quote_message_record) {
  wire[at] = short_equity_and_index_quote_message_record.session_indicator; at = at + 1;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> wire[at] = short_equity_and_index_quote_message_record.participant_reference_number[short_equity_and_index_quote_message_at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> wire[at] = short_equity_and_index_quote_message_record.security_symbol_short[short_equity_and_index_quote_message_at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  encode_expiration_block(short_equity_and_index_quote_message_record.expiration_block);
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> wire[at] = short_equity_and_index_quote_message_record.strike_price_short[short_equity_and_index_quote_message_at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> wire[at] = short_equity_and_index_quote_message_record.bid_price_short[short_equity_and_index_quote_message_at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> wire[at] = short_equity_and_index_quote_message_record.bid_size_short[short_equity_and_index_quote_message_at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> wire[at] = short_equity_and_index_quote_message_record.offer_price_short[short_equity_and_index_quote_message_at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> wire[at] = short_equity_and_index_quote_message_record.offer_size_short[short_equity_and_index_quote_message_at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Equity And Index Quote Message off the wire, 22 bytes from where the cursor stands */
inline decode_short_equity_and_index_quote_message(short_equity_and_index_quote_message_record) {
  short_equity_and_index_quote_message_record.session_indicator = wire[at]; at = at + 1;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> short_equity_and_index_quote_message_record.participant_reference_number[short_equity_and_index_quote_message_at] = wire[at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> short_equity_and_index_quote_message_record.security_symbol_short[short_equity_and_index_quote_message_at] = wire[at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  decode_expiration_block(short_equity_and_index_quote_message_record.expiration_block);
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.strike_price_short[short_equity_and_index_quote_message_at] = wire[at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.bid_price_short[short_equity_and_index_quote_message_at] = wire[at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.bid_size_short[short_equity_and_index_quote_message_at] = wire[at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.offer_price_short[short_equity_and_index_quote_message_at] = wire[at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> short_equity_and_index_quote_message_record.offer_size_short[short_equity_and_index_quote_message_at] = wire[at]; at = at + 1; short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Equity And Index Quote Message is what was written, byte for byte */
inline equal_short_equity_and_index_quote_message(short_equity_and_index_quote_message_read, short_equity_and_index_quote_message_written) {
  assert(short_equity_and_index_quote_message_read.session_indicator == short_equity_and_index_quote_message_written.session_indicator);
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> assert(short_equity_and_index_quote_message_read.participant_reference_number[short_equity_and_index_quote_message_at] == short_equity_and_index_quote_message_written.participant_reference_number[short_equity_and_index_quote_message_at]); short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 4 -> assert(short_equity_and_index_quote_message_read.security_symbol_short[short_equity_and_index_quote_message_at] == short_equity_and_index_quote_message_written.security_symbol_short[short_equity_and_index_quote_message_at]); short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  equal_expiration_block(short_equity_and_index_quote_message_read.expiration_block, short_equity_and_index_quote_message_written.expiration_block);
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> assert(short_equity_and_index_quote_message_read.strike_price_short[short_equity_and_index_quote_message_at] == short_equity_and_index_quote_message_written.strike_price_short[short_equity_and_index_quote_message_at]); short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> assert(short_equity_and_index_quote_message_read.bid_price_short[short_equity_and_index_quote_message_at] == short_equity_and_index_quote_message_written.bid_price_short[short_equity_and_index_quote_message_at]); short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> assert(short_equity_and_index_quote_message_read.bid_size_short[short_equity_and_index_quote_message_at] == short_equity_and_index_quote_message_written.bid_size_short[short_equity_and_index_quote_message_at]); short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> assert(short_equity_and_index_quote_message_read.offer_price_short[short_equity_and_index_quote_message_at] == short_equity_and_index_quote_message_written.offer_price_short[short_equity_and_index_quote_message_at]); short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  short_equity_and_index_quote_message_at = 0;
  do
  :: short_equity_and_index_quote_message_at < 2 -> assert(short_equity_and_index_quote_message_read.offer_size_short[short_equity_and_index_quote_message_at] == short_equity_and_index_quote_message_written.offer_size_short[short_equity_and_index_quote_message_at]); short_equity_and_index_quote_message_at = short_equity_and_index_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Control Message: 5 bytes ------------------------------------------------ */

/* Control message performs specified control functions consists of standard Message Header only */
typedef ControlMessage {
  byte session_indicator;
  byte participant_reference_number[4]
};

int control_message_at;

/* every byte of Control Message set to one value */
inline fill_control_message(control_message_record, control_message_value) {
  control_message_record.session_indicator = control_message_value;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> control_message_record.participant_reference_number[control_message_at] = control_message_value; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Control Message set to where it lies, so a field read out of place says so */
inline ramp_control_message(control_message_record, control_message_base) {
  control_message_record.session_indicator = (control_message_base + 0 + 1) % 256;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> control_message_record.participant_reference_number[control_message_at] = (control_message_base + 1 + control_message_at + 1) % 256; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message to the wire, 5 bytes from where the cursor stands */
inline encode_control_message(control_message_record) {
  wire[at] = control_message_record.session_indicator; at = at + 1;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> wire[at] = control_message_record.participant_reference_number[control_message_at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message off the wire, 5 bytes from where the cursor stands */
inline decode_control_message(control_message_record) {
  control_message_record.session_indicator = wire[at]; at = at + 1;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> control_message_record.participant_reference_number[control_message_at] = wire[at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Control Message is what was written, byte for byte */
inline equal_control_message(control_message_read, control_message_written) {
  assert(control_message_read.session_indicator == control_message_written.session_indicator);
  control_message_at = 0;
  do
  :: control_message_at < 4 -> assert(control_message_read.participant_reference_number[control_message_at] == control_message_written.participant_reference_number[control_message_at]); control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Block Sequence Number Status Inquiry Request Message: 13 bytes ---------- */

/* Block Sequence Number Status Inquiry Request sent by the Participant to request the last Block Sequence Number received on that line */
typedef BlockSequenceNumberStatusInquiryRequestMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte reserved_4[4];
  byte second_reserved_4[4]
};

int block_sequence_number_status_inquiry_request_message_at;

/* every byte of Block Sequence Number Status Inquiry Request Message set to one value */
inline fill_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_record, block_sequence_number_status_inquiry_request_message_value) {
  block_sequence_number_status_inquiry_request_message_record.session_indicator = block_sequence_number_status_inquiry_request_message_value;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> block_sequence_number_status_inquiry_request_message_record.participant_reference_number[block_sequence_number_status_inquiry_request_message_at] = block_sequence_number_status_inquiry_request_message_value; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> block_sequence_number_status_inquiry_request_message_record.reserved_4[block_sequence_number_status_inquiry_request_message_at] = block_sequence_number_status_inquiry_request_message_value; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> block_sequence_number_status_inquiry_request_message_record.second_reserved_4[block_sequence_number_status_inquiry_request_message_at] = block_sequence_number_status_inquiry_request_message_value; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Sequence Number Status Inquiry Request Message set to where it lies, so a field read out of place says so */
inline ramp_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_record, block_sequence_number_status_inquiry_request_message_base) {
  block_sequence_number_status_inquiry_request_message_record.session_indicator = (block_sequence_number_status_inquiry_request_message_base + 0 + 1) % 256;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> block_sequence_number_status_inquiry_request_message_record.participant_reference_number[block_sequence_number_status_inquiry_request_message_at] = (block_sequence_number_status_inquiry_request_message_base + 1 + block_sequence_number_status_inquiry_request_message_at + 1) % 256; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> block_sequence_number_status_inquiry_request_message_record.reserved_4[block_sequence_number_status_inquiry_request_message_at] = (block_sequence_number_status_inquiry_request_message_base + 5 + block_sequence_number_status_inquiry_request_message_at + 1) % 256; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> block_sequence_number_status_inquiry_request_message_record.second_reserved_4[block_sequence_number_status_inquiry_request_message_at] = (block_sequence_number_status_inquiry_request_message_base + 9 + block_sequence_number_status_inquiry_request_message_at + 1) % 256; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Block Sequence Number Status Inquiry Request Message to the wire, 13 bytes from where the cursor stands */
inline encode_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_record) {
  wire[at] = block_sequence_number_status_inquiry_request_message_record.session_indicator; at = at + 1;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> wire[at] = block_sequence_number_status_inquiry_request_message_record.participant_reference_number[block_sequence_number_status_inquiry_request_message_at]; at = at + 1; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> wire[at] = block_sequence_number_status_inquiry_request_message_record.reserved_4[block_sequence_number_status_inquiry_request_message_at]; at = at + 1; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> wire[at] = block_sequence_number_status_inquiry_request_message_record.second_reserved_4[block_sequence_number_status_inquiry_request_message_at]; at = at + 1; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Block Sequence Number Status Inquiry Request Message off the wire, 13 bytes from where the cursor stands */
inline decode_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_record) {
  block_sequence_number_status_inquiry_request_message_record.session_indicator = wire[at]; at = at + 1;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> block_sequence_number_status_inquiry_request_message_record.participant_reference_number[block_sequence_number_status_inquiry_request_message_at] = wire[at]; at = at + 1; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> block_sequence_number_status_inquiry_request_message_record.reserved_4[block_sequence_number_status_inquiry_request_message_at] = wire[at]; at = at + 1; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> block_sequence_number_status_inquiry_request_message_record.second_reserved_4[block_sequence_number_status_inquiry_request_message_at] = wire[at]; at = at + 1; block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Sequence Number Status Inquiry Request Message is what was written, byte for byte */
inline equal_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_read, block_sequence_number_status_inquiry_request_message_written) {
  assert(block_sequence_number_status_inquiry_request_message_read.session_indicator == block_sequence_number_status_inquiry_request_message_written.session_indicator);
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> assert(block_sequence_number_status_inquiry_request_message_read.participant_reference_number[block_sequence_number_status_inquiry_request_message_at] == block_sequence_number_status_inquiry_request_message_written.participant_reference_number[block_sequence_number_status_inquiry_request_message_at]); block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> assert(block_sequence_number_status_inquiry_request_message_read.reserved_4[block_sequence_number_status_inquiry_request_message_at] == block_sequence_number_status_inquiry_request_message_written.reserved_4[block_sequence_number_status_inquiry_request_message_at]); block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_inquiry_request_message_at = 0;
  do
  :: block_sequence_number_status_inquiry_request_message_at < 4 -> assert(block_sequence_number_status_inquiry_request_message_read.second_reserved_4[block_sequence_number_status_inquiry_request_message_at] == block_sequence_number_status_inquiry_request_message_written.second_reserved_4[block_sequence_number_status_inquiry_request_message_at]); block_sequence_number_status_inquiry_request_message_at = block_sequence_number_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Block Sequence Number Status Response Message: 13 bytes ----------------- */

/* Block Sequence Number Status Response sent to the Participant by Opra in response to a Type L message contains the last Block Sequence Number received on that input line */
typedef BlockSequenceNumberStatusResponseMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte block_sequence_number[4];
  byte reserved_4[4]
};

int block_sequence_number_status_response_message_at;

/* every byte of Block Sequence Number Status Response Message set to one value */
inline fill_block_sequence_number_status_response_message(block_sequence_number_status_response_message_record, block_sequence_number_status_response_message_value) {
  block_sequence_number_status_response_message_record.session_indicator = block_sequence_number_status_response_message_value;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> block_sequence_number_status_response_message_record.participant_reference_number[block_sequence_number_status_response_message_at] = block_sequence_number_status_response_message_value; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> block_sequence_number_status_response_message_record.block_sequence_number[block_sequence_number_status_response_message_at] = block_sequence_number_status_response_message_value; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> block_sequence_number_status_response_message_record.reserved_4[block_sequence_number_status_response_message_at] = block_sequence_number_status_response_message_value; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Sequence Number Status Response Message set to where it lies, so a field read out of place says so */
inline ramp_block_sequence_number_status_response_message(block_sequence_number_status_response_message_record, block_sequence_number_status_response_message_base) {
  block_sequence_number_status_response_message_record.session_indicator = (block_sequence_number_status_response_message_base + 0 + 1) % 256;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> block_sequence_number_status_response_message_record.participant_reference_number[block_sequence_number_status_response_message_at] = (block_sequence_number_status_response_message_base + 1 + block_sequence_number_status_response_message_at + 1) % 256; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> block_sequence_number_status_response_message_record.block_sequence_number[block_sequence_number_status_response_message_at] = (block_sequence_number_status_response_message_base + 5 + block_sequence_number_status_response_message_at + 1) % 256; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> block_sequence_number_status_response_message_record.reserved_4[block_sequence_number_status_response_message_at] = (block_sequence_number_status_response_message_base + 9 + block_sequence_number_status_response_message_at + 1) % 256; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Block Sequence Number Status Response Message to the wire, 13 bytes from where the cursor stands */
inline encode_block_sequence_number_status_response_message(block_sequence_number_status_response_message_record) {
  wire[at] = block_sequence_number_status_response_message_record.session_indicator; at = at + 1;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> wire[at] = block_sequence_number_status_response_message_record.participant_reference_number[block_sequence_number_status_response_message_at]; at = at + 1; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> wire[at] = block_sequence_number_status_response_message_record.block_sequence_number[block_sequence_number_status_response_message_at]; at = at + 1; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> wire[at] = block_sequence_number_status_response_message_record.reserved_4[block_sequence_number_status_response_message_at]; at = at + 1; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Block Sequence Number Status Response Message off the wire, 13 bytes from where the cursor stands */
inline decode_block_sequence_number_status_response_message(block_sequence_number_status_response_message_record) {
  block_sequence_number_status_response_message_record.session_indicator = wire[at]; at = at + 1;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> block_sequence_number_status_response_message_record.participant_reference_number[block_sequence_number_status_response_message_at] = wire[at]; at = at + 1; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> block_sequence_number_status_response_message_record.block_sequence_number[block_sequence_number_status_response_message_at] = wire[at]; at = at + 1; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> block_sequence_number_status_response_message_record.reserved_4[block_sequence_number_status_response_message_at] = wire[at]; at = at + 1; block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Sequence Number Status Response Message is what was written, byte for byte */
inline equal_block_sequence_number_status_response_message(block_sequence_number_status_response_message_read, block_sequence_number_status_response_message_written) {
  assert(block_sequence_number_status_response_message_read.session_indicator == block_sequence_number_status_response_message_written.session_indicator);
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> assert(block_sequence_number_status_response_message_read.participant_reference_number[block_sequence_number_status_response_message_at] == block_sequence_number_status_response_message_written.participant_reference_number[block_sequence_number_status_response_message_at]); block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> assert(block_sequence_number_status_response_message_read.block_sequence_number[block_sequence_number_status_response_message_at] == block_sequence_number_status_response_message_written.block_sequence_number[block_sequence_number_status_response_message_at]); block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  block_sequence_number_status_response_message_at = 0;
  do
  :: block_sequence_number_status_response_message_at < 4 -> assert(block_sequence_number_status_response_message_read.reserved_4[block_sequence_number_status_response_message_at] == block_sequence_number_status_response_message_written.reserved_4[block_sequence_number_status_response_message_at]); block_sequence_number_status_response_message_at = block_sequence_number_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Count Status Inquiry Request Message: 13 bytes ------------------ */

/* Message Count Status Inquiry Request sent by the Participant to request the message count on that line */
typedef MessageCountStatusInquiryRequestMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte reserved_8[8]
};

int message_count_status_inquiry_request_message_at;

/* every byte of Message Count Status Inquiry Request Message set to one value */
inline fill_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_record, message_count_status_inquiry_request_message_value) {
  message_count_status_inquiry_request_message_record.session_indicator = message_count_status_inquiry_request_message_value;
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 4 -> message_count_status_inquiry_request_message_record.participant_reference_number[message_count_status_inquiry_request_message_at] = message_count_status_inquiry_request_message_value; message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 8 -> message_count_status_inquiry_request_message_record.reserved_8[message_count_status_inquiry_request_message_at] = message_count_status_inquiry_request_message_value; message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Count Status Inquiry Request Message set to where it lies, so a field read out of place says so */
inline ramp_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_record, message_count_status_inquiry_request_message_base) {
  message_count_status_inquiry_request_message_record.session_indicator = (message_count_status_inquiry_request_message_base + 0 + 1) % 256;
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 4 -> message_count_status_inquiry_request_message_record.participant_reference_number[message_count_status_inquiry_request_message_at] = (message_count_status_inquiry_request_message_base + 1 + message_count_status_inquiry_request_message_at + 1) % 256; message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 8 -> message_count_status_inquiry_request_message_record.reserved_8[message_count_status_inquiry_request_message_at] = (message_count_status_inquiry_request_message_base + 5 + message_count_status_inquiry_request_message_at + 1) % 256; message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Message Count Status Inquiry Request Message to the wire, 13 bytes from where the cursor stands */
inline encode_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_record) {
  wire[at] = message_count_status_inquiry_request_message_record.session_indicator; at = at + 1;
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 4 -> wire[at] = message_count_status_inquiry_request_message_record.participant_reference_number[message_count_status_inquiry_request_message_at]; at = at + 1; message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 8 -> wire[at] = message_count_status_inquiry_request_message_record.reserved_8[message_count_status_inquiry_request_message_at]; at = at + 1; message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Message Count Status Inquiry Request Message off the wire, 13 bytes from where the cursor stands */
inline decode_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_record) {
  message_count_status_inquiry_request_message_record.session_indicator = wire[at]; at = at + 1;
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 4 -> message_count_status_inquiry_request_message_record.participant_reference_number[message_count_status_inquiry_request_message_at] = wire[at]; at = at + 1; message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 8 -> message_count_status_inquiry_request_message_record.reserved_8[message_count_status_inquiry_request_message_at] = wire[at]; at = at + 1; message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Count Status Inquiry Request Message is what was written, byte for byte */
inline equal_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_read, message_count_status_inquiry_request_message_written) {
  assert(message_count_status_inquiry_request_message_read.session_indicator == message_count_status_inquiry_request_message_written.session_indicator);
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 4 -> assert(message_count_status_inquiry_request_message_read.participant_reference_number[message_count_status_inquiry_request_message_at] == message_count_status_inquiry_request_message_written.participant_reference_number[message_count_status_inquiry_request_message_at]); message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  message_count_status_inquiry_request_message_at = 0;
  do
  :: message_count_status_inquiry_request_message_at < 8 -> assert(message_count_status_inquiry_request_message_read.reserved_8[message_count_status_inquiry_request_message_at] == message_count_status_inquiry_request_message_written.reserved_8[message_count_status_inquiry_request_message_at]); message_count_status_inquiry_request_message_at = message_count_status_inquiry_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Count Status Response Message: 13 bytes ------------------------- */

/* Message Count Status Response sent from Opra to the Participant containing the count of messages received on an individual line since startup */
typedef MessageCountStatusResponseMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte message_count[8]
};

int message_count_status_response_message_at;

/* every byte of Message Count Status Response Message set to one value */
inline fill_message_count_status_response_message(message_count_status_response_message_record, message_count_status_response_message_value) {
  message_count_status_response_message_record.session_indicator = message_count_status_response_message_value;
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 4 -> message_count_status_response_message_record.participant_reference_number[message_count_status_response_message_at] = message_count_status_response_message_value; message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 8 -> message_count_status_response_message_record.message_count[message_count_status_response_message_at] = message_count_status_response_message_value; message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Count Status Response Message set to where it lies, so a field read out of place says so */
inline ramp_message_count_status_response_message(message_count_status_response_message_record, message_count_status_response_message_base) {
  message_count_status_response_message_record.session_indicator = (message_count_status_response_message_base + 0 + 1) % 256;
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 4 -> message_count_status_response_message_record.participant_reference_number[message_count_status_response_message_at] = (message_count_status_response_message_base + 1 + message_count_status_response_message_at + 1) % 256; message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 8 -> message_count_status_response_message_record.message_count[message_count_status_response_message_at] = (message_count_status_response_message_base + 5 + message_count_status_response_message_at + 1) % 256; message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Message Count Status Response Message to the wire, 13 bytes from where the cursor stands */
inline encode_message_count_status_response_message(message_count_status_response_message_record) {
  wire[at] = message_count_status_response_message_record.session_indicator; at = at + 1;
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 4 -> wire[at] = message_count_status_response_message_record.participant_reference_number[message_count_status_response_message_at]; at = at + 1; message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 8 -> wire[at] = message_count_status_response_message_record.message_count[message_count_status_response_message_at]; at = at + 1; message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Message Count Status Response Message off the wire, 13 bytes from where the cursor stands */
inline decode_message_count_status_response_message(message_count_status_response_message_record) {
  message_count_status_response_message_record.session_indicator = wire[at]; at = at + 1;
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 4 -> message_count_status_response_message_record.participant_reference_number[message_count_status_response_message_at] = wire[at]; at = at + 1; message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 8 -> message_count_status_response_message_record.message_count[message_count_status_response_message_at] = wire[at]; at = at + 1; message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Count Status Response Message is what was written, byte for byte */
inline equal_message_count_status_response_message(message_count_status_response_message_read, message_count_status_response_message_written) {
  assert(message_count_status_response_message_read.session_indicator == message_count_status_response_message_written.session_indicator);
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 4 -> assert(message_count_status_response_message_read.participant_reference_number[message_count_status_response_message_at] == message_count_status_response_message_written.participant_reference_number[message_count_status_response_message_at]); message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  message_count_status_response_message_at = 0;
  do
  :: message_count_status_response_message_at < 8 -> assert(message_count_status_response_message_read.message_count[message_count_status_response_message_at] == message_count_status_response_message_written.message_count[message_count_status_response_message_at]); message_count_status_response_message_at = message_count_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Value Last Sale Message: 20 bytes ---------------------------- */

/* Underlying Value Last Sale message containing the Last Sale Index Value */
typedef UnderlyingValueLastSaleMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte security_symbol[5];
  byte reserved_1;
  byte index_value_denominator_code;
  byte index_value[4];
  byte reserved_4[4]
};

int underlying_value_last_sale_message_at;

/* every byte of Underlying Value Last Sale Message set to one value */
inline fill_underlying_value_last_sale_message(underlying_value_last_sale_message_record, underlying_value_last_sale_message_value) {
  underlying_value_last_sale_message_record.session_indicator = underlying_value_last_sale_message_value;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> underlying_value_last_sale_message_record.participant_reference_number[underlying_value_last_sale_message_at] = underlying_value_last_sale_message_value; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 5 -> underlying_value_last_sale_message_record.security_symbol[underlying_value_last_sale_message_at] = underlying_value_last_sale_message_value; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_record.reserved_1 = underlying_value_last_sale_message_value;
  underlying_value_last_sale_message_record.index_value_denominator_code = underlying_value_last_sale_message_value;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> underlying_value_last_sale_message_record.index_value[underlying_value_last_sale_message_at] = underlying_value_last_sale_message_value; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> underlying_value_last_sale_message_record.reserved_4[underlying_value_last_sale_message_at] = underlying_value_last_sale_message_value; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Value Last Sale Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_value_last_sale_message(underlying_value_last_sale_message_record, underlying_value_last_sale_message_base) {
  underlying_value_last_sale_message_record.session_indicator = (underlying_value_last_sale_message_base + 0 + 1) % 256;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> underlying_value_last_sale_message_record.participant_reference_number[underlying_value_last_sale_message_at] = (underlying_value_last_sale_message_base + 1 + underlying_value_last_sale_message_at + 1) % 256; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 5 -> underlying_value_last_sale_message_record.security_symbol[underlying_value_last_sale_message_at] = (underlying_value_last_sale_message_base + 5 + underlying_value_last_sale_message_at + 1) % 256; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_record.reserved_1 = (underlying_value_last_sale_message_base + 10 + 1) % 256;
  underlying_value_last_sale_message_record.index_value_denominator_code = (underlying_value_last_sale_message_base + 11 + 1) % 256;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> underlying_value_last_sale_message_record.index_value[underlying_value_last_sale_message_at] = (underlying_value_last_sale_message_base + 12 + underlying_value_last_sale_message_at + 1) % 256; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> underlying_value_last_sale_message_record.reserved_4[underlying_value_last_sale_message_at] = (underlying_value_last_sale_message_base + 16 + underlying_value_last_sale_message_at + 1) % 256; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Value Last Sale Message to the wire, 20 bytes from where the cursor stands */
inline encode_underlying_value_last_sale_message(underlying_value_last_sale_message_record) {
  wire[at] = underlying_value_last_sale_message_record.session_indicator; at = at + 1;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> wire[at] = underlying_value_last_sale_message_record.participant_reference_number[underlying_value_last_sale_message_at]; at = at + 1; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 5 -> wire[at] = underlying_value_last_sale_message_record.security_symbol[underlying_value_last_sale_message_at]; at = at + 1; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_value_last_sale_message_record.reserved_1; at = at + 1;
  wire[at] = underlying_value_last_sale_message_record.index_value_denominator_code; at = at + 1;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> wire[at] = underlying_value_last_sale_message_record.index_value[underlying_value_last_sale_message_at]; at = at + 1; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> wire[at] = underlying_value_last_sale_message_record.reserved_4[underlying_value_last_sale_message_at]; at = at + 1; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Value Last Sale Message off the wire, 20 bytes from where the cursor stands */
inline decode_underlying_value_last_sale_message(underlying_value_last_sale_message_record) {
  underlying_value_last_sale_message_record.session_indicator = wire[at]; at = at + 1;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> underlying_value_last_sale_message_record.participant_reference_number[underlying_value_last_sale_message_at] = wire[at]; at = at + 1; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 5 -> underlying_value_last_sale_message_record.security_symbol[underlying_value_last_sale_message_at] = wire[at]; at = at + 1; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_record.reserved_1 = wire[at]; at = at + 1;
  underlying_value_last_sale_message_record.index_value_denominator_code = wire[at]; at = at + 1;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> underlying_value_last_sale_message_record.index_value[underlying_value_last_sale_message_at] = wire[at]; at = at + 1; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> underlying_value_last_sale_message_record.reserved_4[underlying_value_last_sale_message_at] = wire[at]; at = at + 1; underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Value Last Sale Message is what was written, byte for byte */
inline equal_underlying_value_last_sale_message(underlying_value_last_sale_message_read, underlying_value_last_sale_message_written) {
  assert(underlying_value_last_sale_message_read.session_indicator == underlying_value_last_sale_message_written.session_indicator);
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> assert(underlying_value_last_sale_message_read.participant_reference_number[underlying_value_last_sale_message_at] == underlying_value_last_sale_message_written.participant_reference_number[underlying_value_last_sale_message_at]); underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 5 -> assert(underlying_value_last_sale_message_read.security_symbol[underlying_value_last_sale_message_at] == underlying_value_last_sale_message_written.security_symbol[underlying_value_last_sale_message_at]); underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  assert(underlying_value_last_sale_message_read.reserved_1 == underlying_value_last_sale_message_written.reserved_1);
  assert(underlying_value_last_sale_message_read.index_value_denominator_code == underlying_value_last_sale_message_written.index_value_denominator_code);
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> assert(underlying_value_last_sale_message_read.index_value[underlying_value_last_sale_message_at] == underlying_value_last_sale_message_written.index_value[underlying_value_last_sale_message_at]); underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  underlying_value_last_sale_message_at = 0;
  do
  :: underlying_value_last_sale_message_at < 4 -> assert(underlying_value_last_sale_message_read.reserved_4[underlying_value_last_sale_message_at] == underlying_value_last_sale_message_written.reserved_4[underlying_value_last_sale_message_at]); underlying_value_last_sale_message_at = underlying_value_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Value Bid And Offer Message: 20 bytes ------------------------ */

/* Underlying Value Bid and Offer message containing the Last Sale Bid Offer Index Value */
typedef UnderlyingValueBidAndOfferMessage {
  byte session_indicator;
  byte participant_reference_number[4];
  byte security_symbol[5];
  byte reserved_1;
  byte index_value_denominator_code;
  byte bid_index_value[4];
  byte offer_index_value[4]
};

int underlying_value_bid_and_offer_message_at;

/* every byte of Underlying Value Bid And Offer Message set to one value */
inline fill_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_record, underlying_value_bid_and_offer_message_value) {
  underlying_value_bid_and_offer_message_record.session_indicator = underlying_value_bid_and_offer_message_value;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> underlying_value_bid_and_offer_message_record.participant_reference_number[underlying_value_bid_and_offer_message_at] = underlying_value_bid_and_offer_message_value; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 5 -> underlying_value_bid_and_offer_message_record.security_symbol[underlying_value_bid_and_offer_message_at] = underlying_value_bid_and_offer_message_value; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_record.reserved_1 = underlying_value_bid_and_offer_message_value;
  underlying_value_bid_and_offer_message_record.index_value_denominator_code = underlying_value_bid_and_offer_message_value;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> underlying_value_bid_and_offer_message_record.bid_index_value[underlying_value_bid_and_offer_message_at] = underlying_value_bid_and_offer_message_value; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> underlying_value_bid_and_offer_message_record.offer_index_value[underlying_value_bid_and_offer_message_at] = underlying_value_bid_and_offer_message_value; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Value Bid And Offer Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_record, underlying_value_bid_and_offer_message_base) {
  underlying_value_bid_and_offer_message_record.session_indicator = (underlying_value_bid_and_offer_message_base + 0 + 1) % 256;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> underlying_value_bid_and_offer_message_record.participant_reference_number[underlying_value_bid_and_offer_message_at] = (underlying_value_bid_and_offer_message_base + 1 + underlying_value_bid_and_offer_message_at + 1) % 256; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 5 -> underlying_value_bid_and_offer_message_record.security_symbol[underlying_value_bid_and_offer_message_at] = (underlying_value_bid_and_offer_message_base + 5 + underlying_value_bid_and_offer_message_at + 1) % 256; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_record.reserved_1 = (underlying_value_bid_and_offer_message_base + 10 + 1) % 256;
  underlying_value_bid_and_offer_message_record.index_value_denominator_code = (underlying_value_bid_and_offer_message_base + 11 + 1) % 256;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> underlying_value_bid_and_offer_message_record.bid_index_value[underlying_value_bid_and_offer_message_at] = (underlying_value_bid_and_offer_message_base + 12 + underlying_value_bid_and_offer_message_at + 1) % 256; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> underlying_value_bid_and_offer_message_record.offer_index_value[underlying_value_bid_and_offer_message_at] = (underlying_value_bid_and_offer_message_base + 16 + underlying_value_bid_and_offer_message_at + 1) % 256; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Value Bid And Offer Message to the wire, 20 bytes from where the cursor stands */
inline encode_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_record) {
  wire[at] = underlying_value_bid_and_offer_message_record.session_indicator; at = at + 1;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> wire[at] = underlying_value_bid_and_offer_message_record.participant_reference_number[underlying_value_bid_and_offer_message_at]; at = at + 1; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 5 -> wire[at] = underlying_value_bid_and_offer_message_record.security_symbol[underlying_value_bid_and_offer_message_at]; at = at + 1; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_value_bid_and_offer_message_record.reserved_1; at = at + 1;
  wire[at] = underlying_value_bid_and_offer_message_record.index_value_denominator_code; at = at + 1;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> wire[at] = underlying_value_bid_and_offer_message_record.bid_index_value[underlying_value_bid_and_offer_message_at]; at = at + 1; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> wire[at] = underlying_value_bid_and_offer_message_record.offer_index_value[underlying_value_bid_and_offer_message_at]; at = at + 1; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Value Bid And Offer Message off the wire, 20 bytes from where the cursor stands */
inline decode_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_record) {
  underlying_value_bid_and_offer_message_record.session_indicator = wire[at]; at = at + 1;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> underlying_value_bid_and_offer_message_record.participant_reference_number[underlying_value_bid_and_offer_message_at] = wire[at]; at = at + 1; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 5 -> underlying_value_bid_and_offer_message_record.security_symbol[underlying_value_bid_and_offer_message_at] = wire[at]; at = at + 1; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_record.reserved_1 = wire[at]; at = at + 1;
  underlying_value_bid_and_offer_message_record.index_value_denominator_code = wire[at]; at = at + 1;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> underlying_value_bid_and_offer_message_record.bid_index_value[underlying_value_bid_and_offer_message_at] = wire[at]; at = at + 1; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> underlying_value_bid_and_offer_message_record.offer_index_value[underlying_value_bid_and_offer_message_at] = wire[at]; at = at + 1; underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Value Bid And Offer Message is what was written, byte for byte */
inline equal_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_read, underlying_value_bid_and_offer_message_written) {
  assert(underlying_value_bid_and_offer_message_read.session_indicator == underlying_value_bid_and_offer_message_written.session_indicator);
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> assert(underlying_value_bid_and_offer_message_read.participant_reference_number[underlying_value_bid_and_offer_message_at] == underlying_value_bid_and_offer_message_written.participant_reference_number[underlying_value_bid_and_offer_message_at]); underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 5 -> assert(underlying_value_bid_and_offer_message_read.security_symbol[underlying_value_bid_and_offer_message_at] == underlying_value_bid_and_offer_message_written.security_symbol[underlying_value_bid_and_offer_message_at]); underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  assert(underlying_value_bid_and_offer_message_read.reserved_1 == underlying_value_bid_and_offer_message_written.reserved_1);
  assert(underlying_value_bid_and_offer_message_read.index_value_denominator_code == underlying_value_bid_and_offer_message_written.index_value_denominator_code);
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> assert(underlying_value_bid_and_offer_message_read.bid_index_value[underlying_value_bid_and_offer_message_at] == underlying_value_bid_and_offer_message_written.bid_index_value[underlying_value_bid_and_offer_message_at]); underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  underlying_value_bid_and_offer_message_at = 0;
  do
  :: underlying_value_bid_and_offer_message_at < 4 -> assert(underlying_value_bid_and_offer_message_read.offer_index_value[underlying_value_bid_and_offer_message_at] == underlying_value_bid_and_offer_message_written.offer_index_value[underlying_value_bid_and_offer_message_at]); underlying_value_bid_and_offer_message_at = underlying_value_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Block Timestamp: encoded, read back, and compared */
proctype check_block_timestamp() {
  BlockTimestamp block_timestamp_sent;
  BlockTimestamp block_timestamp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_timestamp(block_timestamp_sent, 0)
  :: pattern == 1 -> fill_block_timestamp(block_timestamp_sent, 32)
  :: pattern == 2 -> fill_block_timestamp(block_timestamp_sent, 255)
  :: else -> ramp_block_timestamp(block_timestamp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_timestamp(block_timestamp_sent);
    assert(at == 8);
    at = 0;
    decode_block_timestamp(block_timestamp_got);
    assert(at == 8);
    equal_block_timestamp(block_timestamp_got, block_timestamp_sent)
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
    assert(at == 21);
    at = 0;
    decode_block_header(block_header_got);
    assert(at == 21);
    equal_block_header(block_header_got, block_header_sent)
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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Expiration Block: encoded, read back, and compared */
proctype check_expiration_block() {
  ExpirationBlock expiration_block_sent;
  ExpirationBlock expiration_block_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expiration_block(expiration_block_sent, 0)
  :: pattern == 1 -> fill_expiration_block(expiration_block_sent, 32)
  :: pattern == 2 -> fill_expiration_block(expiration_block_sent, 255)
  :: else -> ramp_expiration_block(expiration_block_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expiration_block(expiration_block_sent);
    assert(at == 3);
    at = 0;
    decode_expiration_block(expiration_block_got);
    assert(at == 3);
    equal_expiration_block(expiration_block_got, expiration_block_sent)
  }
}

/* Equity And Index Last Sale Message: encoded, read back, and compared */
proctype check_equity_and_index_last_sale_message() {
  EquityAndIndexLastSaleMessage equity_and_index_last_sale_message_sent;
  EquityAndIndexLastSaleMessage equity_and_index_last_sale_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equity_and_index_last_sale_message(equity_and_index_last_sale_message_sent, 0)
  :: pattern == 1 -> fill_equity_and_index_last_sale_message(equity_and_index_last_sale_message_sent, 32)
  :: pattern == 2 -> fill_equity_and_index_last_sale_message(equity_and_index_last_sale_message_sent, 255)
  :: else -> ramp_equity_and_index_last_sale_message(equity_and_index_last_sale_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equity_and_index_last_sale_message(equity_and_index_last_sale_message_sent);
    assert(at == 36);
    at = 0;
    decode_equity_and_index_last_sale_message(equity_and_index_last_sale_message_got);
    assert(at == 36);
    equal_equity_and_index_last_sale_message(equity_and_index_last_sale_message_got, equity_and_index_last_sale_message_sent)
  }
}

/* Equity And Index End Of Day Summary Message: encoded, read back, and compared */
proctype check_equity_and_index_end_of_day_summary_message() {
  EquityAndIndexEndOfDaySummaryMessage equity_and_index_end_of_day_summary_message_sent;
  EquityAndIndexEndOfDaySummaryMessage equity_and_index_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_sent, 255)
  :: else -> ramp_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_sent);
    assert(at == 65);
    at = 0;
    decode_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_got);
    assert(at == 65);
    equal_equity_and_index_end_of_day_summary_message(equity_and_index_end_of_day_summary_message_got, equity_and_index_end_of_day_summary_message_sent)
  }
}

/* Long Equity And Index Quote Message: encoded, read back, and compared */
proctype check_long_equity_and_index_quote_message() {
  LongEquityAndIndexQuoteMessage long_equity_and_index_quote_message_sent;
  LongEquityAndIndexQuoteMessage long_equity_and_index_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_equity_and_index_quote_message(long_equity_and_index_quote_message_sent, 0)
  :: pattern == 1 -> fill_long_equity_and_index_quote_message(long_equity_and_index_quote_message_sent, 32)
  :: pattern == 2 -> fill_long_equity_and_index_quote_message(long_equity_and_index_quote_message_sent, 255)
  :: else -> ramp_long_equity_and_index_quote_message(long_equity_and_index_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_equity_and_index_quote_message(long_equity_and_index_quote_message_sent);
    assert(at == 36);
    at = 0;
    decode_long_equity_and_index_quote_message(long_equity_and_index_quote_message_got);
    assert(at == 36);
    equal_long_equity_and_index_quote_message(long_equity_and_index_quote_message_got, long_equity_and_index_quote_message_sent)
  }
}

/* Short Equity And Index Quote Message: encoded, read back, and compared */
proctype check_short_equity_and_index_quote_message() {
  ShortEquityAndIndexQuoteMessage short_equity_and_index_quote_message_sent;
  ShortEquityAndIndexQuoteMessage short_equity_and_index_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_equity_and_index_quote_message(short_equity_and_index_quote_message_sent, 0)
  :: pattern == 1 -> fill_short_equity_and_index_quote_message(short_equity_and_index_quote_message_sent, 32)
  :: pattern == 2 -> fill_short_equity_and_index_quote_message(short_equity_and_index_quote_message_sent, 255)
  :: else -> ramp_short_equity_and_index_quote_message(short_equity_and_index_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_equity_and_index_quote_message(short_equity_and_index_quote_message_sent);
    assert(at == 22);
    at = 0;
    decode_short_equity_and_index_quote_message(short_equity_and_index_quote_message_got);
    assert(at == 22);
    equal_short_equity_and_index_quote_message(short_equity_and_index_quote_message_got, short_equity_and_index_quote_message_sent)
  }
}

/* Control Message: encoded, read back, and compared */
proctype check_control_message() {
  ControlMessage control_message_sent;
  ControlMessage control_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_control_message(control_message_sent, 0)
  :: pattern == 1 -> fill_control_message(control_message_sent, 32)
  :: pattern == 2 -> fill_control_message(control_message_sent, 255)
  :: else -> ramp_control_message(control_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_control_message(control_message_sent);
    assert(at == 5);
    at = 0;
    decode_control_message(control_message_got);
    assert(at == 5);
    equal_control_message(control_message_got, control_message_sent)
  }
}

/* Block Sequence Number Status Inquiry Request Message: encoded, read back, and compared */
proctype check_block_sequence_number_status_inquiry_request_message() {
  BlockSequenceNumberStatusInquiryRequestMessage block_sequence_number_status_inquiry_request_message_sent;
  BlockSequenceNumberStatusInquiryRequestMessage block_sequence_number_status_inquiry_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_sent, 0)
  :: pattern == 1 -> fill_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_sent, 32)
  :: pattern == 2 -> fill_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_sent, 255)
  :: else -> ramp_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_sent);
    assert(at == 13);
    at = 0;
    decode_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_got);
    assert(at == 13);
    equal_block_sequence_number_status_inquiry_request_message(block_sequence_number_status_inquiry_request_message_got, block_sequence_number_status_inquiry_request_message_sent)
  }
}

/* Block Sequence Number Status Response Message: encoded, read back, and compared */
proctype check_block_sequence_number_status_response_message() {
  BlockSequenceNumberStatusResponseMessage block_sequence_number_status_response_message_sent;
  BlockSequenceNumberStatusResponseMessage block_sequence_number_status_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_sequence_number_status_response_message(block_sequence_number_status_response_message_sent, 0)
  :: pattern == 1 -> fill_block_sequence_number_status_response_message(block_sequence_number_status_response_message_sent, 32)
  :: pattern == 2 -> fill_block_sequence_number_status_response_message(block_sequence_number_status_response_message_sent, 255)
  :: else -> ramp_block_sequence_number_status_response_message(block_sequence_number_status_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_sequence_number_status_response_message(block_sequence_number_status_response_message_sent);
    assert(at == 13);
    at = 0;
    decode_block_sequence_number_status_response_message(block_sequence_number_status_response_message_got);
    assert(at == 13);
    equal_block_sequence_number_status_response_message(block_sequence_number_status_response_message_got, block_sequence_number_status_response_message_sent)
  }
}

/* Message Count Status Inquiry Request Message: encoded, read back, and compared */
proctype check_message_count_status_inquiry_request_message() {
  MessageCountStatusInquiryRequestMessage message_count_status_inquiry_request_message_sent;
  MessageCountStatusInquiryRequestMessage message_count_status_inquiry_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_sent, 0)
  :: pattern == 1 -> fill_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_sent, 32)
  :: pattern == 2 -> fill_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_sent, 255)
  :: else -> ramp_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_sent);
    assert(at == 13);
    at = 0;
    decode_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_got);
    assert(at == 13);
    equal_message_count_status_inquiry_request_message(message_count_status_inquiry_request_message_got, message_count_status_inquiry_request_message_sent)
  }
}

/* Message Count Status Response Message: encoded, read back, and compared */
proctype check_message_count_status_response_message() {
  MessageCountStatusResponseMessage message_count_status_response_message_sent;
  MessageCountStatusResponseMessage message_count_status_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_count_status_response_message(message_count_status_response_message_sent, 0)
  :: pattern == 1 -> fill_message_count_status_response_message(message_count_status_response_message_sent, 32)
  :: pattern == 2 -> fill_message_count_status_response_message(message_count_status_response_message_sent, 255)
  :: else -> ramp_message_count_status_response_message(message_count_status_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_count_status_response_message(message_count_status_response_message_sent);
    assert(at == 13);
    at = 0;
    decode_message_count_status_response_message(message_count_status_response_message_got);
    assert(at == 13);
    equal_message_count_status_response_message(message_count_status_response_message_got, message_count_status_response_message_sent)
  }
}

/* Underlying Value Last Sale Message: encoded, read back, and compared */
proctype check_underlying_value_last_sale_message() {
  UnderlyingValueLastSaleMessage underlying_value_last_sale_message_sent;
  UnderlyingValueLastSaleMessage underlying_value_last_sale_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_value_last_sale_message(underlying_value_last_sale_message_sent, 0)
  :: pattern == 1 -> fill_underlying_value_last_sale_message(underlying_value_last_sale_message_sent, 32)
  :: pattern == 2 -> fill_underlying_value_last_sale_message(underlying_value_last_sale_message_sent, 255)
  :: else -> ramp_underlying_value_last_sale_message(underlying_value_last_sale_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_value_last_sale_message(underlying_value_last_sale_message_sent);
    assert(at == 20);
    at = 0;
    decode_underlying_value_last_sale_message(underlying_value_last_sale_message_got);
    assert(at == 20);
    equal_underlying_value_last_sale_message(underlying_value_last_sale_message_got, underlying_value_last_sale_message_sent)
  }
}

/* Underlying Value Bid And Offer Message: encoded, read back, and compared */
proctype check_underlying_value_bid_and_offer_message() {
  UnderlyingValueBidAndOfferMessage underlying_value_bid_and_offer_message_sent;
  UnderlyingValueBidAndOfferMessage underlying_value_bid_and_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_sent, 0)
  :: pattern == 1 -> fill_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_sent, 32)
  :: pattern == 2 -> fill_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_sent, 255)
  :: else -> ramp_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_sent);
    assert(at == 20);
    at = 0;
    decode_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_got);
    assert(at == 20);
    equal_underlying_value_bid_and_offer_message(underlying_value_bid_and_offer_message_got, underlying_value_bid_and_offer_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_block_timestamp()
  :: run check_block_header()
  :: run check_message_header()
  :: run check_expiration_block()
  :: run check_equity_and_index_last_sale_message()
  :: run check_equity_and_index_end_of_day_summary_message()
  :: run check_long_equity_and_index_quote_message()
  :: run check_short_equity_and_index_quote_message()
  :: run check_control_message()
  :: run check_block_sequence_number_status_inquiry_request_message()
  :: run check_block_sequence_number_status_response_message()
  :: run check_message_count_status_inquiry_request_message()
  :: run check_message_count_status_response_message()
  :: run check_underlying_value_last_sale_message()
  :: run check_underlying_value_bid_and_offer_message()
  fi
}
