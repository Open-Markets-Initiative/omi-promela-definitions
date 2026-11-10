/*
 * Giełda Papierów Wartościowych w Warszawie Warsaw Stock Exchange Full Depth Replay
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 9

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Replay Request Header: 4 bytes ------------------------------------------ */

/* The replay request carries a four byte header of its own, not the 42 byte market data header */
typedef ReplayRequestHeader {
  byte replay_message_length[2];
  byte replay_message_type[2]
};

int replay_request_header_at;

/* every byte of Replay Request Header set to one value */
inline fill_replay_request_header(replay_request_header_record, replay_request_header_value) {
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> replay_request_header_record.replay_message_length[replay_request_header_at] = replay_request_header_value; replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> replay_request_header_record.replay_message_type[replay_request_header_at] = replay_request_header_value; replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Request Header set to where it lies, so a field read out of place says so */
inline ramp_replay_request_header(replay_request_header_record, replay_request_header_base) {
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> replay_request_header_record.replay_message_length[replay_request_header_at] = (replay_request_header_base + 0 + replay_request_header_at + 1) % 256; replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> replay_request_header_record.replay_message_type[replay_request_header_at] = (replay_request_header_base + 2 + replay_request_header_at + 1) % 256; replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Header to the wire, 4 bytes from where the cursor stands */
inline encode_replay_request_header(replay_request_header_record) {
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> wire[at] = replay_request_header_record.replay_message_length[replay_request_header_at]; at = at + 1; replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> wire[at] = replay_request_header_record.replay_message_type[replay_request_header_at]; at = at + 1; replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Header off the wire, 4 bytes from where the cursor stands */
inline decode_replay_request_header(replay_request_header_record) {
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> replay_request_header_record.replay_message_length[replay_request_header_at] = wire[at]; at = at + 1; replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> replay_request_header_record.replay_message_type[replay_request_header_at] = wire[at]; at = at + 1; replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Request Header is what was written, byte for byte */
inline equal_replay_request_header(replay_request_header_read, replay_request_header_written) {
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> assert(replay_request_header_read.replay_message_length[replay_request_header_at] == replay_request_header_written.replay_message_length[replay_request_header_at]); replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  replay_request_header_at = 0;
  do
  :: replay_request_header_at < 2 -> assert(replay_request_header_read.replay_message_type[replay_request_header_at] == replay_request_header_written.replay_message_type[replay_request_header_at]); replay_request_header_at = replay_request_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay Request: 9 bytes ------------------------------------------------- */

/* Message replay request */
typedef ReplayRequest {
  byte seq_num[4];
  byte end_seq_num[4];
  byte stream_id
};

int replay_request_at;

/* every byte of Replay Request set to one value */
inline fill_replay_request(replay_request_record, replay_request_value) {
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> replay_request_record.seq_num[replay_request_at] = replay_request_value; replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> replay_request_record.end_seq_num[replay_request_at] = replay_request_value; replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  replay_request_record.stream_id = replay_request_value;
  skip
}

/* each byte of Replay Request set to where it lies, so a field read out of place says so */
inline ramp_replay_request(replay_request_record, replay_request_base) {
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> replay_request_record.seq_num[replay_request_at] = (replay_request_base + 0 + replay_request_at + 1) % 256; replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> replay_request_record.end_seq_num[replay_request_at] = (replay_request_base + 4 + replay_request_at + 1) % 256; replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  replay_request_record.stream_id = (replay_request_base + 8 + 1) % 256;
  skip
}

/* Replay Request to the wire, 9 bytes from where the cursor stands */
inline encode_replay_request(replay_request_record) {
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> wire[at] = replay_request_record.seq_num[replay_request_at]; at = at + 1; replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> wire[at] = replay_request_record.end_seq_num[replay_request_at]; at = at + 1; replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  wire[at] = replay_request_record.stream_id; at = at + 1;
  skip
}

/* Replay Request off the wire, 9 bytes from where the cursor stands */
inline decode_replay_request(replay_request_record) {
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> replay_request_record.seq_num[replay_request_at] = wire[at]; at = at + 1; replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> replay_request_record.end_seq_num[replay_request_at] = wire[at]; at = at + 1; replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  replay_request_record.stream_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Replay Request is what was written, byte for byte */
inline equal_replay_request(replay_request_read, replay_request_written) {
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> assert(replay_request_read.seq_num[replay_request_at] == replay_request_written.seq_num[replay_request_at]); replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  replay_request_at = 0;
  do
  :: replay_request_at < 4 -> assert(replay_request_read.end_seq_num[replay_request_at] == replay_request_written.end_seq_num[replay_request_at]); replay_request_at = replay_request_at + 1
  :: else -> break
  od;
  assert(replay_request_read.stream_id == replay_request_written.stream_id);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Replay Request Header: encoded, read back, and compared */
proctype check_replay_request_header() {
  ReplayRequestHeader replay_request_header_sent;
  ReplayRequestHeader replay_request_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_request_header(replay_request_header_sent, 0)
  :: pattern == 1 -> fill_replay_request_header(replay_request_header_sent, 32)
  :: pattern == 2 -> fill_replay_request_header(replay_request_header_sent, 255)
  :: else -> ramp_replay_request_header(replay_request_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_request_header(replay_request_header_sent);
    assert(at == 4);
    at = 0;
    decode_replay_request_header(replay_request_header_got);
    assert(at == 4);
    equal_replay_request_header(replay_request_header_got, replay_request_header_sent)
  }
}

/* Replay Request: encoded, read back, and compared */
proctype check_replay_request() {
  ReplayRequest replay_request_sent;
  ReplayRequest replay_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_request(replay_request_sent, 0)
  :: pattern == 1 -> fill_replay_request(replay_request_sent, 32)
  :: pattern == 2 -> fill_replay_request(replay_request_sent, 255)
  :: else -> ramp_replay_request(replay_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_request(replay_request_sent);
    assert(at == 9);
    at = 0;
    decode_replay_request(replay_request_got);
    assert(at == 9);
    equal_replay_request(replay_request_got, replay_request_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_replay_request_header()
  :: run check_replay_request()
  fi
}
