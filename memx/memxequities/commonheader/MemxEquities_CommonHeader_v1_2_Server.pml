/*
 * The Members Exchange Common Header
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
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 16

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
  fi
}
