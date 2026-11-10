/*
 * National Stock Exchange of India Ltd Mtbt Tick Data Recovery
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
 *   - the dispatch that chooses a message by its type
 *   - a Composite rule
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 8

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Stream Header: 8 bytes -------------------------------------------------- */

/* STREAM_HEADER */
typedef StreamHeader {
  byte message_length[2];
  byte stream_id[2];
  byte sequence_number[4]
};

int stream_header_at;

/* every byte of Stream Header set to one value */
inline fill_stream_header(stream_header_record, stream_header_value) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.message_length[stream_header_at] = stream_header_value; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.stream_id[stream_header_at] = stream_header_value; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> stream_header_record.sequence_number[stream_header_at] = stream_header_value; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stream Header set to where it lies, so a field read out of place says so */
inline ramp_stream_header(stream_header_record, stream_header_base) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.message_length[stream_header_at] = (stream_header_base + 0 + stream_header_at + 1) % 256; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.stream_id[stream_header_at] = (stream_header_base + 2 + stream_header_at + 1) % 256; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> stream_header_record.sequence_number[stream_header_at] = (stream_header_base + 4 + stream_header_at + 1) % 256; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Header to the wire, 8 bytes from where the cursor stands */
inline encode_stream_header(stream_header_record) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> wire[at] = stream_header_record.message_length[stream_header_at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> wire[at] = stream_header_record.stream_id[stream_header_at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> wire[at] = stream_header_record.sequence_number[stream_header_at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Header off the wire, 8 bytes from where the cursor stands */
inline decode_stream_header(stream_header_record) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.message_length[stream_header_at] = wire[at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.stream_id[stream_header_at] = wire[at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> stream_header_record.sequence_number[stream_header_at] = wire[at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stream Header is what was written, byte for byte */
inline equal_stream_header(stream_header_read, stream_header_written) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> assert(stream_header_read.message_length[stream_header_at] == stream_header_written.message_length[stream_header_at]); stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> assert(stream_header_read.stream_id[stream_header_at] == stream_header_written.stream_id[stream_header_at]); stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> assert(stream_header_read.sequence_number[stream_header_at] == stream_header_written.sequence_number[stream_header_at]); stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat Message: 4 bytes ---------------------------------------------- */

/* Heartbeat message will be sent when there is no data available for a few seconds. Only applicable for UDP TBT multicast channels. */
typedef HeartbeatMessage {
  byte last_sequence_no[4]
};

int heartbeat_message_at;

/* every byte of Heartbeat Message set to one value */
inline fill_heartbeat_message(heartbeat_message_record, heartbeat_message_value) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.last_sequence_no[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_message(heartbeat_message_record, heartbeat_message_base) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.last_sequence_no[heartbeat_message_at] = (heartbeat_message_base + 0 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message to the wire, 4 bytes from where the cursor stands */
inline encode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> wire[at] = heartbeat_message_record.last_sequence_no[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message off the wire, 4 bytes from where the cursor stands */
inline decode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.last_sequence_no[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Message is what was written, byte for byte */
inline equal_heartbeat_message(heartbeat_message_read, heartbeat_message_written) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> assert(heartbeat_message_read.last_sequence_no[heartbeat_message_at] == heartbeat_message_written.last_sequence_no[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick Data Recovery Response Message: 1 bytes ---------------------------- */

/* First message sent by the Recovery Server, indicating whether the request was processed successfully. */
typedef TickDataRecoveryResponseMessage {
  byte request_status
};

/* every byte of Tick Data Recovery Response Message set to one value */
inline fill_tick_data_recovery_response_message(tick_data_recovery_response_message_record, tick_data_recovery_response_message_value) {
  tick_data_recovery_response_message_record.request_status = tick_data_recovery_response_message_value;
  skip
}

/* each byte of Tick Data Recovery Response Message set to where it lies, so a field read out of place says so */
inline ramp_tick_data_recovery_response_message(tick_data_recovery_response_message_record, tick_data_recovery_response_message_base) {
  tick_data_recovery_response_message_record.request_status = (tick_data_recovery_response_message_base + 0 + 1) % 256;
  skip
}

/* Tick Data Recovery Response Message to the wire, 1 bytes from where the cursor stands */
inline encode_tick_data_recovery_response_message(tick_data_recovery_response_message_record) {
  wire[at] = tick_data_recovery_response_message_record.request_status; at = at + 1;
  skip
}

/* Tick Data Recovery Response Message off the wire, 1 bytes from where the cursor stands */
inline decode_tick_data_recovery_response_message(tick_data_recovery_response_message_record) {
  tick_data_recovery_response_message_record.request_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Tick Data Recovery Response Message is what was written, byte for byte */
inline equal_tick_data_recovery_response_message(tick_data_recovery_response_message_read, tick_data_recovery_response_message_written) {
  assert(tick_data_recovery_response_message_read.request_status == tick_data_recovery_response_message_written.request_status);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Stream Header: encoded, read back, and compared */
proctype check_stream_header() {
  StreamHeader stream_header_sent;
  StreamHeader stream_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_header(stream_header_sent, 0)
  :: pattern == 1 -> fill_stream_header(stream_header_sent, 32)
  :: pattern == 2 -> fill_stream_header(stream_header_sent, 255)
  :: else -> ramp_stream_header(stream_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_header(stream_header_sent);
    assert(at == 8);
    at = 0;
    decode_stream_header(stream_header_got);
    assert(at == 8);
    equal_stream_header(stream_header_got, stream_header_sent)
  }
}

/* Heartbeat Message: encoded, read back, and compared */
proctype check_heartbeat_message() {
  HeartbeatMessage heartbeat_message_sent;
  HeartbeatMessage heartbeat_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_message(heartbeat_message_sent, 0)
  :: pattern == 1 -> fill_heartbeat_message(heartbeat_message_sent, 32)
  :: pattern == 2 -> fill_heartbeat_message(heartbeat_message_sent, 255)
  :: else -> ramp_heartbeat_message(heartbeat_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_message(heartbeat_message_sent);
    assert(at == 4);
    at = 0;
    decode_heartbeat_message(heartbeat_message_got);
    assert(at == 4);
    equal_heartbeat_message(heartbeat_message_got, heartbeat_message_sent)
  }
}

/* Tick Data Recovery Response Message: encoded, read back, and compared */
proctype check_tick_data_recovery_response_message() {
  TickDataRecoveryResponseMessage tick_data_recovery_response_message_sent;
  TickDataRecoveryResponseMessage tick_data_recovery_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_data_recovery_response_message(tick_data_recovery_response_message_sent, 0)
  :: pattern == 1 -> fill_tick_data_recovery_response_message(tick_data_recovery_response_message_sent, 32)
  :: pattern == 2 -> fill_tick_data_recovery_response_message(tick_data_recovery_response_message_sent, 255)
  :: else -> ramp_tick_data_recovery_response_message(tick_data_recovery_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_data_recovery_response_message(tick_data_recovery_response_message_sent);
    assert(at == 1);
    at = 0;
    decode_tick_data_recovery_response_message(tick_data_recovery_response_message_got);
    assert(at == 1);
    equal_tick_data_recovery_response_message(tick_data_recovery_response_message_got, tick_data_recovery_response_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_stream_header()
  :: run check_heartbeat_message()
  :: run check_tick_data_recovery_response_message()
  fi
}
