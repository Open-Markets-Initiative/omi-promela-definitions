/*
 * Moscow Exchange SIMBA Spectra Orders Log Incremental
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
 *   - a field read in bits
 *   - a run filling what frames it
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 12

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Incremental Packet Header: 12 bytes ------------------------------------- */

/* MarketDataDummyMessage */
typedef IncrementalPacketHeader {
  byte transact_time[8];
  byte exchange_trading_session_id[4]
};

int incremental_packet_header_at;

/* every byte of Incremental Packet Header set to one value */
inline fill_incremental_packet_header(incremental_packet_header_record, incremental_packet_header_value) {
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 8 -> incremental_packet_header_record.transact_time[incremental_packet_header_at] = incremental_packet_header_value; incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 4 -> incremental_packet_header_record.exchange_trading_session_id[incremental_packet_header_at] = incremental_packet_header_value; incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Incremental Packet Header set to where it lies, so a field read out of place says so */
inline ramp_incremental_packet_header(incremental_packet_header_record, incremental_packet_header_base) {
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 8 -> incremental_packet_header_record.transact_time[incremental_packet_header_at] = (incremental_packet_header_base + 0 + incremental_packet_header_at + 1) % 256; incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 4 -> incremental_packet_header_record.exchange_trading_session_id[incremental_packet_header_at] = (incremental_packet_header_base + 8 + incremental_packet_header_at + 1) % 256; incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Incremental Packet Header to the wire, 12 bytes from where the cursor stands */
inline encode_incremental_packet_header(incremental_packet_header_record) {
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 8 -> wire[at] = incremental_packet_header_record.transact_time[incremental_packet_header_at]; at = at + 1; incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 4 -> wire[at] = incremental_packet_header_record.exchange_trading_session_id[incremental_packet_header_at]; at = at + 1; incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Incremental Packet Header off the wire, 12 bytes from where the cursor stands */
inline decode_incremental_packet_header(incremental_packet_header_record) {
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 8 -> incremental_packet_header_record.transact_time[incremental_packet_header_at] = wire[at]; at = at + 1; incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 4 -> incremental_packet_header_record.exchange_trading_session_id[incremental_packet_header_at] = wire[at]; at = at + 1; incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Incremental Packet Header is what was written, byte for byte */
inline equal_incremental_packet_header(incremental_packet_header_read, incremental_packet_header_written) {
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 8 -> assert(incremental_packet_header_read.transact_time[incremental_packet_header_at] == incremental_packet_header_written.transact_time[incremental_packet_header_at]); incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  incremental_packet_header_at = 0;
  do
  :: incremental_packet_header_at < 4 -> assert(incremental_packet_header_read.exchange_trading_session_id[incremental_packet_header_at] == incremental_packet_header_written.exchange_trading_session_id[incremental_packet_header_at]); incremental_packet_header_at = incremental_packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sbe Header: 8 bytes ----------------------------------------------------- */

/* Root block length, message template id, message schema id and schema version */
typedef SbeHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
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
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
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
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = (sbe_header_base + 2 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = (sbe_header_base + 4 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = (sbe_header_base + 6 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header to the wire, 8 bytes from where the cursor stands */
inline encode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.block_length[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.template_id[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.schema_id[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.version[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header off the wire, 8 bytes from where the cursor stands */
inline decode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
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
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.template_id[sbe_header_at] == sbe_header_written.template_id[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.schema_id[sbe_header_at] == sbe_header_written.schema_id[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.version[sbe_header_at] == sbe_header_written.version[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Reset Message: 4 bytes ----------------------------------------- */

/* SequenceResetMessage */
typedef SequenceResetMessage {
  byte new_seq_no[4]
};

int sequence_reset_message_at;

/* every byte of Sequence Reset Message set to one value */
inline fill_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_value) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = sequence_reset_message_value; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_base) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = (sequence_reset_message_base + 0 + sequence_reset_message_at + 1) % 256; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset Message to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> wire[at] = sequence_reset_message_record.new_seq_no[sequence_reset_message_at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset Message off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = wire[at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Reset Message is what was written, byte for byte */
inline equal_sequence_reset_message(sequence_reset_message_read, sequence_reset_message_written) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> assert(sequence_reset_message_read.new_seq_no[sequence_reset_message_at] == sequence_reset_message_written.new_seq_no[sequence_reset_message_at]); sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Size: 3 bytes ----------------------------------------------------- */

/* groupSize */
typedef GroupSize {
  byte block_length[2];
  byte num_in_group_uint_8
};

int group_size_at;

/* every byte of Group Size set to one value */
inline fill_group_size(group_size_record, group_size_value) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = group_size_value; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group_uint_8 = group_size_value;
  skip
}

/* each byte of Group Size set to where it lies, so a field read out of place says so */
inline ramp_group_size(group_size_record, group_size_base) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = (group_size_base + 0 + group_size_at + 1) % 256; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group_uint_8 = (group_size_base + 2 + 1) % 256;
  skip
}

/* Group Size to the wire, 3 bytes from where the cursor stands */
inline encode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> wire[at] = group_size_record.block_length[group_size_at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  wire[at] = group_size_record.num_in_group_uint_8; at = at + 1;
  skip
}

/* Group Size off the wire, 3 bytes from where the cursor stands */
inline decode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = wire[at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group_uint_8 = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Size is what was written, byte for byte */
inline equal_group_size(group_size_read, group_size_written) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> assert(group_size_read.block_length[group_size_at] == group_size_written.block_length[group_size_at]); group_size_at = group_size_at + 1
  :: else -> break
  od;
  assert(group_size_read.num_in_group_uint_8 == group_size_written.num_in_group_uint_8);
  skip
}

/* ---- Empty Book Message: 4 bytes --------------------------------------------- */

/* EmptyBookMessage */
typedef EmptyBookMessage {
  byte last_msg_seq_num_processed_u_int_32_null_optional[4]
};

int empty_book_message_at;

/* every byte of Empty Book Message set to one value */
inline fill_empty_book_message(empty_book_message_record, empty_book_message_value) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> empty_book_message_record.last_msg_seq_num_processed_u_int_32_null_optional[empty_book_message_at] = empty_book_message_value; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Empty Book Message set to where it lies, so a field read out of place says so */
inline ramp_empty_book_message(empty_book_message_record, empty_book_message_base) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> empty_book_message_record.last_msg_seq_num_processed_u_int_32_null_optional[empty_book_message_at] = (empty_book_message_base + 0 + empty_book_message_at + 1) % 256; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Empty Book Message to the wire, 4 bytes from where the cursor stands */
inline encode_empty_book_message(empty_book_message_record) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> wire[at] = empty_book_message_record.last_msg_seq_num_processed_u_int_32_null_optional[empty_book_message_at]; at = at + 1; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Empty Book Message off the wire, 4 bytes from where the cursor stands */
inline decode_empty_book_message(empty_book_message_record) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> empty_book_message_record.last_msg_seq_num_processed_u_int_32_null_optional[empty_book_message_at] = wire[at]; at = at + 1; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Empty Book Message is what was written, byte for byte */
inline equal_empty_book_message(empty_book_message_read, empty_book_message_written) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> assert(empty_book_message_read.last_msg_seq_num_processed_u_int_32_null_optional[empty_book_message_at] == empty_book_message_written.last_msg_seq_num_processed_u_int_32_null_optional[empty_book_message_at]); empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Incremental Packet Header: encoded, read back, and compared */
proctype check_incremental_packet_header() {
  IncrementalPacketHeader incremental_packet_header_sent;
  IncrementalPacketHeader incremental_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_incremental_packet_header(incremental_packet_header_sent, 0)
  :: pattern == 1 -> fill_incremental_packet_header(incremental_packet_header_sent, 32)
  :: pattern == 2 -> fill_incremental_packet_header(incremental_packet_header_sent, 255)
  :: else -> ramp_incremental_packet_header(incremental_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_incremental_packet_header(incremental_packet_header_sent);
    assert(at == 12);
    at = 0;
    decode_incremental_packet_header(incremental_packet_header_got);
    assert(at == 12);
    equal_incremental_packet_header(incremental_packet_header_got, incremental_packet_header_sent)
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
    assert(at == 8);
    at = 0;
    decode_sbe_header(sbe_header_got);
    assert(at == 8);
    equal_sbe_header(sbe_header_got, sbe_header_sent)
  }
}

/* Sequence Reset Message: encoded, read back, and compared */
proctype check_sequence_reset_message() {
  SequenceResetMessage sequence_reset_message_sent;
  SequenceResetMessage sequence_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_reset_message(sequence_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_reset_message(sequence_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_reset_message(sequence_reset_message_sent, 255)
  :: else -> ramp_sequence_reset_message(sequence_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_reset_message(sequence_reset_message_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_reset_message(sequence_reset_message_got);
    assert(at == 4);
    equal_sequence_reset_message(sequence_reset_message_got, sequence_reset_message_sent)
  }
}

/* Group Size: encoded, read back, and compared */
proctype check_group_size() {
  GroupSize group_size_sent;
  GroupSize group_size_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size(group_size_sent, 0)
  :: pattern == 1 -> fill_group_size(group_size_sent, 32)
  :: pattern == 2 -> fill_group_size(group_size_sent, 255)
  :: else -> ramp_group_size(group_size_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size(group_size_sent);
    assert(at == 3);
    at = 0;
    decode_group_size(group_size_got);
    assert(at == 3);
    equal_group_size(group_size_got, group_size_sent)
  }
}

/* Empty Book Message: encoded, read back, and compared */
proctype check_empty_book_message() {
  EmptyBookMessage empty_book_message_sent;
  EmptyBookMessage empty_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_empty_book_message(empty_book_message_sent, 0)
  :: pattern == 1 -> fill_empty_book_message(empty_book_message_sent, 32)
  :: pattern == 2 -> fill_empty_book_message(empty_book_message_sent, 255)
  :: else -> ramp_empty_book_message(empty_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_empty_book_message(empty_book_message_sent);
    assert(at == 4);
    at = 0;
    decode_empty_book_message(empty_book_message_got);
    assert(at == 4);
    equal_empty_book_message(empty_book_message_got, empty_book_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_incremental_packet_header()
  :: run check_sbe_header()
  :: run check_sequence_reset_message()
  :: run check_group_size()
  :: run check_empty_book_message()
  fi
}
