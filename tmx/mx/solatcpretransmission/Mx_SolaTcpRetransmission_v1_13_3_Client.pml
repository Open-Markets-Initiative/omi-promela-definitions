/*
 * TMX Group Sola Tcp Retransmission
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
#define WIRE 40

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Client Message Header: 12 bytes ----------------------------------------- */

/* Standard Hsvf message header */
typedef ClientMessageHeader {
  byte sequence_number[10];
  byte client_message_type[2]
};

int client_message_header_at;

/* every byte of Client Message Header set to one value */
inline fill_client_message_header(client_message_header_record, client_message_header_value) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 10 -> client_message_header_record.sequence_number[client_message_header_at] = client_message_header_value; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  client_message_header_at = 0;
  do
  :: client_message_header_at < 2 -> client_message_header_record.client_message_type[client_message_header_at] = client_message_header_value; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Client Message Header set to where it lies, so a field read out of place says so */
inline ramp_client_message_header(client_message_header_record, client_message_header_base) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 10 -> client_message_header_record.sequence_number[client_message_header_at] = (client_message_header_base + 0 + client_message_header_at + 1) % 256; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  client_message_header_at = 0;
  do
  :: client_message_header_at < 2 -> client_message_header_record.client_message_type[client_message_header_at] = (client_message_header_base + 10 + client_message_header_at + 1) % 256; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Client Message Header to the wire, 12 bytes from where the cursor stands */
inline encode_client_message_header(client_message_header_record) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 10 -> wire[at] = client_message_header_record.sequence_number[client_message_header_at]; at = at + 1; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  client_message_header_at = 0;
  do
  :: client_message_header_at < 2 -> wire[at] = client_message_header_record.client_message_type[client_message_header_at]; at = at + 1; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Client Message Header off the wire, 12 bytes from where the cursor stands */
inline decode_client_message_header(client_message_header_record) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 10 -> client_message_header_record.sequence_number[client_message_header_at] = wire[at]; at = at + 1; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  client_message_header_at = 0;
  do
  :: client_message_header_at < 2 -> client_message_header_record.client_message_type[client_message_header_at] = wire[at]; at = at + 1; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Client Message Header is what was written, byte for byte */
inline equal_client_message_header(client_message_header_read, client_message_header_written) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 10 -> assert(client_message_header_read.sequence_number[client_message_header_at] == client_message_header_written.sequence_number[client_message_header_at]); client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  client_message_header_at = 0;
  do
  :: client_message_header_at < 2 -> assert(client_message_header_read.client_message_type[client_message_header_at] == client_message_header_written.client_message_type[client_message_header_at]); client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Message: 40 bytes ------------------------------------------------- */

/* Login */
typedef LoginMessage {
  byte user[16];
  byte pwd[16];
  byte login_timestamp[6];
  byte protocol[2]
};

int login_message_at;

/* every byte of Login Message set to one value */
inline fill_login_message(login_message_record, login_message_value) {
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.user[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.pwd[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 6 -> login_message_record.login_timestamp[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.protocol[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Message set to where it lies, so a field read out of place says so */
inline ramp_login_message(login_message_record, login_message_base) {
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.user[login_message_at] = (login_message_base + 0 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.pwd[login_message_at] = (login_message_base + 16 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 6 -> login_message_record.login_timestamp[login_message_at] = (login_message_base + 32 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.protocol[login_message_at] = (login_message_base + 38 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message to the wire, 40 bytes from where the cursor stands */
inline encode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 16 -> wire[at] = login_message_record.user[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> wire[at] = login_message_record.pwd[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 6 -> wire[at] = login_message_record.login_timestamp[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> wire[at] = login_message_record.protocol[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message off the wire, 40 bytes from where the cursor stands */
inline decode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.user[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.pwd[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 6 -> login_message_record.login_timestamp[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.protocol[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Message is what was written, byte for byte */
inline equal_login_message(login_message_read, login_message_written) {
  login_message_at = 0;
  do
  :: login_message_at < 16 -> assert(login_message_read.user[login_message_at] == login_message_written.user[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> assert(login_message_read.pwd[login_message_at] == login_message_written.pwd[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 6 -> assert(login_message_read.login_timestamp[login_message_at] == login_message_written.login_timestamp[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> assert(login_message_read.protocol[login_message_at] == login_message_written.protocol[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request Message: 22 bytes -------------------------------- */

/* Retransmission Request */
typedef RetransmissionRequestMessage {
  byte line[2];
  byte start[10];
  byte end[10]
};

int retransmission_request_message_at;

/* every byte of Retransmission Request Message set to one value */
inline fill_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_value) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.line[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> retransmission_request_message_record.start[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> retransmission_request_message_record.end[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_base) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.line[retransmission_request_message_at] = (retransmission_request_message_base + 0 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> retransmission_request_message_record.start[retransmission_request_message_at] = (retransmission_request_message_base + 2 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> retransmission_request_message_record.end[retransmission_request_message_at] = (retransmission_request_message_base + 12 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request Message to the wire, 22 bytes from where the cursor stands */
inline encode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> wire[at] = retransmission_request_message_record.line[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> wire[at] = retransmission_request_message_record.start[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> wire[at] = retransmission_request_message_record.end[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request Message off the wire, 22 bytes from where the cursor stands */
inline decode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.line[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> retransmission_request_message_record.start[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> retransmission_request_message_record.end[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Request Message is what was written, byte for byte */
inline equal_retransmission_request_message(retransmission_request_message_read, retransmission_request_message_written) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> assert(retransmission_request_message_read.line[retransmission_request_message_at] == retransmission_request_message_written.line[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> assert(retransmission_request_message_read.start[retransmission_request_message_at] == retransmission_request_message_written.start[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> assert(retransmission_request_message_read.end[retransmission_request_message_at] == retransmission_request_message_written.end[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Client Message Header: encoded, read back, and compared */
proctype check_client_message_header() {
  ClientMessageHeader client_message_header_sent;
  ClientMessageHeader client_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_message_header(client_message_header_sent, 0)
  :: pattern == 1 -> fill_client_message_header(client_message_header_sent, 32)
  :: pattern == 2 -> fill_client_message_header(client_message_header_sent, 255)
  :: else -> ramp_client_message_header(client_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_message_header(client_message_header_sent);
    assert(at == 12);
    at = 0;
    decode_client_message_header(client_message_header_got);
    assert(at == 12);
    equal_client_message_header(client_message_header_got, client_message_header_sent)
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
    assert(at == 40);
    at = 0;
    decode_login_message(login_message_got);
    assert(at == 40);
    equal_login_message(login_message_got, login_message_sent)
  }
}

/* Retransmission Request Message: encoded, read back, and compared */
proctype check_retransmission_request_message() {
  RetransmissionRequestMessage retransmission_request_message_sent;
  RetransmissionRequestMessage retransmission_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request_message(retransmission_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_request_message(retransmission_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_request_message(retransmission_request_message_sent, 255)
  :: else -> ramp_retransmission_request_message(retransmission_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request_message(retransmission_request_message_sent);
    assert(at == 22);
    at = 0;
    decode_retransmission_request_message(retransmission_request_message_got);
    assert(at == 22);
    equal_retransmission_request_message(retransmission_request_message_got, retransmission_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_message_header()
  :: run check_login_message()
  :: run check_retransmission_request_message()
  fi
}
