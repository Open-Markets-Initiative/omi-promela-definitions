/*
 * The Members Exchange Members Orders
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
 *   - the dispatch that chooses a message by its type
 *   - a field read in bits
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 71

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Common Header: 3 bytes -------------------------------------------------- */

/* Tcp Common Header */
typedef CommonHeader {
  byte message_type;
  byte message_length[2]
};

int common_header_at;

/* every byte of Common Header set to one value */
inline fill_common_header(common_header_record, common_header_value) {
  common_header_record.message_type = common_header_value;
  common_header_at = 0;
  do
  :: common_header_at < 2 -> common_header_record.message_length[common_header_at] = common_header_value; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Common Header set to where it lies, so a field read out of place says so */
inline ramp_common_header(common_header_record, common_header_base) {
  common_header_record.message_type = (common_header_base + 0 + 1) % 256;
  common_header_at = 0;
  do
  :: common_header_at < 2 -> common_header_record.message_length[common_header_at] = (common_header_base + 1 + common_header_at + 1) % 256; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* Common Header to the wire, 3 bytes from where the cursor stands */
inline encode_common_header(common_header_record) {
  wire[at] = common_header_record.message_type; at = at + 1;
  common_header_at = 0;
  do
  :: common_header_at < 2 -> wire[at] = common_header_record.message_length[common_header_at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* Common Header off the wire, 3 bytes from where the cursor stands */
inline decode_common_header(common_header_record) {
  common_header_record.message_type = wire[at]; at = at + 1;
  common_header_at = 0;
  do
  :: common_header_at < 2 -> common_header_record.message_length[common_header_at] = wire[at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Common Header is what was written, byte for byte */
inline equal_common_header(common_header_read, common_header_written) {
  assert(common_header_read.message_type == common_header_written.message_type);
  common_header_at = 0;
  do
  :: common_header_at < 2 -> assert(common_header_read.message_length[common_header_at] == common_header_written.message_length[common_header_at]); common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Request Message: 2 bytes ------------------------------------------ */

/* Memx Tcp Login message */
typedef LoginRequestMessage {
  byte token_type;
  byte token
};

/* every byte of Login Request Message set to one value */
inline fill_login_request_message(login_request_message_record, login_request_message_value) {
  login_request_message_record.token_type = login_request_message_value;
  login_request_message_record.token = login_request_message_value;
  skip
}

/* each byte of Login Request Message set to where it lies, so a field read out of place says so */
inline ramp_login_request_message(login_request_message_record, login_request_message_base) {
  login_request_message_record.token_type = (login_request_message_base + 0 + 1) % 256;
  login_request_message_record.token = (login_request_message_base + 1 + 1) % 256;
  skip
}

/* Login Request Message to the wire, 2 bytes from where the cursor stands */
inline encode_login_request_message(login_request_message_record) {
  wire[at] = login_request_message_record.token_type; at = at + 1;
  wire[at] = login_request_message_record.token; at = at + 1;
  skip
}

/* Login Request Message off the wire, 2 bytes from where the cursor stands */
inline decode_login_request_message(login_request_message_record) {
  login_request_message_record.token_type = wire[at]; at = at + 1;
  login_request_message_record.token = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Request Message is what was written, byte for byte */
inline equal_login_request_message(login_request_message_read, login_request_message_written) {
  assert(login_request_message_read.token_type == login_request_message_written.token_type);
  assert(login_request_message_read.token == login_request_message_written.token);
  skip
}

/* ---- Replay Request Message: 20 bytes ---------------------------------------- */

/* Memx Tcp Replay Request message */
typedef ReplayRequestMessage {
  byte session_id[8];
  byte next_sequence_number[8];
  byte count[4]
};

int replay_request_message_at;

/* every byte of Replay Request Message set to one value */
inline fill_replay_request_message(replay_request_message_record, replay_request_message_value) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.session_id[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.next_sequence_number[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.count[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Request Message set to where it lies, so a field read out of place says so */
inline ramp_replay_request_message(replay_request_message_record, replay_request_message_base) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.session_id[replay_request_message_at] = (replay_request_message_base + 0 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.next_sequence_number[replay_request_message_at] = (replay_request_message_base + 8 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.count[replay_request_message_at] = (replay_request_message_base + 16 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_replay_request_message(replay_request_message_record) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> wire[at] = replay_request_message_record.session_id[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> wire[at] = replay_request_message_record.next_sequence_number[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> wire[at] = replay_request_message_record.count[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_replay_request_message(replay_request_message_record) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.session_id[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.next_sequence_number[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.count[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Request Message is what was written, byte for byte */
inline equal_replay_request_message(replay_request_message_read, replay_request_message_written) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> assert(replay_request_message_read.session_id[replay_request_message_at] == replay_request_message_written.session_id[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> assert(replay_request_message_read.next_sequence_number[replay_request_message_at] == replay_request_message_written.next_sequence_number[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> assert(replay_request_message_read.count[replay_request_message_at] == replay_request_message_written.count[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay All Request Message: 8 bytes ------------------------------------- */

/* Memx Tcp Replay All Request message */
typedef ReplayAllRequestMessage {
  byte session_id[8]
};

int replay_all_request_message_at;

/* every byte of Replay All Request Message set to one value */
inline fill_replay_all_request_message(replay_all_request_message_record, replay_all_request_message_value) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> replay_all_request_message_record.session_id[replay_all_request_message_at] = replay_all_request_message_value; replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay All Request Message set to where it lies, so a field read out of place says so */
inline ramp_replay_all_request_message(replay_all_request_message_record, replay_all_request_message_base) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> replay_all_request_message_record.session_id[replay_all_request_message_at] = (replay_all_request_message_base + 0 + replay_all_request_message_at + 1) % 256; replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay All Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_replay_all_request_message(replay_all_request_message_record) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> wire[at] = replay_all_request_message_record.session_id[replay_all_request_message_at]; at = at + 1; replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay All Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_replay_all_request_message(replay_all_request_message_record) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> replay_all_request_message_record.session_id[replay_all_request_message_at] = wire[at]; at = at + 1; replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay All Request Message is what was written, byte for byte */
inline equal_replay_all_request_message(replay_all_request_message_read, replay_all_request_message_written) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> assert(replay_all_request_message_read.session_id[replay_all_request_message_at] == replay_all_request_message_written.session_id[replay_all_request_message_at]); replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stream Request Message: 16 bytes ---------------------------------------- */

/* Memx Tcp Stream Request message */
typedef StreamRequestMessage {
  byte session_id[8];
  byte next_sequence_number[8]
};

int stream_request_message_at;

/* every byte of Stream Request Message set to one value */
inline fill_stream_request_message(stream_request_message_record, stream_request_message_value) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.session_id[stream_request_message_at] = stream_request_message_value; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.next_sequence_number[stream_request_message_at] = stream_request_message_value; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stream Request Message set to where it lies, so a field read out of place says so */
inline ramp_stream_request_message(stream_request_message_record, stream_request_message_base) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.session_id[stream_request_message_at] = (stream_request_message_base + 0 + stream_request_message_at + 1) % 256; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.next_sequence_number[stream_request_message_at] = (stream_request_message_base + 8 + stream_request_message_at + 1) % 256; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Request Message to the wire, 16 bytes from where the cursor stands */
inline encode_stream_request_message(stream_request_message_record) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> wire[at] = stream_request_message_record.session_id[stream_request_message_at]; at = at + 1; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> wire[at] = stream_request_message_record.next_sequence_number[stream_request_message_at]; at = at + 1; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Request Message off the wire, 16 bytes from where the cursor stands */
inline decode_stream_request_message(stream_request_message_record) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.session_id[stream_request_message_at] = wire[at]; at = at + 1; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.next_sequence_number[stream_request_message_at] = wire[at]; at = at + 1; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stream Request Message is what was written, byte for byte */
inline equal_stream_request_message(stream_request_message_read, stream_request_message_written) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> assert(stream_request_message_read.session_id[stream_request_message_at] == stream_request_message_written.session_id[stream_request_message_at]); stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> assert(stream_request_message_read.next_sequence_number[stream_request_message_at] == stream_request_message_written.next_sequence_number[stream_request_message_at]); stream_request_message_at = stream_request_message_at + 1
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

/* ---- Order Cancel Replace Request Message: 71 bytes -------------------------- */

/* OrderCancelReplaceRequestMessage */
typedef OrderCancelReplaceRequestMessage {
  byte orig_cl_ord_id[16];
  byte cl_ord_id[16];
  byte symbol[6];
  byte symbol_sfx[6];
  byte side;
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte display_qty[4];
  byte locate_reqd;
  byte link_id_optional[4];
  byte locate_broker_optional[4]
};

int order_cancel_replace_request_message_at;

/* every byte of Order Cancel Replace Request Message set to one value */
inline fill_order_cancel_replace_request_message(order_cancel_replace_request_message_record, order_cancel_replace_request_message_value) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.orig_cl_ord_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.cl_ord_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> order_cancel_replace_request_message_record.symbol[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> order_cancel_replace_request_message_record.symbol_sfx[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.side = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.order_qty[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.ord_type = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.price[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.display_qty[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.locate_reqd = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.link_id_optional[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.locate_broker_optional[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Replace Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_replace_request_message(order_cancel_replace_request_message_record, order_cancel_replace_request_message_base) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.orig_cl_ord_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 0 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.cl_ord_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 16 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> order_cancel_replace_request_message_record.symbol[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 32 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> order_cancel_replace_request_message_record.symbol_sfx[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 38 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.side = (order_cancel_replace_request_message_base + 44 + 1) % 256;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.order_qty[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 45 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.ord_type = (order_cancel_replace_request_message_base + 49 + 1) % 256;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.price[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 50 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.display_qty[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 58 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.locate_reqd = (order_cancel_replace_request_message_base + 62 + 1) % 256;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.link_id_optional[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 63 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.locate_broker_optional[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 67 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Replace Request Message to the wire, 71 bytes from where the cursor stands */
inline encode_order_cancel_replace_request_message(order_cancel_replace_request_message_record) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> wire[at] = order_cancel_replace_request_message_record.orig_cl_ord_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> wire[at] = order_cancel_replace_request_message_record.cl_ord_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> wire[at] = order_cancel_replace_request_message_record.symbol[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> wire[at] = order_cancel_replace_request_message_record.symbol_sfx[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_replace_request_message_record.side; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.order_qty[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_replace_request_message_record.ord_type; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> wire[at] = order_cancel_replace_request_message_record.price[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.display_qty[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_replace_request_message_record.locate_reqd; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.link_id_optional[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.locate_broker_optional[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Replace Request Message off the wire, 71 bytes from where the cursor stands */
inline decode_order_cancel_replace_request_message(order_cancel_replace_request_message_record) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.orig_cl_ord_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.cl_ord_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> order_cancel_replace_request_message_record.symbol[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> order_cancel_replace_request_message_record.symbol_sfx[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.side = wire[at]; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.order_qty[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.ord_type = wire[at]; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.price[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.display_qty[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.locate_reqd = wire[at]; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.link_id_optional[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.locate_broker_optional[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Replace Request Message is what was written, byte for byte */
inline equal_order_cancel_replace_request_message(order_cancel_replace_request_message_read, order_cancel_replace_request_message_written) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> assert(order_cancel_replace_request_message_read.orig_cl_ord_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.orig_cl_ord_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> assert(order_cancel_replace_request_message_read.cl_ord_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.cl_ord_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> assert(order_cancel_replace_request_message_read.symbol[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.symbol[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 6 -> assert(order_cancel_replace_request_message_read.symbol_sfx[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.symbol_sfx[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_replace_request_message_read.side == order_cancel_replace_request_message_written.side);
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.order_qty[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.order_qty[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_replace_request_message_read.ord_type == order_cancel_replace_request_message_written.ord_type);
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> assert(order_cancel_replace_request_message_read.price[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.price[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.display_qty[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.display_qty[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_replace_request_message_read.locate_reqd == order_cancel_replace_request_message_written.locate_reqd);
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.link_id_optional[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.link_id_optional[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.locate_broker_optional[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.locate_broker_optional[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Request Message: 52 bytes ---------------------------------- */

/* OrderCancelRequestMessage */
typedef OrderCancelRequestMessage {
  byte orig_cl_ord_id_optional[16];
  byte order_id_optional[8];
  byte cl_ord_id[16];
  byte symbol[6];
  byte symbol_sfx[6]
};

int order_cancel_request_message_at;

/* every byte of Order Cancel Request Message set to one value */
inline fill_order_cancel_request_message(order_cancel_request_message_record, order_cancel_request_message_value) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> order_cancel_request_message_record.orig_cl_ord_id_optional[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> order_cancel_request_message_record.order_id_optional[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> order_cancel_request_message_record.cl_ord_id[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> order_cancel_request_message_record.symbol[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> order_cancel_request_message_record.symbol_sfx[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_request_message(order_cancel_request_message_record, order_cancel_request_message_base) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> order_cancel_request_message_record.orig_cl_ord_id_optional[order_cancel_request_message_at] = (order_cancel_request_message_base + 0 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> order_cancel_request_message_record.order_id_optional[order_cancel_request_message_at] = (order_cancel_request_message_base + 16 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> order_cancel_request_message_record.cl_ord_id[order_cancel_request_message_at] = (order_cancel_request_message_base + 24 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> order_cancel_request_message_record.symbol[order_cancel_request_message_at] = (order_cancel_request_message_base + 40 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> order_cancel_request_message_record.symbol_sfx[order_cancel_request_message_at] = (order_cancel_request_message_base + 46 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Request Message to the wire, 52 bytes from where the cursor stands */
inline encode_order_cancel_request_message(order_cancel_request_message_record) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> wire[at] = order_cancel_request_message_record.orig_cl_ord_id_optional[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> wire[at] = order_cancel_request_message_record.order_id_optional[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> wire[at] = order_cancel_request_message_record.cl_ord_id[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> wire[at] = order_cancel_request_message_record.symbol[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> wire[at] = order_cancel_request_message_record.symbol_sfx[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Request Message off the wire, 52 bytes from where the cursor stands */
inline decode_order_cancel_request_message(order_cancel_request_message_record) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> order_cancel_request_message_record.orig_cl_ord_id_optional[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> order_cancel_request_message_record.order_id_optional[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> order_cancel_request_message_record.cl_ord_id[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> order_cancel_request_message_record.symbol[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> order_cancel_request_message_record.symbol_sfx[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Request Message is what was written, byte for byte */
inline equal_order_cancel_request_message(order_cancel_request_message_read, order_cancel_request_message_written) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> assert(order_cancel_request_message_read.orig_cl_ord_id_optional[order_cancel_request_message_at] == order_cancel_request_message_written.orig_cl_ord_id_optional[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> assert(order_cancel_request_message_read.order_id_optional[order_cancel_request_message_at] == order_cancel_request_message_written.order_id_optional[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 16 -> assert(order_cancel_request_message_read.cl_ord_id[order_cancel_request_message_at] == order_cancel_request_message_written.cl_ord_id[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> assert(order_cancel_request_message_read.symbol[order_cancel_request_message_at] == order_cancel_request_message_written.symbol[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 6 -> assert(order_cancel_request_message_read.symbol_sfx[order_cancel_request_message_at] == order_cancel_request_message_written.symbol_sfx[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Request Message: 47 bytes ----------------------------------- */

/* MassCancelRequestMessage */
typedef MassCancelRequestMessage {
  byte cl_ord_id[16];
  byte symbol[6];
  byte symbol_sfx[6];
  byte side_optional;
  byte lower_than_price[8];
  byte higher_than_price[8];
  byte cancel_group_id[2]
};

int mass_cancel_request_message_at;

/* every byte of Mass Cancel Request Message set to one value */
inline fill_mass_cancel_request_message(mass_cancel_request_message_record, mass_cancel_request_message_value) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 16 -> mass_cancel_request_message_record.cl_ord_id[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> mass_cancel_request_message_record.symbol[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> mass_cancel_request_message_record.symbol_sfx[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.side_optional = mass_cancel_request_message_value;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.lower_than_price[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.higher_than_price[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 2 -> mass_cancel_request_message_record.cancel_group_id[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_request_message(mass_cancel_request_message_record, mass_cancel_request_message_base) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 16 -> mass_cancel_request_message_record.cl_ord_id[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 0 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> mass_cancel_request_message_record.symbol[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 16 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> mass_cancel_request_message_record.symbol_sfx[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 22 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.side_optional = (mass_cancel_request_message_base + 28 + 1) % 256;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.lower_than_price[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 29 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.higher_than_price[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 37 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 2 -> mass_cancel_request_message_record.cancel_group_id[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 45 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Request Message to the wire, 47 bytes from where the cursor stands */
inline encode_mass_cancel_request_message(mass_cancel_request_message_record) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 16 -> wire[at] = mass_cancel_request_message_record.cl_ord_id[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> wire[at] = mass_cancel_request_message_record.symbol[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> wire[at] = mass_cancel_request_message_record.symbol_sfx[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_request_message_record.side_optional; at = at + 1;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> wire[at] = mass_cancel_request_message_record.lower_than_price[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> wire[at] = mass_cancel_request_message_record.higher_than_price[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 2 -> wire[at] = mass_cancel_request_message_record.cancel_group_id[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Request Message off the wire, 47 bytes from where the cursor stands */
inline decode_mass_cancel_request_message(mass_cancel_request_message_record) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 16 -> mass_cancel_request_message_record.cl_ord_id[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> mass_cancel_request_message_record.symbol[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> mass_cancel_request_message_record.symbol_sfx[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.side_optional = wire[at]; at = at + 1;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.lower_than_price[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.higher_than_price[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 2 -> mass_cancel_request_message_record.cancel_group_id[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Request Message is what was written, byte for byte */
inline equal_mass_cancel_request_message(mass_cancel_request_message_read, mass_cancel_request_message_written) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 16 -> assert(mass_cancel_request_message_read.cl_ord_id[mass_cancel_request_message_at] == mass_cancel_request_message_written.cl_ord_id[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> assert(mass_cancel_request_message_read.symbol[mass_cancel_request_message_at] == mass_cancel_request_message_written.symbol[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 6 -> assert(mass_cancel_request_message_read.symbol_sfx[mass_cancel_request_message_at] == mass_cancel_request_message_written.symbol_sfx[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_request_message_read.side_optional == mass_cancel_request_message_written.side_optional);
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> assert(mass_cancel_request_message_read.lower_than_price[mass_cancel_request_message_at] == mass_cancel_request_message_written.lower_than_price[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> assert(mass_cancel_request_message_read.higher_than_price[mass_cancel_request_message_at] == mass_cancel_request_message_written.higher_than_price[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 2 -> assert(mass_cancel_request_message_read.cancel_group_id[mass_cancel_request_message_at] == mass_cancel_request_message_written.cancel_group_id[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
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
    assert(at == 3);
    at = 0;
    decode_common_header(common_header_got);
    assert(at == 3);
    equal_common_header(common_header_got, common_header_sent)
  }
}

/* Login Request Message: encoded, read back, and compared */
proctype check_login_request_message() {
  LoginRequestMessage login_request_message_sent;
  LoginRequestMessage login_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request_message(login_request_message_sent, 0)
  :: pattern == 1 -> fill_login_request_message(login_request_message_sent, 32)
  :: pattern == 2 -> fill_login_request_message(login_request_message_sent, 255)
  :: else -> ramp_login_request_message(login_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request_message(login_request_message_sent);
    assert(at == 2);
    at = 0;
    decode_login_request_message(login_request_message_got);
    assert(at == 2);
    equal_login_request_message(login_request_message_got, login_request_message_sent)
  }
}

/* Replay Request Message: encoded, read back, and compared */
proctype check_replay_request_message() {
  ReplayRequestMessage replay_request_message_sent;
  ReplayRequestMessage replay_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_request_message(replay_request_message_sent, 0)
  :: pattern == 1 -> fill_replay_request_message(replay_request_message_sent, 32)
  :: pattern == 2 -> fill_replay_request_message(replay_request_message_sent, 255)
  :: else -> ramp_replay_request_message(replay_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_request_message(replay_request_message_sent);
    assert(at == 20);
    at = 0;
    decode_replay_request_message(replay_request_message_got);
    assert(at == 20);
    equal_replay_request_message(replay_request_message_got, replay_request_message_sent)
  }
}

/* Replay All Request Message: encoded, read back, and compared */
proctype check_replay_all_request_message() {
  ReplayAllRequestMessage replay_all_request_message_sent;
  ReplayAllRequestMessage replay_all_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_all_request_message(replay_all_request_message_sent, 0)
  :: pattern == 1 -> fill_replay_all_request_message(replay_all_request_message_sent, 32)
  :: pattern == 2 -> fill_replay_all_request_message(replay_all_request_message_sent, 255)
  :: else -> ramp_replay_all_request_message(replay_all_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_all_request_message(replay_all_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_replay_all_request_message(replay_all_request_message_got);
    assert(at == 8);
    equal_replay_all_request_message(replay_all_request_message_got, replay_all_request_message_sent)
  }
}

/* Stream Request Message: encoded, read back, and compared */
proctype check_stream_request_message() {
  StreamRequestMessage stream_request_message_sent;
  StreamRequestMessage stream_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_request_message(stream_request_message_sent, 0)
  :: pattern == 1 -> fill_stream_request_message(stream_request_message_sent, 32)
  :: pattern == 2 -> fill_stream_request_message(stream_request_message_sent, 255)
  :: else -> ramp_stream_request_message(stream_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_request_message(stream_request_message_sent);
    assert(at == 16);
    at = 0;
    decode_stream_request_message(stream_request_message_got);
    assert(at == 16);
    equal_stream_request_message(stream_request_message_got, stream_request_message_sent)
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

/* Order Cancel Replace Request Message: encoded, read back, and compared */
proctype check_order_cancel_replace_request_message() {
  OrderCancelReplaceRequestMessage order_cancel_replace_request_message_sent;
  OrderCancelReplaceRequestMessage order_cancel_replace_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 255)
  :: else -> ramp_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_replace_request_message(order_cancel_replace_request_message_sent);
    assert(at == 71);
    at = 0;
    decode_order_cancel_replace_request_message(order_cancel_replace_request_message_got);
    assert(at == 71);
    equal_order_cancel_replace_request_message(order_cancel_replace_request_message_got, order_cancel_replace_request_message_sent)
  }
}

/* Order Cancel Request Message: encoded, read back, and compared */
proctype check_order_cancel_request_message() {
  OrderCancelRequestMessage order_cancel_request_message_sent;
  OrderCancelRequestMessage order_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_request_message(order_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_request_message(order_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_request_message(order_cancel_request_message_sent, 255)
  :: else -> ramp_order_cancel_request_message(order_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_request_message(order_cancel_request_message_sent);
    assert(at == 52);
    at = 0;
    decode_order_cancel_request_message(order_cancel_request_message_got);
    assert(at == 52);
    equal_order_cancel_request_message(order_cancel_request_message_got, order_cancel_request_message_sent)
  }
}

/* Mass Cancel Request Message: encoded, read back, and compared */
proctype check_mass_cancel_request_message() {
  MassCancelRequestMessage mass_cancel_request_message_sent;
  MassCancelRequestMessage mass_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 255)
  :: else -> ramp_mass_cancel_request_message(mass_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_request_message(mass_cancel_request_message_sent);
    assert(at == 47);
    at = 0;
    decode_mass_cancel_request_message(mass_cancel_request_message_got);
    assert(at == 47);
    equal_mass_cancel_request_message(mass_cancel_request_message_got, mass_cancel_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_common_header()
  :: run check_login_request_message()
  :: run check_replay_request_message()
  :: run check_replay_all_request_message()
  :: run check_stream_request_message()
  :: run check_sbe_header()
  :: run check_order_cancel_replace_request_message()
  :: run check_order_cancel_request_message()
  :: run check_mass_cancel_request_message()
  fi
}
