/*
 * TMX Group Quantum Feed Level 1 Recovery
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
 *   - a length prefix framing what follows
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 11

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Frame Header: 11 bytes -------------------------------------------------- */

/* XMT frame prefix and outer header. */
typedef FrameHeader {
  byte start_of_frame;
  byte protocol_name;
  byte protocol_version;
  byte message_length[2];
  byte session_id[4];
  byte ack_required_poss_dup;
  byte num_body
};

int frame_header_at;

/* every byte of Frame Header set to one value */
inline fill_frame_header(frame_header_record, frame_header_value) {
  frame_header_record.start_of_frame = frame_header_value;
  frame_header_record.protocol_name = frame_header_value;
  frame_header_record.protocol_version = frame_header_value;
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> frame_header_record.message_length[frame_header_at] = frame_header_value; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> frame_header_record.session_id[frame_header_at] = frame_header_value; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_record.ack_required_poss_dup = frame_header_value;
  frame_header_record.num_body = frame_header_value;
  skip
}

/* each byte of Frame Header set to where it lies, so a field read out of place says so */
inline ramp_frame_header(frame_header_record, frame_header_base) {
  frame_header_record.start_of_frame = (frame_header_base + 0 + 1) % 256;
  frame_header_record.protocol_name = (frame_header_base + 1 + 1) % 256;
  frame_header_record.protocol_version = (frame_header_base + 2 + 1) % 256;
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> frame_header_record.message_length[frame_header_at] = (frame_header_base + 3 + frame_header_at + 1) % 256; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> frame_header_record.session_id[frame_header_at] = (frame_header_base + 5 + frame_header_at + 1) % 256; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_record.ack_required_poss_dup = (frame_header_base + 9 + 1) % 256;
  frame_header_record.num_body = (frame_header_base + 10 + 1) % 256;
  skip
}

/* Frame Header to the wire, 11 bytes from where the cursor stands */
inline encode_frame_header(frame_header_record) {
  wire[at] = frame_header_record.start_of_frame; at = at + 1;
  wire[at] = frame_header_record.protocol_name; at = at + 1;
  wire[at] = frame_header_record.protocol_version; at = at + 1;
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> wire[at] = frame_header_record.message_length[frame_header_at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> wire[at] = frame_header_record.session_id[frame_header_at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  wire[at] = frame_header_record.ack_required_poss_dup; at = at + 1;
  wire[at] = frame_header_record.num_body; at = at + 1;
  skip
}

/* Frame Header off the wire, 11 bytes from where the cursor stands */
inline decode_frame_header(frame_header_record) {
  frame_header_record.start_of_frame = wire[at]; at = at + 1;
  frame_header_record.protocol_name = wire[at]; at = at + 1;
  frame_header_record.protocol_version = wire[at]; at = at + 1;
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> frame_header_record.message_length[frame_header_at] = wire[at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> frame_header_record.session_id[frame_header_at] = wire[at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_record.ack_required_poss_dup = wire[at]; at = at + 1;
  frame_header_record.num_body = wire[at]; at = at + 1;
  skip
}

/* what was read of Frame Header is what was written, byte for byte */
inline equal_frame_header(frame_header_read, frame_header_written) {
  assert(frame_header_read.start_of_frame == frame_header_written.start_of_frame);
  assert(frame_header_read.protocol_name == frame_header_written.protocol_name);
  assert(frame_header_read.protocol_version == frame_header_written.protocol_version);
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> assert(frame_header_read.message_length[frame_header_at] == frame_header_written.message_length[frame_header_at]); frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> assert(frame_header_read.session_id[frame_header_at] == frame_header_written.session_id[frame_header_at]); frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  assert(frame_header_read.ack_required_poss_dup == frame_header_written.ack_required_poss_dup);
  assert(frame_header_read.num_body == frame_header_written.num_body);
  skip
}

/* ---- Body Header: 3 bytes ---------------------------------------------------- */

/* Xmt Body Header */
typedef BodyHeader {
  byte msg_length[2];
  byte msg_type
};

int body_header_at;

/* every byte of Body Header set to one value */
inline fill_body_header(body_header_record, body_header_value) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> body_header_record.msg_length[body_header_at] = body_header_value; body_header_at = body_header_at + 1
  :: else -> break
  od;
  body_header_record.msg_type = body_header_value;
  skip
}

/* each byte of Body Header set to where it lies, so a field read out of place says so */
inline ramp_body_header(body_header_record, body_header_base) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> body_header_record.msg_length[body_header_at] = (body_header_base + 0 + body_header_at + 1) % 256; body_header_at = body_header_at + 1
  :: else -> break
  od;
  body_header_record.msg_type = (body_header_base + 2 + 1) % 256;
  skip
}

/* Body Header to the wire, 3 bytes from where the cursor stands */
inline encode_body_header(body_header_record) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> wire[at] = body_header_record.msg_length[body_header_at]; at = at + 1; body_header_at = body_header_at + 1
  :: else -> break
  od;
  wire[at] = body_header_record.msg_type; at = at + 1;
  skip
}

/* Body Header off the wire, 3 bytes from where the cursor stands */
inline decode_body_header(body_header_record) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> body_header_record.msg_length[body_header_at] = wire[at]; at = at + 1; body_header_at = body_header_at + 1
  :: else -> break
  od;
  body_header_record.msg_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Body Header is what was written, byte for byte */
inline equal_body_header(body_header_read, body_header_written) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> assert(body_header_read.msg_length[body_header_at] == body_header_written.msg_length[body_header_at]); body_header_at = body_header_at + 1
  :: else -> break
  od;
  assert(body_header_read.msg_type == body_header_written.msg_type);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Frame Header: encoded, read back, and compared */
proctype check_frame_header() {
  FrameHeader frame_header_sent;
  FrameHeader frame_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_frame_header(frame_header_sent, 0)
  :: pattern == 1 -> fill_frame_header(frame_header_sent, 32)
  :: pattern == 2 -> fill_frame_header(frame_header_sent, 255)
  :: else -> ramp_frame_header(frame_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_frame_header(frame_header_sent);
    assert(at == 11);
    at = 0;
    decode_frame_header(frame_header_got);
    assert(at == 11);
    equal_frame_header(frame_header_got, frame_header_sent)
  }
}

/* Body Header: encoded, read back, and compared */
proctype check_body_header() {
  BodyHeader body_header_sent;
  BodyHeader body_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_body_header(body_header_sent, 0)
  :: pattern == 1 -> fill_body_header(body_header_sent, 32)
  :: pattern == 2 -> fill_body_header(body_header_sent, 255)
  :: else -> ramp_body_header(body_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_body_header(body_header_sent);
    assert(at == 3);
    at = 0;
    decode_body_header(body_header_got);
    assert(at == 3);
    equal_body_header(body_header_got, body_header_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_frame_header()
  :: run check_body_header()
  fi
}
