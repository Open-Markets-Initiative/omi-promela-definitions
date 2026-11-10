/*
 * Euronext Drop Copy Gateway
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
 *   - a field read in bits
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 228

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Frame Header: 2 bytes --------------------------------------------------- */

/* Optiq length prefix, read before the message it frames */
typedef FrameHeader {
  byte frame[2]
};

int frame_header_at;

/* every byte of Frame Header set to one value */
inline fill_frame_header(frame_header_record, frame_header_value) {
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> frame_header_record.frame[frame_header_at] = frame_header_value; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Frame Header set to where it lies, so a field read out of place says so */
inline ramp_frame_header(frame_header_record, frame_header_base) {
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> frame_header_record.frame[frame_header_at] = (frame_header_base + 0 + frame_header_at + 1) % 256; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  skip
}

/* Frame Header to the wire, 2 bytes from where the cursor stands */
inline encode_frame_header(frame_header_record) {
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> wire[at] = frame_header_record.frame[frame_header_at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  skip
}

/* Frame Header off the wire, 2 bytes from where the cursor stands */
inline decode_frame_header(frame_header_record) {
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> frame_header_record.frame[frame_header_at] = wire[at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Frame Header is what was written, byte for byte */
inline equal_frame_header(frame_header_read, frame_header_written) {
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> assert(frame_header_read.frame[frame_header_at] == frame_header_written.frame[frame_header_at]); frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* Optiq Sbe message header — message identifiers and length of message root */
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

/* ---- Dc Price Update Message: 67 bytes --------------------------------------- */

/* DCPriceUpdateMessage */
typedef DcPriceUpdateMessage {
  byte msg_seq_num[4];
  byte produce_time[8];
  byte consume_time[8];
  byte emm;
  byte event_id[8];
  byte event_time[8];
  byte price_type;
  byte symbol_index[4];
  byte price_optional[8];
  byte quantity_optional[8];
  byte imbalance_qty[8];
  byte imbalance_qty_side
};

int dc_price_update_message_at;

/* every byte of Dc Price Update Message set to one value */
inline fill_dc_price_update_message(dc_price_update_message_record, dc_price_update_message_value) {
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> dc_price_update_message_record.msg_seq_num[dc_price_update_message_at] = dc_price_update_message_value; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.produce_time[dc_price_update_message_at] = dc_price_update_message_value; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.consume_time[dc_price_update_message_at] = dc_price_update_message_value; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_record.emm = dc_price_update_message_value;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.event_id[dc_price_update_message_at] = dc_price_update_message_value; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.event_time[dc_price_update_message_at] = dc_price_update_message_value; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_record.price_type = dc_price_update_message_value;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> dc_price_update_message_record.symbol_index[dc_price_update_message_at] = dc_price_update_message_value; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.price_optional[dc_price_update_message_at] = dc_price_update_message_value; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.quantity_optional[dc_price_update_message_at] = dc_price_update_message_value; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.imbalance_qty[dc_price_update_message_at] = dc_price_update_message_value; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_record.imbalance_qty_side = dc_price_update_message_value;
  skip
}

/* each byte of Dc Price Update Message set to where it lies, so a field read out of place says so */
inline ramp_dc_price_update_message(dc_price_update_message_record, dc_price_update_message_base) {
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> dc_price_update_message_record.msg_seq_num[dc_price_update_message_at] = (dc_price_update_message_base + 0 + dc_price_update_message_at + 1) % 256; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.produce_time[dc_price_update_message_at] = (dc_price_update_message_base + 4 + dc_price_update_message_at + 1) % 256; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.consume_time[dc_price_update_message_at] = (dc_price_update_message_base + 12 + dc_price_update_message_at + 1) % 256; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_record.emm = (dc_price_update_message_base + 20 + 1) % 256;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.event_id[dc_price_update_message_at] = (dc_price_update_message_base + 21 + dc_price_update_message_at + 1) % 256; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.event_time[dc_price_update_message_at] = (dc_price_update_message_base + 29 + dc_price_update_message_at + 1) % 256; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_record.price_type = (dc_price_update_message_base + 37 + 1) % 256;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> dc_price_update_message_record.symbol_index[dc_price_update_message_at] = (dc_price_update_message_base + 38 + dc_price_update_message_at + 1) % 256; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.price_optional[dc_price_update_message_at] = (dc_price_update_message_base + 42 + dc_price_update_message_at + 1) % 256; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.quantity_optional[dc_price_update_message_at] = (dc_price_update_message_base + 50 + dc_price_update_message_at + 1) % 256; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.imbalance_qty[dc_price_update_message_at] = (dc_price_update_message_base + 58 + dc_price_update_message_at + 1) % 256; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_record.imbalance_qty_side = (dc_price_update_message_base + 66 + 1) % 256;
  skip
}

/* Dc Price Update Message to the wire, 67 bytes from where the cursor stands */
inline encode_dc_price_update_message(dc_price_update_message_record) {
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> wire[at] = dc_price_update_message_record.msg_seq_num[dc_price_update_message_at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> wire[at] = dc_price_update_message_record.produce_time[dc_price_update_message_at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> wire[at] = dc_price_update_message_record.consume_time[dc_price_update_message_at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_price_update_message_record.emm; at = at + 1;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> wire[at] = dc_price_update_message_record.event_id[dc_price_update_message_at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> wire[at] = dc_price_update_message_record.event_time[dc_price_update_message_at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_price_update_message_record.price_type; at = at + 1;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> wire[at] = dc_price_update_message_record.symbol_index[dc_price_update_message_at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> wire[at] = dc_price_update_message_record.price_optional[dc_price_update_message_at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> wire[at] = dc_price_update_message_record.quantity_optional[dc_price_update_message_at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> wire[at] = dc_price_update_message_record.imbalance_qty[dc_price_update_message_at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_price_update_message_record.imbalance_qty_side; at = at + 1;
  skip
}

/* Dc Price Update Message off the wire, 67 bytes from where the cursor stands */
inline decode_dc_price_update_message(dc_price_update_message_record) {
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> dc_price_update_message_record.msg_seq_num[dc_price_update_message_at] = wire[at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.produce_time[dc_price_update_message_at] = wire[at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.consume_time[dc_price_update_message_at] = wire[at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_record.emm = wire[at]; at = at + 1;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.event_id[dc_price_update_message_at] = wire[at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.event_time[dc_price_update_message_at] = wire[at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_record.price_type = wire[at]; at = at + 1;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> dc_price_update_message_record.symbol_index[dc_price_update_message_at] = wire[at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.price_optional[dc_price_update_message_at] = wire[at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.quantity_optional[dc_price_update_message_at] = wire[at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> dc_price_update_message_record.imbalance_qty[dc_price_update_message_at] = wire[at]; at = at + 1; dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_record.imbalance_qty_side = wire[at]; at = at + 1;
  skip
}

/* what was read of Dc Price Update Message is what was written, byte for byte */
inline equal_dc_price_update_message(dc_price_update_message_read, dc_price_update_message_written) {
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> assert(dc_price_update_message_read.msg_seq_num[dc_price_update_message_at] == dc_price_update_message_written.msg_seq_num[dc_price_update_message_at]); dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> assert(dc_price_update_message_read.produce_time[dc_price_update_message_at] == dc_price_update_message_written.produce_time[dc_price_update_message_at]); dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> assert(dc_price_update_message_read.consume_time[dc_price_update_message_at] == dc_price_update_message_written.consume_time[dc_price_update_message_at]); dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  assert(dc_price_update_message_read.emm == dc_price_update_message_written.emm);
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> assert(dc_price_update_message_read.event_id[dc_price_update_message_at] == dc_price_update_message_written.event_id[dc_price_update_message_at]); dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> assert(dc_price_update_message_read.event_time[dc_price_update_message_at] == dc_price_update_message_written.event_time[dc_price_update_message_at]); dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  assert(dc_price_update_message_read.price_type == dc_price_update_message_written.price_type);
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 4 -> assert(dc_price_update_message_read.symbol_index[dc_price_update_message_at] == dc_price_update_message_written.symbol_index[dc_price_update_message_at]); dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> assert(dc_price_update_message_read.price_optional[dc_price_update_message_at] == dc_price_update_message_written.price_optional[dc_price_update_message_at]); dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> assert(dc_price_update_message_read.quantity_optional[dc_price_update_message_at] == dc_price_update_message_written.quantity_optional[dc_price_update_message_at]); dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  dc_price_update_message_at = 0;
  do
  :: dc_price_update_message_at < 8 -> assert(dc_price_update_message_read.imbalance_qty[dc_price_update_message_at] == dc_price_update_message_written.imbalance_qty[dc_price_update_message_at]); dc_price_update_message_at = dc_price_update_message_at + 1
  :: else -> break
  od;
  assert(dc_price_update_message_read.imbalance_qty_side == dc_price_update_message_written.imbalance_qty_side);
  skip
}

/* ---- Group Size Encoding: 2 bytes -------------------------------------------- */

/* groupSizeEncoding */
typedef GroupSizeEncoding {
  byte block_length_short;
  byte num_in_group
};

/* every byte of Group Size Encoding set to one value */
inline fill_group_size_encoding(group_size_encoding_record, group_size_encoding_value) {
  group_size_encoding_record.block_length_short = group_size_encoding_value;
  group_size_encoding_record.num_in_group = group_size_encoding_value;
  skip
}

/* each byte of Group Size Encoding set to where it lies, so a field read out of place says so */
inline ramp_group_size_encoding(group_size_encoding_record, group_size_encoding_base) {
  group_size_encoding_record.block_length_short = (group_size_encoding_base + 0 + 1) % 256;
  group_size_encoding_record.num_in_group = (group_size_encoding_base + 1 + 1) % 256;
  skip
}

/* Group Size Encoding to the wire, 2 bytes from where the cursor stands */
inline encode_group_size_encoding(group_size_encoding_record) {
  wire[at] = group_size_encoding_record.block_length_short; at = at + 1;
  wire[at] = group_size_encoding_record.num_in_group; at = at + 1;
  skip
}

/* Group Size Encoding off the wire, 2 bytes from where the cursor stands */
inline decode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_record.block_length_short = wire[at]; at = at + 1;
  group_size_encoding_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Size Encoding is what was written, byte for byte */
inline equal_group_size_encoding(group_size_encoding_read, group_size_encoding_written) {
  assert(group_size_encoding_read.block_length_short == group_size_encoding_written.block_length_short);
  assert(group_size_encoding_read.num_in_group == group_size_encoding_written.num_in_group);
  skip
}

/* ---- Dc Short Trade Cancellation Message: 77 bytes --------------------------- */

/* DCShortTradeCancellationMessage */
typedef DcShortTradeCancellationMessage {
  byte msg_seq_num[4];
  byte produce_time[8];
  byte consume_time[8];
  byte execution_id[4];
  byte emm;
  byte event_id[8];
  byte symbol_index[4];
  byte book_in[8];
  byte last_traded_px[8];
  byte last_shares[8];
  byte trade_unique_identifier[16]
};

int dc_short_trade_cancellation_message_at;

/* every byte of Dc Short Trade Cancellation Message set to one value */
inline fill_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_record, dc_short_trade_cancellation_message_value) {
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> dc_short_trade_cancellation_message_record.msg_seq_num[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.produce_time[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.consume_time[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> dc_short_trade_cancellation_message_record.execution_id[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_record.emm = dc_short_trade_cancellation_message_value;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.event_id[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> dc_short_trade_cancellation_message_record.symbol_index[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.book_in[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.last_traded_px[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.last_shares[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 16 -> dc_short_trade_cancellation_message_record.trade_unique_identifier[dc_short_trade_cancellation_message_at] = dc_short_trade_cancellation_message_value; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Short Trade Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_record, dc_short_trade_cancellation_message_base) {
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> dc_short_trade_cancellation_message_record.msg_seq_num[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 0 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.produce_time[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 4 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.consume_time[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 12 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> dc_short_trade_cancellation_message_record.execution_id[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 20 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_record.emm = (dc_short_trade_cancellation_message_base + 24 + 1) % 256;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.event_id[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 25 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> dc_short_trade_cancellation_message_record.symbol_index[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 33 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.book_in[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 37 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.last_traded_px[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 45 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.last_shares[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 53 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 16 -> dc_short_trade_cancellation_message_record.trade_unique_identifier[dc_short_trade_cancellation_message_at] = (dc_short_trade_cancellation_message_base + 61 + dc_short_trade_cancellation_message_at + 1) % 256; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Short Trade Cancellation Message to the wire, 77 bytes from where the cursor stands */
inline encode_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_record) {
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> wire[at] = dc_short_trade_cancellation_message_record.msg_seq_num[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> wire[at] = dc_short_trade_cancellation_message_record.produce_time[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> wire[at] = dc_short_trade_cancellation_message_record.consume_time[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> wire[at] = dc_short_trade_cancellation_message_record.execution_id[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_trade_cancellation_message_record.emm; at = at + 1;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> wire[at] = dc_short_trade_cancellation_message_record.event_id[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> wire[at] = dc_short_trade_cancellation_message_record.symbol_index[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> wire[at] = dc_short_trade_cancellation_message_record.book_in[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> wire[at] = dc_short_trade_cancellation_message_record.last_traded_px[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> wire[at] = dc_short_trade_cancellation_message_record.last_shares[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 16 -> wire[at] = dc_short_trade_cancellation_message_record.trade_unique_identifier[dc_short_trade_cancellation_message_at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Short Trade Cancellation Message off the wire, 77 bytes from where the cursor stands */
inline decode_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_record) {
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> dc_short_trade_cancellation_message_record.msg_seq_num[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.produce_time[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.consume_time[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> dc_short_trade_cancellation_message_record.execution_id[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_record.emm = wire[at]; at = at + 1;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.event_id[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> dc_short_trade_cancellation_message_record.symbol_index[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.book_in[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.last_traded_px[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> dc_short_trade_cancellation_message_record.last_shares[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 16 -> dc_short_trade_cancellation_message_record.trade_unique_identifier[dc_short_trade_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Short Trade Cancellation Message is what was written, byte for byte */
inline equal_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_read, dc_short_trade_cancellation_message_written) {
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> assert(dc_short_trade_cancellation_message_read.msg_seq_num[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.msg_seq_num[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> assert(dc_short_trade_cancellation_message_read.produce_time[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.produce_time[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> assert(dc_short_trade_cancellation_message_read.consume_time[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.consume_time[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> assert(dc_short_trade_cancellation_message_read.execution_id[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.execution_id[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  assert(dc_short_trade_cancellation_message_read.emm == dc_short_trade_cancellation_message_written.emm);
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> assert(dc_short_trade_cancellation_message_read.event_id[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.event_id[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 4 -> assert(dc_short_trade_cancellation_message_read.symbol_index[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.symbol_index[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> assert(dc_short_trade_cancellation_message_read.book_in[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.book_in[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> assert(dc_short_trade_cancellation_message_read.last_traded_px[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.last_traded_px[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 8 -> assert(dc_short_trade_cancellation_message_read.last_shares[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.last_shares[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_cancellation_message_at = 0;
  do
  :: dc_short_trade_cancellation_message_at < 16 -> assert(dc_short_trade_cancellation_message_read.trade_unique_identifier[dc_short_trade_cancellation_message_at] == dc_short_trade_cancellation_message_written.trade_unique_identifier[dc_short_trade_cancellation_message_at]); dc_short_trade_cancellation_message_at = dc_short_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dcafqrfe Message: 59 bytes ---------------------------------------------- */

/* DCAFQRFEMessage */
typedef DcafqrfeMessage {
  byte msg_seq_num[4];
  byte produce_time[8];
  byte consume_time[8];
  byte afq_reason;
  byte book_out_time[8];
  byte emm;
  byte event_id[8];
  byte symbol_index[4];
  byte firm_id[8];
  byte afq_indicator;
  byte oe_session_id[8]
};

int dcafqrfe_message_at;

/* every byte of Dcafqrfe Message set to one value */
inline fill_dcafqrfe_message(dcafqrfe_message_record, dcafqrfe_message_value) {
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> dcafqrfe_message_record.msg_seq_num[dcafqrfe_message_at] = dcafqrfe_message_value; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.produce_time[dcafqrfe_message_at] = dcafqrfe_message_value; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.consume_time[dcafqrfe_message_at] = dcafqrfe_message_value; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_record.afq_reason = dcafqrfe_message_value;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.book_out_time[dcafqrfe_message_at] = dcafqrfe_message_value; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_record.emm = dcafqrfe_message_value;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.event_id[dcafqrfe_message_at] = dcafqrfe_message_value; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> dcafqrfe_message_record.symbol_index[dcafqrfe_message_at] = dcafqrfe_message_value; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.firm_id[dcafqrfe_message_at] = dcafqrfe_message_value; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_record.afq_indicator = dcafqrfe_message_value;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.oe_session_id[dcafqrfe_message_at] = dcafqrfe_message_value; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dcafqrfe Message set to where it lies, so a field read out of place says so */
inline ramp_dcafqrfe_message(dcafqrfe_message_record, dcafqrfe_message_base) {
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> dcafqrfe_message_record.msg_seq_num[dcafqrfe_message_at] = (dcafqrfe_message_base + 0 + dcafqrfe_message_at + 1) % 256; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.produce_time[dcafqrfe_message_at] = (dcafqrfe_message_base + 4 + dcafqrfe_message_at + 1) % 256; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.consume_time[dcafqrfe_message_at] = (dcafqrfe_message_base + 12 + dcafqrfe_message_at + 1) % 256; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_record.afq_reason = (dcafqrfe_message_base + 20 + 1) % 256;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.book_out_time[dcafqrfe_message_at] = (dcafqrfe_message_base + 21 + dcafqrfe_message_at + 1) % 256; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_record.emm = (dcafqrfe_message_base + 29 + 1) % 256;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.event_id[dcafqrfe_message_at] = (dcafqrfe_message_base + 30 + dcafqrfe_message_at + 1) % 256; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> dcafqrfe_message_record.symbol_index[dcafqrfe_message_at] = (dcafqrfe_message_base + 38 + dcafqrfe_message_at + 1) % 256; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.firm_id[dcafqrfe_message_at] = (dcafqrfe_message_base + 42 + dcafqrfe_message_at + 1) % 256; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_record.afq_indicator = (dcafqrfe_message_base + 50 + 1) % 256;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.oe_session_id[dcafqrfe_message_at] = (dcafqrfe_message_base + 51 + dcafqrfe_message_at + 1) % 256; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dcafqrfe Message to the wire, 59 bytes from where the cursor stands */
inline encode_dcafqrfe_message(dcafqrfe_message_record) {
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> wire[at] = dcafqrfe_message_record.msg_seq_num[dcafqrfe_message_at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> wire[at] = dcafqrfe_message_record.produce_time[dcafqrfe_message_at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> wire[at] = dcafqrfe_message_record.consume_time[dcafqrfe_message_at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  wire[at] = dcafqrfe_message_record.afq_reason; at = at + 1;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> wire[at] = dcafqrfe_message_record.book_out_time[dcafqrfe_message_at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  wire[at] = dcafqrfe_message_record.emm; at = at + 1;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> wire[at] = dcafqrfe_message_record.event_id[dcafqrfe_message_at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> wire[at] = dcafqrfe_message_record.symbol_index[dcafqrfe_message_at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> wire[at] = dcafqrfe_message_record.firm_id[dcafqrfe_message_at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  wire[at] = dcafqrfe_message_record.afq_indicator; at = at + 1;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> wire[at] = dcafqrfe_message_record.oe_session_id[dcafqrfe_message_at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dcafqrfe Message off the wire, 59 bytes from where the cursor stands */
inline decode_dcafqrfe_message(dcafqrfe_message_record) {
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> dcafqrfe_message_record.msg_seq_num[dcafqrfe_message_at] = wire[at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.produce_time[dcafqrfe_message_at] = wire[at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.consume_time[dcafqrfe_message_at] = wire[at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_record.afq_reason = wire[at]; at = at + 1;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.book_out_time[dcafqrfe_message_at] = wire[at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_record.emm = wire[at]; at = at + 1;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.event_id[dcafqrfe_message_at] = wire[at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> dcafqrfe_message_record.symbol_index[dcafqrfe_message_at] = wire[at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.firm_id[dcafqrfe_message_at] = wire[at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_record.afq_indicator = wire[at]; at = at + 1;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> dcafqrfe_message_record.oe_session_id[dcafqrfe_message_at] = wire[at]; at = at + 1; dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dcafqrfe Message is what was written, byte for byte */
inline equal_dcafqrfe_message(dcafqrfe_message_read, dcafqrfe_message_written) {
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> assert(dcafqrfe_message_read.msg_seq_num[dcafqrfe_message_at] == dcafqrfe_message_written.msg_seq_num[dcafqrfe_message_at]); dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> assert(dcafqrfe_message_read.produce_time[dcafqrfe_message_at] == dcafqrfe_message_written.produce_time[dcafqrfe_message_at]); dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> assert(dcafqrfe_message_read.consume_time[dcafqrfe_message_at] == dcafqrfe_message_written.consume_time[dcafqrfe_message_at]); dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  assert(dcafqrfe_message_read.afq_reason == dcafqrfe_message_written.afq_reason);
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> assert(dcafqrfe_message_read.book_out_time[dcafqrfe_message_at] == dcafqrfe_message_written.book_out_time[dcafqrfe_message_at]); dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  assert(dcafqrfe_message_read.emm == dcafqrfe_message_written.emm);
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> assert(dcafqrfe_message_read.event_id[dcafqrfe_message_at] == dcafqrfe_message_written.event_id[dcafqrfe_message_at]); dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 4 -> assert(dcafqrfe_message_read.symbol_index[dcafqrfe_message_at] == dcafqrfe_message_written.symbol_index[dcafqrfe_message_at]); dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> assert(dcafqrfe_message_read.firm_id[dcafqrfe_message_at] == dcafqrfe_message_written.firm_id[dcafqrfe_message_at]); dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  assert(dcafqrfe_message_read.afq_indicator == dcafqrfe_message_written.afq_indicator);
  dcafqrfe_message_at = 0;
  do
  :: dcafqrfe_message_at < 8 -> assert(dcafqrfe_message_read.oe_session_id[dcafqrfe_message_at] == dcafqrfe_message_written.oe_session_id[dcafqrfe_message_at]); dcafqrfe_message_at = dcafqrfe_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Declaration New Message: 221 bytes ----------------------------------- */

/* DCDeclarationNewMessage */
typedef DcDeclarationNewMessage {
  byte msg_seq_num[4];
  byte produce_time[8];
  byte consume_time[8];
  byte message_sending_time[8];
  byte book_in[8];
  byte book_out_time[8];
  byte oegin_from_member[8];
  byte oegout_time_to_me[8];
  byte event_id[8];
  byte declaration_event_type;
  byte firm_id[8];
  byte oe_session_id[8];
  byte account_type;
  byte client_order_id[8];
  byte emm;
  byte declaration_id[8];
  byte declaration_status;
  byte price_optional[8];
  byte quantity_optional[8];
  byte side;
  byte symbol_index[4];
  byte operation_type;
  byte cross_order_indicator;
  byte entering_counterparty[8];
  byte trader_id[16];
  byte investor_id[16];
  byte free_text[18];
  byte principal_code[8];
  byte clearing_firm_id_optional[8];
  byte clearing_account[16];
  byte settlement_period;
  byte settlement_flag;
  byte guarantee_flag;
  byte transaction_price_type
};

int dc_declaration_new_message_at;

/* every byte of Dc Declaration New Message set to one value */
inline fill_dc_declaration_new_message(dc_declaration_new_message_record, dc_declaration_new_message_value) {
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> dc_declaration_new_message_record.msg_seq_num[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.produce_time[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.consume_time[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.message_sending_time[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.book_in[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.book_out_time[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.oegin_from_member[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.oegout_time_to_me[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.event_id[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.declaration_event_type = dc_declaration_new_message_value;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.firm_id[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.oe_session_id[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.account_type = dc_declaration_new_message_value;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.client_order_id[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.emm = dc_declaration_new_message_value;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.declaration_id[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.declaration_status = dc_declaration_new_message_value;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.price_optional[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.quantity_optional[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.side = dc_declaration_new_message_value;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> dc_declaration_new_message_record.symbol_index[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.operation_type = dc_declaration_new_message_value;
  dc_declaration_new_message_record.cross_order_indicator = dc_declaration_new_message_value;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.entering_counterparty[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> dc_declaration_new_message_record.trader_id[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> dc_declaration_new_message_record.investor_id[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 18 -> dc_declaration_new_message_record.free_text[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.principal_code[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.clearing_firm_id_optional[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> dc_declaration_new_message_record.clearing_account[dc_declaration_new_message_at] = dc_declaration_new_message_value; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.settlement_period = dc_declaration_new_message_value;
  dc_declaration_new_message_record.settlement_flag = dc_declaration_new_message_value;
  dc_declaration_new_message_record.guarantee_flag = dc_declaration_new_message_value;
  dc_declaration_new_message_record.transaction_price_type = dc_declaration_new_message_value;
  skip
}

/* each byte of Dc Declaration New Message set to where it lies, so a field read out of place says so */
inline ramp_dc_declaration_new_message(dc_declaration_new_message_record, dc_declaration_new_message_base) {
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> dc_declaration_new_message_record.msg_seq_num[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 0 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.produce_time[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 4 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.consume_time[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 12 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.message_sending_time[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 20 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.book_in[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 28 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.book_out_time[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 36 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.oegin_from_member[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 44 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.oegout_time_to_me[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 52 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.event_id[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 60 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.declaration_event_type = (dc_declaration_new_message_base + 68 + 1) % 256;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.firm_id[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 69 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.oe_session_id[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 77 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.account_type = (dc_declaration_new_message_base + 85 + 1) % 256;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.client_order_id[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 86 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.emm = (dc_declaration_new_message_base + 94 + 1) % 256;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.declaration_id[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 95 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.declaration_status = (dc_declaration_new_message_base + 103 + 1) % 256;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.price_optional[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 104 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.quantity_optional[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 112 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.side = (dc_declaration_new_message_base + 120 + 1) % 256;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> dc_declaration_new_message_record.symbol_index[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 121 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.operation_type = (dc_declaration_new_message_base + 125 + 1) % 256;
  dc_declaration_new_message_record.cross_order_indicator = (dc_declaration_new_message_base + 126 + 1) % 256;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.entering_counterparty[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 127 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> dc_declaration_new_message_record.trader_id[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 135 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> dc_declaration_new_message_record.investor_id[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 151 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 18 -> dc_declaration_new_message_record.free_text[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 167 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.principal_code[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 185 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.clearing_firm_id_optional[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 193 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> dc_declaration_new_message_record.clearing_account[dc_declaration_new_message_at] = (dc_declaration_new_message_base + 201 + dc_declaration_new_message_at + 1) % 256; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.settlement_period = (dc_declaration_new_message_base + 217 + 1) % 256;
  dc_declaration_new_message_record.settlement_flag = (dc_declaration_new_message_base + 218 + 1) % 256;
  dc_declaration_new_message_record.guarantee_flag = (dc_declaration_new_message_base + 219 + 1) % 256;
  dc_declaration_new_message_record.transaction_price_type = (dc_declaration_new_message_base + 220 + 1) % 256;
  skip
}

/* Dc Declaration New Message to the wire, 221 bytes from where the cursor stands */
inline encode_dc_declaration_new_message(dc_declaration_new_message_record) {
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> wire[at] = dc_declaration_new_message_record.msg_seq_num[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.produce_time[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.consume_time[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.message_sending_time[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.book_in[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.book_out_time[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.oegin_from_member[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.oegout_time_to_me[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.event_id[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_declaration_new_message_record.declaration_event_type; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.firm_id[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.oe_session_id[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_declaration_new_message_record.account_type; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.client_order_id[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_declaration_new_message_record.emm; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.declaration_id[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_declaration_new_message_record.declaration_status; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.price_optional[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.quantity_optional[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_declaration_new_message_record.side; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> wire[at] = dc_declaration_new_message_record.symbol_index[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_declaration_new_message_record.operation_type; at = at + 1;
  wire[at] = dc_declaration_new_message_record.cross_order_indicator; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.entering_counterparty[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> wire[at] = dc_declaration_new_message_record.trader_id[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> wire[at] = dc_declaration_new_message_record.investor_id[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 18 -> wire[at] = dc_declaration_new_message_record.free_text[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.principal_code[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> wire[at] = dc_declaration_new_message_record.clearing_firm_id_optional[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> wire[at] = dc_declaration_new_message_record.clearing_account[dc_declaration_new_message_at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_declaration_new_message_record.settlement_period; at = at + 1;
  wire[at] = dc_declaration_new_message_record.settlement_flag; at = at + 1;
  wire[at] = dc_declaration_new_message_record.guarantee_flag; at = at + 1;
  wire[at] = dc_declaration_new_message_record.transaction_price_type; at = at + 1;
  skip
}

/* Dc Declaration New Message off the wire, 221 bytes from where the cursor stands */
inline decode_dc_declaration_new_message(dc_declaration_new_message_record) {
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> dc_declaration_new_message_record.msg_seq_num[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.produce_time[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.consume_time[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.message_sending_time[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.book_in[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.book_out_time[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.oegin_from_member[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.oegout_time_to_me[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.event_id[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.declaration_event_type = wire[at]; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.firm_id[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.oe_session_id[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.account_type = wire[at]; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.client_order_id[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.emm = wire[at]; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.declaration_id[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.declaration_status = wire[at]; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.price_optional[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.quantity_optional[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.side = wire[at]; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> dc_declaration_new_message_record.symbol_index[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.operation_type = wire[at]; at = at + 1;
  dc_declaration_new_message_record.cross_order_indicator = wire[at]; at = at + 1;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.entering_counterparty[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> dc_declaration_new_message_record.trader_id[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> dc_declaration_new_message_record.investor_id[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 18 -> dc_declaration_new_message_record.free_text[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.principal_code[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> dc_declaration_new_message_record.clearing_firm_id_optional[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> dc_declaration_new_message_record.clearing_account[dc_declaration_new_message_at] = wire[at]; at = at + 1; dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_record.settlement_period = wire[at]; at = at + 1;
  dc_declaration_new_message_record.settlement_flag = wire[at]; at = at + 1;
  dc_declaration_new_message_record.guarantee_flag = wire[at]; at = at + 1;
  dc_declaration_new_message_record.transaction_price_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Dc Declaration New Message is what was written, byte for byte */
inline equal_dc_declaration_new_message(dc_declaration_new_message_read, dc_declaration_new_message_written) {
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> assert(dc_declaration_new_message_read.msg_seq_num[dc_declaration_new_message_at] == dc_declaration_new_message_written.msg_seq_num[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.produce_time[dc_declaration_new_message_at] == dc_declaration_new_message_written.produce_time[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.consume_time[dc_declaration_new_message_at] == dc_declaration_new_message_written.consume_time[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.message_sending_time[dc_declaration_new_message_at] == dc_declaration_new_message_written.message_sending_time[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.book_in[dc_declaration_new_message_at] == dc_declaration_new_message_written.book_in[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.book_out_time[dc_declaration_new_message_at] == dc_declaration_new_message_written.book_out_time[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.oegin_from_member[dc_declaration_new_message_at] == dc_declaration_new_message_written.oegin_from_member[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.oegout_time_to_me[dc_declaration_new_message_at] == dc_declaration_new_message_written.oegout_time_to_me[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.event_id[dc_declaration_new_message_at] == dc_declaration_new_message_written.event_id[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  assert(dc_declaration_new_message_read.declaration_event_type == dc_declaration_new_message_written.declaration_event_type);
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.firm_id[dc_declaration_new_message_at] == dc_declaration_new_message_written.firm_id[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.oe_session_id[dc_declaration_new_message_at] == dc_declaration_new_message_written.oe_session_id[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  assert(dc_declaration_new_message_read.account_type == dc_declaration_new_message_written.account_type);
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.client_order_id[dc_declaration_new_message_at] == dc_declaration_new_message_written.client_order_id[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  assert(dc_declaration_new_message_read.emm == dc_declaration_new_message_written.emm);
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.declaration_id[dc_declaration_new_message_at] == dc_declaration_new_message_written.declaration_id[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  assert(dc_declaration_new_message_read.declaration_status == dc_declaration_new_message_written.declaration_status);
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.price_optional[dc_declaration_new_message_at] == dc_declaration_new_message_written.price_optional[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.quantity_optional[dc_declaration_new_message_at] == dc_declaration_new_message_written.quantity_optional[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  assert(dc_declaration_new_message_read.side == dc_declaration_new_message_written.side);
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 4 -> assert(dc_declaration_new_message_read.symbol_index[dc_declaration_new_message_at] == dc_declaration_new_message_written.symbol_index[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  assert(dc_declaration_new_message_read.operation_type == dc_declaration_new_message_written.operation_type);
  assert(dc_declaration_new_message_read.cross_order_indicator == dc_declaration_new_message_written.cross_order_indicator);
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.entering_counterparty[dc_declaration_new_message_at] == dc_declaration_new_message_written.entering_counterparty[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> assert(dc_declaration_new_message_read.trader_id[dc_declaration_new_message_at] == dc_declaration_new_message_written.trader_id[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> assert(dc_declaration_new_message_read.investor_id[dc_declaration_new_message_at] == dc_declaration_new_message_written.investor_id[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 18 -> assert(dc_declaration_new_message_read.free_text[dc_declaration_new_message_at] == dc_declaration_new_message_written.free_text[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.principal_code[dc_declaration_new_message_at] == dc_declaration_new_message_written.principal_code[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 8 -> assert(dc_declaration_new_message_read.clearing_firm_id_optional[dc_declaration_new_message_at] == dc_declaration_new_message_written.clearing_firm_id_optional[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  dc_declaration_new_message_at = 0;
  do
  :: dc_declaration_new_message_at < 16 -> assert(dc_declaration_new_message_read.clearing_account[dc_declaration_new_message_at] == dc_declaration_new_message_written.clearing_account[dc_declaration_new_message_at]); dc_declaration_new_message_at = dc_declaration_new_message_at + 1
  :: else -> break
  od;
  assert(dc_declaration_new_message_read.settlement_period == dc_declaration_new_message_written.settlement_period);
  assert(dc_declaration_new_message_read.settlement_flag == dc_declaration_new_message_written.settlement_flag);
  assert(dc_declaration_new_message_read.guarantee_flag == dc_declaration_new_message_written.guarantee_flag);
  assert(dc_declaration_new_message_read.transaction_price_type == dc_declaration_new_message_written.transaction_price_type);
  skip
}

/* ---- Dc Short Declaration Reject Message: 102 bytes -------------------------- */

/* DCShortDeclarationRejectMessage */
typedef DcShortDeclarationRejectMessage {
  byte msg_seq_num[4];
  byte produce_time[8];
  byte consume_time[8];
  byte message_sending_time[8];
  byte book_in[8];
  byte book_out_time[8];
  byte oegin_from_member[8];
  byte oegout_time_to_me[8];
  byte event_id[8];
  byte declaration_event_type;
  byte firm_id[8];
  byte client_order_id[8];
  byte emm;
  byte declaration_id[8];
  byte symbol_index[4];
  byte error_code[2];
  byte rejected_message_id[2]
};

int dc_short_declaration_reject_message_at;

/* every byte of Dc Short Declaration Reject Message set to one value */
inline fill_dc_short_declaration_reject_message(dc_short_declaration_reject_message_record, dc_short_declaration_reject_message_value) {
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> dc_short_declaration_reject_message_record.msg_seq_num[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.produce_time[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.consume_time[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.message_sending_time[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.book_in[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.book_out_time[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.oegin_from_member[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.oegout_time_to_me[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.event_id[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_record.declaration_event_type = dc_short_declaration_reject_message_value;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.firm_id[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.client_order_id[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_record.emm = dc_short_declaration_reject_message_value;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.declaration_id[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> dc_short_declaration_reject_message_record.symbol_index[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> dc_short_declaration_reject_message_record.error_code[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> dc_short_declaration_reject_message_record.rejected_message_id[dc_short_declaration_reject_message_at] = dc_short_declaration_reject_message_value; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Short Declaration Reject Message set to where it lies, so a field read out of place says so */
inline ramp_dc_short_declaration_reject_message(dc_short_declaration_reject_message_record, dc_short_declaration_reject_message_base) {
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> dc_short_declaration_reject_message_record.msg_seq_num[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 0 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.produce_time[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 4 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.consume_time[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 12 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.message_sending_time[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 20 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.book_in[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 28 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.book_out_time[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 36 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.oegin_from_member[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 44 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.oegout_time_to_me[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 52 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.event_id[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 60 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_record.declaration_event_type = (dc_short_declaration_reject_message_base + 68 + 1) % 256;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.firm_id[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 69 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.client_order_id[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 77 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_record.emm = (dc_short_declaration_reject_message_base + 85 + 1) % 256;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.declaration_id[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 86 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> dc_short_declaration_reject_message_record.symbol_index[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 94 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> dc_short_declaration_reject_message_record.error_code[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 98 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> dc_short_declaration_reject_message_record.rejected_message_id[dc_short_declaration_reject_message_at] = (dc_short_declaration_reject_message_base + 100 + dc_short_declaration_reject_message_at + 1) % 256; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Short Declaration Reject Message to the wire, 102 bytes from where the cursor stands */
inline encode_dc_short_declaration_reject_message(dc_short_declaration_reject_message_record) {
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> wire[at] = dc_short_declaration_reject_message_record.msg_seq_num[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.produce_time[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.consume_time[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.message_sending_time[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.book_in[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.book_out_time[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.oegin_from_member[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.oegout_time_to_me[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.event_id[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_reject_message_record.declaration_event_type; at = at + 1;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.firm_id[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.client_order_id[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_reject_message_record.emm; at = at + 1;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> wire[at] = dc_short_declaration_reject_message_record.declaration_id[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> wire[at] = dc_short_declaration_reject_message_record.symbol_index[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> wire[at] = dc_short_declaration_reject_message_record.error_code[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> wire[at] = dc_short_declaration_reject_message_record.rejected_message_id[dc_short_declaration_reject_message_at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Short Declaration Reject Message off the wire, 102 bytes from where the cursor stands */
inline decode_dc_short_declaration_reject_message(dc_short_declaration_reject_message_record) {
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> dc_short_declaration_reject_message_record.msg_seq_num[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.produce_time[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.consume_time[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.message_sending_time[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.book_in[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.book_out_time[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.oegin_from_member[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.oegout_time_to_me[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.event_id[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_record.declaration_event_type = wire[at]; at = at + 1;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.firm_id[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.client_order_id[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_record.emm = wire[at]; at = at + 1;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> dc_short_declaration_reject_message_record.declaration_id[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> dc_short_declaration_reject_message_record.symbol_index[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> dc_short_declaration_reject_message_record.error_code[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> dc_short_declaration_reject_message_record.rejected_message_id[dc_short_declaration_reject_message_at] = wire[at]; at = at + 1; dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Short Declaration Reject Message is what was written, byte for byte */
inline equal_dc_short_declaration_reject_message(dc_short_declaration_reject_message_read, dc_short_declaration_reject_message_written) {
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> assert(dc_short_declaration_reject_message_read.msg_seq_num[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.msg_seq_num[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.produce_time[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.produce_time[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.consume_time[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.consume_time[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.message_sending_time[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.message_sending_time[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.book_in[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.book_in[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.book_out_time[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.book_out_time[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.oegin_from_member[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.oegin_from_member[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.oegout_time_to_me[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.oegout_time_to_me[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.event_id[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.event_id[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_reject_message_read.declaration_event_type == dc_short_declaration_reject_message_written.declaration_event_type);
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.firm_id[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.firm_id[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.client_order_id[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.client_order_id[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_reject_message_read.emm == dc_short_declaration_reject_message_written.emm);
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 8 -> assert(dc_short_declaration_reject_message_read.declaration_id[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.declaration_id[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 4 -> assert(dc_short_declaration_reject_message_read.symbol_index[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.symbol_index[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> assert(dc_short_declaration_reject_message_read.error_code[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.error_code[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_reject_message_at = 0;
  do
  :: dc_short_declaration_reject_message_at < 2 -> assert(dc_short_declaration_reject_message_read.rejected_message_id[dc_short_declaration_reject_message_at] == dc_short_declaration_reject_message_written.rejected_message_id[dc_short_declaration_reject_message_at]); dc_short_declaration_reject_message_at = dc_short_declaration_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Short Declaration Cancel Message: 107 bytes -------------------------- */

/* DCShortDeclarationCancelMessage */
typedef DcShortDeclarationCancelMessage {
  byte msg_seq_num[4];
  byte produce_time[8];
  byte consume_time[8];
  byte message_sending_time[8];
  byte book_in[8];
  byte book_out_time[8];
  byte oegin_from_member[8];
  byte oegout_time_to_me[8];
  byte event_id[8];
  byte declaration_event_type;
  byte firm_id[8];
  byte oe_session_id[8];
  byte client_order_id[8];
  byte emm;
  byte declaration_id[8];
  byte symbol_index[4];
  byte declaration_kill_reason
};

int dc_short_declaration_cancel_message_at;

/* every byte of Dc Short Declaration Cancel Message set to one value */
inline fill_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_record, dc_short_declaration_cancel_message_value) {
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> dc_short_declaration_cancel_message_record.msg_seq_num[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.produce_time[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.consume_time[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.message_sending_time[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.book_in[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.book_out_time[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.oegin_from_member[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.oegout_time_to_me[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.event_id[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_record.declaration_event_type = dc_short_declaration_cancel_message_value;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.firm_id[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.oe_session_id[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.client_order_id[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_record.emm = dc_short_declaration_cancel_message_value;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.declaration_id[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> dc_short_declaration_cancel_message_record.symbol_index[dc_short_declaration_cancel_message_at] = dc_short_declaration_cancel_message_value; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_record.declaration_kill_reason = dc_short_declaration_cancel_message_value;
  skip
}

/* each byte of Dc Short Declaration Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_record, dc_short_declaration_cancel_message_base) {
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> dc_short_declaration_cancel_message_record.msg_seq_num[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 0 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.produce_time[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 4 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.consume_time[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 12 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.message_sending_time[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 20 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.book_in[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 28 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.book_out_time[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 36 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.oegin_from_member[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 44 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.oegout_time_to_me[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 52 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.event_id[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 60 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_record.declaration_event_type = (dc_short_declaration_cancel_message_base + 68 + 1) % 256;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.firm_id[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 69 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.oe_session_id[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 77 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.client_order_id[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 85 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_record.emm = (dc_short_declaration_cancel_message_base + 93 + 1) % 256;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.declaration_id[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 94 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> dc_short_declaration_cancel_message_record.symbol_index[dc_short_declaration_cancel_message_at] = (dc_short_declaration_cancel_message_base + 102 + dc_short_declaration_cancel_message_at + 1) % 256; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_record.declaration_kill_reason = (dc_short_declaration_cancel_message_base + 106 + 1) % 256;
  skip
}

/* Dc Short Declaration Cancel Message to the wire, 107 bytes from where the cursor stands */
inline encode_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_record) {
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> wire[at] = dc_short_declaration_cancel_message_record.msg_seq_num[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.produce_time[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.consume_time[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.message_sending_time[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.book_in[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.book_out_time[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.oegin_from_member[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.oegout_time_to_me[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.event_id[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_cancel_message_record.declaration_event_type; at = at + 1;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.firm_id[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.oe_session_id[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.client_order_id[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_cancel_message_record.emm; at = at + 1;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> wire[at] = dc_short_declaration_cancel_message_record.declaration_id[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> wire[at] = dc_short_declaration_cancel_message_record.symbol_index[dc_short_declaration_cancel_message_at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_cancel_message_record.declaration_kill_reason; at = at + 1;
  skip
}

/* Dc Short Declaration Cancel Message off the wire, 107 bytes from where the cursor stands */
inline decode_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_record) {
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> dc_short_declaration_cancel_message_record.msg_seq_num[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.produce_time[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.consume_time[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.message_sending_time[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.book_in[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.book_out_time[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.oegin_from_member[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.oegout_time_to_me[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.event_id[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_record.declaration_event_type = wire[at]; at = at + 1;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.firm_id[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.oe_session_id[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.client_order_id[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_record.emm = wire[at]; at = at + 1;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> dc_short_declaration_cancel_message_record.declaration_id[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> dc_short_declaration_cancel_message_record.symbol_index[dc_short_declaration_cancel_message_at] = wire[at]; at = at + 1; dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_record.declaration_kill_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Dc Short Declaration Cancel Message is what was written, byte for byte */
inline equal_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_read, dc_short_declaration_cancel_message_written) {
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> assert(dc_short_declaration_cancel_message_read.msg_seq_num[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.msg_seq_num[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.produce_time[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.produce_time[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.consume_time[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.consume_time[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.message_sending_time[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.message_sending_time[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.book_in[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.book_in[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.book_out_time[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.book_out_time[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.oegin_from_member[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.oegin_from_member[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.oegout_time_to_me[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.oegout_time_to_me[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.event_id[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.event_id[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_cancel_message_read.declaration_event_type == dc_short_declaration_cancel_message_written.declaration_event_type);
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.firm_id[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.firm_id[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.oe_session_id[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.oe_session_id[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.client_order_id[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.client_order_id[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_cancel_message_read.emm == dc_short_declaration_cancel_message_written.emm);
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 8 -> assert(dc_short_declaration_cancel_message_read.declaration_id[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.declaration_id[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_cancel_message_at = 0;
  do
  :: dc_short_declaration_cancel_message_at < 4 -> assert(dc_short_declaration_cancel_message_read.symbol_index[dc_short_declaration_cancel_message_at] == dc_short_declaration_cancel_message_written.symbol_index[dc_short_declaration_cancel_message_at]); dc_short_declaration_cancel_message_at = dc_short_declaration_cancel_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_cancel_message_read.declaration_kill_reason == dc_short_declaration_cancel_message_written.declaration_kill_reason);
  skip
}

/* ---- Dc Short Trade Declaration Cancellation Message: 61 bytes --------------- */

/* DCShortTradeDeclarationCancellationMessage */
typedef DcShortTradeDeclarationCancellationMessage {
  byte msg_seq_num[4];
  byte produce_time[8];
  byte consume_time[8];
  byte book_in[8];
  byte event_id[8];
  byte emm;
  byte execution_id[4];
  byte symbol_index[4];
  byte price[8];
  byte quantity[8]
};

int dc_short_trade_declaration_cancellation_message_at;

/* every byte of Dc Short Trade Declaration Cancellation Message set to one value */
inline fill_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_record, dc_short_trade_declaration_cancellation_message_value) {
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> dc_short_trade_declaration_cancellation_message_record.msg_seq_num[dc_short_trade_declaration_cancellation_message_at] = dc_short_trade_declaration_cancellation_message_value; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.produce_time[dc_short_trade_declaration_cancellation_message_at] = dc_short_trade_declaration_cancellation_message_value; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.consume_time[dc_short_trade_declaration_cancellation_message_at] = dc_short_trade_declaration_cancellation_message_value; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.book_in[dc_short_trade_declaration_cancellation_message_at] = dc_short_trade_declaration_cancellation_message_value; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.event_id[dc_short_trade_declaration_cancellation_message_at] = dc_short_trade_declaration_cancellation_message_value; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_record.emm = dc_short_trade_declaration_cancellation_message_value;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> dc_short_trade_declaration_cancellation_message_record.execution_id[dc_short_trade_declaration_cancellation_message_at] = dc_short_trade_declaration_cancellation_message_value; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> dc_short_trade_declaration_cancellation_message_record.symbol_index[dc_short_trade_declaration_cancellation_message_at] = dc_short_trade_declaration_cancellation_message_value; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.price[dc_short_trade_declaration_cancellation_message_at] = dc_short_trade_declaration_cancellation_message_value; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.quantity[dc_short_trade_declaration_cancellation_message_at] = dc_short_trade_declaration_cancellation_message_value; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Short Trade Declaration Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_record, dc_short_trade_declaration_cancellation_message_base) {
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> dc_short_trade_declaration_cancellation_message_record.msg_seq_num[dc_short_trade_declaration_cancellation_message_at] = (dc_short_trade_declaration_cancellation_message_base + 0 + dc_short_trade_declaration_cancellation_message_at + 1) % 256; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.produce_time[dc_short_trade_declaration_cancellation_message_at] = (dc_short_trade_declaration_cancellation_message_base + 4 + dc_short_trade_declaration_cancellation_message_at + 1) % 256; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.consume_time[dc_short_trade_declaration_cancellation_message_at] = (dc_short_trade_declaration_cancellation_message_base + 12 + dc_short_trade_declaration_cancellation_message_at + 1) % 256; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.book_in[dc_short_trade_declaration_cancellation_message_at] = (dc_short_trade_declaration_cancellation_message_base + 20 + dc_short_trade_declaration_cancellation_message_at + 1) % 256; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.event_id[dc_short_trade_declaration_cancellation_message_at] = (dc_short_trade_declaration_cancellation_message_base + 28 + dc_short_trade_declaration_cancellation_message_at + 1) % 256; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_record.emm = (dc_short_trade_declaration_cancellation_message_base + 36 + 1) % 256;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> dc_short_trade_declaration_cancellation_message_record.execution_id[dc_short_trade_declaration_cancellation_message_at] = (dc_short_trade_declaration_cancellation_message_base + 37 + dc_short_trade_declaration_cancellation_message_at + 1) % 256; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> dc_short_trade_declaration_cancellation_message_record.symbol_index[dc_short_trade_declaration_cancellation_message_at] = (dc_short_trade_declaration_cancellation_message_base + 41 + dc_short_trade_declaration_cancellation_message_at + 1) % 256; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.price[dc_short_trade_declaration_cancellation_message_at] = (dc_short_trade_declaration_cancellation_message_base + 45 + dc_short_trade_declaration_cancellation_message_at + 1) % 256; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.quantity[dc_short_trade_declaration_cancellation_message_at] = (dc_short_trade_declaration_cancellation_message_base + 53 + dc_short_trade_declaration_cancellation_message_at + 1) % 256; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Short Trade Declaration Cancellation Message to the wire, 61 bytes from where the cursor stands */
inline encode_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_record) {
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> wire[at] = dc_short_trade_declaration_cancellation_message_record.msg_seq_num[dc_short_trade_declaration_cancellation_message_at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> wire[at] = dc_short_trade_declaration_cancellation_message_record.produce_time[dc_short_trade_declaration_cancellation_message_at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> wire[at] = dc_short_trade_declaration_cancellation_message_record.consume_time[dc_short_trade_declaration_cancellation_message_at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> wire[at] = dc_short_trade_declaration_cancellation_message_record.book_in[dc_short_trade_declaration_cancellation_message_at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> wire[at] = dc_short_trade_declaration_cancellation_message_record.event_id[dc_short_trade_declaration_cancellation_message_at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_trade_declaration_cancellation_message_record.emm; at = at + 1;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> wire[at] = dc_short_trade_declaration_cancellation_message_record.execution_id[dc_short_trade_declaration_cancellation_message_at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> wire[at] = dc_short_trade_declaration_cancellation_message_record.symbol_index[dc_short_trade_declaration_cancellation_message_at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> wire[at] = dc_short_trade_declaration_cancellation_message_record.price[dc_short_trade_declaration_cancellation_message_at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> wire[at] = dc_short_trade_declaration_cancellation_message_record.quantity[dc_short_trade_declaration_cancellation_message_at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Short Trade Declaration Cancellation Message off the wire, 61 bytes from where the cursor stands */
inline decode_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_record) {
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> dc_short_trade_declaration_cancellation_message_record.msg_seq_num[dc_short_trade_declaration_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.produce_time[dc_short_trade_declaration_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.consume_time[dc_short_trade_declaration_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.book_in[dc_short_trade_declaration_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.event_id[dc_short_trade_declaration_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_record.emm = wire[at]; at = at + 1;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> dc_short_trade_declaration_cancellation_message_record.execution_id[dc_short_trade_declaration_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> dc_short_trade_declaration_cancellation_message_record.symbol_index[dc_short_trade_declaration_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.price[dc_short_trade_declaration_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> dc_short_trade_declaration_cancellation_message_record.quantity[dc_short_trade_declaration_cancellation_message_at] = wire[at]; at = at + 1; dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Short Trade Declaration Cancellation Message is what was written, byte for byte */
inline equal_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_read, dc_short_trade_declaration_cancellation_message_written) {
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> assert(dc_short_trade_declaration_cancellation_message_read.msg_seq_num[dc_short_trade_declaration_cancellation_message_at] == dc_short_trade_declaration_cancellation_message_written.msg_seq_num[dc_short_trade_declaration_cancellation_message_at]); dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> assert(dc_short_trade_declaration_cancellation_message_read.produce_time[dc_short_trade_declaration_cancellation_message_at] == dc_short_trade_declaration_cancellation_message_written.produce_time[dc_short_trade_declaration_cancellation_message_at]); dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> assert(dc_short_trade_declaration_cancellation_message_read.consume_time[dc_short_trade_declaration_cancellation_message_at] == dc_short_trade_declaration_cancellation_message_written.consume_time[dc_short_trade_declaration_cancellation_message_at]); dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> assert(dc_short_trade_declaration_cancellation_message_read.book_in[dc_short_trade_declaration_cancellation_message_at] == dc_short_trade_declaration_cancellation_message_written.book_in[dc_short_trade_declaration_cancellation_message_at]); dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> assert(dc_short_trade_declaration_cancellation_message_read.event_id[dc_short_trade_declaration_cancellation_message_at] == dc_short_trade_declaration_cancellation_message_written.event_id[dc_short_trade_declaration_cancellation_message_at]); dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  assert(dc_short_trade_declaration_cancellation_message_read.emm == dc_short_trade_declaration_cancellation_message_written.emm);
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> assert(dc_short_trade_declaration_cancellation_message_read.execution_id[dc_short_trade_declaration_cancellation_message_at] == dc_short_trade_declaration_cancellation_message_written.execution_id[dc_short_trade_declaration_cancellation_message_at]); dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 4 -> assert(dc_short_trade_declaration_cancellation_message_read.symbol_index[dc_short_trade_declaration_cancellation_message_at] == dc_short_trade_declaration_cancellation_message_written.symbol_index[dc_short_trade_declaration_cancellation_message_at]); dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> assert(dc_short_trade_declaration_cancellation_message_read.price[dc_short_trade_declaration_cancellation_message_at] == dc_short_trade_declaration_cancellation_message_written.price[dc_short_trade_declaration_cancellation_message_at]); dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  dc_short_trade_declaration_cancellation_message_at = 0;
  do
  :: dc_short_trade_declaration_cancellation_message_at < 8 -> assert(dc_short_trade_declaration_cancellation_message_read.quantity[dc_short_trade_declaration_cancellation_message_at] == dc_short_trade_declaration_cancellation_message_written.quantity[dc_short_trade_declaration_cancellation_message_at]); dc_short_trade_declaration_cancellation_message_at = dc_short_trade_declaration_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Trade Bust Declaration Message: 208 bytes ---------------------------- */

/* DCTradeBustDeclarationMessage */
typedef DcTradeBustDeclarationMessage {
  byte msg_seq_num[4];
  byte produce_time[8];
  byte consume_time[8];
  byte message_sending_time[8];
  byte book_in[8];
  byte book_out_time[8];
  byte oegin_from_member[8];
  byte oegout_time_to_me[8];
  byte event_id[8];
  byte declaration_event_type;
  byte firm_id[8];
  byte oe_session_id[8];
  byte account_type;
  byte client_order_id[8];
  byte emm;
  byte declaration_id[8];
  byte declaration_status;
  byte price_optional[8];
  byte quantity_optional[8];
  byte side;
  byte symbol_index[4];
  byte operation_type;
  byte entering_counterparty[8];
  byte trader_id[16];
  byte investor_id[16];
  byte free_text[18];
  byte clearing_firm_id_optional[8];
  byte clearing_account[16]
};

int dc_trade_bust_declaration_message_at;

/* every byte of Dc Trade Bust Declaration Message set to one value */
inline fill_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_record, dc_trade_bust_declaration_message_value) {
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> dc_trade_bust_declaration_message_record.msg_seq_num[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.produce_time[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.consume_time[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.message_sending_time[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.book_in[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.book_out_time[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.oegin_from_member[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.oegout_time_to_me[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.event_id[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.declaration_event_type = dc_trade_bust_declaration_message_value;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.firm_id[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.oe_session_id[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.account_type = dc_trade_bust_declaration_message_value;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.client_order_id[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.emm = dc_trade_bust_declaration_message_value;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.declaration_id[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.declaration_status = dc_trade_bust_declaration_message_value;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.price_optional[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.quantity_optional[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.side = dc_trade_bust_declaration_message_value;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> dc_trade_bust_declaration_message_record.symbol_index[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.operation_type = dc_trade_bust_declaration_message_value;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.entering_counterparty[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> dc_trade_bust_declaration_message_record.trader_id[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> dc_trade_bust_declaration_message_record.investor_id[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 18 -> dc_trade_bust_declaration_message_record.free_text[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.clearing_firm_id_optional[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> dc_trade_bust_declaration_message_record.clearing_account[dc_trade_bust_declaration_message_at] = dc_trade_bust_declaration_message_value; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Trade Bust Declaration Message set to where it lies, so a field read out of place says so */
inline ramp_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_record, dc_trade_bust_declaration_message_base) {
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> dc_trade_bust_declaration_message_record.msg_seq_num[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 0 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.produce_time[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 4 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.consume_time[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 12 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.message_sending_time[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 20 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.book_in[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 28 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.book_out_time[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 36 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.oegin_from_member[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 44 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.oegout_time_to_me[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 52 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.event_id[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 60 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.declaration_event_type = (dc_trade_bust_declaration_message_base + 68 + 1) % 256;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.firm_id[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 69 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.oe_session_id[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 77 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.account_type = (dc_trade_bust_declaration_message_base + 85 + 1) % 256;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.client_order_id[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 86 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.emm = (dc_trade_bust_declaration_message_base + 94 + 1) % 256;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.declaration_id[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 95 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.declaration_status = (dc_trade_bust_declaration_message_base + 103 + 1) % 256;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.price_optional[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 104 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.quantity_optional[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 112 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.side = (dc_trade_bust_declaration_message_base + 120 + 1) % 256;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> dc_trade_bust_declaration_message_record.symbol_index[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 121 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.operation_type = (dc_trade_bust_declaration_message_base + 125 + 1) % 256;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.entering_counterparty[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 126 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> dc_trade_bust_declaration_message_record.trader_id[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 134 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> dc_trade_bust_declaration_message_record.investor_id[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 150 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 18 -> dc_trade_bust_declaration_message_record.free_text[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 166 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.clearing_firm_id_optional[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 184 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> dc_trade_bust_declaration_message_record.clearing_account[dc_trade_bust_declaration_message_at] = (dc_trade_bust_declaration_message_base + 192 + dc_trade_bust_declaration_message_at + 1) % 256; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Trade Bust Declaration Message to the wire, 208 bytes from where the cursor stands */
inline encode_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_record) {
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> wire[at] = dc_trade_bust_declaration_message_record.msg_seq_num[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.produce_time[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.consume_time[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.message_sending_time[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.book_in[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.book_out_time[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.oegin_from_member[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.oegout_time_to_me[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.event_id[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_trade_bust_declaration_message_record.declaration_event_type; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.firm_id[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.oe_session_id[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_trade_bust_declaration_message_record.account_type; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.client_order_id[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_trade_bust_declaration_message_record.emm; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.declaration_id[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_trade_bust_declaration_message_record.declaration_status; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.price_optional[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.quantity_optional[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_trade_bust_declaration_message_record.side; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> wire[at] = dc_trade_bust_declaration_message_record.symbol_index[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_trade_bust_declaration_message_record.operation_type; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.entering_counterparty[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> wire[at] = dc_trade_bust_declaration_message_record.trader_id[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> wire[at] = dc_trade_bust_declaration_message_record.investor_id[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 18 -> wire[at] = dc_trade_bust_declaration_message_record.free_text[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> wire[at] = dc_trade_bust_declaration_message_record.clearing_firm_id_optional[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> wire[at] = dc_trade_bust_declaration_message_record.clearing_account[dc_trade_bust_declaration_message_at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Trade Bust Declaration Message off the wire, 208 bytes from where the cursor stands */
inline decode_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_record) {
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> dc_trade_bust_declaration_message_record.msg_seq_num[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.produce_time[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.consume_time[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.message_sending_time[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.book_in[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.book_out_time[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.oegin_from_member[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.oegout_time_to_me[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.event_id[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.declaration_event_type = wire[at]; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.firm_id[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.oe_session_id[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.account_type = wire[at]; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.client_order_id[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.emm = wire[at]; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.declaration_id[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.declaration_status = wire[at]; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.price_optional[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.quantity_optional[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.side = wire[at]; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> dc_trade_bust_declaration_message_record.symbol_index[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_record.operation_type = wire[at]; at = at + 1;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.entering_counterparty[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> dc_trade_bust_declaration_message_record.trader_id[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> dc_trade_bust_declaration_message_record.investor_id[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 18 -> dc_trade_bust_declaration_message_record.free_text[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> dc_trade_bust_declaration_message_record.clearing_firm_id_optional[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> dc_trade_bust_declaration_message_record.clearing_account[dc_trade_bust_declaration_message_at] = wire[at]; at = at + 1; dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Trade Bust Declaration Message is what was written, byte for byte */
inline equal_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_read, dc_trade_bust_declaration_message_written) {
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> assert(dc_trade_bust_declaration_message_read.msg_seq_num[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.msg_seq_num[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.produce_time[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.produce_time[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.consume_time[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.consume_time[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.message_sending_time[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.message_sending_time[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.book_in[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.book_in[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.book_out_time[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.book_out_time[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.oegin_from_member[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.oegin_from_member[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.oegout_time_to_me[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.oegout_time_to_me[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.event_id[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.event_id[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  assert(dc_trade_bust_declaration_message_read.declaration_event_type == dc_trade_bust_declaration_message_written.declaration_event_type);
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.firm_id[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.firm_id[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.oe_session_id[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.oe_session_id[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  assert(dc_trade_bust_declaration_message_read.account_type == dc_trade_bust_declaration_message_written.account_type);
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.client_order_id[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.client_order_id[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  assert(dc_trade_bust_declaration_message_read.emm == dc_trade_bust_declaration_message_written.emm);
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.declaration_id[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.declaration_id[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  assert(dc_trade_bust_declaration_message_read.declaration_status == dc_trade_bust_declaration_message_written.declaration_status);
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.price_optional[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.price_optional[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.quantity_optional[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.quantity_optional[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  assert(dc_trade_bust_declaration_message_read.side == dc_trade_bust_declaration_message_written.side);
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 4 -> assert(dc_trade_bust_declaration_message_read.symbol_index[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.symbol_index[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  assert(dc_trade_bust_declaration_message_read.operation_type == dc_trade_bust_declaration_message_written.operation_type);
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.entering_counterparty[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.entering_counterparty[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> assert(dc_trade_bust_declaration_message_read.trader_id[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.trader_id[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> assert(dc_trade_bust_declaration_message_read.investor_id[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.investor_id[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 18 -> assert(dc_trade_bust_declaration_message_read.free_text[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.free_text[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 8 -> assert(dc_trade_bust_declaration_message_read.clearing_firm_id_optional[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.clearing_firm_id_optional[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  dc_trade_bust_declaration_message_at = 0;
  do
  :: dc_trade_bust_declaration_message_at < 16 -> assert(dc_trade_bust_declaration_message_read.clearing_account[dc_trade_bust_declaration_message_at] == dc_trade_bust_declaration_message_written.clearing_account[dc_trade_bust_declaration_message_at]); dc_trade_bust_declaration_message_at = dc_trade_bust_declaration_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Short Declaration Fill Message: 228 bytes ---------------------------- */

/* DCShortDeclarationFillMessage */
typedef DcShortDeclarationFillMessage {
  byte msg_seq_num[4];
  byte produce_time[8];
  byte consume_time[8];
  byte message_sending_time[8];
  byte book_in[8];
  byte book_out_time[8];
  byte oegin_from_member[8];
  byte oegout_time_to_me[8];
  byte operation_type;
  byte declaration_event_type;
  byte declaration_status;
  byte event_id[8];
  byte emm;
  byte symbol_index[4];
  byte declaration_id[8];
  byte price[8];
  byte quantity[8];
  byte side;
  byte cross_order_indicator;
  byte trade_time[8];
  byte entering_counterparty[8];
  byte session_optional;
  byte trade_type;
  byte firm_id[8];
  byte oe_partition_id[2];
  byte logical_access_id[4];
  byte trader_id[16];
  byte investor_id[16];
  byte principal_code[8];
  byte clearing_firm_id_optional[8];
  byte clearing_account[16];
  byte account_type;
  byte client_order_id[8];
  byte free_text[18];
  byte settlement_period_optional;
  byte settlement_flag_optional;
  byte guarantee_flag_optional
};

int dc_short_declaration_fill_message_at;

/* every byte of Dc Short Declaration Fill Message set to one value */
inline fill_dc_short_declaration_fill_message(dc_short_declaration_fill_message_record, dc_short_declaration_fill_message_value) {
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> dc_short_declaration_fill_message_record.msg_seq_num[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.produce_time[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.consume_time[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.message_sending_time[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.book_in[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.book_out_time[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.oegin_from_member[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.oegout_time_to_me[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.operation_type = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_record.declaration_event_type = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_record.declaration_status = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.event_id[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.emm = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> dc_short_declaration_fill_message_record.symbol_index[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.declaration_id[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.price[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.quantity[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.side = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_record.cross_order_indicator = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.trade_time[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.entering_counterparty[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.session_optional = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_record.trade_type = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.firm_id[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 2 -> dc_short_declaration_fill_message_record.oe_partition_id[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> dc_short_declaration_fill_message_record.logical_access_id[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> dc_short_declaration_fill_message_record.trader_id[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> dc_short_declaration_fill_message_record.investor_id[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.principal_code[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.clearing_firm_id_optional[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> dc_short_declaration_fill_message_record.clearing_account[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.account_type = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.client_order_id[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 18 -> dc_short_declaration_fill_message_record.free_text[dc_short_declaration_fill_message_at] = dc_short_declaration_fill_message_value; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.settlement_period_optional = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_record.settlement_flag_optional = dc_short_declaration_fill_message_value;
  dc_short_declaration_fill_message_record.guarantee_flag_optional = dc_short_declaration_fill_message_value;
  skip
}

/* each byte of Dc Short Declaration Fill Message set to where it lies, so a field read out of place says so */
inline ramp_dc_short_declaration_fill_message(dc_short_declaration_fill_message_record, dc_short_declaration_fill_message_base) {
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> dc_short_declaration_fill_message_record.msg_seq_num[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 0 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.produce_time[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 4 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.consume_time[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 12 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.message_sending_time[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 20 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.book_in[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 28 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.book_out_time[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 36 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.oegin_from_member[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 44 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.oegout_time_to_me[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 52 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.operation_type = (dc_short_declaration_fill_message_base + 60 + 1) % 256;
  dc_short_declaration_fill_message_record.declaration_event_type = (dc_short_declaration_fill_message_base + 61 + 1) % 256;
  dc_short_declaration_fill_message_record.declaration_status = (dc_short_declaration_fill_message_base + 62 + 1) % 256;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.event_id[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 63 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.emm = (dc_short_declaration_fill_message_base + 71 + 1) % 256;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> dc_short_declaration_fill_message_record.symbol_index[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 72 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.declaration_id[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 76 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.price[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 84 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.quantity[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 92 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.side = (dc_short_declaration_fill_message_base + 100 + 1) % 256;
  dc_short_declaration_fill_message_record.cross_order_indicator = (dc_short_declaration_fill_message_base + 101 + 1) % 256;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.trade_time[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 102 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.entering_counterparty[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 110 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.session_optional = (dc_short_declaration_fill_message_base + 118 + 1) % 256;
  dc_short_declaration_fill_message_record.trade_type = (dc_short_declaration_fill_message_base + 119 + 1) % 256;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.firm_id[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 120 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 2 -> dc_short_declaration_fill_message_record.oe_partition_id[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 128 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> dc_short_declaration_fill_message_record.logical_access_id[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 130 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> dc_short_declaration_fill_message_record.trader_id[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 134 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> dc_short_declaration_fill_message_record.investor_id[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 150 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.principal_code[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 166 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.clearing_firm_id_optional[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 174 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> dc_short_declaration_fill_message_record.clearing_account[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 182 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.account_type = (dc_short_declaration_fill_message_base + 198 + 1) % 256;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.client_order_id[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 199 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 18 -> dc_short_declaration_fill_message_record.free_text[dc_short_declaration_fill_message_at] = (dc_short_declaration_fill_message_base + 207 + dc_short_declaration_fill_message_at + 1) % 256; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.settlement_period_optional = (dc_short_declaration_fill_message_base + 225 + 1) % 256;
  dc_short_declaration_fill_message_record.settlement_flag_optional = (dc_short_declaration_fill_message_base + 226 + 1) % 256;
  dc_short_declaration_fill_message_record.guarantee_flag_optional = (dc_short_declaration_fill_message_base + 227 + 1) % 256;
  skip
}

/* Dc Short Declaration Fill Message to the wire, 228 bytes from where the cursor stands */
inline encode_dc_short_declaration_fill_message(dc_short_declaration_fill_message_record) {
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> wire[at] = dc_short_declaration_fill_message_record.msg_seq_num[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.produce_time[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.consume_time[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.message_sending_time[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.book_in[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.book_out_time[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.oegin_from_member[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.oegout_time_to_me[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_fill_message_record.operation_type; at = at + 1;
  wire[at] = dc_short_declaration_fill_message_record.declaration_event_type; at = at + 1;
  wire[at] = dc_short_declaration_fill_message_record.declaration_status; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.event_id[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_fill_message_record.emm; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> wire[at] = dc_short_declaration_fill_message_record.symbol_index[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.declaration_id[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.price[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.quantity[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_fill_message_record.side; at = at + 1;
  wire[at] = dc_short_declaration_fill_message_record.cross_order_indicator; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.trade_time[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.entering_counterparty[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_fill_message_record.session_optional; at = at + 1;
  wire[at] = dc_short_declaration_fill_message_record.trade_type; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.firm_id[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 2 -> wire[at] = dc_short_declaration_fill_message_record.oe_partition_id[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> wire[at] = dc_short_declaration_fill_message_record.logical_access_id[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> wire[at] = dc_short_declaration_fill_message_record.trader_id[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> wire[at] = dc_short_declaration_fill_message_record.investor_id[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.principal_code[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.clearing_firm_id_optional[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> wire[at] = dc_short_declaration_fill_message_record.clearing_account[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_fill_message_record.account_type; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> wire[at] = dc_short_declaration_fill_message_record.client_order_id[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 18 -> wire[at] = dc_short_declaration_fill_message_record.free_text[dc_short_declaration_fill_message_at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_short_declaration_fill_message_record.settlement_period_optional; at = at + 1;
  wire[at] = dc_short_declaration_fill_message_record.settlement_flag_optional; at = at + 1;
  wire[at] = dc_short_declaration_fill_message_record.guarantee_flag_optional; at = at + 1;
  skip
}

/* Dc Short Declaration Fill Message off the wire, 228 bytes from where the cursor stands */
inline decode_dc_short_declaration_fill_message(dc_short_declaration_fill_message_record) {
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> dc_short_declaration_fill_message_record.msg_seq_num[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.produce_time[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.consume_time[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.message_sending_time[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.book_in[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.book_out_time[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.oegin_from_member[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.oegout_time_to_me[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.operation_type = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_record.declaration_event_type = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_record.declaration_status = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.event_id[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.emm = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> dc_short_declaration_fill_message_record.symbol_index[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.declaration_id[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.price[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.quantity[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.side = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_record.cross_order_indicator = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.trade_time[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.entering_counterparty[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.session_optional = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_record.trade_type = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.firm_id[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 2 -> dc_short_declaration_fill_message_record.oe_partition_id[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> dc_short_declaration_fill_message_record.logical_access_id[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> dc_short_declaration_fill_message_record.trader_id[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> dc_short_declaration_fill_message_record.investor_id[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.principal_code[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.clearing_firm_id_optional[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> dc_short_declaration_fill_message_record.clearing_account[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.account_type = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> dc_short_declaration_fill_message_record.client_order_id[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 18 -> dc_short_declaration_fill_message_record.free_text[dc_short_declaration_fill_message_at] = wire[at]; at = at + 1; dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_record.settlement_period_optional = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_record.settlement_flag_optional = wire[at]; at = at + 1;
  dc_short_declaration_fill_message_record.guarantee_flag_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Dc Short Declaration Fill Message is what was written, byte for byte */
inline equal_dc_short_declaration_fill_message(dc_short_declaration_fill_message_read, dc_short_declaration_fill_message_written) {
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> assert(dc_short_declaration_fill_message_read.msg_seq_num[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.msg_seq_num[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.produce_time[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.produce_time[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.consume_time[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.consume_time[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.message_sending_time[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.message_sending_time[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.book_in[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.book_in[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.book_out_time[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.book_out_time[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.oegin_from_member[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.oegin_from_member[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.oegout_time_to_me[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.oegout_time_to_me[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_fill_message_read.operation_type == dc_short_declaration_fill_message_written.operation_type);
  assert(dc_short_declaration_fill_message_read.declaration_event_type == dc_short_declaration_fill_message_written.declaration_event_type);
  assert(dc_short_declaration_fill_message_read.declaration_status == dc_short_declaration_fill_message_written.declaration_status);
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.event_id[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.event_id[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_fill_message_read.emm == dc_short_declaration_fill_message_written.emm);
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> assert(dc_short_declaration_fill_message_read.symbol_index[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.symbol_index[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.declaration_id[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.declaration_id[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.price[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.price[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.quantity[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.quantity[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_fill_message_read.side == dc_short_declaration_fill_message_written.side);
  assert(dc_short_declaration_fill_message_read.cross_order_indicator == dc_short_declaration_fill_message_written.cross_order_indicator);
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.trade_time[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.trade_time[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.entering_counterparty[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.entering_counterparty[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_fill_message_read.session_optional == dc_short_declaration_fill_message_written.session_optional);
  assert(dc_short_declaration_fill_message_read.trade_type == dc_short_declaration_fill_message_written.trade_type);
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.firm_id[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.firm_id[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 2 -> assert(dc_short_declaration_fill_message_read.oe_partition_id[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.oe_partition_id[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 4 -> assert(dc_short_declaration_fill_message_read.logical_access_id[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.logical_access_id[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> assert(dc_short_declaration_fill_message_read.trader_id[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.trader_id[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> assert(dc_short_declaration_fill_message_read.investor_id[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.investor_id[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.principal_code[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.principal_code[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.clearing_firm_id_optional[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.clearing_firm_id_optional[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 16 -> assert(dc_short_declaration_fill_message_read.clearing_account[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.clearing_account[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_fill_message_read.account_type == dc_short_declaration_fill_message_written.account_type);
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 8 -> assert(dc_short_declaration_fill_message_read.client_order_id[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.client_order_id[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  dc_short_declaration_fill_message_at = 0;
  do
  :: dc_short_declaration_fill_message_at < 18 -> assert(dc_short_declaration_fill_message_read.free_text[dc_short_declaration_fill_message_at] == dc_short_declaration_fill_message_written.free_text[dc_short_declaration_fill_message_at]); dc_short_declaration_fill_message_at = dc_short_declaration_fill_message_at + 1
  :: else -> break
  od;
  assert(dc_short_declaration_fill_message_read.settlement_period_optional == dc_short_declaration_fill_message_written.settlement_period_optional);
  assert(dc_short_declaration_fill_message_read.settlement_flag_optional == dc_short_declaration_fill_message_written.settlement_flag_optional);
  assert(dc_short_declaration_fill_message_read.guarantee_flag_optional == dc_short_declaration_fill_message_written.guarantee_flag_optional);
  skip
}

/* ---- Dc Clear Book Message: 37 bytes ----------------------------------------- */

/* DCClearBookMessage */
typedef DcClearBookMessage {
  byte produce_time[8];
  byte consume_time[8];
  byte sequence_time[8];
  byte book_in_time[8];
  byte symbol_index[4];
  byte emm
};

int dc_clear_book_message_at;

/* every byte of Dc Clear Book Message set to one value */
inline fill_dc_clear_book_message(dc_clear_book_message_record, dc_clear_book_message_value) {
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.produce_time[dc_clear_book_message_at] = dc_clear_book_message_value; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.consume_time[dc_clear_book_message_at] = dc_clear_book_message_value; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.sequence_time[dc_clear_book_message_at] = dc_clear_book_message_value; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.book_in_time[dc_clear_book_message_at] = dc_clear_book_message_value; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 4 -> dc_clear_book_message_record.symbol_index[dc_clear_book_message_at] = dc_clear_book_message_value; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_record.emm = dc_clear_book_message_value;
  skip
}

/* each byte of Dc Clear Book Message set to where it lies, so a field read out of place says so */
inline ramp_dc_clear_book_message(dc_clear_book_message_record, dc_clear_book_message_base) {
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.produce_time[dc_clear_book_message_at] = (dc_clear_book_message_base + 0 + dc_clear_book_message_at + 1) % 256; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.consume_time[dc_clear_book_message_at] = (dc_clear_book_message_base + 8 + dc_clear_book_message_at + 1) % 256; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.sequence_time[dc_clear_book_message_at] = (dc_clear_book_message_base + 16 + dc_clear_book_message_at + 1) % 256; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.book_in_time[dc_clear_book_message_at] = (dc_clear_book_message_base + 24 + dc_clear_book_message_at + 1) % 256; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 4 -> dc_clear_book_message_record.symbol_index[dc_clear_book_message_at] = (dc_clear_book_message_base + 32 + dc_clear_book_message_at + 1) % 256; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_record.emm = (dc_clear_book_message_base + 36 + 1) % 256;
  skip
}

/* Dc Clear Book Message to the wire, 37 bytes from where the cursor stands */
inline encode_dc_clear_book_message(dc_clear_book_message_record) {
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> wire[at] = dc_clear_book_message_record.produce_time[dc_clear_book_message_at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> wire[at] = dc_clear_book_message_record.consume_time[dc_clear_book_message_at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> wire[at] = dc_clear_book_message_record.sequence_time[dc_clear_book_message_at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> wire[at] = dc_clear_book_message_record.book_in_time[dc_clear_book_message_at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 4 -> wire[at] = dc_clear_book_message_record.symbol_index[dc_clear_book_message_at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  wire[at] = dc_clear_book_message_record.emm; at = at + 1;
  skip
}

/* Dc Clear Book Message off the wire, 37 bytes from where the cursor stands */
inline decode_dc_clear_book_message(dc_clear_book_message_record) {
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.produce_time[dc_clear_book_message_at] = wire[at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.consume_time[dc_clear_book_message_at] = wire[at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.sequence_time[dc_clear_book_message_at] = wire[at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> dc_clear_book_message_record.book_in_time[dc_clear_book_message_at] = wire[at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 4 -> dc_clear_book_message_record.symbol_index[dc_clear_book_message_at] = wire[at]; at = at + 1; dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_record.emm = wire[at]; at = at + 1;
  skip
}

/* what was read of Dc Clear Book Message is what was written, byte for byte */
inline equal_dc_clear_book_message(dc_clear_book_message_read, dc_clear_book_message_written) {
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> assert(dc_clear_book_message_read.produce_time[dc_clear_book_message_at] == dc_clear_book_message_written.produce_time[dc_clear_book_message_at]); dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> assert(dc_clear_book_message_read.consume_time[dc_clear_book_message_at] == dc_clear_book_message_written.consume_time[dc_clear_book_message_at]); dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> assert(dc_clear_book_message_read.sequence_time[dc_clear_book_message_at] == dc_clear_book_message_written.sequence_time[dc_clear_book_message_at]); dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 8 -> assert(dc_clear_book_message_read.book_in_time[dc_clear_book_message_at] == dc_clear_book_message_written.book_in_time[dc_clear_book_message_at]); dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  dc_clear_book_message_at = 0;
  do
  :: dc_clear_book_message_at < 4 -> assert(dc_clear_book_message_read.symbol_index[dc_clear_book_message_at] == dc_clear_book_message_written.symbol_index[dc_clear_book_message_at]); dc_clear_book_message_at = dc_clear_book_message_at + 1
  :: else -> break
  od;
  assert(dc_clear_book_message_read.emm == dc_clear_book_message_written.emm);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Frame Header: encoded, read back, and compared */
proctype check_frame_header() {
  FrameHeader frame_header_sent;
  FrameHeader frame_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_frame_header(frame_header_sent, 0)
  :: pattern == 1 -> fill_frame_header(frame_header_sent, 32)
  :: pattern == 2 -> fill_frame_header(frame_header_sent, 255)
  :: else -> ramp_frame_header(frame_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_frame_header(frame_header_sent);
    assert(at == 2);
    at = 0;
    decode_frame_header(frame_header_got);
    assert(at == 2);
    equal_frame_header(frame_header_got, frame_header_sent)
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Dc Price Update Message: encoded, read back, and compared */
proctype check_dc_price_update_message() {
  DcPriceUpdateMessage dc_price_update_message_sent;
  DcPriceUpdateMessage dc_price_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_price_update_message(dc_price_update_message_sent, 0)
  :: pattern == 1 -> fill_dc_price_update_message(dc_price_update_message_sent, 32)
  :: pattern == 2 -> fill_dc_price_update_message(dc_price_update_message_sent, 255)
  :: else -> ramp_dc_price_update_message(dc_price_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_price_update_message(dc_price_update_message_sent);
    assert(at == 67);
    at = 0;
    decode_dc_price_update_message(dc_price_update_message_got);
    assert(at == 67);
    equal_dc_price_update_message(dc_price_update_message_got, dc_price_update_message_sent)
  }
}

/* Group Size Encoding: encoded, read back, and compared */
proctype check_group_size_encoding() {
  GroupSizeEncoding group_size_encoding_sent;
  GroupSizeEncoding group_size_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size_encoding(group_size_encoding_sent, 0)
  :: pattern == 1 -> fill_group_size_encoding(group_size_encoding_sent, 32)
  :: pattern == 2 -> fill_group_size_encoding(group_size_encoding_sent, 255)
  :: else -> ramp_group_size_encoding(group_size_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size_encoding(group_size_encoding_sent);
    assert(at == 2);
    at = 0;
    decode_group_size_encoding(group_size_encoding_got);
    assert(at == 2);
    equal_group_size_encoding(group_size_encoding_got, group_size_encoding_sent)
  }
}

/* Dc Short Trade Cancellation Message: encoded, read back, and compared */
proctype check_dc_short_trade_cancellation_message() {
  DcShortTradeCancellationMessage dc_short_trade_cancellation_message_sent;
  DcShortTradeCancellationMessage dc_short_trade_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_sent, 255)
  :: else -> ramp_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_sent);
    assert(at == 77);
    at = 0;
    decode_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_got);
    assert(at == 77);
    equal_dc_short_trade_cancellation_message(dc_short_trade_cancellation_message_got, dc_short_trade_cancellation_message_sent)
  }
}

/* Dcafqrfe Message: encoded, read back, and compared */
proctype check_dcafqrfe_message() {
  DcafqrfeMessage dcafqrfe_message_sent;
  DcafqrfeMessage dcafqrfe_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dcafqrfe_message(dcafqrfe_message_sent, 0)
  :: pattern == 1 -> fill_dcafqrfe_message(dcafqrfe_message_sent, 32)
  :: pattern == 2 -> fill_dcafqrfe_message(dcafqrfe_message_sent, 255)
  :: else -> ramp_dcafqrfe_message(dcafqrfe_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dcafqrfe_message(dcafqrfe_message_sent);
    assert(at == 59);
    at = 0;
    decode_dcafqrfe_message(dcafqrfe_message_got);
    assert(at == 59);
    equal_dcafqrfe_message(dcafqrfe_message_got, dcafqrfe_message_sent)
  }
}

/* Dc Declaration New Message: encoded, read back, and compared */
proctype check_dc_declaration_new_message() {
  DcDeclarationNewMessage dc_declaration_new_message_sent;
  DcDeclarationNewMessage dc_declaration_new_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_declaration_new_message(dc_declaration_new_message_sent, 0)
  :: pattern == 1 -> fill_dc_declaration_new_message(dc_declaration_new_message_sent, 32)
  :: pattern == 2 -> fill_dc_declaration_new_message(dc_declaration_new_message_sent, 255)
  :: else -> ramp_dc_declaration_new_message(dc_declaration_new_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_declaration_new_message(dc_declaration_new_message_sent);
    assert(at == 221);
    at = 0;
    decode_dc_declaration_new_message(dc_declaration_new_message_got);
    assert(at == 221);
    equal_dc_declaration_new_message(dc_declaration_new_message_got, dc_declaration_new_message_sent)
  }
}

/* Dc Short Declaration Reject Message: encoded, read back, and compared */
proctype check_dc_short_declaration_reject_message() {
  DcShortDeclarationRejectMessage dc_short_declaration_reject_message_sent;
  DcShortDeclarationRejectMessage dc_short_declaration_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_short_declaration_reject_message(dc_short_declaration_reject_message_sent, 0)
  :: pattern == 1 -> fill_dc_short_declaration_reject_message(dc_short_declaration_reject_message_sent, 32)
  :: pattern == 2 -> fill_dc_short_declaration_reject_message(dc_short_declaration_reject_message_sent, 255)
  :: else -> ramp_dc_short_declaration_reject_message(dc_short_declaration_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_short_declaration_reject_message(dc_short_declaration_reject_message_sent);
    assert(at == 102);
    at = 0;
    decode_dc_short_declaration_reject_message(dc_short_declaration_reject_message_got);
    assert(at == 102);
    equal_dc_short_declaration_reject_message(dc_short_declaration_reject_message_got, dc_short_declaration_reject_message_sent)
  }
}

/* Dc Short Declaration Cancel Message: encoded, read back, and compared */
proctype check_dc_short_declaration_cancel_message() {
  DcShortDeclarationCancelMessage dc_short_declaration_cancel_message_sent;
  DcShortDeclarationCancelMessage dc_short_declaration_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_sent, 0)
  :: pattern == 1 -> fill_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_sent, 32)
  :: pattern == 2 -> fill_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_sent, 255)
  :: else -> ramp_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_sent);
    assert(at == 107);
    at = 0;
    decode_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_got);
    assert(at == 107);
    equal_dc_short_declaration_cancel_message(dc_short_declaration_cancel_message_got, dc_short_declaration_cancel_message_sent)
  }
}

/* Dc Short Trade Declaration Cancellation Message: encoded, read back, and compared */
proctype check_dc_short_trade_declaration_cancellation_message() {
  DcShortTradeDeclarationCancellationMessage dc_short_trade_declaration_cancellation_message_sent;
  DcShortTradeDeclarationCancellationMessage dc_short_trade_declaration_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_sent, 255)
  :: else -> ramp_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_sent);
    assert(at == 61);
    at = 0;
    decode_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_got);
    assert(at == 61);
    equal_dc_short_trade_declaration_cancellation_message(dc_short_trade_declaration_cancellation_message_got, dc_short_trade_declaration_cancellation_message_sent)
  }
}

/* Dc Trade Bust Declaration Message: encoded, read back, and compared */
proctype check_dc_trade_bust_declaration_message() {
  DcTradeBustDeclarationMessage dc_trade_bust_declaration_message_sent;
  DcTradeBustDeclarationMessage dc_trade_bust_declaration_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_sent, 0)
  :: pattern == 1 -> fill_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_sent, 32)
  :: pattern == 2 -> fill_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_sent, 255)
  :: else -> ramp_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_sent);
    assert(at == 208);
    at = 0;
    decode_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_got);
    assert(at == 208);
    equal_dc_trade_bust_declaration_message(dc_trade_bust_declaration_message_got, dc_trade_bust_declaration_message_sent)
  }
}

/* Dc Short Declaration Fill Message: encoded, read back, and compared */
proctype check_dc_short_declaration_fill_message() {
  DcShortDeclarationFillMessage dc_short_declaration_fill_message_sent;
  DcShortDeclarationFillMessage dc_short_declaration_fill_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_short_declaration_fill_message(dc_short_declaration_fill_message_sent, 0)
  :: pattern == 1 -> fill_dc_short_declaration_fill_message(dc_short_declaration_fill_message_sent, 32)
  :: pattern == 2 -> fill_dc_short_declaration_fill_message(dc_short_declaration_fill_message_sent, 255)
  :: else -> ramp_dc_short_declaration_fill_message(dc_short_declaration_fill_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_short_declaration_fill_message(dc_short_declaration_fill_message_sent);
    assert(at == 228);
    at = 0;
    decode_dc_short_declaration_fill_message(dc_short_declaration_fill_message_got);
    assert(at == 228);
    equal_dc_short_declaration_fill_message(dc_short_declaration_fill_message_got, dc_short_declaration_fill_message_sent)
  }
}

/* Dc Clear Book Message: encoded, read back, and compared */
proctype check_dc_clear_book_message() {
  DcClearBookMessage dc_clear_book_message_sent;
  DcClearBookMessage dc_clear_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_clear_book_message(dc_clear_book_message_sent, 0)
  :: pattern == 1 -> fill_dc_clear_book_message(dc_clear_book_message_sent, 32)
  :: pattern == 2 -> fill_dc_clear_book_message(dc_clear_book_message_sent, 255)
  :: else -> ramp_dc_clear_book_message(dc_clear_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_clear_book_message(dc_clear_book_message_sent);
    assert(at == 37);
    at = 0;
    decode_dc_clear_book_message(dc_clear_book_message_got);
    assert(at == 37);
    equal_dc_clear_book_message(dc_clear_book_message_got, dc_clear_book_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_frame_header()
  :: run check_message_header()
  :: run check_dc_price_update_message()
  :: run check_group_size_encoding()
  :: run check_dc_short_trade_cancellation_message()
  :: run check_dcafqrfe_message()
  :: run check_dc_declaration_new_message()
  :: run check_dc_short_declaration_reject_message()
  :: run check_dc_short_declaration_cancel_message()
  :: run check_dc_short_trade_declaration_cancellation_message()
  :: run check_dc_trade_bust_declaration_message()
  :: run check_dc_short_declaration_fill_message()
  :: run check_dc_clear_book_message()
  fi
}
