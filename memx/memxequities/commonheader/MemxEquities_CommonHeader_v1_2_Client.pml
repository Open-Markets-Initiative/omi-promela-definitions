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
#define WIRE 20

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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_common_header()
  :: run check_login_request_message()
  :: run check_replay_request_message()
  :: run check_replay_all_request_message()
  :: run check_stream_request_message()
  fi
}
