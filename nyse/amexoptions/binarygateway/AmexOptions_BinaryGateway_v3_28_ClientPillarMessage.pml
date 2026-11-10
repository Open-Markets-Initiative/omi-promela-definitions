/*
 * New York Stock Exchange Binary Gateway
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
 *   - a field present only on a condition
 *   - a run filling what frames it
 *   - a field read in bits
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

/* ---- Msg Header: 4 bytes ----------------------------------------------------- */

/* Pillar Stream Message Header */
typedef MsgHeader {
  byte msg_type[2];
  byte msg_length[2]
};

int msg_header_at;

/* every byte of Msg Header set to one value */
inline fill_msg_header(msg_header_record, msg_header_value) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_length[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Msg Header set to where it lies, so a field read out of place says so */
inline ramp_msg_header(msg_header_record, msg_header_base) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = (msg_header_base + 0 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_length[msg_header_at] = (msg_header_base + 2 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header to the wire, 4 bytes from where the cursor stands */
inline encode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_type[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_length[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header off the wire, 4 bytes from where the cursor stands */
inline decode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_length[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Msg Header is what was written, byte for byte */
inline equal_msg_header(msg_header_read, msg_header_written) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_type[msg_header_at] == msg_header_written.msg_type[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_length[msg_header_at] == msg_header_written.msg_length[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stream Id: 8 bytes ------------------------------------------------------ */

/* Pillar Stream Protocol Stream Identifier */
typedef StreamId {
  byte sess[4];
  byte value[4]
};

int stream_id_at;

/* every byte of Stream Id set to one value */
inline fill_stream_id(stream_id_record, stream_id_value) {
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> stream_id_record.sess[stream_id_at] = stream_id_value; stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> stream_id_record.value[stream_id_at] = stream_id_value; stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stream Id set to where it lies, so a field read out of place says so */
inline ramp_stream_id(stream_id_record, stream_id_base) {
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> stream_id_record.sess[stream_id_at] = (stream_id_base + 0 + stream_id_at + 1) % 256; stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> stream_id_record.value[stream_id_at] = (stream_id_base + 4 + stream_id_at + 1) % 256; stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Id to the wire, 8 bytes from where the cursor stands */
inline encode_stream_id(stream_id_record) {
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> wire[at] = stream_id_record.sess[stream_id_at]; at = at + 1; stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> wire[at] = stream_id_record.value[stream_id_at]; at = at + 1; stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Id off the wire, 8 bytes from where the cursor stands */
inline decode_stream_id(stream_id_record) {
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> stream_id_record.sess[stream_id_at] = wire[at]; at = at + 1; stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> stream_id_record.value[stream_id_at] = wire[at]; at = at + 1; stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stream Id is what was written, byte for byte */
inline equal_stream_id(stream_id_read, stream_id_written) {
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> assert(stream_id_read.sess[stream_id_at] == stream_id_written.sess[stream_id_at]); stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  stream_id_at = 0;
  do
  :: stream_id_at < 4 -> assert(stream_id_read.value[stream_id_at] == stream_id_written.value[stream_id_at]); stream_id_at = stream_id_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Seq Msg Id: 16 bytes ---------------------------------------------------- */

/* Pillar Stream Sequenced Message Identifier */
typedef SeqMsgId {
  StreamId stream_id;
  byte seq[8]
};

int seq_msg_id_at;

/* every byte of Seq Msg Id set to one value */
inline fill_seq_msg_id(seq_msg_id_record, seq_msg_id_value) {
  fill_stream_id(seq_msg_id_record.stream_id, seq_msg_id_value);
  seq_msg_id_at = 0;
  do
  :: seq_msg_id_at < 8 -> seq_msg_id_record.seq[seq_msg_id_at] = seq_msg_id_value; seq_msg_id_at = seq_msg_id_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Seq Msg Id set to where it lies, so a field read out of place says so */
inline ramp_seq_msg_id(seq_msg_id_record, seq_msg_id_base) {
  ramp_stream_id(seq_msg_id_record.stream_id, seq_msg_id_base + 0);
  seq_msg_id_at = 0;
  do
  :: seq_msg_id_at < 8 -> seq_msg_id_record.seq[seq_msg_id_at] = (seq_msg_id_base + 8 + seq_msg_id_at + 1) % 256; seq_msg_id_at = seq_msg_id_at + 1
  :: else -> break
  od;
  skip
}

/* Seq Msg Id to the wire, 16 bytes from where the cursor stands */
inline encode_seq_msg_id(seq_msg_id_record) {
  encode_stream_id(seq_msg_id_record.stream_id);
  seq_msg_id_at = 0;
  do
  :: seq_msg_id_at < 8 -> wire[at] = seq_msg_id_record.seq[seq_msg_id_at]; at = at + 1; seq_msg_id_at = seq_msg_id_at + 1
  :: else -> break
  od;
  skip
}

/* Seq Msg Id off the wire, 16 bytes from where the cursor stands */
inline decode_seq_msg_id(seq_msg_id_record) {
  decode_stream_id(seq_msg_id_record.stream_id);
  seq_msg_id_at = 0;
  do
  :: seq_msg_id_at < 8 -> seq_msg_id_record.seq[seq_msg_id_at] = wire[at]; at = at + 1; seq_msg_id_at = seq_msg_id_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Seq Msg Id is what was written, byte for byte */
inline equal_seq_msg_id(seq_msg_id_read, seq_msg_id_written) {
  equal_stream_id(seq_msg_id_read.stream_id, seq_msg_id_written.stream_id);
  seq_msg_id_at = 0;
  do
  :: seq_msg_id_at < 8 -> assert(seq_msg_id_read.seq[seq_msg_id_at] == seq_msg_id_written.seq[seq_msg_id_at]); seq_msg_id_at = seq_msg_id_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Seq Msg Header: 4 bytes ------------------------------------------------- */

/* Pillar Stream Sequenced Message Header */
typedef SeqMsgHeader {
  byte seq_msg_type[2];
  byte seq_msg_length[2]
};

int seq_msg_header_at;

/* every byte of Seq Msg Header set to one value */
inline fill_seq_msg_header(seq_msg_header_record, seq_msg_header_value) {
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> seq_msg_header_record.seq_msg_type[seq_msg_header_at] = seq_msg_header_value; seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> seq_msg_header_record.seq_msg_length[seq_msg_header_at] = seq_msg_header_value; seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Seq Msg Header set to where it lies, so a field read out of place says so */
inline ramp_seq_msg_header(seq_msg_header_record, seq_msg_header_base) {
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> seq_msg_header_record.seq_msg_type[seq_msg_header_at] = (seq_msg_header_base + 0 + seq_msg_header_at + 1) % 256; seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> seq_msg_header_record.seq_msg_length[seq_msg_header_at] = (seq_msg_header_base + 2 + seq_msg_header_at + 1) % 256; seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Seq Msg Header to the wire, 4 bytes from where the cursor stands */
inline encode_seq_msg_header(seq_msg_header_record) {
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> wire[at] = seq_msg_header_record.seq_msg_type[seq_msg_header_at]; at = at + 1; seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> wire[at] = seq_msg_header_record.seq_msg_length[seq_msg_header_at]; at = at + 1; seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Seq Msg Header off the wire, 4 bytes from where the cursor stands */
inline decode_seq_msg_header(seq_msg_header_record) {
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> seq_msg_header_record.seq_msg_type[seq_msg_header_at] = wire[at]; at = at + 1; seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> seq_msg_header_record.seq_msg_length[seq_msg_header_at] = wire[at]; at = at + 1; seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Seq Msg Header is what was written, byte for byte */
inline equal_seq_msg_header(seq_msg_header_read, seq_msg_header_written) {
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> assert(seq_msg_header_read.seq_msg_type[seq_msg_header_at] == seq_msg_header_written.seq_msg_type[seq_msg_header_at]); seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  seq_msg_header_at = 0;
  do
  :: seq_msg_header_at < 2 -> assert(seq_msg_header_read.seq_msg_length[seq_msg_header_at] == seq_msg_header_written.seq_msg_length[seq_msg_header_at]); seq_msg_header_at = seq_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sub Msg Header: 4 bytes ------------------------------------------------- */

/* Pillar Stream Sub Message Item Header */
typedef SubMsgHeader {
  byte sub_msg_type[2];
  byte sub_msg_length[2]
};

int sub_msg_header_at;

/* every byte of Sub Msg Header set to one value */
inline fill_sub_msg_header(sub_msg_header_record, sub_msg_header_value) {
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> sub_msg_header_record.sub_msg_type[sub_msg_header_at] = sub_msg_header_value; sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> sub_msg_header_record.sub_msg_length[sub_msg_header_at] = sub_msg_header_value; sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sub Msg Header set to where it lies, so a field read out of place says so */
inline ramp_sub_msg_header(sub_msg_header_record, sub_msg_header_base) {
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> sub_msg_header_record.sub_msg_type[sub_msg_header_at] = (sub_msg_header_base + 0 + sub_msg_header_at + 1) % 256; sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> sub_msg_header_record.sub_msg_length[sub_msg_header_at] = (sub_msg_header_base + 2 + sub_msg_header_at + 1) % 256; sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sub Msg Header to the wire, 4 bytes from where the cursor stands */
inline encode_sub_msg_header(sub_msg_header_record) {
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> wire[at] = sub_msg_header_record.sub_msg_type[sub_msg_header_at]; at = at + 1; sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> wire[at] = sub_msg_header_record.sub_msg_length[sub_msg_header_at]; at = at + 1; sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sub Msg Header off the wire, 4 bytes from where the cursor stands */
inline decode_sub_msg_header(sub_msg_header_record) {
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> sub_msg_header_record.sub_msg_type[sub_msg_header_at] = wire[at]; at = at + 1; sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> sub_msg_header_record.sub_msg_length[sub_msg_header_at] = wire[at]; at = at + 1; sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sub Msg Header is what was written, byte for byte */
inline equal_sub_msg_header(sub_msg_header_read, sub_msg_header_written) {
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> assert(sub_msg_header_read.sub_msg_type[sub_msg_header_at] == sub_msg_header_written.sub_msg_type[sub_msg_header_at]); sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  sub_msg_header_at = 0;
  do
  :: sub_msg_header_at < 2 -> assert(sub_msg_header_read.sub_msg_length[sub_msg_header_at] == sub_msg_header_written.sub_msg_length[sub_msg_header_at]); sub_msg_header_at = sub_msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Msg Header: encoded, read back, and compared */
proctype check_msg_header() {
  MsgHeader msg_header_sent;
  MsgHeader msg_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_msg_header(msg_header_sent, 0)
  :: pattern == 1 -> fill_msg_header(msg_header_sent, 32)
  :: pattern == 2 -> fill_msg_header(msg_header_sent, 255)
  :: else -> ramp_msg_header(msg_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_msg_header(msg_header_sent);
    assert(at == 4);
    at = 0;
    decode_msg_header(msg_header_got);
    assert(at == 4);
    equal_msg_header(msg_header_got, msg_header_sent)
  }
}

/* Stream Id: encoded, read back, and compared */
proctype check_stream_id() {
  StreamId stream_id_sent;
  StreamId stream_id_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_id(stream_id_sent, 0)
  :: pattern == 1 -> fill_stream_id(stream_id_sent, 32)
  :: pattern == 2 -> fill_stream_id(stream_id_sent, 255)
  :: else -> ramp_stream_id(stream_id_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_id(stream_id_sent);
    assert(at == 8);
    at = 0;
    decode_stream_id(stream_id_got);
    assert(at == 8);
    equal_stream_id(stream_id_got, stream_id_sent)
  }
}

/* Seq Msg Id: encoded, read back, and compared */
proctype check_seq_msg_id() {
  SeqMsgId seq_msg_id_sent;
  SeqMsgId seq_msg_id_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_seq_msg_id(seq_msg_id_sent, 0)
  :: pattern == 1 -> fill_seq_msg_id(seq_msg_id_sent, 32)
  :: pattern == 2 -> fill_seq_msg_id(seq_msg_id_sent, 255)
  :: else -> ramp_seq_msg_id(seq_msg_id_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_seq_msg_id(seq_msg_id_sent);
    assert(at == 16);
    at = 0;
    decode_seq_msg_id(seq_msg_id_got);
    assert(at == 16);
    equal_seq_msg_id(seq_msg_id_got, seq_msg_id_sent)
  }
}

/* Seq Msg Header: encoded, read back, and compared */
proctype check_seq_msg_header() {
  SeqMsgHeader seq_msg_header_sent;
  SeqMsgHeader seq_msg_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_seq_msg_header(seq_msg_header_sent, 0)
  :: pattern == 1 -> fill_seq_msg_header(seq_msg_header_sent, 32)
  :: pattern == 2 -> fill_seq_msg_header(seq_msg_header_sent, 255)
  :: else -> ramp_seq_msg_header(seq_msg_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_seq_msg_header(seq_msg_header_sent);
    assert(at == 4);
    at = 0;
    decode_seq_msg_header(seq_msg_header_got);
    assert(at == 4);
    equal_seq_msg_header(seq_msg_header_got, seq_msg_header_sent)
  }
}

/* Sub Msg Header: encoded, read back, and compared */
proctype check_sub_msg_header() {
  SubMsgHeader sub_msg_header_sent;
  SubMsgHeader sub_msg_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sub_msg_header(sub_msg_header_sent, 0)
  :: pattern == 1 -> fill_sub_msg_header(sub_msg_header_sent, 32)
  :: pattern == 2 -> fill_sub_msg_header(sub_msg_header_sent, 255)
  :: else -> ramp_sub_msg_header(sub_msg_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sub_msg_header(sub_msg_header_sent);
    assert(at == 4);
    at = 0;
    decode_sub_msg_header(sub_msg_header_got);
    assert(at == 4);
    equal_sub_msg_header(sub_msg_header_got, sub_msg_header_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_msg_header()
  :: run check_stream_id()
  :: run check_seq_msg_id()
  :: run check_seq_msg_header()
  :: run check_sub_msg_header()
  fi
}
