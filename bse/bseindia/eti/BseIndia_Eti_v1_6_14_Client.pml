/*
 * BSE Limited Enhanced Trading Interface
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
#define WIRE 8

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 6 bytes ------------------------------------------------- */

/* Bse Eti message header */
typedef MessageHeader {
  byte body_len[4];
  byte template_id[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_len[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_len[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 6 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.body_len[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.template_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 6 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_len[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.body_len[message_header_at] == message_header_written.body_len[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.template_id[message_header_at] == message_header_written.template_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Request Header Comp: 8 bytes -------------------------------------------- */

typedef RequestHeaderComp {
  byte msg_seq_num[4];
  byte sender_sub_id[4]
};

int request_header_comp_at;

/* every byte of Request Header Comp set to one value */
inline fill_request_header_comp(request_header_comp_record, request_header_comp_value) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.msg_seq_num[request_header_comp_at] = request_header_comp_value; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.sender_sub_id[request_header_comp_at] = request_header_comp_value; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Request Header Comp set to where it lies, so a field read out of place says so */
inline ramp_request_header_comp(request_header_comp_record, request_header_comp_base) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.msg_seq_num[request_header_comp_at] = (request_header_comp_base + 0 + request_header_comp_at + 1) % 256; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.sender_sub_id[request_header_comp_at] = (request_header_comp_base + 4 + request_header_comp_at + 1) % 256; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Request Header Comp to the wire, 8 bytes from where the cursor stands */
inline encode_request_header_comp(request_header_comp_record) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> wire[at] = request_header_comp_record.msg_seq_num[request_header_comp_at]; at = at + 1; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> wire[at] = request_header_comp_record.sender_sub_id[request_header_comp_at]; at = at + 1; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Request Header Comp off the wire, 8 bytes from where the cursor stands */
inline decode_request_header_comp(request_header_comp_record) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.msg_seq_num[request_header_comp_at] = wire[at]; at = at + 1; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.sender_sub_id[request_header_comp_at] = wire[at]; at = at + 1; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Request Header Comp is what was written, byte for byte */
inline equal_request_header_comp(request_header_comp_read, request_header_comp_written) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> assert(request_header_comp_read.msg_seq_num[request_header_comp_at] == request_header_comp_written.msg_seq_num[request_header_comp_at]); request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> assert(request_header_comp_read.sender_sub_id[request_header_comp_at] == request_header_comp_written.sender_sub_id[request_header_comp_at]); request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Message Header: encoded, read back, and compared */
proctype check_message_header() {
  MessageHeader message_header_sent;
  MessageHeader message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_header(message_header_sent, 0)
  :: pattern == 1 -> fill_message_header(message_header_sent, 32)
  :: pattern == 2 -> fill_message_header(message_header_sent, 255)
  :: else -> ramp_message_header(message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_header(message_header_sent);
    assert(at == 6);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 6);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Request Header Comp: encoded, read back, and compared */
proctype check_request_header_comp() {
  RequestHeaderComp request_header_comp_sent;
  RequestHeaderComp request_header_comp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_header_comp(request_header_comp_sent, 0)
  :: pattern == 1 -> fill_request_header_comp(request_header_comp_sent, 32)
  :: pattern == 2 -> fill_request_header_comp(request_header_comp_sent, 255)
  :: else -> ramp_request_header_comp(request_header_comp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_header_comp(request_header_comp_sent);
    assert(at == 8);
    at = 0;
    decode_request_header_comp(request_header_comp_got);
    assert(at == 8);
    equal_request_header_comp(request_header_comp_got, request_header_comp_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_request_header_comp()
  fi
}
