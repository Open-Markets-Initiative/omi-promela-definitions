/*
 * The Members Exchange Risk Control
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
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 67

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

/* ---- Active Risk Threshold State Message: 34 bytes --------------------------- */

/* ActiveRiskThresholdStateMessage */
typedef ActiveRiskThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier[6];
  byte efid[4];
  byte threshold_quantity[4]
};

int active_risk_threshold_state_message_at;

/* every byte of Active Risk Threshold State Message set to one value */
inline fill_active_risk_threshold_state_message(active_risk_threshold_state_message_record, active_risk_threshold_state_message_value) {
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 20 -> active_risk_threshold_state_message_record.cl_ord_id_optional[active_risk_threshold_state_message_at] = active_risk_threshold_state_message_value; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 6 -> active_risk_threshold_state_message_record.underlier[active_risk_threshold_state_message_at] = active_risk_threshold_state_message_value; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> active_risk_threshold_state_message_record.efid[active_risk_threshold_state_message_at] = active_risk_threshold_state_message_value; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> active_risk_threshold_state_message_record.threshold_quantity[active_risk_threshold_state_message_at] = active_risk_threshold_state_message_value; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Risk Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_active_risk_threshold_state_message(active_risk_threshold_state_message_record, active_risk_threshold_state_message_base) {
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 20 -> active_risk_threshold_state_message_record.cl_ord_id_optional[active_risk_threshold_state_message_at] = (active_risk_threshold_state_message_base + 0 + active_risk_threshold_state_message_at + 1) % 256; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 6 -> active_risk_threshold_state_message_record.underlier[active_risk_threshold_state_message_at] = (active_risk_threshold_state_message_base + 20 + active_risk_threshold_state_message_at + 1) % 256; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> active_risk_threshold_state_message_record.efid[active_risk_threshold_state_message_at] = (active_risk_threshold_state_message_base + 26 + active_risk_threshold_state_message_at + 1) % 256; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> active_risk_threshold_state_message_record.threshold_quantity[active_risk_threshold_state_message_at] = (active_risk_threshold_state_message_base + 30 + active_risk_threshold_state_message_at + 1) % 256; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Threshold State Message to the wire, 34 bytes from where the cursor stands */
inline encode_active_risk_threshold_state_message(active_risk_threshold_state_message_record) {
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 20 -> wire[at] = active_risk_threshold_state_message_record.cl_ord_id_optional[active_risk_threshold_state_message_at]; at = at + 1; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 6 -> wire[at] = active_risk_threshold_state_message_record.underlier[active_risk_threshold_state_message_at]; at = at + 1; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> wire[at] = active_risk_threshold_state_message_record.efid[active_risk_threshold_state_message_at]; at = at + 1; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> wire[at] = active_risk_threshold_state_message_record.threshold_quantity[active_risk_threshold_state_message_at]; at = at + 1; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Threshold State Message off the wire, 34 bytes from where the cursor stands */
inline decode_active_risk_threshold_state_message(active_risk_threshold_state_message_record) {
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 20 -> active_risk_threshold_state_message_record.cl_ord_id_optional[active_risk_threshold_state_message_at] = wire[at]; at = at + 1; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 6 -> active_risk_threshold_state_message_record.underlier[active_risk_threshold_state_message_at] = wire[at]; at = at + 1; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> active_risk_threshold_state_message_record.efid[active_risk_threshold_state_message_at] = wire[at]; at = at + 1; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> active_risk_threshold_state_message_record.threshold_quantity[active_risk_threshold_state_message_at] = wire[at]; at = at + 1; active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Risk Threshold State Message is what was written, byte for byte */
inline equal_active_risk_threshold_state_message(active_risk_threshold_state_message_read, active_risk_threshold_state_message_written) {
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 20 -> assert(active_risk_threshold_state_message_read.cl_ord_id_optional[active_risk_threshold_state_message_at] == active_risk_threshold_state_message_written.cl_ord_id_optional[active_risk_threshold_state_message_at]); active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 6 -> assert(active_risk_threshold_state_message_read.underlier[active_risk_threshold_state_message_at] == active_risk_threshold_state_message_written.underlier[active_risk_threshold_state_message_at]); active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> assert(active_risk_threshold_state_message_read.efid[active_risk_threshold_state_message_at] == active_risk_threshold_state_message_written.efid[active_risk_threshold_state_message_at]); active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_state_message_at = 0;
  do
  :: active_risk_threshold_state_message_at < 4 -> assert(active_risk_threshold_state_message_read.threshold_quantity[active_risk_threshold_state_message_at] == active_risk_threshold_state_message_written.threshold_quantity[active_risk_threshold_state_message_at]); active_risk_threshold_state_message_at = active_risk_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Active Risk Threshold Change Rej Message: 36 bytes ---------------------- */

/* ActiveRiskThresholdChangeRejMessage */
typedef ActiveRiskThresholdChangeRejMessage {
  byte cl_ord_id[20];
  byte underlier_active_risk_threshold_change_rej_underlier[6];
  byte efid_active_risk_threshold_change_rej_efid[4];
  byte threshold_quantity[4];
  byte reject_reason[2]
};

int active_risk_threshold_change_rej_message_at;

/* every byte of Active Risk Threshold Change Rej Message set to one value */
inline fill_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_record, active_risk_threshold_change_rej_message_value) {
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 20 -> active_risk_threshold_change_rej_message_record.cl_ord_id[active_risk_threshold_change_rej_message_at] = active_risk_threshold_change_rej_message_value; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 6 -> active_risk_threshold_change_rej_message_record.underlier_active_risk_threshold_change_rej_underlier[active_risk_threshold_change_rej_message_at] = active_risk_threshold_change_rej_message_value; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> active_risk_threshold_change_rej_message_record.efid_active_risk_threshold_change_rej_efid[active_risk_threshold_change_rej_message_at] = active_risk_threshold_change_rej_message_value; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> active_risk_threshold_change_rej_message_record.threshold_quantity[active_risk_threshold_change_rej_message_at] = active_risk_threshold_change_rej_message_value; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 2 -> active_risk_threshold_change_rej_message_record.reject_reason[active_risk_threshold_change_rej_message_at] = active_risk_threshold_change_rej_message_value; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Risk Threshold Change Rej Message set to where it lies, so a field read out of place says so */
inline ramp_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_record, active_risk_threshold_change_rej_message_base) {
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 20 -> active_risk_threshold_change_rej_message_record.cl_ord_id[active_risk_threshold_change_rej_message_at] = (active_risk_threshold_change_rej_message_base + 0 + active_risk_threshold_change_rej_message_at + 1) % 256; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 6 -> active_risk_threshold_change_rej_message_record.underlier_active_risk_threshold_change_rej_underlier[active_risk_threshold_change_rej_message_at] = (active_risk_threshold_change_rej_message_base + 20 + active_risk_threshold_change_rej_message_at + 1) % 256; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> active_risk_threshold_change_rej_message_record.efid_active_risk_threshold_change_rej_efid[active_risk_threshold_change_rej_message_at] = (active_risk_threshold_change_rej_message_base + 26 + active_risk_threshold_change_rej_message_at + 1) % 256; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> active_risk_threshold_change_rej_message_record.threshold_quantity[active_risk_threshold_change_rej_message_at] = (active_risk_threshold_change_rej_message_base + 30 + active_risk_threshold_change_rej_message_at + 1) % 256; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 2 -> active_risk_threshold_change_rej_message_record.reject_reason[active_risk_threshold_change_rej_message_at] = (active_risk_threshold_change_rej_message_base + 34 + active_risk_threshold_change_rej_message_at + 1) % 256; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Threshold Change Rej Message to the wire, 36 bytes from where the cursor stands */
inline encode_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_record) {
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 20 -> wire[at] = active_risk_threshold_change_rej_message_record.cl_ord_id[active_risk_threshold_change_rej_message_at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 6 -> wire[at] = active_risk_threshold_change_rej_message_record.underlier_active_risk_threshold_change_rej_underlier[active_risk_threshold_change_rej_message_at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> wire[at] = active_risk_threshold_change_rej_message_record.efid_active_risk_threshold_change_rej_efid[active_risk_threshold_change_rej_message_at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> wire[at] = active_risk_threshold_change_rej_message_record.threshold_quantity[active_risk_threshold_change_rej_message_at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 2 -> wire[at] = active_risk_threshold_change_rej_message_record.reject_reason[active_risk_threshold_change_rej_message_at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Threshold Change Rej Message off the wire, 36 bytes from where the cursor stands */
inline decode_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_record) {
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 20 -> active_risk_threshold_change_rej_message_record.cl_ord_id[active_risk_threshold_change_rej_message_at] = wire[at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 6 -> active_risk_threshold_change_rej_message_record.underlier_active_risk_threshold_change_rej_underlier[active_risk_threshold_change_rej_message_at] = wire[at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> active_risk_threshold_change_rej_message_record.efid_active_risk_threshold_change_rej_efid[active_risk_threshold_change_rej_message_at] = wire[at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> active_risk_threshold_change_rej_message_record.threshold_quantity[active_risk_threshold_change_rej_message_at] = wire[at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 2 -> active_risk_threshold_change_rej_message_record.reject_reason[active_risk_threshold_change_rej_message_at] = wire[at]; at = at + 1; active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Risk Threshold Change Rej Message is what was written, byte for byte */
inline equal_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_read, active_risk_threshold_change_rej_message_written) {
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 20 -> assert(active_risk_threshold_change_rej_message_read.cl_ord_id[active_risk_threshold_change_rej_message_at] == active_risk_threshold_change_rej_message_written.cl_ord_id[active_risk_threshold_change_rej_message_at]); active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 6 -> assert(active_risk_threshold_change_rej_message_read.underlier_active_risk_threshold_change_rej_underlier[active_risk_threshold_change_rej_message_at] == active_risk_threshold_change_rej_message_written.underlier_active_risk_threshold_change_rej_underlier[active_risk_threshold_change_rej_message_at]); active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> assert(active_risk_threshold_change_rej_message_read.efid_active_risk_threshold_change_rej_efid[active_risk_threshold_change_rej_message_at] == active_risk_threshold_change_rej_message_written.efid_active_risk_threshold_change_rej_efid[active_risk_threshold_change_rej_message_at]); active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 4 -> assert(active_risk_threshold_change_rej_message_read.threshold_quantity[active_risk_threshold_change_rej_message_at] == active_risk_threshold_change_rej_message_written.threshold_quantity[active_risk_threshold_change_rej_message_at]); active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_rej_message_at = 0;
  do
  :: active_risk_threshold_change_rej_message_at < 2 -> assert(active_risk_threshold_change_rej_message_read.reject_reason[active_risk_threshold_change_rej_message_at] == active_risk_threshold_change_rej_message_written.reject_reason[active_risk_threshold_change_rej_message_at]); active_risk_threshold_change_rej_message_at = active_risk_threshold_change_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Active Risk Acknowledged Message: 38 bytes ------------------------------ */

/* ActiveRiskAcknowledgedMessage */
typedef ActiveRiskAcknowledgedMessage {
  byte cl_ord_id[20];
  byte underlier[6];
  byte efid[4];
  byte quantity[4];
  byte un_acked_quantity[4]
};

int active_risk_acknowledged_message_at;

/* every byte of Active Risk Acknowledged Message set to one value */
inline fill_active_risk_acknowledged_message(active_risk_acknowledged_message_record, active_risk_acknowledged_message_value) {
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 20 -> active_risk_acknowledged_message_record.cl_ord_id[active_risk_acknowledged_message_at] = active_risk_acknowledged_message_value; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 6 -> active_risk_acknowledged_message_record.underlier[active_risk_acknowledged_message_at] = active_risk_acknowledged_message_value; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> active_risk_acknowledged_message_record.efid[active_risk_acknowledged_message_at] = active_risk_acknowledged_message_value; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> active_risk_acknowledged_message_record.quantity[active_risk_acknowledged_message_at] = active_risk_acknowledged_message_value; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> active_risk_acknowledged_message_record.un_acked_quantity[active_risk_acknowledged_message_at] = active_risk_acknowledged_message_value; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Risk Acknowledged Message set to where it lies, so a field read out of place says so */
inline ramp_active_risk_acknowledged_message(active_risk_acknowledged_message_record, active_risk_acknowledged_message_base) {
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 20 -> active_risk_acknowledged_message_record.cl_ord_id[active_risk_acknowledged_message_at] = (active_risk_acknowledged_message_base + 0 + active_risk_acknowledged_message_at + 1) % 256; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 6 -> active_risk_acknowledged_message_record.underlier[active_risk_acknowledged_message_at] = (active_risk_acknowledged_message_base + 20 + active_risk_acknowledged_message_at + 1) % 256; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> active_risk_acknowledged_message_record.efid[active_risk_acknowledged_message_at] = (active_risk_acknowledged_message_base + 26 + active_risk_acknowledged_message_at + 1) % 256; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> active_risk_acknowledged_message_record.quantity[active_risk_acknowledged_message_at] = (active_risk_acknowledged_message_base + 30 + active_risk_acknowledged_message_at + 1) % 256; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> active_risk_acknowledged_message_record.un_acked_quantity[active_risk_acknowledged_message_at] = (active_risk_acknowledged_message_base + 34 + active_risk_acknowledged_message_at + 1) % 256; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Acknowledged Message to the wire, 38 bytes from where the cursor stands */
inline encode_active_risk_acknowledged_message(active_risk_acknowledged_message_record) {
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 20 -> wire[at] = active_risk_acknowledged_message_record.cl_ord_id[active_risk_acknowledged_message_at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 6 -> wire[at] = active_risk_acknowledged_message_record.underlier[active_risk_acknowledged_message_at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> wire[at] = active_risk_acknowledged_message_record.efid[active_risk_acknowledged_message_at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> wire[at] = active_risk_acknowledged_message_record.quantity[active_risk_acknowledged_message_at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> wire[at] = active_risk_acknowledged_message_record.un_acked_quantity[active_risk_acknowledged_message_at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Acknowledged Message off the wire, 38 bytes from where the cursor stands */
inline decode_active_risk_acknowledged_message(active_risk_acknowledged_message_record) {
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 20 -> active_risk_acknowledged_message_record.cl_ord_id[active_risk_acknowledged_message_at] = wire[at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 6 -> active_risk_acknowledged_message_record.underlier[active_risk_acknowledged_message_at] = wire[at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> active_risk_acknowledged_message_record.efid[active_risk_acknowledged_message_at] = wire[at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> active_risk_acknowledged_message_record.quantity[active_risk_acknowledged_message_at] = wire[at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> active_risk_acknowledged_message_record.un_acked_quantity[active_risk_acknowledged_message_at] = wire[at]; at = at + 1; active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Risk Acknowledged Message is what was written, byte for byte */
inline equal_active_risk_acknowledged_message(active_risk_acknowledged_message_read, active_risk_acknowledged_message_written) {
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 20 -> assert(active_risk_acknowledged_message_read.cl_ord_id[active_risk_acknowledged_message_at] == active_risk_acknowledged_message_written.cl_ord_id[active_risk_acknowledged_message_at]); active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 6 -> assert(active_risk_acknowledged_message_read.underlier[active_risk_acknowledged_message_at] == active_risk_acknowledged_message_written.underlier[active_risk_acknowledged_message_at]); active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> assert(active_risk_acknowledged_message_read.efid[active_risk_acknowledged_message_at] == active_risk_acknowledged_message_written.efid[active_risk_acknowledged_message_at]); active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> assert(active_risk_acknowledged_message_read.quantity[active_risk_acknowledged_message_at] == active_risk_acknowledged_message_written.quantity[active_risk_acknowledged_message_at]); active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledged_message_at = 0;
  do
  :: active_risk_acknowledged_message_at < 4 -> assert(active_risk_acknowledged_message_read.un_acked_quantity[active_risk_acknowledged_message_at] == active_risk_acknowledged_message_written.un_acked_quantity[active_risk_acknowledged_message_at]); active_risk_acknowledged_message_at = active_risk_acknowledged_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Active Risk Acknowledge Rej Message: 36 bytes --------------------------- */

/* ActiveRiskAcknowledgeRejMessage */
typedef ActiveRiskAcknowledgeRejMessage {
  byte cl_ord_id[20];
  byte underlier[6];
  byte efid[4];
  byte threshold_quantity[4];
  byte reject_reason[2]
};

int active_risk_acknowledge_rej_message_at;

/* every byte of Active Risk Acknowledge Rej Message set to one value */
inline fill_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_record, active_risk_acknowledge_rej_message_value) {
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 20 -> active_risk_acknowledge_rej_message_record.cl_ord_id[active_risk_acknowledge_rej_message_at] = active_risk_acknowledge_rej_message_value; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 6 -> active_risk_acknowledge_rej_message_record.underlier[active_risk_acknowledge_rej_message_at] = active_risk_acknowledge_rej_message_value; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> active_risk_acknowledge_rej_message_record.efid[active_risk_acknowledge_rej_message_at] = active_risk_acknowledge_rej_message_value; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> active_risk_acknowledge_rej_message_record.threshold_quantity[active_risk_acknowledge_rej_message_at] = active_risk_acknowledge_rej_message_value; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 2 -> active_risk_acknowledge_rej_message_record.reject_reason[active_risk_acknowledge_rej_message_at] = active_risk_acknowledge_rej_message_value; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Risk Acknowledge Rej Message set to where it lies, so a field read out of place says so */
inline ramp_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_record, active_risk_acknowledge_rej_message_base) {
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 20 -> active_risk_acknowledge_rej_message_record.cl_ord_id[active_risk_acknowledge_rej_message_at] = (active_risk_acknowledge_rej_message_base + 0 + active_risk_acknowledge_rej_message_at + 1) % 256; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 6 -> active_risk_acknowledge_rej_message_record.underlier[active_risk_acknowledge_rej_message_at] = (active_risk_acknowledge_rej_message_base + 20 + active_risk_acknowledge_rej_message_at + 1) % 256; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> active_risk_acknowledge_rej_message_record.efid[active_risk_acknowledge_rej_message_at] = (active_risk_acknowledge_rej_message_base + 26 + active_risk_acknowledge_rej_message_at + 1) % 256; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> active_risk_acknowledge_rej_message_record.threshold_quantity[active_risk_acknowledge_rej_message_at] = (active_risk_acknowledge_rej_message_base + 30 + active_risk_acknowledge_rej_message_at + 1) % 256; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 2 -> active_risk_acknowledge_rej_message_record.reject_reason[active_risk_acknowledge_rej_message_at] = (active_risk_acknowledge_rej_message_base + 34 + active_risk_acknowledge_rej_message_at + 1) % 256; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Acknowledge Rej Message to the wire, 36 bytes from where the cursor stands */
inline encode_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_record) {
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 20 -> wire[at] = active_risk_acknowledge_rej_message_record.cl_ord_id[active_risk_acknowledge_rej_message_at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 6 -> wire[at] = active_risk_acknowledge_rej_message_record.underlier[active_risk_acknowledge_rej_message_at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> wire[at] = active_risk_acknowledge_rej_message_record.efid[active_risk_acknowledge_rej_message_at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> wire[at] = active_risk_acknowledge_rej_message_record.threshold_quantity[active_risk_acknowledge_rej_message_at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 2 -> wire[at] = active_risk_acknowledge_rej_message_record.reject_reason[active_risk_acknowledge_rej_message_at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Acknowledge Rej Message off the wire, 36 bytes from where the cursor stands */
inline decode_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_record) {
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 20 -> active_risk_acknowledge_rej_message_record.cl_ord_id[active_risk_acknowledge_rej_message_at] = wire[at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 6 -> active_risk_acknowledge_rej_message_record.underlier[active_risk_acknowledge_rej_message_at] = wire[at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> active_risk_acknowledge_rej_message_record.efid[active_risk_acknowledge_rej_message_at] = wire[at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> active_risk_acknowledge_rej_message_record.threshold_quantity[active_risk_acknowledge_rej_message_at] = wire[at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 2 -> active_risk_acknowledge_rej_message_record.reject_reason[active_risk_acknowledge_rej_message_at] = wire[at]; at = at + 1; active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Risk Acknowledge Rej Message is what was written, byte for byte */
inline equal_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_read, active_risk_acknowledge_rej_message_written) {
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 20 -> assert(active_risk_acknowledge_rej_message_read.cl_ord_id[active_risk_acknowledge_rej_message_at] == active_risk_acknowledge_rej_message_written.cl_ord_id[active_risk_acknowledge_rej_message_at]); active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 6 -> assert(active_risk_acknowledge_rej_message_read.underlier[active_risk_acknowledge_rej_message_at] == active_risk_acknowledge_rej_message_written.underlier[active_risk_acknowledge_rej_message_at]); active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> assert(active_risk_acknowledge_rej_message_read.efid[active_risk_acknowledge_rej_message_at] == active_risk_acknowledge_rej_message_written.efid[active_risk_acknowledge_rej_message_at]); active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 4 -> assert(active_risk_acknowledge_rej_message_read.threshold_quantity[active_risk_acknowledge_rej_message_at] == active_risk_acknowledge_rej_message_written.threshold_quantity[active_risk_acknowledge_rej_message_at]); active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledge_rej_message_at = 0;
  do
  :: active_risk_acknowledge_rej_message_at < 2 -> assert(active_risk_acknowledge_rej_message_read.reject_reason[active_risk_acknowledge_rej_message_at] == active_risk_acknowledge_rej_message_written.reject_reason[active_risk_acknowledge_rej_message_at]); active_risk_acknowledge_rej_message_at = active_risk_acknowledge_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Active Risk Quantity Update Notification Message: 67 bytes -------------- */

/* ActiveRiskQuantityUpdateNotificationMessage */
typedef ActiveRiskQuantityUpdateNotificationMessage {
  byte sending_time[8];
  byte transact_time[8];
  byte order_id[8];
  byte trd_match_id[8];
  byte efid[4];
  byte underlier[6];
  byte option_security_id[8];
  byte side;
  byte last_px[8];
  byte last_qty[4];
  byte un_acked_quantity[4]
};

int active_risk_quantity_update_notification_message_at;

/* every byte of Active Risk Quantity Update Notification Message set to one value */
inline fill_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_record, active_risk_quantity_update_notification_message_value) {
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.sending_time[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.transact_time[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.order_id[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.trd_match_id[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> active_risk_quantity_update_notification_message_record.efid[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 6 -> active_risk_quantity_update_notification_message_record.underlier[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.option_security_id[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_record.side = active_risk_quantity_update_notification_message_value;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.last_px[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> active_risk_quantity_update_notification_message_record.last_qty[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> active_risk_quantity_update_notification_message_record.un_acked_quantity[active_risk_quantity_update_notification_message_at] = active_risk_quantity_update_notification_message_value; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Risk Quantity Update Notification Message set to where it lies, so a field read out of place says so */
inline ramp_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_record, active_risk_quantity_update_notification_message_base) {
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.sending_time[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 0 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.transact_time[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 8 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.order_id[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 16 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.trd_match_id[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 24 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> active_risk_quantity_update_notification_message_record.efid[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 32 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 6 -> active_risk_quantity_update_notification_message_record.underlier[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 36 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.option_security_id[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 42 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_record.side = (active_risk_quantity_update_notification_message_base + 50 + 1) % 256;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.last_px[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 51 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> active_risk_quantity_update_notification_message_record.last_qty[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 59 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> active_risk_quantity_update_notification_message_record.un_acked_quantity[active_risk_quantity_update_notification_message_at] = (active_risk_quantity_update_notification_message_base + 63 + active_risk_quantity_update_notification_message_at + 1) % 256; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Quantity Update Notification Message to the wire, 67 bytes from where the cursor stands */
inline encode_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_record) {
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> wire[at] = active_risk_quantity_update_notification_message_record.sending_time[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> wire[at] = active_risk_quantity_update_notification_message_record.transact_time[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> wire[at] = active_risk_quantity_update_notification_message_record.order_id[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> wire[at] = active_risk_quantity_update_notification_message_record.trd_match_id[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> wire[at] = active_risk_quantity_update_notification_message_record.efid[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 6 -> wire[at] = active_risk_quantity_update_notification_message_record.underlier[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> wire[at] = active_risk_quantity_update_notification_message_record.option_security_id[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = active_risk_quantity_update_notification_message_record.side; at = at + 1;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> wire[at] = active_risk_quantity_update_notification_message_record.last_px[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> wire[at] = active_risk_quantity_update_notification_message_record.last_qty[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> wire[at] = active_risk_quantity_update_notification_message_record.un_acked_quantity[active_risk_quantity_update_notification_message_at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Quantity Update Notification Message off the wire, 67 bytes from where the cursor stands */
inline decode_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_record) {
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.sending_time[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.transact_time[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.order_id[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.trd_match_id[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> active_risk_quantity_update_notification_message_record.efid[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 6 -> active_risk_quantity_update_notification_message_record.underlier[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.option_security_id[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_record.side = wire[at]; at = at + 1;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> active_risk_quantity_update_notification_message_record.last_px[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> active_risk_quantity_update_notification_message_record.last_qty[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> active_risk_quantity_update_notification_message_record.un_acked_quantity[active_risk_quantity_update_notification_message_at] = wire[at]; at = at + 1; active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Risk Quantity Update Notification Message is what was written, byte for byte */
inline equal_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_read, active_risk_quantity_update_notification_message_written) {
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> assert(active_risk_quantity_update_notification_message_read.sending_time[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.sending_time[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> assert(active_risk_quantity_update_notification_message_read.transact_time[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.transact_time[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> assert(active_risk_quantity_update_notification_message_read.order_id[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.order_id[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> assert(active_risk_quantity_update_notification_message_read.trd_match_id[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.trd_match_id[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> assert(active_risk_quantity_update_notification_message_read.efid[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.efid[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 6 -> assert(active_risk_quantity_update_notification_message_read.underlier[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.underlier[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> assert(active_risk_quantity_update_notification_message_read.option_security_id[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.option_security_id[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  assert(active_risk_quantity_update_notification_message_read.side == active_risk_quantity_update_notification_message_written.side);
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 8 -> assert(active_risk_quantity_update_notification_message_read.last_px[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.last_px[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> assert(active_risk_quantity_update_notification_message_read.last_qty[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.last_qty[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  active_risk_quantity_update_notification_message_at = 0;
  do
  :: active_risk_quantity_update_notification_message_at < 4 -> assert(active_risk_quantity_update_notification_message_read.un_acked_quantity[active_risk_quantity_update_notification_message_at] == active_risk_quantity_update_notification_message_written.un_acked_quantity[active_risk_quantity_update_notification_message_at]); active_risk_quantity_update_notification_message_at = active_risk_quantity_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Volume Threshold State Message: 44 bytes ----------------------------- */

/* CPVolumeThresholdStateMessage */
typedef CpVolumeThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte volume[8];
  byte period_in_milli_seconds[4]
};

int cp_volume_threshold_state_message_at;

/* every byte of Cp Volume Threshold State Message set to one value */
inline fill_cp_volume_threshold_state_message(cp_volume_threshold_state_message_record, cp_volume_threshold_state_message_value) {
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 20 -> cp_volume_threshold_state_message_record.cl_ord_id_optional[cp_volume_threshold_state_message_at] = cp_volume_threshold_state_message_value; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 6 -> cp_volume_threshold_state_message_record.underlier_optional[cp_volume_threshold_state_message_at] = cp_volume_threshold_state_message_value; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> cp_volume_threshold_state_message_record.efid_optional[cp_volume_threshold_state_message_at] = cp_volume_threshold_state_message_value; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 2 -> cp_volume_threshold_state_message_record.risk_group_id[cp_volume_threshold_state_message_at] = cp_volume_threshold_state_message_value; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 8 -> cp_volume_threshold_state_message_record.volume[cp_volume_threshold_state_message_at] = cp_volume_threshold_state_message_value; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> cp_volume_threshold_state_message_record.period_in_milli_seconds[cp_volume_threshold_state_message_at] = cp_volume_threshold_state_message_value; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Volume Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_volume_threshold_state_message(cp_volume_threshold_state_message_record, cp_volume_threshold_state_message_base) {
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 20 -> cp_volume_threshold_state_message_record.cl_ord_id_optional[cp_volume_threshold_state_message_at] = (cp_volume_threshold_state_message_base + 0 + cp_volume_threshold_state_message_at + 1) % 256; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 6 -> cp_volume_threshold_state_message_record.underlier_optional[cp_volume_threshold_state_message_at] = (cp_volume_threshold_state_message_base + 20 + cp_volume_threshold_state_message_at + 1) % 256; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> cp_volume_threshold_state_message_record.efid_optional[cp_volume_threshold_state_message_at] = (cp_volume_threshold_state_message_base + 26 + cp_volume_threshold_state_message_at + 1) % 256; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 2 -> cp_volume_threshold_state_message_record.risk_group_id[cp_volume_threshold_state_message_at] = (cp_volume_threshold_state_message_base + 30 + cp_volume_threshold_state_message_at + 1) % 256; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 8 -> cp_volume_threshold_state_message_record.volume[cp_volume_threshold_state_message_at] = (cp_volume_threshold_state_message_base + 32 + cp_volume_threshold_state_message_at + 1) % 256; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> cp_volume_threshold_state_message_record.period_in_milli_seconds[cp_volume_threshold_state_message_at] = (cp_volume_threshold_state_message_base + 40 + cp_volume_threshold_state_message_at + 1) % 256; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Volume Threshold State Message to the wire, 44 bytes from where the cursor stands */
inline encode_cp_volume_threshold_state_message(cp_volume_threshold_state_message_record) {
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 20 -> wire[at] = cp_volume_threshold_state_message_record.cl_ord_id_optional[cp_volume_threshold_state_message_at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 6 -> wire[at] = cp_volume_threshold_state_message_record.underlier_optional[cp_volume_threshold_state_message_at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> wire[at] = cp_volume_threshold_state_message_record.efid_optional[cp_volume_threshold_state_message_at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 2 -> wire[at] = cp_volume_threshold_state_message_record.risk_group_id[cp_volume_threshold_state_message_at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 8 -> wire[at] = cp_volume_threshold_state_message_record.volume[cp_volume_threshold_state_message_at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> wire[at] = cp_volume_threshold_state_message_record.period_in_milli_seconds[cp_volume_threshold_state_message_at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Volume Threshold State Message off the wire, 44 bytes from where the cursor stands */
inline decode_cp_volume_threshold_state_message(cp_volume_threshold_state_message_record) {
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 20 -> cp_volume_threshold_state_message_record.cl_ord_id_optional[cp_volume_threshold_state_message_at] = wire[at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 6 -> cp_volume_threshold_state_message_record.underlier_optional[cp_volume_threshold_state_message_at] = wire[at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> cp_volume_threshold_state_message_record.efid_optional[cp_volume_threshold_state_message_at] = wire[at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 2 -> cp_volume_threshold_state_message_record.risk_group_id[cp_volume_threshold_state_message_at] = wire[at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 8 -> cp_volume_threshold_state_message_record.volume[cp_volume_threshold_state_message_at] = wire[at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> cp_volume_threshold_state_message_record.period_in_milli_seconds[cp_volume_threshold_state_message_at] = wire[at]; at = at + 1; cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Volume Threshold State Message is what was written, byte for byte */
inline equal_cp_volume_threshold_state_message(cp_volume_threshold_state_message_read, cp_volume_threshold_state_message_written) {
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 20 -> assert(cp_volume_threshold_state_message_read.cl_ord_id_optional[cp_volume_threshold_state_message_at] == cp_volume_threshold_state_message_written.cl_ord_id_optional[cp_volume_threshold_state_message_at]); cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 6 -> assert(cp_volume_threshold_state_message_read.underlier_optional[cp_volume_threshold_state_message_at] == cp_volume_threshold_state_message_written.underlier_optional[cp_volume_threshold_state_message_at]); cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> assert(cp_volume_threshold_state_message_read.efid_optional[cp_volume_threshold_state_message_at] == cp_volume_threshold_state_message_written.efid_optional[cp_volume_threshold_state_message_at]); cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 2 -> assert(cp_volume_threshold_state_message_read.risk_group_id[cp_volume_threshold_state_message_at] == cp_volume_threshold_state_message_written.risk_group_id[cp_volume_threshold_state_message_at]); cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 8 -> assert(cp_volume_threshold_state_message_read.volume[cp_volume_threshold_state_message_at] == cp_volume_threshold_state_message_written.volume[cp_volume_threshold_state_message_at]); cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_state_message_at = 0;
  do
  :: cp_volume_threshold_state_message_at < 4 -> assert(cp_volume_threshold_state_message_read.period_in_milli_seconds[cp_volume_threshold_state_message_at] == cp_volume_threshold_state_message_written.period_in_milli_seconds[cp_volume_threshold_state_message_at]); cp_volume_threshold_state_message_at = cp_volume_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Executed Notional Threshold State Message: 40 bytes ------------------ */

/* CPExecutedNotionalThresholdStateMessage */
typedef CpExecutedNotionalThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4];
  byte period_in_milli_seconds[4]
};

int cp_executed_notional_threshold_state_message_at;

/* every byte of Cp Executed Notional Threshold State Message set to one value */
inline fill_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_record, cp_executed_notional_threshold_state_message_value) {
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 20 -> cp_executed_notional_threshold_state_message_record.cl_ord_id_optional[cp_executed_notional_threshold_state_message_at] = cp_executed_notional_threshold_state_message_value; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 6 -> cp_executed_notional_threshold_state_message_record.underlier_optional[cp_executed_notional_threshold_state_message_at] = cp_executed_notional_threshold_state_message_value; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> cp_executed_notional_threshold_state_message_record.efid_optional[cp_executed_notional_threshold_state_message_at] = cp_executed_notional_threshold_state_message_value; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 2 -> cp_executed_notional_threshold_state_message_record.risk_group_id[cp_executed_notional_threshold_state_message_at] = cp_executed_notional_threshold_state_message_value; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> cp_executed_notional_threshold_state_message_record.price_in_dollars[cp_executed_notional_threshold_state_message_at] = cp_executed_notional_threshold_state_message_value; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> cp_executed_notional_threshold_state_message_record.period_in_milli_seconds[cp_executed_notional_threshold_state_message_at] = cp_executed_notional_threshold_state_message_value; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Executed Notional Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_record, cp_executed_notional_threshold_state_message_base) {
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 20 -> cp_executed_notional_threshold_state_message_record.cl_ord_id_optional[cp_executed_notional_threshold_state_message_at] = (cp_executed_notional_threshold_state_message_base + 0 + cp_executed_notional_threshold_state_message_at + 1) % 256; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 6 -> cp_executed_notional_threshold_state_message_record.underlier_optional[cp_executed_notional_threshold_state_message_at] = (cp_executed_notional_threshold_state_message_base + 20 + cp_executed_notional_threshold_state_message_at + 1) % 256; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> cp_executed_notional_threshold_state_message_record.efid_optional[cp_executed_notional_threshold_state_message_at] = (cp_executed_notional_threshold_state_message_base + 26 + cp_executed_notional_threshold_state_message_at + 1) % 256; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 2 -> cp_executed_notional_threshold_state_message_record.risk_group_id[cp_executed_notional_threshold_state_message_at] = (cp_executed_notional_threshold_state_message_base + 30 + cp_executed_notional_threshold_state_message_at + 1) % 256; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> cp_executed_notional_threshold_state_message_record.price_in_dollars[cp_executed_notional_threshold_state_message_at] = (cp_executed_notional_threshold_state_message_base + 32 + cp_executed_notional_threshold_state_message_at + 1) % 256; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> cp_executed_notional_threshold_state_message_record.period_in_milli_seconds[cp_executed_notional_threshold_state_message_at] = (cp_executed_notional_threshold_state_message_base + 36 + cp_executed_notional_threshold_state_message_at + 1) % 256; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Executed Notional Threshold State Message to the wire, 40 bytes from where the cursor stands */
inline encode_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_record) {
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 20 -> wire[at] = cp_executed_notional_threshold_state_message_record.cl_ord_id_optional[cp_executed_notional_threshold_state_message_at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 6 -> wire[at] = cp_executed_notional_threshold_state_message_record.underlier_optional[cp_executed_notional_threshold_state_message_at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> wire[at] = cp_executed_notional_threshold_state_message_record.efid_optional[cp_executed_notional_threshold_state_message_at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 2 -> wire[at] = cp_executed_notional_threshold_state_message_record.risk_group_id[cp_executed_notional_threshold_state_message_at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> wire[at] = cp_executed_notional_threshold_state_message_record.price_in_dollars[cp_executed_notional_threshold_state_message_at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> wire[at] = cp_executed_notional_threshold_state_message_record.period_in_milli_seconds[cp_executed_notional_threshold_state_message_at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Executed Notional Threshold State Message off the wire, 40 bytes from where the cursor stands */
inline decode_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_record) {
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 20 -> cp_executed_notional_threshold_state_message_record.cl_ord_id_optional[cp_executed_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 6 -> cp_executed_notional_threshold_state_message_record.underlier_optional[cp_executed_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> cp_executed_notional_threshold_state_message_record.efid_optional[cp_executed_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 2 -> cp_executed_notional_threshold_state_message_record.risk_group_id[cp_executed_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> cp_executed_notional_threshold_state_message_record.price_in_dollars[cp_executed_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> cp_executed_notional_threshold_state_message_record.period_in_milli_seconds[cp_executed_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Executed Notional Threshold State Message is what was written, byte for byte */
inline equal_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_read, cp_executed_notional_threshold_state_message_written) {
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 20 -> assert(cp_executed_notional_threshold_state_message_read.cl_ord_id_optional[cp_executed_notional_threshold_state_message_at] == cp_executed_notional_threshold_state_message_written.cl_ord_id_optional[cp_executed_notional_threshold_state_message_at]); cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 6 -> assert(cp_executed_notional_threshold_state_message_read.underlier_optional[cp_executed_notional_threshold_state_message_at] == cp_executed_notional_threshold_state_message_written.underlier_optional[cp_executed_notional_threshold_state_message_at]); cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> assert(cp_executed_notional_threshold_state_message_read.efid_optional[cp_executed_notional_threshold_state_message_at] == cp_executed_notional_threshold_state_message_written.efid_optional[cp_executed_notional_threshold_state_message_at]); cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 2 -> assert(cp_executed_notional_threshold_state_message_read.risk_group_id[cp_executed_notional_threshold_state_message_at] == cp_executed_notional_threshold_state_message_written.risk_group_id[cp_executed_notional_threshold_state_message_at]); cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> assert(cp_executed_notional_threshold_state_message_read.price_in_dollars[cp_executed_notional_threshold_state_message_at] == cp_executed_notional_threshold_state_message_written.price_in_dollars[cp_executed_notional_threshold_state_message_at]); cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_state_message_at = 0;
  do
  :: cp_executed_notional_threshold_state_message_at < 4 -> assert(cp_executed_notional_threshold_state_message_read.period_in_milli_seconds[cp_executed_notional_threshold_state_message_at] == cp_executed_notional_threshold_state_message_written.period_in_milli_seconds[cp_executed_notional_threshold_state_message_at]); cp_executed_notional_threshold_state_message_at = cp_executed_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Total Executions Threshold State Message: 40 bytes ------------------- */

/* CPTotalExecutionsThresholdStateMessage */
typedef CpTotalExecutionsThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte total_executions[4];
  byte period_in_milli_seconds[4]
};

int cp_total_executions_threshold_state_message_at;

/* every byte of Cp Total Executions Threshold State Message set to one value */
inline fill_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_record, cp_total_executions_threshold_state_message_value) {
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 20 -> cp_total_executions_threshold_state_message_record.cl_ord_id_optional[cp_total_executions_threshold_state_message_at] = cp_total_executions_threshold_state_message_value; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 6 -> cp_total_executions_threshold_state_message_record.underlier_optional[cp_total_executions_threshold_state_message_at] = cp_total_executions_threshold_state_message_value; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> cp_total_executions_threshold_state_message_record.efid_optional[cp_total_executions_threshold_state_message_at] = cp_total_executions_threshold_state_message_value; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 2 -> cp_total_executions_threshold_state_message_record.risk_group_id[cp_total_executions_threshold_state_message_at] = cp_total_executions_threshold_state_message_value; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> cp_total_executions_threshold_state_message_record.total_executions[cp_total_executions_threshold_state_message_at] = cp_total_executions_threshold_state_message_value; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> cp_total_executions_threshold_state_message_record.period_in_milli_seconds[cp_total_executions_threshold_state_message_at] = cp_total_executions_threshold_state_message_value; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Total Executions Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_record, cp_total_executions_threshold_state_message_base) {
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 20 -> cp_total_executions_threshold_state_message_record.cl_ord_id_optional[cp_total_executions_threshold_state_message_at] = (cp_total_executions_threshold_state_message_base + 0 + cp_total_executions_threshold_state_message_at + 1) % 256; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 6 -> cp_total_executions_threshold_state_message_record.underlier_optional[cp_total_executions_threshold_state_message_at] = (cp_total_executions_threshold_state_message_base + 20 + cp_total_executions_threshold_state_message_at + 1) % 256; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> cp_total_executions_threshold_state_message_record.efid_optional[cp_total_executions_threshold_state_message_at] = (cp_total_executions_threshold_state_message_base + 26 + cp_total_executions_threshold_state_message_at + 1) % 256; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 2 -> cp_total_executions_threshold_state_message_record.risk_group_id[cp_total_executions_threshold_state_message_at] = (cp_total_executions_threshold_state_message_base + 30 + cp_total_executions_threshold_state_message_at + 1) % 256; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> cp_total_executions_threshold_state_message_record.total_executions[cp_total_executions_threshold_state_message_at] = (cp_total_executions_threshold_state_message_base + 32 + cp_total_executions_threshold_state_message_at + 1) % 256; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> cp_total_executions_threshold_state_message_record.period_in_milli_seconds[cp_total_executions_threshold_state_message_at] = (cp_total_executions_threshold_state_message_base + 36 + cp_total_executions_threshold_state_message_at + 1) % 256; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Total Executions Threshold State Message to the wire, 40 bytes from where the cursor stands */
inline encode_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_record) {
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 20 -> wire[at] = cp_total_executions_threshold_state_message_record.cl_ord_id_optional[cp_total_executions_threshold_state_message_at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 6 -> wire[at] = cp_total_executions_threshold_state_message_record.underlier_optional[cp_total_executions_threshold_state_message_at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> wire[at] = cp_total_executions_threshold_state_message_record.efid_optional[cp_total_executions_threshold_state_message_at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 2 -> wire[at] = cp_total_executions_threshold_state_message_record.risk_group_id[cp_total_executions_threshold_state_message_at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> wire[at] = cp_total_executions_threshold_state_message_record.total_executions[cp_total_executions_threshold_state_message_at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> wire[at] = cp_total_executions_threshold_state_message_record.period_in_milli_seconds[cp_total_executions_threshold_state_message_at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Total Executions Threshold State Message off the wire, 40 bytes from where the cursor stands */
inline decode_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_record) {
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 20 -> cp_total_executions_threshold_state_message_record.cl_ord_id_optional[cp_total_executions_threshold_state_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 6 -> cp_total_executions_threshold_state_message_record.underlier_optional[cp_total_executions_threshold_state_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> cp_total_executions_threshold_state_message_record.efid_optional[cp_total_executions_threshold_state_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 2 -> cp_total_executions_threshold_state_message_record.risk_group_id[cp_total_executions_threshold_state_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> cp_total_executions_threshold_state_message_record.total_executions[cp_total_executions_threshold_state_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> cp_total_executions_threshold_state_message_record.period_in_milli_seconds[cp_total_executions_threshold_state_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Total Executions Threshold State Message is what was written, byte for byte */
inline equal_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_read, cp_total_executions_threshold_state_message_written) {
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 20 -> assert(cp_total_executions_threshold_state_message_read.cl_ord_id_optional[cp_total_executions_threshold_state_message_at] == cp_total_executions_threshold_state_message_written.cl_ord_id_optional[cp_total_executions_threshold_state_message_at]); cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 6 -> assert(cp_total_executions_threshold_state_message_read.underlier_optional[cp_total_executions_threshold_state_message_at] == cp_total_executions_threshold_state_message_written.underlier_optional[cp_total_executions_threshold_state_message_at]); cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> assert(cp_total_executions_threshold_state_message_read.efid_optional[cp_total_executions_threshold_state_message_at] == cp_total_executions_threshold_state_message_written.efid_optional[cp_total_executions_threshold_state_message_at]); cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 2 -> assert(cp_total_executions_threshold_state_message_read.risk_group_id[cp_total_executions_threshold_state_message_at] == cp_total_executions_threshold_state_message_written.risk_group_id[cp_total_executions_threshold_state_message_at]); cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> assert(cp_total_executions_threshold_state_message_read.total_executions[cp_total_executions_threshold_state_message_at] == cp_total_executions_threshold_state_message_written.total_executions[cp_total_executions_threshold_state_message_at]); cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_state_message_at = 0;
  do
  :: cp_total_executions_threshold_state_message_at < 4 -> assert(cp_total_executions_threshold_state_message_read.period_in_milli_seconds[cp_total_executions_threshold_state_message_at] == cp_total_executions_threshold_state_message_written.period_in_milli_seconds[cp_total_executions_threshold_state_message_at]); cp_total_executions_threshold_state_message_at = cp_total_executions_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Percent Outstanding Contracts Threshold State Message: 38 bytes ------ */

/* CPPercentOutstandingContractsThresholdStateMessage */
typedef CpPercentOutstandingContractsThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte percent[4];
  byte period_in_milli_seconds[4]
};

int cp_percent_outstanding_contracts_threshold_state_message_at;

/* every byte of Cp Percent Outstanding Contracts Threshold State Message set to one value */
inline fill_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_record, cp_percent_outstanding_contracts_threshold_state_message_value) {
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 20 -> cp_percent_outstanding_contracts_threshold_state_message_record.cl_ord_id_optional[cp_percent_outstanding_contracts_threshold_state_message_at] = cp_percent_outstanding_contracts_threshold_state_message_value; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 6 -> cp_percent_outstanding_contracts_threshold_state_message_record.underlier_optional[cp_percent_outstanding_contracts_threshold_state_message_at] = cp_percent_outstanding_contracts_threshold_state_message_value; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> cp_percent_outstanding_contracts_threshold_state_message_record.efid_optional[cp_percent_outstanding_contracts_threshold_state_message_at] = cp_percent_outstanding_contracts_threshold_state_message_value; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> cp_percent_outstanding_contracts_threshold_state_message_record.percent[cp_percent_outstanding_contracts_threshold_state_message_at] = cp_percent_outstanding_contracts_threshold_state_message_value; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> cp_percent_outstanding_contracts_threshold_state_message_record.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_state_message_at] = cp_percent_outstanding_contracts_threshold_state_message_value; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Percent Outstanding Contracts Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_record, cp_percent_outstanding_contracts_threshold_state_message_base) {
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 20 -> cp_percent_outstanding_contracts_threshold_state_message_record.cl_ord_id_optional[cp_percent_outstanding_contracts_threshold_state_message_at] = (cp_percent_outstanding_contracts_threshold_state_message_base + 0 + cp_percent_outstanding_contracts_threshold_state_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 6 -> cp_percent_outstanding_contracts_threshold_state_message_record.underlier_optional[cp_percent_outstanding_contracts_threshold_state_message_at] = (cp_percent_outstanding_contracts_threshold_state_message_base + 20 + cp_percent_outstanding_contracts_threshold_state_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> cp_percent_outstanding_contracts_threshold_state_message_record.efid_optional[cp_percent_outstanding_contracts_threshold_state_message_at] = (cp_percent_outstanding_contracts_threshold_state_message_base + 26 + cp_percent_outstanding_contracts_threshold_state_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> cp_percent_outstanding_contracts_threshold_state_message_record.percent[cp_percent_outstanding_contracts_threshold_state_message_at] = (cp_percent_outstanding_contracts_threshold_state_message_base + 30 + cp_percent_outstanding_contracts_threshold_state_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> cp_percent_outstanding_contracts_threshold_state_message_record.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_state_message_at] = (cp_percent_outstanding_contracts_threshold_state_message_base + 34 + cp_percent_outstanding_contracts_threshold_state_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Percent Outstanding Contracts Threshold State Message to the wire, 38 bytes from where the cursor stands */
inline encode_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_record) {
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 20 -> wire[at] = cp_percent_outstanding_contracts_threshold_state_message_record.cl_ord_id_optional[cp_percent_outstanding_contracts_threshold_state_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 6 -> wire[at] = cp_percent_outstanding_contracts_threshold_state_message_record.underlier_optional[cp_percent_outstanding_contracts_threshold_state_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> wire[at] = cp_percent_outstanding_contracts_threshold_state_message_record.efid_optional[cp_percent_outstanding_contracts_threshold_state_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> wire[at] = cp_percent_outstanding_contracts_threshold_state_message_record.percent[cp_percent_outstanding_contracts_threshold_state_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> wire[at] = cp_percent_outstanding_contracts_threshold_state_message_record.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_state_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Percent Outstanding Contracts Threshold State Message off the wire, 38 bytes from where the cursor stands */
inline decode_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_record) {
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 20 -> cp_percent_outstanding_contracts_threshold_state_message_record.cl_ord_id_optional[cp_percent_outstanding_contracts_threshold_state_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 6 -> cp_percent_outstanding_contracts_threshold_state_message_record.underlier_optional[cp_percent_outstanding_contracts_threshold_state_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> cp_percent_outstanding_contracts_threshold_state_message_record.efid_optional[cp_percent_outstanding_contracts_threshold_state_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> cp_percent_outstanding_contracts_threshold_state_message_record.percent[cp_percent_outstanding_contracts_threshold_state_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> cp_percent_outstanding_contracts_threshold_state_message_record.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_state_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Percent Outstanding Contracts Threshold State Message is what was written, byte for byte */
inline equal_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_read, cp_percent_outstanding_contracts_threshold_state_message_written) {
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 20 -> assert(cp_percent_outstanding_contracts_threshold_state_message_read.cl_ord_id_optional[cp_percent_outstanding_contracts_threshold_state_message_at] == cp_percent_outstanding_contracts_threshold_state_message_written.cl_ord_id_optional[cp_percent_outstanding_contracts_threshold_state_message_at]); cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 6 -> assert(cp_percent_outstanding_contracts_threshold_state_message_read.underlier_optional[cp_percent_outstanding_contracts_threshold_state_message_at] == cp_percent_outstanding_contracts_threshold_state_message_written.underlier_optional[cp_percent_outstanding_contracts_threshold_state_message_at]); cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> assert(cp_percent_outstanding_contracts_threshold_state_message_read.efid_optional[cp_percent_outstanding_contracts_threshold_state_message_at] == cp_percent_outstanding_contracts_threshold_state_message_written.efid_optional[cp_percent_outstanding_contracts_threshold_state_message_at]); cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> assert(cp_percent_outstanding_contracts_threshold_state_message_read.percent[cp_percent_outstanding_contracts_threshold_state_message_at] == cp_percent_outstanding_contracts_threshold_state_message_written.percent[cp_percent_outstanding_contracts_threshold_state_message_at]); cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_state_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_state_message_at < 4 -> assert(cp_percent_outstanding_contracts_threshold_state_message_read.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_state_message_at] == cp_percent_outstanding_contracts_threshold_state_message_written.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_state_message_at]); cp_percent_outstanding_contracts_threshold_state_message_at = cp_percent_outstanding_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Breach Count Threshold State Message: 40 bytes ----------------------- */

/* CPBreachCountThresholdStateMessage */
typedef CpBreachCountThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte count[4];
  byte period_in_milli_seconds[4]
};

int cp_breach_count_threshold_state_message_at;

/* every byte of Cp Breach Count Threshold State Message set to one value */
inline fill_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_record, cp_breach_count_threshold_state_message_value) {
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 20 -> cp_breach_count_threshold_state_message_record.cl_ord_id_optional[cp_breach_count_threshold_state_message_at] = cp_breach_count_threshold_state_message_value; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 6 -> cp_breach_count_threshold_state_message_record.underlier_optional[cp_breach_count_threshold_state_message_at] = cp_breach_count_threshold_state_message_value; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> cp_breach_count_threshold_state_message_record.efid_optional[cp_breach_count_threshold_state_message_at] = cp_breach_count_threshold_state_message_value; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 2 -> cp_breach_count_threshold_state_message_record.risk_group_id[cp_breach_count_threshold_state_message_at] = cp_breach_count_threshold_state_message_value; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> cp_breach_count_threshold_state_message_record.count[cp_breach_count_threshold_state_message_at] = cp_breach_count_threshold_state_message_value; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> cp_breach_count_threshold_state_message_record.period_in_milli_seconds[cp_breach_count_threshold_state_message_at] = cp_breach_count_threshold_state_message_value; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Breach Count Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_record, cp_breach_count_threshold_state_message_base) {
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 20 -> cp_breach_count_threshold_state_message_record.cl_ord_id_optional[cp_breach_count_threshold_state_message_at] = (cp_breach_count_threshold_state_message_base + 0 + cp_breach_count_threshold_state_message_at + 1) % 256; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 6 -> cp_breach_count_threshold_state_message_record.underlier_optional[cp_breach_count_threshold_state_message_at] = (cp_breach_count_threshold_state_message_base + 20 + cp_breach_count_threshold_state_message_at + 1) % 256; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> cp_breach_count_threshold_state_message_record.efid_optional[cp_breach_count_threshold_state_message_at] = (cp_breach_count_threshold_state_message_base + 26 + cp_breach_count_threshold_state_message_at + 1) % 256; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 2 -> cp_breach_count_threshold_state_message_record.risk_group_id[cp_breach_count_threshold_state_message_at] = (cp_breach_count_threshold_state_message_base + 30 + cp_breach_count_threshold_state_message_at + 1) % 256; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> cp_breach_count_threshold_state_message_record.count[cp_breach_count_threshold_state_message_at] = (cp_breach_count_threshold_state_message_base + 32 + cp_breach_count_threshold_state_message_at + 1) % 256; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> cp_breach_count_threshold_state_message_record.period_in_milli_seconds[cp_breach_count_threshold_state_message_at] = (cp_breach_count_threshold_state_message_base + 36 + cp_breach_count_threshold_state_message_at + 1) % 256; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Breach Count Threshold State Message to the wire, 40 bytes from where the cursor stands */
inline encode_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_record) {
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 20 -> wire[at] = cp_breach_count_threshold_state_message_record.cl_ord_id_optional[cp_breach_count_threshold_state_message_at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 6 -> wire[at] = cp_breach_count_threshold_state_message_record.underlier_optional[cp_breach_count_threshold_state_message_at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> wire[at] = cp_breach_count_threshold_state_message_record.efid_optional[cp_breach_count_threshold_state_message_at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 2 -> wire[at] = cp_breach_count_threshold_state_message_record.risk_group_id[cp_breach_count_threshold_state_message_at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> wire[at] = cp_breach_count_threshold_state_message_record.count[cp_breach_count_threshold_state_message_at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> wire[at] = cp_breach_count_threshold_state_message_record.period_in_milli_seconds[cp_breach_count_threshold_state_message_at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Breach Count Threshold State Message off the wire, 40 bytes from where the cursor stands */
inline decode_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_record) {
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 20 -> cp_breach_count_threshold_state_message_record.cl_ord_id_optional[cp_breach_count_threshold_state_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 6 -> cp_breach_count_threshold_state_message_record.underlier_optional[cp_breach_count_threshold_state_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> cp_breach_count_threshold_state_message_record.efid_optional[cp_breach_count_threshold_state_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 2 -> cp_breach_count_threshold_state_message_record.risk_group_id[cp_breach_count_threshold_state_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> cp_breach_count_threshold_state_message_record.count[cp_breach_count_threshold_state_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> cp_breach_count_threshold_state_message_record.period_in_milli_seconds[cp_breach_count_threshold_state_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Breach Count Threshold State Message is what was written, byte for byte */
inline equal_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_read, cp_breach_count_threshold_state_message_written) {
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 20 -> assert(cp_breach_count_threshold_state_message_read.cl_ord_id_optional[cp_breach_count_threshold_state_message_at] == cp_breach_count_threshold_state_message_written.cl_ord_id_optional[cp_breach_count_threshold_state_message_at]); cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 6 -> assert(cp_breach_count_threshold_state_message_read.underlier_optional[cp_breach_count_threshold_state_message_at] == cp_breach_count_threshold_state_message_written.underlier_optional[cp_breach_count_threshold_state_message_at]); cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> assert(cp_breach_count_threshold_state_message_read.efid_optional[cp_breach_count_threshold_state_message_at] == cp_breach_count_threshold_state_message_written.efid_optional[cp_breach_count_threshold_state_message_at]); cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 2 -> assert(cp_breach_count_threshold_state_message_read.risk_group_id[cp_breach_count_threshold_state_message_at] == cp_breach_count_threshold_state_message_written.risk_group_id[cp_breach_count_threshold_state_message_at]); cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> assert(cp_breach_count_threshold_state_message_read.count[cp_breach_count_threshold_state_message_at] == cp_breach_count_threshold_state_message_written.count[cp_breach_count_threshold_state_message_at]); cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_state_message_at = 0;
  do
  :: cp_breach_count_threshold_state_message_at < 4 -> assert(cp_breach_count_threshold_state_message_read.period_in_milli_seconds[cp_breach_count_threshold_state_message_at] == cp_breach_count_threshold_state_message_written.period_in_milli_seconds[cp_breach_count_threshold_state_message_at]); cp_breach_count_threshold_state_message_at = cp_breach_count_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Manual Cp Breach Trigger Pending Message: 40 bytes ---------------------- */

/* ManualCPBreachTriggerPendingMessage */
typedef ManualCpBreachTriggerPendingMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte breach_id[8]
};

int manual_cp_breach_trigger_pending_message_at;

/* every byte of Manual Cp Breach Trigger Pending Message set to one value */
inline fill_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_record, manual_cp_breach_trigger_pending_message_value) {
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 20 -> manual_cp_breach_trigger_pending_message_record.cl_ord_id[manual_cp_breach_trigger_pending_message_at] = manual_cp_breach_trigger_pending_message_value; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 6 -> manual_cp_breach_trigger_pending_message_record.underlier_optional[manual_cp_breach_trigger_pending_message_at] = manual_cp_breach_trigger_pending_message_value; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 4 -> manual_cp_breach_trigger_pending_message_record.efid_optional[manual_cp_breach_trigger_pending_message_at] = manual_cp_breach_trigger_pending_message_value; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 2 -> manual_cp_breach_trigger_pending_message_record.risk_group_id[manual_cp_breach_trigger_pending_message_at] = manual_cp_breach_trigger_pending_message_value; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 8 -> manual_cp_breach_trigger_pending_message_record.breach_id[manual_cp_breach_trigger_pending_message_at] = manual_cp_breach_trigger_pending_message_value; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Manual Cp Breach Trigger Pending Message set to where it lies, so a field read out of place says so */
inline ramp_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_record, manual_cp_breach_trigger_pending_message_base) {
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 20 -> manual_cp_breach_trigger_pending_message_record.cl_ord_id[manual_cp_breach_trigger_pending_message_at] = (manual_cp_breach_trigger_pending_message_base + 0 + manual_cp_breach_trigger_pending_message_at + 1) % 256; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 6 -> manual_cp_breach_trigger_pending_message_record.underlier_optional[manual_cp_breach_trigger_pending_message_at] = (manual_cp_breach_trigger_pending_message_base + 20 + manual_cp_breach_trigger_pending_message_at + 1) % 256; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 4 -> manual_cp_breach_trigger_pending_message_record.efid_optional[manual_cp_breach_trigger_pending_message_at] = (manual_cp_breach_trigger_pending_message_base + 26 + manual_cp_breach_trigger_pending_message_at + 1) % 256; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 2 -> manual_cp_breach_trigger_pending_message_record.risk_group_id[manual_cp_breach_trigger_pending_message_at] = (manual_cp_breach_trigger_pending_message_base + 30 + manual_cp_breach_trigger_pending_message_at + 1) % 256; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 8 -> manual_cp_breach_trigger_pending_message_record.breach_id[manual_cp_breach_trigger_pending_message_at] = (manual_cp_breach_trigger_pending_message_base + 32 + manual_cp_breach_trigger_pending_message_at + 1) % 256; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* Manual Cp Breach Trigger Pending Message to the wire, 40 bytes from where the cursor stands */
inline encode_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_record) {
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 20 -> wire[at] = manual_cp_breach_trigger_pending_message_record.cl_ord_id[manual_cp_breach_trigger_pending_message_at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 6 -> wire[at] = manual_cp_breach_trigger_pending_message_record.underlier_optional[manual_cp_breach_trigger_pending_message_at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 4 -> wire[at] = manual_cp_breach_trigger_pending_message_record.efid_optional[manual_cp_breach_trigger_pending_message_at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 2 -> wire[at] = manual_cp_breach_trigger_pending_message_record.risk_group_id[manual_cp_breach_trigger_pending_message_at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 8 -> wire[at] = manual_cp_breach_trigger_pending_message_record.breach_id[manual_cp_breach_trigger_pending_message_at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* Manual Cp Breach Trigger Pending Message off the wire, 40 bytes from where the cursor stands */
inline decode_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_record) {
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 20 -> manual_cp_breach_trigger_pending_message_record.cl_ord_id[manual_cp_breach_trigger_pending_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 6 -> manual_cp_breach_trigger_pending_message_record.underlier_optional[manual_cp_breach_trigger_pending_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 4 -> manual_cp_breach_trigger_pending_message_record.efid_optional[manual_cp_breach_trigger_pending_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 2 -> manual_cp_breach_trigger_pending_message_record.risk_group_id[manual_cp_breach_trigger_pending_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 8 -> manual_cp_breach_trigger_pending_message_record.breach_id[manual_cp_breach_trigger_pending_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Manual Cp Breach Trigger Pending Message is what was written, byte for byte */
inline equal_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_read, manual_cp_breach_trigger_pending_message_written) {
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 20 -> assert(manual_cp_breach_trigger_pending_message_read.cl_ord_id[manual_cp_breach_trigger_pending_message_at] == manual_cp_breach_trigger_pending_message_written.cl_ord_id[manual_cp_breach_trigger_pending_message_at]); manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 6 -> assert(manual_cp_breach_trigger_pending_message_read.underlier_optional[manual_cp_breach_trigger_pending_message_at] == manual_cp_breach_trigger_pending_message_written.underlier_optional[manual_cp_breach_trigger_pending_message_at]); manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 4 -> assert(manual_cp_breach_trigger_pending_message_read.efid_optional[manual_cp_breach_trigger_pending_message_at] == manual_cp_breach_trigger_pending_message_written.efid_optional[manual_cp_breach_trigger_pending_message_at]); manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 2 -> assert(manual_cp_breach_trigger_pending_message_read.risk_group_id[manual_cp_breach_trigger_pending_message_at] == manual_cp_breach_trigger_pending_message_written.risk_group_id[manual_cp_breach_trigger_pending_message_at]); manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_pending_message_at = 0;
  do
  :: manual_cp_breach_trigger_pending_message_at < 8 -> assert(manual_cp_breach_trigger_pending_message_read.breach_id[manual_cp_breach_trigger_pending_message_at] == manual_cp_breach_trigger_pending_message_written.breach_id[manual_cp_breach_trigger_pending_message_at]); manual_cp_breach_trigger_pending_message_at = manual_cp_breach_trigger_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Manual Cp Breach Trigger Done Message: 44 bytes ------------------------- */

/* ManualCPBreachTriggerDoneMessage */
typedef ManualCpBreachTriggerDoneMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte breach_id[8];
  byte total_affected_orders[4]
};

int manual_cp_breach_trigger_done_message_at;

/* every byte of Manual Cp Breach Trigger Done Message set to one value */
inline fill_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_record, manual_cp_breach_trigger_done_message_value) {
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 20 -> manual_cp_breach_trigger_done_message_record.cl_ord_id[manual_cp_breach_trigger_done_message_at] = manual_cp_breach_trigger_done_message_value; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 6 -> manual_cp_breach_trigger_done_message_record.underlier_optional[manual_cp_breach_trigger_done_message_at] = manual_cp_breach_trigger_done_message_value; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> manual_cp_breach_trigger_done_message_record.efid_optional[manual_cp_breach_trigger_done_message_at] = manual_cp_breach_trigger_done_message_value; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 2 -> manual_cp_breach_trigger_done_message_record.risk_group_id[manual_cp_breach_trigger_done_message_at] = manual_cp_breach_trigger_done_message_value; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 8 -> manual_cp_breach_trigger_done_message_record.breach_id[manual_cp_breach_trigger_done_message_at] = manual_cp_breach_trigger_done_message_value; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> manual_cp_breach_trigger_done_message_record.total_affected_orders[manual_cp_breach_trigger_done_message_at] = manual_cp_breach_trigger_done_message_value; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Manual Cp Breach Trigger Done Message set to where it lies, so a field read out of place says so */
inline ramp_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_record, manual_cp_breach_trigger_done_message_base) {
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 20 -> manual_cp_breach_trigger_done_message_record.cl_ord_id[manual_cp_breach_trigger_done_message_at] = (manual_cp_breach_trigger_done_message_base + 0 + manual_cp_breach_trigger_done_message_at + 1) % 256; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 6 -> manual_cp_breach_trigger_done_message_record.underlier_optional[manual_cp_breach_trigger_done_message_at] = (manual_cp_breach_trigger_done_message_base + 20 + manual_cp_breach_trigger_done_message_at + 1) % 256; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> manual_cp_breach_trigger_done_message_record.efid_optional[manual_cp_breach_trigger_done_message_at] = (manual_cp_breach_trigger_done_message_base + 26 + manual_cp_breach_trigger_done_message_at + 1) % 256; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 2 -> manual_cp_breach_trigger_done_message_record.risk_group_id[manual_cp_breach_trigger_done_message_at] = (manual_cp_breach_trigger_done_message_base + 30 + manual_cp_breach_trigger_done_message_at + 1) % 256; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 8 -> manual_cp_breach_trigger_done_message_record.breach_id[manual_cp_breach_trigger_done_message_at] = (manual_cp_breach_trigger_done_message_base + 32 + manual_cp_breach_trigger_done_message_at + 1) % 256; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> manual_cp_breach_trigger_done_message_record.total_affected_orders[manual_cp_breach_trigger_done_message_at] = (manual_cp_breach_trigger_done_message_base + 40 + manual_cp_breach_trigger_done_message_at + 1) % 256; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* Manual Cp Breach Trigger Done Message to the wire, 44 bytes from where the cursor stands */
inline encode_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_record) {
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 20 -> wire[at] = manual_cp_breach_trigger_done_message_record.cl_ord_id[manual_cp_breach_trigger_done_message_at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 6 -> wire[at] = manual_cp_breach_trigger_done_message_record.underlier_optional[manual_cp_breach_trigger_done_message_at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> wire[at] = manual_cp_breach_trigger_done_message_record.efid_optional[manual_cp_breach_trigger_done_message_at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 2 -> wire[at] = manual_cp_breach_trigger_done_message_record.risk_group_id[manual_cp_breach_trigger_done_message_at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 8 -> wire[at] = manual_cp_breach_trigger_done_message_record.breach_id[manual_cp_breach_trigger_done_message_at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> wire[at] = manual_cp_breach_trigger_done_message_record.total_affected_orders[manual_cp_breach_trigger_done_message_at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* Manual Cp Breach Trigger Done Message off the wire, 44 bytes from where the cursor stands */
inline decode_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_record) {
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 20 -> manual_cp_breach_trigger_done_message_record.cl_ord_id[manual_cp_breach_trigger_done_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 6 -> manual_cp_breach_trigger_done_message_record.underlier_optional[manual_cp_breach_trigger_done_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> manual_cp_breach_trigger_done_message_record.efid_optional[manual_cp_breach_trigger_done_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 2 -> manual_cp_breach_trigger_done_message_record.risk_group_id[manual_cp_breach_trigger_done_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 8 -> manual_cp_breach_trigger_done_message_record.breach_id[manual_cp_breach_trigger_done_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> manual_cp_breach_trigger_done_message_record.total_affected_orders[manual_cp_breach_trigger_done_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Manual Cp Breach Trigger Done Message is what was written, byte for byte */
inline equal_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_read, manual_cp_breach_trigger_done_message_written) {
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 20 -> assert(manual_cp_breach_trigger_done_message_read.cl_ord_id[manual_cp_breach_trigger_done_message_at] == manual_cp_breach_trigger_done_message_written.cl_ord_id[manual_cp_breach_trigger_done_message_at]); manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 6 -> assert(manual_cp_breach_trigger_done_message_read.underlier_optional[manual_cp_breach_trigger_done_message_at] == manual_cp_breach_trigger_done_message_written.underlier_optional[manual_cp_breach_trigger_done_message_at]); manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> assert(manual_cp_breach_trigger_done_message_read.efid_optional[manual_cp_breach_trigger_done_message_at] == manual_cp_breach_trigger_done_message_written.efid_optional[manual_cp_breach_trigger_done_message_at]); manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 2 -> assert(manual_cp_breach_trigger_done_message_read.risk_group_id[manual_cp_breach_trigger_done_message_at] == manual_cp_breach_trigger_done_message_written.risk_group_id[manual_cp_breach_trigger_done_message_at]); manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 8 -> assert(manual_cp_breach_trigger_done_message_read.breach_id[manual_cp_breach_trigger_done_message_at] == manual_cp_breach_trigger_done_message_written.breach_id[manual_cp_breach_trigger_done_message_at]); manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_done_message_at = 0;
  do
  :: manual_cp_breach_trigger_done_message_at < 4 -> assert(manual_cp_breach_trigger_done_message_read.total_affected_orders[manual_cp_breach_trigger_done_message_at] == manual_cp_breach_trigger_done_message_written.total_affected_orders[manual_cp_breach_trigger_done_message_at]); manual_cp_breach_trigger_done_message_at = manual_cp_breach_trigger_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Risk Threshold Update Rej Message: 23 bytes ----------------------------- */

/* RiskThresholdUpdateRejMessage */
typedef RiskThresholdUpdateRejMessage {
  byte cl_ord_id[20];
  byte risk_type;
  byte reject_reason[2]
};

int risk_threshold_update_rej_message_at;

/* every byte of Risk Threshold Update Rej Message set to one value */
inline fill_risk_threshold_update_rej_message(risk_threshold_update_rej_message_record, risk_threshold_update_rej_message_value) {
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 20 -> risk_threshold_update_rej_message_record.cl_ord_id[risk_threshold_update_rej_message_at] = risk_threshold_update_rej_message_value; risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  risk_threshold_update_rej_message_record.risk_type = risk_threshold_update_rej_message_value;
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 2 -> risk_threshold_update_rej_message_record.reject_reason[risk_threshold_update_rej_message_at] = risk_threshold_update_rej_message_value; risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Risk Threshold Update Rej Message set to where it lies, so a field read out of place says so */
inline ramp_risk_threshold_update_rej_message(risk_threshold_update_rej_message_record, risk_threshold_update_rej_message_base) {
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 20 -> risk_threshold_update_rej_message_record.cl_ord_id[risk_threshold_update_rej_message_at] = (risk_threshold_update_rej_message_base + 0 + risk_threshold_update_rej_message_at + 1) % 256; risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  risk_threshold_update_rej_message_record.risk_type = (risk_threshold_update_rej_message_base + 20 + 1) % 256;
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 2 -> risk_threshold_update_rej_message_record.reject_reason[risk_threshold_update_rej_message_at] = (risk_threshold_update_rej_message_base + 21 + risk_threshold_update_rej_message_at + 1) % 256; risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Threshold Update Rej Message to the wire, 23 bytes from where the cursor stands */
inline encode_risk_threshold_update_rej_message(risk_threshold_update_rej_message_record) {
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 20 -> wire[at] = risk_threshold_update_rej_message_record.cl_ord_id[risk_threshold_update_rej_message_at]; at = at + 1; risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_threshold_update_rej_message_record.risk_type; at = at + 1;
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 2 -> wire[at] = risk_threshold_update_rej_message_record.reject_reason[risk_threshold_update_rej_message_at]; at = at + 1; risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Threshold Update Rej Message off the wire, 23 bytes from where the cursor stands */
inline decode_risk_threshold_update_rej_message(risk_threshold_update_rej_message_record) {
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 20 -> risk_threshold_update_rej_message_record.cl_ord_id[risk_threshold_update_rej_message_at] = wire[at]; at = at + 1; risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  risk_threshold_update_rej_message_record.risk_type = wire[at]; at = at + 1;
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 2 -> risk_threshold_update_rej_message_record.reject_reason[risk_threshold_update_rej_message_at] = wire[at]; at = at + 1; risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Risk Threshold Update Rej Message is what was written, byte for byte */
inline equal_risk_threshold_update_rej_message(risk_threshold_update_rej_message_read, risk_threshold_update_rej_message_written) {
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 20 -> assert(risk_threshold_update_rej_message_read.cl_ord_id[risk_threshold_update_rej_message_at] == risk_threshold_update_rej_message_written.cl_ord_id[risk_threshold_update_rej_message_at]); risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  assert(risk_threshold_update_rej_message_read.risk_type == risk_threshold_update_rej_message_written.risk_type);
  risk_threshold_update_rej_message_at = 0;
  do
  :: risk_threshold_update_rej_message_at < 2 -> assert(risk_threshold_update_rej_message_read.reject_reason[risk_threshold_update_rej_message_at] == risk_threshold_update_rej_message_written.reject_reason[risk_threshold_update_rej_message_at]); risk_threshold_update_rej_message_at = risk_threshold_update_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Passive Risk Threshold Notification Message: 30 bytes ------------------- */

/* PassiveRiskThresholdNotificationMessage */
typedef PassiveRiskThresholdNotificationMessage {
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte rule_type;
  byte latest_percentage;
  byte breach_id_optional[8];
  byte transact_time[8]
};

int passive_risk_threshold_notification_message_at;

/* every byte of Passive Risk Threshold Notification Message set to one value */
inline fill_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_record, passive_risk_threshold_notification_message_value) {
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 6 -> passive_risk_threshold_notification_message_record.underlier_optional[passive_risk_threshold_notification_message_at] = passive_risk_threshold_notification_message_value; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 4 -> passive_risk_threshold_notification_message_record.efid_optional[passive_risk_threshold_notification_message_at] = passive_risk_threshold_notification_message_value; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 2 -> passive_risk_threshold_notification_message_record.risk_group_id[passive_risk_threshold_notification_message_at] = passive_risk_threshold_notification_message_value; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_record.rule_type = passive_risk_threshold_notification_message_value;
  passive_risk_threshold_notification_message_record.latest_percentage = passive_risk_threshold_notification_message_value;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> passive_risk_threshold_notification_message_record.breach_id_optional[passive_risk_threshold_notification_message_at] = passive_risk_threshold_notification_message_value; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> passive_risk_threshold_notification_message_record.transact_time[passive_risk_threshold_notification_message_at] = passive_risk_threshold_notification_message_value; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Passive Risk Threshold Notification Message set to where it lies, so a field read out of place says so */
inline ramp_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_record, passive_risk_threshold_notification_message_base) {
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 6 -> passive_risk_threshold_notification_message_record.underlier_optional[passive_risk_threshold_notification_message_at] = (passive_risk_threshold_notification_message_base + 0 + passive_risk_threshold_notification_message_at + 1) % 256; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 4 -> passive_risk_threshold_notification_message_record.efid_optional[passive_risk_threshold_notification_message_at] = (passive_risk_threshold_notification_message_base + 6 + passive_risk_threshold_notification_message_at + 1) % 256; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 2 -> passive_risk_threshold_notification_message_record.risk_group_id[passive_risk_threshold_notification_message_at] = (passive_risk_threshold_notification_message_base + 10 + passive_risk_threshold_notification_message_at + 1) % 256; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_record.rule_type = (passive_risk_threshold_notification_message_base + 12 + 1) % 256;
  passive_risk_threshold_notification_message_record.latest_percentage = (passive_risk_threshold_notification_message_base + 13 + 1) % 256;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> passive_risk_threshold_notification_message_record.breach_id_optional[passive_risk_threshold_notification_message_at] = (passive_risk_threshold_notification_message_base + 14 + passive_risk_threshold_notification_message_at + 1) % 256; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> passive_risk_threshold_notification_message_record.transact_time[passive_risk_threshold_notification_message_at] = (passive_risk_threshold_notification_message_base + 22 + passive_risk_threshold_notification_message_at + 1) % 256; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Passive Risk Threshold Notification Message to the wire, 30 bytes from where the cursor stands */
inline encode_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_record) {
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 6 -> wire[at] = passive_risk_threshold_notification_message_record.underlier_optional[passive_risk_threshold_notification_message_at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 4 -> wire[at] = passive_risk_threshold_notification_message_record.efid_optional[passive_risk_threshold_notification_message_at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 2 -> wire[at] = passive_risk_threshold_notification_message_record.risk_group_id[passive_risk_threshold_notification_message_at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = passive_risk_threshold_notification_message_record.rule_type; at = at + 1;
  wire[at] = passive_risk_threshold_notification_message_record.latest_percentage; at = at + 1;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> wire[at] = passive_risk_threshold_notification_message_record.breach_id_optional[passive_risk_threshold_notification_message_at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> wire[at] = passive_risk_threshold_notification_message_record.transact_time[passive_risk_threshold_notification_message_at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Passive Risk Threshold Notification Message off the wire, 30 bytes from where the cursor stands */
inline decode_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_record) {
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 6 -> passive_risk_threshold_notification_message_record.underlier_optional[passive_risk_threshold_notification_message_at] = wire[at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 4 -> passive_risk_threshold_notification_message_record.efid_optional[passive_risk_threshold_notification_message_at] = wire[at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 2 -> passive_risk_threshold_notification_message_record.risk_group_id[passive_risk_threshold_notification_message_at] = wire[at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_record.rule_type = wire[at]; at = at + 1;
  passive_risk_threshold_notification_message_record.latest_percentage = wire[at]; at = at + 1;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> passive_risk_threshold_notification_message_record.breach_id_optional[passive_risk_threshold_notification_message_at] = wire[at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> passive_risk_threshold_notification_message_record.transact_time[passive_risk_threshold_notification_message_at] = wire[at]; at = at + 1; passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Passive Risk Threshold Notification Message is what was written, byte for byte */
inline equal_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_read, passive_risk_threshold_notification_message_written) {
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 6 -> assert(passive_risk_threshold_notification_message_read.underlier_optional[passive_risk_threshold_notification_message_at] == passive_risk_threshold_notification_message_written.underlier_optional[passive_risk_threshold_notification_message_at]); passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 4 -> assert(passive_risk_threshold_notification_message_read.efid_optional[passive_risk_threshold_notification_message_at] == passive_risk_threshold_notification_message_written.efid_optional[passive_risk_threshold_notification_message_at]); passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 2 -> assert(passive_risk_threshold_notification_message_read.risk_group_id[passive_risk_threshold_notification_message_at] == passive_risk_threshold_notification_message_written.risk_group_id[passive_risk_threshold_notification_message_at]); passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  assert(passive_risk_threshold_notification_message_read.rule_type == passive_risk_threshold_notification_message_written.rule_type);
  assert(passive_risk_threshold_notification_message_read.latest_percentage == passive_risk_threshold_notification_message_written.latest_percentage);
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> assert(passive_risk_threshold_notification_message_read.breach_id_optional[passive_risk_threshold_notification_message_at] == passive_risk_threshold_notification_message_written.breach_id_optional[passive_risk_threshold_notification_message_at]); passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  passive_risk_threshold_notification_message_at = 0;
  do
  :: passive_risk_threshold_notification_message_at < 8 -> assert(passive_risk_threshold_notification_message_read.transact_time[passive_risk_threshold_notification_message_at] == passive_risk_threshold_notification_message_written.transact_time[passive_risk_threshold_notification_message_at]); passive_risk_threshold_notification_message_at = passive_risk_threshold_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Order Allow Iso Orders State Message: 33 bytes ------------------- */

/* SingleOrderAllowISOOrdersStateMessage */
typedef SingleOrderAllowIsoOrdersStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte allow_iso_orders
};

int single_order_allow_iso_orders_state_message_at;

/* every byte of Single Order Allow Iso Orders State Message set to one value */
inline fill_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_record, single_order_allow_iso_orders_state_message_value) {
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 20 -> single_order_allow_iso_orders_state_message_record.cl_ord_id_optional[single_order_allow_iso_orders_state_message_at] = single_order_allow_iso_orders_state_message_value; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 6 -> single_order_allow_iso_orders_state_message_record.underlier_optional[single_order_allow_iso_orders_state_message_at] = single_order_allow_iso_orders_state_message_value; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 4 -> single_order_allow_iso_orders_state_message_record.efid_optional[single_order_allow_iso_orders_state_message_at] = single_order_allow_iso_orders_state_message_value; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 2 -> single_order_allow_iso_orders_state_message_record.risk_group_id[single_order_allow_iso_orders_state_message_at] = single_order_allow_iso_orders_state_message_value; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_record.allow_iso_orders = single_order_allow_iso_orders_state_message_value;
  skip
}

/* each byte of Single Order Allow Iso Orders State Message set to where it lies, so a field read out of place says so */
inline ramp_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_record, single_order_allow_iso_orders_state_message_base) {
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 20 -> single_order_allow_iso_orders_state_message_record.cl_ord_id_optional[single_order_allow_iso_orders_state_message_at] = (single_order_allow_iso_orders_state_message_base + 0 + single_order_allow_iso_orders_state_message_at + 1) % 256; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 6 -> single_order_allow_iso_orders_state_message_record.underlier_optional[single_order_allow_iso_orders_state_message_at] = (single_order_allow_iso_orders_state_message_base + 20 + single_order_allow_iso_orders_state_message_at + 1) % 256; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 4 -> single_order_allow_iso_orders_state_message_record.efid_optional[single_order_allow_iso_orders_state_message_at] = (single_order_allow_iso_orders_state_message_base + 26 + single_order_allow_iso_orders_state_message_at + 1) % 256; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 2 -> single_order_allow_iso_orders_state_message_record.risk_group_id[single_order_allow_iso_orders_state_message_at] = (single_order_allow_iso_orders_state_message_base + 30 + single_order_allow_iso_orders_state_message_at + 1) % 256; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_record.allow_iso_orders = (single_order_allow_iso_orders_state_message_base + 32 + 1) % 256;
  skip
}

/* Single Order Allow Iso Orders State Message to the wire, 33 bytes from where the cursor stands */
inline encode_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_record) {
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 20 -> wire[at] = single_order_allow_iso_orders_state_message_record.cl_ord_id_optional[single_order_allow_iso_orders_state_message_at]; at = at + 1; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 6 -> wire[at] = single_order_allow_iso_orders_state_message_record.underlier_optional[single_order_allow_iso_orders_state_message_at]; at = at + 1; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 4 -> wire[at] = single_order_allow_iso_orders_state_message_record.efid_optional[single_order_allow_iso_orders_state_message_at]; at = at + 1; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 2 -> wire[at] = single_order_allow_iso_orders_state_message_record.risk_group_id[single_order_allow_iso_orders_state_message_at]; at = at + 1; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  wire[at] = single_order_allow_iso_orders_state_message_record.allow_iso_orders; at = at + 1;
  skip
}

/* Single Order Allow Iso Orders State Message off the wire, 33 bytes from where the cursor stands */
inline decode_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_record) {
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 20 -> single_order_allow_iso_orders_state_message_record.cl_ord_id_optional[single_order_allow_iso_orders_state_message_at] = wire[at]; at = at + 1; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 6 -> single_order_allow_iso_orders_state_message_record.underlier_optional[single_order_allow_iso_orders_state_message_at] = wire[at]; at = at + 1; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 4 -> single_order_allow_iso_orders_state_message_record.efid_optional[single_order_allow_iso_orders_state_message_at] = wire[at]; at = at + 1; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 2 -> single_order_allow_iso_orders_state_message_record.risk_group_id[single_order_allow_iso_orders_state_message_at] = wire[at]; at = at + 1; single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_record.allow_iso_orders = wire[at]; at = at + 1;
  skip
}

/* what was read of Single Order Allow Iso Orders State Message is what was written, byte for byte */
inline equal_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_read, single_order_allow_iso_orders_state_message_written) {
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 20 -> assert(single_order_allow_iso_orders_state_message_read.cl_ord_id_optional[single_order_allow_iso_orders_state_message_at] == single_order_allow_iso_orders_state_message_written.cl_ord_id_optional[single_order_allow_iso_orders_state_message_at]); single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 6 -> assert(single_order_allow_iso_orders_state_message_read.underlier_optional[single_order_allow_iso_orders_state_message_at] == single_order_allow_iso_orders_state_message_written.underlier_optional[single_order_allow_iso_orders_state_message_at]); single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 4 -> assert(single_order_allow_iso_orders_state_message_read.efid_optional[single_order_allow_iso_orders_state_message_at] == single_order_allow_iso_orders_state_message_written.efid_optional[single_order_allow_iso_orders_state_message_at]); single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_state_message_at = 0;
  do
  :: single_order_allow_iso_orders_state_message_at < 2 -> assert(single_order_allow_iso_orders_state_message_read.risk_group_id[single_order_allow_iso_orders_state_message_at] == single_order_allow_iso_orders_state_message_written.risk_group_id[single_order_allow_iso_orders_state_message_at]); single_order_allow_iso_orders_state_message_at = single_order_allow_iso_orders_state_message_at + 1
  :: else -> break
  od;
  assert(single_order_allow_iso_orders_state_message_read.allow_iso_orders == single_order_allow_iso_orders_state_message_written.allow_iso_orders);
  skip
}

/* ---- Single Order Allow Orders In Crossed Market State Message: 33 bytes ----- */

/* SingleOrderAllowOrdersInCrossedMarketStateMessage */
typedef SingleOrderAllowOrdersInCrossedMarketStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte allow_orders
};

int single_order_allow_orders_in_crossed_market_state_message_at;

/* every byte of Single Order Allow Orders In Crossed Market State Message set to one value */
inline fill_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_record, single_order_allow_orders_in_crossed_market_state_message_value) {
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 20 -> single_order_allow_orders_in_crossed_market_state_message_record.cl_ord_id_optional[single_order_allow_orders_in_crossed_market_state_message_at] = single_order_allow_orders_in_crossed_market_state_message_value; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 6 -> single_order_allow_orders_in_crossed_market_state_message_record.underlier_optional[single_order_allow_orders_in_crossed_market_state_message_at] = single_order_allow_orders_in_crossed_market_state_message_value; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 4 -> single_order_allow_orders_in_crossed_market_state_message_record.efid_optional[single_order_allow_orders_in_crossed_market_state_message_at] = single_order_allow_orders_in_crossed_market_state_message_value; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 2 -> single_order_allow_orders_in_crossed_market_state_message_record.risk_group_id[single_order_allow_orders_in_crossed_market_state_message_at] = single_order_allow_orders_in_crossed_market_state_message_value; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_record.allow_orders = single_order_allow_orders_in_crossed_market_state_message_value;
  skip
}

/* each byte of Single Order Allow Orders In Crossed Market State Message set to where it lies, so a field read out of place says so */
inline ramp_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_record, single_order_allow_orders_in_crossed_market_state_message_base) {
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 20 -> single_order_allow_orders_in_crossed_market_state_message_record.cl_ord_id_optional[single_order_allow_orders_in_crossed_market_state_message_at] = (single_order_allow_orders_in_crossed_market_state_message_base + 0 + single_order_allow_orders_in_crossed_market_state_message_at + 1) % 256; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 6 -> single_order_allow_orders_in_crossed_market_state_message_record.underlier_optional[single_order_allow_orders_in_crossed_market_state_message_at] = (single_order_allow_orders_in_crossed_market_state_message_base + 20 + single_order_allow_orders_in_crossed_market_state_message_at + 1) % 256; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 4 -> single_order_allow_orders_in_crossed_market_state_message_record.efid_optional[single_order_allow_orders_in_crossed_market_state_message_at] = (single_order_allow_orders_in_crossed_market_state_message_base + 26 + single_order_allow_orders_in_crossed_market_state_message_at + 1) % 256; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 2 -> single_order_allow_orders_in_crossed_market_state_message_record.risk_group_id[single_order_allow_orders_in_crossed_market_state_message_at] = (single_order_allow_orders_in_crossed_market_state_message_base + 30 + single_order_allow_orders_in_crossed_market_state_message_at + 1) % 256; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_record.allow_orders = (single_order_allow_orders_in_crossed_market_state_message_base + 32 + 1) % 256;
  skip
}

/* Single Order Allow Orders In Crossed Market State Message to the wire, 33 bytes from where the cursor stands */
inline encode_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_record) {
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 20 -> wire[at] = single_order_allow_orders_in_crossed_market_state_message_record.cl_ord_id_optional[single_order_allow_orders_in_crossed_market_state_message_at]; at = at + 1; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 6 -> wire[at] = single_order_allow_orders_in_crossed_market_state_message_record.underlier_optional[single_order_allow_orders_in_crossed_market_state_message_at]; at = at + 1; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 4 -> wire[at] = single_order_allow_orders_in_crossed_market_state_message_record.efid_optional[single_order_allow_orders_in_crossed_market_state_message_at]; at = at + 1; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 2 -> wire[at] = single_order_allow_orders_in_crossed_market_state_message_record.risk_group_id[single_order_allow_orders_in_crossed_market_state_message_at]; at = at + 1; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  wire[at] = single_order_allow_orders_in_crossed_market_state_message_record.allow_orders; at = at + 1;
  skip
}

/* Single Order Allow Orders In Crossed Market State Message off the wire, 33 bytes from where the cursor stands */
inline decode_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_record) {
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 20 -> single_order_allow_orders_in_crossed_market_state_message_record.cl_ord_id_optional[single_order_allow_orders_in_crossed_market_state_message_at] = wire[at]; at = at + 1; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 6 -> single_order_allow_orders_in_crossed_market_state_message_record.underlier_optional[single_order_allow_orders_in_crossed_market_state_message_at] = wire[at]; at = at + 1; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 4 -> single_order_allow_orders_in_crossed_market_state_message_record.efid_optional[single_order_allow_orders_in_crossed_market_state_message_at] = wire[at]; at = at + 1; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 2 -> single_order_allow_orders_in_crossed_market_state_message_record.risk_group_id[single_order_allow_orders_in_crossed_market_state_message_at] = wire[at]; at = at + 1; single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_record.allow_orders = wire[at]; at = at + 1;
  skip
}

/* what was read of Single Order Allow Orders In Crossed Market State Message is what was written, byte for byte */
inline equal_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_read, single_order_allow_orders_in_crossed_market_state_message_written) {
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 20 -> assert(single_order_allow_orders_in_crossed_market_state_message_read.cl_ord_id_optional[single_order_allow_orders_in_crossed_market_state_message_at] == single_order_allow_orders_in_crossed_market_state_message_written.cl_ord_id_optional[single_order_allow_orders_in_crossed_market_state_message_at]); single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 6 -> assert(single_order_allow_orders_in_crossed_market_state_message_read.underlier_optional[single_order_allow_orders_in_crossed_market_state_message_at] == single_order_allow_orders_in_crossed_market_state_message_written.underlier_optional[single_order_allow_orders_in_crossed_market_state_message_at]); single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 4 -> assert(single_order_allow_orders_in_crossed_market_state_message_read.efid_optional[single_order_allow_orders_in_crossed_market_state_message_at] == single_order_allow_orders_in_crossed_market_state_message_written.efid_optional[single_order_allow_orders_in_crossed_market_state_message_at]); single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_state_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_state_message_at < 2 -> assert(single_order_allow_orders_in_crossed_market_state_message_read.risk_group_id[single_order_allow_orders_in_crossed_market_state_message_at] == single_order_allow_orders_in_crossed_market_state_message_written.risk_group_id[single_order_allow_orders_in_crossed_market_state_message_at]); single_order_allow_orders_in_crossed_market_state_message_at = single_order_allow_orders_in_crossed_market_state_message_at + 1
  :: else -> break
  od;
  assert(single_order_allow_orders_in_crossed_market_state_message_read.allow_orders == single_order_allow_orders_in_crossed_market_state_message_written.allow_orders);
  skip
}

/* ---- Single Order Max Notional Threshold State Message: 36 bytes ------------- */

/* SingleOrderMaxNotionalThresholdStateMessage */
typedef SingleOrderMaxNotionalThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte max_notional_in_dollars[4]
};

int single_order_max_notional_threshold_state_message_at;

/* every byte of Single Order Max Notional Threshold State Message set to one value */
inline fill_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_record, single_order_max_notional_threshold_state_message_value) {
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 20 -> single_order_max_notional_threshold_state_message_record.cl_ord_id_optional[single_order_max_notional_threshold_state_message_at] = single_order_max_notional_threshold_state_message_value; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 6 -> single_order_max_notional_threshold_state_message_record.underlier_optional[single_order_max_notional_threshold_state_message_at] = single_order_max_notional_threshold_state_message_value; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> single_order_max_notional_threshold_state_message_record.efid_optional[single_order_max_notional_threshold_state_message_at] = single_order_max_notional_threshold_state_message_value; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 2 -> single_order_max_notional_threshold_state_message_record.risk_group_id[single_order_max_notional_threshold_state_message_at] = single_order_max_notional_threshold_state_message_value; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> single_order_max_notional_threshold_state_message_record.max_notional_in_dollars[single_order_max_notional_threshold_state_message_at] = single_order_max_notional_threshold_state_message_value; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Order Max Notional Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_record, single_order_max_notional_threshold_state_message_base) {
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 20 -> single_order_max_notional_threshold_state_message_record.cl_ord_id_optional[single_order_max_notional_threshold_state_message_at] = (single_order_max_notional_threshold_state_message_base + 0 + single_order_max_notional_threshold_state_message_at + 1) % 256; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 6 -> single_order_max_notional_threshold_state_message_record.underlier_optional[single_order_max_notional_threshold_state_message_at] = (single_order_max_notional_threshold_state_message_base + 20 + single_order_max_notional_threshold_state_message_at + 1) % 256; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> single_order_max_notional_threshold_state_message_record.efid_optional[single_order_max_notional_threshold_state_message_at] = (single_order_max_notional_threshold_state_message_base + 26 + single_order_max_notional_threshold_state_message_at + 1) % 256; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 2 -> single_order_max_notional_threshold_state_message_record.risk_group_id[single_order_max_notional_threshold_state_message_at] = (single_order_max_notional_threshold_state_message_base + 30 + single_order_max_notional_threshold_state_message_at + 1) % 256; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> single_order_max_notional_threshold_state_message_record.max_notional_in_dollars[single_order_max_notional_threshold_state_message_at] = (single_order_max_notional_threshold_state_message_base + 32 + single_order_max_notional_threshold_state_message_at + 1) % 256; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Order Max Notional Threshold State Message to the wire, 36 bytes from where the cursor stands */
inline encode_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_record) {
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 20 -> wire[at] = single_order_max_notional_threshold_state_message_record.cl_ord_id_optional[single_order_max_notional_threshold_state_message_at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 6 -> wire[at] = single_order_max_notional_threshold_state_message_record.underlier_optional[single_order_max_notional_threshold_state_message_at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> wire[at] = single_order_max_notional_threshold_state_message_record.efid_optional[single_order_max_notional_threshold_state_message_at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 2 -> wire[at] = single_order_max_notional_threshold_state_message_record.risk_group_id[single_order_max_notional_threshold_state_message_at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> wire[at] = single_order_max_notional_threshold_state_message_record.max_notional_in_dollars[single_order_max_notional_threshold_state_message_at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Order Max Notional Threshold State Message off the wire, 36 bytes from where the cursor stands */
inline decode_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_record) {
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 20 -> single_order_max_notional_threshold_state_message_record.cl_ord_id_optional[single_order_max_notional_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 6 -> single_order_max_notional_threshold_state_message_record.underlier_optional[single_order_max_notional_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> single_order_max_notional_threshold_state_message_record.efid_optional[single_order_max_notional_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 2 -> single_order_max_notional_threshold_state_message_record.risk_group_id[single_order_max_notional_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> single_order_max_notional_threshold_state_message_record.max_notional_in_dollars[single_order_max_notional_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Order Max Notional Threshold State Message is what was written, byte for byte */
inline equal_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_read, single_order_max_notional_threshold_state_message_written) {
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 20 -> assert(single_order_max_notional_threshold_state_message_read.cl_ord_id_optional[single_order_max_notional_threshold_state_message_at] == single_order_max_notional_threshold_state_message_written.cl_ord_id_optional[single_order_max_notional_threshold_state_message_at]); single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 6 -> assert(single_order_max_notional_threshold_state_message_read.underlier_optional[single_order_max_notional_threshold_state_message_at] == single_order_max_notional_threshold_state_message_written.underlier_optional[single_order_max_notional_threshold_state_message_at]); single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> assert(single_order_max_notional_threshold_state_message_read.efid_optional[single_order_max_notional_threshold_state_message_at] == single_order_max_notional_threshold_state_message_written.efid_optional[single_order_max_notional_threshold_state_message_at]); single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 2 -> assert(single_order_max_notional_threshold_state_message_read.risk_group_id[single_order_max_notional_threshold_state_message_at] == single_order_max_notional_threshold_state_message_written.risk_group_id[single_order_max_notional_threshold_state_message_at]); single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_threshold_state_message_at = 0;
  do
  :: single_order_max_notional_threshold_state_message_at < 4 -> assert(single_order_max_notional_threshold_state_message_read.max_notional_in_dollars[single_order_max_notional_threshold_state_message_at] == single_order_max_notional_threshold_state_message_written.max_notional_in_dollars[single_order_max_notional_threshold_state_message_at]); single_order_max_notional_threshold_state_message_at = single_order_max_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Order Max Contracts Threshold State Message: 36 bytes ------------ */

/* SingleOrderMaxContractsThresholdStateMessage */
typedef SingleOrderMaxContractsThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte max_contracts[4]
};

int single_order_max_contracts_threshold_state_message_at;

/* every byte of Single Order Max Contracts Threshold State Message set to one value */
inline fill_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_record, single_order_max_contracts_threshold_state_message_value) {
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 20 -> single_order_max_contracts_threshold_state_message_record.cl_ord_id_optional[single_order_max_contracts_threshold_state_message_at] = single_order_max_contracts_threshold_state_message_value; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 6 -> single_order_max_contracts_threshold_state_message_record.underlier_optional[single_order_max_contracts_threshold_state_message_at] = single_order_max_contracts_threshold_state_message_value; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> single_order_max_contracts_threshold_state_message_record.efid_optional[single_order_max_contracts_threshold_state_message_at] = single_order_max_contracts_threshold_state_message_value; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 2 -> single_order_max_contracts_threshold_state_message_record.risk_group_id[single_order_max_contracts_threshold_state_message_at] = single_order_max_contracts_threshold_state_message_value; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> single_order_max_contracts_threshold_state_message_record.max_contracts[single_order_max_contracts_threshold_state_message_at] = single_order_max_contracts_threshold_state_message_value; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Order Max Contracts Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_record, single_order_max_contracts_threshold_state_message_base) {
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 20 -> single_order_max_contracts_threshold_state_message_record.cl_ord_id_optional[single_order_max_contracts_threshold_state_message_at] = (single_order_max_contracts_threshold_state_message_base + 0 + single_order_max_contracts_threshold_state_message_at + 1) % 256; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 6 -> single_order_max_contracts_threshold_state_message_record.underlier_optional[single_order_max_contracts_threshold_state_message_at] = (single_order_max_contracts_threshold_state_message_base + 20 + single_order_max_contracts_threshold_state_message_at + 1) % 256; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> single_order_max_contracts_threshold_state_message_record.efid_optional[single_order_max_contracts_threshold_state_message_at] = (single_order_max_contracts_threshold_state_message_base + 26 + single_order_max_contracts_threshold_state_message_at + 1) % 256; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 2 -> single_order_max_contracts_threshold_state_message_record.risk_group_id[single_order_max_contracts_threshold_state_message_at] = (single_order_max_contracts_threshold_state_message_base + 30 + single_order_max_contracts_threshold_state_message_at + 1) % 256; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> single_order_max_contracts_threshold_state_message_record.max_contracts[single_order_max_contracts_threshold_state_message_at] = (single_order_max_contracts_threshold_state_message_base + 32 + single_order_max_contracts_threshold_state_message_at + 1) % 256; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Order Max Contracts Threshold State Message to the wire, 36 bytes from where the cursor stands */
inline encode_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_record) {
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 20 -> wire[at] = single_order_max_contracts_threshold_state_message_record.cl_ord_id_optional[single_order_max_contracts_threshold_state_message_at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 6 -> wire[at] = single_order_max_contracts_threshold_state_message_record.underlier_optional[single_order_max_contracts_threshold_state_message_at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> wire[at] = single_order_max_contracts_threshold_state_message_record.efid_optional[single_order_max_contracts_threshold_state_message_at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 2 -> wire[at] = single_order_max_contracts_threshold_state_message_record.risk_group_id[single_order_max_contracts_threshold_state_message_at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> wire[at] = single_order_max_contracts_threshold_state_message_record.max_contracts[single_order_max_contracts_threshold_state_message_at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Order Max Contracts Threshold State Message off the wire, 36 bytes from where the cursor stands */
inline decode_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_record) {
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 20 -> single_order_max_contracts_threshold_state_message_record.cl_ord_id_optional[single_order_max_contracts_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 6 -> single_order_max_contracts_threshold_state_message_record.underlier_optional[single_order_max_contracts_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> single_order_max_contracts_threshold_state_message_record.efid_optional[single_order_max_contracts_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 2 -> single_order_max_contracts_threshold_state_message_record.risk_group_id[single_order_max_contracts_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> single_order_max_contracts_threshold_state_message_record.max_contracts[single_order_max_contracts_threshold_state_message_at] = wire[at]; at = at + 1; single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Order Max Contracts Threshold State Message is what was written, byte for byte */
inline equal_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_read, single_order_max_contracts_threshold_state_message_written) {
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 20 -> assert(single_order_max_contracts_threshold_state_message_read.cl_ord_id_optional[single_order_max_contracts_threshold_state_message_at] == single_order_max_contracts_threshold_state_message_written.cl_ord_id_optional[single_order_max_contracts_threshold_state_message_at]); single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 6 -> assert(single_order_max_contracts_threshold_state_message_read.underlier_optional[single_order_max_contracts_threshold_state_message_at] == single_order_max_contracts_threshold_state_message_written.underlier_optional[single_order_max_contracts_threshold_state_message_at]); single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> assert(single_order_max_contracts_threshold_state_message_read.efid_optional[single_order_max_contracts_threshold_state_message_at] == single_order_max_contracts_threshold_state_message_written.efid_optional[single_order_max_contracts_threshold_state_message_at]); single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 2 -> assert(single_order_max_contracts_threshold_state_message_read.risk_group_id[single_order_max_contracts_threshold_state_message_at] == single_order_max_contracts_threshold_state_message_written.risk_group_id[single_order_max_contracts_threshold_state_message_at]); single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_threshold_state_message_at = 0;
  do
  :: single_order_max_contracts_threshold_state_message_at < 4 -> assert(single_order_max_contracts_threshold_state_message_read.max_contracts[single_order_max_contracts_threshold_state_message_at] == single_order_max_contracts_threshold_state_message_written.max_contracts[single_order_max_contracts_threshold_state_message_at]); single_order_max_contracts_threshold_state_message_at = single_order_max_contracts_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Risk Settings Query Done Message: 24 bytes ------------------------------ */

/* RiskSettingsQueryDoneMessage */
typedef RiskSettingsQueryDoneMessage {
  byte cl_ord_id[20];
  byte number_msgs_sent[4]
};

int risk_settings_query_done_message_at;

/* every byte of Risk Settings Query Done Message set to one value */
inline fill_risk_settings_query_done_message(risk_settings_query_done_message_record, risk_settings_query_done_message_value) {
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 20 -> risk_settings_query_done_message_record.cl_ord_id[risk_settings_query_done_message_at] = risk_settings_query_done_message_value; risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 4 -> risk_settings_query_done_message_record.number_msgs_sent[risk_settings_query_done_message_at] = risk_settings_query_done_message_value; risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Risk Settings Query Done Message set to where it lies, so a field read out of place says so */
inline ramp_risk_settings_query_done_message(risk_settings_query_done_message_record, risk_settings_query_done_message_base) {
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 20 -> risk_settings_query_done_message_record.cl_ord_id[risk_settings_query_done_message_at] = (risk_settings_query_done_message_base + 0 + risk_settings_query_done_message_at + 1) % 256; risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 4 -> risk_settings_query_done_message_record.number_msgs_sent[risk_settings_query_done_message_at] = (risk_settings_query_done_message_base + 20 + risk_settings_query_done_message_at + 1) % 256; risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Settings Query Done Message to the wire, 24 bytes from where the cursor stands */
inline encode_risk_settings_query_done_message(risk_settings_query_done_message_record) {
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 20 -> wire[at] = risk_settings_query_done_message_record.cl_ord_id[risk_settings_query_done_message_at]; at = at + 1; risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 4 -> wire[at] = risk_settings_query_done_message_record.number_msgs_sent[risk_settings_query_done_message_at]; at = at + 1; risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Settings Query Done Message off the wire, 24 bytes from where the cursor stands */
inline decode_risk_settings_query_done_message(risk_settings_query_done_message_record) {
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 20 -> risk_settings_query_done_message_record.cl_ord_id[risk_settings_query_done_message_at] = wire[at]; at = at + 1; risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 4 -> risk_settings_query_done_message_record.number_msgs_sent[risk_settings_query_done_message_at] = wire[at]; at = at + 1; risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Risk Settings Query Done Message is what was written, byte for byte */
inline equal_risk_settings_query_done_message(risk_settings_query_done_message_read, risk_settings_query_done_message_written) {
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 20 -> assert(risk_settings_query_done_message_read.cl_ord_id[risk_settings_query_done_message_at] == risk_settings_query_done_message_written.cl_ord_id[risk_settings_query_done_message_at]); risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  risk_settings_query_done_message_at = 0;
  do
  :: risk_settings_query_done_message_at < 4 -> assert(risk_settings_query_done_message_read.number_msgs_sent[risk_settings_query_done_message_at] == risk_settings_query_done_message_written.number_msgs_sent[risk_settings_query_done_message_at]); risk_settings_query_done_message_at = risk_settings_query_done_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Risk Settings Query Rej Message: 22 bytes ------------------------------- */

/* RiskSettingsQueryRejMessage */
typedef RiskSettingsQueryRejMessage {
  byte cl_ord_id[20];
  byte reject_reason[2]
};

int risk_settings_query_rej_message_at;

/* every byte of Risk Settings Query Rej Message set to one value */
inline fill_risk_settings_query_rej_message(risk_settings_query_rej_message_record, risk_settings_query_rej_message_value) {
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 20 -> risk_settings_query_rej_message_record.cl_ord_id[risk_settings_query_rej_message_at] = risk_settings_query_rej_message_value; risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 2 -> risk_settings_query_rej_message_record.reject_reason[risk_settings_query_rej_message_at] = risk_settings_query_rej_message_value; risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Risk Settings Query Rej Message set to where it lies, so a field read out of place says so */
inline ramp_risk_settings_query_rej_message(risk_settings_query_rej_message_record, risk_settings_query_rej_message_base) {
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 20 -> risk_settings_query_rej_message_record.cl_ord_id[risk_settings_query_rej_message_at] = (risk_settings_query_rej_message_base + 0 + risk_settings_query_rej_message_at + 1) % 256; risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 2 -> risk_settings_query_rej_message_record.reject_reason[risk_settings_query_rej_message_at] = (risk_settings_query_rej_message_base + 20 + risk_settings_query_rej_message_at + 1) % 256; risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Settings Query Rej Message to the wire, 22 bytes from where the cursor stands */
inline encode_risk_settings_query_rej_message(risk_settings_query_rej_message_record) {
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 20 -> wire[at] = risk_settings_query_rej_message_record.cl_ord_id[risk_settings_query_rej_message_at]; at = at + 1; risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 2 -> wire[at] = risk_settings_query_rej_message_record.reject_reason[risk_settings_query_rej_message_at]; at = at + 1; risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Settings Query Rej Message off the wire, 22 bytes from where the cursor stands */
inline decode_risk_settings_query_rej_message(risk_settings_query_rej_message_record) {
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 20 -> risk_settings_query_rej_message_record.cl_ord_id[risk_settings_query_rej_message_at] = wire[at]; at = at + 1; risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 2 -> risk_settings_query_rej_message_record.reject_reason[risk_settings_query_rej_message_at] = wire[at]; at = at + 1; risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Risk Settings Query Rej Message is what was written, byte for byte */
inline equal_risk_settings_query_rej_message(risk_settings_query_rej_message_read, risk_settings_query_rej_message_written) {
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 20 -> assert(risk_settings_query_rej_message_read.cl_ord_id[risk_settings_query_rej_message_at] == risk_settings_query_rej_message_written.cl_ord_id[risk_settings_query_rej_message_at]); risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  risk_settings_query_rej_message_at = 0;
  do
  :: risk_settings_query_rej_message_at < 2 -> assert(risk_settings_query_rej_message_read.reject_reason[risk_settings_query_rej_message_at] == risk_settings_query_rej_message_written.reject_reason[risk_settings_query_rej_message_at]); risk_settings_query_rej_message_at = risk_settings_query_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Manual Cp Breach Trigger Rej Message: 34 bytes -------------------------- */

/* ManualCPBreachTriggerRejMessage */
typedef ManualCpBreachTriggerRejMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte reject_reason[2]
};

int manual_cp_breach_trigger_rej_message_at;

/* every byte of Manual Cp Breach Trigger Rej Message set to one value */
inline fill_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_record, manual_cp_breach_trigger_rej_message_value) {
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 20 -> manual_cp_breach_trigger_rej_message_record.cl_ord_id[manual_cp_breach_trigger_rej_message_at] = manual_cp_breach_trigger_rej_message_value; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 6 -> manual_cp_breach_trigger_rej_message_record.underlier_optional[manual_cp_breach_trigger_rej_message_at] = manual_cp_breach_trigger_rej_message_value; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 4 -> manual_cp_breach_trigger_rej_message_record.efid_optional[manual_cp_breach_trigger_rej_message_at] = manual_cp_breach_trigger_rej_message_value; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> manual_cp_breach_trigger_rej_message_record.risk_group_id[manual_cp_breach_trigger_rej_message_at] = manual_cp_breach_trigger_rej_message_value; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> manual_cp_breach_trigger_rej_message_record.reject_reason[manual_cp_breach_trigger_rej_message_at] = manual_cp_breach_trigger_rej_message_value; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Manual Cp Breach Trigger Rej Message set to where it lies, so a field read out of place says so */
inline ramp_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_record, manual_cp_breach_trigger_rej_message_base) {
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 20 -> manual_cp_breach_trigger_rej_message_record.cl_ord_id[manual_cp_breach_trigger_rej_message_at] = (manual_cp_breach_trigger_rej_message_base + 0 + manual_cp_breach_trigger_rej_message_at + 1) % 256; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 6 -> manual_cp_breach_trigger_rej_message_record.underlier_optional[manual_cp_breach_trigger_rej_message_at] = (manual_cp_breach_trigger_rej_message_base + 20 + manual_cp_breach_trigger_rej_message_at + 1) % 256; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 4 -> manual_cp_breach_trigger_rej_message_record.efid_optional[manual_cp_breach_trigger_rej_message_at] = (manual_cp_breach_trigger_rej_message_base + 26 + manual_cp_breach_trigger_rej_message_at + 1) % 256; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> manual_cp_breach_trigger_rej_message_record.risk_group_id[manual_cp_breach_trigger_rej_message_at] = (manual_cp_breach_trigger_rej_message_base + 30 + manual_cp_breach_trigger_rej_message_at + 1) % 256; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> manual_cp_breach_trigger_rej_message_record.reject_reason[manual_cp_breach_trigger_rej_message_at] = (manual_cp_breach_trigger_rej_message_base + 32 + manual_cp_breach_trigger_rej_message_at + 1) % 256; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Manual Cp Breach Trigger Rej Message to the wire, 34 bytes from where the cursor stands */
inline encode_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_record) {
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 20 -> wire[at] = manual_cp_breach_trigger_rej_message_record.cl_ord_id[manual_cp_breach_trigger_rej_message_at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 6 -> wire[at] = manual_cp_breach_trigger_rej_message_record.underlier_optional[manual_cp_breach_trigger_rej_message_at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 4 -> wire[at] = manual_cp_breach_trigger_rej_message_record.efid_optional[manual_cp_breach_trigger_rej_message_at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> wire[at] = manual_cp_breach_trigger_rej_message_record.risk_group_id[manual_cp_breach_trigger_rej_message_at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> wire[at] = manual_cp_breach_trigger_rej_message_record.reject_reason[manual_cp_breach_trigger_rej_message_at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Manual Cp Breach Trigger Rej Message off the wire, 34 bytes from where the cursor stands */
inline decode_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_record) {
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 20 -> manual_cp_breach_trigger_rej_message_record.cl_ord_id[manual_cp_breach_trigger_rej_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 6 -> manual_cp_breach_trigger_rej_message_record.underlier_optional[manual_cp_breach_trigger_rej_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 4 -> manual_cp_breach_trigger_rej_message_record.efid_optional[manual_cp_breach_trigger_rej_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> manual_cp_breach_trigger_rej_message_record.risk_group_id[manual_cp_breach_trigger_rej_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> manual_cp_breach_trigger_rej_message_record.reject_reason[manual_cp_breach_trigger_rej_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Manual Cp Breach Trigger Rej Message is what was written, byte for byte */
inline equal_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_read, manual_cp_breach_trigger_rej_message_written) {
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 20 -> assert(manual_cp_breach_trigger_rej_message_read.cl_ord_id[manual_cp_breach_trigger_rej_message_at] == manual_cp_breach_trigger_rej_message_written.cl_ord_id[manual_cp_breach_trigger_rej_message_at]); manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 6 -> assert(manual_cp_breach_trigger_rej_message_read.underlier_optional[manual_cp_breach_trigger_rej_message_at] == manual_cp_breach_trigger_rej_message_written.underlier_optional[manual_cp_breach_trigger_rej_message_at]); manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 4 -> assert(manual_cp_breach_trigger_rej_message_read.efid_optional[manual_cp_breach_trigger_rej_message_at] == manual_cp_breach_trigger_rej_message_written.efid_optional[manual_cp_breach_trigger_rej_message_at]); manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> assert(manual_cp_breach_trigger_rej_message_read.risk_group_id[manual_cp_breach_trigger_rej_message_at] == manual_cp_breach_trigger_rej_message_written.risk_group_id[manual_cp_breach_trigger_rej_message_at]); manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_rej_message_at = 0;
  do
  :: manual_cp_breach_trigger_rej_message_at < 2 -> assert(manual_cp_breach_trigger_rej_message_read.reject_reason[manual_cp_breach_trigger_rej_message_at] == manual_cp_breach_trigger_rej_message_written.reject_reason[manual_cp_breach_trigger_rej_message_at]); manual_cp_breach_trigger_rej_message_at = manual_cp_breach_trigger_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Breach Clear Rej Message: 30 bytes -------------------------------------- */

/* BreachClearRejMessage */
typedef BreachClearRejMessage {
  byte cl_ord_id[20];
  byte breach_id[8];
  byte reject_reason[2]
};

int breach_clear_rej_message_at;

/* every byte of Breach Clear Rej Message set to one value */
inline fill_breach_clear_rej_message(breach_clear_rej_message_record, breach_clear_rej_message_value) {
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 20 -> breach_clear_rej_message_record.cl_ord_id[breach_clear_rej_message_at] = breach_clear_rej_message_value; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 8 -> breach_clear_rej_message_record.breach_id[breach_clear_rej_message_at] = breach_clear_rej_message_value; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 2 -> breach_clear_rej_message_record.reject_reason[breach_clear_rej_message_at] = breach_clear_rej_message_value; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Breach Clear Rej Message set to where it lies, so a field read out of place says so */
inline ramp_breach_clear_rej_message(breach_clear_rej_message_record, breach_clear_rej_message_base) {
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 20 -> breach_clear_rej_message_record.cl_ord_id[breach_clear_rej_message_at] = (breach_clear_rej_message_base + 0 + breach_clear_rej_message_at + 1) % 256; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 8 -> breach_clear_rej_message_record.breach_id[breach_clear_rej_message_at] = (breach_clear_rej_message_base + 20 + breach_clear_rej_message_at + 1) % 256; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 2 -> breach_clear_rej_message_record.reject_reason[breach_clear_rej_message_at] = (breach_clear_rej_message_base + 28 + breach_clear_rej_message_at + 1) % 256; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Breach Clear Rej Message to the wire, 30 bytes from where the cursor stands */
inline encode_breach_clear_rej_message(breach_clear_rej_message_record) {
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 20 -> wire[at] = breach_clear_rej_message_record.cl_ord_id[breach_clear_rej_message_at]; at = at + 1; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 8 -> wire[at] = breach_clear_rej_message_record.breach_id[breach_clear_rej_message_at]; at = at + 1; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 2 -> wire[at] = breach_clear_rej_message_record.reject_reason[breach_clear_rej_message_at]; at = at + 1; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* Breach Clear Rej Message off the wire, 30 bytes from where the cursor stands */
inline decode_breach_clear_rej_message(breach_clear_rej_message_record) {
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 20 -> breach_clear_rej_message_record.cl_ord_id[breach_clear_rej_message_at] = wire[at]; at = at + 1; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 8 -> breach_clear_rej_message_record.breach_id[breach_clear_rej_message_at] = wire[at]; at = at + 1; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 2 -> breach_clear_rej_message_record.reject_reason[breach_clear_rej_message_at] = wire[at]; at = at + 1; breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Breach Clear Rej Message is what was written, byte for byte */
inline equal_breach_clear_rej_message(breach_clear_rej_message_read, breach_clear_rej_message_written) {
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 20 -> assert(breach_clear_rej_message_read.cl_ord_id[breach_clear_rej_message_at] == breach_clear_rej_message_written.cl_ord_id[breach_clear_rej_message_at]); breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 8 -> assert(breach_clear_rej_message_read.breach_id[breach_clear_rej_message_at] == breach_clear_rej_message_written.breach_id[breach_clear_rej_message_at]); breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  breach_clear_rej_message_at = 0;
  do
  :: breach_clear_rej_message_at < 2 -> assert(breach_clear_rej_message_read.reject_reason[breach_clear_rej_message_at] == breach_clear_rej_message_written.reject_reason[breach_clear_rej_message_at]); breach_clear_rej_message_at = breach_clear_rej_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Breach Cleared Message: 28 bytes ---------------------------------------- */

/* BreachClearedMessage */
typedef BreachClearedMessage {
  byte cl_ord_id_optional[20];
  byte breach_id[8]
};

int breach_cleared_message_at;

/* every byte of Breach Cleared Message set to one value */
inline fill_breach_cleared_message(breach_cleared_message_record, breach_cleared_message_value) {
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 20 -> breach_cleared_message_record.cl_ord_id_optional[breach_cleared_message_at] = breach_cleared_message_value; breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 8 -> breach_cleared_message_record.breach_id[breach_cleared_message_at] = breach_cleared_message_value; breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Breach Cleared Message set to where it lies, so a field read out of place says so */
inline ramp_breach_cleared_message(breach_cleared_message_record, breach_cleared_message_base) {
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 20 -> breach_cleared_message_record.cl_ord_id_optional[breach_cleared_message_at] = (breach_cleared_message_base + 0 + breach_cleared_message_at + 1) % 256; breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 8 -> breach_cleared_message_record.breach_id[breach_cleared_message_at] = (breach_cleared_message_base + 20 + breach_cleared_message_at + 1) % 256; breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  skip
}

/* Breach Cleared Message to the wire, 28 bytes from where the cursor stands */
inline encode_breach_cleared_message(breach_cleared_message_record) {
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 20 -> wire[at] = breach_cleared_message_record.cl_ord_id_optional[breach_cleared_message_at]; at = at + 1; breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 8 -> wire[at] = breach_cleared_message_record.breach_id[breach_cleared_message_at]; at = at + 1; breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  skip
}

/* Breach Cleared Message off the wire, 28 bytes from where the cursor stands */
inline decode_breach_cleared_message(breach_cleared_message_record) {
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 20 -> breach_cleared_message_record.cl_ord_id_optional[breach_cleared_message_at] = wire[at]; at = at + 1; breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 8 -> breach_cleared_message_record.breach_id[breach_cleared_message_at] = wire[at]; at = at + 1; breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Breach Cleared Message is what was written, byte for byte */
inline equal_breach_cleared_message(breach_cleared_message_read, breach_cleared_message_written) {
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 20 -> assert(breach_cleared_message_read.cl_ord_id_optional[breach_cleared_message_at] == breach_cleared_message_written.cl_ord_id_optional[breach_cleared_message_at]); breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  breach_cleared_message_at = 0;
  do
  :: breach_cleared_message_at < 8 -> assert(breach_cleared_message_read.breach_id[breach_cleared_message_at] == breach_cleared_message_written.breach_id[breach_cleared_message_at]); breach_cleared_message_at = breach_cleared_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Gross Notional Threshold State Message: 36 bytes --------------------- */

/* CPGrossNotionalThresholdStateMessage */
typedef CpGrossNotionalThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4]
};

int cp_gross_notional_threshold_state_message_at;

/* every byte of Cp Gross Notional Threshold State Message set to one value */
inline fill_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_record, cp_gross_notional_threshold_state_message_value) {
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 20 -> cp_gross_notional_threshold_state_message_record.cl_ord_id_optional[cp_gross_notional_threshold_state_message_at] = cp_gross_notional_threshold_state_message_value; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 6 -> cp_gross_notional_threshold_state_message_record.underlier_optional[cp_gross_notional_threshold_state_message_at] = cp_gross_notional_threshold_state_message_value; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> cp_gross_notional_threshold_state_message_record.efid_optional[cp_gross_notional_threshold_state_message_at] = cp_gross_notional_threshold_state_message_value; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 2 -> cp_gross_notional_threshold_state_message_record.risk_group_id[cp_gross_notional_threshold_state_message_at] = cp_gross_notional_threshold_state_message_value; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> cp_gross_notional_threshold_state_message_record.price_in_dollars[cp_gross_notional_threshold_state_message_at] = cp_gross_notional_threshold_state_message_value; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Gross Notional Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_record, cp_gross_notional_threshold_state_message_base) {
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 20 -> cp_gross_notional_threshold_state_message_record.cl_ord_id_optional[cp_gross_notional_threshold_state_message_at] = (cp_gross_notional_threshold_state_message_base + 0 + cp_gross_notional_threshold_state_message_at + 1) % 256; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 6 -> cp_gross_notional_threshold_state_message_record.underlier_optional[cp_gross_notional_threshold_state_message_at] = (cp_gross_notional_threshold_state_message_base + 20 + cp_gross_notional_threshold_state_message_at + 1) % 256; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> cp_gross_notional_threshold_state_message_record.efid_optional[cp_gross_notional_threshold_state_message_at] = (cp_gross_notional_threshold_state_message_base + 26 + cp_gross_notional_threshold_state_message_at + 1) % 256; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 2 -> cp_gross_notional_threshold_state_message_record.risk_group_id[cp_gross_notional_threshold_state_message_at] = (cp_gross_notional_threshold_state_message_base + 30 + cp_gross_notional_threshold_state_message_at + 1) % 256; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> cp_gross_notional_threshold_state_message_record.price_in_dollars[cp_gross_notional_threshold_state_message_at] = (cp_gross_notional_threshold_state_message_base + 32 + cp_gross_notional_threshold_state_message_at + 1) % 256; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Gross Notional Threshold State Message to the wire, 36 bytes from where the cursor stands */
inline encode_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_record) {
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 20 -> wire[at] = cp_gross_notional_threshold_state_message_record.cl_ord_id_optional[cp_gross_notional_threshold_state_message_at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 6 -> wire[at] = cp_gross_notional_threshold_state_message_record.underlier_optional[cp_gross_notional_threshold_state_message_at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> wire[at] = cp_gross_notional_threshold_state_message_record.efid_optional[cp_gross_notional_threshold_state_message_at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 2 -> wire[at] = cp_gross_notional_threshold_state_message_record.risk_group_id[cp_gross_notional_threshold_state_message_at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> wire[at] = cp_gross_notional_threshold_state_message_record.price_in_dollars[cp_gross_notional_threshold_state_message_at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Gross Notional Threshold State Message off the wire, 36 bytes from where the cursor stands */
inline decode_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_record) {
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 20 -> cp_gross_notional_threshold_state_message_record.cl_ord_id_optional[cp_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 6 -> cp_gross_notional_threshold_state_message_record.underlier_optional[cp_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> cp_gross_notional_threshold_state_message_record.efid_optional[cp_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 2 -> cp_gross_notional_threshold_state_message_record.risk_group_id[cp_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> cp_gross_notional_threshold_state_message_record.price_in_dollars[cp_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Gross Notional Threshold State Message is what was written, byte for byte */
inline equal_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_read, cp_gross_notional_threshold_state_message_written) {
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 20 -> assert(cp_gross_notional_threshold_state_message_read.cl_ord_id_optional[cp_gross_notional_threshold_state_message_at] == cp_gross_notional_threshold_state_message_written.cl_ord_id_optional[cp_gross_notional_threshold_state_message_at]); cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 6 -> assert(cp_gross_notional_threshold_state_message_read.underlier_optional[cp_gross_notional_threshold_state_message_at] == cp_gross_notional_threshold_state_message_written.underlier_optional[cp_gross_notional_threshold_state_message_at]); cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> assert(cp_gross_notional_threshold_state_message_read.efid_optional[cp_gross_notional_threshold_state_message_at] == cp_gross_notional_threshold_state_message_written.efid_optional[cp_gross_notional_threshold_state_message_at]); cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 2 -> assert(cp_gross_notional_threshold_state_message_read.risk_group_id[cp_gross_notional_threshold_state_message_at] == cp_gross_notional_threshold_state_message_written.risk_group_id[cp_gross_notional_threshold_state_message_at]); cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_gross_notional_threshold_state_message_at < 4 -> assert(cp_gross_notional_threshold_state_message_read.price_in_dollars[cp_gross_notional_threshold_state_message_at] == cp_gross_notional_threshold_state_message_written.price_in_dollars[cp_gross_notional_threshold_state_message_at]); cp_gross_notional_threshold_state_message_at = cp_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Market Order Gross Notional Threshold State Message: 36 bytes -------- */

/* CPMarketOrderGrossNotionalThresholdStateMessage */
typedef CpMarketOrderGrossNotionalThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4]
};

int cp_market_order_gross_notional_threshold_state_message_at;

/* every byte of Cp Market Order Gross Notional Threshold State Message set to one value */
inline fill_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_record, cp_market_order_gross_notional_threshold_state_message_value) {
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 20 -> cp_market_order_gross_notional_threshold_state_message_record.cl_ord_id_optional[cp_market_order_gross_notional_threshold_state_message_at] = cp_market_order_gross_notional_threshold_state_message_value; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 6 -> cp_market_order_gross_notional_threshold_state_message_record.underlier_optional[cp_market_order_gross_notional_threshold_state_message_at] = cp_market_order_gross_notional_threshold_state_message_value; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> cp_market_order_gross_notional_threshold_state_message_record.efid_optional[cp_market_order_gross_notional_threshold_state_message_at] = cp_market_order_gross_notional_threshold_state_message_value; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 2 -> cp_market_order_gross_notional_threshold_state_message_record.risk_group_id[cp_market_order_gross_notional_threshold_state_message_at] = cp_market_order_gross_notional_threshold_state_message_value; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> cp_market_order_gross_notional_threshold_state_message_record.price_in_dollars[cp_market_order_gross_notional_threshold_state_message_at] = cp_market_order_gross_notional_threshold_state_message_value; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Market Order Gross Notional Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_record, cp_market_order_gross_notional_threshold_state_message_base) {
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 20 -> cp_market_order_gross_notional_threshold_state_message_record.cl_ord_id_optional[cp_market_order_gross_notional_threshold_state_message_at] = (cp_market_order_gross_notional_threshold_state_message_base + 0 + cp_market_order_gross_notional_threshold_state_message_at + 1) % 256; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 6 -> cp_market_order_gross_notional_threshold_state_message_record.underlier_optional[cp_market_order_gross_notional_threshold_state_message_at] = (cp_market_order_gross_notional_threshold_state_message_base + 20 + cp_market_order_gross_notional_threshold_state_message_at + 1) % 256; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> cp_market_order_gross_notional_threshold_state_message_record.efid_optional[cp_market_order_gross_notional_threshold_state_message_at] = (cp_market_order_gross_notional_threshold_state_message_base + 26 + cp_market_order_gross_notional_threshold_state_message_at + 1) % 256; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 2 -> cp_market_order_gross_notional_threshold_state_message_record.risk_group_id[cp_market_order_gross_notional_threshold_state_message_at] = (cp_market_order_gross_notional_threshold_state_message_base + 30 + cp_market_order_gross_notional_threshold_state_message_at + 1) % 256; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> cp_market_order_gross_notional_threshold_state_message_record.price_in_dollars[cp_market_order_gross_notional_threshold_state_message_at] = (cp_market_order_gross_notional_threshold_state_message_base + 32 + cp_market_order_gross_notional_threshold_state_message_at + 1) % 256; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Market Order Gross Notional Threshold State Message to the wire, 36 bytes from where the cursor stands */
inline encode_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_record) {
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 20 -> wire[at] = cp_market_order_gross_notional_threshold_state_message_record.cl_ord_id_optional[cp_market_order_gross_notional_threshold_state_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 6 -> wire[at] = cp_market_order_gross_notional_threshold_state_message_record.underlier_optional[cp_market_order_gross_notional_threshold_state_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> wire[at] = cp_market_order_gross_notional_threshold_state_message_record.efid_optional[cp_market_order_gross_notional_threshold_state_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 2 -> wire[at] = cp_market_order_gross_notional_threshold_state_message_record.risk_group_id[cp_market_order_gross_notional_threshold_state_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> wire[at] = cp_market_order_gross_notional_threshold_state_message_record.price_in_dollars[cp_market_order_gross_notional_threshold_state_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Market Order Gross Notional Threshold State Message off the wire, 36 bytes from where the cursor stands */
inline decode_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_record) {
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 20 -> cp_market_order_gross_notional_threshold_state_message_record.cl_ord_id_optional[cp_market_order_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 6 -> cp_market_order_gross_notional_threshold_state_message_record.underlier_optional[cp_market_order_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> cp_market_order_gross_notional_threshold_state_message_record.efid_optional[cp_market_order_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 2 -> cp_market_order_gross_notional_threshold_state_message_record.risk_group_id[cp_market_order_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> cp_market_order_gross_notional_threshold_state_message_record.price_in_dollars[cp_market_order_gross_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Market Order Gross Notional Threshold State Message is what was written, byte for byte */
inline equal_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_read, cp_market_order_gross_notional_threshold_state_message_written) {
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 20 -> assert(cp_market_order_gross_notional_threshold_state_message_read.cl_ord_id_optional[cp_market_order_gross_notional_threshold_state_message_at] == cp_market_order_gross_notional_threshold_state_message_written.cl_ord_id_optional[cp_market_order_gross_notional_threshold_state_message_at]); cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 6 -> assert(cp_market_order_gross_notional_threshold_state_message_read.underlier_optional[cp_market_order_gross_notional_threshold_state_message_at] == cp_market_order_gross_notional_threshold_state_message_written.underlier_optional[cp_market_order_gross_notional_threshold_state_message_at]); cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> assert(cp_market_order_gross_notional_threshold_state_message_read.efid_optional[cp_market_order_gross_notional_threshold_state_message_at] == cp_market_order_gross_notional_threshold_state_message_written.efid_optional[cp_market_order_gross_notional_threshold_state_message_at]); cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 2 -> assert(cp_market_order_gross_notional_threshold_state_message_read.risk_group_id[cp_market_order_gross_notional_threshold_state_message_at] == cp_market_order_gross_notional_threshold_state_message_written.risk_group_id[cp_market_order_gross_notional_threshold_state_message_at]); cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_state_message_at < 4 -> assert(cp_market_order_gross_notional_threshold_state_message_read.price_in_dollars[cp_market_order_gross_notional_threshold_state_message_at] == cp_market_order_gross_notional_threshold_state_message_written.price_in_dollars[cp_market_order_gross_notional_threshold_state_message_at]); cp_market_order_gross_notional_threshold_state_message_at = cp_market_order_gross_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Net Notional Threshold State Message: 36 bytes ----------------------- */

/* CPNetNotionalThresholdStateMessage */
typedef CpNetNotionalThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4]
};

int cp_net_notional_threshold_state_message_at;

/* every byte of Cp Net Notional Threshold State Message set to one value */
inline fill_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_record, cp_net_notional_threshold_state_message_value) {
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 20 -> cp_net_notional_threshold_state_message_record.cl_ord_id_optional[cp_net_notional_threshold_state_message_at] = cp_net_notional_threshold_state_message_value; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 6 -> cp_net_notional_threshold_state_message_record.underlier_optional[cp_net_notional_threshold_state_message_at] = cp_net_notional_threshold_state_message_value; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> cp_net_notional_threshold_state_message_record.efid_optional[cp_net_notional_threshold_state_message_at] = cp_net_notional_threshold_state_message_value; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 2 -> cp_net_notional_threshold_state_message_record.risk_group_id[cp_net_notional_threshold_state_message_at] = cp_net_notional_threshold_state_message_value; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> cp_net_notional_threshold_state_message_record.price_in_dollars[cp_net_notional_threshold_state_message_at] = cp_net_notional_threshold_state_message_value; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Net Notional Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_record, cp_net_notional_threshold_state_message_base) {
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 20 -> cp_net_notional_threshold_state_message_record.cl_ord_id_optional[cp_net_notional_threshold_state_message_at] = (cp_net_notional_threshold_state_message_base + 0 + cp_net_notional_threshold_state_message_at + 1) % 256; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 6 -> cp_net_notional_threshold_state_message_record.underlier_optional[cp_net_notional_threshold_state_message_at] = (cp_net_notional_threshold_state_message_base + 20 + cp_net_notional_threshold_state_message_at + 1) % 256; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> cp_net_notional_threshold_state_message_record.efid_optional[cp_net_notional_threshold_state_message_at] = (cp_net_notional_threshold_state_message_base + 26 + cp_net_notional_threshold_state_message_at + 1) % 256; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 2 -> cp_net_notional_threshold_state_message_record.risk_group_id[cp_net_notional_threshold_state_message_at] = (cp_net_notional_threshold_state_message_base + 30 + cp_net_notional_threshold_state_message_at + 1) % 256; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> cp_net_notional_threshold_state_message_record.price_in_dollars[cp_net_notional_threshold_state_message_at] = (cp_net_notional_threshold_state_message_base + 32 + cp_net_notional_threshold_state_message_at + 1) % 256; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Net Notional Threshold State Message to the wire, 36 bytes from where the cursor stands */
inline encode_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_record) {
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 20 -> wire[at] = cp_net_notional_threshold_state_message_record.cl_ord_id_optional[cp_net_notional_threshold_state_message_at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 6 -> wire[at] = cp_net_notional_threshold_state_message_record.underlier_optional[cp_net_notional_threshold_state_message_at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> wire[at] = cp_net_notional_threshold_state_message_record.efid_optional[cp_net_notional_threshold_state_message_at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 2 -> wire[at] = cp_net_notional_threshold_state_message_record.risk_group_id[cp_net_notional_threshold_state_message_at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> wire[at] = cp_net_notional_threshold_state_message_record.price_in_dollars[cp_net_notional_threshold_state_message_at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Net Notional Threshold State Message off the wire, 36 bytes from where the cursor stands */
inline decode_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_record) {
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 20 -> cp_net_notional_threshold_state_message_record.cl_ord_id_optional[cp_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 6 -> cp_net_notional_threshold_state_message_record.underlier_optional[cp_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> cp_net_notional_threshold_state_message_record.efid_optional[cp_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 2 -> cp_net_notional_threshold_state_message_record.risk_group_id[cp_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> cp_net_notional_threshold_state_message_record.price_in_dollars[cp_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Net Notional Threshold State Message is what was written, byte for byte */
inline equal_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_read, cp_net_notional_threshold_state_message_written) {
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 20 -> assert(cp_net_notional_threshold_state_message_read.cl_ord_id_optional[cp_net_notional_threshold_state_message_at] == cp_net_notional_threshold_state_message_written.cl_ord_id_optional[cp_net_notional_threshold_state_message_at]); cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 6 -> assert(cp_net_notional_threshold_state_message_read.underlier_optional[cp_net_notional_threshold_state_message_at] == cp_net_notional_threshold_state_message_written.underlier_optional[cp_net_notional_threshold_state_message_at]); cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> assert(cp_net_notional_threshold_state_message_read.efid_optional[cp_net_notional_threshold_state_message_at] == cp_net_notional_threshold_state_message_written.efid_optional[cp_net_notional_threshold_state_message_at]); cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 2 -> assert(cp_net_notional_threshold_state_message_read.risk_group_id[cp_net_notional_threshold_state_message_at] == cp_net_notional_threshold_state_message_written.risk_group_id[cp_net_notional_threshold_state_message_at]); cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_state_message_at = 0;
  do
  :: cp_net_notional_threshold_state_message_at < 4 -> assert(cp_net_notional_threshold_state_message_read.price_in_dollars[cp_net_notional_threshold_state_message_at] == cp_net_notional_threshold_state_message_written.price_in_dollars[cp_net_notional_threshold_state_message_at]); cp_net_notional_threshold_state_message_at = cp_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Market Order Net Notional Threshold State Message: 36 bytes ---------- */

/* CPMarketOrderNetNotionalThresholdStateMessage */
typedef CpMarketOrderNetNotionalThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4]
};

int cp_market_order_net_notional_threshold_state_message_at;

/* every byte of Cp Market Order Net Notional Threshold State Message set to one value */
inline fill_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_record, cp_market_order_net_notional_threshold_state_message_value) {
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 20 -> cp_market_order_net_notional_threshold_state_message_record.cl_ord_id_optional[cp_market_order_net_notional_threshold_state_message_at] = cp_market_order_net_notional_threshold_state_message_value; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 6 -> cp_market_order_net_notional_threshold_state_message_record.underlier_optional[cp_market_order_net_notional_threshold_state_message_at] = cp_market_order_net_notional_threshold_state_message_value; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> cp_market_order_net_notional_threshold_state_message_record.efid_optional[cp_market_order_net_notional_threshold_state_message_at] = cp_market_order_net_notional_threshold_state_message_value; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 2 -> cp_market_order_net_notional_threshold_state_message_record.risk_group_id[cp_market_order_net_notional_threshold_state_message_at] = cp_market_order_net_notional_threshold_state_message_value; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> cp_market_order_net_notional_threshold_state_message_record.price_in_dollars[cp_market_order_net_notional_threshold_state_message_at] = cp_market_order_net_notional_threshold_state_message_value; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Market Order Net Notional Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_record, cp_market_order_net_notional_threshold_state_message_base) {
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 20 -> cp_market_order_net_notional_threshold_state_message_record.cl_ord_id_optional[cp_market_order_net_notional_threshold_state_message_at] = (cp_market_order_net_notional_threshold_state_message_base + 0 + cp_market_order_net_notional_threshold_state_message_at + 1) % 256; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 6 -> cp_market_order_net_notional_threshold_state_message_record.underlier_optional[cp_market_order_net_notional_threshold_state_message_at] = (cp_market_order_net_notional_threshold_state_message_base + 20 + cp_market_order_net_notional_threshold_state_message_at + 1) % 256; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> cp_market_order_net_notional_threshold_state_message_record.efid_optional[cp_market_order_net_notional_threshold_state_message_at] = (cp_market_order_net_notional_threshold_state_message_base + 26 + cp_market_order_net_notional_threshold_state_message_at + 1) % 256; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 2 -> cp_market_order_net_notional_threshold_state_message_record.risk_group_id[cp_market_order_net_notional_threshold_state_message_at] = (cp_market_order_net_notional_threshold_state_message_base + 30 + cp_market_order_net_notional_threshold_state_message_at + 1) % 256; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> cp_market_order_net_notional_threshold_state_message_record.price_in_dollars[cp_market_order_net_notional_threshold_state_message_at] = (cp_market_order_net_notional_threshold_state_message_base + 32 + cp_market_order_net_notional_threshold_state_message_at + 1) % 256; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Market Order Net Notional Threshold State Message to the wire, 36 bytes from where the cursor stands */
inline encode_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_record) {
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 20 -> wire[at] = cp_market_order_net_notional_threshold_state_message_record.cl_ord_id_optional[cp_market_order_net_notional_threshold_state_message_at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 6 -> wire[at] = cp_market_order_net_notional_threshold_state_message_record.underlier_optional[cp_market_order_net_notional_threshold_state_message_at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> wire[at] = cp_market_order_net_notional_threshold_state_message_record.efid_optional[cp_market_order_net_notional_threshold_state_message_at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 2 -> wire[at] = cp_market_order_net_notional_threshold_state_message_record.risk_group_id[cp_market_order_net_notional_threshold_state_message_at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> wire[at] = cp_market_order_net_notional_threshold_state_message_record.price_in_dollars[cp_market_order_net_notional_threshold_state_message_at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Market Order Net Notional Threshold State Message off the wire, 36 bytes from where the cursor stands */
inline decode_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_record) {
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 20 -> cp_market_order_net_notional_threshold_state_message_record.cl_ord_id_optional[cp_market_order_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 6 -> cp_market_order_net_notional_threshold_state_message_record.underlier_optional[cp_market_order_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> cp_market_order_net_notional_threshold_state_message_record.efid_optional[cp_market_order_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 2 -> cp_market_order_net_notional_threshold_state_message_record.risk_group_id[cp_market_order_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> cp_market_order_net_notional_threshold_state_message_record.price_in_dollars[cp_market_order_net_notional_threshold_state_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Market Order Net Notional Threshold State Message is what was written, byte for byte */
inline equal_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_read, cp_market_order_net_notional_threshold_state_message_written) {
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 20 -> assert(cp_market_order_net_notional_threshold_state_message_read.cl_ord_id_optional[cp_market_order_net_notional_threshold_state_message_at] == cp_market_order_net_notional_threshold_state_message_written.cl_ord_id_optional[cp_market_order_net_notional_threshold_state_message_at]); cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 6 -> assert(cp_market_order_net_notional_threshold_state_message_read.underlier_optional[cp_market_order_net_notional_threshold_state_message_at] == cp_market_order_net_notional_threshold_state_message_written.underlier_optional[cp_market_order_net_notional_threshold_state_message_at]); cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> assert(cp_market_order_net_notional_threshold_state_message_read.efid_optional[cp_market_order_net_notional_threshold_state_message_at] == cp_market_order_net_notional_threshold_state_message_written.efid_optional[cp_market_order_net_notional_threshold_state_message_at]); cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 2 -> assert(cp_market_order_net_notional_threshold_state_message_read.risk_group_id[cp_market_order_net_notional_threshold_state_message_at] == cp_market_order_net_notional_threshold_state_message_written.risk_group_id[cp_market_order_net_notional_threshold_state_message_at]); cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_state_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_state_message_at < 4 -> assert(cp_market_order_net_notional_threshold_state_message_read.price_in_dollars[cp_market_order_net_notional_threshold_state_message_at] == cp_market_order_net_notional_threshold_state_message_written.price_in_dollars[cp_market_order_net_notional_threshold_state_message_at]); cp_market_order_net_notional_threshold_state_message_at = cp_market_order_net_notional_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Duplicate Order Threshold State Message: 41 bytes -------------------- */

/* CPDuplicateOrderThresholdStateMessage */
typedef CpDuplicateOrderThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte max_dup_orders[4];
  byte use_order_price_in_dup_check;
  byte period_in_milli_seconds[4]
};

int cp_duplicate_order_threshold_state_message_at;

/* every byte of Cp Duplicate Order Threshold State Message set to one value */
inline fill_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_record, cp_duplicate_order_threshold_state_message_value) {
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 20 -> cp_duplicate_order_threshold_state_message_record.cl_ord_id_optional[cp_duplicate_order_threshold_state_message_at] = cp_duplicate_order_threshold_state_message_value; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 6 -> cp_duplicate_order_threshold_state_message_record.underlier_optional[cp_duplicate_order_threshold_state_message_at] = cp_duplicate_order_threshold_state_message_value; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> cp_duplicate_order_threshold_state_message_record.efid_optional[cp_duplicate_order_threshold_state_message_at] = cp_duplicate_order_threshold_state_message_value; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 2 -> cp_duplicate_order_threshold_state_message_record.risk_group_id[cp_duplicate_order_threshold_state_message_at] = cp_duplicate_order_threshold_state_message_value; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> cp_duplicate_order_threshold_state_message_record.max_dup_orders[cp_duplicate_order_threshold_state_message_at] = cp_duplicate_order_threshold_state_message_value; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_record.use_order_price_in_dup_check = cp_duplicate_order_threshold_state_message_value;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> cp_duplicate_order_threshold_state_message_record.period_in_milli_seconds[cp_duplicate_order_threshold_state_message_at] = cp_duplicate_order_threshold_state_message_value; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Duplicate Order Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_record, cp_duplicate_order_threshold_state_message_base) {
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 20 -> cp_duplicate_order_threshold_state_message_record.cl_ord_id_optional[cp_duplicate_order_threshold_state_message_at] = (cp_duplicate_order_threshold_state_message_base + 0 + cp_duplicate_order_threshold_state_message_at + 1) % 256; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 6 -> cp_duplicate_order_threshold_state_message_record.underlier_optional[cp_duplicate_order_threshold_state_message_at] = (cp_duplicate_order_threshold_state_message_base + 20 + cp_duplicate_order_threshold_state_message_at + 1) % 256; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> cp_duplicate_order_threshold_state_message_record.efid_optional[cp_duplicate_order_threshold_state_message_at] = (cp_duplicate_order_threshold_state_message_base + 26 + cp_duplicate_order_threshold_state_message_at + 1) % 256; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 2 -> cp_duplicate_order_threshold_state_message_record.risk_group_id[cp_duplicate_order_threshold_state_message_at] = (cp_duplicate_order_threshold_state_message_base + 30 + cp_duplicate_order_threshold_state_message_at + 1) % 256; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> cp_duplicate_order_threshold_state_message_record.max_dup_orders[cp_duplicate_order_threshold_state_message_at] = (cp_duplicate_order_threshold_state_message_base + 32 + cp_duplicate_order_threshold_state_message_at + 1) % 256; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_record.use_order_price_in_dup_check = (cp_duplicate_order_threshold_state_message_base + 36 + 1) % 256;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> cp_duplicate_order_threshold_state_message_record.period_in_milli_seconds[cp_duplicate_order_threshold_state_message_at] = (cp_duplicate_order_threshold_state_message_base + 37 + cp_duplicate_order_threshold_state_message_at + 1) % 256; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Duplicate Order Threshold State Message to the wire, 41 bytes from where the cursor stands */
inline encode_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_record) {
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 20 -> wire[at] = cp_duplicate_order_threshold_state_message_record.cl_ord_id_optional[cp_duplicate_order_threshold_state_message_at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 6 -> wire[at] = cp_duplicate_order_threshold_state_message_record.underlier_optional[cp_duplicate_order_threshold_state_message_at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> wire[at] = cp_duplicate_order_threshold_state_message_record.efid_optional[cp_duplicate_order_threshold_state_message_at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 2 -> wire[at] = cp_duplicate_order_threshold_state_message_record.risk_group_id[cp_duplicate_order_threshold_state_message_at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> wire[at] = cp_duplicate_order_threshold_state_message_record.max_dup_orders[cp_duplicate_order_threshold_state_message_at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  wire[at] = cp_duplicate_order_threshold_state_message_record.use_order_price_in_dup_check; at = at + 1;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> wire[at] = cp_duplicate_order_threshold_state_message_record.period_in_milli_seconds[cp_duplicate_order_threshold_state_message_at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Duplicate Order Threshold State Message off the wire, 41 bytes from where the cursor stands */
inline decode_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_record) {
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 20 -> cp_duplicate_order_threshold_state_message_record.cl_ord_id_optional[cp_duplicate_order_threshold_state_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 6 -> cp_duplicate_order_threshold_state_message_record.underlier_optional[cp_duplicate_order_threshold_state_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> cp_duplicate_order_threshold_state_message_record.efid_optional[cp_duplicate_order_threshold_state_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 2 -> cp_duplicate_order_threshold_state_message_record.risk_group_id[cp_duplicate_order_threshold_state_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> cp_duplicate_order_threshold_state_message_record.max_dup_orders[cp_duplicate_order_threshold_state_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_record.use_order_price_in_dup_check = wire[at]; at = at + 1;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> cp_duplicate_order_threshold_state_message_record.period_in_milli_seconds[cp_duplicate_order_threshold_state_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Duplicate Order Threshold State Message is what was written, byte for byte */
inline equal_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_read, cp_duplicate_order_threshold_state_message_written) {
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 20 -> assert(cp_duplicate_order_threshold_state_message_read.cl_ord_id_optional[cp_duplicate_order_threshold_state_message_at] == cp_duplicate_order_threshold_state_message_written.cl_ord_id_optional[cp_duplicate_order_threshold_state_message_at]); cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 6 -> assert(cp_duplicate_order_threshold_state_message_read.underlier_optional[cp_duplicate_order_threshold_state_message_at] == cp_duplicate_order_threshold_state_message_written.underlier_optional[cp_duplicate_order_threshold_state_message_at]); cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> assert(cp_duplicate_order_threshold_state_message_read.efid_optional[cp_duplicate_order_threshold_state_message_at] == cp_duplicate_order_threshold_state_message_written.efid_optional[cp_duplicate_order_threshold_state_message_at]); cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 2 -> assert(cp_duplicate_order_threshold_state_message_read.risk_group_id[cp_duplicate_order_threshold_state_message_at] == cp_duplicate_order_threshold_state_message_written.risk_group_id[cp_duplicate_order_threshold_state_message_at]); cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> assert(cp_duplicate_order_threshold_state_message_read.max_dup_orders[cp_duplicate_order_threshold_state_message_at] == cp_duplicate_order_threshold_state_message_written.max_dup_orders[cp_duplicate_order_threshold_state_message_at]); cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  assert(cp_duplicate_order_threshold_state_message_read.use_order_price_in_dup_check == cp_duplicate_order_threshold_state_message_written.use_order_price_in_dup_check);
  cp_duplicate_order_threshold_state_message_at = 0;
  do
  :: cp_duplicate_order_threshold_state_message_at < 4 -> assert(cp_duplicate_order_threshold_state_message_read.period_in_milli_seconds[cp_duplicate_order_threshold_state_message_at] == cp_duplicate_order_threshold_state_message_written.period_in_milli_seconds[cp_duplicate_order_threshold_state_message_at]); cp_duplicate_order_threshold_state_message_at = cp_duplicate_order_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Order Rate Threshold State Message: 40 bytes ------------------------- */

/* CPOrderRateThresholdStateMessage */
typedef CpOrderRateThresholdStateMessage {
  byte cl_ord_id_optional[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte max_order_msgs[4];
  byte period_in_milli_seconds[4]
};

int cp_order_rate_threshold_state_message_at;

/* every byte of Cp Order Rate Threshold State Message set to one value */
inline fill_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_record, cp_order_rate_threshold_state_message_value) {
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 20 -> cp_order_rate_threshold_state_message_record.cl_ord_id_optional[cp_order_rate_threshold_state_message_at] = cp_order_rate_threshold_state_message_value; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 6 -> cp_order_rate_threshold_state_message_record.underlier_optional[cp_order_rate_threshold_state_message_at] = cp_order_rate_threshold_state_message_value; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> cp_order_rate_threshold_state_message_record.efid_optional[cp_order_rate_threshold_state_message_at] = cp_order_rate_threshold_state_message_value; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 2 -> cp_order_rate_threshold_state_message_record.risk_group_id[cp_order_rate_threshold_state_message_at] = cp_order_rate_threshold_state_message_value; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> cp_order_rate_threshold_state_message_record.max_order_msgs[cp_order_rate_threshold_state_message_at] = cp_order_rate_threshold_state_message_value; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> cp_order_rate_threshold_state_message_record.period_in_milli_seconds[cp_order_rate_threshold_state_message_at] = cp_order_rate_threshold_state_message_value; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Order Rate Threshold State Message set to where it lies, so a field read out of place says so */
inline ramp_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_record, cp_order_rate_threshold_state_message_base) {
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 20 -> cp_order_rate_threshold_state_message_record.cl_ord_id_optional[cp_order_rate_threshold_state_message_at] = (cp_order_rate_threshold_state_message_base + 0 + cp_order_rate_threshold_state_message_at + 1) % 256; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 6 -> cp_order_rate_threshold_state_message_record.underlier_optional[cp_order_rate_threshold_state_message_at] = (cp_order_rate_threshold_state_message_base + 20 + cp_order_rate_threshold_state_message_at + 1) % 256; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> cp_order_rate_threshold_state_message_record.efid_optional[cp_order_rate_threshold_state_message_at] = (cp_order_rate_threshold_state_message_base + 26 + cp_order_rate_threshold_state_message_at + 1) % 256; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 2 -> cp_order_rate_threshold_state_message_record.risk_group_id[cp_order_rate_threshold_state_message_at] = (cp_order_rate_threshold_state_message_base + 30 + cp_order_rate_threshold_state_message_at + 1) % 256; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> cp_order_rate_threshold_state_message_record.max_order_msgs[cp_order_rate_threshold_state_message_at] = (cp_order_rate_threshold_state_message_base + 32 + cp_order_rate_threshold_state_message_at + 1) % 256; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> cp_order_rate_threshold_state_message_record.period_in_milli_seconds[cp_order_rate_threshold_state_message_at] = (cp_order_rate_threshold_state_message_base + 36 + cp_order_rate_threshold_state_message_at + 1) % 256; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Order Rate Threshold State Message to the wire, 40 bytes from where the cursor stands */
inline encode_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_record) {
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 20 -> wire[at] = cp_order_rate_threshold_state_message_record.cl_ord_id_optional[cp_order_rate_threshold_state_message_at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 6 -> wire[at] = cp_order_rate_threshold_state_message_record.underlier_optional[cp_order_rate_threshold_state_message_at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> wire[at] = cp_order_rate_threshold_state_message_record.efid_optional[cp_order_rate_threshold_state_message_at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 2 -> wire[at] = cp_order_rate_threshold_state_message_record.risk_group_id[cp_order_rate_threshold_state_message_at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> wire[at] = cp_order_rate_threshold_state_message_record.max_order_msgs[cp_order_rate_threshold_state_message_at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> wire[at] = cp_order_rate_threshold_state_message_record.period_in_milli_seconds[cp_order_rate_threshold_state_message_at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Order Rate Threshold State Message off the wire, 40 bytes from where the cursor stands */
inline decode_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_record) {
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 20 -> cp_order_rate_threshold_state_message_record.cl_ord_id_optional[cp_order_rate_threshold_state_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 6 -> cp_order_rate_threshold_state_message_record.underlier_optional[cp_order_rate_threshold_state_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> cp_order_rate_threshold_state_message_record.efid_optional[cp_order_rate_threshold_state_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 2 -> cp_order_rate_threshold_state_message_record.risk_group_id[cp_order_rate_threshold_state_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> cp_order_rate_threshold_state_message_record.max_order_msgs[cp_order_rate_threshold_state_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> cp_order_rate_threshold_state_message_record.period_in_milli_seconds[cp_order_rate_threshold_state_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Order Rate Threshold State Message is what was written, byte for byte */
inline equal_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_read, cp_order_rate_threshold_state_message_written) {
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 20 -> assert(cp_order_rate_threshold_state_message_read.cl_ord_id_optional[cp_order_rate_threshold_state_message_at] == cp_order_rate_threshold_state_message_written.cl_ord_id_optional[cp_order_rate_threshold_state_message_at]); cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 6 -> assert(cp_order_rate_threshold_state_message_read.underlier_optional[cp_order_rate_threshold_state_message_at] == cp_order_rate_threshold_state_message_written.underlier_optional[cp_order_rate_threshold_state_message_at]); cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> assert(cp_order_rate_threshold_state_message_read.efid_optional[cp_order_rate_threshold_state_message_at] == cp_order_rate_threshold_state_message_written.efid_optional[cp_order_rate_threshold_state_message_at]); cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 2 -> assert(cp_order_rate_threshold_state_message_read.risk_group_id[cp_order_rate_threshold_state_message_at] == cp_order_rate_threshold_state_message_written.risk_group_id[cp_order_rate_threshold_state_message_at]); cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> assert(cp_order_rate_threshold_state_message_read.max_order_msgs[cp_order_rate_threshold_state_message_at] == cp_order_rate_threshold_state_message_written.max_order_msgs[cp_order_rate_threshold_state_message_at]); cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_state_message_at = 0;
  do
  :: cp_order_rate_threshold_state_message_at < 4 -> assert(cp_order_rate_threshold_state_message_read.period_in_milli_seconds[cp_order_rate_threshold_state_message_at] == cp_order_rate_threshold_state_message_written.period_in_milli_seconds[cp_order_rate_threshold_state_message_at]); cp_order_rate_threshold_state_message_at = cp_order_rate_threshold_state_message_at + 1
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

/* Active Risk Threshold State Message: encoded, read back, and compared */
proctype check_active_risk_threshold_state_message() {
  ActiveRiskThresholdStateMessage active_risk_threshold_state_message_sent;
  ActiveRiskThresholdStateMessage active_risk_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_risk_threshold_state_message(active_risk_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_active_risk_threshold_state_message(active_risk_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_active_risk_threshold_state_message(active_risk_threshold_state_message_sent, 255)
  :: else -> ramp_active_risk_threshold_state_message(active_risk_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_risk_threshold_state_message(active_risk_threshold_state_message_sent);
    assert(at == 34);
    at = 0;
    decode_active_risk_threshold_state_message(active_risk_threshold_state_message_got);
    assert(at == 34);
    equal_active_risk_threshold_state_message(active_risk_threshold_state_message_got, active_risk_threshold_state_message_sent)
  }
}

/* Active Risk Threshold Change Rej Message: encoded, read back, and compared */
proctype check_active_risk_threshold_change_rej_message() {
  ActiveRiskThresholdChangeRejMessage active_risk_threshold_change_rej_message_sent;
  ActiveRiskThresholdChangeRejMessage active_risk_threshold_change_rej_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_sent, 0)
  :: pattern == 1 -> fill_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_sent, 32)
  :: pattern == 2 -> fill_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_sent, 255)
  :: else -> ramp_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_sent);
    assert(at == 36);
    at = 0;
    decode_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_got);
    assert(at == 36);
    equal_active_risk_threshold_change_rej_message(active_risk_threshold_change_rej_message_got, active_risk_threshold_change_rej_message_sent)
  }
}

/* Active Risk Acknowledged Message: encoded, read back, and compared */
proctype check_active_risk_acknowledged_message() {
  ActiveRiskAcknowledgedMessage active_risk_acknowledged_message_sent;
  ActiveRiskAcknowledgedMessage active_risk_acknowledged_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_risk_acknowledged_message(active_risk_acknowledged_message_sent, 0)
  :: pattern == 1 -> fill_active_risk_acknowledged_message(active_risk_acknowledged_message_sent, 32)
  :: pattern == 2 -> fill_active_risk_acknowledged_message(active_risk_acknowledged_message_sent, 255)
  :: else -> ramp_active_risk_acknowledged_message(active_risk_acknowledged_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_risk_acknowledged_message(active_risk_acknowledged_message_sent);
    assert(at == 38);
    at = 0;
    decode_active_risk_acknowledged_message(active_risk_acknowledged_message_got);
    assert(at == 38);
    equal_active_risk_acknowledged_message(active_risk_acknowledged_message_got, active_risk_acknowledged_message_sent)
  }
}

/* Active Risk Acknowledge Rej Message: encoded, read back, and compared */
proctype check_active_risk_acknowledge_rej_message() {
  ActiveRiskAcknowledgeRejMessage active_risk_acknowledge_rej_message_sent;
  ActiveRiskAcknowledgeRejMessage active_risk_acknowledge_rej_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_sent, 0)
  :: pattern == 1 -> fill_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_sent, 32)
  :: pattern == 2 -> fill_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_sent, 255)
  :: else -> ramp_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_sent);
    assert(at == 36);
    at = 0;
    decode_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_got);
    assert(at == 36);
    equal_active_risk_acknowledge_rej_message(active_risk_acknowledge_rej_message_got, active_risk_acknowledge_rej_message_sent)
  }
}

/* Active Risk Quantity Update Notification Message: encoded, read back, and compared */
proctype check_active_risk_quantity_update_notification_message() {
  ActiveRiskQuantityUpdateNotificationMessage active_risk_quantity_update_notification_message_sent;
  ActiveRiskQuantityUpdateNotificationMessage active_risk_quantity_update_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_sent, 0)
  :: pattern == 1 -> fill_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_sent, 32)
  :: pattern == 2 -> fill_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_sent, 255)
  :: else -> ramp_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_sent);
    assert(at == 67);
    at = 0;
    decode_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_got);
    assert(at == 67);
    equal_active_risk_quantity_update_notification_message(active_risk_quantity_update_notification_message_got, active_risk_quantity_update_notification_message_sent)
  }
}

/* Cp Volume Threshold State Message: encoded, read back, and compared */
proctype check_cp_volume_threshold_state_message() {
  CpVolumeThresholdStateMessage cp_volume_threshold_state_message_sent;
  CpVolumeThresholdStateMessage cp_volume_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_volume_threshold_state_message(cp_volume_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_volume_threshold_state_message(cp_volume_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_volume_threshold_state_message(cp_volume_threshold_state_message_sent, 255)
  :: else -> ramp_cp_volume_threshold_state_message(cp_volume_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_volume_threshold_state_message(cp_volume_threshold_state_message_sent);
    assert(at == 44);
    at = 0;
    decode_cp_volume_threshold_state_message(cp_volume_threshold_state_message_got);
    assert(at == 44);
    equal_cp_volume_threshold_state_message(cp_volume_threshold_state_message_got, cp_volume_threshold_state_message_sent)
  }
}

/* Cp Executed Notional Threshold State Message: encoded, read back, and compared */
proctype check_cp_executed_notional_threshold_state_message() {
  CpExecutedNotionalThresholdStateMessage cp_executed_notional_threshold_state_message_sent;
  CpExecutedNotionalThresholdStateMessage cp_executed_notional_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_sent, 255)
  :: else -> ramp_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_sent);
    assert(at == 40);
    at = 0;
    decode_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_got);
    assert(at == 40);
    equal_cp_executed_notional_threshold_state_message(cp_executed_notional_threshold_state_message_got, cp_executed_notional_threshold_state_message_sent)
  }
}

/* Cp Total Executions Threshold State Message: encoded, read back, and compared */
proctype check_cp_total_executions_threshold_state_message() {
  CpTotalExecutionsThresholdStateMessage cp_total_executions_threshold_state_message_sent;
  CpTotalExecutionsThresholdStateMessage cp_total_executions_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_sent, 255)
  :: else -> ramp_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_sent);
    assert(at == 40);
    at = 0;
    decode_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_got);
    assert(at == 40);
    equal_cp_total_executions_threshold_state_message(cp_total_executions_threshold_state_message_got, cp_total_executions_threshold_state_message_sent)
  }
}

/* Cp Percent Outstanding Contracts Threshold State Message: encoded, read back, and compared */
proctype check_cp_percent_outstanding_contracts_threshold_state_message() {
  CpPercentOutstandingContractsThresholdStateMessage cp_percent_outstanding_contracts_threshold_state_message_sent;
  CpPercentOutstandingContractsThresholdStateMessage cp_percent_outstanding_contracts_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_sent, 255)
  :: else -> ramp_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_sent);
    assert(at == 38);
    at = 0;
    decode_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_got);
    assert(at == 38);
    equal_cp_percent_outstanding_contracts_threshold_state_message(cp_percent_outstanding_contracts_threshold_state_message_got, cp_percent_outstanding_contracts_threshold_state_message_sent)
  }
}

/* Cp Breach Count Threshold State Message: encoded, read back, and compared */
proctype check_cp_breach_count_threshold_state_message() {
  CpBreachCountThresholdStateMessage cp_breach_count_threshold_state_message_sent;
  CpBreachCountThresholdStateMessage cp_breach_count_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_sent, 255)
  :: else -> ramp_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_sent);
    assert(at == 40);
    at = 0;
    decode_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_got);
    assert(at == 40);
    equal_cp_breach_count_threshold_state_message(cp_breach_count_threshold_state_message_got, cp_breach_count_threshold_state_message_sent)
  }
}

/* Manual Cp Breach Trigger Pending Message: encoded, read back, and compared */
proctype check_manual_cp_breach_trigger_pending_message() {
  ManualCpBreachTriggerPendingMessage manual_cp_breach_trigger_pending_message_sent;
  ManualCpBreachTriggerPendingMessage manual_cp_breach_trigger_pending_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_sent, 0)
  :: pattern == 1 -> fill_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_sent, 32)
  :: pattern == 2 -> fill_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_sent, 255)
  :: else -> ramp_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_sent);
    assert(at == 40);
    at = 0;
    decode_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_got);
    assert(at == 40);
    equal_manual_cp_breach_trigger_pending_message(manual_cp_breach_trigger_pending_message_got, manual_cp_breach_trigger_pending_message_sent)
  }
}

/* Manual Cp Breach Trigger Done Message: encoded, read back, and compared */
proctype check_manual_cp_breach_trigger_done_message() {
  ManualCpBreachTriggerDoneMessage manual_cp_breach_trigger_done_message_sent;
  ManualCpBreachTriggerDoneMessage manual_cp_breach_trigger_done_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_sent, 0)
  :: pattern == 1 -> fill_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_sent, 32)
  :: pattern == 2 -> fill_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_sent, 255)
  :: else -> ramp_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_sent);
    assert(at == 44);
    at = 0;
    decode_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_got);
    assert(at == 44);
    equal_manual_cp_breach_trigger_done_message(manual_cp_breach_trigger_done_message_got, manual_cp_breach_trigger_done_message_sent)
  }
}

/* Risk Threshold Update Rej Message: encoded, read back, and compared */
proctype check_risk_threshold_update_rej_message() {
  RiskThresholdUpdateRejMessage risk_threshold_update_rej_message_sent;
  RiskThresholdUpdateRejMessage risk_threshold_update_rej_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_threshold_update_rej_message(risk_threshold_update_rej_message_sent, 0)
  :: pattern == 1 -> fill_risk_threshold_update_rej_message(risk_threshold_update_rej_message_sent, 32)
  :: pattern == 2 -> fill_risk_threshold_update_rej_message(risk_threshold_update_rej_message_sent, 255)
  :: else -> ramp_risk_threshold_update_rej_message(risk_threshold_update_rej_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_threshold_update_rej_message(risk_threshold_update_rej_message_sent);
    assert(at == 23);
    at = 0;
    decode_risk_threshold_update_rej_message(risk_threshold_update_rej_message_got);
    assert(at == 23);
    equal_risk_threshold_update_rej_message(risk_threshold_update_rej_message_got, risk_threshold_update_rej_message_sent)
  }
}

/* Passive Risk Threshold Notification Message: encoded, read back, and compared */
proctype check_passive_risk_threshold_notification_message() {
  PassiveRiskThresholdNotificationMessage passive_risk_threshold_notification_message_sent;
  PassiveRiskThresholdNotificationMessage passive_risk_threshold_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_sent, 0)
  :: pattern == 1 -> fill_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_sent, 32)
  :: pattern == 2 -> fill_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_sent, 255)
  :: else -> ramp_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_sent);
    assert(at == 30);
    at = 0;
    decode_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_got);
    assert(at == 30);
    equal_passive_risk_threshold_notification_message(passive_risk_threshold_notification_message_got, passive_risk_threshold_notification_message_sent)
  }
}

/* Single Order Allow Iso Orders State Message: encoded, read back, and compared */
proctype check_single_order_allow_iso_orders_state_message() {
  SingleOrderAllowIsoOrdersStateMessage single_order_allow_iso_orders_state_message_sent;
  SingleOrderAllowIsoOrdersStateMessage single_order_allow_iso_orders_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_sent, 0)
  :: pattern == 1 -> fill_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_sent, 32)
  :: pattern == 2 -> fill_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_sent, 255)
  :: else -> ramp_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_sent);
    assert(at == 33);
    at = 0;
    decode_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_got);
    assert(at == 33);
    equal_single_order_allow_iso_orders_state_message(single_order_allow_iso_orders_state_message_got, single_order_allow_iso_orders_state_message_sent)
  }
}

/* Single Order Allow Orders In Crossed Market State Message: encoded, read back, and compared */
proctype check_single_order_allow_orders_in_crossed_market_state_message() {
  SingleOrderAllowOrdersInCrossedMarketStateMessage single_order_allow_orders_in_crossed_market_state_message_sent;
  SingleOrderAllowOrdersInCrossedMarketStateMessage single_order_allow_orders_in_crossed_market_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_sent, 0)
  :: pattern == 1 -> fill_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_sent, 32)
  :: pattern == 2 -> fill_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_sent, 255)
  :: else -> ramp_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_sent);
    assert(at == 33);
    at = 0;
    decode_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_got);
    assert(at == 33);
    equal_single_order_allow_orders_in_crossed_market_state_message(single_order_allow_orders_in_crossed_market_state_message_got, single_order_allow_orders_in_crossed_market_state_message_sent)
  }
}

/* Single Order Max Notional Threshold State Message: encoded, read back, and compared */
proctype check_single_order_max_notional_threshold_state_message() {
  SingleOrderMaxNotionalThresholdStateMessage single_order_max_notional_threshold_state_message_sent;
  SingleOrderMaxNotionalThresholdStateMessage single_order_max_notional_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_sent, 255)
  :: else -> ramp_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_sent);
    assert(at == 36);
    at = 0;
    decode_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_got);
    assert(at == 36);
    equal_single_order_max_notional_threshold_state_message(single_order_max_notional_threshold_state_message_got, single_order_max_notional_threshold_state_message_sent)
  }
}

/* Single Order Max Contracts Threshold State Message: encoded, read back, and compared */
proctype check_single_order_max_contracts_threshold_state_message() {
  SingleOrderMaxContractsThresholdStateMessage single_order_max_contracts_threshold_state_message_sent;
  SingleOrderMaxContractsThresholdStateMessage single_order_max_contracts_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_sent, 255)
  :: else -> ramp_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_sent);
    assert(at == 36);
    at = 0;
    decode_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_got);
    assert(at == 36);
    equal_single_order_max_contracts_threshold_state_message(single_order_max_contracts_threshold_state_message_got, single_order_max_contracts_threshold_state_message_sent)
  }
}

/* Risk Settings Query Done Message: encoded, read back, and compared */
proctype check_risk_settings_query_done_message() {
  RiskSettingsQueryDoneMessage risk_settings_query_done_message_sent;
  RiskSettingsQueryDoneMessage risk_settings_query_done_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_settings_query_done_message(risk_settings_query_done_message_sent, 0)
  :: pattern == 1 -> fill_risk_settings_query_done_message(risk_settings_query_done_message_sent, 32)
  :: pattern == 2 -> fill_risk_settings_query_done_message(risk_settings_query_done_message_sent, 255)
  :: else -> ramp_risk_settings_query_done_message(risk_settings_query_done_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_settings_query_done_message(risk_settings_query_done_message_sent);
    assert(at == 24);
    at = 0;
    decode_risk_settings_query_done_message(risk_settings_query_done_message_got);
    assert(at == 24);
    equal_risk_settings_query_done_message(risk_settings_query_done_message_got, risk_settings_query_done_message_sent)
  }
}

/* Risk Settings Query Rej Message: encoded, read back, and compared */
proctype check_risk_settings_query_rej_message() {
  RiskSettingsQueryRejMessage risk_settings_query_rej_message_sent;
  RiskSettingsQueryRejMessage risk_settings_query_rej_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_settings_query_rej_message(risk_settings_query_rej_message_sent, 0)
  :: pattern == 1 -> fill_risk_settings_query_rej_message(risk_settings_query_rej_message_sent, 32)
  :: pattern == 2 -> fill_risk_settings_query_rej_message(risk_settings_query_rej_message_sent, 255)
  :: else -> ramp_risk_settings_query_rej_message(risk_settings_query_rej_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_settings_query_rej_message(risk_settings_query_rej_message_sent);
    assert(at == 22);
    at = 0;
    decode_risk_settings_query_rej_message(risk_settings_query_rej_message_got);
    assert(at == 22);
    equal_risk_settings_query_rej_message(risk_settings_query_rej_message_got, risk_settings_query_rej_message_sent)
  }
}

/* Manual Cp Breach Trigger Rej Message: encoded, read back, and compared */
proctype check_manual_cp_breach_trigger_rej_message() {
  ManualCpBreachTriggerRejMessage manual_cp_breach_trigger_rej_message_sent;
  ManualCpBreachTriggerRejMessage manual_cp_breach_trigger_rej_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_sent, 0)
  :: pattern == 1 -> fill_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_sent, 32)
  :: pattern == 2 -> fill_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_sent, 255)
  :: else -> ramp_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_sent);
    assert(at == 34);
    at = 0;
    decode_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_got);
    assert(at == 34);
    equal_manual_cp_breach_trigger_rej_message(manual_cp_breach_trigger_rej_message_got, manual_cp_breach_trigger_rej_message_sent)
  }
}

/* Breach Clear Rej Message: encoded, read back, and compared */
proctype check_breach_clear_rej_message() {
  BreachClearRejMessage breach_clear_rej_message_sent;
  BreachClearRejMessage breach_clear_rej_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_breach_clear_rej_message(breach_clear_rej_message_sent, 0)
  :: pattern == 1 -> fill_breach_clear_rej_message(breach_clear_rej_message_sent, 32)
  :: pattern == 2 -> fill_breach_clear_rej_message(breach_clear_rej_message_sent, 255)
  :: else -> ramp_breach_clear_rej_message(breach_clear_rej_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_breach_clear_rej_message(breach_clear_rej_message_sent);
    assert(at == 30);
    at = 0;
    decode_breach_clear_rej_message(breach_clear_rej_message_got);
    assert(at == 30);
    equal_breach_clear_rej_message(breach_clear_rej_message_got, breach_clear_rej_message_sent)
  }
}

/* Breach Cleared Message: encoded, read back, and compared */
proctype check_breach_cleared_message() {
  BreachClearedMessage breach_cleared_message_sent;
  BreachClearedMessage breach_cleared_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_breach_cleared_message(breach_cleared_message_sent, 0)
  :: pattern == 1 -> fill_breach_cleared_message(breach_cleared_message_sent, 32)
  :: pattern == 2 -> fill_breach_cleared_message(breach_cleared_message_sent, 255)
  :: else -> ramp_breach_cleared_message(breach_cleared_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_breach_cleared_message(breach_cleared_message_sent);
    assert(at == 28);
    at = 0;
    decode_breach_cleared_message(breach_cleared_message_got);
    assert(at == 28);
    equal_breach_cleared_message(breach_cleared_message_got, breach_cleared_message_sent)
  }
}

/* Cp Gross Notional Threshold State Message: encoded, read back, and compared */
proctype check_cp_gross_notional_threshold_state_message() {
  CpGrossNotionalThresholdStateMessage cp_gross_notional_threshold_state_message_sent;
  CpGrossNotionalThresholdStateMessage cp_gross_notional_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_sent, 255)
  :: else -> ramp_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_sent);
    assert(at == 36);
    at = 0;
    decode_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_got);
    assert(at == 36);
    equal_cp_gross_notional_threshold_state_message(cp_gross_notional_threshold_state_message_got, cp_gross_notional_threshold_state_message_sent)
  }
}

/* Cp Market Order Gross Notional Threshold State Message: encoded, read back, and compared */
proctype check_cp_market_order_gross_notional_threshold_state_message() {
  CpMarketOrderGrossNotionalThresholdStateMessage cp_market_order_gross_notional_threshold_state_message_sent;
  CpMarketOrderGrossNotionalThresholdStateMessage cp_market_order_gross_notional_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_sent, 255)
  :: else -> ramp_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_sent);
    assert(at == 36);
    at = 0;
    decode_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_got);
    assert(at == 36);
    equal_cp_market_order_gross_notional_threshold_state_message(cp_market_order_gross_notional_threshold_state_message_got, cp_market_order_gross_notional_threshold_state_message_sent)
  }
}

/* Cp Net Notional Threshold State Message: encoded, read back, and compared */
proctype check_cp_net_notional_threshold_state_message() {
  CpNetNotionalThresholdStateMessage cp_net_notional_threshold_state_message_sent;
  CpNetNotionalThresholdStateMessage cp_net_notional_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_sent, 255)
  :: else -> ramp_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_sent);
    assert(at == 36);
    at = 0;
    decode_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_got);
    assert(at == 36);
    equal_cp_net_notional_threshold_state_message(cp_net_notional_threshold_state_message_got, cp_net_notional_threshold_state_message_sent)
  }
}

/* Cp Market Order Net Notional Threshold State Message: encoded, read back, and compared */
proctype check_cp_market_order_net_notional_threshold_state_message() {
  CpMarketOrderNetNotionalThresholdStateMessage cp_market_order_net_notional_threshold_state_message_sent;
  CpMarketOrderNetNotionalThresholdStateMessage cp_market_order_net_notional_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_sent, 255)
  :: else -> ramp_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_sent);
    assert(at == 36);
    at = 0;
    decode_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_got);
    assert(at == 36);
    equal_cp_market_order_net_notional_threshold_state_message(cp_market_order_net_notional_threshold_state_message_got, cp_market_order_net_notional_threshold_state_message_sent)
  }
}

/* Cp Duplicate Order Threshold State Message: encoded, read back, and compared */
proctype check_cp_duplicate_order_threshold_state_message() {
  CpDuplicateOrderThresholdStateMessage cp_duplicate_order_threshold_state_message_sent;
  CpDuplicateOrderThresholdStateMessage cp_duplicate_order_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_sent, 255)
  :: else -> ramp_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_sent);
    assert(at == 41);
    at = 0;
    decode_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_got);
    assert(at == 41);
    equal_cp_duplicate_order_threshold_state_message(cp_duplicate_order_threshold_state_message_got, cp_duplicate_order_threshold_state_message_sent)
  }
}

/* Cp Order Rate Threshold State Message: encoded, read back, and compared */
proctype check_cp_order_rate_threshold_state_message() {
  CpOrderRateThresholdStateMessage cp_order_rate_threshold_state_message_sent;
  CpOrderRateThresholdStateMessage cp_order_rate_threshold_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_sent, 0)
  :: pattern == 1 -> fill_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_sent, 32)
  :: pattern == 2 -> fill_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_sent, 255)
  :: else -> ramp_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_sent);
    assert(at == 40);
    at = 0;
    decode_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_got);
    assert(at == 40);
    equal_cp_order_rate_threshold_state_message(cp_order_rate_threshold_state_message_got, cp_order_rate_threshold_state_message_sent)
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
  :: run check_active_risk_threshold_state_message()
  :: run check_active_risk_threshold_change_rej_message()
  :: run check_active_risk_acknowledged_message()
  :: run check_active_risk_acknowledge_rej_message()
  :: run check_active_risk_quantity_update_notification_message()
  :: run check_cp_volume_threshold_state_message()
  :: run check_cp_executed_notional_threshold_state_message()
  :: run check_cp_total_executions_threshold_state_message()
  :: run check_cp_percent_outstanding_contracts_threshold_state_message()
  :: run check_cp_breach_count_threshold_state_message()
  :: run check_manual_cp_breach_trigger_pending_message()
  :: run check_manual_cp_breach_trigger_done_message()
  :: run check_risk_threshold_update_rej_message()
  :: run check_passive_risk_threshold_notification_message()
  :: run check_single_order_allow_iso_orders_state_message()
  :: run check_single_order_allow_orders_in_crossed_market_state_message()
  :: run check_single_order_max_notional_threshold_state_message()
  :: run check_single_order_max_contracts_threshold_state_message()
  :: run check_risk_settings_query_done_message()
  :: run check_risk_settings_query_rej_message()
  :: run check_manual_cp_breach_trigger_rej_message()
  :: run check_breach_clear_rej_message()
  :: run check_breach_cleared_message()
  :: run check_cp_gross_notional_threshold_state_message()
  :: run check_cp_market_order_gross_notional_threshold_state_message()
  :: run check_cp_net_notional_threshold_state_message()
  :: run check_cp_market_order_net_notional_threshold_state_message()
  :: run check_cp_duplicate_order_threshold_state_message()
  :: run check_cp_order_rate_threshold_state_message()
  fi
}
