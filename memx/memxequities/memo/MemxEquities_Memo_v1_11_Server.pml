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
#define WIRE 108

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

/* ---- Login Accepted Message: 1 bytes ----------------------------------------- */

/* Memx Tcp Login Accepted Message */
typedef LoginAcceptedMessage {
  byte supported_request_mode
};

/* every byte of Login Accepted Message set to one value */
inline fill_login_accepted_message(login_accepted_message_record, login_accepted_message_value) {
  login_accepted_message_record.supported_request_mode = login_accepted_message_value;
  skip
}

/* each byte of Login Accepted Message set to where it lies, so a field read out of place says so */
inline ramp_login_accepted_message(login_accepted_message_record, login_accepted_message_base) {
  login_accepted_message_record.supported_request_mode = (login_accepted_message_base + 0 + 1) % 256;
  skip
}

/* Login Accepted Message to the wire, 1 bytes from where the cursor stands */
inline encode_login_accepted_message(login_accepted_message_record) {
  wire[at] = login_accepted_message_record.supported_request_mode; at = at + 1;
  skip
}

/* Login Accepted Message off the wire, 1 bytes from where the cursor stands */
inline decode_login_accepted_message(login_accepted_message_record) {
  login_accepted_message_record.supported_request_mode = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Accepted Message is what was written, byte for byte */
inline equal_login_accepted_message(login_accepted_message_read, login_accepted_message_written) {
  assert(login_accepted_message_read.supported_request_mode == login_accepted_message_written.supported_request_mode);
  skip
}

/* ---- Login Rejected Message: 1 bytes ----------------------------------------- */

/* Memx Tcp Login Rejected Message */
typedef LoginRejectedMessage {
  byte login_reject_code
};

/* every byte of Login Rejected Message set to one value */
inline fill_login_rejected_message(login_rejected_message_record, login_rejected_message_value) {
  login_rejected_message_record.login_reject_code = login_rejected_message_value;
  skip
}

/* each byte of Login Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_login_rejected_message(login_rejected_message_record, login_rejected_message_base) {
  login_rejected_message_record.login_reject_code = (login_rejected_message_base + 0 + 1) % 256;
  skip
}

/* Login Rejected Message to the wire, 1 bytes from where the cursor stands */
inline encode_login_rejected_message(login_rejected_message_record) {
  wire[at] = login_rejected_message_record.login_reject_code; at = at + 1;
  skip
}

/* Login Rejected Message off the wire, 1 bytes from where the cursor stands */
inline decode_login_rejected_message(login_rejected_message_record) {
  login_rejected_message_record.login_reject_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Rejected Message is what was written, byte for byte */
inline equal_login_rejected_message(login_rejected_message_read, login_rejected_message_written) {
  assert(login_rejected_message_read.login_reject_code == login_rejected_message_written.login_reject_code);
  skip
}

/* ---- Start Of Session Message: 8 bytes --------------------------------------- */

/* Memx Tcp Start of Session Message */
typedef StartOfSessionMessage {
  byte session_id[8]
};

int start_of_session_message_at;

/* every byte of Start Of Session Message set to one value */
inline fill_start_of_session_message(start_of_session_message_record, start_of_session_message_value) {
  start_of_session_message_at = 0;
  do
  :: start_of_session_message_at < 8 -> start_of_session_message_record.session_id[start_of_session_message_at] = start_of_session_message_value; start_of_session_message_at = start_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Session Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_session_message(start_of_session_message_record, start_of_session_message_base) {
  start_of_session_message_at = 0;
  do
  :: start_of_session_message_at < 8 -> start_of_session_message_record.session_id[start_of_session_message_at] = (start_of_session_message_base + 0 + start_of_session_message_at + 1) % 256; start_of_session_message_at = start_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Session Message to the wire, 8 bytes from where the cursor stands */
inline encode_start_of_session_message(start_of_session_message_record) {
  start_of_session_message_at = 0;
  do
  :: start_of_session_message_at < 8 -> wire[at] = start_of_session_message_record.session_id[start_of_session_message_at]; at = at + 1; start_of_session_message_at = start_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Session Message off the wire, 8 bytes from where the cursor stands */
inline decode_start_of_session_message(start_of_session_message_record) {
  start_of_session_message_at = 0;
  do
  :: start_of_session_message_at < 8 -> start_of_session_message_record.session_id[start_of_session_message_at] = wire[at]; at = at + 1; start_of_session_message_at = start_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Session Message is what was written, byte for byte */
inline equal_start_of_session_message(start_of_session_message_read, start_of_session_message_written) {
  start_of_session_message_at = 0;
  do
  :: start_of_session_message_at < 8 -> assert(start_of_session_message_read.session_id[start_of_session_message_at] == start_of_session_message_written.session_id[start_of_session_message_at]); start_of_session_message_at = start_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay Begin Message: 12 bytes ------------------------------------------ */

/* Memx Tcp Replay Begin Message */
typedef ReplayBeginMessage {
  byte next_sequence_number[8];
  byte pending_message_count[4]
};

int replay_begin_message_at;

/* every byte of Replay Begin Message set to one value */
inline fill_replay_begin_message(replay_begin_message_record, replay_begin_message_value) {
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 8 -> replay_begin_message_record.next_sequence_number[replay_begin_message_at] = replay_begin_message_value; replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 4 -> replay_begin_message_record.pending_message_count[replay_begin_message_at] = replay_begin_message_value; replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Begin Message set to where it lies, so a field read out of place says so */
inline ramp_replay_begin_message(replay_begin_message_record, replay_begin_message_base) {
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 8 -> replay_begin_message_record.next_sequence_number[replay_begin_message_at] = (replay_begin_message_base + 0 + replay_begin_message_at + 1) % 256; replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 4 -> replay_begin_message_record.pending_message_count[replay_begin_message_at] = (replay_begin_message_base + 8 + replay_begin_message_at + 1) % 256; replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Begin Message to the wire, 12 bytes from where the cursor stands */
inline encode_replay_begin_message(replay_begin_message_record) {
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 8 -> wire[at] = replay_begin_message_record.next_sequence_number[replay_begin_message_at]; at = at + 1; replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 4 -> wire[at] = replay_begin_message_record.pending_message_count[replay_begin_message_at]; at = at + 1; replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Begin Message off the wire, 12 bytes from where the cursor stands */
inline decode_replay_begin_message(replay_begin_message_record) {
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 8 -> replay_begin_message_record.next_sequence_number[replay_begin_message_at] = wire[at]; at = at + 1; replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 4 -> replay_begin_message_record.pending_message_count[replay_begin_message_at] = wire[at]; at = at + 1; replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Begin Message is what was written, byte for byte */
inline equal_replay_begin_message(replay_begin_message_read, replay_begin_message_written) {
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 8 -> assert(replay_begin_message_read.next_sequence_number[replay_begin_message_at] == replay_begin_message_written.next_sequence_number[replay_begin_message_at]); replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  replay_begin_message_at = 0;
  do
  :: replay_begin_message_at < 4 -> assert(replay_begin_message_read.pending_message_count[replay_begin_message_at] == replay_begin_message_written.pending_message_count[replay_begin_message_at]); replay_begin_message_at = replay_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay Rejected Message: 1 bytes ---------------------------------------- */

/* Memx Tcp Replay Rejected Message */
typedef ReplayRejectedMessage {
  byte replay_reject_code
};

/* every byte of Replay Rejected Message set to one value */
inline fill_replay_rejected_message(replay_rejected_message_record, replay_rejected_message_value) {
  replay_rejected_message_record.replay_reject_code = replay_rejected_message_value;
  skip
}

/* each byte of Replay Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_replay_rejected_message(replay_rejected_message_record, replay_rejected_message_base) {
  replay_rejected_message_record.replay_reject_code = (replay_rejected_message_base + 0 + 1) % 256;
  skip
}

/* Replay Rejected Message to the wire, 1 bytes from where the cursor stands */
inline encode_replay_rejected_message(replay_rejected_message_record) {
  wire[at] = replay_rejected_message_record.replay_reject_code; at = at + 1;
  skip
}

/* Replay Rejected Message off the wire, 1 bytes from where the cursor stands */
inline decode_replay_rejected_message(replay_rejected_message_record) {
  replay_rejected_message_record.replay_reject_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Replay Rejected Message is what was written, byte for byte */
inline equal_replay_rejected_message(replay_rejected_message_read, replay_rejected_message_written) {
  assert(replay_rejected_message_read.replay_reject_code == replay_rejected_message_written.replay_reject_code);
  skip
}

/* ---- Replay Complete Message: 8 bytes ---------------------------------------- */

/* Memx Tcp Replay Complete Message */
typedef ReplayCompleteMessage {
  byte message_count[8]
};

int replay_complete_message_at;

/* every byte of Replay Complete Message set to one value */
inline fill_replay_complete_message(replay_complete_message_record, replay_complete_message_value) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 8 -> replay_complete_message_record.message_count[replay_complete_message_at] = replay_complete_message_value; replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Complete Message set to where it lies, so a field read out of place says so */
inline ramp_replay_complete_message(replay_complete_message_record, replay_complete_message_base) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 8 -> replay_complete_message_record.message_count[replay_complete_message_at] = (replay_complete_message_base + 0 + replay_complete_message_at + 1) % 256; replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Complete Message to the wire, 8 bytes from where the cursor stands */
inline encode_replay_complete_message(replay_complete_message_record) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 8 -> wire[at] = replay_complete_message_record.message_count[replay_complete_message_at]; at = at + 1; replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Complete Message off the wire, 8 bytes from where the cursor stands */
inline decode_replay_complete_message(replay_complete_message_record) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 8 -> replay_complete_message_record.message_count[replay_complete_message_at] = wire[at]; at = at + 1; replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Complete Message is what was written, byte for byte */
inline equal_replay_complete_message(replay_complete_message_read, replay_complete_message_written) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 8 -> assert(replay_complete_message_read.message_count[replay_complete_message_at] == replay_complete_message_written.message_count[replay_complete_message_at]); replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stream Begin Message: 16 bytes ------------------------------------------ */

/* Memx Tcp Stream Begin Message */
typedef StreamBeginMessage {
  byte next_sequence_number[8];
  byte max_sequence_number[8]
};

int stream_begin_message_at;

/* every byte of Stream Begin Message set to one value */
inline fill_stream_begin_message(stream_begin_message_record, stream_begin_message_value) {
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> stream_begin_message_record.next_sequence_number[stream_begin_message_at] = stream_begin_message_value; stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> stream_begin_message_record.max_sequence_number[stream_begin_message_at] = stream_begin_message_value; stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stream Begin Message set to where it lies, so a field read out of place says so */
inline ramp_stream_begin_message(stream_begin_message_record, stream_begin_message_base) {
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> stream_begin_message_record.next_sequence_number[stream_begin_message_at] = (stream_begin_message_base + 0 + stream_begin_message_at + 1) % 256; stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> stream_begin_message_record.max_sequence_number[stream_begin_message_at] = (stream_begin_message_base + 8 + stream_begin_message_at + 1) % 256; stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Begin Message to the wire, 16 bytes from where the cursor stands */
inline encode_stream_begin_message(stream_begin_message_record) {
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> wire[at] = stream_begin_message_record.next_sequence_number[stream_begin_message_at]; at = at + 1; stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> wire[at] = stream_begin_message_record.max_sequence_number[stream_begin_message_at]; at = at + 1; stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Begin Message off the wire, 16 bytes from where the cursor stands */
inline decode_stream_begin_message(stream_begin_message_record) {
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> stream_begin_message_record.next_sequence_number[stream_begin_message_at] = wire[at]; at = at + 1; stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> stream_begin_message_record.max_sequence_number[stream_begin_message_at] = wire[at]; at = at + 1; stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stream Begin Message is what was written, byte for byte */
inline equal_stream_begin_message(stream_begin_message_read, stream_begin_message_written) {
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> assert(stream_begin_message_read.next_sequence_number[stream_begin_message_at] == stream_begin_message_written.next_sequence_number[stream_begin_message_at]); stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  stream_begin_message_at = 0;
  do
  :: stream_begin_message_at < 8 -> assert(stream_begin_message_read.max_sequence_number[stream_begin_message_at] == stream_begin_message_written.max_sequence_number[stream_begin_message_at]); stream_begin_message_at = stream_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stream Rejected Message: 1 bytes ---------------------------------------- */

/* Memx Tcp Stream Rejected Message */
typedef StreamRejectedMessage {
  byte stream_reject_code
};

/* every byte of Stream Rejected Message set to one value */
inline fill_stream_rejected_message(stream_rejected_message_record, stream_rejected_message_value) {
  stream_rejected_message_record.stream_reject_code = stream_rejected_message_value;
  skip
}

/* each byte of Stream Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_stream_rejected_message(stream_rejected_message_record, stream_rejected_message_base) {
  stream_rejected_message_record.stream_reject_code = (stream_rejected_message_base + 0 + 1) % 256;
  skip
}

/* Stream Rejected Message to the wire, 1 bytes from where the cursor stands */
inline encode_stream_rejected_message(stream_rejected_message_record) {
  wire[at] = stream_rejected_message_record.stream_reject_code; at = at + 1;
  skip
}

/* Stream Rejected Message off the wire, 1 bytes from where the cursor stands */
inline decode_stream_rejected_message(stream_rejected_message_record) {
  stream_rejected_message_record.stream_reject_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Stream Rejected Message is what was written, byte for byte */
inline equal_stream_rejected_message(stream_rejected_message_read, stream_rejected_message_written) {
  assert(stream_rejected_message_read.stream_reject_code == stream_rejected_message_written.stream_reject_code);
  skip
}

/* ---- Stream Complete Message: 8 bytes ---------------------------------------- */

/* Memx Tcp Stream Complete Message */
typedef StreamCompleteMessage {
  byte total_sequence_count[8]
};

int stream_complete_message_at;

/* every byte of Stream Complete Message set to one value */
inline fill_stream_complete_message(stream_complete_message_record, stream_complete_message_value) {
  stream_complete_message_at = 0;
  do
  :: stream_complete_message_at < 8 -> stream_complete_message_record.total_sequence_count[stream_complete_message_at] = stream_complete_message_value; stream_complete_message_at = stream_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stream Complete Message set to where it lies, so a field read out of place says so */
inline ramp_stream_complete_message(stream_complete_message_record, stream_complete_message_base) {
  stream_complete_message_at = 0;
  do
  :: stream_complete_message_at < 8 -> stream_complete_message_record.total_sequence_count[stream_complete_message_at] = (stream_complete_message_base + 0 + stream_complete_message_at + 1) % 256; stream_complete_message_at = stream_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Complete Message to the wire, 8 bytes from where the cursor stands */
inline encode_stream_complete_message(stream_complete_message_record) {
  stream_complete_message_at = 0;
  do
  :: stream_complete_message_at < 8 -> wire[at] = stream_complete_message_record.total_sequence_count[stream_complete_message_at]; at = at + 1; stream_complete_message_at = stream_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Complete Message off the wire, 8 bytes from where the cursor stands */
inline decode_stream_complete_message(stream_complete_message_record) {
  stream_complete_message_at = 0;
  do
  :: stream_complete_message_at < 8 -> stream_complete_message_record.total_sequence_count[stream_complete_message_at] = wire[at]; at = at + 1; stream_complete_message_at = stream_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stream Complete Message is what was written, byte for byte */
inline equal_stream_complete_message(stream_complete_message_read, stream_complete_message_written) {
  stream_complete_message_at = 0;
  do
  :: stream_complete_message_at < 8 -> assert(stream_complete_message_read.total_sequence_count[stream_complete_message_at] == stream_complete_message_written.total_sequence_count[stream_complete_message_at]); stream_complete_message_at = stream_complete_message_at + 1
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

/* ---- Execution Report Rejected Message: 58 bytes ----------------------------- */

/* ExecutionReport_RejectedMessage */
typedef ExecutionReportRejectedMessage {
  byte sending_time[8];
  byte cl_ord_id[16];
  byte exec_id[8];
  byte ord_status;
  byte symbol[6];
  byte symbol_sfx[6];
  byte leaves_qty[4];
  byte cum_qty[4];
  byte order_reject_reason;
  byte link_id_optional[4]
};

int execution_report_rejected_message_at;

/* every byte of Execution Report Rejected Message set to one value */
inline fill_execution_report_rejected_message(execution_report_rejected_message_record, execution_report_rejected_message_value) {
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> execution_report_rejected_message_record.sending_time[execution_report_rejected_message_at] = execution_report_rejected_message_value; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 16 -> execution_report_rejected_message_record.cl_ord_id[execution_report_rejected_message_at] = execution_report_rejected_message_value; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> execution_report_rejected_message_record.exec_id[execution_report_rejected_message_at] = execution_report_rejected_message_value; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_record.ord_status = execution_report_rejected_message_value;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> execution_report_rejected_message_record.symbol[execution_report_rejected_message_at] = execution_report_rejected_message_value; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> execution_report_rejected_message_record.symbol_sfx[execution_report_rejected_message_at] = execution_report_rejected_message_value; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> execution_report_rejected_message_record.leaves_qty[execution_report_rejected_message_at] = execution_report_rejected_message_value; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> execution_report_rejected_message_record.cum_qty[execution_report_rejected_message_at] = execution_report_rejected_message_value; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_record.order_reject_reason = execution_report_rejected_message_value;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> execution_report_rejected_message_record.link_id_optional[execution_report_rejected_message_at] = execution_report_rejected_message_value; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_rejected_message(execution_report_rejected_message_record, execution_report_rejected_message_base) {
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> execution_report_rejected_message_record.sending_time[execution_report_rejected_message_at] = (execution_report_rejected_message_base + 0 + execution_report_rejected_message_at + 1) % 256; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 16 -> execution_report_rejected_message_record.cl_ord_id[execution_report_rejected_message_at] = (execution_report_rejected_message_base + 8 + execution_report_rejected_message_at + 1) % 256; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> execution_report_rejected_message_record.exec_id[execution_report_rejected_message_at] = (execution_report_rejected_message_base + 24 + execution_report_rejected_message_at + 1) % 256; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_record.ord_status = (execution_report_rejected_message_base + 32 + 1) % 256;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> execution_report_rejected_message_record.symbol[execution_report_rejected_message_at] = (execution_report_rejected_message_base + 33 + execution_report_rejected_message_at + 1) % 256; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> execution_report_rejected_message_record.symbol_sfx[execution_report_rejected_message_at] = (execution_report_rejected_message_base + 39 + execution_report_rejected_message_at + 1) % 256; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> execution_report_rejected_message_record.leaves_qty[execution_report_rejected_message_at] = (execution_report_rejected_message_base + 45 + execution_report_rejected_message_at + 1) % 256; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> execution_report_rejected_message_record.cum_qty[execution_report_rejected_message_at] = (execution_report_rejected_message_base + 49 + execution_report_rejected_message_at + 1) % 256; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_record.order_reject_reason = (execution_report_rejected_message_base + 53 + 1) % 256;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> execution_report_rejected_message_record.link_id_optional[execution_report_rejected_message_at] = (execution_report_rejected_message_base + 54 + execution_report_rejected_message_at + 1) % 256; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Rejected Message to the wire, 58 bytes from where the cursor stands */
inline encode_execution_report_rejected_message(execution_report_rejected_message_record) {
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> wire[at] = execution_report_rejected_message_record.sending_time[execution_report_rejected_message_at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 16 -> wire[at] = execution_report_rejected_message_record.cl_ord_id[execution_report_rejected_message_at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> wire[at] = execution_report_rejected_message_record.exec_id[execution_report_rejected_message_at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_rejected_message_record.ord_status; at = at + 1;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> wire[at] = execution_report_rejected_message_record.symbol[execution_report_rejected_message_at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> wire[at] = execution_report_rejected_message_record.symbol_sfx[execution_report_rejected_message_at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> wire[at] = execution_report_rejected_message_record.leaves_qty[execution_report_rejected_message_at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> wire[at] = execution_report_rejected_message_record.cum_qty[execution_report_rejected_message_at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_rejected_message_record.order_reject_reason; at = at + 1;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> wire[at] = execution_report_rejected_message_record.link_id_optional[execution_report_rejected_message_at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Rejected Message off the wire, 58 bytes from where the cursor stands */
inline decode_execution_report_rejected_message(execution_report_rejected_message_record) {
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> execution_report_rejected_message_record.sending_time[execution_report_rejected_message_at] = wire[at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 16 -> execution_report_rejected_message_record.cl_ord_id[execution_report_rejected_message_at] = wire[at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> execution_report_rejected_message_record.exec_id[execution_report_rejected_message_at] = wire[at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_record.ord_status = wire[at]; at = at + 1;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> execution_report_rejected_message_record.symbol[execution_report_rejected_message_at] = wire[at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> execution_report_rejected_message_record.symbol_sfx[execution_report_rejected_message_at] = wire[at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> execution_report_rejected_message_record.leaves_qty[execution_report_rejected_message_at] = wire[at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> execution_report_rejected_message_record.cum_qty[execution_report_rejected_message_at] = wire[at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_record.order_reject_reason = wire[at]; at = at + 1;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> execution_report_rejected_message_record.link_id_optional[execution_report_rejected_message_at] = wire[at]; at = at + 1; execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Rejected Message is what was written, byte for byte */
inline equal_execution_report_rejected_message(execution_report_rejected_message_read, execution_report_rejected_message_written) {
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> assert(execution_report_rejected_message_read.sending_time[execution_report_rejected_message_at] == execution_report_rejected_message_written.sending_time[execution_report_rejected_message_at]); execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 16 -> assert(execution_report_rejected_message_read.cl_ord_id[execution_report_rejected_message_at] == execution_report_rejected_message_written.cl_ord_id[execution_report_rejected_message_at]); execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 8 -> assert(execution_report_rejected_message_read.exec_id[execution_report_rejected_message_at] == execution_report_rejected_message_written.exec_id[execution_report_rejected_message_at]); execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  assert(execution_report_rejected_message_read.ord_status == execution_report_rejected_message_written.ord_status);
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> assert(execution_report_rejected_message_read.symbol[execution_report_rejected_message_at] == execution_report_rejected_message_written.symbol[execution_report_rejected_message_at]); execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 6 -> assert(execution_report_rejected_message_read.symbol_sfx[execution_report_rejected_message_at] == execution_report_rejected_message_written.symbol_sfx[execution_report_rejected_message_at]); execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> assert(execution_report_rejected_message_read.leaves_qty[execution_report_rejected_message_at] == execution_report_rejected_message_written.leaves_qty[execution_report_rejected_message_at]); execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> assert(execution_report_rejected_message_read.cum_qty[execution_report_rejected_message_at] == execution_report_rejected_message_written.cum_qty[execution_report_rejected_message_at]); execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  assert(execution_report_rejected_message_read.order_reject_reason == execution_report_rejected_message_written.order_reject_reason);
  execution_report_rejected_message_at = 0;
  do
  :: execution_report_rejected_message_at < 4 -> assert(execution_report_rejected_message_read.link_id_optional[execution_report_rejected_message_at] == execution_report_rejected_message_written.link_id_optional[execution_report_rejected_message_at]); execution_report_rejected_message_at = execution_report_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Report Trade Message: 84 bytes -------------------------------- */

/* ExecutionReport_TradeMessage */
typedef ExecutionReportTradeMessage {
  byte sending_time[8];
  byte order_id[8];
  byte cl_ord_id[16];
  byte exec_id[8];
  byte ord_status;
  byte last_qty[4];
  byte last_px[8];
  byte leaves_qty[4];
  byte cum_qty[4];
  byte transact_time[8];
  byte last_liquidity_ind;
  byte last_mkt;
  byte trd_matching_id[8];
  byte link_id_optional[4];
  byte security_group
};

int execution_report_trade_message_at;

/* every byte of Execution Report Trade Message set to one value */
inline fill_execution_report_trade_message(execution_report_trade_message_record, execution_report_trade_message_value) {
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.sending_time[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.order_id[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 16 -> execution_report_trade_message_record.cl_ord_id[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.exec_id[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_record.ord_status = execution_report_trade_message_value;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.last_qty[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.last_px[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.leaves_qty[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.cum_qty[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.transact_time[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_record.last_liquidity_ind = execution_report_trade_message_value;
  execution_report_trade_message_record.last_mkt = execution_report_trade_message_value;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.trd_matching_id[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.link_id_optional[execution_report_trade_message_at] = execution_report_trade_message_value; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_record.security_group = execution_report_trade_message_value;
  skip
}

/* each byte of Execution Report Trade Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_trade_message(execution_report_trade_message_record, execution_report_trade_message_base) {
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.sending_time[execution_report_trade_message_at] = (execution_report_trade_message_base + 0 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.order_id[execution_report_trade_message_at] = (execution_report_trade_message_base + 8 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 16 -> execution_report_trade_message_record.cl_ord_id[execution_report_trade_message_at] = (execution_report_trade_message_base + 16 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.exec_id[execution_report_trade_message_at] = (execution_report_trade_message_base + 32 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_record.ord_status = (execution_report_trade_message_base + 40 + 1) % 256;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.last_qty[execution_report_trade_message_at] = (execution_report_trade_message_base + 41 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.last_px[execution_report_trade_message_at] = (execution_report_trade_message_base + 45 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.leaves_qty[execution_report_trade_message_at] = (execution_report_trade_message_base + 53 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.cum_qty[execution_report_trade_message_at] = (execution_report_trade_message_base + 57 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.transact_time[execution_report_trade_message_at] = (execution_report_trade_message_base + 61 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_record.last_liquidity_ind = (execution_report_trade_message_base + 69 + 1) % 256;
  execution_report_trade_message_record.last_mkt = (execution_report_trade_message_base + 70 + 1) % 256;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.trd_matching_id[execution_report_trade_message_at] = (execution_report_trade_message_base + 71 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.link_id_optional[execution_report_trade_message_at] = (execution_report_trade_message_base + 79 + execution_report_trade_message_at + 1) % 256; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_record.security_group = (execution_report_trade_message_base + 83 + 1) % 256;
  skip
}

/* Execution Report Trade Message to the wire, 84 bytes from where the cursor stands */
inline encode_execution_report_trade_message(execution_report_trade_message_record) {
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> wire[at] = execution_report_trade_message_record.sending_time[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> wire[at] = execution_report_trade_message_record.order_id[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 16 -> wire[at] = execution_report_trade_message_record.cl_ord_id[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> wire[at] = execution_report_trade_message_record.exec_id[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_trade_message_record.ord_status; at = at + 1;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> wire[at] = execution_report_trade_message_record.last_qty[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> wire[at] = execution_report_trade_message_record.last_px[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> wire[at] = execution_report_trade_message_record.leaves_qty[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> wire[at] = execution_report_trade_message_record.cum_qty[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> wire[at] = execution_report_trade_message_record.transact_time[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_trade_message_record.last_liquidity_ind; at = at + 1;
  wire[at] = execution_report_trade_message_record.last_mkt; at = at + 1;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> wire[at] = execution_report_trade_message_record.trd_matching_id[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> wire[at] = execution_report_trade_message_record.link_id_optional[execution_report_trade_message_at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_trade_message_record.security_group; at = at + 1;
  skip
}

/* Execution Report Trade Message off the wire, 84 bytes from where the cursor stands */
inline decode_execution_report_trade_message(execution_report_trade_message_record) {
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.sending_time[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.order_id[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 16 -> execution_report_trade_message_record.cl_ord_id[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.exec_id[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_record.ord_status = wire[at]; at = at + 1;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.last_qty[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.last_px[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.leaves_qty[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.cum_qty[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.transact_time[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_record.last_liquidity_ind = wire[at]; at = at + 1;
  execution_report_trade_message_record.last_mkt = wire[at]; at = at + 1;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> execution_report_trade_message_record.trd_matching_id[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> execution_report_trade_message_record.link_id_optional[execution_report_trade_message_at] = wire[at]; at = at + 1; execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_record.security_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Execution Report Trade Message is what was written, byte for byte */
inline equal_execution_report_trade_message(execution_report_trade_message_read, execution_report_trade_message_written) {
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> assert(execution_report_trade_message_read.sending_time[execution_report_trade_message_at] == execution_report_trade_message_written.sending_time[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> assert(execution_report_trade_message_read.order_id[execution_report_trade_message_at] == execution_report_trade_message_written.order_id[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 16 -> assert(execution_report_trade_message_read.cl_ord_id[execution_report_trade_message_at] == execution_report_trade_message_written.cl_ord_id[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> assert(execution_report_trade_message_read.exec_id[execution_report_trade_message_at] == execution_report_trade_message_written.exec_id[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  assert(execution_report_trade_message_read.ord_status == execution_report_trade_message_written.ord_status);
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> assert(execution_report_trade_message_read.last_qty[execution_report_trade_message_at] == execution_report_trade_message_written.last_qty[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> assert(execution_report_trade_message_read.last_px[execution_report_trade_message_at] == execution_report_trade_message_written.last_px[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> assert(execution_report_trade_message_read.leaves_qty[execution_report_trade_message_at] == execution_report_trade_message_written.leaves_qty[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> assert(execution_report_trade_message_read.cum_qty[execution_report_trade_message_at] == execution_report_trade_message_written.cum_qty[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> assert(execution_report_trade_message_read.transact_time[execution_report_trade_message_at] == execution_report_trade_message_written.transact_time[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  assert(execution_report_trade_message_read.last_liquidity_ind == execution_report_trade_message_written.last_liquidity_ind);
  assert(execution_report_trade_message_read.last_mkt == execution_report_trade_message_written.last_mkt);
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 8 -> assert(execution_report_trade_message_read.trd_matching_id[execution_report_trade_message_at] == execution_report_trade_message_written.trd_matching_id[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  execution_report_trade_message_at = 0;
  do
  :: execution_report_trade_message_at < 4 -> assert(execution_report_trade_message_read.link_id_optional[execution_report_trade_message_at] == execution_report_trade_message_written.link_id_optional[execution_report_trade_message_at]); execution_report_trade_message_at = execution_report_trade_message_at + 1
  :: else -> break
  od;
  assert(execution_report_trade_message_read.security_group == execution_report_trade_message_written.security_group);
  skip
}

/* ---- Execution Report Pending Cancel Message: 81 bytes ----------------------- */

/* ExecutionReport_PendingCancelMessage */
typedef ExecutionReportPendingCancelMessage {
  byte sending_time[8];
  byte order_id[8];
  byte cl_ord_id[16];
  byte orig_cl_ord_id_optional[16];
  byte exec_id[8];
  byte symbol[6];
  byte symbol_sfx[6];
  byte ord_status;
  byte leaves_qty[4];
  byte cum_qty[4];
  byte link_id_optional[4]
};

int execution_report_pending_cancel_message_at;

/* every byte of Execution Report Pending Cancel Message set to one value */
inline fill_execution_report_pending_cancel_message(execution_report_pending_cancel_message_record, execution_report_pending_cancel_message_value) {
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> execution_report_pending_cancel_message_record.sending_time[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> execution_report_pending_cancel_message_record.order_id[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> execution_report_pending_cancel_message_record.cl_ord_id[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> execution_report_pending_cancel_message_record.orig_cl_ord_id_optional[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> execution_report_pending_cancel_message_record.exec_id[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> execution_report_pending_cancel_message_record.symbol[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> execution_report_pending_cancel_message_record.symbol_sfx[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_record.ord_status = execution_report_pending_cancel_message_value;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> execution_report_pending_cancel_message_record.leaves_qty[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> execution_report_pending_cancel_message_record.cum_qty[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> execution_report_pending_cancel_message_record.link_id_optional[execution_report_pending_cancel_message_at] = execution_report_pending_cancel_message_value; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Pending Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_pending_cancel_message(execution_report_pending_cancel_message_record, execution_report_pending_cancel_message_base) {
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> execution_report_pending_cancel_message_record.sending_time[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 0 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> execution_report_pending_cancel_message_record.order_id[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 8 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> execution_report_pending_cancel_message_record.cl_ord_id[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 16 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> execution_report_pending_cancel_message_record.orig_cl_ord_id_optional[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 32 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> execution_report_pending_cancel_message_record.exec_id[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 48 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> execution_report_pending_cancel_message_record.symbol[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 56 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> execution_report_pending_cancel_message_record.symbol_sfx[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 62 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_record.ord_status = (execution_report_pending_cancel_message_base + 68 + 1) % 256;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> execution_report_pending_cancel_message_record.leaves_qty[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 69 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> execution_report_pending_cancel_message_record.cum_qty[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 73 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> execution_report_pending_cancel_message_record.link_id_optional[execution_report_pending_cancel_message_at] = (execution_report_pending_cancel_message_base + 77 + execution_report_pending_cancel_message_at + 1) % 256; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Pending Cancel Message to the wire, 81 bytes from where the cursor stands */
inline encode_execution_report_pending_cancel_message(execution_report_pending_cancel_message_record) {
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> wire[at] = execution_report_pending_cancel_message_record.sending_time[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> wire[at] = execution_report_pending_cancel_message_record.order_id[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> wire[at] = execution_report_pending_cancel_message_record.cl_ord_id[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> wire[at] = execution_report_pending_cancel_message_record.orig_cl_ord_id_optional[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> wire[at] = execution_report_pending_cancel_message_record.exec_id[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> wire[at] = execution_report_pending_cancel_message_record.symbol[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> wire[at] = execution_report_pending_cancel_message_record.symbol_sfx[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_pending_cancel_message_record.ord_status; at = at + 1;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> wire[at] = execution_report_pending_cancel_message_record.leaves_qty[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> wire[at] = execution_report_pending_cancel_message_record.cum_qty[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> wire[at] = execution_report_pending_cancel_message_record.link_id_optional[execution_report_pending_cancel_message_at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Pending Cancel Message off the wire, 81 bytes from where the cursor stands */
inline decode_execution_report_pending_cancel_message(execution_report_pending_cancel_message_record) {
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> execution_report_pending_cancel_message_record.sending_time[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> execution_report_pending_cancel_message_record.order_id[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> execution_report_pending_cancel_message_record.cl_ord_id[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> execution_report_pending_cancel_message_record.orig_cl_ord_id_optional[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> execution_report_pending_cancel_message_record.exec_id[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> execution_report_pending_cancel_message_record.symbol[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> execution_report_pending_cancel_message_record.symbol_sfx[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_record.ord_status = wire[at]; at = at + 1;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> execution_report_pending_cancel_message_record.leaves_qty[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> execution_report_pending_cancel_message_record.cum_qty[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> execution_report_pending_cancel_message_record.link_id_optional[execution_report_pending_cancel_message_at] = wire[at]; at = at + 1; execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Pending Cancel Message is what was written, byte for byte */
inline equal_execution_report_pending_cancel_message(execution_report_pending_cancel_message_read, execution_report_pending_cancel_message_written) {
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> assert(execution_report_pending_cancel_message_read.sending_time[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.sending_time[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> assert(execution_report_pending_cancel_message_read.order_id[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.order_id[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> assert(execution_report_pending_cancel_message_read.cl_ord_id[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.cl_ord_id[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 16 -> assert(execution_report_pending_cancel_message_read.orig_cl_ord_id_optional[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.orig_cl_ord_id_optional[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 8 -> assert(execution_report_pending_cancel_message_read.exec_id[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.exec_id[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> assert(execution_report_pending_cancel_message_read.symbol[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.symbol[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 6 -> assert(execution_report_pending_cancel_message_read.symbol_sfx[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.symbol_sfx[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  assert(execution_report_pending_cancel_message_read.ord_status == execution_report_pending_cancel_message_written.ord_status);
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> assert(execution_report_pending_cancel_message_read.leaves_qty[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.leaves_qty[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> assert(execution_report_pending_cancel_message_read.cum_qty[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.cum_qty[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_pending_cancel_message_at = 0;
  do
  :: execution_report_pending_cancel_message_at < 4 -> assert(execution_report_pending_cancel_message_read.link_id_optional[execution_report_pending_cancel_message_at] == execution_report_pending_cancel_message_written.link_id_optional[execution_report_pending_cancel_message_at]); execution_report_pending_cancel_message_at = execution_report_pending_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Pending Mass Cancel Message: 55 bytes ----------------------------------- */

/* PendingMassCancelMessage */
typedef PendingMassCancelMessage {
  byte sending_time[8];
  byte cl_ord_id[16];
  byte symbol[6];
  byte symbol_sfx[6];
  byte side_optional;
  byte lower_than_price[8];
  byte higher_than_price[8];
  byte cancel_group_id[2]
};

int pending_mass_cancel_message_at;

/* every byte of Pending Mass Cancel Message set to one value */
inline fill_pending_mass_cancel_message(pending_mass_cancel_message_record, pending_mass_cancel_message_value) {
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> pending_mass_cancel_message_record.sending_time[pending_mass_cancel_message_at] = pending_mass_cancel_message_value; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 16 -> pending_mass_cancel_message_record.cl_ord_id[pending_mass_cancel_message_at] = pending_mass_cancel_message_value; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> pending_mass_cancel_message_record.symbol[pending_mass_cancel_message_at] = pending_mass_cancel_message_value; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> pending_mass_cancel_message_record.symbol_sfx[pending_mass_cancel_message_at] = pending_mass_cancel_message_value; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_record.side_optional = pending_mass_cancel_message_value;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> pending_mass_cancel_message_record.lower_than_price[pending_mass_cancel_message_at] = pending_mass_cancel_message_value; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> pending_mass_cancel_message_record.higher_than_price[pending_mass_cancel_message_at] = pending_mass_cancel_message_value; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 2 -> pending_mass_cancel_message_record.cancel_group_id[pending_mass_cancel_message_at] = pending_mass_cancel_message_value; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Pending Mass Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_pending_mass_cancel_message(pending_mass_cancel_message_record, pending_mass_cancel_message_base) {
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> pending_mass_cancel_message_record.sending_time[pending_mass_cancel_message_at] = (pending_mass_cancel_message_base + 0 + pending_mass_cancel_message_at + 1) % 256; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 16 -> pending_mass_cancel_message_record.cl_ord_id[pending_mass_cancel_message_at] = (pending_mass_cancel_message_base + 8 + pending_mass_cancel_message_at + 1) % 256; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> pending_mass_cancel_message_record.symbol[pending_mass_cancel_message_at] = (pending_mass_cancel_message_base + 24 + pending_mass_cancel_message_at + 1) % 256; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> pending_mass_cancel_message_record.symbol_sfx[pending_mass_cancel_message_at] = (pending_mass_cancel_message_base + 30 + pending_mass_cancel_message_at + 1) % 256; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_record.side_optional = (pending_mass_cancel_message_base + 36 + 1) % 256;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> pending_mass_cancel_message_record.lower_than_price[pending_mass_cancel_message_at] = (pending_mass_cancel_message_base + 37 + pending_mass_cancel_message_at + 1) % 256; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> pending_mass_cancel_message_record.higher_than_price[pending_mass_cancel_message_at] = (pending_mass_cancel_message_base + 45 + pending_mass_cancel_message_at + 1) % 256; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 2 -> pending_mass_cancel_message_record.cancel_group_id[pending_mass_cancel_message_at] = (pending_mass_cancel_message_base + 53 + pending_mass_cancel_message_at + 1) % 256; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Pending Mass Cancel Message to the wire, 55 bytes from where the cursor stands */
inline encode_pending_mass_cancel_message(pending_mass_cancel_message_record) {
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> wire[at] = pending_mass_cancel_message_record.sending_time[pending_mass_cancel_message_at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 16 -> wire[at] = pending_mass_cancel_message_record.cl_ord_id[pending_mass_cancel_message_at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> wire[at] = pending_mass_cancel_message_record.symbol[pending_mass_cancel_message_at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> wire[at] = pending_mass_cancel_message_record.symbol_sfx[pending_mass_cancel_message_at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = pending_mass_cancel_message_record.side_optional; at = at + 1;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> wire[at] = pending_mass_cancel_message_record.lower_than_price[pending_mass_cancel_message_at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> wire[at] = pending_mass_cancel_message_record.higher_than_price[pending_mass_cancel_message_at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 2 -> wire[at] = pending_mass_cancel_message_record.cancel_group_id[pending_mass_cancel_message_at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Pending Mass Cancel Message off the wire, 55 bytes from where the cursor stands */
inline decode_pending_mass_cancel_message(pending_mass_cancel_message_record) {
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> pending_mass_cancel_message_record.sending_time[pending_mass_cancel_message_at] = wire[at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 16 -> pending_mass_cancel_message_record.cl_ord_id[pending_mass_cancel_message_at] = wire[at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> pending_mass_cancel_message_record.symbol[pending_mass_cancel_message_at] = wire[at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> pending_mass_cancel_message_record.symbol_sfx[pending_mass_cancel_message_at] = wire[at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_record.side_optional = wire[at]; at = at + 1;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> pending_mass_cancel_message_record.lower_than_price[pending_mass_cancel_message_at] = wire[at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> pending_mass_cancel_message_record.higher_than_price[pending_mass_cancel_message_at] = wire[at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 2 -> pending_mass_cancel_message_record.cancel_group_id[pending_mass_cancel_message_at] = wire[at]; at = at + 1; pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Pending Mass Cancel Message is what was written, byte for byte */
inline equal_pending_mass_cancel_message(pending_mass_cancel_message_read, pending_mass_cancel_message_written) {
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> assert(pending_mass_cancel_message_read.sending_time[pending_mass_cancel_message_at] == pending_mass_cancel_message_written.sending_time[pending_mass_cancel_message_at]); pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 16 -> assert(pending_mass_cancel_message_read.cl_ord_id[pending_mass_cancel_message_at] == pending_mass_cancel_message_written.cl_ord_id[pending_mass_cancel_message_at]); pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> assert(pending_mass_cancel_message_read.symbol[pending_mass_cancel_message_at] == pending_mass_cancel_message_written.symbol[pending_mass_cancel_message_at]); pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 6 -> assert(pending_mass_cancel_message_read.symbol_sfx[pending_mass_cancel_message_at] == pending_mass_cancel_message_written.symbol_sfx[pending_mass_cancel_message_at]); pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  assert(pending_mass_cancel_message_read.side_optional == pending_mass_cancel_message_written.side_optional);
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> assert(pending_mass_cancel_message_read.lower_than_price[pending_mass_cancel_message_at] == pending_mass_cancel_message_written.lower_than_price[pending_mass_cancel_message_at]); pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 8 -> assert(pending_mass_cancel_message_read.higher_than_price[pending_mass_cancel_message_at] == pending_mass_cancel_message_written.higher_than_price[pending_mass_cancel_message_at]); pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  pending_mass_cancel_message_at = 0;
  do
  :: pending_mass_cancel_message_at < 2 -> assert(pending_mass_cancel_message_read.cancel_group_id[pending_mass_cancel_message_at] == pending_mass_cancel_message_written.cancel_group_id[pending_mass_cancel_message_at]); pending_mass_cancel_message_at = pending_mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Report Canceled Message: 78 bytes ----------------------------- */

/* ExecutionReport_CanceledMessage */
typedef ExecutionReportCanceledMessage {
  byte sending_time[8];
  byte cl_ord_id[16];
  byte orig_cl_ord_id_optional[16];
  byte order_id[8];
  byte exec_id[8];
  byte ord_status;
  byte leaves_qty[4];
  byte cum_qty[4];
  byte cancel_reason;
  byte transact_time[8];
  byte link_id_optional[4]
};

int execution_report_canceled_message_at;

/* every byte of Execution Report Canceled Message set to one value */
inline fill_execution_report_canceled_message(execution_report_canceled_message_record, execution_report_canceled_message_value) {
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.sending_time[execution_report_canceled_message_at] = execution_report_canceled_message_value; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> execution_report_canceled_message_record.cl_ord_id[execution_report_canceled_message_at] = execution_report_canceled_message_value; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> execution_report_canceled_message_record.orig_cl_ord_id_optional[execution_report_canceled_message_at] = execution_report_canceled_message_value; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.order_id[execution_report_canceled_message_at] = execution_report_canceled_message_value; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.exec_id[execution_report_canceled_message_at] = execution_report_canceled_message_value; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_record.ord_status = execution_report_canceled_message_value;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> execution_report_canceled_message_record.leaves_qty[execution_report_canceled_message_at] = execution_report_canceled_message_value; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> execution_report_canceled_message_record.cum_qty[execution_report_canceled_message_at] = execution_report_canceled_message_value; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_record.cancel_reason = execution_report_canceled_message_value;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.transact_time[execution_report_canceled_message_at] = execution_report_canceled_message_value; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> execution_report_canceled_message_record.link_id_optional[execution_report_canceled_message_at] = execution_report_canceled_message_value; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Canceled Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_canceled_message(execution_report_canceled_message_record, execution_report_canceled_message_base) {
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.sending_time[execution_report_canceled_message_at] = (execution_report_canceled_message_base + 0 + execution_report_canceled_message_at + 1) % 256; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> execution_report_canceled_message_record.cl_ord_id[execution_report_canceled_message_at] = (execution_report_canceled_message_base + 8 + execution_report_canceled_message_at + 1) % 256; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> execution_report_canceled_message_record.orig_cl_ord_id_optional[execution_report_canceled_message_at] = (execution_report_canceled_message_base + 24 + execution_report_canceled_message_at + 1) % 256; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.order_id[execution_report_canceled_message_at] = (execution_report_canceled_message_base + 40 + execution_report_canceled_message_at + 1) % 256; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.exec_id[execution_report_canceled_message_at] = (execution_report_canceled_message_base + 48 + execution_report_canceled_message_at + 1) % 256; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_record.ord_status = (execution_report_canceled_message_base + 56 + 1) % 256;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> execution_report_canceled_message_record.leaves_qty[execution_report_canceled_message_at] = (execution_report_canceled_message_base + 57 + execution_report_canceled_message_at + 1) % 256; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> execution_report_canceled_message_record.cum_qty[execution_report_canceled_message_at] = (execution_report_canceled_message_base + 61 + execution_report_canceled_message_at + 1) % 256; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_record.cancel_reason = (execution_report_canceled_message_base + 65 + 1) % 256;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.transact_time[execution_report_canceled_message_at] = (execution_report_canceled_message_base + 66 + execution_report_canceled_message_at + 1) % 256; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> execution_report_canceled_message_record.link_id_optional[execution_report_canceled_message_at] = (execution_report_canceled_message_base + 74 + execution_report_canceled_message_at + 1) % 256; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Canceled Message to the wire, 78 bytes from where the cursor stands */
inline encode_execution_report_canceled_message(execution_report_canceled_message_record) {
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> wire[at] = execution_report_canceled_message_record.sending_time[execution_report_canceled_message_at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> wire[at] = execution_report_canceled_message_record.cl_ord_id[execution_report_canceled_message_at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> wire[at] = execution_report_canceled_message_record.orig_cl_ord_id_optional[execution_report_canceled_message_at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> wire[at] = execution_report_canceled_message_record.order_id[execution_report_canceled_message_at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> wire[at] = execution_report_canceled_message_record.exec_id[execution_report_canceled_message_at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_canceled_message_record.ord_status; at = at + 1;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> wire[at] = execution_report_canceled_message_record.leaves_qty[execution_report_canceled_message_at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> wire[at] = execution_report_canceled_message_record.cum_qty[execution_report_canceled_message_at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_canceled_message_record.cancel_reason; at = at + 1;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> wire[at] = execution_report_canceled_message_record.transact_time[execution_report_canceled_message_at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> wire[at] = execution_report_canceled_message_record.link_id_optional[execution_report_canceled_message_at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Canceled Message off the wire, 78 bytes from where the cursor stands */
inline decode_execution_report_canceled_message(execution_report_canceled_message_record) {
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.sending_time[execution_report_canceled_message_at] = wire[at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> execution_report_canceled_message_record.cl_ord_id[execution_report_canceled_message_at] = wire[at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> execution_report_canceled_message_record.orig_cl_ord_id_optional[execution_report_canceled_message_at] = wire[at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.order_id[execution_report_canceled_message_at] = wire[at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.exec_id[execution_report_canceled_message_at] = wire[at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_record.ord_status = wire[at]; at = at + 1;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> execution_report_canceled_message_record.leaves_qty[execution_report_canceled_message_at] = wire[at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> execution_report_canceled_message_record.cum_qty[execution_report_canceled_message_at] = wire[at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_record.cancel_reason = wire[at]; at = at + 1;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> execution_report_canceled_message_record.transact_time[execution_report_canceled_message_at] = wire[at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> execution_report_canceled_message_record.link_id_optional[execution_report_canceled_message_at] = wire[at]; at = at + 1; execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Canceled Message is what was written, byte for byte */
inline equal_execution_report_canceled_message(execution_report_canceled_message_read, execution_report_canceled_message_written) {
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> assert(execution_report_canceled_message_read.sending_time[execution_report_canceled_message_at] == execution_report_canceled_message_written.sending_time[execution_report_canceled_message_at]); execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> assert(execution_report_canceled_message_read.cl_ord_id[execution_report_canceled_message_at] == execution_report_canceled_message_written.cl_ord_id[execution_report_canceled_message_at]); execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 16 -> assert(execution_report_canceled_message_read.orig_cl_ord_id_optional[execution_report_canceled_message_at] == execution_report_canceled_message_written.orig_cl_ord_id_optional[execution_report_canceled_message_at]); execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> assert(execution_report_canceled_message_read.order_id[execution_report_canceled_message_at] == execution_report_canceled_message_written.order_id[execution_report_canceled_message_at]); execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> assert(execution_report_canceled_message_read.exec_id[execution_report_canceled_message_at] == execution_report_canceled_message_written.exec_id[execution_report_canceled_message_at]); execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  assert(execution_report_canceled_message_read.ord_status == execution_report_canceled_message_written.ord_status);
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> assert(execution_report_canceled_message_read.leaves_qty[execution_report_canceled_message_at] == execution_report_canceled_message_written.leaves_qty[execution_report_canceled_message_at]); execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> assert(execution_report_canceled_message_read.cum_qty[execution_report_canceled_message_at] == execution_report_canceled_message_written.cum_qty[execution_report_canceled_message_at]); execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  assert(execution_report_canceled_message_read.cancel_reason == execution_report_canceled_message_written.cancel_reason);
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 8 -> assert(execution_report_canceled_message_read.transact_time[execution_report_canceled_message_at] == execution_report_canceled_message_written.transact_time[execution_report_canceled_message_at]); execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  execution_report_canceled_message_at = 0;
  do
  :: execution_report_canceled_message_at < 4 -> assert(execution_report_canceled_message_read.link_id_optional[execution_report_canceled_message_at] == execution_report_canceled_message_written.link_id_optional[execution_report_canceled_message_at]); execution_report_canceled_message_at = execution_report_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Done Message: 24 bytes -------------------------------------- */

/* MassCancelDoneMessage */
typedef MassCancelDoneMessage {
  byte sending_time[8];
  byte cl_ord_id[16]
};

int mass_cancel_done_message_at;

/* every byte of Mass Cancel Done Message set to one value */
inline fill_mass_cancel_done_message(mass_cancel_done_message_record, mass_cancel_done_message_value) {
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 8 -> mass_cancel_done_message_record.sending_time[mass_cancel_done_message_at] = mass_cancel_done_message_value; mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 16 -> mass_cancel_done_message_record.cl_ord_id[mass_cancel_done_message_at] = mass_cancel_done_message_value; mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Done Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_done_message(mass_cancel_done_message_record, mass_cancel_done_message_base) {
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 8 -> mass_cancel_done_message_record.sending_time[mass_cancel_done_message_at] = (mass_cancel_done_message_base + 0 + mass_cancel_done_message_at + 1) % 256; mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 16 -> mass_cancel_done_message_record.cl_ord_id[mass_cancel_done_message_at] = (mass_cancel_done_message_base + 8 + mass_cancel_done_message_at + 1) % 256; mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Done Message to the wire, 24 bytes from where the cursor stands */
inline encode_mass_cancel_done_message(mass_cancel_done_message_record) {
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 8 -> wire[at] = mass_cancel_done_message_record.sending_time[mass_cancel_done_message_at]; at = at + 1; mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 16 -> wire[at] = mass_cancel_done_message_record.cl_ord_id[mass_cancel_done_message_at]; at = at + 1; mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Done Message off the wire, 24 bytes from where the cursor stands */
inline decode_mass_cancel_done_message(mass_cancel_done_message_record) {
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 8 -> mass_cancel_done_message_record.sending_time[mass_cancel_done_message_at] = wire[at]; at = at + 1; mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 16 -> mass_cancel_done_message_record.cl_ord_id[mass_cancel_done_message_at] = wire[at]; at = at + 1; mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Done Message is what was written, byte for byte */
inline equal_mass_cancel_done_message(mass_cancel_done_message_read, mass_cancel_done_message_written) {
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 8 -> assert(mass_cancel_done_message_read.sending_time[mass_cancel_done_message_at] == mass_cancel_done_message_written.sending_time[mass_cancel_done_message_at]); mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  mass_cancel_done_message_at = 0;
  do
  :: mass_cancel_done_message_at < 16 -> assert(mass_cancel_done_message_read.cl_ord_id[mass_cancel_done_message_at] == mass_cancel_done_message_written.cl_ord_id[mass_cancel_done_message_at]); mass_cancel_done_message_at = mass_cancel_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Report Pending Replace Message: 100 bytes --------------------- */

/* ExecutionReport_PendingReplaceMessage */
typedef ExecutionReportPendingReplaceMessage {
  byte sending_time[8];
  byte order_id[8];
  byte cl_ord_id[16];
  byte orig_cl_ord_id_optional[16];
  byte exec_id[8];
  byte symbol[6];
  byte symbol_sfx[6];
  byte side;
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte display_qty[4];
  byte locate_reqd;
  byte ord_status;
  byte leaves_qty[4];
  byte cum_qty[4];
  byte link_id_optional[4]
};

int execution_report_pending_replace_message_at;

/* every byte of Execution Report Pending Replace Message set to one value */
inline fill_execution_report_pending_replace_message(execution_report_pending_replace_message_record, execution_report_pending_replace_message_value) {
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.sending_time[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.order_id[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> execution_report_pending_replace_message_record.cl_ord_id[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> execution_report_pending_replace_message_record.orig_cl_ord_id_optional[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.exec_id[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> execution_report_pending_replace_message_record.symbol[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> execution_report_pending_replace_message_record.symbol_sfx[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_record.side = execution_report_pending_replace_message_value;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.order_qty[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_record.ord_type = execution_report_pending_replace_message_value;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.price[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.display_qty[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_record.locate_reqd = execution_report_pending_replace_message_value;
  execution_report_pending_replace_message_record.ord_status = execution_report_pending_replace_message_value;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.leaves_qty[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.cum_qty[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.link_id_optional[execution_report_pending_replace_message_at] = execution_report_pending_replace_message_value; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Pending Replace Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_pending_replace_message(execution_report_pending_replace_message_record, execution_report_pending_replace_message_base) {
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.sending_time[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 0 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.order_id[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 8 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> execution_report_pending_replace_message_record.cl_ord_id[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 16 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> execution_report_pending_replace_message_record.orig_cl_ord_id_optional[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 32 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.exec_id[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 48 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> execution_report_pending_replace_message_record.symbol[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 56 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> execution_report_pending_replace_message_record.symbol_sfx[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 62 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_record.side = (execution_report_pending_replace_message_base + 68 + 1) % 256;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.order_qty[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 69 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_record.ord_type = (execution_report_pending_replace_message_base + 73 + 1) % 256;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.price[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 74 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.display_qty[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 82 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_record.locate_reqd = (execution_report_pending_replace_message_base + 86 + 1) % 256;
  execution_report_pending_replace_message_record.ord_status = (execution_report_pending_replace_message_base + 87 + 1) % 256;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.leaves_qty[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 88 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.cum_qty[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 92 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.link_id_optional[execution_report_pending_replace_message_at] = (execution_report_pending_replace_message_base + 96 + execution_report_pending_replace_message_at + 1) % 256; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Pending Replace Message to the wire, 100 bytes from where the cursor stands */
inline encode_execution_report_pending_replace_message(execution_report_pending_replace_message_record) {
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> wire[at] = execution_report_pending_replace_message_record.sending_time[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> wire[at] = execution_report_pending_replace_message_record.order_id[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> wire[at] = execution_report_pending_replace_message_record.cl_ord_id[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> wire[at] = execution_report_pending_replace_message_record.orig_cl_ord_id_optional[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> wire[at] = execution_report_pending_replace_message_record.exec_id[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> wire[at] = execution_report_pending_replace_message_record.symbol[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> wire[at] = execution_report_pending_replace_message_record.symbol_sfx[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_pending_replace_message_record.side; at = at + 1;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> wire[at] = execution_report_pending_replace_message_record.order_qty[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_pending_replace_message_record.ord_type; at = at + 1;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> wire[at] = execution_report_pending_replace_message_record.price[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> wire[at] = execution_report_pending_replace_message_record.display_qty[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_pending_replace_message_record.locate_reqd; at = at + 1;
  wire[at] = execution_report_pending_replace_message_record.ord_status; at = at + 1;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> wire[at] = execution_report_pending_replace_message_record.leaves_qty[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> wire[at] = execution_report_pending_replace_message_record.cum_qty[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> wire[at] = execution_report_pending_replace_message_record.link_id_optional[execution_report_pending_replace_message_at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Pending Replace Message off the wire, 100 bytes from where the cursor stands */
inline decode_execution_report_pending_replace_message(execution_report_pending_replace_message_record) {
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.sending_time[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.order_id[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> execution_report_pending_replace_message_record.cl_ord_id[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> execution_report_pending_replace_message_record.orig_cl_ord_id_optional[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.exec_id[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> execution_report_pending_replace_message_record.symbol[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> execution_report_pending_replace_message_record.symbol_sfx[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_record.side = wire[at]; at = at + 1;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.order_qty[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_record.ord_type = wire[at]; at = at + 1;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> execution_report_pending_replace_message_record.price[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.display_qty[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_record.locate_reqd = wire[at]; at = at + 1;
  execution_report_pending_replace_message_record.ord_status = wire[at]; at = at + 1;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.leaves_qty[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.cum_qty[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> execution_report_pending_replace_message_record.link_id_optional[execution_report_pending_replace_message_at] = wire[at]; at = at + 1; execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Pending Replace Message is what was written, byte for byte */
inline equal_execution_report_pending_replace_message(execution_report_pending_replace_message_read, execution_report_pending_replace_message_written) {
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> assert(execution_report_pending_replace_message_read.sending_time[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.sending_time[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> assert(execution_report_pending_replace_message_read.order_id[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.order_id[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> assert(execution_report_pending_replace_message_read.cl_ord_id[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.cl_ord_id[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 16 -> assert(execution_report_pending_replace_message_read.orig_cl_ord_id_optional[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.orig_cl_ord_id_optional[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> assert(execution_report_pending_replace_message_read.exec_id[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.exec_id[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> assert(execution_report_pending_replace_message_read.symbol[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.symbol[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 6 -> assert(execution_report_pending_replace_message_read.symbol_sfx[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.symbol_sfx[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  assert(execution_report_pending_replace_message_read.side == execution_report_pending_replace_message_written.side);
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> assert(execution_report_pending_replace_message_read.order_qty[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.order_qty[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  assert(execution_report_pending_replace_message_read.ord_type == execution_report_pending_replace_message_written.ord_type);
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 8 -> assert(execution_report_pending_replace_message_read.price[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.price[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> assert(execution_report_pending_replace_message_read.display_qty[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.display_qty[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  assert(execution_report_pending_replace_message_read.locate_reqd == execution_report_pending_replace_message_written.locate_reqd);
  assert(execution_report_pending_replace_message_read.ord_status == execution_report_pending_replace_message_written.ord_status);
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> assert(execution_report_pending_replace_message_read.leaves_qty[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.leaves_qty[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> assert(execution_report_pending_replace_message_read.cum_qty[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.cum_qty[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  execution_report_pending_replace_message_at = 0;
  do
  :: execution_report_pending_replace_message_at < 4 -> assert(execution_report_pending_replace_message_read.link_id_optional[execution_report_pending_replace_message_at] == execution_report_pending_replace_message_written.link_id_optional[execution_report_pending_replace_message_at]); execution_report_pending_replace_message_at = execution_report_pending_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Report Replaced Message: 108 bytes ---------------------------- */

/* ExecutionReport_ReplacedMessage */
typedef ExecutionReportReplacedMessage {
  byte sending_time[8];
  byte order_id[8];
  byte cl_ord_id[16];
  byte orig_cl_ord_id_optional[16];
  byte exec_id[8];
  byte symbol[6];
  byte symbol_sfx[6];
  byte side;
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte display_qty[4];
  byte locate_reqd;
  byte ord_status;
  byte leaves_qty[4];
  byte cum_qty[4];
  byte transact_time[8];
  byte link_id_optional[4]
};

int execution_report_replaced_message_at;

/* every byte of Execution Report Replaced Message set to one value */
inline fill_execution_report_replaced_message(execution_report_replaced_message_record, execution_report_replaced_message_value) {
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.sending_time[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.order_id[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> execution_report_replaced_message_record.cl_ord_id[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> execution_report_replaced_message_record.orig_cl_ord_id_optional[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.exec_id[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> execution_report_replaced_message_record.symbol[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> execution_report_replaced_message_record.symbol_sfx[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_record.side = execution_report_replaced_message_value;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.order_qty[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_record.ord_type = execution_report_replaced_message_value;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.price[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.display_qty[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_record.locate_reqd = execution_report_replaced_message_value;
  execution_report_replaced_message_record.ord_status = execution_report_replaced_message_value;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.leaves_qty[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.cum_qty[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.transact_time[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.link_id_optional[execution_report_replaced_message_at] = execution_report_replaced_message_value; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_replaced_message(execution_report_replaced_message_record, execution_report_replaced_message_base) {
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.sending_time[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 0 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.order_id[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 8 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> execution_report_replaced_message_record.cl_ord_id[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 16 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> execution_report_replaced_message_record.orig_cl_ord_id_optional[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 32 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.exec_id[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 48 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> execution_report_replaced_message_record.symbol[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 56 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> execution_report_replaced_message_record.symbol_sfx[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 62 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_record.side = (execution_report_replaced_message_base + 68 + 1) % 256;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.order_qty[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 69 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_record.ord_type = (execution_report_replaced_message_base + 73 + 1) % 256;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.price[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 74 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.display_qty[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 82 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_record.locate_reqd = (execution_report_replaced_message_base + 86 + 1) % 256;
  execution_report_replaced_message_record.ord_status = (execution_report_replaced_message_base + 87 + 1) % 256;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.leaves_qty[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 88 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.cum_qty[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 92 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.transact_time[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 96 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.link_id_optional[execution_report_replaced_message_at] = (execution_report_replaced_message_base + 104 + execution_report_replaced_message_at + 1) % 256; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Replaced Message to the wire, 108 bytes from where the cursor stands */
inline encode_execution_report_replaced_message(execution_report_replaced_message_record) {
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> wire[at] = execution_report_replaced_message_record.sending_time[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> wire[at] = execution_report_replaced_message_record.order_id[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> wire[at] = execution_report_replaced_message_record.cl_ord_id[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> wire[at] = execution_report_replaced_message_record.orig_cl_ord_id_optional[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> wire[at] = execution_report_replaced_message_record.exec_id[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> wire[at] = execution_report_replaced_message_record.symbol[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> wire[at] = execution_report_replaced_message_record.symbol_sfx[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_replaced_message_record.side; at = at + 1;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> wire[at] = execution_report_replaced_message_record.order_qty[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_replaced_message_record.ord_type; at = at + 1;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> wire[at] = execution_report_replaced_message_record.price[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> wire[at] = execution_report_replaced_message_record.display_qty[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_replaced_message_record.locate_reqd; at = at + 1;
  wire[at] = execution_report_replaced_message_record.ord_status; at = at + 1;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> wire[at] = execution_report_replaced_message_record.leaves_qty[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> wire[at] = execution_report_replaced_message_record.cum_qty[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> wire[at] = execution_report_replaced_message_record.transact_time[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> wire[at] = execution_report_replaced_message_record.link_id_optional[execution_report_replaced_message_at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Replaced Message off the wire, 108 bytes from where the cursor stands */
inline decode_execution_report_replaced_message(execution_report_replaced_message_record) {
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.sending_time[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.order_id[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> execution_report_replaced_message_record.cl_ord_id[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> execution_report_replaced_message_record.orig_cl_ord_id_optional[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.exec_id[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> execution_report_replaced_message_record.symbol[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> execution_report_replaced_message_record.symbol_sfx[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_record.side = wire[at]; at = at + 1;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.order_qty[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_record.ord_type = wire[at]; at = at + 1;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.price[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.display_qty[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_record.locate_reqd = wire[at]; at = at + 1;
  execution_report_replaced_message_record.ord_status = wire[at]; at = at + 1;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.leaves_qty[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.cum_qty[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> execution_report_replaced_message_record.transact_time[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> execution_report_replaced_message_record.link_id_optional[execution_report_replaced_message_at] = wire[at]; at = at + 1; execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Replaced Message is what was written, byte for byte */
inline equal_execution_report_replaced_message(execution_report_replaced_message_read, execution_report_replaced_message_written) {
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> assert(execution_report_replaced_message_read.sending_time[execution_report_replaced_message_at] == execution_report_replaced_message_written.sending_time[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> assert(execution_report_replaced_message_read.order_id[execution_report_replaced_message_at] == execution_report_replaced_message_written.order_id[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> assert(execution_report_replaced_message_read.cl_ord_id[execution_report_replaced_message_at] == execution_report_replaced_message_written.cl_ord_id[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 16 -> assert(execution_report_replaced_message_read.orig_cl_ord_id_optional[execution_report_replaced_message_at] == execution_report_replaced_message_written.orig_cl_ord_id_optional[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> assert(execution_report_replaced_message_read.exec_id[execution_report_replaced_message_at] == execution_report_replaced_message_written.exec_id[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> assert(execution_report_replaced_message_read.symbol[execution_report_replaced_message_at] == execution_report_replaced_message_written.symbol[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 6 -> assert(execution_report_replaced_message_read.symbol_sfx[execution_report_replaced_message_at] == execution_report_replaced_message_written.symbol_sfx[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  assert(execution_report_replaced_message_read.side == execution_report_replaced_message_written.side);
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> assert(execution_report_replaced_message_read.order_qty[execution_report_replaced_message_at] == execution_report_replaced_message_written.order_qty[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  assert(execution_report_replaced_message_read.ord_type == execution_report_replaced_message_written.ord_type);
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> assert(execution_report_replaced_message_read.price[execution_report_replaced_message_at] == execution_report_replaced_message_written.price[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> assert(execution_report_replaced_message_read.display_qty[execution_report_replaced_message_at] == execution_report_replaced_message_written.display_qty[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  assert(execution_report_replaced_message_read.locate_reqd == execution_report_replaced_message_written.locate_reqd);
  assert(execution_report_replaced_message_read.ord_status == execution_report_replaced_message_written.ord_status);
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> assert(execution_report_replaced_message_read.leaves_qty[execution_report_replaced_message_at] == execution_report_replaced_message_written.leaves_qty[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> assert(execution_report_replaced_message_read.cum_qty[execution_report_replaced_message_at] == execution_report_replaced_message_written.cum_qty[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 8 -> assert(execution_report_replaced_message_read.transact_time[execution_report_replaced_message_at] == execution_report_replaced_message_written.transact_time[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  execution_report_replaced_message_at = 0;
  do
  :: execution_report_replaced_message_at < 4 -> assert(execution_report_replaced_message_read.link_id_optional[execution_report_replaced_message_at] == execution_report_replaced_message_written.link_id_optional[execution_report_replaced_message_at]); execution_report_replaced_message_at = execution_report_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Report Trade Correction Message: 82 bytes --------------------- */

/* ExecutionReport_TradeCorrectionMessage */
typedef ExecutionReportTradeCorrectionMessage {
  byte sending_time[8];
  byte order_id[8];
  byte cl_ord_id[16];
  byte exec_id[8];
  byte exec_ref_id[8];
  byte trd_match_id[8];
  byte ord_status;
  byte last_px[8];
  byte last_qty_optional[4];
  byte leaves_qty[4];
  byte cum_qty[4];
  byte link_id_optional[4];
  byte security_group
};

int execution_report_trade_correction_message_at;

/* every byte of Execution Report Trade Correction Message set to one value */
inline fill_execution_report_trade_correction_message(execution_report_trade_correction_message_record, execution_report_trade_correction_message_value) {
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.sending_time[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.order_id[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 16 -> execution_report_trade_correction_message_record.cl_ord_id[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.exec_id[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.exec_ref_id[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.trd_match_id[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_record.ord_status = execution_report_trade_correction_message_value;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.last_px[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.last_qty_optional[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.leaves_qty[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.cum_qty[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.link_id_optional[execution_report_trade_correction_message_at] = execution_report_trade_correction_message_value; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_record.security_group = execution_report_trade_correction_message_value;
  skip
}

/* each byte of Execution Report Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_trade_correction_message(execution_report_trade_correction_message_record, execution_report_trade_correction_message_base) {
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.sending_time[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 0 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.order_id[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 8 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 16 -> execution_report_trade_correction_message_record.cl_ord_id[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 16 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.exec_id[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 32 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.exec_ref_id[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 40 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.trd_match_id[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 48 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_record.ord_status = (execution_report_trade_correction_message_base + 56 + 1) % 256;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.last_px[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 57 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.last_qty_optional[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 65 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.leaves_qty[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 69 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.cum_qty[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 73 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.link_id_optional[execution_report_trade_correction_message_at] = (execution_report_trade_correction_message_base + 77 + execution_report_trade_correction_message_at + 1) % 256; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_record.security_group = (execution_report_trade_correction_message_base + 81 + 1) % 256;
  skip
}

/* Execution Report Trade Correction Message to the wire, 82 bytes from where the cursor stands */
inline encode_execution_report_trade_correction_message(execution_report_trade_correction_message_record) {
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> wire[at] = execution_report_trade_correction_message_record.sending_time[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> wire[at] = execution_report_trade_correction_message_record.order_id[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 16 -> wire[at] = execution_report_trade_correction_message_record.cl_ord_id[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> wire[at] = execution_report_trade_correction_message_record.exec_id[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> wire[at] = execution_report_trade_correction_message_record.exec_ref_id[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> wire[at] = execution_report_trade_correction_message_record.trd_match_id[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_trade_correction_message_record.ord_status; at = at + 1;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> wire[at] = execution_report_trade_correction_message_record.last_px[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> wire[at] = execution_report_trade_correction_message_record.last_qty_optional[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> wire[at] = execution_report_trade_correction_message_record.leaves_qty[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> wire[at] = execution_report_trade_correction_message_record.cum_qty[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> wire[at] = execution_report_trade_correction_message_record.link_id_optional[execution_report_trade_correction_message_at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_trade_correction_message_record.security_group; at = at + 1;
  skip
}

/* Execution Report Trade Correction Message off the wire, 82 bytes from where the cursor stands */
inline decode_execution_report_trade_correction_message(execution_report_trade_correction_message_record) {
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.sending_time[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.order_id[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 16 -> execution_report_trade_correction_message_record.cl_ord_id[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.exec_id[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.exec_ref_id[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.trd_match_id[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_record.ord_status = wire[at]; at = at + 1;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> execution_report_trade_correction_message_record.last_px[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.last_qty_optional[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.leaves_qty[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.cum_qty[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> execution_report_trade_correction_message_record.link_id_optional[execution_report_trade_correction_message_at] = wire[at]; at = at + 1; execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_record.security_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Execution Report Trade Correction Message is what was written, byte for byte */
inline equal_execution_report_trade_correction_message(execution_report_trade_correction_message_read, execution_report_trade_correction_message_written) {
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> assert(execution_report_trade_correction_message_read.sending_time[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.sending_time[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> assert(execution_report_trade_correction_message_read.order_id[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.order_id[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 16 -> assert(execution_report_trade_correction_message_read.cl_ord_id[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.cl_ord_id[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> assert(execution_report_trade_correction_message_read.exec_id[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.exec_id[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> assert(execution_report_trade_correction_message_read.exec_ref_id[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.exec_ref_id[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> assert(execution_report_trade_correction_message_read.trd_match_id[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.trd_match_id[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(execution_report_trade_correction_message_read.ord_status == execution_report_trade_correction_message_written.ord_status);
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 8 -> assert(execution_report_trade_correction_message_read.last_px[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.last_px[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> assert(execution_report_trade_correction_message_read.last_qty_optional[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.last_qty_optional[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> assert(execution_report_trade_correction_message_read.leaves_qty[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.leaves_qty[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> assert(execution_report_trade_correction_message_read.cum_qty[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.cum_qty[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  execution_report_trade_correction_message_at = 0;
  do
  :: execution_report_trade_correction_message_at < 4 -> assert(execution_report_trade_correction_message_read.link_id_optional[execution_report_trade_correction_message_at] == execution_report_trade_correction_message_written.link_id_optional[execution_report_trade_correction_message_at]); execution_report_trade_correction_message_at = execution_report_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(execution_report_trade_correction_message_read.security_group == execution_report_trade_correction_message_written.security_group);
  skip
}

/* ---- Execution Report Trade Break Message: 70 bytes -------------------------- */

/* ExecutionReport_TradeBreakMessage */
typedef ExecutionReportTradeBreakMessage {
  byte sending_time[8];
  byte order_id[8];
  byte cl_ord_id[16];
  byte exec_id[8];
  byte exec_ref_id[8];
  byte trd_match_id[8];
  byte ord_status;
  byte leaves_qty[4];
  byte cum_qty[4];
  byte link_id_optional[4];
  byte security_group
};

int execution_report_trade_break_message_at;

/* every byte of Execution Report Trade Break Message set to one value */
inline fill_execution_report_trade_break_message(execution_report_trade_break_message_record, execution_report_trade_break_message_value) {
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.sending_time[execution_report_trade_break_message_at] = execution_report_trade_break_message_value; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.order_id[execution_report_trade_break_message_at] = execution_report_trade_break_message_value; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 16 -> execution_report_trade_break_message_record.cl_ord_id[execution_report_trade_break_message_at] = execution_report_trade_break_message_value; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.exec_id[execution_report_trade_break_message_at] = execution_report_trade_break_message_value; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.exec_ref_id[execution_report_trade_break_message_at] = execution_report_trade_break_message_value; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.trd_match_id[execution_report_trade_break_message_at] = execution_report_trade_break_message_value; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_record.ord_status = execution_report_trade_break_message_value;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> execution_report_trade_break_message_record.leaves_qty[execution_report_trade_break_message_at] = execution_report_trade_break_message_value; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> execution_report_trade_break_message_record.cum_qty[execution_report_trade_break_message_at] = execution_report_trade_break_message_value; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> execution_report_trade_break_message_record.link_id_optional[execution_report_trade_break_message_at] = execution_report_trade_break_message_value; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_record.security_group = execution_report_trade_break_message_value;
  skip
}

/* each byte of Execution Report Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_trade_break_message(execution_report_trade_break_message_record, execution_report_trade_break_message_base) {
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.sending_time[execution_report_trade_break_message_at] = (execution_report_trade_break_message_base + 0 + execution_report_trade_break_message_at + 1) % 256; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.order_id[execution_report_trade_break_message_at] = (execution_report_trade_break_message_base + 8 + execution_report_trade_break_message_at + 1) % 256; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 16 -> execution_report_trade_break_message_record.cl_ord_id[execution_report_trade_break_message_at] = (execution_report_trade_break_message_base + 16 + execution_report_trade_break_message_at + 1) % 256; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.exec_id[execution_report_trade_break_message_at] = (execution_report_trade_break_message_base + 32 + execution_report_trade_break_message_at + 1) % 256; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.exec_ref_id[execution_report_trade_break_message_at] = (execution_report_trade_break_message_base + 40 + execution_report_trade_break_message_at + 1) % 256; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.trd_match_id[execution_report_trade_break_message_at] = (execution_report_trade_break_message_base + 48 + execution_report_trade_break_message_at + 1) % 256; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_record.ord_status = (execution_report_trade_break_message_base + 56 + 1) % 256;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> execution_report_trade_break_message_record.leaves_qty[execution_report_trade_break_message_at] = (execution_report_trade_break_message_base + 57 + execution_report_trade_break_message_at + 1) % 256; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> execution_report_trade_break_message_record.cum_qty[execution_report_trade_break_message_at] = (execution_report_trade_break_message_base + 61 + execution_report_trade_break_message_at + 1) % 256; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> execution_report_trade_break_message_record.link_id_optional[execution_report_trade_break_message_at] = (execution_report_trade_break_message_base + 65 + execution_report_trade_break_message_at + 1) % 256; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_record.security_group = (execution_report_trade_break_message_base + 69 + 1) % 256;
  skip
}

/* Execution Report Trade Break Message to the wire, 70 bytes from where the cursor stands */
inline encode_execution_report_trade_break_message(execution_report_trade_break_message_record) {
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> wire[at] = execution_report_trade_break_message_record.sending_time[execution_report_trade_break_message_at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> wire[at] = execution_report_trade_break_message_record.order_id[execution_report_trade_break_message_at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 16 -> wire[at] = execution_report_trade_break_message_record.cl_ord_id[execution_report_trade_break_message_at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> wire[at] = execution_report_trade_break_message_record.exec_id[execution_report_trade_break_message_at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> wire[at] = execution_report_trade_break_message_record.exec_ref_id[execution_report_trade_break_message_at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> wire[at] = execution_report_trade_break_message_record.trd_match_id[execution_report_trade_break_message_at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_trade_break_message_record.ord_status; at = at + 1;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> wire[at] = execution_report_trade_break_message_record.leaves_qty[execution_report_trade_break_message_at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> wire[at] = execution_report_trade_break_message_record.cum_qty[execution_report_trade_break_message_at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> wire[at] = execution_report_trade_break_message_record.link_id_optional[execution_report_trade_break_message_at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_trade_break_message_record.security_group; at = at + 1;
  skip
}

/* Execution Report Trade Break Message off the wire, 70 bytes from where the cursor stands */
inline decode_execution_report_trade_break_message(execution_report_trade_break_message_record) {
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.sending_time[execution_report_trade_break_message_at] = wire[at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.order_id[execution_report_trade_break_message_at] = wire[at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 16 -> execution_report_trade_break_message_record.cl_ord_id[execution_report_trade_break_message_at] = wire[at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.exec_id[execution_report_trade_break_message_at] = wire[at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.exec_ref_id[execution_report_trade_break_message_at] = wire[at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> execution_report_trade_break_message_record.trd_match_id[execution_report_trade_break_message_at] = wire[at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_record.ord_status = wire[at]; at = at + 1;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> execution_report_trade_break_message_record.leaves_qty[execution_report_trade_break_message_at] = wire[at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> execution_report_trade_break_message_record.cum_qty[execution_report_trade_break_message_at] = wire[at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> execution_report_trade_break_message_record.link_id_optional[execution_report_trade_break_message_at] = wire[at]; at = at + 1; execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_record.security_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Execution Report Trade Break Message is what was written, byte for byte */
inline equal_execution_report_trade_break_message(execution_report_trade_break_message_read, execution_report_trade_break_message_written) {
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> assert(execution_report_trade_break_message_read.sending_time[execution_report_trade_break_message_at] == execution_report_trade_break_message_written.sending_time[execution_report_trade_break_message_at]); execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> assert(execution_report_trade_break_message_read.order_id[execution_report_trade_break_message_at] == execution_report_trade_break_message_written.order_id[execution_report_trade_break_message_at]); execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 16 -> assert(execution_report_trade_break_message_read.cl_ord_id[execution_report_trade_break_message_at] == execution_report_trade_break_message_written.cl_ord_id[execution_report_trade_break_message_at]); execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> assert(execution_report_trade_break_message_read.exec_id[execution_report_trade_break_message_at] == execution_report_trade_break_message_written.exec_id[execution_report_trade_break_message_at]); execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> assert(execution_report_trade_break_message_read.exec_ref_id[execution_report_trade_break_message_at] == execution_report_trade_break_message_written.exec_ref_id[execution_report_trade_break_message_at]); execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 8 -> assert(execution_report_trade_break_message_read.trd_match_id[execution_report_trade_break_message_at] == execution_report_trade_break_message_written.trd_match_id[execution_report_trade_break_message_at]); execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  assert(execution_report_trade_break_message_read.ord_status == execution_report_trade_break_message_written.ord_status);
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> assert(execution_report_trade_break_message_read.leaves_qty[execution_report_trade_break_message_at] == execution_report_trade_break_message_written.leaves_qty[execution_report_trade_break_message_at]); execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> assert(execution_report_trade_break_message_read.cum_qty[execution_report_trade_break_message_at] == execution_report_trade_break_message_written.cum_qty[execution_report_trade_break_message_at]); execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  execution_report_trade_break_message_at = 0;
  do
  :: execution_report_trade_break_message_at < 4 -> assert(execution_report_trade_break_message_read.link_id_optional[execution_report_trade_break_message_at] == execution_report_trade_break_message_written.link_id_optional[execution_report_trade_break_message_at]); execution_report_trade_break_message_at = execution_report_trade_break_message_at + 1
  :: else -> break
  od;
  assert(execution_report_trade_break_message_read.security_group == execution_report_trade_break_message_written.security_group);
  skip
}

/* ---- Execution Report Restatement Message: 75 bytes -------------------------- */

/* ExecutionReport_RestatementMessage */
typedef ExecutionReportRestatementMessage {
  byte sending_time[8];
  byte order_id[8];
  byte cl_ord_id[16];
  byte exec_id[8];
  byte ord_status;
  byte last_px_optional[8];
  byte leaves_qty[4];
  byte cum_qty[4];
  byte last_shares[4];
  byte exec_restatement_reason;
  byte transact_time[8];
  byte extended_restatement_reason;
  byte link_id_optional[4]
};

int execution_report_restatement_message_at;

/* every byte of Execution Report Restatement Message set to one value */
inline fill_execution_report_restatement_message(execution_report_restatement_message_record, execution_report_restatement_message_value) {
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.sending_time[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.order_id[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 16 -> execution_report_restatement_message_record.cl_ord_id[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.exec_id[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_record.ord_status = execution_report_restatement_message_value;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.last_px_optional[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.leaves_qty[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.cum_qty[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.last_shares[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_record.exec_restatement_reason = execution_report_restatement_message_value;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.transact_time[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_record.extended_restatement_reason = execution_report_restatement_message_value;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.link_id_optional[execution_report_restatement_message_at] = execution_report_restatement_message_value; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Restatement Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_restatement_message(execution_report_restatement_message_record, execution_report_restatement_message_base) {
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.sending_time[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 0 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.order_id[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 8 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 16 -> execution_report_restatement_message_record.cl_ord_id[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 16 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.exec_id[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 32 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_record.ord_status = (execution_report_restatement_message_base + 40 + 1) % 256;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.last_px_optional[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 41 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.leaves_qty[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 49 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.cum_qty[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 53 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.last_shares[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 57 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_record.exec_restatement_reason = (execution_report_restatement_message_base + 61 + 1) % 256;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.transact_time[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 62 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_record.extended_restatement_reason = (execution_report_restatement_message_base + 70 + 1) % 256;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.link_id_optional[execution_report_restatement_message_at] = (execution_report_restatement_message_base + 71 + execution_report_restatement_message_at + 1) % 256; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Restatement Message to the wire, 75 bytes from where the cursor stands */
inline encode_execution_report_restatement_message(execution_report_restatement_message_record) {
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> wire[at] = execution_report_restatement_message_record.sending_time[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> wire[at] = execution_report_restatement_message_record.order_id[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 16 -> wire[at] = execution_report_restatement_message_record.cl_ord_id[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> wire[at] = execution_report_restatement_message_record.exec_id[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_restatement_message_record.ord_status; at = at + 1;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> wire[at] = execution_report_restatement_message_record.last_px_optional[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> wire[at] = execution_report_restatement_message_record.leaves_qty[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> wire[at] = execution_report_restatement_message_record.cum_qty[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> wire[at] = execution_report_restatement_message_record.last_shares[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_restatement_message_record.exec_restatement_reason; at = at + 1;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> wire[at] = execution_report_restatement_message_record.transact_time[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_restatement_message_record.extended_restatement_reason; at = at + 1;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> wire[at] = execution_report_restatement_message_record.link_id_optional[execution_report_restatement_message_at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Restatement Message off the wire, 75 bytes from where the cursor stands */
inline decode_execution_report_restatement_message(execution_report_restatement_message_record) {
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.sending_time[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.order_id[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 16 -> execution_report_restatement_message_record.cl_ord_id[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.exec_id[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_record.ord_status = wire[at]; at = at + 1;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.last_px_optional[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.leaves_qty[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.cum_qty[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.last_shares[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_record.exec_restatement_reason = wire[at]; at = at + 1;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> execution_report_restatement_message_record.transact_time[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_record.extended_restatement_reason = wire[at]; at = at + 1;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> execution_report_restatement_message_record.link_id_optional[execution_report_restatement_message_at] = wire[at]; at = at + 1; execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Restatement Message is what was written, byte for byte */
inline equal_execution_report_restatement_message(execution_report_restatement_message_read, execution_report_restatement_message_written) {
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> assert(execution_report_restatement_message_read.sending_time[execution_report_restatement_message_at] == execution_report_restatement_message_written.sending_time[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> assert(execution_report_restatement_message_read.order_id[execution_report_restatement_message_at] == execution_report_restatement_message_written.order_id[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 16 -> assert(execution_report_restatement_message_read.cl_ord_id[execution_report_restatement_message_at] == execution_report_restatement_message_written.cl_ord_id[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> assert(execution_report_restatement_message_read.exec_id[execution_report_restatement_message_at] == execution_report_restatement_message_written.exec_id[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  assert(execution_report_restatement_message_read.ord_status == execution_report_restatement_message_written.ord_status);
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> assert(execution_report_restatement_message_read.last_px_optional[execution_report_restatement_message_at] == execution_report_restatement_message_written.last_px_optional[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> assert(execution_report_restatement_message_read.leaves_qty[execution_report_restatement_message_at] == execution_report_restatement_message_written.leaves_qty[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> assert(execution_report_restatement_message_read.cum_qty[execution_report_restatement_message_at] == execution_report_restatement_message_written.cum_qty[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> assert(execution_report_restatement_message_read.last_shares[execution_report_restatement_message_at] == execution_report_restatement_message_written.last_shares[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  assert(execution_report_restatement_message_read.exec_restatement_reason == execution_report_restatement_message_written.exec_restatement_reason);
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 8 -> assert(execution_report_restatement_message_read.transact_time[execution_report_restatement_message_at] == execution_report_restatement_message_written.transact_time[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  assert(execution_report_restatement_message_read.extended_restatement_reason == execution_report_restatement_message_written.extended_restatement_reason);
  execution_report_restatement_message_at = 0;
  do
  :: execution_report_restatement_message_at < 4 -> assert(execution_report_restatement_message_read.link_id_optional[execution_report_restatement_message_at] == execution_report_restatement_message_written.link_id_optional[execution_report_restatement_message_at]); execution_report_restatement_message_at = execution_report_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Reject Message: 30 bytes ----------------------------------- */

/* OrderCancelRejectMessage */
typedef OrderCancelRejectMessage {
  byte sending_time[8];
  byte cl_ord_id[16];
  byte cxl_rej_response_to;
  byte cxl_rej_reason;
  byte link_id_optional[4]
};

int order_cancel_reject_message_at;

/* every byte of Order Cancel Reject Message set to one value */
inline fill_order_cancel_reject_message(order_cancel_reject_message_record, order_cancel_reject_message_value) {
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 8 -> order_cancel_reject_message_record.sending_time[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 16 -> order_cancel_reject_message_record.cl_ord_id[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_record.cxl_rej_response_to = order_cancel_reject_message_value;
  order_cancel_reject_message_record.cxl_rej_reason = order_cancel_reject_message_value;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.link_id_optional[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Reject Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_reject_message(order_cancel_reject_message_record, order_cancel_reject_message_base) {
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 8 -> order_cancel_reject_message_record.sending_time[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 0 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 16 -> order_cancel_reject_message_record.cl_ord_id[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 8 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_record.cxl_rej_response_to = (order_cancel_reject_message_base + 24 + 1) % 256;
  order_cancel_reject_message_record.cxl_rej_reason = (order_cancel_reject_message_base + 25 + 1) % 256;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.link_id_optional[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 26 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Reject Message to the wire, 30 bytes from where the cursor stands */
inline encode_order_cancel_reject_message(order_cancel_reject_message_record) {
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 8 -> wire[at] = order_cancel_reject_message_record.sending_time[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 16 -> wire[at] = order_cancel_reject_message_record.cl_ord_id[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_reject_message_record.cxl_rej_response_to; at = at + 1;
  wire[at] = order_cancel_reject_message_record.cxl_rej_reason; at = at + 1;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> wire[at] = order_cancel_reject_message_record.link_id_optional[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Reject Message off the wire, 30 bytes from where the cursor stands */
inline decode_order_cancel_reject_message(order_cancel_reject_message_record) {
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 8 -> order_cancel_reject_message_record.sending_time[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 16 -> order_cancel_reject_message_record.cl_ord_id[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_record.cxl_rej_response_to = wire[at]; at = at + 1;
  order_cancel_reject_message_record.cxl_rej_reason = wire[at]; at = at + 1;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.link_id_optional[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Reject Message is what was written, byte for byte */
inline equal_order_cancel_reject_message(order_cancel_reject_message_read, order_cancel_reject_message_written) {
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 8 -> assert(order_cancel_reject_message_read.sending_time[order_cancel_reject_message_at] == order_cancel_reject_message_written.sending_time[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 16 -> assert(order_cancel_reject_message_read.cl_ord_id[order_cancel_reject_message_at] == order_cancel_reject_message_written.cl_ord_id[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_reject_message_read.cxl_rej_response_to == order_cancel_reject_message_written.cxl_rej_response_to);
  assert(order_cancel_reject_message_read.cxl_rej_reason == order_cancel_reject_message_written.cxl_rej_reason);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> assert(order_cancel_reject_message_read.link_id_optional[order_cancel_reject_message_at] == order_cancel_reject_message_written.link_id_optional[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Reject Message: 56 bytes ------------------------------------ */

/* MassCancelRejectMessage */
typedef MassCancelRejectMessage {
  byte sending_time[8];
  byte cl_ord_id[16];
  byte symbol[6];
  byte symbol_sfx[6];
  byte side_optional;
  byte lower_than_price[8];
  byte higher_than_price[8];
  byte cancel_group_id[2];
  byte mass_cancel_reject_reason
};

int mass_cancel_reject_message_at;

/* every byte of Mass Cancel Reject Message set to one value */
inline fill_mass_cancel_reject_message(mass_cancel_reject_message_record, mass_cancel_reject_message_value) {
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> mass_cancel_reject_message_record.sending_time[mass_cancel_reject_message_at] = mass_cancel_reject_message_value; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 16 -> mass_cancel_reject_message_record.cl_ord_id[mass_cancel_reject_message_at] = mass_cancel_reject_message_value; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> mass_cancel_reject_message_record.symbol[mass_cancel_reject_message_at] = mass_cancel_reject_message_value; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> mass_cancel_reject_message_record.symbol_sfx[mass_cancel_reject_message_at] = mass_cancel_reject_message_value; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_record.side_optional = mass_cancel_reject_message_value;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> mass_cancel_reject_message_record.lower_than_price[mass_cancel_reject_message_at] = mass_cancel_reject_message_value; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> mass_cancel_reject_message_record.higher_than_price[mass_cancel_reject_message_at] = mass_cancel_reject_message_value; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 2 -> mass_cancel_reject_message_record.cancel_group_id[mass_cancel_reject_message_at] = mass_cancel_reject_message_value; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_record.mass_cancel_reject_reason = mass_cancel_reject_message_value;
  skip
}

/* each byte of Mass Cancel Reject Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_reject_message(mass_cancel_reject_message_record, mass_cancel_reject_message_base) {
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> mass_cancel_reject_message_record.sending_time[mass_cancel_reject_message_at] = (mass_cancel_reject_message_base + 0 + mass_cancel_reject_message_at + 1) % 256; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 16 -> mass_cancel_reject_message_record.cl_ord_id[mass_cancel_reject_message_at] = (mass_cancel_reject_message_base + 8 + mass_cancel_reject_message_at + 1) % 256; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> mass_cancel_reject_message_record.symbol[mass_cancel_reject_message_at] = (mass_cancel_reject_message_base + 24 + mass_cancel_reject_message_at + 1) % 256; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> mass_cancel_reject_message_record.symbol_sfx[mass_cancel_reject_message_at] = (mass_cancel_reject_message_base + 30 + mass_cancel_reject_message_at + 1) % 256; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_record.side_optional = (mass_cancel_reject_message_base + 36 + 1) % 256;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> mass_cancel_reject_message_record.lower_than_price[mass_cancel_reject_message_at] = (mass_cancel_reject_message_base + 37 + mass_cancel_reject_message_at + 1) % 256; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> mass_cancel_reject_message_record.higher_than_price[mass_cancel_reject_message_at] = (mass_cancel_reject_message_base + 45 + mass_cancel_reject_message_at + 1) % 256; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 2 -> mass_cancel_reject_message_record.cancel_group_id[mass_cancel_reject_message_at] = (mass_cancel_reject_message_base + 53 + mass_cancel_reject_message_at + 1) % 256; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_record.mass_cancel_reject_reason = (mass_cancel_reject_message_base + 55 + 1) % 256;
  skip
}

/* Mass Cancel Reject Message to the wire, 56 bytes from where the cursor stands */
inline encode_mass_cancel_reject_message(mass_cancel_reject_message_record) {
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> wire[at] = mass_cancel_reject_message_record.sending_time[mass_cancel_reject_message_at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 16 -> wire[at] = mass_cancel_reject_message_record.cl_ord_id[mass_cancel_reject_message_at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> wire[at] = mass_cancel_reject_message_record.symbol[mass_cancel_reject_message_at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> wire[at] = mass_cancel_reject_message_record.symbol_sfx[mass_cancel_reject_message_at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_reject_message_record.side_optional; at = at + 1;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> wire[at] = mass_cancel_reject_message_record.lower_than_price[mass_cancel_reject_message_at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> wire[at] = mass_cancel_reject_message_record.higher_than_price[mass_cancel_reject_message_at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 2 -> wire[at] = mass_cancel_reject_message_record.cancel_group_id[mass_cancel_reject_message_at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_reject_message_record.mass_cancel_reject_reason; at = at + 1;
  skip
}

/* Mass Cancel Reject Message off the wire, 56 bytes from where the cursor stands */
inline decode_mass_cancel_reject_message(mass_cancel_reject_message_record) {
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> mass_cancel_reject_message_record.sending_time[mass_cancel_reject_message_at] = wire[at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 16 -> mass_cancel_reject_message_record.cl_ord_id[mass_cancel_reject_message_at] = wire[at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> mass_cancel_reject_message_record.symbol[mass_cancel_reject_message_at] = wire[at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> mass_cancel_reject_message_record.symbol_sfx[mass_cancel_reject_message_at] = wire[at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_record.side_optional = wire[at]; at = at + 1;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> mass_cancel_reject_message_record.lower_than_price[mass_cancel_reject_message_at] = wire[at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> mass_cancel_reject_message_record.higher_than_price[mass_cancel_reject_message_at] = wire[at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 2 -> mass_cancel_reject_message_record.cancel_group_id[mass_cancel_reject_message_at] = wire[at]; at = at + 1; mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_record.mass_cancel_reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Cancel Reject Message is what was written, byte for byte */
inline equal_mass_cancel_reject_message(mass_cancel_reject_message_read, mass_cancel_reject_message_written) {
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> assert(mass_cancel_reject_message_read.sending_time[mass_cancel_reject_message_at] == mass_cancel_reject_message_written.sending_time[mass_cancel_reject_message_at]); mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 16 -> assert(mass_cancel_reject_message_read.cl_ord_id[mass_cancel_reject_message_at] == mass_cancel_reject_message_written.cl_ord_id[mass_cancel_reject_message_at]); mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> assert(mass_cancel_reject_message_read.symbol[mass_cancel_reject_message_at] == mass_cancel_reject_message_written.symbol[mass_cancel_reject_message_at]); mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 6 -> assert(mass_cancel_reject_message_read.symbol_sfx[mass_cancel_reject_message_at] == mass_cancel_reject_message_written.symbol_sfx[mass_cancel_reject_message_at]); mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_reject_message_read.side_optional == mass_cancel_reject_message_written.side_optional);
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> assert(mass_cancel_reject_message_read.lower_than_price[mass_cancel_reject_message_at] == mass_cancel_reject_message_written.lower_than_price[mass_cancel_reject_message_at]); mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 8 -> assert(mass_cancel_reject_message_read.higher_than_price[mass_cancel_reject_message_at] == mass_cancel_reject_message_written.higher_than_price[mass_cancel_reject_message_at]); mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_reject_message_at = 0;
  do
  :: mass_cancel_reject_message_at < 2 -> assert(mass_cancel_reject_message_read.cancel_group_id[mass_cancel_reject_message_at] == mass_cancel_reject_message_written.cancel_group_id[mass_cancel_reject_message_at]); mass_cancel_reject_message_at = mass_cancel_reject_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_reject_message_read.mass_cancel_reject_reason == mass_cancel_reject_message_written.mass_cancel_reject_reason);
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

/* Login Accepted Message: encoded, read back, and compared */
proctype check_login_accepted_message() {
  LoginAcceptedMessage login_accepted_message_sent;
  LoginAcceptedMessage login_accepted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_accepted_message(login_accepted_message_sent, 0)
  :: pattern == 1 -> fill_login_accepted_message(login_accepted_message_sent, 32)
  :: pattern == 2 -> fill_login_accepted_message(login_accepted_message_sent, 255)
  :: else -> ramp_login_accepted_message(login_accepted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_accepted_message(login_accepted_message_sent);
    assert(at == 1);
    at = 0;
    decode_login_accepted_message(login_accepted_message_got);
    assert(at == 1);
    equal_login_accepted_message(login_accepted_message_got, login_accepted_message_sent)
  }
}

/* Login Rejected Message: encoded, read back, and compared */
proctype check_login_rejected_message() {
  LoginRejectedMessage login_rejected_message_sent;
  LoginRejectedMessage login_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_rejected_message(login_rejected_message_sent, 0)
  :: pattern == 1 -> fill_login_rejected_message(login_rejected_message_sent, 32)
  :: pattern == 2 -> fill_login_rejected_message(login_rejected_message_sent, 255)
  :: else -> ramp_login_rejected_message(login_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_rejected_message(login_rejected_message_sent);
    assert(at == 1);
    at = 0;
    decode_login_rejected_message(login_rejected_message_got);
    assert(at == 1);
    equal_login_rejected_message(login_rejected_message_got, login_rejected_message_sent)
  }
}

/* Start Of Session Message: encoded, read back, and compared */
proctype check_start_of_session_message() {
  StartOfSessionMessage start_of_session_message_sent;
  StartOfSessionMessage start_of_session_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_session_message(start_of_session_message_sent, 0)
  :: pattern == 1 -> fill_start_of_session_message(start_of_session_message_sent, 32)
  :: pattern == 2 -> fill_start_of_session_message(start_of_session_message_sent, 255)
  :: else -> ramp_start_of_session_message(start_of_session_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_session_message(start_of_session_message_sent);
    assert(at == 8);
    at = 0;
    decode_start_of_session_message(start_of_session_message_got);
    assert(at == 8);
    equal_start_of_session_message(start_of_session_message_got, start_of_session_message_sent)
  }
}

/* Replay Begin Message: encoded, read back, and compared */
proctype check_replay_begin_message() {
  ReplayBeginMessage replay_begin_message_sent;
  ReplayBeginMessage replay_begin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_begin_message(replay_begin_message_sent, 0)
  :: pattern == 1 -> fill_replay_begin_message(replay_begin_message_sent, 32)
  :: pattern == 2 -> fill_replay_begin_message(replay_begin_message_sent, 255)
  :: else -> ramp_replay_begin_message(replay_begin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_begin_message(replay_begin_message_sent);
    assert(at == 12);
    at = 0;
    decode_replay_begin_message(replay_begin_message_got);
    assert(at == 12);
    equal_replay_begin_message(replay_begin_message_got, replay_begin_message_sent)
  }
}

/* Replay Rejected Message: encoded, read back, and compared */
proctype check_replay_rejected_message() {
  ReplayRejectedMessage replay_rejected_message_sent;
  ReplayRejectedMessage replay_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_rejected_message(replay_rejected_message_sent, 0)
  :: pattern == 1 -> fill_replay_rejected_message(replay_rejected_message_sent, 32)
  :: pattern == 2 -> fill_replay_rejected_message(replay_rejected_message_sent, 255)
  :: else -> ramp_replay_rejected_message(replay_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_rejected_message(replay_rejected_message_sent);
    assert(at == 1);
    at = 0;
    decode_replay_rejected_message(replay_rejected_message_got);
    assert(at == 1);
    equal_replay_rejected_message(replay_rejected_message_got, replay_rejected_message_sent)
  }
}

/* Replay Complete Message: encoded, read back, and compared */
proctype check_replay_complete_message() {
  ReplayCompleteMessage replay_complete_message_sent;
  ReplayCompleteMessage replay_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_complete_message(replay_complete_message_sent, 0)
  :: pattern == 1 -> fill_replay_complete_message(replay_complete_message_sent, 32)
  :: pattern == 2 -> fill_replay_complete_message(replay_complete_message_sent, 255)
  :: else -> ramp_replay_complete_message(replay_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_complete_message(replay_complete_message_sent);
    assert(at == 8);
    at = 0;
    decode_replay_complete_message(replay_complete_message_got);
    assert(at == 8);
    equal_replay_complete_message(replay_complete_message_got, replay_complete_message_sent)
  }
}

/* Stream Begin Message: encoded, read back, and compared */
proctype check_stream_begin_message() {
  StreamBeginMessage stream_begin_message_sent;
  StreamBeginMessage stream_begin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_begin_message(stream_begin_message_sent, 0)
  :: pattern == 1 -> fill_stream_begin_message(stream_begin_message_sent, 32)
  :: pattern == 2 -> fill_stream_begin_message(stream_begin_message_sent, 255)
  :: else -> ramp_stream_begin_message(stream_begin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_begin_message(stream_begin_message_sent);
    assert(at == 16);
    at = 0;
    decode_stream_begin_message(stream_begin_message_got);
    assert(at == 16);
    equal_stream_begin_message(stream_begin_message_got, stream_begin_message_sent)
  }
}

/* Stream Rejected Message: encoded, read back, and compared */
proctype check_stream_rejected_message() {
  StreamRejectedMessage stream_rejected_message_sent;
  StreamRejectedMessage stream_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_rejected_message(stream_rejected_message_sent, 0)
  :: pattern == 1 -> fill_stream_rejected_message(stream_rejected_message_sent, 32)
  :: pattern == 2 -> fill_stream_rejected_message(stream_rejected_message_sent, 255)
  :: else -> ramp_stream_rejected_message(stream_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_rejected_message(stream_rejected_message_sent);
    assert(at == 1);
    at = 0;
    decode_stream_rejected_message(stream_rejected_message_got);
    assert(at == 1);
    equal_stream_rejected_message(stream_rejected_message_got, stream_rejected_message_sent)
  }
}

/* Stream Complete Message: encoded, read back, and compared */
proctype check_stream_complete_message() {
  StreamCompleteMessage stream_complete_message_sent;
  StreamCompleteMessage stream_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_complete_message(stream_complete_message_sent, 0)
  :: pattern == 1 -> fill_stream_complete_message(stream_complete_message_sent, 32)
  :: pattern == 2 -> fill_stream_complete_message(stream_complete_message_sent, 255)
  :: else -> ramp_stream_complete_message(stream_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_complete_message(stream_complete_message_sent);
    assert(at == 8);
    at = 0;
    decode_stream_complete_message(stream_complete_message_got);
    assert(at == 8);
    equal_stream_complete_message(stream_complete_message_got, stream_complete_message_sent)
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

/* Execution Report Rejected Message: encoded, read back, and compared */
proctype check_execution_report_rejected_message() {
  ExecutionReportRejectedMessage execution_report_rejected_message_sent;
  ExecutionReportRejectedMessage execution_report_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_rejected_message(execution_report_rejected_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_rejected_message(execution_report_rejected_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_rejected_message(execution_report_rejected_message_sent, 255)
  :: else -> ramp_execution_report_rejected_message(execution_report_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_rejected_message(execution_report_rejected_message_sent);
    assert(at == 58);
    at = 0;
    decode_execution_report_rejected_message(execution_report_rejected_message_got);
    assert(at == 58);
    equal_execution_report_rejected_message(execution_report_rejected_message_got, execution_report_rejected_message_sent)
  }
}

/* Execution Report Trade Message: encoded, read back, and compared */
proctype check_execution_report_trade_message() {
  ExecutionReportTradeMessage execution_report_trade_message_sent;
  ExecutionReportTradeMessage execution_report_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_trade_message(execution_report_trade_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_trade_message(execution_report_trade_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_trade_message(execution_report_trade_message_sent, 255)
  :: else -> ramp_execution_report_trade_message(execution_report_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_trade_message(execution_report_trade_message_sent);
    assert(at == 84);
    at = 0;
    decode_execution_report_trade_message(execution_report_trade_message_got);
    assert(at == 84);
    equal_execution_report_trade_message(execution_report_trade_message_got, execution_report_trade_message_sent)
  }
}

/* Execution Report Pending Cancel Message: encoded, read back, and compared */
proctype check_execution_report_pending_cancel_message() {
  ExecutionReportPendingCancelMessage execution_report_pending_cancel_message_sent;
  ExecutionReportPendingCancelMessage execution_report_pending_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_pending_cancel_message(execution_report_pending_cancel_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_pending_cancel_message(execution_report_pending_cancel_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_pending_cancel_message(execution_report_pending_cancel_message_sent, 255)
  :: else -> ramp_execution_report_pending_cancel_message(execution_report_pending_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_pending_cancel_message(execution_report_pending_cancel_message_sent);
    assert(at == 81);
    at = 0;
    decode_execution_report_pending_cancel_message(execution_report_pending_cancel_message_got);
    assert(at == 81);
    equal_execution_report_pending_cancel_message(execution_report_pending_cancel_message_got, execution_report_pending_cancel_message_sent)
  }
}

/* Pending Mass Cancel Message: encoded, read back, and compared */
proctype check_pending_mass_cancel_message() {
  PendingMassCancelMessage pending_mass_cancel_message_sent;
  PendingMassCancelMessage pending_mass_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_pending_mass_cancel_message(pending_mass_cancel_message_sent, 0)
  :: pattern == 1 -> fill_pending_mass_cancel_message(pending_mass_cancel_message_sent, 32)
  :: pattern == 2 -> fill_pending_mass_cancel_message(pending_mass_cancel_message_sent, 255)
  :: else -> ramp_pending_mass_cancel_message(pending_mass_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_pending_mass_cancel_message(pending_mass_cancel_message_sent);
    assert(at == 55);
    at = 0;
    decode_pending_mass_cancel_message(pending_mass_cancel_message_got);
    assert(at == 55);
    equal_pending_mass_cancel_message(pending_mass_cancel_message_got, pending_mass_cancel_message_sent)
  }
}

/* Execution Report Canceled Message: encoded, read back, and compared */
proctype check_execution_report_canceled_message() {
  ExecutionReportCanceledMessage execution_report_canceled_message_sent;
  ExecutionReportCanceledMessage execution_report_canceled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_canceled_message(execution_report_canceled_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_canceled_message(execution_report_canceled_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_canceled_message(execution_report_canceled_message_sent, 255)
  :: else -> ramp_execution_report_canceled_message(execution_report_canceled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_canceled_message(execution_report_canceled_message_sent);
    assert(at == 78);
    at = 0;
    decode_execution_report_canceled_message(execution_report_canceled_message_got);
    assert(at == 78);
    equal_execution_report_canceled_message(execution_report_canceled_message_got, execution_report_canceled_message_sent)
  }
}

/* Mass Cancel Done Message: encoded, read back, and compared */
proctype check_mass_cancel_done_message() {
  MassCancelDoneMessage mass_cancel_done_message_sent;
  MassCancelDoneMessage mass_cancel_done_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_done_message(mass_cancel_done_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_done_message(mass_cancel_done_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_done_message(mass_cancel_done_message_sent, 255)
  :: else -> ramp_mass_cancel_done_message(mass_cancel_done_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_done_message(mass_cancel_done_message_sent);
    assert(at == 24);
    at = 0;
    decode_mass_cancel_done_message(mass_cancel_done_message_got);
    assert(at == 24);
    equal_mass_cancel_done_message(mass_cancel_done_message_got, mass_cancel_done_message_sent)
  }
}

/* Execution Report Pending Replace Message: encoded, read back, and compared */
proctype check_execution_report_pending_replace_message() {
  ExecutionReportPendingReplaceMessage execution_report_pending_replace_message_sent;
  ExecutionReportPendingReplaceMessage execution_report_pending_replace_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_pending_replace_message(execution_report_pending_replace_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_pending_replace_message(execution_report_pending_replace_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_pending_replace_message(execution_report_pending_replace_message_sent, 255)
  :: else -> ramp_execution_report_pending_replace_message(execution_report_pending_replace_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_pending_replace_message(execution_report_pending_replace_message_sent);
    assert(at == 100);
    at = 0;
    decode_execution_report_pending_replace_message(execution_report_pending_replace_message_got);
    assert(at == 100);
    equal_execution_report_pending_replace_message(execution_report_pending_replace_message_got, execution_report_pending_replace_message_sent)
  }
}

/* Execution Report Replaced Message: encoded, read back, and compared */
proctype check_execution_report_replaced_message() {
  ExecutionReportReplacedMessage execution_report_replaced_message_sent;
  ExecutionReportReplacedMessage execution_report_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_replaced_message(execution_report_replaced_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_replaced_message(execution_report_replaced_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_replaced_message(execution_report_replaced_message_sent, 255)
  :: else -> ramp_execution_report_replaced_message(execution_report_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_replaced_message(execution_report_replaced_message_sent);
    assert(at == 108);
    at = 0;
    decode_execution_report_replaced_message(execution_report_replaced_message_got);
    assert(at == 108);
    equal_execution_report_replaced_message(execution_report_replaced_message_got, execution_report_replaced_message_sent)
  }
}

/* Execution Report Trade Correction Message: encoded, read back, and compared */
proctype check_execution_report_trade_correction_message() {
  ExecutionReportTradeCorrectionMessage execution_report_trade_correction_message_sent;
  ExecutionReportTradeCorrectionMessage execution_report_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_trade_correction_message(execution_report_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_trade_correction_message(execution_report_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_trade_correction_message(execution_report_trade_correction_message_sent, 255)
  :: else -> ramp_execution_report_trade_correction_message(execution_report_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_trade_correction_message(execution_report_trade_correction_message_sent);
    assert(at == 82);
    at = 0;
    decode_execution_report_trade_correction_message(execution_report_trade_correction_message_got);
    assert(at == 82);
    equal_execution_report_trade_correction_message(execution_report_trade_correction_message_got, execution_report_trade_correction_message_sent)
  }
}

/* Execution Report Trade Break Message: encoded, read back, and compared */
proctype check_execution_report_trade_break_message() {
  ExecutionReportTradeBreakMessage execution_report_trade_break_message_sent;
  ExecutionReportTradeBreakMessage execution_report_trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_trade_break_message(execution_report_trade_break_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_trade_break_message(execution_report_trade_break_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_trade_break_message(execution_report_trade_break_message_sent, 255)
  :: else -> ramp_execution_report_trade_break_message(execution_report_trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_trade_break_message(execution_report_trade_break_message_sent);
    assert(at == 70);
    at = 0;
    decode_execution_report_trade_break_message(execution_report_trade_break_message_got);
    assert(at == 70);
    equal_execution_report_trade_break_message(execution_report_trade_break_message_got, execution_report_trade_break_message_sent)
  }
}

/* Execution Report Restatement Message: encoded, read back, and compared */
proctype check_execution_report_restatement_message() {
  ExecutionReportRestatementMessage execution_report_restatement_message_sent;
  ExecutionReportRestatementMessage execution_report_restatement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_restatement_message(execution_report_restatement_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_restatement_message(execution_report_restatement_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_restatement_message(execution_report_restatement_message_sent, 255)
  :: else -> ramp_execution_report_restatement_message(execution_report_restatement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_restatement_message(execution_report_restatement_message_sent);
    assert(at == 75);
    at = 0;
    decode_execution_report_restatement_message(execution_report_restatement_message_got);
    assert(at == 75);
    equal_execution_report_restatement_message(execution_report_restatement_message_got, execution_report_restatement_message_sent)
  }
}

/* Order Cancel Reject Message: encoded, read back, and compared */
proctype check_order_cancel_reject_message() {
  OrderCancelRejectMessage order_cancel_reject_message_sent;
  OrderCancelRejectMessage order_cancel_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_reject_message(order_cancel_reject_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_reject_message(order_cancel_reject_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_reject_message(order_cancel_reject_message_sent, 255)
  :: else -> ramp_order_cancel_reject_message(order_cancel_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_reject_message(order_cancel_reject_message_sent);
    assert(at == 30);
    at = 0;
    decode_order_cancel_reject_message(order_cancel_reject_message_got);
    assert(at == 30);
    equal_order_cancel_reject_message(order_cancel_reject_message_got, order_cancel_reject_message_sent)
  }
}

/* Mass Cancel Reject Message: encoded, read back, and compared */
proctype check_mass_cancel_reject_message() {
  MassCancelRejectMessage mass_cancel_reject_message_sent;
  MassCancelRejectMessage mass_cancel_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_reject_message(mass_cancel_reject_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_reject_message(mass_cancel_reject_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_reject_message(mass_cancel_reject_message_sent, 255)
  :: else -> ramp_mass_cancel_reject_message(mass_cancel_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_reject_message(mass_cancel_reject_message_sent);
    assert(at == 56);
    at = 0;
    decode_mass_cancel_reject_message(mass_cancel_reject_message_got);
    assert(at == 56);
    equal_mass_cancel_reject_message(mass_cancel_reject_message_got, mass_cancel_reject_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_common_header()
  :: run check_login_accepted_message()
  :: run check_login_rejected_message()
  :: run check_start_of_session_message()
  :: run check_replay_begin_message()
  :: run check_replay_rejected_message()
  :: run check_replay_complete_message()
  :: run check_stream_begin_message()
  :: run check_stream_rejected_message()
  :: run check_stream_complete_message()
  :: run check_sbe_header()
  :: run check_execution_report_rejected_message()
  :: run check_execution_report_trade_message()
  :: run check_execution_report_pending_cancel_message()
  :: run check_pending_mass_cancel_message()
  :: run check_execution_report_canceled_message()
  :: run check_mass_cancel_done_message()
  :: run check_execution_report_pending_replace_message()
  :: run check_execution_report_replaced_message()
  :: run check_execution_report_trade_correction_message()
  :: run check_execution_report_trade_break_message()
  :: run check_execution_report_restatement_message()
  :: run check_order_cancel_reject_message()
  :: run check_mass_cancel_reject_message()
  fi
}
