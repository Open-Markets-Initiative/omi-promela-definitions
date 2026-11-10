/*
 * Coinbase Market Data Api
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
 *   - a run counted by a field
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 123

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 10 bytes ------------------------------------------------ */

/* Coinbase Sbe Market Data message header — frame length plus standard SBE header */
typedef MessageHeader {
  byte frame_length[2];
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
  :: message_header_at < 2 -> message_header_record.frame_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
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
  :: message_header_at < 2 -> message_header_record.frame_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 10 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.frame_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
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

/* Message Header off the wire, 10 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.frame_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
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
  :: message_header_at < 2 -> assert(message_header_read.frame_length[message_header_at] == message_header_written.frame_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
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

/* ---- Instr Header: 22 bytes -------------------------------------------------- */

/* Instrument Header */
typedef InstrHeader {
  byte instrument_flags;
  byte instrument_side;
  byte instrument_id[4];
  byte instr_seq_num[4];
  byte trading_session_date[2];
  byte reserved[2];
  byte transact_time[8]
};

int instr_header_at;

/* every byte of Instr Header set to one value */
inline fill_instr_header(instr_header_record, instr_header_value) {
  instr_header_record.instrument_flags = instr_header_value;
  instr_header_record.instrument_side = instr_header_value;
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> instr_header_record.instrument_id[instr_header_at] = instr_header_value; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> instr_header_record.instr_seq_num[instr_header_at] = instr_header_value; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> instr_header_record.trading_session_date[instr_header_at] = instr_header_value; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> instr_header_record.reserved[instr_header_at] = instr_header_value; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 8 -> instr_header_record.transact_time[instr_header_at] = instr_header_value; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instr Header set to where it lies, so a field read out of place says so */
inline ramp_instr_header(instr_header_record, instr_header_base) {
  instr_header_record.instrument_flags = (instr_header_base + 0 + 1) % 256;
  instr_header_record.instrument_side = (instr_header_base + 1 + 1) % 256;
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> instr_header_record.instrument_id[instr_header_at] = (instr_header_base + 2 + instr_header_at + 1) % 256; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> instr_header_record.instr_seq_num[instr_header_at] = (instr_header_base + 6 + instr_header_at + 1) % 256; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> instr_header_record.trading_session_date[instr_header_at] = (instr_header_base + 10 + instr_header_at + 1) % 256; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> instr_header_record.reserved[instr_header_at] = (instr_header_base + 12 + instr_header_at + 1) % 256; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 8 -> instr_header_record.transact_time[instr_header_at] = (instr_header_base + 14 + instr_header_at + 1) % 256; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  skip
}

/* Instr Header to the wire, 22 bytes from where the cursor stands */
inline encode_instr_header(instr_header_record) {
  wire[at] = instr_header_record.instrument_flags; at = at + 1;
  wire[at] = instr_header_record.instrument_side; at = at + 1;
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> wire[at] = instr_header_record.instrument_id[instr_header_at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> wire[at] = instr_header_record.instr_seq_num[instr_header_at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> wire[at] = instr_header_record.trading_session_date[instr_header_at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> wire[at] = instr_header_record.reserved[instr_header_at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 8 -> wire[at] = instr_header_record.transact_time[instr_header_at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  skip
}

/* Instr Header off the wire, 22 bytes from where the cursor stands */
inline decode_instr_header(instr_header_record) {
  instr_header_record.instrument_flags = wire[at]; at = at + 1;
  instr_header_record.instrument_side = wire[at]; at = at + 1;
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> instr_header_record.instrument_id[instr_header_at] = wire[at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> instr_header_record.instr_seq_num[instr_header_at] = wire[at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> instr_header_record.trading_session_date[instr_header_at] = wire[at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> instr_header_record.reserved[instr_header_at] = wire[at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 8 -> instr_header_record.transact_time[instr_header_at] = wire[at]; at = at + 1; instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instr Header is what was written, byte for byte */
inline equal_instr_header(instr_header_read, instr_header_written) {
  assert(instr_header_read.instrument_flags == instr_header_written.instrument_flags);
  assert(instr_header_read.instrument_side == instr_header_written.instrument_side);
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> assert(instr_header_read.instrument_id[instr_header_at] == instr_header_written.instrument_id[instr_header_at]); instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 4 -> assert(instr_header_read.instr_seq_num[instr_header_at] == instr_header_written.instr_seq_num[instr_header_at]); instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> assert(instr_header_read.trading_session_date[instr_header_at] == instr_header_written.trading_session_date[instr_header_at]); instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 2 -> assert(instr_header_read.reserved[instr_header_at] == instr_header_written.reserved[instr_header_at]); instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  instr_header_at = 0;
  do
  :: instr_header_at < 8 -> assert(instr_header_read.transact_time[instr_header_at] == instr_header_written.transact_time[instr_header_at]); instr_header_at = instr_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Update Message: 39 bytes --------------------------------- */

/* TradingStatusUpdateMessage */
typedef TradingStatusUpdateMessage {
  InstrHeader instr_header;
  byte limit_down_price[8];
  byte limit_up_price[8];
  byte trading_status
};

int trading_status_update_message_at;

/* every byte of Trading Status Update Message set to one value */
inline fill_trading_status_update_message(trading_status_update_message_record, trading_status_update_message_value) {
  fill_instr_header(trading_status_update_message_record.instr_header, trading_status_update_message_value);
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> trading_status_update_message_record.limit_down_price[trading_status_update_message_at] = trading_status_update_message_value; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> trading_status_update_message_record.limit_up_price[trading_status_update_message_at] = trading_status_update_message_value; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_record.trading_status = trading_status_update_message_value;
  skip
}

/* each byte of Trading Status Update Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_update_message(trading_status_update_message_record, trading_status_update_message_base) {
  ramp_instr_header(trading_status_update_message_record.instr_header, trading_status_update_message_base + 0);
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> trading_status_update_message_record.limit_down_price[trading_status_update_message_at] = (trading_status_update_message_base + 22 + trading_status_update_message_at + 1) % 256; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> trading_status_update_message_record.limit_up_price[trading_status_update_message_at] = (trading_status_update_message_base + 30 + trading_status_update_message_at + 1) % 256; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_record.trading_status = (trading_status_update_message_base + 38 + 1) % 256;
  skip
}

/* Trading Status Update Message to the wire, 39 bytes from where the cursor stands */
inline encode_trading_status_update_message(trading_status_update_message_record) {
  encode_instr_header(trading_status_update_message_record.instr_header);
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> wire[at] = trading_status_update_message_record.limit_down_price[trading_status_update_message_at]; at = at + 1; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> wire[at] = trading_status_update_message_record.limit_up_price[trading_status_update_message_at]; at = at + 1; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_update_message_record.trading_status; at = at + 1;
  skip
}

/* Trading Status Update Message off the wire, 39 bytes from where the cursor stands */
inline decode_trading_status_update_message(trading_status_update_message_record) {
  decode_instr_header(trading_status_update_message_record.instr_header);
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> trading_status_update_message_record.limit_down_price[trading_status_update_message_at] = wire[at]; at = at + 1; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> trading_status_update_message_record.limit_up_price[trading_status_update_message_at] = wire[at]; at = at + 1; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_record.trading_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Update Message is what was written, byte for byte */
inline equal_trading_status_update_message(trading_status_update_message_read, trading_status_update_message_written) {
  equal_instr_header(trading_status_update_message_read.instr_header, trading_status_update_message_written.instr_header);
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> assert(trading_status_update_message_read.limit_down_price[trading_status_update_message_at] == trading_status_update_message_written.limit_down_price[trading_status_update_message_at]); trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> assert(trading_status_update_message_read.limit_up_price[trading_status_update_message_at] == trading_status_update_message_written.limit_up_price[trading_status_update_message_at]); trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  assert(trading_status_update_message_read.trading_status == trading_status_update_message_written.trading_status);
  skip
}

/* ---- Order Put Message: 42 bytes --------------------------------------------- */

/* OrderPutMessage */
typedef OrderPutMessage {
  InstrHeader instr_header;
  byte order_id[8];
  byte price[8];
  byte quantity[4]
};

int order_put_message_at;

/* every byte of Order Put Message set to one value */
inline fill_order_put_message(order_put_message_record, order_put_message_value) {
  fill_instr_header(order_put_message_record.instr_header, order_put_message_value);
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> order_put_message_record.order_id[order_put_message_at] = order_put_message_value; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> order_put_message_record.price[order_put_message_at] = order_put_message_value; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 4 -> order_put_message_record.quantity[order_put_message_at] = order_put_message_value; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Put Message set to where it lies, so a field read out of place says so */
inline ramp_order_put_message(order_put_message_record, order_put_message_base) {
  ramp_instr_header(order_put_message_record.instr_header, order_put_message_base + 0);
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> order_put_message_record.order_id[order_put_message_at] = (order_put_message_base + 22 + order_put_message_at + 1) % 256; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> order_put_message_record.price[order_put_message_at] = (order_put_message_base + 30 + order_put_message_at + 1) % 256; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 4 -> order_put_message_record.quantity[order_put_message_at] = (order_put_message_base + 38 + order_put_message_at + 1) % 256; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Put Message to the wire, 42 bytes from where the cursor stands */
inline encode_order_put_message(order_put_message_record) {
  encode_instr_header(order_put_message_record.instr_header);
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> wire[at] = order_put_message_record.order_id[order_put_message_at]; at = at + 1; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> wire[at] = order_put_message_record.price[order_put_message_at]; at = at + 1; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 4 -> wire[at] = order_put_message_record.quantity[order_put_message_at]; at = at + 1; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Put Message off the wire, 42 bytes from where the cursor stands */
inline decode_order_put_message(order_put_message_record) {
  decode_instr_header(order_put_message_record.instr_header);
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> order_put_message_record.order_id[order_put_message_at] = wire[at]; at = at + 1; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> order_put_message_record.price[order_put_message_at] = wire[at]; at = at + 1; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 4 -> order_put_message_record.quantity[order_put_message_at] = wire[at]; at = at + 1; order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Put Message is what was written, byte for byte */
inline equal_order_put_message(order_put_message_read, order_put_message_written) {
  equal_instr_header(order_put_message_read.instr_header, order_put_message_written.instr_header);
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> assert(order_put_message_read.order_id[order_put_message_at] == order_put_message_written.order_id[order_put_message_at]); order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 8 -> assert(order_put_message_read.price[order_put_message_at] == order_put_message_written.price[order_put_message_at]); order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  order_put_message_at = 0;
  do
  :: order_put_message_at < 4 -> assert(order_put_message_read.quantity[order_put_message_at] == order_put_message_written.quantity[order_put_message_at]); order_put_message_at = order_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Delete Message: 30 bytes ------------------------------------------ */

/* OrderDeleteMessage */
typedef OrderDeleteMessage {
  InstrHeader instr_header;
  byte order_id[8]
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  fill_instr_header(order_delete_message_record.instr_header, order_delete_message_value);
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_id[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  ramp_instr_header(order_delete_message_record.instr_header, order_delete_message_base + 0);
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_id[order_delete_message_at] = (order_delete_message_base + 22 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 30 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  encode_instr_header(order_delete_message_record.instr_header);
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.order_id[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 30 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  decode_instr_header(order_delete_message_record.instr_header);
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_id[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  equal_instr_header(order_delete_message_read.instr_header, order_delete_message_written.instr_header);
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.order_id[order_delete_message_at] == order_delete_message_written.order_id[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Implied Order Update Message: 46 bytes ---------------------------------- */

/* ImpliedOrderUpdateMessage */
typedef ImpliedOrderUpdateMessage {
  InstrHeader instr_header;
  byte best_price[8];
  byte next_price[8];
  byte best_qty[4];
  byte next_qty[4]
};

int implied_order_update_message_at;

/* every byte of Implied Order Update Message set to one value */
inline fill_implied_order_update_message(implied_order_update_message_record, implied_order_update_message_value) {
  fill_instr_header(implied_order_update_message_record.instr_header, implied_order_update_message_value);
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> implied_order_update_message_record.best_price[implied_order_update_message_at] = implied_order_update_message_value; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> implied_order_update_message_record.next_price[implied_order_update_message_at] = implied_order_update_message_value; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> implied_order_update_message_record.best_qty[implied_order_update_message_at] = implied_order_update_message_value; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> implied_order_update_message_record.next_qty[implied_order_update_message_at] = implied_order_update_message_value; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Implied Order Update Message set to where it lies, so a field read out of place says so */
inline ramp_implied_order_update_message(implied_order_update_message_record, implied_order_update_message_base) {
  ramp_instr_header(implied_order_update_message_record.instr_header, implied_order_update_message_base + 0);
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> implied_order_update_message_record.best_price[implied_order_update_message_at] = (implied_order_update_message_base + 22 + implied_order_update_message_at + 1) % 256; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> implied_order_update_message_record.next_price[implied_order_update_message_at] = (implied_order_update_message_base + 30 + implied_order_update_message_at + 1) % 256; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> implied_order_update_message_record.best_qty[implied_order_update_message_at] = (implied_order_update_message_base + 38 + implied_order_update_message_at + 1) % 256; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> implied_order_update_message_record.next_qty[implied_order_update_message_at] = (implied_order_update_message_base + 42 + implied_order_update_message_at + 1) % 256; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Update Message to the wire, 46 bytes from where the cursor stands */
inline encode_implied_order_update_message(implied_order_update_message_record) {
  encode_instr_header(implied_order_update_message_record.instr_header);
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> wire[at] = implied_order_update_message_record.best_price[implied_order_update_message_at]; at = at + 1; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> wire[at] = implied_order_update_message_record.next_price[implied_order_update_message_at]; at = at + 1; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> wire[at] = implied_order_update_message_record.best_qty[implied_order_update_message_at]; at = at + 1; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> wire[at] = implied_order_update_message_record.next_qty[implied_order_update_message_at]; at = at + 1; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Update Message off the wire, 46 bytes from where the cursor stands */
inline decode_implied_order_update_message(implied_order_update_message_record) {
  decode_instr_header(implied_order_update_message_record.instr_header);
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> implied_order_update_message_record.best_price[implied_order_update_message_at] = wire[at]; at = at + 1; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> implied_order_update_message_record.next_price[implied_order_update_message_at] = wire[at]; at = at + 1; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> implied_order_update_message_record.best_qty[implied_order_update_message_at] = wire[at]; at = at + 1; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> implied_order_update_message_record.next_qty[implied_order_update_message_at] = wire[at]; at = at + 1; implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Implied Order Update Message is what was written, byte for byte */
inline equal_implied_order_update_message(implied_order_update_message_read, implied_order_update_message_written) {
  equal_instr_header(implied_order_update_message_read.instr_header, implied_order_update_message_written.instr_header);
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> assert(implied_order_update_message_read.best_price[implied_order_update_message_at] == implied_order_update_message_written.best_price[implied_order_update_message_at]); implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 8 -> assert(implied_order_update_message_read.next_price[implied_order_update_message_at] == implied_order_update_message_written.next_price[implied_order_update_message_at]); implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> assert(implied_order_update_message_read.best_qty[implied_order_update_message_at] == implied_order_update_message_written.best_qty[implied_order_update_message_at]); implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  implied_order_update_message_at = 0;
  do
  :: implied_order_update_message_at < 4 -> assert(implied_order_update_message_read.next_qty[implied_order_update_message_at] == implied_order_update_message_written.next_qty[implied_order_update_message_at]); implied_order_update_message_at = implied_order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Summary Message: 58 bytes ----------------------------------------- */

/* TradeSummaryMessage */
typedef TradeSummaryMessage {
  InstrHeader instr_header;
  byte aggressor_order_id[8];
  byte aggressor_receive_time[8];
  byte vwap_price[8];
  byte deepest_price[8];
  byte quantity[4]
};

int trade_summary_message_at;

/* every byte of Trade Summary Message set to one value */
inline fill_trade_summary_message(trade_summary_message_record, trade_summary_message_value) {
  fill_instr_header(trade_summary_message_record.instr_header, trade_summary_message_value);
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.aggressor_order_id[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.aggressor_receive_time[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.vwap_price[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.deepest_price[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 4 -> trade_summary_message_record.quantity[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Summary Message set to where it lies, so a field read out of place says so */
inline ramp_trade_summary_message(trade_summary_message_record, trade_summary_message_base) {
  ramp_instr_header(trade_summary_message_record.instr_header, trade_summary_message_base + 0);
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.aggressor_order_id[trade_summary_message_at] = (trade_summary_message_base + 22 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.aggressor_receive_time[trade_summary_message_at] = (trade_summary_message_base + 30 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.vwap_price[trade_summary_message_at] = (trade_summary_message_base + 38 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.deepest_price[trade_summary_message_at] = (trade_summary_message_base + 46 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 4 -> trade_summary_message_record.quantity[trade_summary_message_at] = (trade_summary_message_base + 54 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Summary Message to the wire, 58 bytes from where the cursor stands */
inline encode_trade_summary_message(trade_summary_message_record) {
  encode_instr_header(trade_summary_message_record.instr_header);
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.aggressor_order_id[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.aggressor_receive_time[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.vwap_price[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.deepest_price[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 4 -> wire[at] = trade_summary_message_record.quantity[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Summary Message off the wire, 58 bytes from where the cursor stands */
inline decode_trade_summary_message(trade_summary_message_record) {
  decode_instr_header(trade_summary_message_record.instr_header);
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.aggressor_order_id[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.aggressor_receive_time[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.vwap_price[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.deepest_price[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 4 -> trade_summary_message_record.quantity[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Summary Message is what was written, byte for byte */
inline equal_trade_summary_message(trade_summary_message_read, trade_summary_message_written) {
  equal_instr_header(trade_summary_message_read.instr_header, trade_summary_message_written.instr_header);
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.aggressor_order_id[trade_summary_message_at] == trade_summary_message_written.aggressor_order_id[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.aggressor_receive_time[trade_summary_message_at] == trade_summary_message_written.aggressor_receive_time[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.vwap_price[trade_summary_message_at] == trade_summary_message_written.vwap_price[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.deepest_price[trade_summary_message_at] == trade_summary_message_written.deepest_price[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 4 -> assert(trade_summary_message_read.quantity[trade_summary_message_at] == trade_summary_message_written.quantity[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 58 bytes ------------------------------------------------- */

/* TradeMessage */
typedef TradeMessage {
  InstrHeader instr_header;
  byte match_id[8];
  byte buy_order_id[8];
  byte sell_order_id[8];
  byte price[8];
  byte quantity[4]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  fill_instr_header(trade_message_record.instr_header, trade_message_value);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.buy_order_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.sell_order_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  ramp_instr_header(trade_message_record.instr_header, trade_message_base + 0);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_id[trade_message_at] = (trade_message_base + 22 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.buy_order_id[trade_message_at] = (trade_message_base + 30 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.sell_order_id[trade_message_at] = (trade_message_base + 38 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = (trade_message_base + 46 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = (trade_message_base + 54 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 58 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  encode_instr_header(trade_message_record.instr_header);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.match_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.buy_order_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.sell_order_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 58 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  decode_instr_header(trade_message_record.instr_header);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.buy_order_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.sell_order_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  equal_instr_header(trade_message_read.instr_header, trade_message_written.instr_header);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.match_id[trade_message_at] == trade_message_written.match_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.buy_order_id[trade_message_at] == trade_message_written.buy_order_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.sell_order_id[trade_message_at] == trade_message_written.sell_order_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.quantity[trade_message_at] == trade_message_written.quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Amend Message: 62 bytes ------------------------------------------- */

/* TradeAmendMessage */
typedef TradeAmendMessage {
  InstrHeader instr_header;
  byte match_id[8];
  byte buy_order_id[8];
  byte sell_order_id[8];
  byte old_price[8];
  byte new_price[8]
};

int trade_amend_message_at;

/* every byte of Trade Amend Message set to one value */
inline fill_trade_amend_message(trade_amend_message_record, trade_amend_message_value) {
  fill_instr_header(trade_amend_message_record.instr_header, trade_amend_message_value);
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.match_id[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.buy_order_id[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.sell_order_id[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.old_price[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.new_price[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Amend Message set to where it lies, so a field read out of place says so */
inline ramp_trade_amend_message(trade_amend_message_record, trade_amend_message_base) {
  ramp_instr_header(trade_amend_message_record.instr_header, trade_amend_message_base + 0);
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.match_id[trade_amend_message_at] = (trade_amend_message_base + 22 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.buy_order_id[trade_amend_message_at] = (trade_amend_message_base + 30 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.sell_order_id[trade_amend_message_at] = (trade_amend_message_base + 38 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.old_price[trade_amend_message_at] = (trade_amend_message_base + 46 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.new_price[trade_amend_message_at] = (trade_amend_message_base + 54 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Amend Message to the wire, 62 bytes from where the cursor stands */
inline encode_trade_amend_message(trade_amend_message_record) {
  encode_instr_header(trade_amend_message_record.instr_header);
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> wire[at] = trade_amend_message_record.match_id[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> wire[at] = trade_amend_message_record.buy_order_id[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> wire[at] = trade_amend_message_record.sell_order_id[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> wire[at] = trade_amend_message_record.old_price[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> wire[at] = trade_amend_message_record.new_price[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Amend Message off the wire, 62 bytes from where the cursor stands */
inline decode_trade_amend_message(trade_amend_message_record) {
  decode_instr_header(trade_amend_message_record.instr_header);
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.match_id[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.buy_order_id[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.sell_order_id[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.old_price[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.new_price[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Amend Message is what was written, byte for byte */
inline equal_trade_amend_message(trade_amend_message_read, trade_amend_message_written) {
  equal_instr_header(trade_amend_message_read.instr_header, trade_amend_message_written.instr_header);
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> assert(trade_amend_message_read.match_id[trade_amend_message_at] == trade_amend_message_written.match_id[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> assert(trade_amend_message_read.buy_order_id[trade_amend_message_at] == trade_amend_message_written.buy_order_id[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> assert(trade_amend_message_read.sell_order_id[trade_amend_message_at] == trade_amend_message_written.sell_order_id[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> assert(trade_amend_message_read.old_price[trade_amend_message_at] == trade_amend_message_written.old_price[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> assert(trade_amend_message_read.new_price[trade_amend_message_at] == trade_amend_message_written.new_price[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Spread Trade Amend Message: 94 bytes ------------------------------------ */

/* SpreadTradeAmendMessage */
typedef SpreadTradeAmendMessage {
  InstrHeader instr_header;
  byte match_id[8];
  byte buy_order_id[8];
  byte sell_order_id[8];
  byte old_price[8];
  byte new_price[8];
  byte old_leg_1_price[8];
  byte new_leg_1_price[8];
  byte old_leg_2_price[8];
  byte new_leg_2_price[8]
};

int spread_trade_amend_message_at;

/* every byte of Spread Trade Amend Message set to one value */
inline fill_spread_trade_amend_message(spread_trade_amend_message_record, spread_trade_amend_message_value) {
  fill_instr_header(spread_trade_amend_message_record.instr_header, spread_trade_amend_message_value);
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.match_id[spread_trade_amend_message_at] = spread_trade_amend_message_value; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.buy_order_id[spread_trade_amend_message_at] = spread_trade_amend_message_value; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.sell_order_id[spread_trade_amend_message_at] = spread_trade_amend_message_value; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.old_price[spread_trade_amend_message_at] = spread_trade_amend_message_value; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.new_price[spread_trade_amend_message_at] = spread_trade_amend_message_value; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.old_leg_1_price[spread_trade_amend_message_at] = spread_trade_amend_message_value; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.new_leg_1_price[spread_trade_amend_message_at] = spread_trade_amend_message_value; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.old_leg_2_price[spread_trade_amend_message_at] = spread_trade_amend_message_value; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.new_leg_2_price[spread_trade_amend_message_at] = spread_trade_amend_message_value; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spread Trade Amend Message set to where it lies, so a field read out of place says so */
inline ramp_spread_trade_amend_message(spread_trade_amend_message_record, spread_trade_amend_message_base) {
  ramp_instr_header(spread_trade_amend_message_record.instr_header, spread_trade_amend_message_base + 0);
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.match_id[spread_trade_amend_message_at] = (spread_trade_amend_message_base + 22 + spread_trade_amend_message_at + 1) % 256; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.buy_order_id[spread_trade_amend_message_at] = (spread_trade_amend_message_base + 30 + spread_trade_amend_message_at + 1) % 256; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.sell_order_id[spread_trade_amend_message_at] = (spread_trade_amend_message_base + 38 + spread_trade_amend_message_at + 1) % 256; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.old_price[spread_trade_amend_message_at] = (spread_trade_amend_message_base + 46 + spread_trade_amend_message_at + 1) % 256; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.new_price[spread_trade_amend_message_at] = (spread_trade_amend_message_base + 54 + spread_trade_amend_message_at + 1) % 256; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.old_leg_1_price[spread_trade_amend_message_at] = (spread_trade_amend_message_base + 62 + spread_trade_amend_message_at + 1) % 256; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.new_leg_1_price[spread_trade_amend_message_at] = (spread_trade_amend_message_base + 70 + spread_trade_amend_message_at + 1) % 256; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.old_leg_2_price[spread_trade_amend_message_at] = (spread_trade_amend_message_base + 78 + spread_trade_amend_message_at + 1) % 256; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.new_leg_2_price[spread_trade_amend_message_at] = (spread_trade_amend_message_base + 86 + spread_trade_amend_message_at + 1) % 256; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Trade Amend Message to the wire, 94 bytes from where the cursor stands */
inline encode_spread_trade_amend_message(spread_trade_amend_message_record) {
  encode_instr_header(spread_trade_amend_message_record.instr_header);
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> wire[at] = spread_trade_amend_message_record.match_id[spread_trade_amend_message_at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> wire[at] = spread_trade_amend_message_record.buy_order_id[spread_trade_amend_message_at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> wire[at] = spread_trade_amend_message_record.sell_order_id[spread_trade_amend_message_at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> wire[at] = spread_trade_amend_message_record.old_price[spread_trade_amend_message_at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> wire[at] = spread_trade_amend_message_record.new_price[spread_trade_amend_message_at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> wire[at] = spread_trade_amend_message_record.old_leg_1_price[spread_trade_amend_message_at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> wire[at] = spread_trade_amend_message_record.new_leg_1_price[spread_trade_amend_message_at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> wire[at] = spread_trade_amend_message_record.old_leg_2_price[spread_trade_amend_message_at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> wire[at] = spread_trade_amend_message_record.new_leg_2_price[spread_trade_amend_message_at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Trade Amend Message off the wire, 94 bytes from where the cursor stands */
inline decode_spread_trade_amend_message(spread_trade_amend_message_record) {
  decode_instr_header(spread_trade_amend_message_record.instr_header);
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.match_id[spread_trade_amend_message_at] = wire[at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.buy_order_id[spread_trade_amend_message_at] = wire[at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.sell_order_id[spread_trade_amend_message_at] = wire[at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.old_price[spread_trade_amend_message_at] = wire[at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.new_price[spread_trade_amend_message_at] = wire[at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.old_leg_1_price[spread_trade_amend_message_at] = wire[at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.new_leg_1_price[spread_trade_amend_message_at] = wire[at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.old_leg_2_price[spread_trade_amend_message_at] = wire[at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> spread_trade_amend_message_record.new_leg_2_price[spread_trade_amend_message_at] = wire[at]; at = at + 1; spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spread Trade Amend Message is what was written, byte for byte */
inline equal_spread_trade_amend_message(spread_trade_amend_message_read, spread_trade_amend_message_written) {
  equal_instr_header(spread_trade_amend_message_read.instr_header, spread_trade_amend_message_written.instr_header);
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> assert(spread_trade_amend_message_read.match_id[spread_trade_amend_message_at] == spread_trade_amend_message_written.match_id[spread_trade_amend_message_at]); spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> assert(spread_trade_amend_message_read.buy_order_id[spread_trade_amend_message_at] == spread_trade_amend_message_written.buy_order_id[spread_trade_amend_message_at]); spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> assert(spread_trade_amend_message_read.sell_order_id[spread_trade_amend_message_at] == spread_trade_amend_message_written.sell_order_id[spread_trade_amend_message_at]); spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> assert(spread_trade_amend_message_read.old_price[spread_trade_amend_message_at] == spread_trade_amend_message_written.old_price[spread_trade_amend_message_at]); spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> assert(spread_trade_amend_message_read.new_price[spread_trade_amend_message_at] == spread_trade_amend_message_written.new_price[spread_trade_amend_message_at]); spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> assert(spread_trade_amend_message_read.old_leg_1_price[spread_trade_amend_message_at] == spread_trade_amend_message_written.old_leg_1_price[spread_trade_amend_message_at]); spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> assert(spread_trade_amend_message_read.new_leg_1_price[spread_trade_amend_message_at] == spread_trade_amend_message_written.new_leg_1_price[spread_trade_amend_message_at]); spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> assert(spread_trade_amend_message_read.old_leg_2_price[spread_trade_amend_message_at] == spread_trade_amend_message_written.old_leg_2_price[spread_trade_amend_message_at]); spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  spread_trade_amend_message_at = 0;
  do
  :: spread_trade_amend_message_at < 8 -> assert(spread_trade_amend_message_read.new_leg_2_price[spread_trade_amend_message_at] == spread_trade_amend_message_written.new_leg_2_price[spread_trade_amend_message_at]); spread_trade_amend_message_at = spread_trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Bust Message: 46 bytes -------------------------------------------- */

/* TradeBustMessage */
typedef TradeBustMessage {
  InstrHeader instr_header;
  byte match_id[8];
  byte buy_order_id[8];
  byte sell_order_id[8]
};

int trade_bust_message_at;

/* every byte of Trade Bust Message set to one value */
inline fill_trade_bust_message(trade_bust_message_record, trade_bust_message_value) {
  fill_instr_header(trade_bust_message_record.instr_header, trade_bust_message_value);
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.match_id[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.buy_order_id[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.sell_order_id[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Bust Message set to where it lies, so a field read out of place says so */
inline ramp_trade_bust_message(trade_bust_message_record, trade_bust_message_base) {
  ramp_instr_header(trade_bust_message_record.instr_header, trade_bust_message_base + 0);
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.match_id[trade_bust_message_at] = (trade_bust_message_base + 22 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.buy_order_id[trade_bust_message_at] = (trade_bust_message_base + 30 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.sell_order_id[trade_bust_message_at] = (trade_bust_message_base + 38 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message to the wire, 46 bytes from where the cursor stands */
inline encode_trade_bust_message(trade_bust_message_record) {
  encode_instr_header(trade_bust_message_record.instr_header);
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.match_id[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.buy_order_id[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.sell_order_id[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message off the wire, 46 bytes from where the cursor stands */
inline decode_trade_bust_message(trade_bust_message_record) {
  decode_instr_header(trade_bust_message_record.instr_header);
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.match_id[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.buy_order_id[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.sell_order_id[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Bust Message is what was written, byte for byte */
inline equal_trade_bust_message(trade_bust_message_read, trade_bust_message_written) {
  equal_instr_header(trade_bust_message_read.instr_header, trade_bust_message_written.instr_header);
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.match_id[trade_bust_message_at] == trade_bust_message_written.match_id[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.buy_order_id[trade_bust_message_at] == trade_bust_message_written.buy_order_id[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.sell_order_id[trade_bust_message_at] == trade_bust_message_written.sell_order_id[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Stat Message: 31 bytes ------------------------------------------- */

/* MarketStatMessage */
typedef MarketStatMessage {
  InstrHeader instr_header;
  byte price[8];
  byte stat_type
};

int market_stat_message_at;

/* every byte of Market Stat Message set to one value */
inline fill_market_stat_message(market_stat_message_record, market_stat_message_value) {
  fill_instr_header(market_stat_message_record.instr_header, market_stat_message_value);
  market_stat_message_at = 0;
  do
  :: market_stat_message_at < 8 -> market_stat_message_record.price[market_stat_message_at] = market_stat_message_value; market_stat_message_at = market_stat_message_at + 1
  :: else -> break
  od;
  market_stat_message_record.stat_type = market_stat_message_value;
  skip
}

/* each byte of Market Stat Message set to where it lies, so a field read out of place says so */
inline ramp_market_stat_message(market_stat_message_record, market_stat_message_base) {
  ramp_instr_header(market_stat_message_record.instr_header, market_stat_message_base + 0);
  market_stat_message_at = 0;
  do
  :: market_stat_message_at < 8 -> market_stat_message_record.price[market_stat_message_at] = (market_stat_message_base + 22 + market_stat_message_at + 1) % 256; market_stat_message_at = market_stat_message_at + 1
  :: else -> break
  od;
  market_stat_message_record.stat_type = (market_stat_message_base + 30 + 1) % 256;
  skip
}

/* Market Stat Message to the wire, 31 bytes from where the cursor stands */
inline encode_market_stat_message(market_stat_message_record) {
  encode_instr_header(market_stat_message_record.instr_header);
  market_stat_message_at = 0;
  do
  :: market_stat_message_at < 8 -> wire[at] = market_stat_message_record.price[market_stat_message_at]; at = at + 1; market_stat_message_at = market_stat_message_at + 1
  :: else -> break
  od;
  wire[at] = market_stat_message_record.stat_type; at = at + 1;
  skip
}

/* Market Stat Message off the wire, 31 bytes from where the cursor stands */
inline decode_market_stat_message(market_stat_message_record) {
  decode_instr_header(market_stat_message_record.instr_header);
  market_stat_message_at = 0;
  do
  :: market_stat_message_at < 8 -> market_stat_message_record.price[market_stat_message_at] = wire[at]; at = at + 1; market_stat_message_at = market_stat_message_at + 1
  :: else -> break
  od;
  market_stat_message_record.stat_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Stat Message is what was written, byte for byte */
inline equal_market_stat_message(market_stat_message_read, market_stat_message_written) {
  equal_instr_header(market_stat_message_read.instr_header, market_stat_message_written.instr_header);
  market_stat_message_at = 0;
  do
  :: market_stat_message_at < 8 -> assert(market_stat_message_read.price[market_stat_message_at] == market_stat_message_written.price[market_stat_message_at]); market_stat_message_at = market_stat_message_at + 1
  :: else -> break
  od;
  assert(market_stat_message_read.stat_type == market_stat_message_written.stat_type);
  skip
}

/* ---- Trade Session Volume Message: 34 bytes ---------------------------------- */

/* TradeSessionVolumeMessage */
typedef TradeSessionVolumeMessage {
  InstrHeader instr_header;
  byte vwap_price[8];
  byte trade_volume[4]
};

int trade_session_volume_message_at;

/* every byte of Trade Session Volume Message set to one value */
inline fill_trade_session_volume_message(trade_session_volume_message_record, trade_session_volume_message_value) {
  fill_instr_header(trade_session_volume_message_record.instr_header, trade_session_volume_message_value);
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 8 -> trade_session_volume_message_record.vwap_price[trade_session_volume_message_at] = trade_session_volume_message_value; trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 4 -> trade_session_volume_message_record.trade_volume[trade_session_volume_message_at] = trade_session_volume_message_value; trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Session Volume Message set to where it lies, so a field read out of place says so */
inline ramp_trade_session_volume_message(trade_session_volume_message_record, trade_session_volume_message_base) {
  ramp_instr_header(trade_session_volume_message_record.instr_header, trade_session_volume_message_base + 0);
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 8 -> trade_session_volume_message_record.vwap_price[trade_session_volume_message_at] = (trade_session_volume_message_base + 22 + trade_session_volume_message_at + 1) % 256; trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 4 -> trade_session_volume_message_record.trade_volume[trade_session_volume_message_at] = (trade_session_volume_message_base + 30 + trade_session_volume_message_at + 1) % 256; trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Session Volume Message to the wire, 34 bytes from where the cursor stands */
inline encode_trade_session_volume_message(trade_session_volume_message_record) {
  encode_instr_header(trade_session_volume_message_record.instr_header);
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 8 -> wire[at] = trade_session_volume_message_record.vwap_price[trade_session_volume_message_at]; at = at + 1; trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 4 -> wire[at] = trade_session_volume_message_record.trade_volume[trade_session_volume_message_at]; at = at + 1; trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Session Volume Message off the wire, 34 bytes from where the cursor stands */
inline decode_trade_session_volume_message(trade_session_volume_message_record) {
  decode_instr_header(trade_session_volume_message_record.instr_header);
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 8 -> trade_session_volume_message_record.vwap_price[trade_session_volume_message_at] = wire[at]; at = at + 1; trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 4 -> trade_session_volume_message_record.trade_volume[trade_session_volume_message_at] = wire[at]; at = at + 1; trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Session Volume Message is what was written, byte for byte */
inline equal_trade_session_volume_message(trade_session_volume_message_read, trade_session_volume_message_written) {
  equal_instr_header(trade_session_volume_message_read.instr_header, trade_session_volume_message_written.instr_header);
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 8 -> assert(trade_session_volume_message_read.vwap_price[trade_session_volume_message_at] == trade_session_volume_message_written.vwap_price[trade_session_volume_message_at]); trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  trade_session_volume_message_at = 0;
  do
  :: trade_session_volume_message_at < 4 -> assert(trade_session_volume_message_read.trade_volume[trade_session_volume_message_at] == trade_session_volume_message_written.trade_volume[trade_session_volume_message_at]); trade_session_volume_message_at = trade_session_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Interest Message: 26 bytes ----------------------------------------- */

/* OpenInterestMessage */
typedef OpenInterestMessage {
  InstrHeader instr_header;
  byte quantity[4]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  fill_instr_header(open_interest_message_record.instr_header, open_interest_message_value);
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.quantity[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  ramp_instr_header(open_interest_message_record.instr_header, open_interest_message_base + 0);
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.quantity[open_interest_message_at] = (open_interest_message_base + 22 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 26 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  encode_instr_header(open_interest_message_record.instr_header);
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.quantity[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 26 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  decode_instr_header(open_interest_message_record.instr_header);
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.quantity[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  equal_instr_header(open_interest_message_read.instr_header, open_interest_message_written.instr_header);
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.quantity[open_interest_message_at] == open_interest_message_written.quantity[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Outright Instrument Snapshot Message: 114 bytes ---------------- */

/* StartOfOutrightInstrumentSnapshotMessage */
typedef StartOfOutrightInstrumentSnapshotMessage {
  byte snapshot_seq_num[2];
  byte last_instr_seq_num[4];
  byte symbol[24];
  byte product_code[8];
  byte description[32];
  byte price_increment[8];
  byte cfi_code[8];
  byte currency[8];
  byte product_id[4];
  byte contract_size[4];
  byte order_count[4];
  byte first_trading_session_date[2];
  byte last_trading_session_date[2];
  byte trading_session_date[2];
  byte product_group;
  byte trading_status
};

int start_of_outright_instrument_snapshot_message_at;

/* every byte of Start Of Outright Instrument Snapshot Message set to one value */
inline fill_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_record, start_of_outright_instrument_snapshot_message_value) {
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.snapshot_seq_num[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.last_instr_seq_num[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 24 -> start_of_outright_instrument_snapshot_message_record.symbol[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.product_code[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 32 -> start_of_outright_instrument_snapshot_message_record.description[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.price_increment[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.cfi_code[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.currency[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.product_id[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.contract_size[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.order_count[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.first_trading_session_date[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.last_trading_session_date[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.trading_session_date[start_of_outright_instrument_snapshot_message_at] = start_of_outright_instrument_snapshot_message_value; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_record.product_group = start_of_outright_instrument_snapshot_message_value;
  start_of_outright_instrument_snapshot_message_record.trading_status = start_of_outright_instrument_snapshot_message_value;
  skip
}

/* each byte of Start Of Outright Instrument Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_record, start_of_outright_instrument_snapshot_message_base) {
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.snapshot_seq_num[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 0 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.last_instr_seq_num[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 2 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 24 -> start_of_outright_instrument_snapshot_message_record.symbol[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 6 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.product_code[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 30 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 32 -> start_of_outright_instrument_snapshot_message_record.description[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 38 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.price_increment[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 70 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.cfi_code[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 78 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.currency[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 86 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.product_id[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 94 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.contract_size[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 98 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.order_count[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 102 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.first_trading_session_date[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 106 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.last_trading_session_date[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 108 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.trading_session_date[start_of_outright_instrument_snapshot_message_at] = (start_of_outright_instrument_snapshot_message_base + 110 + start_of_outright_instrument_snapshot_message_at + 1) % 256; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_record.product_group = (start_of_outright_instrument_snapshot_message_base + 112 + 1) % 256;
  start_of_outright_instrument_snapshot_message_record.trading_status = (start_of_outright_instrument_snapshot_message_base + 113 + 1) % 256;
  skip
}

/* Start Of Outright Instrument Snapshot Message to the wire, 114 bytes from where the cursor stands */
inline encode_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_record) {
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> wire[at] = start_of_outright_instrument_snapshot_message_record.snapshot_seq_num[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> wire[at] = start_of_outright_instrument_snapshot_message_record.last_instr_seq_num[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 24 -> wire[at] = start_of_outright_instrument_snapshot_message_record.symbol[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> wire[at] = start_of_outright_instrument_snapshot_message_record.product_code[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 32 -> wire[at] = start_of_outright_instrument_snapshot_message_record.description[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> wire[at] = start_of_outright_instrument_snapshot_message_record.price_increment[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> wire[at] = start_of_outright_instrument_snapshot_message_record.cfi_code[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> wire[at] = start_of_outright_instrument_snapshot_message_record.currency[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> wire[at] = start_of_outright_instrument_snapshot_message_record.product_id[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> wire[at] = start_of_outright_instrument_snapshot_message_record.contract_size[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> wire[at] = start_of_outright_instrument_snapshot_message_record.order_count[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> wire[at] = start_of_outright_instrument_snapshot_message_record.first_trading_session_date[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> wire[at] = start_of_outright_instrument_snapshot_message_record.last_trading_session_date[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> wire[at] = start_of_outright_instrument_snapshot_message_record.trading_session_date[start_of_outright_instrument_snapshot_message_at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_outright_instrument_snapshot_message_record.product_group; at = at + 1;
  wire[at] = start_of_outright_instrument_snapshot_message_record.trading_status; at = at + 1;
  skip
}

/* Start Of Outright Instrument Snapshot Message off the wire, 114 bytes from where the cursor stands */
inline decode_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_record) {
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.snapshot_seq_num[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.last_instr_seq_num[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 24 -> start_of_outright_instrument_snapshot_message_record.symbol[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.product_code[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 32 -> start_of_outright_instrument_snapshot_message_record.description[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.price_increment[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.cfi_code[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> start_of_outright_instrument_snapshot_message_record.currency[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.product_id[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.contract_size[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> start_of_outright_instrument_snapshot_message_record.order_count[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.first_trading_session_date[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.last_trading_session_date[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> start_of_outright_instrument_snapshot_message_record.trading_session_date[start_of_outright_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_record.product_group = wire[at]; at = at + 1;
  start_of_outright_instrument_snapshot_message_record.trading_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Start Of Outright Instrument Snapshot Message is what was written, byte for byte */
inline equal_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_read, start_of_outright_instrument_snapshot_message_written) {
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> assert(start_of_outright_instrument_snapshot_message_read.snapshot_seq_num[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.snapshot_seq_num[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> assert(start_of_outright_instrument_snapshot_message_read.last_instr_seq_num[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.last_instr_seq_num[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 24 -> assert(start_of_outright_instrument_snapshot_message_read.symbol[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.symbol[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> assert(start_of_outright_instrument_snapshot_message_read.product_code[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.product_code[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 32 -> assert(start_of_outright_instrument_snapshot_message_read.description[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.description[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> assert(start_of_outright_instrument_snapshot_message_read.price_increment[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.price_increment[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> assert(start_of_outright_instrument_snapshot_message_read.cfi_code[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.cfi_code[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 8 -> assert(start_of_outright_instrument_snapshot_message_read.currency[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.currency[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> assert(start_of_outright_instrument_snapshot_message_read.product_id[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.product_id[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> assert(start_of_outright_instrument_snapshot_message_read.contract_size[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.contract_size[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 4 -> assert(start_of_outright_instrument_snapshot_message_read.order_count[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.order_count[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> assert(start_of_outright_instrument_snapshot_message_read.first_trading_session_date[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.first_trading_session_date[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> assert(start_of_outright_instrument_snapshot_message_read.last_trading_session_date[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.last_trading_session_date[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_outright_instrument_snapshot_message_at = 0;
  do
  :: start_of_outright_instrument_snapshot_message_at < 2 -> assert(start_of_outright_instrument_snapshot_message_read.trading_session_date[start_of_outright_instrument_snapshot_message_at] == start_of_outright_instrument_snapshot_message_written.trading_session_date[start_of_outright_instrument_snapshot_message_at]); start_of_outright_instrument_snapshot_message_at = start_of_outright_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  assert(start_of_outright_instrument_snapshot_message_read.product_group == start_of_outright_instrument_snapshot_message_written.product_group);
  assert(start_of_outright_instrument_snapshot_message_read.trading_status == start_of_outright_instrument_snapshot_message_written.trading_status);
  skip
}

/* ---- Start Of Spread Instrument Snapshot Message: 123 bytes ------------------ */

/* StartOfSpreadInstrumentSnapshotMessage */
typedef StartOfSpreadInstrumentSnapshotMessage {
  byte snapshot_seq_num[2];
  byte last_instr_seq_num[4];
  byte symbol[24];
  byte product_code[8];
  byte description[32];
  byte price_increment[8];
  byte cfi_code[8];
  byte currency[8];
  byte product_id[4];
  byte contract_size[4];
  byte order_count[4];
  byte first_trading_session_date[2];
  byte last_trading_session_date[2];
  byte trading_session_date[2];
  byte product_group;
  byte trading_status;
  byte leg_1_instrument_id[4];
  byte leg_2_instrument_id[4];
  byte spread_buy_convention
};

int start_of_spread_instrument_snapshot_message_at;

/* every byte of Start Of Spread Instrument Snapshot Message set to one value */
inline fill_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_record, start_of_spread_instrument_snapshot_message_value) {
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.snapshot_seq_num[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.last_instr_seq_num[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 24 -> start_of_spread_instrument_snapshot_message_record.symbol[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.product_code[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 32 -> start_of_spread_instrument_snapshot_message_record.description[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.price_increment[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.cfi_code[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.currency[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.product_id[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.contract_size[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.order_count[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.first_trading_session_date[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.last_trading_session_date[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.trading_session_date[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_record.product_group = start_of_spread_instrument_snapshot_message_value;
  start_of_spread_instrument_snapshot_message_record.trading_status = start_of_spread_instrument_snapshot_message_value;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.leg_1_instrument_id[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.leg_2_instrument_id[start_of_spread_instrument_snapshot_message_at] = start_of_spread_instrument_snapshot_message_value; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_record.spread_buy_convention = start_of_spread_instrument_snapshot_message_value;
  skip
}

/* each byte of Start Of Spread Instrument Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_record, start_of_spread_instrument_snapshot_message_base) {
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.snapshot_seq_num[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 0 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.last_instr_seq_num[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 2 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 24 -> start_of_spread_instrument_snapshot_message_record.symbol[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 6 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.product_code[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 30 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 32 -> start_of_spread_instrument_snapshot_message_record.description[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 38 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.price_increment[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 70 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.cfi_code[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 78 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.currency[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 86 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.product_id[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 94 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.contract_size[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 98 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.order_count[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 102 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.first_trading_session_date[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 106 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.last_trading_session_date[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 108 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.trading_session_date[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 110 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_record.product_group = (start_of_spread_instrument_snapshot_message_base + 112 + 1) % 256;
  start_of_spread_instrument_snapshot_message_record.trading_status = (start_of_spread_instrument_snapshot_message_base + 113 + 1) % 256;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.leg_1_instrument_id[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 114 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.leg_2_instrument_id[start_of_spread_instrument_snapshot_message_at] = (start_of_spread_instrument_snapshot_message_base + 118 + start_of_spread_instrument_snapshot_message_at + 1) % 256; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_record.spread_buy_convention = (start_of_spread_instrument_snapshot_message_base + 122 + 1) % 256;
  skip
}

/* Start Of Spread Instrument Snapshot Message to the wire, 123 bytes from where the cursor stands */
inline encode_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_record) {
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> wire[at] = start_of_spread_instrument_snapshot_message_record.snapshot_seq_num[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> wire[at] = start_of_spread_instrument_snapshot_message_record.last_instr_seq_num[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 24 -> wire[at] = start_of_spread_instrument_snapshot_message_record.symbol[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> wire[at] = start_of_spread_instrument_snapshot_message_record.product_code[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 32 -> wire[at] = start_of_spread_instrument_snapshot_message_record.description[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> wire[at] = start_of_spread_instrument_snapshot_message_record.price_increment[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> wire[at] = start_of_spread_instrument_snapshot_message_record.cfi_code[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> wire[at] = start_of_spread_instrument_snapshot_message_record.currency[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> wire[at] = start_of_spread_instrument_snapshot_message_record.product_id[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> wire[at] = start_of_spread_instrument_snapshot_message_record.contract_size[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> wire[at] = start_of_spread_instrument_snapshot_message_record.order_count[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> wire[at] = start_of_spread_instrument_snapshot_message_record.first_trading_session_date[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> wire[at] = start_of_spread_instrument_snapshot_message_record.last_trading_session_date[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> wire[at] = start_of_spread_instrument_snapshot_message_record.trading_session_date[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_spread_instrument_snapshot_message_record.product_group; at = at + 1;
  wire[at] = start_of_spread_instrument_snapshot_message_record.trading_status; at = at + 1;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> wire[at] = start_of_spread_instrument_snapshot_message_record.leg_1_instrument_id[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> wire[at] = start_of_spread_instrument_snapshot_message_record.leg_2_instrument_id[start_of_spread_instrument_snapshot_message_at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_spread_instrument_snapshot_message_record.spread_buy_convention; at = at + 1;
  skip
}

/* Start Of Spread Instrument Snapshot Message off the wire, 123 bytes from where the cursor stands */
inline decode_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_record) {
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.snapshot_seq_num[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.last_instr_seq_num[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 24 -> start_of_spread_instrument_snapshot_message_record.symbol[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.product_code[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 32 -> start_of_spread_instrument_snapshot_message_record.description[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.price_increment[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.cfi_code[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> start_of_spread_instrument_snapshot_message_record.currency[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.product_id[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.contract_size[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.order_count[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.first_trading_session_date[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.last_trading_session_date[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> start_of_spread_instrument_snapshot_message_record.trading_session_date[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_record.product_group = wire[at]; at = at + 1;
  start_of_spread_instrument_snapshot_message_record.trading_status = wire[at]; at = at + 1;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.leg_1_instrument_id[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> start_of_spread_instrument_snapshot_message_record.leg_2_instrument_id[start_of_spread_instrument_snapshot_message_at] = wire[at]; at = at + 1; start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_record.spread_buy_convention = wire[at]; at = at + 1;
  skip
}

/* what was read of Start Of Spread Instrument Snapshot Message is what was written, byte for byte */
inline equal_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_read, start_of_spread_instrument_snapshot_message_written) {
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> assert(start_of_spread_instrument_snapshot_message_read.snapshot_seq_num[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.snapshot_seq_num[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> assert(start_of_spread_instrument_snapshot_message_read.last_instr_seq_num[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.last_instr_seq_num[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 24 -> assert(start_of_spread_instrument_snapshot_message_read.symbol[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.symbol[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> assert(start_of_spread_instrument_snapshot_message_read.product_code[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.product_code[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 32 -> assert(start_of_spread_instrument_snapshot_message_read.description[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.description[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> assert(start_of_spread_instrument_snapshot_message_read.price_increment[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.price_increment[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> assert(start_of_spread_instrument_snapshot_message_read.cfi_code[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.cfi_code[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 8 -> assert(start_of_spread_instrument_snapshot_message_read.currency[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.currency[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> assert(start_of_spread_instrument_snapshot_message_read.product_id[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.product_id[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> assert(start_of_spread_instrument_snapshot_message_read.contract_size[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.contract_size[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> assert(start_of_spread_instrument_snapshot_message_read.order_count[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.order_count[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> assert(start_of_spread_instrument_snapshot_message_read.first_trading_session_date[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.first_trading_session_date[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> assert(start_of_spread_instrument_snapshot_message_read.last_trading_session_date[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.last_trading_session_date[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 2 -> assert(start_of_spread_instrument_snapshot_message_read.trading_session_date[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.trading_session_date[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  assert(start_of_spread_instrument_snapshot_message_read.product_group == start_of_spread_instrument_snapshot_message_written.product_group);
  assert(start_of_spread_instrument_snapshot_message_read.trading_status == start_of_spread_instrument_snapshot_message_written.trading_status);
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> assert(start_of_spread_instrument_snapshot_message_read.leg_1_instrument_id[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.leg_1_instrument_id[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_spread_instrument_snapshot_message_at = 0;
  do
  :: start_of_spread_instrument_snapshot_message_at < 4 -> assert(start_of_spread_instrument_snapshot_message_read.leg_2_instrument_id[start_of_spread_instrument_snapshot_message_at] == start_of_spread_instrument_snapshot_message_written.leg_2_instrument_id[start_of_spread_instrument_snapshot_message_at]); start_of_spread_instrument_snapshot_message_at = start_of_spread_instrument_snapshot_message_at + 1
  :: else -> break
  od;
  assert(start_of_spread_instrument_snapshot_message_read.spread_buy_convention == start_of_spread_instrument_snapshot_message_written.spread_buy_convention);
  skip
}

/* ---- Order Snapshot Message: 30 bytes ---------------------------------------- */

/* OrderSnapshotMessage */
typedef OrderSnapshotMessage {
  byte snapshot_seq_num[2];
  byte quantity[4];
  byte transact_time[8];
  byte order_id[8];
  byte price[8]
};

int order_snapshot_message_at;

/* every byte of Order Snapshot Message set to one value */
inline fill_order_snapshot_message(order_snapshot_message_record, order_snapshot_message_value) {
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 2 -> order_snapshot_message_record.snapshot_seq_num[order_snapshot_message_at] = order_snapshot_message_value; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 4 -> order_snapshot_message_record.quantity[order_snapshot_message_at] = order_snapshot_message_value; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> order_snapshot_message_record.transact_time[order_snapshot_message_at] = order_snapshot_message_value; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> order_snapshot_message_record.order_id[order_snapshot_message_at] = order_snapshot_message_value; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> order_snapshot_message_record.price[order_snapshot_message_at] = order_snapshot_message_value; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_order_snapshot_message(order_snapshot_message_record, order_snapshot_message_base) {
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 2 -> order_snapshot_message_record.snapshot_seq_num[order_snapshot_message_at] = (order_snapshot_message_base + 0 + order_snapshot_message_at + 1) % 256; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 4 -> order_snapshot_message_record.quantity[order_snapshot_message_at] = (order_snapshot_message_base + 2 + order_snapshot_message_at + 1) % 256; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> order_snapshot_message_record.transact_time[order_snapshot_message_at] = (order_snapshot_message_base + 6 + order_snapshot_message_at + 1) % 256; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> order_snapshot_message_record.order_id[order_snapshot_message_at] = (order_snapshot_message_base + 14 + order_snapshot_message_at + 1) % 256; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> order_snapshot_message_record.price[order_snapshot_message_at] = (order_snapshot_message_base + 22 + order_snapshot_message_at + 1) % 256; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Snapshot Message to the wire, 30 bytes from where the cursor stands */
inline encode_order_snapshot_message(order_snapshot_message_record) {
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 2 -> wire[at] = order_snapshot_message_record.snapshot_seq_num[order_snapshot_message_at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 4 -> wire[at] = order_snapshot_message_record.quantity[order_snapshot_message_at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> wire[at] = order_snapshot_message_record.transact_time[order_snapshot_message_at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> wire[at] = order_snapshot_message_record.order_id[order_snapshot_message_at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> wire[at] = order_snapshot_message_record.price[order_snapshot_message_at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Snapshot Message off the wire, 30 bytes from where the cursor stands */
inline decode_order_snapshot_message(order_snapshot_message_record) {
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 2 -> order_snapshot_message_record.snapshot_seq_num[order_snapshot_message_at] = wire[at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 4 -> order_snapshot_message_record.quantity[order_snapshot_message_at] = wire[at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> order_snapshot_message_record.transact_time[order_snapshot_message_at] = wire[at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> order_snapshot_message_record.order_id[order_snapshot_message_at] = wire[at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> order_snapshot_message_record.price[order_snapshot_message_at] = wire[at]; at = at + 1; order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Snapshot Message is what was written, byte for byte */
inline equal_order_snapshot_message(order_snapshot_message_read, order_snapshot_message_written) {
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 2 -> assert(order_snapshot_message_read.snapshot_seq_num[order_snapshot_message_at] == order_snapshot_message_written.snapshot_seq_num[order_snapshot_message_at]); order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 4 -> assert(order_snapshot_message_read.quantity[order_snapshot_message_at] == order_snapshot_message_written.quantity[order_snapshot_message_at]); order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> assert(order_snapshot_message_read.transact_time[order_snapshot_message_at] == order_snapshot_message_written.transact_time[order_snapshot_message_at]); order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> assert(order_snapshot_message_read.order_id[order_snapshot_message_at] == order_snapshot_message_written.order_id[order_snapshot_message_at]); order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  order_snapshot_message_at = 0;
  do
  :: order_snapshot_message_at < 8 -> assert(order_snapshot_message_read.price[order_snapshot_message_at] == order_snapshot_message_written.price[order_snapshot_message_at]); order_snapshot_message_at = order_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmit Request Message: 9 bytes ------------------------------------- */

/* RetransmitRequestMessage */
typedef RetransmitRequestMessage {
  byte begin_seq_num[8];
  byte message_count
};

int retransmit_request_message_at;

/* every byte of Retransmit Request Message set to one value */
inline fill_retransmit_request_message(retransmit_request_message_record, retransmit_request_message_value) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.begin_seq_num[retransmit_request_message_at] = retransmit_request_message_value; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_record.message_count = retransmit_request_message_value;
  skip
}

/* each byte of Retransmit Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmit_request_message(retransmit_request_message_record, retransmit_request_message_base) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.begin_seq_num[retransmit_request_message_at] = (retransmit_request_message_base + 0 + retransmit_request_message_at + 1) % 256; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_record.message_count = (retransmit_request_message_base + 8 + 1) % 256;
  skip
}

/* Retransmit Request Message to the wire, 9 bytes from where the cursor stands */
inline encode_retransmit_request_message(retransmit_request_message_record) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> wire[at] = retransmit_request_message_record.begin_seq_num[retransmit_request_message_at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmit_request_message_record.message_count; at = at + 1;
  skip
}

/* Retransmit Request Message off the wire, 9 bytes from where the cursor stands */
inline decode_retransmit_request_message(retransmit_request_message_record) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.begin_seq_num[retransmit_request_message_at] = wire[at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_record.message_count = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmit Request Message is what was written, byte for byte */
inline equal_retransmit_request_message(retransmit_request_message_read, retransmit_request_message_written) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> assert(retransmit_request_message_read.begin_seq_num[retransmit_request_message_at] == retransmit_request_message_written.begin_seq_num[retransmit_request_message_at]); retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  assert(retransmit_request_message_read.message_count == retransmit_request_message_written.message_count);
  skip
}

/* ---- Retransmit Reject Message: 49 bytes ------------------------------------- */

/* RetransmitRejectMessage */
typedef RetransmitRejectMessage {
  byte retry_delay_nanos[8];
  byte details[40];
  byte reason
};

int retransmit_reject_message_at;

/* every byte of Retransmit Reject Message set to one value */
inline fill_retransmit_reject_message(retransmit_reject_message_record, retransmit_reject_message_value) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> retransmit_reject_message_record.retry_delay_nanos[retransmit_reject_message_at] = retransmit_reject_message_value; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> retransmit_reject_message_record.details[retransmit_reject_message_at] = retransmit_reject_message_value; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_record.reason = retransmit_reject_message_value;
  skip
}

/* each byte of Retransmit Reject Message set to where it lies, so a field read out of place says so */
inline ramp_retransmit_reject_message(retransmit_reject_message_record, retransmit_reject_message_base) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> retransmit_reject_message_record.retry_delay_nanos[retransmit_reject_message_at] = (retransmit_reject_message_base + 0 + retransmit_reject_message_at + 1) % 256; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> retransmit_reject_message_record.details[retransmit_reject_message_at] = (retransmit_reject_message_base + 8 + retransmit_reject_message_at + 1) % 256; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_record.reason = (retransmit_reject_message_base + 48 + 1) % 256;
  skip
}

/* Retransmit Reject Message to the wire, 49 bytes from where the cursor stands */
inline encode_retransmit_reject_message(retransmit_reject_message_record) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> wire[at] = retransmit_reject_message_record.retry_delay_nanos[retransmit_reject_message_at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> wire[at] = retransmit_reject_message_record.details[retransmit_reject_message_at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmit_reject_message_record.reason; at = at + 1;
  skip
}

/* Retransmit Reject Message off the wire, 49 bytes from where the cursor stands */
inline decode_retransmit_reject_message(retransmit_reject_message_record) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> retransmit_reject_message_record.retry_delay_nanos[retransmit_reject_message_at] = wire[at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> retransmit_reject_message_record.details[retransmit_reject_message_at] = wire[at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmit Reject Message is what was written, byte for byte */
inline equal_retransmit_reject_message(retransmit_reject_message_read, retransmit_reject_message_written) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> assert(retransmit_reject_message_read.retry_delay_nanos[retransmit_reject_message_at] == retransmit_reject_message_written.retry_delay_nanos[retransmit_reject_message_at]); retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> assert(retransmit_reject_message_read.details[retransmit_reject_message_at] == retransmit_reject_message_written.details[retransmit_reject_message_at]); retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  assert(retransmit_reject_message_read.reason == retransmit_reject_message_written.reason);
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
    assert(at == 10);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 10);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Instr Header: encoded, read back, and compared */
proctype check_instr_header() {
  InstrHeader instr_header_sent;
  InstrHeader instr_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instr_header(instr_header_sent, 0)
  :: pattern == 1 -> fill_instr_header(instr_header_sent, 32)
  :: pattern == 2 -> fill_instr_header(instr_header_sent, 255)
  :: else -> ramp_instr_header(instr_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instr_header(instr_header_sent);
    assert(at == 22);
    at = 0;
    decode_instr_header(instr_header_got);
    assert(at == 22);
    equal_instr_header(instr_header_got, instr_header_sent)
  }
}

/* Trading Status Update Message: encoded, read back, and compared */
proctype check_trading_status_update_message() {
  TradingStatusUpdateMessage trading_status_update_message_sent;
  TradingStatusUpdateMessage trading_status_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_update_message(trading_status_update_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_update_message(trading_status_update_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_update_message(trading_status_update_message_sent, 255)
  :: else -> ramp_trading_status_update_message(trading_status_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_update_message(trading_status_update_message_sent);
    assert(at == 39);
    at = 0;
    decode_trading_status_update_message(trading_status_update_message_got);
    assert(at == 39);
    equal_trading_status_update_message(trading_status_update_message_got, trading_status_update_message_sent)
  }
}

/* Order Put Message: encoded, read back, and compared */
proctype check_order_put_message() {
  OrderPutMessage order_put_message_sent;
  OrderPutMessage order_put_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_put_message(order_put_message_sent, 0)
  :: pattern == 1 -> fill_order_put_message(order_put_message_sent, 32)
  :: pattern == 2 -> fill_order_put_message(order_put_message_sent, 255)
  :: else -> ramp_order_put_message(order_put_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_put_message(order_put_message_sent);
    assert(at == 42);
    at = 0;
    decode_order_put_message(order_put_message_got);
    assert(at == 42);
    equal_order_put_message(order_put_message_got, order_put_message_sent)
  }
}

/* Order Delete Message: encoded, read back, and compared */
proctype check_order_delete_message() {
  OrderDeleteMessage order_delete_message_sent;
  OrderDeleteMessage order_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete_message(order_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_delete_message(order_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_delete_message(order_delete_message_sent, 255)
  :: else -> ramp_order_delete_message(order_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete_message(order_delete_message_sent);
    assert(at == 30);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 30);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Implied Order Update Message: encoded, read back, and compared */
proctype check_implied_order_update_message() {
  ImpliedOrderUpdateMessage implied_order_update_message_sent;
  ImpliedOrderUpdateMessage implied_order_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_implied_order_update_message(implied_order_update_message_sent, 0)
  :: pattern == 1 -> fill_implied_order_update_message(implied_order_update_message_sent, 32)
  :: pattern == 2 -> fill_implied_order_update_message(implied_order_update_message_sent, 255)
  :: else -> ramp_implied_order_update_message(implied_order_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_implied_order_update_message(implied_order_update_message_sent);
    assert(at == 46);
    at = 0;
    decode_implied_order_update_message(implied_order_update_message_got);
    assert(at == 46);
    equal_implied_order_update_message(implied_order_update_message_got, implied_order_update_message_sent)
  }
}

/* Trade Summary Message: encoded, read back, and compared */
proctype check_trade_summary_message() {
  TradeSummaryMessage trade_summary_message_sent;
  TradeSummaryMessage trade_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_summary_message(trade_summary_message_sent, 0)
  :: pattern == 1 -> fill_trade_summary_message(trade_summary_message_sent, 32)
  :: pattern == 2 -> fill_trade_summary_message(trade_summary_message_sent, 255)
  :: else -> ramp_trade_summary_message(trade_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_summary_message(trade_summary_message_sent);
    assert(at == 58);
    at = 0;
    decode_trade_summary_message(trade_summary_message_got);
    assert(at == 58);
    equal_trade_summary_message(trade_summary_message_got, trade_summary_message_sent)
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
    assert(at == 58);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 58);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Trade Amend Message: encoded, read back, and compared */
proctype check_trade_amend_message() {
  TradeAmendMessage trade_amend_message_sent;
  TradeAmendMessage trade_amend_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_amend_message(trade_amend_message_sent, 0)
  :: pattern == 1 -> fill_trade_amend_message(trade_amend_message_sent, 32)
  :: pattern == 2 -> fill_trade_amend_message(trade_amend_message_sent, 255)
  :: else -> ramp_trade_amend_message(trade_amend_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_amend_message(trade_amend_message_sent);
    assert(at == 62);
    at = 0;
    decode_trade_amend_message(trade_amend_message_got);
    assert(at == 62);
    equal_trade_amend_message(trade_amend_message_got, trade_amend_message_sent)
  }
}

/* Spread Trade Amend Message: encoded, read back, and compared */
proctype check_spread_trade_amend_message() {
  SpreadTradeAmendMessage spread_trade_amend_message_sent;
  SpreadTradeAmendMessage spread_trade_amend_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spread_trade_amend_message(spread_trade_amend_message_sent, 0)
  :: pattern == 1 -> fill_spread_trade_amend_message(spread_trade_amend_message_sent, 32)
  :: pattern == 2 -> fill_spread_trade_amend_message(spread_trade_amend_message_sent, 255)
  :: else -> ramp_spread_trade_amend_message(spread_trade_amend_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spread_trade_amend_message(spread_trade_amend_message_sent);
    assert(at == 94);
    at = 0;
    decode_spread_trade_amend_message(spread_trade_amend_message_got);
    assert(at == 94);
    equal_spread_trade_amend_message(spread_trade_amend_message_got, spread_trade_amend_message_sent)
  }
}

/* Trade Bust Message: encoded, read back, and compared */
proctype check_trade_bust_message() {
  TradeBustMessage trade_bust_message_sent;
  TradeBustMessage trade_bust_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_bust_message(trade_bust_message_sent, 0)
  :: pattern == 1 -> fill_trade_bust_message(trade_bust_message_sent, 32)
  :: pattern == 2 -> fill_trade_bust_message(trade_bust_message_sent, 255)
  :: else -> ramp_trade_bust_message(trade_bust_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_bust_message(trade_bust_message_sent);
    assert(at == 46);
    at = 0;
    decode_trade_bust_message(trade_bust_message_got);
    assert(at == 46);
    equal_trade_bust_message(trade_bust_message_got, trade_bust_message_sent)
  }
}

/* Market Stat Message: encoded, read back, and compared */
proctype check_market_stat_message() {
  MarketStatMessage market_stat_message_sent;
  MarketStatMessage market_stat_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_stat_message(market_stat_message_sent, 0)
  :: pattern == 1 -> fill_market_stat_message(market_stat_message_sent, 32)
  :: pattern == 2 -> fill_market_stat_message(market_stat_message_sent, 255)
  :: else -> ramp_market_stat_message(market_stat_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_stat_message(market_stat_message_sent);
    assert(at == 31);
    at = 0;
    decode_market_stat_message(market_stat_message_got);
    assert(at == 31);
    equal_market_stat_message(market_stat_message_got, market_stat_message_sent)
  }
}

/* Trade Session Volume Message: encoded, read back, and compared */
proctype check_trade_session_volume_message() {
  TradeSessionVolumeMessage trade_session_volume_message_sent;
  TradeSessionVolumeMessage trade_session_volume_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_session_volume_message(trade_session_volume_message_sent, 0)
  :: pattern == 1 -> fill_trade_session_volume_message(trade_session_volume_message_sent, 32)
  :: pattern == 2 -> fill_trade_session_volume_message(trade_session_volume_message_sent, 255)
  :: else -> ramp_trade_session_volume_message(trade_session_volume_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_session_volume_message(trade_session_volume_message_sent);
    assert(at == 34);
    at = 0;
    decode_trade_session_volume_message(trade_session_volume_message_got);
    assert(at == 34);
    equal_trade_session_volume_message(trade_session_volume_message_got, trade_session_volume_message_sent)
  }
}

/* Open Interest Message: encoded, read back, and compared */
proctype check_open_interest_message() {
  OpenInterestMessage open_interest_message_sent;
  OpenInterestMessage open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_message(open_interest_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_message(open_interest_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_message(open_interest_message_sent, 255)
  :: else -> ramp_open_interest_message(open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_message(open_interest_message_sent);
    assert(at == 26);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 26);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Start Of Outright Instrument Snapshot Message: encoded, read back, and compared */
proctype check_start_of_outright_instrument_snapshot_message() {
  StartOfOutrightInstrumentSnapshotMessage start_of_outright_instrument_snapshot_message_sent;
  StartOfOutrightInstrumentSnapshotMessage start_of_outright_instrument_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_sent, 255)
  :: else -> ramp_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_sent);
    assert(at == 114);
    at = 0;
    decode_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_got);
    assert(at == 114);
    equal_start_of_outright_instrument_snapshot_message(start_of_outright_instrument_snapshot_message_got, start_of_outright_instrument_snapshot_message_sent)
  }
}

/* Start Of Spread Instrument Snapshot Message: encoded, read back, and compared */
proctype check_start_of_spread_instrument_snapshot_message() {
  StartOfSpreadInstrumentSnapshotMessage start_of_spread_instrument_snapshot_message_sent;
  StartOfSpreadInstrumentSnapshotMessage start_of_spread_instrument_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_sent, 255)
  :: else -> ramp_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_sent);
    assert(at == 123);
    at = 0;
    decode_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_got);
    assert(at == 123);
    equal_start_of_spread_instrument_snapshot_message(start_of_spread_instrument_snapshot_message_got, start_of_spread_instrument_snapshot_message_sent)
  }
}

/* Order Snapshot Message: encoded, read back, and compared */
proctype check_order_snapshot_message() {
  OrderSnapshotMessage order_snapshot_message_sent;
  OrderSnapshotMessage order_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_snapshot_message(order_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_order_snapshot_message(order_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_order_snapshot_message(order_snapshot_message_sent, 255)
  :: else -> ramp_order_snapshot_message(order_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_snapshot_message(order_snapshot_message_sent);
    assert(at == 30);
    at = 0;
    decode_order_snapshot_message(order_snapshot_message_got);
    assert(at == 30);
    equal_order_snapshot_message(order_snapshot_message_got, order_snapshot_message_sent)
  }
}

/* Retransmit Request Message: encoded, read back, and compared */
proctype check_retransmit_request_message() {
  RetransmitRequestMessage retransmit_request_message_sent;
  RetransmitRequestMessage retransmit_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmit_request_message(retransmit_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmit_request_message(retransmit_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmit_request_message(retransmit_request_message_sent, 255)
  :: else -> ramp_retransmit_request_message(retransmit_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmit_request_message(retransmit_request_message_sent);
    assert(at == 9);
    at = 0;
    decode_retransmit_request_message(retransmit_request_message_got);
    assert(at == 9);
    equal_retransmit_request_message(retransmit_request_message_got, retransmit_request_message_sent)
  }
}

/* Retransmit Reject Message: encoded, read back, and compared */
proctype check_retransmit_reject_message() {
  RetransmitRejectMessage retransmit_reject_message_sent;
  RetransmitRejectMessage retransmit_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmit_reject_message(retransmit_reject_message_sent, 0)
  :: pattern == 1 -> fill_retransmit_reject_message(retransmit_reject_message_sent, 32)
  :: pattern == 2 -> fill_retransmit_reject_message(retransmit_reject_message_sent, 255)
  :: else -> ramp_retransmit_reject_message(retransmit_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmit_reject_message(retransmit_reject_message_sent);
    assert(at == 49);
    at = 0;
    decode_retransmit_reject_message(retransmit_reject_message_got);
    assert(at == 49);
    equal_retransmit_reject_message(retransmit_reject_message_got, retransmit_reject_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_instr_header()
  :: run check_trading_status_update_message()
  :: run check_order_put_message()
  :: run check_order_delete_message()
  :: run check_implied_order_update_message()
  :: run check_trade_summary_message()
  :: run check_trade_message()
  :: run check_trade_amend_message()
  :: run check_spread_trade_amend_message()
  :: run check_trade_bust_message()
  :: run check_market_stat_message()
  :: run check_trade_session_volume_message()
  :: run check_open_interest_message()
  :: run check_start_of_outright_instrument_snapshot_message()
  :: run check_start_of_spread_instrument_snapshot_message()
  :: run check_order_snapshot_message()
  :: run check_retransmit_request_message()
  :: run check_retransmit_reject_message()
  fi
}
