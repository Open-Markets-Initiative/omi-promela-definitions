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
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 10

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Tick Data Recovery Request Message: 10 bytes ---------------------------- */

/* Sent to the Recovery Server whenever tick data is missed. */
typedef TickDataRecoveryRequestMessage {
  byte stream_id[2];
  byte start_sequence_number[4];
  byte end_sequence_number[4]
};

int tick_data_recovery_request_message_at;

/* every byte of Tick Data Recovery Request Message set to one value */
inline fill_tick_data_recovery_request_message(tick_data_recovery_request_message_record, tick_data_recovery_request_message_value) {
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 2 -> tick_data_recovery_request_message_record.stream_id[tick_data_recovery_request_message_at] = tick_data_recovery_request_message_value; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> tick_data_recovery_request_message_record.start_sequence_number[tick_data_recovery_request_message_at] = tick_data_recovery_request_message_value; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> tick_data_recovery_request_message_record.end_sequence_number[tick_data_recovery_request_message_at] = tick_data_recovery_request_message_value; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tick Data Recovery Request Message set to where it lies, so a field read out of place says so */
inline ramp_tick_data_recovery_request_message(tick_data_recovery_request_message_record, tick_data_recovery_request_message_base) {
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 2 -> tick_data_recovery_request_message_record.stream_id[tick_data_recovery_request_message_at] = (tick_data_recovery_request_message_base + 0 + tick_data_recovery_request_message_at + 1) % 256; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> tick_data_recovery_request_message_record.start_sequence_number[tick_data_recovery_request_message_at] = (tick_data_recovery_request_message_base + 2 + tick_data_recovery_request_message_at + 1) % 256; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> tick_data_recovery_request_message_record.end_sequence_number[tick_data_recovery_request_message_at] = (tick_data_recovery_request_message_base + 6 + tick_data_recovery_request_message_at + 1) % 256; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Data Recovery Request Message to the wire, 10 bytes from where the cursor stands */
inline encode_tick_data_recovery_request_message(tick_data_recovery_request_message_record) {
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 2 -> wire[at] = tick_data_recovery_request_message_record.stream_id[tick_data_recovery_request_message_at]; at = at + 1; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> wire[at] = tick_data_recovery_request_message_record.start_sequence_number[tick_data_recovery_request_message_at]; at = at + 1; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> wire[at] = tick_data_recovery_request_message_record.end_sequence_number[tick_data_recovery_request_message_at]; at = at + 1; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Data Recovery Request Message off the wire, 10 bytes from where the cursor stands */
inline decode_tick_data_recovery_request_message(tick_data_recovery_request_message_record) {
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 2 -> tick_data_recovery_request_message_record.stream_id[tick_data_recovery_request_message_at] = wire[at]; at = at + 1; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> tick_data_recovery_request_message_record.start_sequence_number[tick_data_recovery_request_message_at] = wire[at]; at = at + 1; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> tick_data_recovery_request_message_record.end_sequence_number[tick_data_recovery_request_message_at] = wire[at]; at = at + 1; tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tick Data Recovery Request Message is what was written, byte for byte */
inline equal_tick_data_recovery_request_message(tick_data_recovery_request_message_read, tick_data_recovery_request_message_written) {
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 2 -> assert(tick_data_recovery_request_message_read.stream_id[tick_data_recovery_request_message_at] == tick_data_recovery_request_message_written.stream_id[tick_data_recovery_request_message_at]); tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> assert(tick_data_recovery_request_message_read.start_sequence_number[tick_data_recovery_request_message_at] == tick_data_recovery_request_message_written.start_sequence_number[tick_data_recovery_request_message_at]); tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  tick_data_recovery_request_message_at = 0;
  do
  :: tick_data_recovery_request_message_at < 4 -> assert(tick_data_recovery_request_message_read.end_sequence_number[tick_data_recovery_request_message_at] == tick_data_recovery_request_message_written.end_sequence_number[tick_data_recovery_request_message_at]); tick_data_recovery_request_message_at = tick_data_recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Tick Data Recovery Request Message: encoded, read back, and compared */
proctype check_tick_data_recovery_request_message() {
  TickDataRecoveryRequestMessage tick_data_recovery_request_message_sent;
  TickDataRecoveryRequestMessage tick_data_recovery_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_data_recovery_request_message(tick_data_recovery_request_message_sent, 0)
  :: pattern == 1 -> fill_tick_data_recovery_request_message(tick_data_recovery_request_message_sent, 32)
  :: pattern == 2 -> fill_tick_data_recovery_request_message(tick_data_recovery_request_message_sent, 255)
  :: else -> ramp_tick_data_recovery_request_message(tick_data_recovery_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_data_recovery_request_message(tick_data_recovery_request_message_sent);
    assert(at == 10);
    at = 0;
    decode_tick_data_recovery_request_message(tick_data_recovery_request_message_got);
    assert(at == 10);
    equal_tick_data_recovery_request_message(tick_data_recovery_request_message_got, tick_data_recovery_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_tick_data_recovery_request_message()
  fi
}
