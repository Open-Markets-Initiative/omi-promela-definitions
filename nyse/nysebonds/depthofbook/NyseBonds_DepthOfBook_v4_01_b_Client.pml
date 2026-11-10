/*
 * New York Stock Exchange DepthOfBook
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
#define WIRE 34

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Client Message Header: 1 bytes ------------------------------------------ */

/* The single Ascii type code that opens every client message */
typedef ClientMessageHeader {
  byte client_message_type
};

/* every byte of Client Message Header set to one value */
inline fill_client_message_header(client_message_header_record, client_message_header_value) {
  client_message_header_record.client_message_type = client_message_header_value;
  skip
}

/* each byte of Client Message Header set to where it lies, so a field read out of place says so */
inline ramp_client_message_header(client_message_header_record, client_message_header_base) {
  client_message_header_record.client_message_type = (client_message_header_base + 0 + 1) % 256;
  skip
}

/* Client Message Header to the wire, 1 bytes from where the cursor stands */
inline encode_client_message_header(client_message_header_record) {
  wire[at] = client_message_header_record.client_message_type; at = at + 1;
  skip
}

/* Client Message Header off the wire, 1 bytes from where the cursor stands */
inline decode_client_message_header(client_message_header_record) {
  client_message_header_record.client_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Client Message Header is what was written, byte for byte */
inline equal_client_message_header(client_message_header_read, client_message_header_written) {
  assert(client_message_header_read.client_message_type == client_message_header_written.client_message_type);
  skip
}

/* ---- Login Message: 34 bytes ------------------------------------------------- */

/* Authenticates the subscriber and names which order data the session subscribes to.
      A starting sequence number of 0 requests current data; a greater number than the exchange holds
      is treated as 0, and a negative one is rejected */
typedef LoginMessage {
  byte username[8];
  byte password[10];
  byte login_sequence_number[10];
  byte listed_subscription;
  byte etf_subscription;
  byte otc_subscription;
  byte global_otc_subscription;
  byte bond_subscription;
  byte etx
};

int login_message_at;

/* every byte of Login Message set to one value */
inline fill_login_message(login_message_record, login_message_value) {
  login_message_at = 0;
  do
  :: login_message_at < 8 -> login_message_record.username[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.login_sequence_number[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_record.listed_subscription = login_message_value;
  login_message_record.etf_subscription = login_message_value;
  login_message_record.otc_subscription = login_message_value;
  login_message_record.global_otc_subscription = login_message_value;
  login_message_record.bond_subscription = login_message_value;
  login_message_record.etx = login_message_value;
  skip
}

/* each byte of Login Message set to where it lies, so a field read out of place says so */
inline ramp_login_message(login_message_record, login_message_base) {
  login_message_at = 0;
  do
  :: login_message_at < 8 -> login_message_record.username[login_message_at] = (login_message_base + 0 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = (login_message_base + 8 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.login_sequence_number[login_message_at] = (login_message_base + 18 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_record.listed_subscription = (login_message_base + 28 + 1) % 256;
  login_message_record.etf_subscription = (login_message_base + 29 + 1) % 256;
  login_message_record.otc_subscription = (login_message_base + 30 + 1) % 256;
  login_message_record.global_otc_subscription = (login_message_base + 31 + 1) % 256;
  login_message_record.bond_subscription = (login_message_base + 32 + 1) % 256;
  login_message_record.etx = (login_message_base + 33 + 1) % 256;
  skip
}

/* Login Message to the wire, 34 bytes from where the cursor stands */
inline encode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 8 -> wire[at] = login_message_record.username[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> wire[at] = login_message_record.password[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> wire[at] = login_message_record.login_sequence_number[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  wire[at] = login_message_record.listed_subscription; at = at + 1;
  wire[at] = login_message_record.etf_subscription; at = at + 1;
  wire[at] = login_message_record.otc_subscription; at = at + 1;
  wire[at] = login_message_record.global_otc_subscription; at = at + 1;
  wire[at] = login_message_record.bond_subscription; at = at + 1;
  wire[at] = login_message_record.etx; at = at + 1;
  skip
}

/* Login Message off the wire, 34 bytes from where the cursor stands */
inline decode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 8 -> login_message_record.username[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.login_sequence_number[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_record.listed_subscription = wire[at]; at = at + 1;
  login_message_record.etf_subscription = wire[at]; at = at + 1;
  login_message_record.otc_subscription = wire[at]; at = at + 1;
  login_message_record.global_otc_subscription = wire[at]; at = at + 1;
  login_message_record.bond_subscription = wire[at]; at = at + 1;
  login_message_record.etx = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Message is what was written, byte for byte */
inline equal_login_message(login_message_read, login_message_written) {
  login_message_at = 0;
  do
  :: login_message_at < 8 -> assert(login_message_read.username[login_message_at] == login_message_written.username[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> assert(login_message_read.password[login_message_at] == login_message_written.password[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> assert(login_message_read.login_sequence_number[login_message_at] == login_message_written.login_sequence_number[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  assert(login_message_read.listed_subscription == login_message_written.listed_subscription);
  assert(login_message_read.etf_subscription == login_message_written.etf_subscription);
  assert(login_message_read.otc_subscription == login_message_written.otc_subscription);
  assert(login_message_read.global_otc_subscription == login_message_written.global_otc_subscription);
  assert(login_message_read.bond_subscription == login_message_written.bond_subscription);
  assert(login_message_read.etx == login_message_written.etx);
  skip
}

/* ---- Logoff Message: 1 bytes ------------------------------------------------- */

/* Closes the session. Carries only its type code and the terminator */
typedef LogoffMessage {
  byte etx
};

/* every byte of Logoff Message set to one value */
inline fill_logoff_message(logoff_message_record, logoff_message_value) {
  logoff_message_record.etx = logoff_message_value;
  skip
}

/* each byte of Logoff Message set to where it lies, so a field read out of place says so */
inline ramp_logoff_message(logoff_message_record, logoff_message_base) {
  logoff_message_record.etx = (logoff_message_base + 0 + 1) % 256;
  skip
}

/* Logoff Message to the wire, 1 bytes from where the cursor stands */
inline encode_logoff_message(logoff_message_record) {
  wire[at] = logoff_message_record.etx; at = at + 1;
  skip
}

/* Logoff Message off the wire, 1 bytes from where the cursor stands */
inline decode_logoff_message(logoff_message_record) {
  logoff_message_record.etx = wire[at]; at = at + 1;
  skip
}

/* what was read of Logoff Message is what was written, byte for byte */
inline equal_logoff_message(logoff_message_read, logoff_message_written) {
  assert(logoff_message_read.etx == logoff_message_written.etx);
  skip
}

/* ---- Heartbeat Response Message: 1 bytes ------------------------------------- */

/* Answers a Heartbeat Request. The exchange closes the connection if no response
      arrives within 60 seconds. Table 9 of the specification labels the second field "Username",
      which is a copy and paste slip - its own description reads "Message Terminating Character" */
typedef HeartbeatResponseMessage {
  byte etx
};

/* every byte of Heartbeat Response Message set to one value */
inline fill_heartbeat_response_message(heartbeat_response_message_record, heartbeat_response_message_value) {
  heartbeat_response_message_record.etx = heartbeat_response_message_value;
  skip
}

/* each byte of Heartbeat Response Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_response_message(heartbeat_response_message_record, heartbeat_response_message_base) {
  heartbeat_response_message_record.etx = (heartbeat_response_message_base + 0 + 1) % 256;
  skip
}

/* Heartbeat Response Message to the wire, 1 bytes from where the cursor stands */
inline encode_heartbeat_response_message(heartbeat_response_message_record) {
  wire[at] = heartbeat_response_message_record.etx; at = at + 1;
  skip
}

/* Heartbeat Response Message off the wire, 1 bytes from where the cursor stands */
inline decode_heartbeat_response_message(heartbeat_response_message_record) {
  heartbeat_response_message_record.etx = wire[at]; at = at + 1;
  skip
}

/* what was read of Heartbeat Response Message is what was written, byte for byte */
inline equal_heartbeat_response_message(heartbeat_response_message_read, heartbeat_response_message_written) {
  assert(heartbeat_response_message_read.etx == heartbeat_response_message_written.etx);
  skip
}

/* ---- Test Request Message: 21 bytes ------------------------------------------ */

/* Signals or tests that the Tcp connection is open. Any text given is echoed back
      in a Test Response */
typedef TestRequestMessage {
  byte test_request_text[20];
  byte etx
};

int test_request_message_at;

/* every byte of Test Request Message set to one value */
inline fill_test_request_message(test_request_message_record, test_request_message_value) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 20 -> test_request_message_record.test_request_text[test_request_message_at] = test_request_message_value; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  test_request_message_record.etx = test_request_message_value;
  skip
}

/* each byte of Test Request Message set to where it lies, so a field read out of place says so */
inline ramp_test_request_message(test_request_message_record, test_request_message_base) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 20 -> test_request_message_record.test_request_text[test_request_message_at] = (test_request_message_base + 0 + test_request_message_at + 1) % 256; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  test_request_message_record.etx = (test_request_message_base + 20 + 1) % 256;
  skip
}

/* Test Request Message to the wire, 21 bytes from where the cursor stands */
inline encode_test_request_message(test_request_message_record) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 20 -> wire[at] = test_request_message_record.test_request_text[test_request_message_at]; at = at + 1; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  wire[at] = test_request_message_record.etx; at = at + 1;
  skip
}

/* Test Request Message off the wire, 21 bytes from where the cursor stands */
inline decode_test_request_message(test_request_message_record) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 20 -> test_request_message_record.test_request_text[test_request_message_at] = wire[at]; at = at + 1; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  test_request_message_record.etx = wire[at]; at = at + 1;
  skip
}

/* what was read of Test Request Message is what was written, byte for byte */
inline equal_test_request_message(test_request_message_read, test_request_message_written) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 20 -> assert(test_request_message_read.test_request_text[test_request_message_at] == test_request_message_written.test_request_text[test_request_message_at]); test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  assert(test_request_message_read.etx == test_request_message_written.etx);
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
    assert(at == 1);
    at = 0;
    decode_client_message_header(client_message_header_got);
    assert(at == 1);
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
    assert(at == 34);
    at = 0;
    decode_login_message(login_message_got);
    assert(at == 34);
    equal_login_message(login_message_got, login_message_sent)
  }
}

/* Logoff Message: encoded, read back, and compared */
proctype check_logoff_message() {
  LogoffMessage logoff_message_sent;
  LogoffMessage logoff_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logoff_message(logoff_message_sent, 0)
  :: pattern == 1 -> fill_logoff_message(logoff_message_sent, 32)
  :: pattern == 2 -> fill_logoff_message(logoff_message_sent, 255)
  :: else -> ramp_logoff_message(logoff_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logoff_message(logoff_message_sent);
    assert(at == 1);
    at = 0;
    decode_logoff_message(logoff_message_got);
    assert(at == 1);
    equal_logoff_message(logoff_message_got, logoff_message_sent)
  }
}

/* Heartbeat Response Message: encoded, read back, and compared */
proctype check_heartbeat_response_message() {
  HeartbeatResponseMessage heartbeat_response_message_sent;
  HeartbeatResponseMessage heartbeat_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_response_message(heartbeat_response_message_sent, 0)
  :: pattern == 1 -> fill_heartbeat_response_message(heartbeat_response_message_sent, 32)
  :: pattern == 2 -> fill_heartbeat_response_message(heartbeat_response_message_sent, 255)
  :: else -> ramp_heartbeat_response_message(heartbeat_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_response_message(heartbeat_response_message_sent);
    assert(at == 1);
    at = 0;
    decode_heartbeat_response_message(heartbeat_response_message_got);
    assert(at == 1);
    equal_heartbeat_response_message(heartbeat_response_message_got, heartbeat_response_message_sent)
  }
}

/* Test Request Message: encoded, read back, and compared */
proctype check_test_request_message() {
  TestRequestMessage test_request_message_sent;
  TestRequestMessage test_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_test_request_message(test_request_message_sent, 0)
  :: pattern == 1 -> fill_test_request_message(test_request_message_sent, 32)
  :: pattern == 2 -> fill_test_request_message(test_request_message_sent, 255)
  :: else -> ramp_test_request_message(test_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_test_request_message(test_request_message_sent);
    assert(at == 21);
    at = 0;
    decode_test_request_message(test_request_message_got);
    assert(at == 21);
    equal_test_request_message(test_request_message_got, test_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_message_header()
  :: run check_login_message()
  :: run check_logoff_message()
  :: run check_heartbeat_response_message()
  :: run check_test_request_message()
  fi
}
