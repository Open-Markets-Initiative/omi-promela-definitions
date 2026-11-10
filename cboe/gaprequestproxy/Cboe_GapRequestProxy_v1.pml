/*
 * Chicago Board Options Exchange 
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
 *   - a run filling what frames it
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

/* ---- Packet Header: 8 bytes -------------------------------------------------- */

typedef PacketHeader {
  byte length[2];
  byte message_count;
  byte unit;
  byte sequence[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = packet_header_value;
  packet_header_record.unit = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.unit = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 8 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.message_count; at = at + 1;
  wire[at] = packet_header_record.unit; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 8 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_record.unit = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.length[packet_header_at] == packet_header_written.length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.message_count == packet_header_written.message_count);
  assert(packet_header_read.unit == packet_header_written.unit);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_length == message_header_written.message_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Login Message: 20 bytes ------------------------------------------------- */

/* The Login message is the first message sent to the Gap Request Proxy by a user's process after the connection is established. Failure to login before sending any other message type will result in the connection being dropped by the Gap Request Proxy. */
typedef LoginMessage {
  byte session_sub_id[4];
  byte username[4];
  byte filler[2];
  byte password[10]
};

int login_message_at;

/* every byte of Login Message set to one value */
inline fill_login_message(login_message_record, login_message_value) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.session_sub_id[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.username[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.filler[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Message set to where it lies, so a field read out of place says so */
inline ramp_login_message(login_message_record, login_message_base) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.session_sub_id[login_message_at] = (login_message_base + 0 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.username[login_message_at] = (login_message_base + 4 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.filler[login_message_at] = (login_message_base + 8 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = (login_message_base + 10 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message to the wire, 20 bytes from where the cursor stands */
inline encode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> wire[at] = login_message_record.session_sub_id[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> wire[at] = login_message_record.username[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> wire[at] = login_message_record.filler[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> wire[at] = login_message_record.password[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message off the wire, 20 bytes from where the cursor stands */
inline decode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.session_sub_id[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.username[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.filler[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Message is what was written, byte for byte */
inline equal_login_message(login_message_read, login_message_written) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> assert(login_message_read.session_sub_id[login_message_at] == login_message_written.session_sub_id[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> assert(login_message_read.username[login_message_at] == login_message_written.username[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> assert(login_message_read.filler[login_message_at] == login_message_written.filler[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> assert(login_message_read.password[login_message_at] == login_message_written.password[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 1 bytes ----------------------------------------- */

/* The Login Response message is sent by the Gap Request Proxy to a user's process in response to a Login message. The status field is used to reflect an accepted login or the reason the session was not accepted. If login fails, the connection will be dropped after the Login Response message is sent. */
typedef LoginResponseMessage {
  byte login_response_status
};

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_record.login_response_status = login_response_message_value;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_record.login_response_status = (login_response_message_base + 0 + 1) % 256;
  skip
}

/* Login Response Message to the wire, 1 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  wire[at] = login_response_message_record.login_response_status; at = at + 1;
  skip
}

/* Login Response Message off the wire, 1 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_record.login_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  assert(login_response_message_read.login_response_status == login_response_message_written.login_response_status);
  skip
}

/* ---- Gap Request Message: 7 bytes -------------------------------------------- */

/* The Gap Request message is used by a user's process to request retransmission of a sequenced message (or messages) by one of Cboe's gap servers. */
typedef GapRequestMessage {
  byte gap_unit;
  byte gap_sequence[4];
  byte count[2]
};

int gap_request_message_at;

/* every byte of Gap Request Message set to one value */
inline fill_gap_request_message(gap_request_message_record, gap_request_message_value) {
  gap_request_message_record.gap_unit = gap_request_message_value;
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 4 -> gap_request_message_record.gap_sequence[gap_request_message_at] = gap_request_message_value; gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 2 -> gap_request_message_record.count[gap_request_message_at] = gap_request_message_value; gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Gap Request Message set to where it lies, so a field read out of place says so */
inline ramp_gap_request_message(gap_request_message_record, gap_request_message_base) {
  gap_request_message_record.gap_unit = (gap_request_message_base + 0 + 1) % 256;
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 4 -> gap_request_message_record.gap_sequence[gap_request_message_at] = (gap_request_message_base + 1 + gap_request_message_at + 1) % 256; gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 2 -> gap_request_message_record.count[gap_request_message_at] = (gap_request_message_base + 5 + gap_request_message_at + 1) % 256; gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gap Request Message to the wire, 7 bytes from where the cursor stands */
inline encode_gap_request_message(gap_request_message_record) {
  wire[at] = gap_request_message_record.gap_unit; at = at + 1;
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 4 -> wire[at] = gap_request_message_record.gap_sequence[gap_request_message_at]; at = at + 1; gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 2 -> wire[at] = gap_request_message_record.count[gap_request_message_at]; at = at + 1; gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gap Request Message off the wire, 7 bytes from where the cursor stands */
inline decode_gap_request_message(gap_request_message_record) {
  gap_request_message_record.gap_unit = wire[at]; at = at + 1;
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 4 -> gap_request_message_record.gap_sequence[gap_request_message_at] = wire[at]; at = at + 1; gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 2 -> gap_request_message_record.count[gap_request_message_at] = wire[at]; at = at + 1; gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Gap Request Message is what was written, byte for byte */
inline equal_gap_request_message(gap_request_message_read, gap_request_message_written) {
  assert(gap_request_message_read.gap_unit == gap_request_message_written.gap_unit);
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 4 -> assert(gap_request_message_read.gap_sequence[gap_request_message_at] == gap_request_message_written.gap_sequence[gap_request_message_at]); gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  gap_request_message_at = 0;
  do
  :: gap_request_message_at < 2 -> assert(gap_request_message_read.count[gap_request_message_at] == gap_request_message_written.count[gap_request_message_at]); gap_request_message_at = gap_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gap Response Message: 8 bytes ------------------------------------------- */

/* The Gap Response message is sent by the Gap Request Proxy in response to a Gap Request message. The Unit and Sequence fields will match the values supplied in the Gap Request message. A Gap Response message, with a Status of Accepted or reason for failure, will be sent for each Gap Request message received by the Gap Request Proxy. */
typedef GapResponseMessage {
  byte gap_unit;
  byte gap_sequence[4];
  byte count[2];
  byte gap_response_status
};

int gap_response_message_at;

/* every byte of Gap Response Message set to one value */
inline fill_gap_response_message(gap_response_message_record, gap_response_message_value) {
  gap_response_message_record.gap_unit = gap_response_message_value;
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 4 -> gap_response_message_record.gap_sequence[gap_response_message_at] = gap_response_message_value; gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 2 -> gap_response_message_record.count[gap_response_message_at] = gap_response_message_value; gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  gap_response_message_record.gap_response_status = gap_response_message_value;
  skip
}

/* each byte of Gap Response Message set to where it lies, so a field read out of place says so */
inline ramp_gap_response_message(gap_response_message_record, gap_response_message_base) {
  gap_response_message_record.gap_unit = (gap_response_message_base + 0 + 1) % 256;
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 4 -> gap_response_message_record.gap_sequence[gap_response_message_at] = (gap_response_message_base + 1 + gap_response_message_at + 1) % 256; gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 2 -> gap_response_message_record.count[gap_response_message_at] = (gap_response_message_base + 5 + gap_response_message_at + 1) % 256; gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  gap_response_message_record.gap_response_status = (gap_response_message_base + 7 + 1) % 256;
  skip
}

/* Gap Response Message to the wire, 8 bytes from where the cursor stands */
inline encode_gap_response_message(gap_response_message_record) {
  wire[at] = gap_response_message_record.gap_unit; at = at + 1;
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 4 -> wire[at] = gap_response_message_record.gap_sequence[gap_response_message_at]; at = at + 1; gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 2 -> wire[at] = gap_response_message_record.count[gap_response_message_at]; at = at + 1; gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  wire[at] = gap_response_message_record.gap_response_status; at = at + 1;
  skip
}

/* Gap Response Message off the wire, 8 bytes from where the cursor stands */
inline decode_gap_response_message(gap_response_message_record) {
  gap_response_message_record.gap_unit = wire[at]; at = at + 1;
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 4 -> gap_response_message_record.gap_sequence[gap_response_message_at] = wire[at]; at = at + 1; gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 2 -> gap_response_message_record.count[gap_response_message_at] = wire[at]; at = at + 1; gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  gap_response_message_record.gap_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Gap Response Message is what was written, byte for byte */
inline equal_gap_response_message(gap_response_message_read, gap_response_message_written) {
  assert(gap_response_message_read.gap_unit == gap_response_message_written.gap_unit);
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 4 -> assert(gap_response_message_read.gap_sequence[gap_response_message_at] == gap_response_message_written.gap_sequence[gap_response_message_at]); gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  gap_response_message_at = 0;
  do
  :: gap_response_message_at < 2 -> assert(gap_response_message_read.count[gap_response_message_at] == gap_response_message_written.count[gap_response_message_at]); gap_response_message_at = gap_response_message_at + 1
  :: else -> break
  od;
  assert(gap_response_message_read.gap_response_status == gap_response_message_written.gap_response_status);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Packet Header: encoded, read back, and compared */
proctype check_packet_header() {
  PacketHeader packet_header_sent;
  PacketHeader packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_packet_header(packet_header_sent, 0)
  :: pattern == 1 -> fill_packet_header(packet_header_sent, 32)
  :: pattern == 2 -> fill_packet_header(packet_header_sent, 255)
  :: else -> ramp_packet_header(packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_packet_header(packet_header_sent);
    assert(at == 8);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 8);
    equal_packet_header(packet_header_got, packet_header_sent)
  }
}

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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Login Message: encoded, read back, and compared */
proctype check_login_message() {
  LoginMessage login_message_sent;
  LoginMessage login_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_message(login_message_sent, 0)
  :: pattern == 1 -> fill_login_message(login_message_sent, 32)
  :: pattern == 2 -> fill_login_message(login_message_sent, 255)
  :: else -> ramp_login_message(login_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_message(login_message_sent);
    assert(at == 20);
    at = 0;
    decode_login_message(login_message_got);
    assert(at == 20);
    equal_login_message(login_message_got, login_message_sent)
  }
}

/* Login Response Message: encoded, read back, and compared */
proctype check_login_response_message() {
  LoginResponseMessage login_response_message_sent;
  LoginResponseMessage login_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response_message(login_response_message_sent, 0)
  :: pattern == 1 -> fill_login_response_message(login_response_message_sent, 32)
  :: pattern == 2 -> fill_login_response_message(login_response_message_sent, 255)
  :: else -> ramp_login_response_message(login_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response_message(login_response_message_sent);
    assert(at == 1);
    at = 0;
    decode_login_response_message(login_response_message_got);
    assert(at == 1);
    equal_login_response_message(login_response_message_got, login_response_message_sent)
  }
}

/* Gap Request Message: encoded, read back, and compared */
proctype check_gap_request_message() {
  GapRequestMessage gap_request_message_sent;
  GapRequestMessage gap_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gap_request_message(gap_request_message_sent, 0)
  :: pattern == 1 -> fill_gap_request_message(gap_request_message_sent, 32)
  :: pattern == 2 -> fill_gap_request_message(gap_request_message_sent, 255)
  :: else -> ramp_gap_request_message(gap_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gap_request_message(gap_request_message_sent);
    assert(at == 7);
    at = 0;
    decode_gap_request_message(gap_request_message_got);
    assert(at == 7);
    equal_gap_request_message(gap_request_message_got, gap_request_message_sent)
  }
}

/* Gap Response Message: encoded, read back, and compared */
proctype check_gap_response_message() {
  GapResponseMessage gap_response_message_sent;
  GapResponseMessage gap_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gap_response_message(gap_response_message_sent, 0)
  :: pattern == 1 -> fill_gap_response_message(gap_response_message_sent, 32)
  :: pattern == 2 -> fill_gap_response_message(gap_response_message_sent, 255)
  :: else -> ramp_gap_response_message(gap_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gap_response_message(gap_response_message_sent);
    assert(at == 8);
    at = 0;
    decode_gap_response_message(gap_response_message_got);
    assert(at == 8);
    equal_gap_response_message(gap_response_message_got, gap_response_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_login_message()
  :: run check_login_response_message()
  :: run check_gap_request_message()
  :: run check_gap_response_message()
  fi
}
