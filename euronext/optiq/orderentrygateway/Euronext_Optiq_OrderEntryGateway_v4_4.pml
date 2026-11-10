/*
 * Euronext Order Entry Gateway
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
 *   - a Empty element
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 81

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

/* ---- Open Order Request Message: 58 bytes ------------------------------------ */

/* OpenOrderRequestMessage */
typedef OpenOrderRequestMessage {
  byte cl_msg_seq_num[4];
  byte firm_id[8];
  byte sending_time[8];
  byte execution_within_firm_short_code[4];
  byte client_identification_shortcode[4];
  byte client_order_id[8];
  byte order_id_optional[8];
  byte orig_client_order_id[8];
  byte symbol_index[4];
  byte emm;
  byte order_category
};

int open_order_request_message_at;

/* every byte of Open Order Request Message set to one value */
inline fill_open_order_request_message(open_order_request_message_record, open_order_request_message_value) {
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.cl_msg_seq_num[open_order_request_message_at] = open_order_request_message_value; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.firm_id[open_order_request_message_at] = open_order_request_message_value; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.sending_time[open_order_request_message_at] = open_order_request_message_value; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.execution_within_firm_short_code[open_order_request_message_at] = open_order_request_message_value; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.client_identification_shortcode[open_order_request_message_at] = open_order_request_message_value; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.client_order_id[open_order_request_message_at] = open_order_request_message_value; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.order_id_optional[open_order_request_message_at] = open_order_request_message_value; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.orig_client_order_id[open_order_request_message_at] = open_order_request_message_value; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.symbol_index[open_order_request_message_at] = open_order_request_message_value; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_record.emm = open_order_request_message_value;
  open_order_request_message_record.order_category = open_order_request_message_value;
  skip
}

/* each byte of Open Order Request Message set to where it lies, so a field read out of place says so */
inline ramp_open_order_request_message(open_order_request_message_record, open_order_request_message_base) {
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.cl_msg_seq_num[open_order_request_message_at] = (open_order_request_message_base + 0 + open_order_request_message_at + 1) % 256; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.firm_id[open_order_request_message_at] = (open_order_request_message_base + 4 + open_order_request_message_at + 1) % 256; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.sending_time[open_order_request_message_at] = (open_order_request_message_base + 12 + open_order_request_message_at + 1) % 256; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.execution_within_firm_short_code[open_order_request_message_at] = (open_order_request_message_base + 20 + open_order_request_message_at + 1) % 256; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.client_identification_shortcode[open_order_request_message_at] = (open_order_request_message_base + 24 + open_order_request_message_at + 1) % 256; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.client_order_id[open_order_request_message_at] = (open_order_request_message_base + 28 + open_order_request_message_at + 1) % 256; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.order_id_optional[open_order_request_message_at] = (open_order_request_message_base + 36 + open_order_request_message_at + 1) % 256; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.orig_client_order_id[open_order_request_message_at] = (open_order_request_message_base + 44 + open_order_request_message_at + 1) % 256; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.symbol_index[open_order_request_message_at] = (open_order_request_message_base + 52 + open_order_request_message_at + 1) % 256; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_record.emm = (open_order_request_message_base + 56 + 1) % 256;
  open_order_request_message_record.order_category = (open_order_request_message_base + 57 + 1) % 256;
  skip
}

/* Open Order Request Message to the wire, 58 bytes from where the cursor stands */
inline encode_open_order_request_message(open_order_request_message_record) {
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> wire[at] = open_order_request_message_record.cl_msg_seq_num[open_order_request_message_at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> wire[at] = open_order_request_message_record.firm_id[open_order_request_message_at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> wire[at] = open_order_request_message_record.sending_time[open_order_request_message_at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> wire[at] = open_order_request_message_record.execution_within_firm_short_code[open_order_request_message_at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> wire[at] = open_order_request_message_record.client_identification_shortcode[open_order_request_message_at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> wire[at] = open_order_request_message_record.client_order_id[open_order_request_message_at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> wire[at] = open_order_request_message_record.order_id_optional[open_order_request_message_at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> wire[at] = open_order_request_message_record.orig_client_order_id[open_order_request_message_at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> wire[at] = open_order_request_message_record.symbol_index[open_order_request_message_at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  wire[at] = open_order_request_message_record.emm; at = at + 1;
  wire[at] = open_order_request_message_record.order_category; at = at + 1;
  skip
}

/* Open Order Request Message off the wire, 58 bytes from where the cursor stands */
inline decode_open_order_request_message(open_order_request_message_record) {
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.cl_msg_seq_num[open_order_request_message_at] = wire[at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.firm_id[open_order_request_message_at] = wire[at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.sending_time[open_order_request_message_at] = wire[at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.execution_within_firm_short_code[open_order_request_message_at] = wire[at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.client_identification_shortcode[open_order_request_message_at] = wire[at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.client_order_id[open_order_request_message_at] = wire[at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.order_id_optional[open_order_request_message_at] = wire[at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> open_order_request_message_record.orig_client_order_id[open_order_request_message_at] = wire[at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> open_order_request_message_record.symbol_index[open_order_request_message_at] = wire[at]; at = at + 1; open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_record.emm = wire[at]; at = at + 1;
  open_order_request_message_record.order_category = wire[at]; at = at + 1;
  skip
}

/* what was read of Open Order Request Message is what was written, byte for byte */
inline equal_open_order_request_message(open_order_request_message_read, open_order_request_message_written) {
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> assert(open_order_request_message_read.cl_msg_seq_num[open_order_request_message_at] == open_order_request_message_written.cl_msg_seq_num[open_order_request_message_at]); open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> assert(open_order_request_message_read.firm_id[open_order_request_message_at] == open_order_request_message_written.firm_id[open_order_request_message_at]); open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> assert(open_order_request_message_read.sending_time[open_order_request_message_at] == open_order_request_message_written.sending_time[open_order_request_message_at]); open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> assert(open_order_request_message_read.execution_within_firm_short_code[open_order_request_message_at] == open_order_request_message_written.execution_within_firm_short_code[open_order_request_message_at]); open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> assert(open_order_request_message_read.client_identification_shortcode[open_order_request_message_at] == open_order_request_message_written.client_identification_shortcode[open_order_request_message_at]); open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> assert(open_order_request_message_read.client_order_id[open_order_request_message_at] == open_order_request_message_written.client_order_id[open_order_request_message_at]); open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> assert(open_order_request_message_read.order_id_optional[open_order_request_message_at] == open_order_request_message_written.order_id_optional[open_order_request_message_at]); open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 8 -> assert(open_order_request_message_read.orig_client_order_id[open_order_request_message_at] == open_order_request_message_written.orig_client_order_id[open_order_request_message_at]); open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  open_order_request_message_at = 0;
  do
  :: open_order_request_message_at < 4 -> assert(open_order_request_message_read.symbol_index[open_order_request_message_at] == open_order_request_message_written.symbol_index[open_order_request_message_at]); open_order_request_message_at = open_order_request_message_at + 1
  :: else -> break
  od;
  assert(open_order_request_message_read.emm == open_order_request_message_written.emm);
  assert(open_order_request_message_read.order_category == open_order_request_message_written.order_category);
  skip
}

/* ---- Ownership Request Ack Message: 43 bytes --------------------------------- */

/* OwnershipRequestAckMessage */
typedef OwnershipRequestAckMessage {
  byte msg_seq_num[4];
  byte firm_id[8];
  byte client_order_id[8];
  byte order_id_optional[8];
  byte symbol_index[4];
  byte logical_access_id_optional[4];
  byte oe_partition_id_optional[2];
  byte total_affected_orders[4];
  byte order_category
};

int ownership_request_ack_message_at;

/* every byte of Ownership Request Ack Message set to one value */
inline fill_ownership_request_ack_message(ownership_request_ack_message_record, ownership_request_ack_message_value) {
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.msg_seq_num[ownership_request_ack_message_at] = ownership_request_ack_message_value; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> ownership_request_ack_message_record.firm_id[ownership_request_ack_message_at] = ownership_request_ack_message_value; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> ownership_request_ack_message_record.client_order_id[ownership_request_ack_message_at] = ownership_request_ack_message_value; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> ownership_request_ack_message_record.order_id_optional[ownership_request_ack_message_at] = ownership_request_ack_message_value; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.symbol_index[ownership_request_ack_message_at] = ownership_request_ack_message_value; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.logical_access_id_optional[ownership_request_ack_message_at] = ownership_request_ack_message_value; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 2 -> ownership_request_ack_message_record.oe_partition_id_optional[ownership_request_ack_message_at] = ownership_request_ack_message_value; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.total_affected_orders[ownership_request_ack_message_at] = ownership_request_ack_message_value; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_record.order_category = ownership_request_ack_message_value;
  skip
}

/* each byte of Ownership Request Ack Message set to where it lies, so a field read out of place says so */
inline ramp_ownership_request_ack_message(ownership_request_ack_message_record, ownership_request_ack_message_base) {
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.msg_seq_num[ownership_request_ack_message_at] = (ownership_request_ack_message_base + 0 + ownership_request_ack_message_at + 1) % 256; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> ownership_request_ack_message_record.firm_id[ownership_request_ack_message_at] = (ownership_request_ack_message_base + 4 + ownership_request_ack_message_at + 1) % 256; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> ownership_request_ack_message_record.client_order_id[ownership_request_ack_message_at] = (ownership_request_ack_message_base + 12 + ownership_request_ack_message_at + 1) % 256; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> ownership_request_ack_message_record.order_id_optional[ownership_request_ack_message_at] = (ownership_request_ack_message_base + 20 + ownership_request_ack_message_at + 1) % 256; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.symbol_index[ownership_request_ack_message_at] = (ownership_request_ack_message_base + 28 + ownership_request_ack_message_at + 1) % 256; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.logical_access_id_optional[ownership_request_ack_message_at] = (ownership_request_ack_message_base + 32 + ownership_request_ack_message_at + 1) % 256; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 2 -> ownership_request_ack_message_record.oe_partition_id_optional[ownership_request_ack_message_at] = (ownership_request_ack_message_base + 36 + ownership_request_ack_message_at + 1) % 256; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.total_affected_orders[ownership_request_ack_message_at] = (ownership_request_ack_message_base + 38 + ownership_request_ack_message_at + 1) % 256; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_record.order_category = (ownership_request_ack_message_base + 42 + 1) % 256;
  skip
}

/* Ownership Request Ack Message to the wire, 43 bytes from where the cursor stands */
inline encode_ownership_request_ack_message(ownership_request_ack_message_record) {
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> wire[at] = ownership_request_ack_message_record.msg_seq_num[ownership_request_ack_message_at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> wire[at] = ownership_request_ack_message_record.firm_id[ownership_request_ack_message_at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> wire[at] = ownership_request_ack_message_record.client_order_id[ownership_request_ack_message_at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> wire[at] = ownership_request_ack_message_record.order_id_optional[ownership_request_ack_message_at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> wire[at] = ownership_request_ack_message_record.symbol_index[ownership_request_ack_message_at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> wire[at] = ownership_request_ack_message_record.logical_access_id_optional[ownership_request_ack_message_at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 2 -> wire[at] = ownership_request_ack_message_record.oe_partition_id_optional[ownership_request_ack_message_at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> wire[at] = ownership_request_ack_message_record.total_affected_orders[ownership_request_ack_message_at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = ownership_request_ack_message_record.order_category; at = at + 1;
  skip
}

/* Ownership Request Ack Message off the wire, 43 bytes from where the cursor stands */
inline decode_ownership_request_ack_message(ownership_request_ack_message_record) {
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.msg_seq_num[ownership_request_ack_message_at] = wire[at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> ownership_request_ack_message_record.firm_id[ownership_request_ack_message_at] = wire[at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> ownership_request_ack_message_record.client_order_id[ownership_request_ack_message_at] = wire[at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> ownership_request_ack_message_record.order_id_optional[ownership_request_ack_message_at] = wire[at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.symbol_index[ownership_request_ack_message_at] = wire[at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.logical_access_id_optional[ownership_request_ack_message_at] = wire[at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 2 -> ownership_request_ack_message_record.oe_partition_id_optional[ownership_request_ack_message_at] = wire[at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> ownership_request_ack_message_record.total_affected_orders[ownership_request_ack_message_at] = wire[at]; at = at + 1; ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_record.order_category = wire[at]; at = at + 1;
  skip
}

/* what was read of Ownership Request Ack Message is what was written, byte for byte */
inline equal_ownership_request_ack_message(ownership_request_ack_message_read, ownership_request_ack_message_written) {
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> assert(ownership_request_ack_message_read.msg_seq_num[ownership_request_ack_message_at] == ownership_request_ack_message_written.msg_seq_num[ownership_request_ack_message_at]); ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> assert(ownership_request_ack_message_read.firm_id[ownership_request_ack_message_at] == ownership_request_ack_message_written.firm_id[ownership_request_ack_message_at]); ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> assert(ownership_request_ack_message_read.client_order_id[ownership_request_ack_message_at] == ownership_request_ack_message_written.client_order_id[ownership_request_ack_message_at]); ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 8 -> assert(ownership_request_ack_message_read.order_id_optional[ownership_request_ack_message_at] == ownership_request_ack_message_written.order_id_optional[ownership_request_ack_message_at]); ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> assert(ownership_request_ack_message_read.symbol_index[ownership_request_ack_message_at] == ownership_request_ack_message_written.symbol_index[ownership_request_ack_message_at]); ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> assert(ownership_request_ack_message_read.logical_access_id_optional[ownership_request_ack_message_at] == ownership_request_ack_message_written.logical_access_id_optional[ownership_request_ack_message_at]); ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 2 -> assert(ownership_request_ack_message_read.oe_partition_id_optional[ownership_request_ack_message_at] == ownership_request_ack_message_written.oe_partition_id_optional[ownership_request_ack_message_at]); ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  ownership_request_ack_message_at = 0;
  do
  :: ownership_request_ack_message_at < 4 -> assert(ownership_request_ack_message_read.total_affected_orders[ownership_request_ack_message_at] == ownership_request_ack_message_written.total_affected_orders[ownership_request_ack_message_at]); ownership_request_ack_message_at = ownership_request_ack_message_at + 1
  :: else -> break
  od;
  assert(ownership_request_ack_message_read.order_category == ownership_request_ack_message_written.order_category);
  skip
}

/* ---- Ownership Request Message: 64 bytes ------------------------------------- */

/* OwnershipRequestMessage */
typedef OwnershipRequestMessage {
  byte cl_msg_seq_num[4];
  byte firm_id[8];
  byte sending_time[8];
  byte execution_within_firm_short_code[4];
  byte client_identification_shortcode[4];
  byte client_order_id[8];
  byte order_id_optional[8];
  byte orig_client_order_id[8];
  byte symbol_index[4];
  byte emm;
  byte logical_access_id_optional[4];
  byte oe_partition_id_optional[2];
  byte order_category
};

int ownership_request_message_at;

/* every byte of Ownership Request Message set to one value */
inline fill_ownership_request_message(ownership_request_message_record, ownership_request_message_value) {
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.cl_msg_seq_num[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.firm_id[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.sending_time[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.execution_within_firm_short_code[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.client_identification_shortcode[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.client_order_id[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.order_id_optional[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.orig_client_order_id[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.symbol_index[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_record.emm = ownership_request_message_value;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.logical_access_id_optional[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 2 -> ownership_request_message_record.oe_partition_id_optional[ownership_request_message_at] = ownership_request_message_value; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_record.order_category = ownership_request_message_value;
  skip
}

/* each byte of Ownership Request Message set to where it lies, so a field read out of place says so */
inline ramp_ownership_request_message(ownership_request_message_record, ownership_request_message_base) {
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.cl_msg_seq_num[ownership_request_message_at] = (ownership_request_message_base + 0 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.firm_id[ownership_request_message_at] = (ownership_request_message_base + 4 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.sending_time[ownership_request_message_at] = (ownership_request_message_base + 12 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.execution_within_firm_short_code[ownership_request_message_at] = (ownership_request_message_base + 20 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.client_identification_shortcode[ownership_request_message_at] = (ownership_request_message_base + 24 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.client_order_id[ownership_request_message_at] = (ownership_request_message_base + 28 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.order_id_optional[ownership_request_message_at] = (ownership_request_message_base + 36 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.orig_client_order_id[ownership_request_message_at] = (ownership_request_message_base + 44 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.symbol_index[ownership_request_message_at] = (ownership_request_message_base + 52 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_record.emm = (ownership_request_message_base + 56 + 1) % 256;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.logical_access_id_optional[ownership_request_message_at] = (ownership_request_message_base + 57 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 2 -> ownership_request_message_record.oe_partition_id_optional[ownership_request_message_at] = (ownership_request_message_base + 61 + ownership_request_message_at + 1) % 256; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_record.order_category = (ownership_request_message_base + 63 + 1) % 256;
  skip
}

/* Ownership Request Message to the wire, 64 bytes from where the cursor stands */
inline encode_ownership_request_message(ownership_request_message_record) {
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> wire[at] = ownership_request_message_record.cl_msg_seq_num[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> wire[at] = ownership_request_message_record.firm_id[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> wire[at] = ownership_request_message_record.sending_time[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> wire[at] = ownership_request_message_record.execution_within_firm_short_code[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> wire[at] = ownership_request_message_record.client_identification_shortcode[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> wire[at] = ownership_request_message_record.client_order_id[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> wire[at] = ownership_request_message_record.order_id_optional[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> wire[at] = ownership_request_message_record.orig_client_order_id[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> wire[at] = ownership_request_message_record.symbol_index[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  wire[at] = ownership_request_message_record.emm; at = at + 1;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> wire[at] = ownership_request_message_record.logical_access_id_optional[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 2 -> wire[at] = ownership_request_message_record.oe_partition_id_optional[ownership_request_message_at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  wire[at] = ownership_request_message_record.order_category; at = at + 1;
  skip
}

/* Ownership Request Message off the wire, 64 bytes from where the cursor stands */
inline decode_ownership_request_message(ownership_request_message_record) {
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.cl_msg_seq_num[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.firm_id[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.sending_time[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.execution_within_firm_short_code[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.client_identification_shortcode[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.client_order_id[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.order_id_optional[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> ownership_request_message_record.orig_client_order_id[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.symbol_index[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_record.emm = wire[at]; at = at + 1;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> ownership_request_message_record.logical_access_id_optional[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 2 -> ownership_request_message_record.oe_partition_id_optional[ownership_request_message_at] = wire[at]; at = at + 1; ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_record.order_category = wire[at]; at = at + 1;
  skip
}

/* what was read of Ownership Request Message is what was written, byte for byte */
inline equal_ownership_request_message(ownership_request_message_read, ownership_request_message_written) {
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> assert(ownership_request_message_read.cl_msg_seq_num[ownership_request_message_at] == ownership_request_message_written.cl_msg_seq_num[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> assert(ownership_request_message_read.firm_id[ownership_request_message_at] == ownership_request_message_written.firm_id[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> assert(ownership_request_message_read.sending_time[ownership_request_message_at] == ownership_request_message_written.sending_time[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> assert(ownership_request_message_read.execution_within_firm_short_code[ownership_request_message_at] == ownership_request_message_written.execution_within_firm_short_code[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> assert(ownership_request_message_read.client_identification_shortcode[ownership_request_message_at] == ownership_request_message_written.client_identification_shortcode[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> assert(ownership_request_message_read.client_order_id[ownership_request_message_at] == ownership_request_message_written.client_order_id[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> assert(ownership_request_message_read.order_id_optional[ownership_request_message_at] == ownership_request_message_written.order_id_optional[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 8 -> assert(ownership_request_message_read.orig_client_order_id[ownership_request_message_at] == ownership_request_message_written.orig_client_order_id[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> assert(ownership_request_message_read.symbol_index[ownership_request_message_at] == ownership_request_message_written.symbol_index[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  assert(ownership_request_message_read.emm == ownership_request_message_written.emm);
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 4 -> assert(ownership_request_message_read.logical_access_id_optional[ownership_request_message_at] == ownership_request_message_written.logical_access_id_optional[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  ownership_request_message_at = 0;
  do
  :: ownership_request_message_at < 2 -> assert(ownership_request_message_read.oe_partition_id_optional[ownership_request_message_at] == ownership_request_message_written.oe_partition_id_optional[ownership_request_message_at]); ownership_request_message_at = ownership_request_message_at + 1
  :: else -> break
  od;
  assert(ownership_request_message_read.order_category == ownership_request_message_written.order_category);
  skip
}

/* ---- Trade Bust Notification Message: 81 bytes ------------------------------- */

/* TradeBustNotificationMessage */
typedef TradeBustNotificationMessage {
  byte msg_seq_num[4];
  byte firm_id[8];
  byte book_in[8];
  byte book_out_time_optional[8];
  byte oeg_in_from_me_optional[8];
  byte oeg_out_to_member_optional[8];
  byte symbol_index[4];
  byte emm;
  byte execution_id[4];
  byte last_traded_px[8];
  byte last_shares[8];
  byte lis_transaction_id[4];
  byte parent_exec_id[4];
  byte parent_symbol_index[4]
};

int trade_bust_notification_message_at;

/* every byte of Trade Bust Notification Message set to one value */
inline fill_trade_bust_notification_message(trade_bust_notification_message_record, trade_bust_notification_message_value) {
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.msg_seq_num[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.firm_id[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.book_in[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.book_out_time_optional[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.oeg_in_from_me_optional[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.oeg_out_to_member_optional[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.symbol_index[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_record.emm = trade_bust_notification_message_value;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.execution_id[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.last_traded_px[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.last_shares[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.lis_transaction_id[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.parent_exec_id[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.parent_symbol_index[trade_bust_notification_message_at] = trade_bust_notification_message_value; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Bust Notification Message set to where it lies, so a field read out of place says so */
inline ramp_trade_bust_notification_message(trade_bust_notification_message_record, trade_bust_notification_message_base) {
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.msg_seq_num[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 0 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.firm_id[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 4 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.book_in[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 12 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.book_out_time_optional[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 20 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.oeg_in_from_me_optional[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 28 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.oeg_out_to_member_optional[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 36 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.symbol_index[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 44 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_record.emm = (trade_bust_notification_message_base + 48 + 1) % 256;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.execution_id[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 49 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.last_traded_px[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 53 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.last_shares[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 61 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.lis_transaction_id[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 69 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.parent_exec_id[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 73 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.parent_symbol_index[trade_bust_notification_message_at] = (trade_bust_notification_message_base + 77 + trade_bust_notification_message_at + 1) % 256; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Notification Message to the wire, 81 bytes from where the cursor stands */
inline encode_trade_bust_notification_message(trade_bust_notification_message_record) {
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> wire[at] = trade_bust_notification_message_record.msg_seq_num[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> wire[at] = trade_bust_notification_message_record.firm_id[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> wire[at] = trade_bust_notification_message_record.book_in[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> wire[at] = trade_bust_notification_message_record.book_out_time_optional[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> wire[at] = trade_bust_notification_message_record.oeg_in_from_me_optional[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> wire[at] = trade_bust_notification_message_record.oeg_out_to_member_optional[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> wire[at] = trade_bust_notification_message_record.symbol_index[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_bust_notification_message_record.emm; at = at + 1;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> wire[at] = trade_bust_notification_message_record.execution_id[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> wire[at] = trade_bust_notification_message_record.last_traded_px[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> wire[at] = trade_bust_notification_message_record.last_shares[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> wire[at] = trade_bust_notification_message_record.lis_transaction_id[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> wire[at] = trade_bust_notification_message_record.parent_exec_id[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> wire[at] = trade_bust_notification_message_record.parent_symbol_index[trade_bust_notification_message_at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Notification Message off the wire, 81 bytes from where the cursor stands */
inline decode_trade_bust_notification_message(trade_bust_notification_message_record) {
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.msg_seq_num[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.firm_id[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.book_in[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.book_out_time_optional[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.oeg_in_from_me_optional[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.oeg_out_to_member_optional[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.symbol_index[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_record.emm = wire[at]; at = at + 1;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.execution_id[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.last_traded_px[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> trade_bust_notification_message_record.last_shares[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.lis_transaction_id[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.parent_exec_id[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> trade_bust_notification_message_record.parent_symbol_index[trade_bust_notification_message_at] = wire[at]; at = at + 1; trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Bust Notification Message is what was written, byte for byte */
inline equal_trade_bust_notification_message(trade_bust_notification_message_read, trade_bust_notification_message_written) {
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> assert(trade_bust_notification_message_read.msg_seq_num[trade_bust_notification_message_at] == trade_bust_notification_message_written.msg_seq_num[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> assert(trade_bust_notification_message_read.firm_id[trade_bust_notification_message_at] == trade_bust_notification_message_written.firm_id[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> assert(trade_bust_notification_message_read.book_in[trade_bust_notification_message_at] == trade_bust_notification_message_written.book_in[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> assert(trade_bust_notification_message_read.book_out_time_optional[trade_bust_notification_message_at] == trade_bust_notification_message_written.book_out_time_optional[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> assert(trade_bust_notification_message_read.oeg_in_from_me_optional[trade_bust_notification_message_at] == trade_bust_notification_message_written.oeg_in_from_me_optional[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> assert(trade_bust_notification_message_read.oeg_out_to_member_optional[trade_bust_notification_message_at] == trade_bust_notification_message_written.oeg_out_to_member_optional[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> assert(trade_bust_notification_message_read.symbol_index[trade_bust_notification_message_at] == trade_bust_notification_message_written.symbol_index[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  assert(trade_bust_notification_message_read.emm == trade_bust_notification_message_written.emm);
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> assert(trade_bust_notification_message_read.execution_id[trade_bust_notification_message_at] == trade_bust_notification_message_written.execution_id[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> assert(trade_bust_notification_message_read.last_traded_px[trade_bust_notification_message_at] == trade_bust_notification_message_written.last_traded_px[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 8 -> assert(trade_bust_notification_message_read.last_shares[trade_bust_notification_message_at] == trade_bust_notification_message_written.last_shares[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> assert(trade_bust_notification_message_read.lis_transaction_id[trade_bust_notification_message_at] == trade_bust_notification_message_written.lis_transaction_id[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> assert(trade_bust_notification_message_read.parent_exec_id[trade_bust_notification_message_at] == trade_bust_notification_message_written.parent_exec_id[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  trade_bust_notification_message_at = 0;
  do
  :: trade_bust_notification_message_at < 4 -> assert(trade_bust_notification_message_read.parent_symbol_index[trade_bust_notification_message_at] == trade_bust_notification_message_written.parent_symbol_index[trade_bust_notification_message_at]); trade_bust_notification_message_at = trade_bust_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Collar Breach Confirmation Message: 57 bytes ---------------------------- */

/* CollarBreachConfirmationMessage */
typedef CollarBreachConfirmationMessage {
  byte cl_msg_seq_num[4];
  byte firm_id[8];
  byte sending_time[8];
  byte execution_within_firm_short_code[4];
  byte client_identification_shortcode[4];
  byte client_order_id[8];
  byte symbol_index[4];
  byte emm;
  byte order_id_optional[8];
  byte orig_client_order_id[8]
};

int collar_breach_confirmation_message_at;

/* every byte of Collar Breach Confirmation Message set to one value */
inline fill_collar_breach_confirmation_message(collar_breach_confirmation_message_record, collar_breach_confirmation_message_value) {
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.cl_msg_seq_num[collar_breach_confirmation_message_at] = collar_breach_confirmation_message_value; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.firm_id[collar_breach_confirmation_message_at] = collar_breach_confirmation_message_value; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.sending_time[collar_breach_confirmation_message_at] = collar_breach_confirmation_message_value; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.execution_within_firm_short_code[collar_breach_confirmation_message_at] = collar_breach_confirmation_message_value; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.client_identification_shortcode[collar_breach_confirmation_message_at] = collar_breach_confirmation_message_value; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.client_order_id[collar_breach_confirmation_message_at] = collar_breach_confirmation_message_value; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.symbol_index[collar_breach_confirmation_message_at] = collar_breach_confirmation_message_value; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_record.emm = collar_breach_confirmation_message_value;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.order_id_optional[collar_breach_confirmation_message_at] = collar_breach_confirmation_message_value; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.orig_client_order_id[collar_breach_confirmation_message_at] = collar_breach_confirmation_message_value; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Collar Breach Confirmation Message set to where it lies, so a field read out of place says so */
inline ramp_collar_breach_confirmation_message(collar_breach_confirmation_message_record, collar_breach_confirmation_message_base) {
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.cl_msg_seq_num[collar_breach_confirmation_message_at] = (collar_breach_confirmation_message_base + 0 + collar_breach_confirmation_message_at + 1) % 256; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.firm_id[collar_breach_confirmation_message_at] = (collar_breach_confirmation_message_base + 4 + collar_breach_confirmation_message_at + 1) % 256; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.sending_time[collar_breach_confirmation_message_at] = (collar_breach_confirmation_message_base + 12 + collar_breach_confirmation_message_at + 1) % 256; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.execution_within_firm_short_code[collar_breach_confirmation_message_at] = (collar_breach_confirmation_message_base + 20 + collar_breach_confirmation_message_at + 1) % 256; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.client_identification_shortcode[collar_breach_confirmation_message_at] = (collar_breach_confirmation_message_base + 24 + collar_breach_confirmation_message_at + 1) % 256; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.client_order_id[collar_breach_confirmation_message_at] = (collar_breach_confirmation_message_base + 28 + collar_breach_confirmation_message_at + 1) % 256; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.symbol_index[collar_breach_confirmation_message_at] = (collar_breach_confirmation_message_base + 36 + collar_breach_confirmation_message_at + 1) % 256; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_record.emm = (collar_breach_confirmation_message_base + 40 + 1) % 256;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.order_id_optional[collar_breach_confirmation_message_at] = (collar_breach_confirmation_message_base + 41 + collar_breach_confirmation_message_at + 1) % 256; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.orig_client_order_id[collar_breach_confirmation_message_at] = (collar_breach_confirmation_message_base + 49 + collar_breach_confirmation_message_at + 1) % 256; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Collar Breach Confirmation Message to the wire, 57 bytes from where the cursor stands */
inline encode_collar_breach_confirmation_message(collar_breach_confirmation_message_record) {
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> wire[at] = collar_breach_confirmation_message_record.cl_msg_seq_num[collar_breach_confirmation_message_at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> wire[at] = collar_breach_confirmation_message_record.firm_id[collar_breach_confirmation_message_at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> wire[at] = collar_breach_confirmation_message_record.sending_time[collar_breach_confirmation_message_at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> wire[at] = collar_breach_confirmation_message_record.execution_within_firm_short_code[collar_breach_confirmation_message_at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> wire[at] = collar_breach_confirmation_message_record.client_identification_shortcode[collar_breach_confirmation_message_at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> wire[at] = collar_breach_confirmation_message_record.client_order_id[collar_breach_confirmation_message_at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> wire[at] = collar_breach_confirmation_message_record.symbol_index[collar_breach_confirmation_message_at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  wire[at] = collar_breach_confirmation_message_record.emm; at = at + 1;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> wire[at] = collar_breach_confirmation_message_record.order_id_optional[collar_breach_confirmation_message_at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> wire[at] = collar_breach_confirmation_message_record.orig_client_order_id[collar_breach_confirmation_message_at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Collar Breach Confirmation Message off the wire, 57 bytes from where the cursor stands */
inline decode_collar_breach_confirmation_message(collar_breach_confirmation_message_record) {
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.cl_msg_seq_num[collar_breach_confirmation_message_at] = wire[at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.firm_id[collar_breach_confirmation_message_at] = wire[at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.sending_time[collar_breach_confirmation_message_at] = wire[at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.execution_within_firm_short_code[collar_breach_confirmation_message_at] = wire[at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.client_identification_shortcode[collar_breach_confirmation_message_at] = wire[at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.client_order_id[collar_breach_confirmation_message_at] = wire[at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> collar_breach_confirmation_message_record.symbol_index[collar_breach_confirmation_message_at] = wire[at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_record.emm = wire[at]; at = at + 1;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.order_id_optional[collar_breach_confirmation_message_at] = wire[at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> collar_breach_confirmation_message_record.orig_client_order_id[collar_breach_confirmation_message_at] = wire[at]; at = at + 1; collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Collar Breach Confirmation Message is what was written, byte for byte */
inline equal_collar_breach_confirmation_message(collar_breach_confirmation_message_read, collar_breach_confirmation_message_written) {
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> assert(collar_breach_confirmation_message_read.cl_msg_seq_num[collar_breach_confirmation_message_at] == collar_breach_confirmation_message_written.cl_msg_seq_num[collar_breach_confirmation_message_at]); collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> assert(collar_breach_confirmation_message_read.firm_id[collar_breach_confirmation_message_at] == collar_breach_confirmation_message_written.firm_id[collar_breach_confirmation_message_at]); collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> assert(collar_breach_confirmation_message_read.sending_time[collar_breach_confirmation_message_at] == collar_breach_confirmation_message_written.sending_time[collar_breach_confirmation_message_at]); collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> assert(collar_breach_confirmation_message_read.execution_within_firm_short_code[collar_breach_confirmation_message_at] == collar_breach_confirmation_message_written.execution_within_firm_short_code[collar_breach_confirmation_message_at]); collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> assert(collar_breach_confirmation_message_read.client_identification_shortcode[collar_breach_confirmation_message_at] == collar_breach_confirmation_message_written.client_identification_shortcode[collar_breach_confirmation_message_at]); collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> assert(collar_breach_confirmation_message_read.client_order_id[collar_breach_confirmation_message_at] == collar_breach_confirmation_message_written.client_order_id[collar_breach_confirmation_message_at]); collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 4 -> assert(collar_breach_confirmation_message_read.symbol_index[collar_breach_confirmation_message_at] == collar_breach_confirmation_message_written.symbol_index[collar_breach_confirmation_message_at]); collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  assert(collar_breach_confirmation_message_read.emm == collar_breach_confirmation_message_written.emm);
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> assert(collar_breach_confirmation_message_read.order_id_optional[collar_breach_confirmation_message_at] == collar_breach_confirmation_message_written.order_id_optional[collar_breach_confirmation_message_at]); collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  collar_breach_confirmation_message_at = 0;
  do
  :: collar_breach_confirmation_message_at < 8 -> assert(collar_breach_confirmation_message_read.orig_client_order_id[collar_breach_confirmation_message_at] == collar_breach_confirmation_message_written.orig_client_order_id[collar_breach_confirmation_message_at]); collar_breach_confirmation_message_at = collar_breach_confirmation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Input Message: 50 bytes ------------------------------------------- */

/* PriceInputMessage */
typedef PriceInputMessage {
  byte cl_msg_seq_num[4];
  byte firm_id[8];
  byte sending_time[8];
  byte execution_within_firm_short_code[4];
  byte client_identification_shortcode[4];
  byte client_order_id[8];
  byte symbol_index[4];
  byte emm;
  byte input_price_type;
  byte price_optional[8]
};

int price_input_message_at;

/* every byte of Price Input Message set to one value */
inline fill_price_input_message(price_input_message_record, price_input_message_value) {
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.cl_msg_seq_num[price_input_message_at] = price_input_message_value; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.firm_id[price_input_message_at] = price_input_message_value; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.sending_time[price_input_message_at] = price_input_message_value; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.execution_within_firm_short_code[price_input_message_at] = price_input_message_value; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.client_identification_shortcode[price_input_message_at] = price_input_message_value; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.client_order_id[price_input_message_at] = price_input_message_value; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.symbol_index[price_input_message_at] = price_input_message_value; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_record.emm = price_input_message_value;
  price_input_message_record.input_price_type = price_input_message_value;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.price_optional[price_input_message_at] = price_input_message_value; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Input Message set to where it lies, so a field read out of place says so */
inline ramp_price_input_message(price_input_message_record, price_input_message_base) {
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.cl_msg_seq_num[price_input_message_at] = (price_input_message_base + 0 + price_input_message_at + 1) % 256; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.firm_id[price_input_message_at] = (price_input_message_base + 4 + price_input_message_at + 1) % 256; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.sending_time[price_input_message_at] = (price_input_message_base + 12 + price_input_message_at + 1) % 256; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.execution_within_firm_short_code[price_input_message_at] = (price_input_message_base + 20 + price_input_message_at + 1) % 256; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.client_identification_shortcode[price_input_message_at] = (price_input_message_base + 24 + price_input_message_at + 1) % 256; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.client_order_id[price_input_message_at] = (price_input_message_base + 28 + price_input_message_at + 1) % 256; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.symbol_index[price_input_message_at] = (price_input_message_base + 36 + price_input_message_at + 1) % 256; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_record.emm = (price_input_message_base + 40 + 1) % 256;
  price_input_message_record.input_price_type = (price_input_message_base + 41 + 1) % 256;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.price_optional[price_input_message_at] = (price_input_message_base + 42 + price_input_message_at + 1) % 256; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Input Message to the wire, 50 bytes from where the cursor stands */
inline encode_price_input_message(price_input_message_record) {
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> wire[at] = price_input_message_record.cl_msg_seq_num[price_input_message_at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> wire[at] = price_input_message_record.firm_id[price_input_message_at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> wire[at] = price_input_message_record.sending_time[price_input_message_at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> wire[at] = price_input_message_record.execution_within_firm_short_code[price_input_message_at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> wire[at] = price_input_message_record.client_identification_shortcode[price_input_message_at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> wire[at] = price_input_message_record.client_order_id[price_input_message_at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> wire[at] = price_input_message_record.symbol_index[price_input_message_at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  wire[at] = price_input_message_record.emm; at = at + 1;
  wire[at] = price_input_message_record.input_price_type; at = at + 1;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> wire[at] = price_input_message_record.price_optional[price_input_message_at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Input Message off the wire, 50 bytes from where the cursor stands */
inline decode_price_input_message(price_input_message_record) {
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.cl_msg_seq_num[price_input_message_at] = wire[at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.firm_id[price_input_message_at] = wire[at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.sending_time[price_input_message_at] = wire[at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.execution_within_firm_short_code[price_input_message_at] = wire[at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.client_identification_shortcode[price_input_message_at] = wire[at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.client_order_id[price_input_message_at] = wire[at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> price_input_message_record.symbol_index[price_input_message_at] = wire[at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_record.emm = wire[at]; at = at + 1;
  price_input_message_record.input_price_type = wire[at]; at = at + 1;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> price_input_message_record.price_optional[price_input_message_at] = wire[at]; at = at + 1; price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Input Message is what was written, byte for byte */
inline equal_price_input_message(price_input_message_read, price_input_message_written) {
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> assert(price_input_message_read.cl_msg_seq_num[price_input_message_at] == price_input_message_written.cl_msg_seq_num[price_input_message_at]); price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> assert(price_input_message_read.firm_id[price_input_message_at] == price_input_message_written.firm_id[price_input_message_at]); price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> assert(price_input_message_read.sending_time[price_input_message_at] == price_input_message_written.sending_time[price_input_message_at]); price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> assert(price_input_message_read.execution_within_firm_short_code[price_input_message_at] == price_input_message_written.execution_within_firm_short_code[price_input_message_at]); price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> assert(price_input_message_read.client_identification_shortcode[price_input_message_at] == price_input_message_written.client_identification_shortcode[price_input_message_at]); price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> assert(price_input_message_read.client_order_id[price_input_message_at] == price_input_message_written.client_order_id[price_input_message_at]); price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  price_input_message_at = 0;
  do
  :: price_input_message_at < 4 -> assert(price_input_message_read.symbol_index[price_input_message_at] == price_input_message_written.symbol_index[price_input_message_at]); price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  assert(price_input_message_read.emm == price_input_message_written.emm);
  assert(price_input_message_read.input_price_type == price_input_message_written.input_price_type);
  price_input_message_at = 0;
  do
  :: price_input_message_at < 8 -> assert(price_input_message_read.price_optional[price_input_message_at] == price_input_message_written.price_optional[price_input_message_at]); price_input_message_at = price_input_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Liquidity Provider Command Message: 42 bytes ---------------------------- */

/* LiquidityProviderCommandMessage */
typedef LiquidityProviderCommandMessage {
  byte cl_msg_seq_num[4];
  byte firm_id[8];
  byte sending_time[8];
  byte execution_within_firm_short_code[4];
  byte client_identification_shortcode[4];
  byte client_order_id[8];
  byte symbol_index[4];
  byte emm;
  byte lp_action_code
};

int liquidity_provider_command_message_at;

/* every byte of Liquidity Provider Command Message set to one value */
inline fill_liquidity_provider_command_message(liquidity_provider_command_message_record, liquidity_provider_command_message_value) {
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.cl_msg_seq_num[liquidity_provider_command_message_at] = liquidity_provider_command_message_value; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> liquidity_provider_command_message_record.firm_id[liquidity_provider_command_message_at] = liquidity_provider_command_message_value; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> liquidity_provider_command_message_record.sending_time[liquidity_provider_command_message_at] = liquidity_provider_command_message_value; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.execution_within_firm_short_code[liquidity_provider_command_message_at] = liquidity_provider_command_message_value; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.client_identification_shortcode[liquidity_provider_command_message_at] = liquidity_provider_command_message_value; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> liquidity_provider_command_message_record.client_order_id[liquidity_provider_command_message_at] = liquidity_provider_command_message_value; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.symbol_index[liquidity_provider_command_message_at] = liquidity_provider_command_message_value; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_record.emm = liquidity_provider_command_message_value;
  liquidity_provider_command_message_record.lp_action_code = liquidity_provider_command_message_value;
  skip
}

/* each byte of Liquidity Provider Command Message set to where it lies, so a field read out of place says so */
inline ramp_liquidity_provider_command_message(liquidity_provider_command_message_record, liquidity_provider_command_message_base) {
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.cl_msg_seq_num[liquidity_provider_command_message_at] = (liquidity_provider_command_message_base + 0 + liquidity_provider_command_message_at + 1) % 256; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> liquidity_provider_command_message_record.firm_id[liquidity_provider_command_message_at] = (liquidity_provider_command_message_base + 4 + liquidity_provider_command_message_at + 1) % 256; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> liquidity_provider_command_message_record.sending_time[liquidity_provider_command_message_at] = (liquidity_provider_command_message_base + 12 + liquidity_provider_command_message_at + 1) % 256; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.execution_within_firm_short_code[liquidity_provider_command_message_at] = (liquidity_provider_command_message_base + 20 + liquidity_provider_command_message_at + 1) % 256; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.client_identification_shortcode[liquidity_provider_command_message_at] = (liquidity_provider_command_message_base + 24 + liquidity_provider_command_message_at + 1) % 256; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> liquidity_provider_command_message_record.client_order_id[liquidity_provider_command_message_at] = (liquidity_provider_command_message_base + 28 + liquidity_provider_command_message_at + 1) % 256; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.symbol_index[liquidity_provider_command_message_at] = (liquidity_provider_command_message_base + 36 + liquidity_provider_command_message_at + 1) % 256; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_record.emm = (liquidity_provider_command_message_base + 40 + 1) % 256;
  liquidity_provider_command_message_record.lp_action_code = (liquidity_provider_command_message_base + 41 + 1) % 256;
  skip
}

/* Liquidity Provider Command Message to the wire, 42 bytes from where the cursor stands */
inline encode_liquidity_provider_command_message(liquidity_provider_command_message_record) {
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> wire[at] = liquidity_provider_command_message_record.cl_msg_seq_num[liquidity_provider_command_message_at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> wire[at] = liquidity_provider_command_message_record.firm_id[liquidity_provider_command_message_at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> wire[at] = liquidity_provider_command_message_record.sending_time[liquidity_provider_command_message_at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> wire[at] = liquidity_provider_command_message_record.execution_within_firm_short_code[liquidity_provider_command_message_at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> wire[at] = liquidity_provider_command_message_record.client_identification_shortcode[liquidity_provider_command_message_at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> wire[at] = liquidity_provider_command_message_record.client_order_id[liquidity_provider_command_message_at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> wire[at] = liquidity_provider_command_message_record.symbol_index[liquidity_provider_command_message_at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_provider_command_message_record.emm; at = at + 1;
  wire[at] = liquidity_provider_command_message_record.lp_action_code; at = at + 1;
  skip
}

/* Liquidity Provider Command Message off the wire, 42 bytes from where the cursor stands */
inline decode_liquidity_provider_command_message(liquidity_provider_command_message_record) {
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.cl_msg_seq_num[liquidity_provider_command_message_at] = wire[at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> liquidity_provider_command_message_record.firm_id[liquidity_provider_command_message_at] = wire[at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> liquidity_provider_command_message_record.sending_time[liquidity_provider_command_message_at] = wire[at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.execution_within_firm_short_code[liquidity_provider_command_message_at] = wire[at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.client_identification_shortcode[liquidity_provider_command_message_at] = wire[at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> liquidity_provider_command_message_record.client_order_id[liquidity_provider_command_message_at] = wire[at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> liquidity_provider_command_message_record.symbol_index[liquidity_provider_command_message_at] = wire[at]; at = at + 1; liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_record.emm = wire[at]; at = at + 1;
  liquidity_provider_command_message_record.lp_action_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Liquidity Provider Command Message is what was written, byte for byte */
inline equal_liquidity_provider_command_message(liquidity_provider_command_message_read, liquidity_provider_command_message_written) {
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> assert(liquidity_provider_command_message_read.cl_msg_seq_num[liquidity_provider_command_message_at] == liquidity_provider_command_message_written.cl_msg_seq_num[liquidity_provider_command_message_at]); liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> assert(liquidity_provider_command_message_read.firm_id[liquidity_provider_command_message_at] == liquidity_provider_command_message_written.firm_id[liquidity_provider_command_message_at]); liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> assert(liquidity_provider_command_message_read.sending_time[liquidity_provider_command_message_at] == liquidity_provider_command_message_written.sending_time[liquidity_provider_command_message_at]); liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> assert(liquidity_provider_command_message_read.execution_within_firm_short_code[liquidity_provider_command_message_at] == liquidity_provider_command_message_written.execution_within_firm_short_code[liquidity_provider_command_message_at]); liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> assert(liquidity_provider_command_message_read.client_identification_shortcode[liquidity_provider_command_message_at] == liquidity_provider_command_message_written.client_identification_shortcode[liquidity_provider_command_message_at]); liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 8 -> assert(liquidity_provider_command_message_read.client_order_id[liquidity_provider_command_message_at] == liquidity_provider_command_message_written.client_order_id[liquidity_provider_command_message_at]); liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  liquidity_provider_command_message_at = 0;
  do
  :: liquidity_provider_command_message_at < 4 -> assert(liquidity_provider_command_message_read.symbol_index[liquidity_provider_command_message_at] == liquidity_provider_command_message_written.symbol_index[liquidity_provider_command_message_at]); liquidity_provider_command_message_at = liquidity_provider_command_message_at + 1
  :: else -> break
  od;
  assert(liquidity_provider_command_message_read.emm == liquidity_provider_command_message_written.emm);
  assert(liquidity_provider_command_message_read.lp_action_code == liquidity_provider_command_message_written.lp_action_code);
  skip
}

/* ---- Ask For Quote Message: 18 bytes ----------------------------------------- */

/* AskForQuoteMessage */
typedef AskForQuoteMessage {
  byte msg_seq_num[4];
  byte firm_id[8];
  byte symbol_index[4];
  byte emm;
  byte afq_reason
};

int ask_for_quote_message_at;

/* every byte of Ask For Quote Message set to one value */
inline fill_ask_for_quote_message(ask_for_quote_message_record, ask_for_quote_message_value) {
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> ask_for_quote_message_record.msg_seq_num[ask_for_quote_message_at] = ask_for_quote_message_value; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 8 -> ask_for_quote_message_record.firm_id[ask_for_quote_message_at] = ask_for_quote_message_value; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> ask_for_quote_message_record.symbol_index[ask_for_quote_message_at] = ask_for_quote_message_value; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_record.emm = ask_for_quote_message_value;
  ask_for_quote_message_record.afq_reason = ask_for_quote_message_value;
  skip
}

/* each byte of Ask For Quote Message set to where it lies, so a field read out of place says so */
inline ramp_ask_for_quote_message(ask_for_quote_message_record, ask_for_quote_message_base) {
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> ask_for_quote_message_record.msg_seq_num[ask_for_quote_message_at] = (ask_for_quote_message_base + 0 + ask_for_quote_message_at + 1) % 256; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 8 -> ask_for_quote_message_record.firm_id[ask_for_quote_message_at] = (ask_for_quote_message_base + 4 + ask_for_quote_message_at + 1) % 256; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> ask_for_quote_message_record.symbol_index[ask_for_quote_message_at] = (ask_for_quote_message_base + 12 + ask_for_quote_message_at + 1) % 256; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_record.emm = (ask_for_quote_message_base + 16 + 1) % 256;
  ask_for_quote_message_record.afq_reason = (ask_for_quote_message_base + 17 + 1) % 256;
  skip
}

/* Ask For Quote Message to the wire, 18 bytes from where the cursor stands */
inline encode_ask_for_quote_message(ask_for_quote_message_record) {
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> wire[at] = ask_for_quote_message_record.msg_seq_num[ask_for_quote_message_at]; at = at + 1; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 8 -> wire[at] = ask_for_quote_message_record.firm_id[ask_for_quote_message_at]; at = at + 1; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> wire[at] = ask_for_quote_message_record.symbol_index[ask_for_quote_message_at]; at = at + 1; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = ask_for_quote_message_record.emm; at = at + 1;
  wire[at] = ask_for_quote_message_record.afq_reason; at = at + 1;
  skip
}

/* Ask For Quote Message off the wire, 18 bytes from where the cursor stands */
inline decode_ask_for_quote_message(ask_for_quote_message_record) {
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> ask_for_quote_message_record.msg_seq_num[ask_for_quote_message_at] = wire[at]; at = at + 1; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 8 -> ask_for_quote_message_record.firm_id[ask_for_quote_message_at] = wire[at]; at = at + 1; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> ask_for_quote_message_record.symbol_index[ask_for_quote_message_at] = wire[at]; at = at + 1; ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_record.emm = wire[at]; at = at + 1;
  ask_for_quote_message_record.afq_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Ask For Quote Message is what was written, byte for byte */
inline equal_ask_for_quote_message(ask_for_quote_message_read, ask_for_quote_message_written) {
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> assert(ask_for_quote_message_read.msg_seq_num[ask_for_quote_message_at] == ask_for_quote_message_written.msg_seq_num[ask_for_quote_message_at]); ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 8 -> assert(ask_for_quote_message_read.firm_id[ask_for_quote_message_at] == ask_for_quote_message_written.firm_id[ask_for_quote_message_at]); ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  ask_for_quote_message_at = 0;
  do
  :: ask_for_quote_message_at < 4 -> assert(ask_for_quote_message_read.symbol_index[ask_for_quote_message_at] == ask_for_quote_message_written.symbol_index[ask_for_quote_message_at]); ask_for_quote_message_at = ask_for_quote_message_at + 1
  :: else -> break
  od;
  assert(ask_for_quote_message_read.emm == ask_for_quote_message_written.emm);
  assert(ask_for_quote_message_read.afq_reason == ask_for_quote_message_written.afq_reason);
  skip
}

/* ---- Request For Execution Message: 17 bytes --------------------------------- */

/* RequestForExecutionMessage */
typedef RequestForExecutionMessage {
  byte msg_seq_num[4];
  byte firm_id[8];
  byte symbol_index[4];
  byte emm
};

int request_for_execution_message_at;

/* every byte of Request For Execution Message set to one value */
inline fill_request_for_execution_message(request_for_execution_message_record, request_for_execution_message_value) {
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> request_for_execution_message_record.msg_seq_num[request_for_execution_message_at] = request_for_execution_message_value; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 8 -> request_for_execution_message_record.firm_id[request_for_execution_message_at] = request_for_execution_message_value; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> request_for_execution_message_record.symbol_index[request_for_execution_message_at] = request_for_execution_message_value; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_record.emm = request_for_execution_message_value;
  skip
}

/* each byte of Request For Execution Message set to where it lies, so a field read out of place says so */
inline ramp_request_for_execution_message(request_for_execution_message_record, request_for_execution_message_base) {
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> request_for_execution_message_record.msg_seq_num[request_for_execution_message_at] = (request_for_execution_message_base + 0 + request_for_execution_message_at + 1) % 256; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 8 -> request_for_execution_message_record.firm_id[request_for_execution_message_at] = (request_for_execution_message_base + 4 + request_for_execution_message_at + 1) % 256; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> request_for_execution_message_record.symbol_index[request_for_execution_message_at] = (request_for_execution_message_base + 12 + request_for_execution_message_at + 1) % 256; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_record.emm = (request_for_execution_message_base + 16 + 1) % 256;
  skip
}

/* Request For Execution Message to the wire, 17 bytes from where the cursor stands */
inline encode_request_for_execution_message(request_for_execution_message_record) {
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> wire[at] = request_for_execution_message_record.msg_seq_num[request_for_execution_message_at]; at = at + 1; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 8 -> wire[at] = request_for_execution_message_record.firm_id[request_for_execution_message_at]; at = at + 1; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> wire[at] = request_for_execution_message_record.symbol_index[request_for_execution_message_at]; at = at + 1; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = request_for_execution_message_record.emm; at = at + 1;
  skip
}

/* Request For Execution Message off the wire, 17 bytes from where the cursor stands */
inline decode_request_for_execution_message(request_for_execution_message_record) {
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> request_for_execution_message_record.msg_seq_num[request_for_execution_message_at] = wire[at]; at = at + 1; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 8 -> request_for_execution_message_record.firm_id[request_for_execution_message_at] = wire[at]; at = at + 1; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> request_for_execution_message_record.symbol_index[request_for_execution_message_at] = wire[at]; at = at + 1; request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_record.emm = wire[at]; at = at + 1;
  skip
}

/* what was read of Request For Execution Message is what was written, byte for byte */
inline equal_request_for_execution_message(request_for_execution_message_read, request_for_execution_message_written) {
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> assert(request_for_execution_message_read.msg_seq_num[request_for_execution_message_at] == request_for_execution_message_written.msg_seq_num[request_for_execution_message_at]); request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 8 -> assert(request_for_execution_message_read.firm_id[request_for_execution_message_at] == request_for_execution_message_written.firm_id[request_for_execution_message_at]); request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  request_for_execution_message_at = 0;
  do
  :: request_for_execution_message_at < 4 -> assert(request_for_execution_message_read.symbol_index[request_for_execution_message_at] == request_for_execution_message_written.symbol_index[request_for_execution_message_at]); request_for_execution_message_at = request_for_execution_message_at + 1
  :: else -> break
  od;
  assert(request_for_execution_message_read.emm == request_for_execution_message_written.emm);
  skip
}

/* ---- Rfq Matching Status Message: 76 bytes ----------------------------------- */

/* RFQMatchingStatusMessage */
typedef RfqMatchingStatusMessage {
  byte msg_seq_num[4];
  byte firm_id[8];
  byte book_in[8];
  byte book_out_time_optional[8];
  byte oeg_in_from_me_optional[8];
  byte oeg_out_to_member_optional[8];
  byte quote_req_id[8];
  byte potential_matching_px[8];
  byte potential_matching_qty[8];
  byte symbol_index[4];
  byte emm;
  byte side;
  byte number_of_lps;
  byte recipient_type
};

int rfq_matching_status_message_at;

/* every byte of Rfq Matching Status Message set to one value */
inline fill_rfq_matching_status_message(rfq_matching_status_message_record, rfq_matching_status_message_value) {
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> rfq_matching_status_message_record.msg_seq_num[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.firm_id[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.book_in[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.book_out_time_optional[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.oeg_in_from_me_optional[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.oeg_out_to_member_optional[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.quote_req_id[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.potential_matching_px[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.potential_matching_qty[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> rfq_matching_status_message_record.symbol_index[rfq_matching_status_message_at] = rfq_matching_status_message_value; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_record.emm = rfq_matching_status_message_value;
  rfq_matching_status_message_record.side = rfq_matching_status_message_value;
  rfq_matching_status_message_record.number_of_lps = rfq_matching_status_message_value;
  rfq_matching_status_message_record.recipient_type = rfq_matching_status_message_value;
  skip
}

/* each byte of Rfq Matching Status Message set to where it lies, so a field read out of place says so */
inline ramp_rfq_matching_status_message(rfq_matching_status_message_record, rfq_matching_status_message_base) {
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> rfq_matching_status_message_record.msg_seq_num[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 0 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.firm_id[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 4 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.book_in[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 12 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.book_out_time_optional[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 20 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.oeg_in_from_me_optional[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 28 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.oeg_out_to_member_optional[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 36 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.quote_req_id[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 44 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.potential_matching_px[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 52 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.potential_matching_qty[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 60 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> rfq_matching_status_message_record.symbol_index[rfq_matching_status_message_at] = (rfq_matching_status_message_base + 68 + rfq_matching_status_message_at + 1) % 256; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_record.emm = (rfq_matching_status_message_base + 72 + 1) % 256;
  rfq_matching_status_message_record.side = (rfq_matching_status_message_base + 73 + 1) % 256;
  rfq_matching_status_message_record.number_of_lps = (rfq_matching_status_message_base + 74 + 1) % 256;
  rfq_matching_status_message_record.recipient_type = (rfq_matching_status_message_base + 75 + 1) % 256;
  skip
}

/* Rfq Matching Status Message to the wire, 76 bytes from where the cursor stands */
inline encode_rfq_matching_status_message(rfq_matching_status_message_record) {
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> wire[at] = rfq_matching_status_message_record.msg_seq_num[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> wire[at] = rfq_matching_status_message_record.firm_id[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> wire[at] = rfq_matching_status_message_record.book_in[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> wire[at] = rfq_matching_status_message_record.book_out_time_optional[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> wire[at] = rfq_matching_status_message_record.oeg_in_from_me_optional[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> wire[at] = rfq_matching_status_message_record.oeg_out_to_member_optional[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> wire[at] = rfq_matching_status_message_record.quote_req_id[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> wire[at] = rfq_matching_status_message_record.potential_matching_px[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> wire[at] = rfq_matching_status_message_record.potential_matching_qty[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> wire[at] = rfq_matching_status_message_record.symbol_index[rfq_matching_status_message_at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  wire[at] = rfq_matching_status_message_record.emm; at = at + 1;
  wire[at] = rfq_matching_status_message_record.side; at = at + 1;
  wire[at] = rfq_matching_status_message_record.number_of_lps; at = at + 1;
  wire[at] = rfq_matching_status_message_record.recipient_type; at = at + 1;
  skip
}

/* Rfq Matching Status Message off the wire, 76 bytes from where the cursor stands */
inline decode_rfq_matching_status_message(rfq_matching_status_message_record) {
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> rfq_matching_status_message_record.msg_seq_num[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.firm_id[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.book_in[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.book_out_time_optional[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.oeg_in_from_me_optional[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.oeg_out_to_member_optional[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.quote_req_id[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.potential_matching_px[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> rfq_matching_status_message_record.potential_matching_qty[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> rfq_matching_status_message_record.symbol_index[rfq_matching_status_message_at] = wire[at]; at = at + 1; rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_record.emm = wire[at]; at = at + 1;
  rfq_matching_status_message_record.side = wire[at]; at = at + 1;
  rfq_matching_status_message_record.number_of_lps = wire[at]; at = at + 1;
  rfq_matching_status_message_record.recipient_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Rfq Matching Status Message is what was written, byte for byte */
inline equal_rfq_matching_status_message(rfq_matching_status_message_read, rfq_matching_status_message_written) {
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> assert(rfq_matching_status_message_read.msg_seq_num[rfq_matching_status_message_at] == rfq_matching_status_message_written.msg_seq_num[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> assert(rfq_matching_status_message_read.firm_id[rfq_matching_status_message_at] == rfq_matching_status_message_written.firm_id[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> assert(rfq_matching_status_message_read.book_in[rfq_matching_status_message_at] == rfq_matching_status_message_written.book_in[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> assert(rfq_matching_status_message_read.book_out_time_optional[rfq_matching_status_message_at] == rfq_matching_status_message_written.book_out_time_optional[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> assert(rfq_matching_status_message_read.oeg_in_from_me_optional[rfq_matching_status_message_at] == rfq_matching_status_message_written.oeg_in_from_me_optional[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> assert(rfq_matching_status_message_read.oeg_out_to_member_optional[rfq_matching_status_message_at] == rfq_matching_status_message_written.oeg_out_to_member_optional[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> assert(rfq_matching_status_message_read.quote_req_id[rfq_matching_status_message_at] == rfq_matching_status_message_written.quote_req_id[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> assert(rfq_matching_status_message_read.potential_matching_px[rfq_matching_status_message_at] == rfq_matching_status_message_written.potential_matching_px[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 8 -> assert(rfq_matching_status_message_read.potential_matching_qty[rfq_matching_status_message_at] == rfq_matching_status_message_written.potential_matching_qty[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  rfq_matching_status_message_at = 0;
  do
  :: rfq_matching_status_message_at < 4 -> assert(rfq_matching_status_message_read.symbol_index[rfq_matching_status_message_at] == rfq_matching_status_message_written.symbol_index[rfq_matching_status_message_at]); rfq_matching_status_message_at = rfq_matching_status_message_at + 1
  :: else -> break
  od;
  assert(rfq_matching_status_message_read.emm == rfq_matching_status_message_written.emm);
  assert(rfq_matching_status_message_read.side == rfq_matching_status_message_written.side);
  assert(rfq_matching_status_message_read.number_of_lps == rfq_matching_status_message_written.number_of_lps);
  assert(rfq_matching_status_message_read.recipient_type == rfq_matching_status_message_written.recipient_type);
  skip
}

/* ---- Rfqlp Matching Status Message: 66 bytes --------------------------------- */

/* RFQLPMatchingStatusMessage */
typedef RfqlpMatchingStatusMessage {
  byte msg_seq_num[4];
  byte firm_id[8];
  byte book_in[8];
  byte book_out_time_optional[8];
  byte oeg_in_from_me_optional[8];
  byte oeg_out_to_member_optional[8];
  byte quote_req_id[8];
  byte potential_matching_qty[8];
  byte symbol_index[4];
  byte emm;
  byte side
};

int rfqlp_matching_status_message_at;

/* every byte of Rfqlp Matching Status Message set to one value */
inline fill_rfqlp_matching_status_message(rfqlp_matching_status_message_record, rfqlp_matching_status_message_value) {
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> rfqlp_matching_status_message_record.msg_seq_num[rfqlp_matching_status_message_at] = rfqlp_matching_status_message_value; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.firm_id[rfqlp_matching_status_message_at] = rfqlp_matching_status_message_value; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.book_in[rfqlp_matching_status_message_at] = rfqlp_matching_status_message_value; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.book_out_time_optional[rfqlp_matching_status_message_at] = rfqlp_matching_status_message_value; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.oeg_in_from_me_optional[rfqlp_matching_status_message_at] = rfqlp_matching_status_message_value; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.oeg_out_to_member_optional[rfqlp_matching_status_message_at] = rfqlp_matching_status_message_value; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.quote_req_id[rfqlp_matching_status_message_at] = rfqlp_matching_status_message_value; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.potential_matching_qty[rfqlp_matching_status_message_at] = rfqlp_matching_status_message_value; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> rfqlp_matching_status_message_record.symbol_index[rfqlp_matching_status_message_at] = rfqlp_matching_status_message_value; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_record.emm = rfqlp_matching_status_message_value;
  rfqlp_matching_status_message_record.side = rfqlp_matching_status_message_value;
  skip
}

/* each byte of Rfqlp Matching Status Message set to where it lies, so a field read out of place says so */
inline ramp_rfqlp_matching_status_message(rfqlp_matching_status_message_record, rfqlp_matching_status_message_base) {
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> rfqlp_matching_status_message_record.msg_seq_num[rfqlp_matching_status_message_at] = (rfqlp_matching_status_message_base + 0 + rfqlp_matching_status_message_at + 1) % 256; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.firm_id[rfqlp_matching_status_message_at] = (rfqlp_matching_status_message_base + 4 + rfqlp_matching_status_message_at + 1) % 256; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.book_in[rfqlp_matching_status_message_at] = (rfqlp_matching_status_message_base + 12 + rfqlp_matching_status_message_at + 1) % 256; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.book_out_time_optional[rfqlp_matching_status_message_at] = (rfqlp_matching_status_message_base + 20 + rfqlp_matching_status_message_at + 1) % 256; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.oeg_in_from_me_optional[rfqlp_matching_status_message_at] = (rfqlp_matching_status_message_base + 28 + rfqlp_matching_status_message_at + 1) % 256; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.oeg_out_to_member_optional[rfqlp_matching_status_message_at] = (rfqlp_matching_status_message_base + 36 + rfqlp_matching_status_message_at + 1) % 256; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.quote_req_id[rfqlp_matching_status_message_at] = (rfqlp_matching_status_message_base + 44 + rfqlp_matching_status_message_at + 1) % 256; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.potential_matching_qty[rfqlp_matching_status_message_at] = (rfqlp_matching_status_message_base + 52 + rfqlp_matching_status_message_at + 1) % 256; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> rfqlp_matching_status_message_record.symbol_index[rfqlp_matching_status_message_at] = (rfqlp_matching_status_message_base + 60 + rfqlp_matching_status_message_at + 1) % 256; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_record.emm = (rfqlp_matching_status_message_base + 64 + 1) % 256;
  rfqlp_matching_status_message_record.side = (rfqlp_matching_status_message_base + 65 + 1) % 256;
  skip
}

/* Rfqlp Matching Status Message to the wire, 66 bytes from where the cursor stands */
inline encode_rfqlp_matching_status_message(rfqlp_matching_status_message_record) {
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> wire[at] = rfqlp_matching_status_message_record.msg_seq_num[rfqlp_matching_status_message_at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> wire[at] = rfqlp_matching_status_message_record.firm_id[rfqlp_matching_status_message_at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> wire[at] = rfqlp_matching_status_message_record.book_in[rfqlp_matching_status_message_at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> wire[at] = rfqlp_matching_status_message_record.book_out_time_optional[rfqlp_matching_status_message_at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> wire[at] = rfqlp_matching_status_message_record.oeg_in_from_me_optional[rfqlp_matching_status_message_at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> wire[at] = rfqlp_matching_status_message_record.oeg_out_to_member_optional[rfqlp_matching_status_message_at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> wire[at] = rfqlp_matching_status_message_record.quote_req_id[rfqlp_matching_status_message_at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> wire[at] = rfqlp_matching_status_message_record.potential_matching_qty[rfqlp_matching_status_message_at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> wire[at] = rfqlp_matching_status_message_record.symbol_index[rfqlp_matching_status_message_at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  wire[at] = rfqlp_matching_status_message_record.emm; at = at + 1;
  wire[at] = rfqlp_matching_status_message_record.side; at = at + 1;
  skip
}

/* Rfqlp Matching Status Message off the wire, 66 bytes from where the cursor stands */
inline decode_rfqlp_matching_status_message(rfqlp_matching_status_message_record) {
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> rfqlp_matching_status_message_record.msg_seq_num[rfqlp_matching_status_message_at] = wire[at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.firm_id[rfqlp_matching_status_message_at] = wire[at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.book_in[rfqlp_matching_status_message_at] = wire[at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.book_out_time_optional[rfqlp_matching_status_message_at] = wire[at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.oeg_in_from_me_optional[rfqlp_matching_status_message_at] = wire[at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.oeg_out_to_member_optional[rfqlp_matching_status_message_at] = wire[at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.quote_req_id[rfqlp_matching_status_message_at] = wire[at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> rfqlp_matching_status_message_record.potential_matching_qty[rfqlp_matching_status_message_at] = wire[at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> rfqlp_matching_status_message_record.symbol_index[rfqlp_matching_status_message_at] = wire[at]; at = at + 1; rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_record.emm = wire[at]; at = at + 1;
  rfqlp_matching_status_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of Rfqlp Matching Status Message is what was written, byte for byte */
inline equal_rfqlp_matching_status_message(rfqlp_matching_status_message_read, rfqlp_matching_status_message_written) {
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> assert(rfqlp_matching_status_message_read.msg_seq_num[rfqlp_matching_status_message_at] == rfqlp_matching_status_message_written.msg_seq_num[rfqlp_matching_status_message_at]); rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> assert(rfqlp_matching_status_message_read.firm_id[rfqlp_matching_status_message_at] == rfqlp_matching_status_message_written.firm_id[rfqlp_matching_status_message_at]); rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> assert(rfqlp_matching_status_message_read.book_in[rfqlp_matching_status_message_at] == rfqlp_matching_status_message_written.book_in[rfqlp_matching_status_message_at]); rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> assert(rfqlp_matching_status_message_read.book_out_time_optional[rfqlp_matching_status_message_at] == rfqlp_matching_status_message_written.book_out_time_optional[rfqlp_matching_status_message_at]); rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> assert(rfqlp_matching_status_message_read.oeg_in_from_me_optional[rfqlp_matching_status_message_at] == rfqlp_matching_status_message_written.oeg_in_from_me_optional[rfqlp_matching_status_message_at]); rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> assert(rfqlp_matching_status_message_read.oeg_out_to_member_optional[rfqlp_matching_status_message_at] == rfqlp_matching_status_message_written.oeg_out_to_member_optional[rfqlp_matching_status_message_at]); rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> assert(rfqlp_matching_status_message_read.quote_req_id[rfqlp_matching_status_message_at] == rfqlp_matching_status_message_written.quote_req_id[rfqlp_matching_status_message_at]); rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 8 -> assert(rfqlp_matching_status_message_read.potential_matching_qty[rfqlp_matching_status_message_at] == rfqlp_matching_status_message_written.potential_matching_qty[rfqlp_matching_status_message_at]); rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  rfqlp_matching_status_message_at = 0;
  do
  :: rfqlp_matching_status_message_at < 4 -> assert(rfqlp_matching_status_message_read.symbol_index[rfqlp_matching_status_message_at] == rfqlp_matching_status_message_written.symbol_index[rfqlp_matching_status_message_at]); rfqlp_matching_status_message_at = rfqlp_matching_status_message_at + 1
  :: else -> break
  od;
  assert(rfqlp_matching_status_message_read.emm == rfqlp_matching_status_message_written.emm);
  assert(rfqlp_matching_status_message_read.side == rfqlp_matching_status_message_written.side);
  skip
}

/* ---- Synchronization Time Message: 22 bytes ---------------------------------- */

/* SynchronizationTimeMessage */
typedef SynchronizationTimeMessage {
  byte msg_seq_num[4];
  byte oeg_out_to_member_optional[8];
  byte resynchronization_id[2];
  byte last_book_in_time[8]
};

int synchronization_time_message_at;

/* every byte of Synchronization Time Message set to one value */
inline fill_synchronization_time_message(synchronization_time_message_record, synchronization_time_message_value) {
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 4 -> synchronization_time_message_record.msg_seq_num[synchronization_time_message_at] = synchronization_time_message_value; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> synchronization_time_message_record.oeg_out_to_member_optional[synchronization_time_message_at] = synchronization_time_message_value; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 2 -> synchronization_time_message_record.resynchronization_id[synchronization_time_message_at] = synchronization_time_message_value; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> synchronization_time_message_record.last_book_in_time[synchronization_time_message_at] = synchronization_time_message_value; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Synchronization Time Message set to where it lies, so a field read out of place says so */
inline ramp_synchronization_time_message(synchronization_time_message_record, synchronization_time_message_base) {
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 4 -> synchronization_time_message_record.msg_seq_num[synchronization_time_message_at] = (synchronization_time_message_base + 0 + synchronization_time_message_at + 1) % 256; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> synchronization_time_message_record.oeg_out_to_member_optional[synchronization_time_message_at] = (synchronization_time_message_base + 4 + synchronization_time_message_at + 1) % 256; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 2 -> synchronization_time_message_record.resynchronization_id[synchronization_time_message_at] = (synchronization_time_message_base + 12 + synchronization_time_message_at + 1) % 256; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> synchronization_time_message_record.last_book_in_time[synchronization_time_message_at] = (synchronization_time_message_base + 14 + synchronization_time_message_at + 1) % 256; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Synchronization Time Message to the wire, 22 bytes from where the cursor stands */
inline encode_synchronization_time_message(synchronization_time_message_record) {
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 4 -> wire[at] = synchronization_time_message_record.msg_seq_num[synchronization_time_message_at]; at = at + 1; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> wire[at] = synchronization_time_message_record.oeg_out_to_member_optional[synchronization_time_message_at]; at = at + 1; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 2 -> wire[at] = synchronization_time_message_record.resynchronization_id[synchronization_time_message_at]; at = at + 1; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> wire[at] = synchronization_time_message_record.last_book_in_time[synchronization_time_message_at]; at = at + 1; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Synchronization Time Message off the wire, 22 bytes from where the cursor stands */
inline decode_synchronization_time_message(synchronization_time_message_record) {
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 4 -> synchronization_time_message_record.msg_seq_num[synchronization_time_message_at] = wire[at]; at = at + 1; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> synchronization_time_message_record.oeg_out_to_member_optional[synchronization_time_message_at] = wire[at]; at = at + 1; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 2 -> synchronization_time_message_record.resynchronization_id[synchronization_time_message_at] = wire[at]; at = at + 1; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> synchronization_time_message_record.last_book_in_time[synchronization_time_message_at] = wire[at]; at = at + 1; synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Synchronization Time Message is what was written, byte for byte */
inline equal_synchronization_time_message(synchronization_time_message_read, synchronization_time_message_written) {
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 4 -> assert(synchronization_time_message_read.msg_seq_num[synchronization_time_message_at] == synchronization_time_message_written.msg_seq_num[synchronization_time_message_at]); synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> assert(synchronization_time_message_read.oeg_out_to_member_optional[synchronization_time_message_at] == synchronization_time_message_written.oeg_out_to_member_optional[synchronization_time_message_at]); synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 2 -> assert(synchronization_time_message_read.resynchronization_id[synchronization_time_message_at] == synchronization_time_message_written.resynchronization_id[synchronization_time_message_at]); synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  synchronization_time_message_at = 0;
  do
  :: synchronization_time_message_at < 8 -> assert(synchronization_time_message_read.last_book_in_time[synchronization_time_message_at] == synchronization_time_message_written.last_book_in_time[synchronization_time_message_at]); synchronization_time_message_at = synchronization_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Definition Ack Message: 80 bytes ------------------------------- */

/* SecurityDefinitionAckMessage */
typedef SecurityDefinitionAckMessage {
  byte msg_seq_num[4];
  byte firm_id[8];
  byte sending_time_optional[8];
  byte oeg_in_from_member[8];
  byte oeg_out_time_to_me[8];
  byte book_in_optional[8];
  byte book_out_time_optional[8];
  byte oeg_in_from_me_optional[8];
  byte oeg_out_to_member_optional[8];
  byte security_req_id[8];
  byte symbol_index[4]
};

int security_definition_ack_message_at;

/* every byte of Security Definition Ack Message set to one value */
inline fill_security_definition_ack_message(security_definition_ack_message_record, security_definition_ack_message_value) {
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> security_definition_ack_message_record.msg_seq_num[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.firm_id[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.sending_time_optional[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_in_from_member[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_out_time_to_me[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.book_in_optional[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.book_out_time_optional[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_in_from_me_optional[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_out_to_member_optional[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.security_req_id[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> security_definition_ack_message_record.symbol_index[security_definition_ack_message_at] = security_definition_ack_message_value; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Definition Ack Message set to where it lies, so a field read out of place says so */
inline ramp_security_definition_ack_message(security_definition_ack_message_record, security_definition_ack_message_base) {
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> security_definition_ack_message_record.msg_seq_num[security_definition_ack_message_at] = (security_definition_ack_message_base + 0 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.firm_id[security_definition_ack_message_at] = (security_definition_ack_message_base + 4 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.sending_time_optional[security_definition_ack_message_at] = (security_definition_ack_message_base + 12 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_in_from_member[security_definition_ack_message_at] = (security_definition_ack_message_base + 20 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_out_time_to_me[security_definition_ack_message_at] = (security_definition_ack_message_base + 28 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.book_in_optional[security_definition_ack_message_at] = (security_definition_ack_message_base + 36 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.book_out_time_optional[security_definition_ack_message_at] = (security_definition_ack_message_base + 44 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_in_from_me_optional[security_definition_ack_message_at] = (security_definition_ack_message_base + 52 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_out_to_member_optional[security_definition_ack_message_at] = (security_definition_ack_message_base + 60 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.security_req_id[security_definition_ack_message_at] = (security_definition_ack_message_base + 68 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> security_definition_ack_message_record.symbol_index[security_definition_ack_message_at] = (security_definition_ack_message_base + 76 + security_definition_ack_message_at + 1) % 256; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Ack Message to the wire, 80 bytes from where the cursor stands */
inline encode_security_definition_ack_message(security_definition_ack_message_record) {
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> wire[at] = security_definition_ack_message_record.msg_seq_num[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> wire[at] = security_definition_ack_message_record.firm_id[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> wire[at] = security_definition_ack_message_record.sending_time_optional[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> wire[at] = security_definition_ack_message_record.oeg_in_from_member[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> wire[at] = security_definition_ack_message_record.oeg_out_time_to_me[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> wire[at] = security_definition_ack_message_record.book_in_optional[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> wire[at] = security_definition_ack_message_record.book_out_time_optional[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> wire[at] = security_definition_ack_message_record.oeg_in_from_me_optional[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> wire[at] = security_definition_ack_message_record.oeg_out_to_member_optional[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> wire[at] = security_definition_ack_message_record.security_req_id[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> wire[at] = security_definition_ack_message_record.symbol_index[security_definition_ack_message_at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Ack Message off the wire, 80 bytes from where the cursor stands */
inline decode_security_definition_ack_message(security_definition_ack_message_record) {
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> security_definition_ack_message_record.msg_seq_num[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.firm_id[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.sending_time_optional[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_in_from_member[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_out_time_to_me[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.book_in_optional[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.book_out_time_optional[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_in_from_me_optional[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.oeg_out_to_member_optional[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> security_definition_ack_message_record.security_req_id[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> security_definition_ack_message_record.symbol_index[security_definition_ack_message_at] = wire[at]; at = at + 1; security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Definition Ack Message is what was written, byte for byte */
inline equal_security_definition_ack_message(security_definition_ack_message_read, security_definition_ack_message_written) {
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> assert(security_definition_ack_message_read.msg_seq_num[security_definition_ack_message_at] == security_definition_ack_message_written.msg_seq_num[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> assert(security_definition_ack_message_read.firm_id[security_definition_ack_message_at] == security_definition_ack_message_written.firm_id[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> assert(security_definition_ack_message_read.sending_time_optional[security_definition_ack_message_at] == security_definition_ack_message_written.sending_time_optional[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> assert(security_definition_ack_message_read.oeg_in_from_member[security_definition_ack_message_at] == security_definition_ack_message_written.oeg_in_from_member[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> assert(security_definition_ack_message_read.oeg_out_time_to_me[security_definition_ack_message_at] == security_definition_ack_message_written.oeg_out_time_to_me[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> assert(security_definition_ack_message_read.book_in_optional[security_definition_ack_message_at] == security_definition_ack_message_written.book_in_optional[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> assert(security_definition_ack_message_read.book_out_time_optional[security_definition_ack_message_at] == security_definition_ack_message_written.book_out_time_optional[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> assert(security_definition_ack_message_read.oeg_in_from_me_optional[security_definition_ack_message_at] == security_definition_ack_message_written.oeg_in_from_me_optional[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> assert(security_definition_ack_message_read.oeg_out_to_member_optional[security_definition_ack_message_at] == security_definition_ack_message_written.oeg_out_to_member_optional[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 8 -> assert(security_definition_ack_message_read.security_req_id[security_definition_ack_message_at] == security_definition_ack_message_written.security_req_id[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  security_definition_ack_message_at = 0;
  do
  :: security_definition_ack_message_at < 4 -> assert(security_definition_ack_message_read.symbol_index[security_definition_ack_message_at] == security_definition_ack_message_written.symbol_index[security_definition_ack_message_at]); security_definition_ack_message_at = security_definition_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Message: 19 bytes ------------------------------------------------- */

/* LogonMessage */
typedef LogonMessage {
  byte logical_access_id[4];
  byte oe_partition_id[2];
  byte last_msg_seq_num_optional[4];
  byte software_provider[8];
  byte queueing_indicator
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.logical_access_id[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> logon_message_record.oe_partition_id[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.last_msg_seq_num_optional[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> logon_message_record.software_provider[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.queueing_indicator = logon_message_value;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.logical_access_id[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> logon_message_record.oe_partition_id[logon_message_at] = (logon_message_base + 4 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.last_msg_seq_num_optional[logon_message_at] = (logon_message_base + 6 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> logon_message_record.software_provider[logon_message_at] = (logon_message_base + 10 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.queueing_indicator = (logon_message_base + 18 + 1) % 256;
  skip
}

/* Logon Message to the wire, 19 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> wire[at] = logon_message_record.logical_access_id[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> wire[at] = logon_message_record.oe_partition_id[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> wire[at] = logon_message_record.last_msg_seq_num_optional[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> wire[at] = logon_message_record.software_provider[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_message_record.queueing_indicator; at = at + 1;
  skip
}

/* Logon Message off the wire, 19 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.logical_access_id[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> logon_message_record.oe_partition_id[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.last_msg_seq_num_optional[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> logon_message_record.software_provider[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.queueing_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> assert(logon_message_read.logical_access_id[logon_message_at] == logon_message_written.logical_access_id[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> assert(logon_message_read.oe_partition_id[logon_message_at] == logon_message_written.oe_partition_id[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> assert(logon_message_read.last_msg_seq_num_optional[logon_message_at] == logon_message_written.last_msg_seq_num_optional[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> assert(logon_message_read.software_provider[logon_message_at] == logon_message_written.software_provider[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  assert(logon_message_read.queueing_indicator == logon_message_written.queueing_indicator);
  skip
}

/* ---- Logon Ack Message: 12 bytes --------------------------------------------- */

/* LogonAckMessage */
typedef LogonAckMessage {
  byte exchange_id[8];
  byte last_cl_msg_seq_num[4]
};

int logon_ack_message_at;

/* every byte of Logon Ack Message set to one value */
inline fill_logon_ack_message(logon_ack_message_record, logon_ack_message_value) {
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 8 -> logon_ack_message_record.exchange_id[logon_ack_message_at] = logon_ack_message_value; logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 4 -> logon_ack_message_record.last_cl_msg_seq_num[logon_ack_message_at] = logon_ack_message_value; logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Ack Message set to where it lies, so a field read out of place says so */
inline ramp_logon_ack_message(logon_ack_message_record, logon_ack_message_base) {
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 8 -> logon_ack_message_record.exchange_id[logon_ack_message_at] = (logon_ack_message_base + 0 + logon_ack_message_at + 1) % 256; logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 4 -> logon_ack_message_record.last_cl_msg_seq_num[logon_ack_message_at] = (logon_ack_message_base + 8 + logon_ack_message_at + 1) % 256; logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Ack Message to the wire, 12 bytes from where the cursor stands */
inline encode_logon_ack_message(logon_ack_message_record) {
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 8 -> wire[at] = logon_ack_message_record.exchange_id[logon_ack_message_at]; at = at + 1; logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 4 -> wire[at] = logon_ack_message_record.last_cl_msg_seq_num[logon_ack_message_at]; at = at + 1; logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Ack Message off the wire, 12 bytes from where the cursor stands */
inline decode_logon_ack_message(logon_ack_message_record) {
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 8 -> logon_ack_message_record.exchange_id[logon_ack_message_at] = wire[at]; at = at + 1; logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 4 -> logon_ack_message_record.last_cl_msg_seq_num[logon_ack_message_at] = wire[at]; at = at + 1; logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Ack Message is what was written, byte for byte */
inline equal_logon_ack_message(logon_ack_message_read, logon_ack_message_written) {
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 8 -> assert(logon_ack_message_read.exchange_id[logon_ack_message_at] == logon_ack_message_written.exchange_id[logon_ack_message_at]); logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  logon_ack_message_at = 0;
  do
  :: logon_ack_message_at < 4 -> assert(logon_ack_message_read.last_cl_msg_seq_num[logon_ack_message_at] == logon_ack_message_written.last_cl_msg_seq_num[logon_ack_message_at]); logon_ack_message_at = logon_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Reject Message: 17 bytes ------------------------------------------ */

/* LogonRejectMessage */
typedef LogonRejectMessage {
  byte exchange_id[8];
  byte logon_reject_code;
  byte last_cl_msg_seq_num[4];
  byte last_msg_seq_num[4]
};

int logon_reject_message_at;

/* every byte of Logon Reject Message set to one value */
inline fill_logon_reject_message(logon_reject_message_record, logon_reject_message_value) {
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 8 -> logon_reject_message_record.exchange_id[logon_reject_message_at] = logon_reject_message_value; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  logon_reject_message_record.logon_reject_code = logon_reject_message_value;
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> logon_reject_message_record.last_cl_msg_seq_num[logon_reject_message_at] = logon_reject_message_value; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> logon_reject_message_record.last_msg_seq_num[logon_reject_message_at] = logon_reject_message_value; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Reject Message set to where it lies, so a field read out of place says so */
inline ramp_logon_reject_message(logon_reject_message_record, logon_reject_message_base) {
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 8 -> logon_reject_message_record.exchange_id[logon_reject_message_at] = (logon_reject_message_base + 0 + logon_reject_message_at + 1) % 256; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  logon_reject_message_record.logon_reject_code = (logon_reject_message_base + 8 + 1) % 256;
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> logon_reject_message_record.last_cl_msg_seq_num[logon_reject_message_at] = (logon_reject_message_base + 9 + logon_reject_message_at + 1) % 256; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> logon_reject_message_record.last_msg_seq_num[logon_reject_message_at] = (logon_reject_message_base + 13 + logon_reject_message_at + 1) % 256; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Reject Message to the wire, 17 bytes from where the cursor stands */
inline encode_logon_reject_message(logon_reject_message_record) {
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 8 -> wire[at] = logon_reject_message_record.exchange_id[logon_reject_message_at]; at = at + 1; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_reject_message_record.logon_reject_code; at = at + 1;
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> wire[at] = logon_reject_message_record.last_cl_msg_seq_num[logon_reject_message_at]; at = at + 1; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> wire[at] = logon_reject_message_record.last_msg_seq_num[logon_reject_message_at]; at = at + 1; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Reject Message off the wire, 17 bytes from where the cursor stands */
inline decode_logon_reject_message(logon_reject_message_record) {
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 8 -> logon_reject_message_record.exchange_id[logon_reject_message_at] = wire[at]; at = at + 1; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  logon_reject_message_record.logon_reject_code = wire[at]; at = at + 1;
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> logon_reject_message_record.last_cl_msg_seq_num[logon_reject_message_at] = wire[at]; at = at + 1; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> logon_reject_message_record.last_msg_seq_num[logon_reject_message_at] = wire[at]; at = at + 1; logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Reject Message is what was written, byte for byte */
inline equal_logon_reject_message(logon_reject_message_read, logon_reject_message_written) {
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 8 -> assert(logon_reject_message_read.exchange_id[logon_reject_message_at] == logon_reject_message_written.exchange_id[logon_reject_message_at]); logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  assert(logon_reject_message_read.logon_reject_code == logon_reject_message_written.logon_reject_code);
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> assert(logon_reject_message_read.last_cl_msg_seq_num[logon_reject_message_at] == logon_reject_message_written.last_cl_msg_seq_num[logon_reject_message_at]); logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  logon_reject_message_at = 0;
  do
  :: logon_reject_message_at < 4 -> assert(logon_reject_message_read.last_msg_seq_num[logon_reject_message_at] == logon_reject_message_written.last_msg_seq_num[logon_reject_message_at]); logon_reject_message_at = logon_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Message: 1 bytes ------------------------------------------------- */

/* LogoutMessage */
typedef LogoutMessage {
  byte log_out_reason_code
};

/* every byte of Logout Message set to one value */
inline fill_logout_message(logout_message_record, logout_message_value) {
  logout_message_record.log_out_reason_code = logout_message_value;
  skip
}

/* each byte of Logout Message set to where it lies, so a field read out of place says so */
inline ramp_logout_message(logout_message_record, logout_message_base) {
  logout_message_record.log_out_reason_code = (logout_message_base + 0 + 1) % 256;
  skip
}

/* Logout Message to the wire, 1 bytes from where the cursor stands */
inline encode_logout_message(logout_message_record) {
  wire[at] = logout_message_record.log_out_reason_code; at = at + 1;
  skip
}

/* Logout Message off the wire, 1 bytes from where the cursor stands */
inline decode_logout_message(logout_message_record) {
  logout_message_record.log_out_reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Logout Message is what was written, byte for byte */
inline equal_logout_message(logout_message_read, logout_message_written) {
  assert(logout_message_read.log_out_reason_code == logout_message_written.log_out_reason_code);
  skip
}

/* ---- Technical Reject Message: 17 bytes -------------------------------------- */

/* TechnicalRejectMessage */
typedef TechnicalRejectMessage {
  byte oeg_out_to_member_optional[8];
  byte rejected_client_message_sequence_number[4];
  byte rejected_message;
  byte error_code[2];
  byte rejected_message_id[2]
};

int technical_reject_message_at;

/* every byte of Technical Reject Message set to one value */
inline fill_technical_reject_message(technical_reject_message_record, technical_reject_message_value) {
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 8 -> technical_reject_message_record.oeg_out_to_member_optional[technical_reject_message_at] = technical_reject_message_value; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 4 -> technical_reject_message_record.rejected_client_message_sequence_number[technical_reject_message_at] = technical_reject_message_value; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_record.rejected_message = technical_reject_message_value;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> technical_reject_message_record.error_code[technical_reject_message_at] = technical_reject_message_value; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> technical_reject_message_record.rejected_message_id[technical_reject_message_at] = technical_reject_message_value; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Technical Reject Message set to where it lies, so a field read out of place says so */
inline ramp_technical_reject_message(technical_reject_message_record, technical_reject_message_base) {
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 8 -> technical_reject_message_record.oeg_out_to_member_optional[technical_reject_message_at] = (technical_reject_message_base + 0 + technical_reject_message_at + 1) % 256; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 4 -> technical_reject_message_record.rejected_client_message_sequence_number[technical_reject_message_at] = (technical_reject_message_base + 8 + technical_reject_message_at + 1) % 256; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_record.rejected_message = (technical_reject_message_base + 12 + 1) % 256;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> technical_reject_message_record.error_code[technical_reject_message_at] = (technical_reject_message_base + 13 + technical_reject_message_at + 1) % 256; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> technical_reject_message_record.rejected_message_id[technical_reject_message_at] = (technical_reject_message_base + 15 + technical_reject_message_at + 1) % 256; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Technical Reject Message to the wire, 17 bytes from where the cursor stands */
inline encode_technical_reject_message(technical_reject_message_record) {
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 8 -> wire[at] = technical_reject_message_record.oeg_out_to_member_optional[technical_reject_message_at]; at = at + 1; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 4 -> wire[at] = technical_reject_message_record.rejected_client_message_sequence_number[technical_reject_message_at]; at = at + 1; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = technical_reject_message_record.rejected_message; at = at + 1;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> wire[at] = technical_reject_message_record.error_code[technical_reject_message_at]; at = at + 1; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> wire[at] = technical_reject_message_record.rejected_message_id[technical_reject_message_at]; at = at + 1; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Technical Reject Message off the wire, 17 bytes from where the cursor stands */
inline decode_technical_reject_message(technical_reject_message_record) {
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 8 -> technical_reject_message_record.oeg_out_to_member_optional[technical_reject_message_at] = wire[at]; at = at + 1; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 4 -> technical_reject_message_record.rejected_client_message_sequence_number[technical_reject_message_at] = wire[at]; at = at + 1; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_record.rejected_message = wire[at]; at = at + 1;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> technical_reject_message_record.error_code[technical_reject_message_at] = wire[at]; at = at + 1; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> technical_reject_message_record.rejected_message_id[technical_reject_message_at] = wire[at]; at = at + 1; technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Technical Reject Message is what was written, byte for byte */
inline equal_technical_reject_message(technical_reject_message_read, technical_reject_message_written) {
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 8 -> assert(technical_reject_message_read.oeg_out_to_member_optional[technical_reject_message_at] == technical_reject_message_written.oeg_out_to_member_optional[technical_reject_message_at]); technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 4 -> assert(technical_reject_message_read.rejected_client_message_sequence_number[technical_reject_message_at] == technical_reject_message_written.rejected_client_message_sequence_number[technical_reject_message_at]); technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  assert(technical_reject_message_read.rejected_message == technical_reject_message_written.rejected_message);
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> assert(technical_reject_message_read.error_code[technical_reject_message_at] == technical_reject_message_written.error_code[technical_reject_message_at]); technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  technical_reject_message_at = 0;
  do
  :: technical_reject_message_at < 2 -> assert(technical_reject_message_read.rejected_message_id[technical_reject_message_at] == technical_reject_message_written.rejected_message_id[technical_reject_message_at]); technical_reject_message_at = technical_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Declaration Cancel And Refusal Message: 42 bytes ------------------------ */

/* DeclarationCancelAndRefusalMessage */
typedef DeclarationCancelAndRefusalMessage {
  byte cl_msg_seq_num[4];
  byte firm_id[8];
  byte sending_time[8];
  byte client_order_id[8];
  byte symbol_index[4];
  byte emm;
  byte declaration_id[8];
  byte action_type
};

int declaration_cancel_and_refusal_message_at;

/* every byte of Declaration Cancel And Refusal Message set to one value */
inline fill_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_record, declaration_cancel_and_refusal_message_value) {
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> declaration_cancel_and_refusal_message_record.cl_msg_seq_num[declaration_cancel_and_refusal_message_at] = declaration_cancel_and_refusal_message_value; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.firm_id[declaration_cancel_and_refusal_message_at] = declaration_cancel_and_refusal_message_value; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.sending_time[declaration_cancel_and_refusal_message_at] = declaration_cancel_and_refusal_message_value; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.client_order_id[declaration_cancel_and_refusal_message_at] = declaration_cancel_and_refusal_message_value; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> declaration_cancel_and_refusal_message_record.symbol_index[declaration_cancel_and_refusal_message_at] = declaration_cancel_and_refusal_message_value; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_record.emm = declaration_cancel_and_refusal_message_value;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.declaration_id[declaration_cancel_and_refusal_message_at] = declaration_cancel_and_refusal_message_value; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_record.action_type = declaration_cancel_and_refusal_message_value;
  skip
}

/* each byte of Declaration Cancel And Refusal Message set to where it lies, so a field read out of place says so */
inline ramp_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_record, declaration_cancel_and_refusal_message_base) {
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> declaration_cancel_and_refusal_message_record.cl_msg_seq_num[declaration_cancel_and_refusal_message_at] = (declaration_cancel_and_refusal_message_base + 0 + declaration_cancel_and_refusal_message_at + 1) % 256; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.firm_id[declaration_cancel_and_refusal_message_at] = (declaration_cancel_and_refusal_message_base + 4 + declaration_cancel_and_refusal_message_at + 1) % 256; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.sending_time[declaration_cancel_and_refusal_message_at] = (declaration_cancel_and_refusal_message_base + 12 + declaration_cancel_and_refusal_message_at + 1) % 256; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.client_order_id[declaration_cancel_and_refusal_message_at] = (declaration_cancel_and_refusal_message_base + 20 + declaration_cancel_and_refusal_message_at + 1) % 256; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> declaration_cancel_and_refusal_message_record.symbol_index[declaration_cancel_and_refusal_message_at] = (declaration_cancel_and_refusal_message_base + 28 + declaration_cancel_and_refusal_message_at + 1) % 256; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_record.emm = (declaration_cancel_and_refusal_message_base + 32 + 1) % 256;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.declaration_id[declaration_cancel_and_refusal_message_at] = (declaration_cancel_and_refusal_message_base + 33 + declaration_cancel_and_refusal_message_at + 1) % 256; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_record.action_type = (declaration_cancel_and_refusal_message_base + 41 + 1) % 256;
  skip
}

/* Declaration Cancel And Refusal Message to the wire, 42 bytes from where the cursor stands */
inline encode_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_record) {
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> wire[at] = declaration_cancel_and_refusal_message_record.cl_msg_seq_num[declaration_cancel_and_refusal_message_at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> wire[at] = declaration_cancel_and_refusal_message_record.firm_id[declaration_cancel_and_refusal_message_at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> wire[at] = declaration_cancel_and_refusal_message_record.sending_time[declaration_cancel_and_refusal_message_at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> wire[at] = declaration_cancel_and_refusal_message_record.client_order_id[declaration_cancel_and_refusal_message_at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> wire[at] = declaration_cancel_and_refusal_message_record.symbol_index[declaration_cancel_and_refusal_message_at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  wire[at] = declaration_cancel_and_refusal_message_record.emm; at = at + 1;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> wire[at] = declaration_cancel_and_refusal_message_record.declaration_id[declaration_cancel_and_refusal_message_at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  wire[at] = declaration_cancel_and_refusal_message_record.action_type; at = at + 1;
  skip
}

/* Declaration Cancel And Refusal Message off the wire, 42 bytes from where the cursor stands */
inline decode_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_record) {
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> declaration_cancel_and_refusal_message_record.cl_msg_seq_num[declaration_cancel_and_refusal_message_at] = wire[at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.firm_id[declaration_cancel_and_refusal_message_at] = wire[at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.sending_time[declaration_cancel_and_refusal_message_at] = wire[at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.client_order_id[declaration_cancel_and_refusal_message_at] = wire[at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> declaration_cancel_and_refusal_message_record.symbol_index[declaration_cancel_and_refusal_message_at] = wire[at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_record.emm = wire[at]; at = at + 1;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> declaration_cancel_and_refusal_message_record.declaration_id[declaration_cancel_and_refusal_message_at] = wire[at]; at = at + 1; declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_record.action_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Declaration Cancel And Refusal Message is what was written, byte for byte */
inline equal_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_read, declaration_cancel_and_refusal_message_written) {
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> assert(declaration_cancel_and_refusal_message_read.cl_msg_seq_num[declaration_cancel_and_refusal_message_at] == declaration_cancel_and_refusal_message_written.cl_msg_seq_num[declaration_cancel_and_refusal_message_at]); declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> assert(declaration_cancel_and_refusal_message_read.firm_id[declaration_cancel_and_refusal_message_at] == declaration_cancel_and_refusal_message_written.firm_id[declaration_cancel_and_refusal_message_at]); declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> assert(declaration_cancel_and_refusal_message_read.sending_time[declaration_cancel_and_refusal_message_at] == declaration_cancel_and_refusal_message_written.sending_time[declaration_cancel_and_refusal_message_at]); declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> assert(declaration_cancel_and_refusal_message_read.client_order_id[declaration_cancel_and_refusal_message_at] == declaration_cancel_and_refusal_message_written.client_order_id[declaration_cancel_and_refusal_message_at]); declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 4 -> assert(declaration_cancel_and_refusal_message_read.symbol_index[declaration_cancel_and_refusal_message_at] == declaration_cancel_and_refusal_message_written.symbol_index[declaration_cancel_and_refusal_message_at]); declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  assert(declaration_cancel_and_refusal_message_read.emm == declaration_cancel_and_refusal_message_written.emm);
  declaration_cancel_and_refusal_message_at = 0;
  do
  :: declaration_cancel_and_refusal_message_at < 8 -> assert(declaration_cancel_and_refusal_message_read.declaration_id[declaration_cancel_and_refusal_message_at] == declaration_cancel_and_refusal_message_written.declaration_id[declaration_cancel_and_refusal_message_at]); declaration_cancel_and_refusal_message_at = declaration_cancel_and_refusal_message_at + 1
  :: else -> break
  od;
  assert(declaration_cancel_and_refusal_message_read.action_type == declaration_cancel_and_refusal_message_written.action_type);
  skip
}

/* ---- Fund Price Input Message: 42 bytes -------------------------------------- */

/* FundPriceInputMessage */
typedef FundPriceInputMessage {
  byte cl_msg_seq_num[4];
  byte firm_id[8];
  byte sending_time[8];
  byte client_order_id[8];
  byte symbol_index[4];
  byte emm;
  byte price[8];
  byte bypass_indicator
};

int fund_price_input_message_at;

/* every byte of Fund Price Input Message set to one value */
inline fill_fund_price_input_message(fund_price_input_message_record, fund_price_input_message_value) {
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> fund_price_input_message_record.cl_msg_seq_num[fund_price_input_message_at] = fund_price_input_message_value; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.firm_id[fund_price_input_message_at] = fund_price_input_message_value; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.sending_time[fund_price_input_message_at] = fund_price_input_message_value; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.client_order_id[fund_price_input_message_at] = fund_price_input_message_value; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> fund_price_input_message_record.symbol_index[fund_price_input_message_at] = fund_price_input_message_value; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_record.emm = fund_price_input_message_value;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.price[fund_price_input_message_at] = fund_price_input_message_value; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_record.bypass_indicator = fund_price_input_message_value;
  skip
}

/* each byte of Fund Price Input Message set to where it lies, so a field read out of place says so */
inline ramp_fund_price_input_message(fund_price_input_message_record, fund_price_input_message_base) {
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> fund_price_input_message_record.cl_msg_seq_num[fund_price_input_message_at] = (fund_price_input_message_base + 0 + fund_price_input_message_at + 1) % 256; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.firm_id[fund_price_input_message_at] = (fund_price_input_message_base + 4 + fund_price_input_message_at + 1) % 256; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.sending_time[fund_price_input_message_at] = (fund_price_input_message_base + 12 + fund_price_input_message_at + 1) % 256; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.client_order_id[fund_price_input_message_at] = (fund_price_input_message_base + 20 + fund_price_input_message_at + 1) % 256; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> fund_price_input_message_record.symbol_index[fund_price_input_message_at] = (fund_price_input_message_base + 28 + fund_price_input_message_at + 1) % 256; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_record.emm = (fund_price_input_message_base + 32 + 1) % 256;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.price[fund_price_input_message_at] = (fund_price_input_message_base + 33 + fund_price_input_message_at + 1) % 256; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_record.bypass_indicator = (fund_price_input_message_base + 41 + 1) % 256;
  skip
}

/* Fund Price Input Message to the wire, 42 bytes from where the cursor stands */
inline encode_fund_price_input_message(fund_price_input_message_record) {
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> wire[at] = fund_price_input_message_record.cl_msg_seq_num[fund_price_input_message_at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> wire[at] = fund_price_input_message_record.firm_id[fund_price_input_message_at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> wire[at] = fund_price_input_message_record.sending_time[fund_price_input_message_at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> wire[at] = fund_price_input_message_record.client_order_id[fund_price_input_message_at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> wire[at] = fund_price_input_message_record.symbol_index[fund_price_input_message_at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  wire[at] = fund_price_input_message_record.emm; at = at + 1;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> wire[at] = fund_price_input_message_record.price[fund_price_input_message_at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  wire[at] = fund_price_input_message_record.bypass_indicator; at = at + 1;
  skip
}

/* Fund Price Input Message off the wire, 42 bytes from where the cursor stands */
inline decode_fund_price_input_message(fund_price_input_message_record) {
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> fund_price_input_message_record.cl_msg_seq_num[fund_price_input_message_at] = wire[at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.firm_id[fund_price_input_message_at] = wire[at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.sending_time[fund_price_input_message_at] = wire[at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.client_order_id[fund_price_input_message_at] = wire[at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> fund_price_input_message_record.symbol_index[fund_price_input_message_at] = wire[at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_record.emm = wire[at]; at = at + 1;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> fund_price_input_message_record.price[fund_price_input_message_at] = wire[at]; at = at + 1; fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_record.bypass_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Fund Price Input Message is what was written, byte for byte */
inline equal_fund_price_input_message(fund_price_input_message_read, fund_price_input_message_written) {
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> assert(fund_price_input_message_read.cl_msg_seq_num[fund_price_input_message_at] == fund_price_input_message_written.cl_msg_seq_num[fund_price_input_message_at]); fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> assert(fund_price_input_message_read.firm_id[fund_price_input_message_at] == fund_price_input_message_written.firm_id[fund_price_input_message_at]); fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> assert(fund_price_input_message_read.sending_time[fund_price_input_message_at] == fund_price_input_message_written.sending_time[fund_price_input_message_at]); fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> assert(fund_price_input_message_read.client_order_id[fund_price_input_message_at] == fund_price_input_message_written.client_order_id[fund_price_input_message_at]); fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 4 -> assert(fund_price_input_message_read.symbol_index[fund_price_input_message_at] == fund_price_input_message_written.symbol_index[fund_price_input_message_at]); fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  assert(fund_price_input_message_read.emm == fund_price_input_message_written.emm);
  fund_price_input_message_at = 0;
  do
  :: fund_price_input_message_at < 8 -> assert(fund_price_input_message_read.price[fund_price_input_message_at] == fund_price_input_message_written.price[fund_price_input_message_at]); fund_price_input_message_at = fund_price_input_message_at + 1
  :: else -> break
  od;
  assert(fund_price_input_message_read.bypass_indicator == fund_price_input_message_written.bypass_indicator);
  skip
}

/* ---- Fund Price Input Ack Message: 34 bytes ---------------------------------- */

/* FundPriceInputAckMessage */
typedef FundPriceInputAckMessage {
  byte msg_seq_num[4];
  byte firm_id[8];
  byte client_order_id[8];
  byte symbol_index[4];
  byte emm;
  byte price[8];
  byte bypass_indicator
};

int fund_price_input_ack_message_at;

/* every byte of Fund Price Input Ack Message set to one value */
inline fill_fund_price_input_ack_message(fund_price_input_ack_message_record, fund_price_input_ack_message_value) {
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> fund_price_input_ack_message_record.msg_seq_num[fund_price_input_ack_message_at] = fund_price_input_ack_message_value; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> fund_price_input_ack_message_record.firm_id[fund_price_input_ack_message_at] = fund_price_input_ack_message_value; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> fund_price_input_ack_message_record.client_order_id[fund_price_input_ack_message_at] = fund_price_input_ack_message_value; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> fund_price_input_ack_message_record.symbol_index[fund_price_input_ack_message_at] = fund_price_input_ack_message_value; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_record.emm = fund_price_input_ack_message_value;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> fund_price_input_ack_message_record.price[fund_price_input_ack_message_at] = fund_price_input_ack_message_value; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_record.bypass_indicator = fund_price_input_ack_message_value;
  skip
}

/* each byte of Fund Price Input Ack Message set to where it lies, so a field read out of place says so */
inline ramp_fund_price_input_ack_message(fund_price_input_ack_message_record, fund_price_input_ack_message_base) {
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> fund_price_input_ack_message_record.msg_seq_num[fund_price_input_ack_message_at] = (fund_price_input_ack_message_base + 0 + fund_price_input_ack_message_at + 1) % 256; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> fund_price_input_ack_message_record.firm_id[fund_price_input_ack_message_at] = (fund_price_input_ack_message_base + 4 + fund_price_input_ack_message_at + 1) % 256; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> fund_price_input_ack_message_record.client_order_id[fund_price_input_ack_message_at] = (fund_price_input_ack_message_base + 12 + fund_price_input_ack_message_at + 1) % 256; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> fund_price_input_ack_message_record.symbol_index[fund_price_input_ack_message_at] = (fund_price_input_ack_message_base + 20 + fund_price_input_ack_message_at + 1) % 256; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_record.emm = (fund_price_input_ack_message_base + 24 + 1) % 256;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> fund_price_input_ack_message_record.price[fund_price_input_ack_message_at] = (fund_price_input_ack_message_base + 25 + fund_price_input_ack_message_at + 1) % 256; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_record.bypass_indicator = (fund_price_input_ack_message_base + 33 + 1) % 256;
  skip
}

/* Fund Price Input Ack Message to the wire, 34 bytes from where the cursor stands */
inline encode_fund_price_input_ack_message(fund_price_input_ack_message_record) {
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> wire[at] = fund_price_input_ack_message_record.msg_seq_num[fund_price_input_ack_message_at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> wire[at] = fund_price_input_ack_message_record.firm_id[fund_price_input_ack_message_at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> wire[at] = fund_price_input_ack_message_record.client_order_id[fund_price_input_ack_message_at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> wire[at] = fund_price_input_ack_message_record.symbol_index[fund_price_input_ack_message_at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = fund_price_input_ack_message_record.emm; at = at + 1;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> wire[at] = fund_price_input_ack_message_record.price[fund_price_input_ack_message_at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = fund_price_input_ack_message_record.bypass_indicator; at = at + 1;
  skip
}

/* Fund Price Input Ack Message off the wire, 34 bytes from where the cursor stands */
inline decode_fund_price_input_ack_message(fund_price_input_ack_message_record) {
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> fund_price_input_ack_message_record.msg_seq_num[fund_price_input_ack_message_at] = wire[at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> fund_price_input_ack_message_record.firm_id[fund_price_input_ack_message_at] = wire[at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> fund_price_input_ack_message_record.client_order_id[fund_price_input_ack_message_at] = wire[at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> fund_price_input_ack_message_record.symbol_index[fund_price_input_ack_message_at] = wire[at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_record.emm = wire[at]; at = at + 1;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> fund_price_input_ack_message_record.price[fund_price_input_ack_message_at] = wire[at]; at = at + 1; fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_record.bypass_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Fund Price Input Ack Message is what was written, byte for byte */
inline equal_fund_price_input_ack_message(fund_price_input_ack_message_read, fund_price_input_ack_message_written) {
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> assert(fund_price_input_ack_message_read.msg_seq_num[fund_price_input_ack_message_at] == fund_price_input_ack_message_written.msg_seq_num[fund_price_input_ack_message_at]); fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> assert(fund_price_input_ack_message_read.firm_id[fund_price_input_ack_message_at] == fund_price_input_ack_message_written.firm_id[fund_price_input_ack_message_at]); fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> assert(fund_price_input_ack_message_read.client_order_id[fund_price_input_ack_message_at] == fund_price_input_ack_message_written.client_order_id[fund_price_input_ack_message_at]); fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 4 -> assert(fund_price_input_ack_message_read.symbol_index[fund_price_input_ack_message_at] == fund_price_input_ack_message_written.symbol_index[fund_price_input_ack_message_at]); fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  assert(fund_price_input_ack_message_read.emm == fund_price_input_ack_message_written.emm);
  fund_price_input_ack_message_at = 0;
  do
  :: fund_price_input_ack_message_at < 8 -> assert(fund_price_input_ack_message_read.price[fund_price_input_ack_message_at] == fund_price_input_ack_message_written.price[fund_price_input_ack_message_at]); fund_price_input_ack_message_at = fund_price_input_ack_message_at + 1
  :: else -> break
  od;
  assert(fund_price_input_ack_message_read.bypass_indicator == fund_price_input_ack_message_written.bypass_indicator);
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

/* Open Order Request Message: encoded, read back, and compared */
proctype check_open_order_request_message() {
  OpenOrderRequestMessage open_order_request_message_sent;
  OpenOrderRequestMessage open_order_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_order_request_message(open_order_request_message_sent, 0)
  :: pattern == 1 -> fill_open_order_request_message(open_order_request_message_sent, 32)
  :: pattern == 2 -> fill_open_order_request_message(open_order_request_message_sent, 255)
  :: else -> ramp_open_order_request_message(open_order_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_order_request_message(open_order_request_message_sent);
    assert(at == 58);
    at = 0;
    decode_open_order_request_message(open_order_request_message_got);
    assert(at == 58);
    equal_open_order_request_message(open_order_request_message_got, open_order_request_message_sent)
  }
}

/* Ownership Request Ack Message: encoded, read back, and compared */
proctype check_ownership_request_ack_message() {
  OwnershipRequestAckMessage ownership_request_ack_message_sent;
  OwnershipRequestAckMessage ownership_request_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ownership_request_ack_message(ownership_request_ack_message_sent, 0)
  :: pattern == 1 -> fill_ownership_request_ack_message(ownership_request_ack_message_sent, 32)
  :: pattern == 2 -> fill_ownership_request_ack_message(ownership_request_ack_message_sent, 255)
  :: else -> ramp_ownership_request_ack_message(ownership_request_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ownership_request_ack_message(ownership_request_ack_message_sent);
    assert(at == 43);
    at = 0;
    decode_ownership_request_ack_message(ownership_request_ack_message_got);
    assert(at == 43);
    equal_ownership_request_ack_message(ownership_request_ack_message_got, ownership_request_ack_message_sent)
  }
}

/* Ownership Request Message: encoded, read back, and compared */
proctype check_ownership_request_message() {
  OwnershipRequestMessage ownership_request_message_sent;
  OwnershipRequestMessage ownership_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ownership_request_message(ownership_request_message_sent, 0)
  :: pattern == 1 -> fill_ownership_request_message(ownership_request_message_sent, 32)
  :: pattern == 2 -> fill_ownership_request_message(ownership_request_message_sent, 255)
  :: else -> ramp_ownership_request_message(ownership_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ownership_request_message(ownership_request_message_sent);
    assert(at == 64);
    at = 0;
    decode_ownership_request_message(ownership_request_message_got);
    assert(at == 64);
    equal_ownership_request_message(ownership_request_message_got, ownership_request_message_sent)
  }
}

/* Trade Bust Notification Message: encoded, read back, and compared */
proctype check_trade_bust_notification_message() {
  TradeBustNotificationMessage trade_bust_notification_message_sent;
  TradeBustNotificationMessage trade_bust_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_bust_notification_message(trade_bust_notification_message_sent, 0)
  :: pattern == 1 -> fill_trade_bust_notification_message(trade_bust_notification_message_sent, 32)
  :: pattern == 2 -> fill_trade_bust_notification_message(trade_bust_notification_message_sent, 255)
  :: else -> ramp_trade_bust_notification_message(trade_bust_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_bust_notification_message(trade_bust_notification_message_sent);
    assert(at == 81);
    at = 0;
    decode_trade_bust_notification_message(trade_bust_notification_message_got);
    assert(at == 81);
    equal_trade_bust_notification_message(trade_bust_notification_message_got, trade_bust_notification_message_sent)
  }
}

/* Collar Breach Confirmation Message: encoded, read back, and compared */
proctype check_collar_breach_confirmation_message() {
  CollarBreachConfirmationMessage collar_breach_confirmation_message_sent;
  CollarBreachConfirmationMessage collar_breach_confirmation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_collar_breach_confirmation_message(collar_breach_confirmation_message_sent, 0)
  :: pattern == 1 -> fill_collar_breach_confirmation_message(collar_breach_confirmation_message_sent, 32)
  :: pattern == 2 -> fill_collar_breach_confirmation_message(collar_breach_confirmation_message_sent, 255)
  :: else -> ramp_collar_breach_confirmation_message(collar_breach_confirmation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_collar_breach_confirmation_message(collar_breach_confirmation_message_sent);
    assert(at == 57);
    at = 0;
    decode_collar_breach_confirmation_message(collar_breach_confirmation_message_got);
    assert(at == 57);
    equal_collar_breach_confirmation_message(collar_breach_confirmation_message_got, collar_breach_confirmation_message_sent)
  }
}

/* Price Input Message: encoded, read back, and compared */
proctype check_price_input_message() {
  PriceInputMessage price_input_message_sent;
  PriceInputMessage price_input_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_input_message(price_input_message_sent, 0)
  :: pattern == 1 -> fill_price_input_message(price_input_message_sent, 32)
  :: pattern == 2 -> fill_price_input_message(price_input_message_sent, 255)
  :: else -> ramp_price_input_message(price_input_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_input_message(price_input_message_sent);
    assert(at == 50);
    at = 0;
    decode_price_input_message(price_input_message_got);
    assert(at == 50);
    equal_price_input_message(price_input_message_got, price_input_message_sent)
  }
}

/* Liquidity Provider Command Message: encoded, read back, and compared */
proctype check_liquidity_provider_command_message() {
  LiquidityProviderCommandMessage liquidity_provider_command_message_sent;
  LiquidityProviderCommandMessage liquidity_provider_command_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_provider_command_message(liquidity_provider_command_message_sent, 0)
  :: pattern == 1 -> fill_liquidity_provider_command_message(liquidity_provider_command_message_sent, 32)
  :: pattern == 2 -> fill_liquidity_provider_command_message(liquidity_provider_command_message_sent, 255)
  :: else -> ramp_liquidity_provider_command_message(liquidity_provider_command_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_provider_command_message(liquidity_provider_command_message_sent);
    assert(at == 42);
    at = 0;
    decode_liquidity_provider_command_message(liquidity_provider_command_message_got);
    assert(at == 42);
    equal_liquidity_provider_command_message(liquidity_provider_command_message_got, liquidity_provider_command_message_sent)
  }
}

/* Ask For Quote Message: encoded, read back, and compared */
proctype check_ask_for_quote_message() {
  AskForQuoteMessage ask_for_quote_message_sent;
  AskForQuoteMessage ask_for_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ask_for_quote_message(ask_for_quote_message_sent, 0)
  :: pattern == 1 -> fill_ask_for_quote_message(ask_for_quote_message_sent, 32)
  :: pattern == 2 -> fill_ask_for_quote_message(ask_for_quote_message_sent, 255)
  :: else -> ramp_ask_for_quote_message(ask_for_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ask_for_quote_message(ask_for_quote_message_sent);
    assert(at == 18);
    at = 0;
    decode_ask_for_quote_message(ask_for_quote_message_got);
    assert(at == 18);
    equal_ask_for_quote_message(ask_for_quote_message_got, ask_for_quote_message_sent)
  }
}

/* Request For Execution Message: encoded, read back, and compared */
proctype check_request_for_execution_message() {
  RequestForExecutionMessage request_for_execution_message_sent;
  RequestForExecutionMessage request_for_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_for_execution_message(request_for_execution_message_sent, 0)
  :: pattern == 1 -> fill_request_for_execution_message(request_for_execution_message_sent, 32)
  :: pattern == 2 -> fill_request_for_execution_message(request_for_execution_message_sent, 255)
  :: else -> ramp_request_for_execution_message(request_for_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_for_execution_message(request_for_execution_message_sent);
    assert(at == 17);
    at = 0;
    decode_request_for_execution_message(request_for_execution_message_got);
    assert(at == 17);
    equal_request_for_execution_message(request_for_execution_message_got, request_for_execution_message_sent)
  }
}

/* Rfq Matching Status Message: encoded, read back, and compared */
proctype check_rfq_matching_status_message() {
  RfqMatchingStatusMessage rfq_matching_status_message_sent;
  RfqMatchingStatusMessage rfq_matching_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rfq_matching_status_message(rfq_matching_status_message_sent, 0)
  :: pattern == 1 -> fill_rfq_matching_status_message(rfq_matching_status_message_sent, 32)
  :: pattern == 2 -> fill_rfq_matching_status_message(rfq_matching_status_message_sent, 255)
  :: else -> ramp_rfq_matching_status_message(rfq_matching_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rfq_matching_status_message(rfq_matching_status_message_sent);
    assert(at == 76);
    at = 0;
    decode_rfq_matching_status_message(rfq_matching_status_message_got);
    assert(at == 76);
    equal_rfq_matching_status_message(rfq_matching_status_message_got, rfq_matching_status_message_sent)
  }
}

/* Rfqlp Matching Status Message: encoded, read back, and compared */
proctype check_rfqlp_matching_status_message() {
  RfqlpMatchingStatusMessage rfqlp_matching_status_message_sent;
  RfqlpMatchingStatusMessage rfqlp_matching_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rfqlp_matching_status_message(rfqlp_matching_status_message_sent, 0)
  :: pattern == 1 -> fill_rfqlp_matching_status_message(rfqlp_matching_status_message_sent, 32)
  :: pattern == 2 -> fill_rfqlp_matching_status_message(rfqlp_matching_status_message_sent, 255)
  :: else -> ramp_rfqlp_matching_status_message(rfqlp_matching_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rfqlp_matching_status_message(rfqlp_matching_status_message_sent);
    assert(at == 66);
    at = 0;
    decode_rfqlp_matching_status_message(rfqlp_matching_status_message_got);
    assert(at == 66);
    equal_rfqlp_matching_status_message(rfqlp_matching_status_message_got, rfqlp_matching_status_message_sent)
  }
}

/* Synchronization Time Message: encoded, read back, and compared */
proctype check_synchronization_time_message() {
  SynchronizationTimeMessage synchronization_time_message_sent;
  SynchronizationTimeMessage synchronization_time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_synchronization_time_message(synchronization_time_message_sent, 0)
  :: pattern == 1 -> fill_synchronization_time_message(synchronization_time_message_sent, 32)
  :: pattern == 2 -> fill_synchronization_time_message(synchronization_time_message_sent, 255)
  :: else -> ramp_synchronization_time_message(synchronization_time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_synchronization_time_message(synchronization_time_message_sent);
    assert(at == 22);
    at = 0;
    decode_synchronization_time_message(synchronization_time_message_got);
    assert(at == 22);
    equal_synchronization_time_message(synchronization_time_message_got, synchronization_time_message_sent)
  }
}

/* Security Definition Ack Message: encoded, read back, and compared */
proctype check_security_definition_ack_message() {
  SecurityDefinitionAckMessage security_definition_ack_message_sent;
  SecurityDefinitionAckMessage security_definition_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_definition_ack_message(security_definition_ack_message_sent, 0)
  :: pattern == 1 -> fill_security_definition_ack_message(security_definition_ack_message_sent, 32)
  :: pattern == 2 -> fill_security_definition_ack_message(security_definition_ack_message_sent, 255)
  :: else -> ramp_security_definition_ack_message(security_definition_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_definition_ack_message(security_definition_ack_message_sent);
    assert(at == 80);
    at = 0;
    decode_security_definition_ack_message(security_definition_ack_message_got);
    assert(at == 80);
    equal_security_definition_ack_message(security_definition_ack_message_got, security_definition_ack_message_sent)
  }
}

/* Logon Message: encoded, read back, and compared */
proctype check_logon_message() {
  LogonMessage logon_message_sent;
  LogonMessage logon_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_message(logon_message_sent, 0)
  :: pattern == 1 -> fill_logon_message(logon_message_sent, 32)
  :: pattern == 2 -> fill_logon_message(logon_message_sent, 255)
  :: else -> ramp_logon_message(logon_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_message(logon_message_sent);
    assert(at == 19);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 19);
    equal_logon_message(logon_message_got, logon_message_sent)
  }
}

/* Logon Ack Message: encoded, read back, and compared */
proctype check_logon_ack_message() {
  LogonAckMessage logon_ack_message_sent;
  LogonAckMessage logon_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_ack_message(logon_ack_message_sent, 0)
  :: pattern == 1 -> fill_logon_ack_message(logon_ack_message_sent, 32)
  :: pattern == 2 -> fill_logon_ack_message(logon_ack_message_sent, 255)
  :: else -> ramp_logon_ack_message(logon_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_ack_message(logon_ack_message_sent);
    assert(at == 12);
    at = 0;
    decode_logon_ack_message(logon_ack_message_got);
    assert(at == 12);
    equal_logon_ack_message(logon_ack_message_got, logon_ack_message_sent)
  }
}

/* Logon Reject Message: encoded, read back, and compared */
proctype check_logon_reject_message() {
  LogonRejectMessage logon_reject_message_sent;
  LogonRejectMessage logon_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_reject_message(logon_reject_message_sent, 0)
  :: pattern == 1 -> fill_logon_reject_message(logon_reject_message_sent, 32)
  :: pattern == 2 -> fill_logon_reject_message(logon_reject_message_sent, 255)
  :: else -> ramp_logon_reject_message(logon_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_reject_message(logon_reject_message_sent);
    assert(at == 17);
    at = 0;
    decode_logon_reject_message(logon_reject_message_got);
    assert(at == 17);
    equal_logon_reject_message(logon_reject_message_got, logon_reject_message_sent)
  }
}

/* Logout Message: encoded, read back, and compared */
proctype check_logout_message() {
  LogoutMessage logout_message_sent;
  LogoutMessage logout_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout_message(logout_message_sent, 0)
  :: pattern == 1 -> fill_logout_message(logout_message_sent, 32)
  :: pattern == 2 -> fill_logout_message(logout_message_sent, 255)
  :: else -> ramp_logout_message(logout_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout_message(logout_message_sent);
    assert(at == 1);
    at = 0;
    decode_logout_message(logout_message_got);
    assert(at == 1);
    equal_logout_message(logout_message_got, logout_message_sent)
  }
}

/* Technical Reject Message: encoded, read back, and compared */
proctype check_technical_reject_message() {
  TechnicalRejectMessage technical_reject_message_sent;
  TechnicalRejectMessage technical_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_technical_reject_message(technical_reject_message_sent, 0)
  :: pattern == 1 -> fill_technical_reject_message(technical_reject_message_sent, 32)
  :: pattern == 2 -> fill_technical_reject_message(technical_reject_message_sent, 255)
  :: else -> ramp_technical_reject_message(technical_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_technical_reject_message(technical_reject_message_sent);
    assert(at == 17);
    at = 0;
    decode_technical_reject_message(technical_reject_message_got);
    assert(at == 17);
    equal_technical_reject_message(technical_reject_message_got, technical_reject_message_sent)
  }
}

/* Declaration Cancel And Refusal Message: encoded, read back, and compared */
proctype check_declaration_cancel_and_refusal_message() {
  DeclarationCancelAndRefusalMessage declaration_cancel_and_refusal_message_sent;
  DeclarationCancelAndRefusalMessage declaration_cancel_and_refusal_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_sent, 0)
  :: pattern == 1 -> fill_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_sent, 32)
  :: pattern == 2 -> fill_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_sent, 255)
  :: else -> ramp_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_sent);
    assert(at == 42);
    at = 0;
    decode_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_got);
    assert(at == 42);
    equal_declaration_cancel_and_refusal_message(declaration_cancel_and_refusal_message_got, declaration_cancel_and_refusal_message_sent)
  }
}

/* Fund Price Input Message: encoded, read back, and compared */
proctype check_fund_price_input_message() {
  FundPriceInputMessage fund_price_input_message_sent;
  FundPriceInputMessage fund_price_input_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fund_price_input_message(fund_price_input_message_sent, 0)
  :: pattern == 1 -> fill_fund_price_input_message(fund_price_input_message_sent, 32)
  :: pattern == 2 -> fill_fund_price_input_message(fund_price_input_message_sent, 255)
  :: else -> ramp_fund_price_input_message(fund_price_input_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fund_price_input_message(fund_price_input_message_sent);
    assert(at == 42);
    at = 0;
    decode_fund_price_input_message(fund_price_input_message_got);
    assert(at == 42);
    equal_fund_price_input_message(fund_price_input_message_got, fund_price_input_message_sent)
  }
}

/* Fund Price Input Ack Message: encoded, read back, and compared */
proctype check_fund_price_input_ack_message() {
  FundPriceInputAckMessage fund_price_input_ack_message_sent;
  FundPriceInputAckMessage fund_price_input_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fund_price_input_ack_message(fund_price_input_ack_message_sent, 0)
  :: pattern == 1 -> fill_fund_price_input_ack_message(fund_price_input_ack_message_sent, 32)
  :: pattern == 2 -> fill_fund_price_input_ack_message(fund_price_input_ack_message_sent, 255)
  :: else -> ramp_fund_price_input_ack_message(fund_price_input_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fund_price_input_ack_message(fund_price_input_ack_message_sent);
    assert(at == 34);
    at = 0;
    decode_fund_price_input_ack_message(fund_price_input_ack_message_got);
    assert(at == 34);
    equal_fund_price_input_ack_message(fund_price_input_ack_message_got, fund_price_input_ack_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_frame_header()
  :: run check_message_header()
  :: run check_group_size_encoding()
  :: run check_open_order_request_message()
  :: run check_ownership_request_ack_message()
  :: run check_ownership_request_message()
  :: run check_trade_bust_notification_message()
  :: run check_collar_breach_confirmation_message()
  :: run check_price_input_message()
  :: run check_liquidity_provider_command_message()
  :: run check_ask_for_quote_message()
  :: run check_request_for_execution_message()
  :: run check_rfq_matching_status_message()
  :: run check_rfqlp_matching_status_message()
  :: run check_synchronization_time_message()
  :: run check_security_definition_ack_message()
  :: run check_logon_message()
  :: run check_logon_ack_message()
  :: run check_logon_reject_message()
  :: run check_logout_message()
  :: run check_technical_reject_message()
  :: run check_declaration_cancel_and_refusal_message()
  :: run check_fund_price_input_message()
  :: run check_fund_price_input_ack_message()
  fi
}
