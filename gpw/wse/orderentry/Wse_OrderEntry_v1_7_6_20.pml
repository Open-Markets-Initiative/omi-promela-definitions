/*
 * Giełda Papierów Wartościowych w Warszawie Warsaw Stock Exchange Native Order Gateway
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
 *   - a field read in bits
 *   - a run of a stated number of entries
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 201

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 24 bytes ------------------------------------------------ */

/* Every order gateway message opens with the same 24 byte header */
typedef MessageHeader {
  byte message_length[2];
  byte message_type[2];
  byte sequence_number[4];
  byte timestamp[8];
  byte source_timestamp[8]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.source_timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.sequence_number[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.source_timestamp[message_header_at] = (message_header_base + 16 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 24 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.source_timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 24 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.source_timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.sequence_number[message_header_at] == message_header_written.sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.timestamp[message_header_at] == message_header_written.timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.source_timestamp[message_header_at] == message_header_written.source_timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login: 20 bytes --------------------------------------------------------- */

/* The login message authenticates a user establishing a connection to the trading port service. The login message must be the first message sent by the client application to request the initiation of a trading port session */
typedef Login {
  byte version[2];
  byte token[8];
  byte connection_id[2];
  byte next_expected_seq_num[4];
  byte last_sent_seq_num[4]
};

int login_at;

/* every byte of Login set to one value */
inline fill_login(login_record, login_value) {
  login_at = 0;
  do
  :: login_at < 2 -> login_record.version[login_at] = login_value; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 8 -> login_record.token[login_at] = login_value; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 2 -> login_record.connection_id[login_at] = login_value; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> login_record.next_expected_seq_num[login_at] = login_value; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> login_record.last_sent_seq_num[login_at] = login_value; login_at = login_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login set to where it lies, so a field read out of place says so */
inline ramp_login(login_record, login_base) {
  login_at = 0;
  do
  :: login_at < 2 -> login_record.version[login_at] = (login_base + 0 + login_at + 1) % 256; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 8 -> login_record.token[login_at] = (login_base + 2 + login_at + 1) % 256; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 2 -> login_record.connection_id[login_at] = (login_base + 10 + login_at + 1) % 256; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> login_record.next_expected_seq_num[login_at] = (login_base + 12 + login_at + 1) % 256; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> login_record.last_sent_seq_num[login_at] = (login_base + 16 + login_at + 1) % 256; login_at = login_at + 1
  :: else -> break
  od;
  skip
}

/* Login to the wire, 20 bytes from where the cursor stands */
inline encode_login(login_record) {
  login_at = 0;
  do
  :: login_at < 2 -> wire[at] = login_record.version[login_at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 8 -> wire[at] = login_record.token[login_at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 2 -> wire[at] = login_record.connection_id[login_at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> wire[at] = login_record.next_expected_seq_num[login_at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> wire[at] = login_record.last_sent_seq_num[login_at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  skip
}

/* Login off the wire, 20 bytes from where the cursor stands */
inline decode_login(login_record) {
  login_at = 0;
  do
  :: login_at < 2 -> login_record.version[login_at] = wire[at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 8 -> login_record.token[login_at] = wire[at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 2 -> login_record.connection_id[login_at] = wire[at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> login_record.next_expected_seq_num[login_at] = wire[at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> login_record.last_sent_seq_num[login_at] = wire[at]; at = at + 1; login_at = login_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login is what was written, byte for byte */
inline equal_login(login_read, login_written) {
  login_at = 0;
  do
  :: login_at < 2 -> assert(login_read.version[login_at] == login_written.version[login_at]); login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 8 -> assert(login_read.token[login_at] == login_written.token[login_at]); login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 2 -> assert(login_read.connection_id[login_at] == login_written.connection_id[login_at]); login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> assert(login_read.next_expected_seq_num[login_at] == login_written.next_expected_seq_num[login_at]); login_at = login_at + 1
  :: else -> break
  od;
  login_at = 0;
  do
  :: login_at < 4 -> assert(login_read.last_sent_seq_num[login_at] == login_written.last_sent_seq_num[login_at]); login_at = login_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response: 11 bytes ------------------------------------------------ */

/* The login response message. The result field describes the login status, indicating whether the login was successful or not (i.e. successful login) */
typedef LoginResponse {
  byte result_login_result;
  byte next_expected_seq_num[4];
  byte last_replay_seq_num[4];
  byte session_id[2]
};

int login_response_at;

/* every byte of Login Response set to one value */
inline fill_login_response(login_response_record, login_response_value) {
  login_response_record.result_login_result = login_response_value;
  login_response_at = 0;
  do
  :: login_response_at < 4 -> login_response_record.next_expected_seq_num[login_response_at] = login_response_value; login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 4 -> login_response_record.last_replay_seq_num[login_response_at] = login_response_value; login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 2 -> login_response_record.session_id[login_response_at] = login_response_value; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Response set to where it lies, so a field read out of place says so */
inline ramp_login_response(login_response_record, login_response_base) {
  login_response_record.result_login_result = (login_response_base + 0 + 1) % 256;
  login_response_at = 0;
  do
  :: login_response_at < 4 -> login_response_record.next_expected_seq_num[login_response_at] = (login_response_base + 1 + login_response_at + 1) % 256; login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 4 -> login_response_record.last_replay_seq_num[login_response_at] = (login_response_base + 5 + login_response_at + 1) % 256; login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 2 -> login_response_record.session_id[login_response_at] = (login_response_base + 9 + login_response_at + 1) % 256; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response to the wire, 11 bytes from where the cursor stands */
inline encode_login_response(login_response_record) {
  wire[at] = login_response_record.result_login_result; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 4 -> wire[at] = login_response_record.next_expected_seq_num[login_response_at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 4 -> wire[at] = login_response_record.last_replay_seq_num[login_response_at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 2 -> wire[at] = login_response_record.session_id[login_response_at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response off the wire, 11 bytes from where the cursor stands */
inline decode_login_response(login_response_record) {
  login_response_record.result_login_result = wire[at]; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 4 -> login_response_record.next_expected_seq_num[login_response_at] = wire[at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 4 -> login_response_record.last_replay_seq_num[login_response_at] = wire[at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 2 -> login_response_record.session_id[login_response_at] = wire[at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Response is what was written, byte for byte */
inline equal_login_response(login_response_read, login_response_written) {
  assert(login_response_read.result_login_result == login_response_written.result_login_result);
  login_response_at = 0;
  do
  :: login_response_at < 4 -> assert(login_response_read.next_expected_seq_num[login_response_at] == login_response_written.next_expected_seq_num[login_response_at]); login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 4 -> assert(login_response_read.last_replay_seq_num[login_response_at] == login_response_written.last_replay_seq_num[login_response_at]); login_response_at = login_response_at + 1
  :: else -> break
  od;
  login_response_at = 0;
  do
  :: login_response_at < 2 -> assert(login_response_read.session_id[login_response_at] == login_response_written.session_id[login_response_at]); login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Connection Close: 1 bytes ----------------------------------------------- */

/* The ConnectionClose message confirms the termination of a session through the trading port service */
typedef ConnectionClose {
  byte reason_connection_close_reason
};

/* every byte of Connection Close set to one value */
inline fill_connection_close(connection_close_record, connection_close_value) {
  connection_close_record.reason_connection_close_reason = connection_close_value;
  skip
}

/* each byte of Connection Close set to where it lies, so a field read out of place says so */
inline ramp_connection_close(connection_close_record, connection_close_base) {
  connection_close_record.reason_connection_close_reason = (connection_close_base + 0 + 1) % 256;
  skip
}

/* Connection Close to the wire, 1 bytes from where the cursor stands */
inline encode_connection_close(connection_close_record) {
  wire[at] = connection_close_record.reason_connection_close_reason; at = at + 1;
  skip
}

/* Connection Close off the wire, 1 bytes from where the cursor stands */
inline decode_connection_close(connection_close_record) {
  connection_close_record.reason_connection_close_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Connection Close is what was written, byte for byte */
inline equal_connection_close(connection_close_read, connection_close_written) {
  assert(connection_close_read.reason_connection_close_reason == connection_close_written.reason_connection_close_reason);
  skip
}

/* ---- Reject: 5 bytes --------------------------------------------------------- */

/* The reject message is sent by the trading port service when receiving an erroneous message that cannot be further processed */
typedef Reject {
  byte ref_seq_num[4];
  byte reject_reason
};

int reject_at;

/* every byte of Reject set to one value */
inline fill_reject(reject_record, reject_value) {
  reject_at = 0;
  do
  :: reject_at < 4 -> reject_record.ref_seq_num[reject_at] = reject_value; reject_at = reject_at + 1
  :: else -> break
  od;
  reject_record.reject_reason = reject_value;
  skip
}

/* each byte of Reject set to where it lies, so a field read out of place says so */
inline ramp_reject(reject_record, reject_base) {
  reject_at = 0;
  do
  :: reject_at < 4 -> reject_record.ref_seq_num[reject_at] = (reject_base + 0 + reject_at + 1) % 256; reject_at = reject_at + 1
  :: else -> break
  od;
  reject_record.reject_reason = (reject_base + 4 + 1) % 256;
  skip
}

/* Reject to the wire, 5 bytes from where the cursor stands */
inline encode_reject(reject_record) {
  reject_at = 0;
  do
  :: reject_at < 4 -> wire[at] = reject_record.ref_seq_num[reject_at]; at = at + 1; reject_at = reject_at + 1
  :: else -> break
  od;
  wire[at] = reject_record.reject_reason; at = at + 1;
  skip
}

/* Reject off the wire, 5 bytes from where the cursor stands */
inline decode_reject(reject_record) {
  reject_at = 0;
  do
  :: reject_at < 4 -> reject_record.ref_seq_num[reject_at] = wire[at]; at = at + 1; reject_at = reject_at + 1
  :: else -> break
  od;
  reject_record.reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Reject is what was written, byte for byte */
inline equal_reject(reject_read, reject_written) {
  reject_at = 0;
  do
  :: reject_at < 4 -> assert(reject_read.ref_seq_num[reject_at] == reject_written.ref_seq_num[reject_at]); reject_at = reject_at + 1
  :: else -> break
  od;
  assert(reject_read.reject_reason == reject_written.reject_reason);
  skip
}

/* ---- Test: 8 bytes ----------------------------------------------------------- */

/* The internal message for a test purpose */
typedef Test {
  byte target_timestamp[8]
};

int test_at;

/* every byte of Test set to one value */
inline fill_test(test_record, test_value) {
  test_at = 0;
  do
  :: test_at < 8 -> test_record.target_timestamp[test_at] = test_value; test_at = test_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Test set to where it lies, so a field read out of place says so */
inline ramp_test(test_record, test_base) {
  test_at = 0;
  do
  :: test_at < 8 -> test_record.target_timestamp[test_at] = (test_base + 0 + test_at + 1) % 256; test_at = test_at + 1
  :: else -> break
  od;
  skip
}

/* Test to the wire, 8 bytes from where the cursor stands */
inline encode_test(test_record) {
  test_at = 0;
  do
  :: test_at < 8 -> wire[at] = test_record.target_timestamp[test_at]; at = at + 1; test_at = test_at + 1
  :: else -> break
  od;
  skip
}

/* Test off the wire, 8 bytes from where the cursor stands */
inline decode_test(test_record) {
  test_at = 0;
  do
  :: test_at < 8 -> test_record.target_timestamp[test_at] = wire[at]; at = at + 1; test_at = test_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Test is what was written, byte for byte */
inline equal_test(test_read, test_written) {
  test_at = 0;
  do
  :: test_at < 8 -> assert(test_read.target_timestamp[test_at] == test_written.target_timestamp[test_at]); test_at = test_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Test Event: 201 bytes --------------------------------------------------- */

/* Test event */
typedef TestEvent {
  byte scenario_name[200];
  byte event_type
};

int test_event_at;

/* every byte of Test Event set to one value */
inline fill_test_event(test_event_record, test_event_value) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> test_event_record.scenario_name[test_event_at] = test_event_value; test_event_at = test_event_at + 1
  :: else -> break
  od;
  test_event_record.event_type = test_event_value;
  skip
}

/* each byte of Test Event set to where it lies, so a field read out of place says so */
inline ramp_test_event(test_event_record, test_event_base) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> test_event_record.scenario_name[test_event_at] = (test_event_base + 0 + test_event_at + 1) % 256; test_event_at = test_event_at + 1
  :: else -> break
  od;
  test_event_record.event_type = (test_event_base + 200 + 1) % 256;
  skip
}

/* Test Event to the wire, 201 bytes from where the cursor stands */
inline encode_test_event(test_event_record) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> wire[at] = test_event_record.scenario_name[test_event_at]; at = at + 1; test_event_at = test_event_at + 1
  :: else -> break
  od;
  wire[at] = test_event_record.event_type; at = at + 1;
  skip
}

/* Test Event off the wire, 201 bytes from where the cursor stands */
inline decode_test_event(test_event_record) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> test_event_record.scenario_name[test_event_at] = wire[at]; at = at + 1; test_event_at = test_event_at + 1
  :: else -> break
  od;
  test_event_record.event_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Test Event is what was written, byte for byte */
inline equal_test_event(test_event_read, test_event_written) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> assert(test_event_read.scenario_name[test_event_at] == test_event_written.scenario_name[test_event_at]); test_event_at = test_event_at + 1
  :: else -> break
  od;
  assert(test_event_read.event_type == test_event_written.event_type);
  skip
}

/* ---- Trading Session Status: 9 bytes ----------------------------------------- */

/* The Trading Session Status provides information on the status of a trading session */
typedef TradingSessionStatus {
  byte market_id[4];
  byte date[4];
  byte trading_session_event
};

int trading_session_status_at;

/* every byte of Trading Session Status set to one value */
inline fill_trading_session_status(trading_session_status_record, trading_session_status_value) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.market_id[trading_session_status_at] = trading_session_status_value; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.date[trading_session_status_at] = trading_session_status_value; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_record.trading_session_event = trading_session_status_value;
  skip
}

/* each byte of Trading Session Status set to where it lies, so a field read out of place says so */
inline ramp_trading_session_status(trading_session_status_record, trading_session_status_base) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.market_id[trading_session_status_at] = (trading_session_status_base + 0 + trading_session_status_at + 1) % 256; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.date[trading_session_status_at] = (trading_session_status_base + 4 + trading_session_status_at + 1) % 256; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_record.trading_session_event = (trading_session_status_base + 8 + 1) % 256;
  skip
}

/* Trading Session Status to the wire, 9 bytes from where the cursor stands */
inline encode_trading_session_status(trading_session_status_record) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> wire[at] = trading_session_status_record.market_id[trading_session_status_at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> wire[at] = trading_session_status_record.date[trading_session_status_at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_status_record.trading_session_event; at = at + 1;
  skip
}

/* Trading Session Status off the wire, 9 bytes from where the cursor stands */
inline decode_trading_session_status(trading_session_status_record) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.market_id[trading_session_status_at] = wire[at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.date[trading_session_status_at] = wire[at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_record.trading_session_event = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Session Status is what was written, byte for byte */
inline equal_trading_session_status(trading_session_status_read, trading_session_status_written) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> assert(trading_session_status_read.market_id[trading_session_status_at] == trading_session_status_written.market_id[trading_session_status_at]); trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> assert(trading_session_status_read.date[trading_session_status_at] == trading_session_status_written.date[trading_session_status_at]); trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  assert(trading_session_status_read.trading_session_event == trading_session_status_written.trading_session_event);
  skip
}

/* ---- Client: 5 bytes --------------------------------------------------------- */

/* MifidField */
typedef Client {
  byte short_code[4];
  byte qualifier
};

int client_at;

/* every byte of Client set to one value */
inline fill_client(client_record, client_value) {
  client_at = 0;
  do
  :: client_at < 4 -> client_record.short_code[client_at] = client_value; client_at = client_at + 1
  :: else -> break
  od;
  client_record.qualifier = client_value;
  skip
}

/* each byte of Client set to where it lies, so a field read out of place says so */
inline ramp_client(client_record, client_base) {
  client_at = 0;
  do
  :: client_at < 4 -> client_record.short_code[client_at] = (client_base + 0 + client_at + 1) % 256; client_at = client_at + 1
  :: else -> break
  od;
  client_record.qualifier = (client_base + 4 + 1) % 256;
  skip
}

/* Client to the wire, 5 bytes from where the cursor stands */
inline encode_client(client_record) {
  client_at = 0;
  do
  :: client_at < 4 -> wire[at] = client_record.short_code[client_at]; at = at + 1; client_at = client_at + 1
  :: else -> break
  od;
  wire[at] = client_record.qualifier; at = at + 1;
  skip
}

/* Client off the wire, 5 bytes from where the cursor stands */
inline decode_client(client_record) {
  client_at = 0;
  do
  :: client_at < 4 -> client_record.short_code[client_at] = wire[at]; at = at + 1; client_at = client_at + 1
  :: else -> break
  od;
  client_record.qualifier = wire[at]; at = at + 1;
  skip
}

/* what was read of Client is what was written, byte for byte */
inline equal_client(client_read, client_written) {
  client_at = 0;
  do
  :: client_at < 4 -> assert(client_read.short_code[client_at] == client_written.short_code[client_at]); client_at = client_at + 1
  :: else -> break
  od;
  assert(client_read.qualifier == client_written.qualifier);
  skip
}

/* ---- Executing Trader: 5 bytes ----------------------------------------------- */

/* MifidField */
typedef ExecutingTrader {
  byte short_code[4];
  byte qualifier
};

int executing_trader_at;

/* every byte of Executing Trader set to one value */
inline fill_executing_trader(executing_trader_record, executing_trader_value) {
  executing_trader_at = 0;
  do
  :: executing_trader_at < 4 -> executing_trader_record.short_code[executing_trader_at] = executing_trader_value; executing_trader_at = executing_trader_at + 1
  :: else -> break
  od;
  executing_trader_record.qualifier = executing_trader_value;
  skip
}

/* each byte of Executing Trader set to where it lies, so a field read out of place says so */
inline ramp_executing_trader(executing_trader_record, executing_trader_base) {
  executing_trader_at = 0;
  do
  :: executing_trader_at < 4 -> executing_trader_record.short_code[executing_trader_at] = (executing_trader_base + 0 + executing_trader_at + 1) % 256; executing_trader_at = executing_trader_at + 1
  :: else -> break
  od;
  executing_trader_record.qualifier = (executing_trader_base + 4 + 1) % 256;
  skip
}

/* Executing Trader to the wire, 5 bytes from where the cursor stands */
inline encode_executing_trader(executing_trader_record) {
  executing_trader_at = 0;
  do
  :: executing_trader_at < 4 -> wire[at] = executing_trader_record.short_code[executing_trader_at]; at = at + 1; executing_trader_at = executing_trader_at + 1
  :: else -> break
  od;
  wire[at] = executing_trader_record.qualifier; at = at + 1;
  skip
}

/* Executing Trader off the wire, 5 bytes from where the cursor stands */
inline decode_executing_trader(executing_trader_record) {
  executing_trader_at = 0;
  do
  :: executing_trader_at < 4 -> executing_trader_record.short_code[executing_trader_at] = wire[at]; at = at + 1; executing_trader_at = executing_trader_at + 1
  :: else -> break
  od;
  executing_trader_record.qualifier = wire[at]; at = at + 1;
  skip
}

/* what was read of Executing Trader is what was written, byte for byte */
inline equal_executing_trader(executing_trader_read, executing_trader_written) {
  executing_trader_at = 0;
  do
  :: executing_trader_at < 4 -> assert(executing_trader_read.short_code[executing_trader_at] == executing_trader_written.short_code[executing_trader_at]); executing_trader_at = executing_trader_at + 1
  :: else -> break
  od;
  assert(executing_trader_read.qualifier == executing_trader_written.qualifier);
  skip
}

/* ---- Investment Decision Maker: 5 bytes -------------------------------------- */

/* MifidField */
typedef InvestmentDecisionMaker {
  byte short_code[4];
  byte qualifier
};

int investment_decision_maker_at;

/* every byte of Investment Decision Maker set to one value */
inline fill_investment_decision_maker(investment_decision_maker_record, investment_decision_maker_value) {
  investment_decision_maker_at = 0;
  do
  :: investment_decision_maker_at < 4 -> investment_decision_maker_record.short_code[investment_decision_maker_at] = investment_decision_maker_value; investment_decision_maker_at = investment_decision_maker_at + 1
  :: else -> break
  od;
  investment_decision_maker_record.qualifier = investment_decision_maker_value;
  skip
}

/* each byte of Investment Decision Maker set to where it lies, so a field read out of place says so */
inline ramp_investment_decision_maker(investment_decision_maker_record, investment_decision_maker_base) {
  investment_decision_maker_at = 0;
  do
  :: investment_decision_maker_at < 4 -> investment_decision_maker_record.short_code[investment_decision_maker_at] = (investment_decision_maker_base + 0 + investment_decision_maker_at + 1) % 256; investment_decision_maker_at = investment_decision_maker_at + 1
  :: else -> break
  od;
  investment_decision_maker_record.qualifier = (investment_decision_maker_base + 4 + 1) % 256;
  skip
}

/* Investment Decision Maker to the wire, 5 bytes from where the cursor stands */
inline encode_investment_decision_maker(investment_decision_maker_record) {
  investment_decision_maker_at = 0;
  do
  :: investment_decision_maker_at < 4 -> wire[at] = investment_decision_maker_record.short_code[investment_decision_maker_at]; at = at + 1; investment_decision_maker_at = investment_decision_maker_at + 1
  :: else -> break
  od;
  wire[at] = investment_decision_maker_record.qualifier; at = at + 1;
  skip
}

/* Investment Decision Maker off the wire, 5 bytes from where the cursor stands */
inline decode_investment_decision_maker(investment_decision_maker_record) {
  investment_decision_maker_at = 0;
  do
  :: investment_decision_maker_at < 4 -> investment_decision_maker_record.short_code[investment_decision_maker_at] = wire[at]; at = at + 1; investment_decision_maker_at = investment_decision_maker_at + 1
  :: else -> break
  od;
  investment_decision_maker_record.qualifier = wire[at]; at = at + 1;
  skip
}

/* what was read of Investment Decision Maker is what was written, byte for byte */
inline equal_investment_decision_maker(investment_decision_maker_read, investment_decision_maker_written) {
  investment_decision_maker_at = 0;
  do
  :: investment_decision_maker_at < 4 -> assert(investment_decision_maker_read.short_code[investment_decision_maker_at] == investment_decision_maker_written.short_code[investment_decision_maker_at]); investment_decision_maker_at = investment_decision_maker_at + 1
  :: else -> break
  od;
  assert(investment_decision_maker_read.qualifier == investment_decision_maker_written.qualifier);
  skip
}

/* ---- Mifid Fields: 15 bytes -------------------------------------------------- */

/* MifidFields */
typedef MifidFields {
  Client client;
  ExecutingTrader executing_trader;
  InvestmentDecisionMaker investment_decisi_p8x1q8
};

/* every byte of Mifid Fields set to one value */
inline fill_mifid_fields(mifid_fields_record, mifid_fields_value) {
  fill_client(mifid_fields_record.client, mifid_fields_value);
  fill_executing_trader(mifid_fields_record.executing_trader, mifid_fields_value);
  fill_investment_decision_maker(mifid_fields_record.investment_decisi_p8x1q8, mifid_fields_value);
  skip
}

/* each byte of Mifid Fields set to where it lies, so a field read out of place says so */
inline ramp_mifid_fields(mifid_fields_record, mifid_fields_base) {
  ramp_client(mifid_fields_record.client, mifid_fields_base + 0);
  ramp_executing_trader(mifid_fields_record.executing_trader, mifid_fields_base + 5);
  ramp_investment_decision_maker(mifid_fields_record.investment_decisi_p8x1q8, mifid_fields_base + 10);
  skip
}

/* Mifid Fields to the wire, 15 bytes from where the cursor stands */
inline encode_mifid_fields(mifid_fields_record) {
  encode_client(mifid_fields_record.client);
  encode_executing_trader(mifid_fields_record.executing_trader);
  encode_investment_decision_maker(mifid_fields_record.investment_decisi_p8x1q8);
  skip
}

/* Mifid Fields off the wire, 15 bytes from where the cursor stands */
inline decode_mifid_fields(mifid_fields_record) {
  decode_client(mifid_fields_record.client);
  decode_executing_trader(mifid_fields_record.executing_trader);
  decode_investment_decision_maker(mifid_fields_record.investment_decisi_p8x1q8);
  skip
}

/* what was read of Mifid Fields is what was written, byte for byte */
inline equal_mifid_fields(mifid_fields_read, mifid_fields_written) {
  equal_client(mifid_fields_read.client, mifid_fields_written.client);
  equal_executing_trader(mifid_fields_read.executing_trader, mifid_fields_written.executing_trader);
  equal_investment_decision_maker(mifid_fields_read.investment_decisi_p8x1q8, mifid_fields_written.investment_decisi_p8x1q8);
  skip
}

/* ---- Order Mass Cancel: 39 bytes --------------------------------------------- */

/* Message used to cancel multiple existing orders */
typedef OrderMassCancel {
  byte mass_cancel_request_type;
  byte target_party_role;
  byte target_party_id[4];
  byte market_segment_id[4];
  byte instrument_id[4];
  ExecutingTrader executing_trader;
  byte client_order_id[20]
};

int order_mass_cancel_at;

/* every byte of Order Mass Cancel set to one value */
inline fill_order_mass_cancel(order_mass_cancel_record, order_mass_cancel_value) {
  order_mass_cancel_record.mass_cancel_request_type = order_mass_cancel_value;
  order_mass_cancel_record.target_party_role = order_mass_cancel_value;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> order_mass_cancel_record.target_party_id[order_mass_cancel_at] = order_mass_cancel_value; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> order_mass_cancel_record.market_segment_id[order_mass_cancel_at] = order_mass_cancel_value; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> order_mass_cancel_record.instrument_id[order_mass_cancel_at] = order_mass_cancel_value; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  fill_executing_trader(order_mass_cancel_record.executing_trader, order_mass_cancel_value);
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 20 -> order_mass_cancel_record.client_order_id[order_mass_cancel_at] = order_mass_cancel_value; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Mass Cancel set to where it lies, so a field read out of place says so */
inline ramp_order_mass_cancel(order_mass_cancel_record, order_mass_cancel_base) {
  order_mass_cancel_record.mass_cancel_request_type = (order_mass_cancel_base + 0 + 1) % 256;
  order_mass_cancel_record.target_party_role = (order_mass_cancel_base + 1 + 1) % 256;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> order_mass_cancel_record.target_party_id[order_mass_cancel_at] = (order_mass_cancel_base + 2 + order_mass_cancel_at + 1) % 256; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> order_mass_cancel_record.market_segment_id[order_mass_cancel_at] = (order_mass_cancel_base + 6 + order_mass_cancel_at + 1) % 256; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> order_mass_cancel_record.instrument_id[order_mass_cancel_at] = (order_mass_cancel_base + 10 + order_mass_cancel_at + 1) % 256; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  ramp_executing_trader(order_mass_cancel_record.executing_trader, order_mass_cancel_base + 14);
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 20 -> order_mass_cancel_record.client_order_id[order_mass_cancel_at] = (order_mass_cancel_base + 19 + order_mass_cancel_at + 1) % 256; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel to the wire, 39 bytes from where the cursor stands */
inline encode_order_mass_cancel(order_mass_cancel_record) {
  wire[at] = order_mass_cancel_record.mass_cancel_request_type; at = at + 1;
  wire[at] = order_mass_cancel_record.target_party_role; at = at + 1;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> wire[at] = order_mass_cancel_record.target_party_id[order_mass_cancel_at]; at = at + 1; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> wire[at] = order_mass_cancel_record.market_segment_id[order_mass_cancel_at]; at = at + 1; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> wire[at] = order_mass_cancel_record.instrument_id[order_mass_cancel_at]; at = at + 1; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  encode_executing_trader(order_mass_cancel_record.executing_trader);
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 20 -> wire[at] = order_mass_cancel_record.client_order_id[order_mass_cancel_at]; at = at + 1; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel off the wire, 39 bytes from where the cursor stands */
inline decode_order_mass_cancel(order_mass_cancel_record) {
  order_mass_cancel_record.mass_cancel_request_type = wire[at]; at = at + 1;
  order_mass_cancel_record.target_party_role = wire[at]; at = at + 1;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> order_mass_cancel_record.target_party_id[order_mass_cancel_at] = wire[at]; at = at + 1; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> order_mass_cancel_record.market_segment_id[order_mass_cancel_at] = wire[at]; at = at + 1; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> order_mass_cancel_record.instrument_id[order_mass_cancel_at] = wire[at]; at = at + 1; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  decode_executing_trader(order_mass_cancel_record.executing_trader);
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 20 -> order_mass_cancel_record.client_order_id[order_mass_cancel_at] = wire[at]; at = at + 1; order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Mass Cancel is what was written, byte for byte */
inline equal_order_mass_cancel(order_mass_cancel_read, order_mass_cancel_written) {
  assert(order_mass_cancel_read.mass_cancel_request_type == order_mass_cancel_written.mass_cancel_request_type);
  assert(order_mass_cancel_read.target_party_role == order_mass_cancel_written.target_party_role);
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> assert(order_mass_cancel_read.target_party_id[order_mass_cancel_at] == order_mass_cancel_written.target_party_id[order_mass_cancel_at]); order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> assert(order_mass_cancel_read.market_segment_id[order_mass_cancel_at] == order_mass_cancel_written.market_segment_id[order_mass_cancel_at]); order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 4 -> assert(order_mass_cancel_read.instrument_id[order_mass_cancel_at] == order_mass_cancel_written.instrument_id[order_mass_cancel_at]); order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  equal_executing_trader(order_mass_cancel_read.executing_trader, order_mass_cancel_written.executing_trader);
  order_mass_cancel_at = 0;
  do
  :: order_mass_cancel_at < 20 -> assert(order_mass_cancel_read.client_order_id[order_mass_cancel_at] == order_mass_cancel_written.client_order_id[order_mass_cancel_at]); order_mass_cancel_at = order_mass_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bid: 16 bytes ----------------------------------------------------------- */

/* QuoteOrder */
typedef Bid {
  byte price[8];
  byte quantity[8]
};

int bid_at;

/* every byte of Bid set to one value */
inline fill_bid(bid_record, bid_value) {
  bid_at = 0;
  do
  :: bid_at < 8 -> bid_record.price[bid_at] = bid_value; bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> bid_record.quantity[bid_at] = bid_value; bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bid set to where it lies, so a field read out of place says so */
inline ramp_bid(bid_record, bid_base) {
  bid_at = 0;
  do
  :: bid_at < 8 -> bid_record.price[bid_at] = (bid_base + 0 + bid_at + 1) % 256; bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> bid_record.quantity[bid_at] = (bid_base + 8 + bid_at + 1) % 256; bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* Bid to the wire, 16 bytes from where the cursor stands */
inline encode_bid(bid_record) {
  bid_at = 0;
  do
  :: bid_at < 8 -> wire[at] = bid_record.price[bid_at]; at = at + 1; bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> wire[at] = bid_record.quantity[bid_at]; at = at + 1; bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* Bid off the wire, 16 bytes from where the cursor stands */
inline decode_bid(bid_record) {
  bid_at = 0;
  do
  :: bid_at < 8 -> bid_record.price[bid_at] = wire[at]; at = at + 1; bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> bid_record.quantity[bid_at] = wire[at]; at = at + 1; bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bid is what was written, byte for byte */
inline equal_bid(bid_read, bid_written) {
  bid_at = 0;
  do
  :: bid_at < 8 -> assert(bid_read.price[bid_at] == bid_written.price[bid_at]); bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> assert(bid_read.quantity[bid_at] == bid_written.quantity[bid_at]); bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ask: 16 bytes ----------------------------------------------------------- */

/* QuoteOrder */
typedef Ask {
  byte price[8];
  byte quantity[8]
};

int ask_at;

/* every byte of Ask set to one value */
inline fill_ask(ask_record, ask_value) {
  ask_at = 0;
  do
  :: ask_at < 8 -> ask_record.price[ask_at] = ask_value; ask_at = ask_at + 1
  :: else -> break
  od;
  ask_at = 0;
  do
  :: ask_at < 8 -> ask_record.quantity[ask_at] = ask_value; ask_at = ask_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ask set to where it lies, so a field read out of place says so */
inline ramp_ask(ask_record, ask_base) {
  ask_at = 0;
  do
  :: ask_at < 8 -> ask_record.price[ask_at] = (ask_base + 0 + ask_at + 1) % 256; ask_at = ask_at + 1
  :: else -> break
  od;
  ask_at = 0;
  do
  :: ask_at < 8 -> ask_record.quantity[ask_at] = (ask_base + 8 + ask_at + 1) % 256; ask_at = ask_at + 1
  :: else -> break
  od;
  skip
}

/* Ask to the wire, 16 bytes from where the cursor stands */
inline encode_ask(ask_record) {
  ask_at = 0;
  do
  :: ask_at < 8 -> wire[at] = ask_record.price[ask_at]; at = at + 1; ask_at = ask_at + 1
  :: else -> break
  od;
  ask_at = 0;
  do
  :: ask_at < 8 -> wire[at] = ask_record.quantity[ask_at]; at = at + 1; ask_at = ask_at + 1
  :: else -> break
  od;
  skip
}

/* Ask off the wire, 16 bytes from where the cursor stands */
inline decode_ask(ask_record) {
  ask_at = 0;
  do
  :: ask_at < 8 -> ask_record.price[ask_at] = wire[at]; at = at + 1; ask_at = ask_at + 1
  :: else -> break
  od;
  ask_at = 0;
  do
  :: ask_at < 8 -> ask_record.quantity[ask_at] = wire[at]; at = at + 1; ask_at = ask_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ask is what was written, byte for byte */
inline equal_ask(ask_read, ask_written) {
  ask_at = 0;
  do
  :: ask_at < 8 -> assert(ask_read.price[ask_at] == ask_written.price[ask_at]); ask_at = ask_at + 1
  :: else -> break
  od;
  ask_at = 0;
  do
  :: ask_at < 8 -> assert(ask_read.quantity[ask_at] == ask_written.quantity[ask_at]); ask_at = ask_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote: 36 bytes --------------------------------------------------------- */

/* Quote */
typedef Quote {
  byte instrument_id[4];
  Bid bid;
  Ask ask
};

int quote_at;

/* every byte of Quote set to one value */
inline fill_quote(quote_record, quote_value) {
  quote_at = 0;
  do
  :: quote_at < 4 -> quote_record.instrument_id[quote_at] = quote_value; quote_at = quote_at + 1
  :: else -> break
  od;
  fill_bid(quote_record.bid, quote_value);
  fill_ask(quote_record.ask, quote_value);
  skip
}

/* each byte of Quote set to where it lies, so a field read out of place says so */
inline ramp_quote(quote_record, quote_base) {
  quote_at = 0;
  do
  :: quote_at < 4 -> quote_record.instrument_id[quote_at] = (quote_base + 0 + quote_at + 1) % 256; quote_at = quote_at + 1
  :: else -> break
  od;
  ramp_bid(quote_record.bid, quote_base + 4);
  ramp_ask(quote_record.ask, quote_base + 20);
  skip
}

/* Quote to the wire, 36 bytes from where the cursor stands */
inline encode_quote(quote_record) {
  quote_at = 0;
  do
  :: quote_at < 4 -> wire[at] = quote_record.instrument_id[quote_at]; at = at + 1; quote_at = quote_at + 1
  :: else -> break
  od;
  encode_bid(quote_record.bid);
  encode_ask(quote_record.ask);
  skip
}

/* Quote off the wire, 36 bytes from where the cursor stands */
inline decode_quote(quote_record) {
  quote_at = 0;
  do
  :: quote_at < 4 -> quote_record.instrument_id[quote_at] = wire[at]; at = at + 1; quote_at = quote_at + 1
  :: else -> break
  od;
  decode_bid(quote_record.bid);
  decode_ask(quote_record.ask);
  skip
}

/* what was read of Quote is what was written, byte for byte */
inline equal_quote(quote_read, quote_written) {
  quote_at = 0;
  do
  :: quote_at < 4 -> assert(quote_read.instrument_id[quote_at] == quote_written.instrument_id[quote_at]); quote_at = quote_at + 1
  :: else -> break
  od;
  equal_bid(quote_read.bid, quote_written.bid);
  equal_ask(quote_read.ask, quote_written.ask);
  skip
}

/* ---- Market Maker Command: 5 bytes ------------------------------------------- */

/* Market Maker command request */
typedef MarketMakerCommand {
  byte instrument_id[4];
  byte action
};

int market_maker_command_at;

/* every byte of Market Maker Command set to one value */
inline fill_market_maker_command(market_maker_command_record, market_maker_command_value) {
  market_maker_command_at = 0;
  do
  :: market_maker_command_at < 4 -> market_maker_command_record.instrument_id[market_maker_command_at] = market_maker_command_value; market_maker_command_at = market_maker_command_at + 1
  :: else -> break
  od;
  market_maker_command_record.action = market_maker_command_value;
  skip
}

/* each byte of Market Maker Command set to where it lies, so a field read out of place says so */
inline ramp_market_maker_command(market_maker_command_record, market_maker_command_base) {
  market_maker_command_at = 0;
  do
  :: market_maker_command_at < 4 -> market_maker_command_record.instrument_id[market_maker_command_at] = (market_maker_command_base + 0 + market_maker_command_at + 1) % 256; market_maker_command_at = market_maker_command_at + 1
  :: else -> break
  od;
  market_maker_command_record.action = (market_maker_command_base + 4 + 1) % 256;
  skip
}

/* Market Maker Command to the wire, 5 bytes from where the cursor stands */
inline encode_market_maker_command(market_maker_command_record) {
  market_maker_command_at = 0;
  do
  :: market_maker_command_at < 4 -> wire[at] = market_maker_command_record.instrument_id[market_maker_command_at]; at = at + 1; market_maker_command_at = market_maker_command_at + 1
  :: else -> break
  od;
  wire[at] = market_maker_command_record.action; at = at + 1;
  skip
}

/* Market Maker Command off the wire, 5 bytes from where the cursor stands */
inline decode_market_maker_command(market_maker_command_record) {
  market_maker_command_at = 0;
  do
  :: market_maker_command_at < 4 -> market_maker_command_record.instrument_id[market_maker_command_at] = wire[at]; at = at + 1; market_maker_command_at = market_maker_command_at + 1
  :: else -> break
  od;
  market_maker_command_record.action = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Maker Command is what was written, byte for byte */
inline equal_market_maker_command(market_maker_command_read, market_maker_command_written) {
  market_maker_command_at = 0;
  do
  :: market_maker_command_at < 4 -> assert(market_maker_command_read.instrument_id[market_maker_command_at] == market_maker_command_written.instrument_id[market_maker_command_at]); market_maker_command_at = market_maker_command_at + 1
  :: else -> break
  od;
  assert(market_maker_command_read.action == market_maker_command_written.action);
  skip
}

/* ---- Market Maker Command Response: 7 bytes ---------------------------------- */

/* The response to the Market Maker command */
typedef MarketMakerCommandResponse {
  byte ref_id[4];
  byte result_command_result;
  byte rejection_code[2]
};

int market_maker_command_response_at;

/* every byte of Market Maker Command Response set to one value */
inline fill_market_maker_command_response(market_maker_command_response_record, market_maker_command_response_value) {
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 4 -> market_maker_command_response_record.ref_id[market_maker_command_response_at] = market_maker_command_response_value; market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  market_maker_command_response_record.result_command_result = market_maker_command_response_value;
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 2 -> market_maker_command_response_record.rejection_code[market_maker_command_response_at] = market_maker_command_response_value; market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Maker Command Response set to where it lies, so a field read out of place says so */
inline ramp_market_maker_command_response(market_maker_command_response_record, market_maker_command_response_base) {
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 4 -> market_maker_command_response_record.ref_id[market_maker_command_response_at] = (market_maker_command_response_base + 0 + market_maker_command_response_at + 1) % 256; market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  market_maker_command_response_record.result_command_result = (market_maker_command_response_base + 4 + 1) % 256;
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 2 -> market_maker_command_response_record.rejection_code[market_maker_command_response_at] = (market_maker_command_response_base + 5 + market_maker_command_response_at + 1) % 256; market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  skip
}

/* Market Maker Command Response to the wire, 7 bytes from where the cursor stands */
inline encode_market_maker_command_response(market_maker_command_response_record) {
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 4 -> wire[at] = market_maker_command_response_record.ref_id[market_maker_command_response_at]; at = at + 1; market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  wire[at] = market_maker_command_response_record.result_command_result; at = at + 1;
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 2 -> wire[at] = market_maker_command_response_record.rejection_code[market_maker_command_response_at]; at = at + 1; market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  skip
}

/* Market Maker Command Response off the wire, 7 bytes from where the cursor stands */
inline decode_market_maker_command_response(market_maker_command_response_record) {
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 4 -> market_maker_command_response_record.ref_id[market_maker_command_response_at] = wire[at]; at = at + 1; market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  market_maker_command_response_record.result_command_result = wire[at]; at = at + 1;
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 2 -> market_maker_command_response_record.rejection_code[market_maker_command_response_at] = wire[at]; at = at + 1; market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Maker Command Response is what was written, byte for byte */
inline equal_market_maker_command_response(market_maker_command_response_read, market_maker_command_response_written) {
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 4 -> assert(market_maker_command_response_read.ref_id[market_maker_command_response_at] == market_maker_command_response_written.ref_id[market_maker_command_response_at]); market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  assert(market_maker_command_response_read.result_command_result == market_maker_command_response_written.result_command_result);
  market_maker_command_response_at = 0;
  do
  :: market_maker_command_response_at < 2 -> assert(market_maker_command_response_read.rejection_code[market_maker_command_response_at] == market_maker_command_response_written.rejection_code[market_maker_command_response_at]); market_maker_command_response_at = market_maker_command_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Request For Execution: 5 bytes ------------------------------------------ */

/* The information for the MM that one of the quotes has been crossed */
typedef RequestForExecution {
  byte instrument_id[4];
  byte reason_request_for_execution_reason
};

int request_for_execution_at;

/* every byte of Request For Execution set to one value */
inline fill_request_for_execution(request_for_execution_record, request_for_execution_value) {
  request_for_execution_at = 0;
  do
  :: request_for_execution_at < 4 -> request_for_execution_record.instrument_id[request_for_execution_at] = request_for_execution_value; request_for_execution_at = request_for_execution_at + 1
  :: else -> break
  od;
  request_for_execution_record.reason_request_for_execution_reason = request_for_execution_value;
  skip
}

/* each byte of Request For Execution set to where it lies, so a field read out of place says so */
inline ramp_request_for_execution(request_for_execution_record, request_for_execution_base) {
  request_for_execution_at = 0;
  do
  :: request_for_execution_at < 4 -> request_for_execution_record.instrument_id[request_for_execution_at] = (request_for_execution_base + 0 + request_for_execution_at + 1) % 256; request_for_execution_at = request_for_execution_at + 1
  :: else -> break
  od;
  request_for_execution_record.reason_request_for_execution_reason = (request_for_execution_base + 4 + 1) % 256;
  skip
}

/* Request For Execution to the wire, 5 bytes from where the cursor stands */
inline encode_request_for_execution(request_for_execution_record) {
  request_for_execution_at = 0;
  do
  :: request_for_execution_at < 4 -> wire[at] = request_for_execution_record.instrument_id[request_for_execution_at]; at = at + 1; request_for_execution_at = request_for_execution_at + 1
  :: else -> break
  od;
  wire[at] = request_for_execution_record.reason_request_for_execution_reason; at = at + 1;
  skip
}

/* Request For Execution off the wire, 5 bytes from where the cursor stands */
inline decode_request_for_execution(request_for_execution_record) {
  request_for_execution_at = 0;
  do
  :: request_for_execution_at < 4 -> request_for_execution_record.instrument_id[request_for_execution_at] = wire[at]; at = at + 1; request_for_execution_at = request_for_execution_at + 1
  :: else -> break
  od;
  request_for_execution_record.reason_request_for_execution_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Request For Execution is what was written, byte for byte */
inline equal_request_for_execution(request_for_execution_read, request_for_execution_written) {
  request_for_execution_at = 0;
  do
  :: request_for_execution_at < 4 -> assert(request_for_execution_read.instrument_id[request_for_execution_at] == request_for_execution_written.instrument_id[request_for_execution_at]); request_for_execution_at = request_for_execution_at + 1
  :: else -> break
  od;
  assert(request_for_execution_read.reason_request_for_execution_reason == request_for_execution_written.reason_request_for_execution_reason);
  skip
}

/* ---- Bid Offer Update: 29 bytes ---------------------------------------------- */

/* Message send during the IPO to the sell side or during the Tender Offer to the buy side */
typedef BidOfferUpdate {
  byte instrument_id[4];
  byte update_type;
  byte total_bid_size[8];
  byte total_offer_size[8];
  byte bid_orders[4];
  byte offer_orders[4]
};

int bid_offer_update_at;

/* every byte of Bid Offer Update set to one value */
inline fill_bid_offer_update(bid_offer_update_record, bid_offer_update_value) {
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> bid_offer_update_record.instrument_id[bid_offer_update_at] = bid_offer_update_value; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_record.update_type = bid_offer_update_value;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> bid_offer_update_record.total_bid_size[bid_offer_update_at] = bid_offer_update_value; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> bid_offer_update_record.total_offer_size[bid_offer_update_at] = bid_offer_update_value; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> bid_offer_update_record.bid_orders[bid_offer_update_at] = bid_offer_update_value; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> bid_offer_update_record.offer_orders[bid_offer_update_at] = bid_offer_update_value; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bid Offer Update set to where it lies, so a field read out of place says so */
inline ramp_bid_offer_update(bid_offer_update_record, bid_offer_update_base) {
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> bid_offer_update_record.instrument_id[bid_offer_update_at] = (bid_offer_update_base + 0 + bid_offer_update_at + 1) % 256; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_record.update_type = (bid_offer_update_base + 4 + 1) % 256;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> bid_offer_update_record.total_bid_size[bid_offer_update_at] = (bid_offer_update_base + 5 + bid_offer_update_at + 1) % 256; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> bid_offer_update_record.total_offer_size[bid_offer_update_at] = (bid_offer_update_base + 13 + bid_offer_update_at + 1) % 256; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> bid_offer_update_record.bid_orders[bid_offer_update_at] = (bid_offer_update_base + 21 + bid_offer_update_at + 1) % 256; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> bid_offer_update_record.offer_orders[bid_offer_update_at] = (bid_offer_update_base + 25 + bid_offer_update_at + 1) % 256; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Offer Update to the wire, 29 bytes from where the cursor stands */
inline encode_bid_offer_update(bid_offer_update_record) {
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> wire[at] = bid_offer_update_record.instrument_id[bid_offer_update_at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  wire[at] = bid_offer_update_record.update_type; at = at + 1;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> wire[at] = bid_offer_update_record.total_bid_size[bid_offer_update_at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> wire[at] = bid_offer_update_record.total_offer_size[bid_offer_update_at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> wire[at] = bid_offer_update_record.bid_orders[bid_offer_update_at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> wire[at] = bid_offer_update_record.offer_orders[bid_offer_update_at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Offer Update off the wire, 29 bytes from where the cursor stands */
inline decode_bid_offer_update(bid_offer_update_record) {
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> bid_offer_update_record.instrument_id[bid_offer_update_at] = wire[at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_record.update_type = wire[at]; at = at + 1;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> bid_offer_update_record.total_bid_size[bid_offer_update_at] = wire[at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> bid_offer_update_record.total_offer_size[bid_offer_update_at] = wire[at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> bid_offer_update_record.bid_orders[bid_offer_update_at] = wire[at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> bid_offer_update_record.offer_orders[bid_offer_update_at] = wire[at]; at = at + 1; bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bid Offer Update is what was written, byte for byte */
inline equal_bid_offer_update(bid_offer_update_read, bid_offer_update_written) {
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> assert(bid_offer_update_read.instrument_id[bid_offer_update_at] == bid_offer_update_written.instrument_id[bid_offer_update_at]); bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  assert(bid_offer_update_read.update_type == bid_offer_update_written.update_type);
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> assert(bid_offer_update_read.total_bid_size[bid_offer_update_at] == bid_offer_update_written.total_bid_size[bid_offer_update_at]); bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 8 -> assert(bid_offer_update_read.total_offer_size[bid_offer_update_at] == bid_offer_update_written.total_offer_size[bid_offer_update_at]); bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> assert(bid_offer_update_read.bid_orders[bid_offer_update_at] == bid_offer_update_written.bid_orders[bid_offer_update_at]); bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  bid_offer_update_at = 0;
  do
  :: bid_offer_update_at < 4 -> assert(bid_offer_update_read.offer_orders[bid_offer_update_at] == bid_offer_update_written.offer_orders[bid_offer_update_at]); bid_offer_update_at = bid_offer_update_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Bust: 4 bytes ----------------------------------------------------- */

/* Message used to inform about cancellation of previously accepted Trade */
typedef TradeBust {
  byte trade_id[4]
};

int trade_bust_at;

/* every byte of Trade Bust set to one value */
inline fill_trade_bust(trade_bust_record, trade_bust_value) {
  trade_bust_at = 0;
  do
  :: trade_bust_at < 4 -> trade_bust_record.trade_id[trade_bust_at] = trade_bust_value; trade_bust_at = trade_bust_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Bust set to where it lies, so a field read out of place says so */
inline ramp_trade_bust(trade_bust_record, trade_bust_base) {
  trade_bust_at = 0;
  do
  :: trade_bust_at < 4 -> trade_bust_record.trade_id[trade_bust_at] = (trade_bust_base + 0 + trade_bust_at + 1) % 256; trade_bust_at = trade_bust_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust to the wire, 4 bytes from where the cursor stands */
inline encode_trade_bust(trade_bust_record) {
  trade_bust_at = 0;
  do
  :: trade_bust_at < 4 -> wire[at] = trade_bust_record.trade_id[trade_bust_at]; at = at + 1; trade_bust_at = trade_bust_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust off the wire, 4 bytes from where the cursor stands */
inline decode_trade_bust(trade_bust_record) {
  trade_bust_at = 0;
  do
  :: trade_bust_at < 4 -> trade_bust_record.trade_id[trade_bust_at] = wire[at]; at = at + 1; trade_bust_at = trade_bust_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Bust is what was written, byte for byte */
inline equal_trade_bust(trade_bust_read, trade_bust_written) {
  trade_bust_at = 0;
  do
  :: trade_bust_at < 4 -> assert(trade_bust_read.trade_id[trade_bust_at] == trade_bust_written.trade_id[trade_bust_at]); trade_bust_at = trade_bust_at + 1
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
    assert(at == 24);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 24);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Login: encoded, read back, and compared */
proctype check_login() {
  Login login_sent;
  Login login_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login(login_sent, 0)
  :: pattern == 1 -> fill_login(login_sent, 32)
  :: pattern == 2 -> fill_login(login_sent, 255)
  :: else -> ramp_login(login_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login(login_sent);
    assert(at == 20);
    at = 0;
    decode_login(login_got);
    assert(at == 20);
    equal_login(login_got, login_sent)
  }
}

/* Login Response: encoded, read back, and compared */
proctype check_login_response() {
  LoginResponse login_response_sent;
  LoginResponse login_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response(login_response_sent, 0)
  :: pattern == 1 -> fill_login_response(login_response_sent, 32)
  :: pattern == 2 -> fill_login_response(login_response_sent, 255)
  :: else -> ramp_login_response(login_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response(login_response_sent);
    assert(at == 11);
    at = 0;
    decode_login_response(login_response_got);
    assert(at == 11);
    equal_login_response(login_response_got, login_response_sent)
  }
}

/* Connection Close: encoded, read back, and compared */
proctype check_connection_close() {
  ConnectionClose connection_close_sent;
  ConnectionClose connection_close_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_connection_close(connection_close_sent, 0)
  :: pattern == 1 -> fill_connection_close(connection_close_sent, 32)
  :: pattern == 2 -> fill_connection_close(connection_close_sent, 255)
  :: else -> ramp_connection_close(connection_close_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_connection_close(connection_close_sent);
    assert(at == 1);
    at = 0;
    decode_connection_close(connection_close_got);
    assert(at == 1);
    equal_connection_close(connection_close_got, connection_close_sent)
  }
}

/* Reject: encoded, read back, and compared */
proctype check_reject() {
  Reject reject_sent;
  Reject reject_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reject(reject_sent, 0)
  :: pattern == 1 -> fill_reject(reject_sent, 32)
  :: pattern == 2 -> fill_reject(reject_sent, 255)
  :: else -> ramp_reject(reject_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reject(reject_sent);
    assert(at == 5);
    at = 0;
    decode_reject(reject_got);
    assert(at == 5);
    equal_reject(reject_got, reject_sent)
  }
}

/* Test: encoded, read back, and compared */
proctype check_test() {
  Test test_sent;
  Test test_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_test(test_sent, 0)
  :: pattern == 1 -> fill_test(test_sent, 32)
  :: pattern == 2 -> fill_test(test_sent, 255)
  :: else -> ramp_test(test_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_test(test_sent);
    assert(at == 8);
    at = 0;
    decode_test(test_got);
    assert(at == 8);
    equal_test(test_got, test_sent)
  }
}

/* Test Event: encoded, read back, and compared */
proctype check_test_event() {
  TestEvent test_event_sent;
  TestEvent test_event_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_test_event(test_event_sent, 0)
  :: pattern == 1 -> fill_test_event(test_event_sent, 32)
  :: pattern == 2 -> fill_test_event(test_event_sent, 255)
  :: else -> ramp_test_event(test_event_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_test_event(test_event_sent);
    assert(at == 201);
    at = 0;
    decode_test_event(test_event_got);
    assert(at == 201);
    equal_test_event(test_event_got, test_event_sent)
  }
}

/* Trading Session Status: encoded, read back, and compared */
proctype check_trading_session_status() {
  TradingSessionStatus trading_session_status_sent;
  TradingSessionStatus trading_session_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_status(trading_session_status_sent, 0)
  :: pattern == 1 -> fill_trading_session_status(trading_session_status_sent, 32)
  :: pattern == 2 -> fill_trading_session_status(trading_session_status_sent, 255)
  :: else -> ramp_trading_session_status(trading_session_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_status(trading_session_status_sent);
    assert(at == 9);
    at = 0;
    decode_trading_session_status(trading_session_status_got);
    assert(at == 9);
    equal_trading_session_status(trading_session_status_got, trading_session_status_sent)
  }
}

/* Client: encoded, read back, and compared */
proctype check_client() {
  Client client_sent;
  Client client_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client(client_sent, 0)
  :: pattern == 1 -> fill_client(client_sent, 32)
  :: pattern == 2 -> fill_client(client_sent, 255)
  :: else -> ramp_client(client_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client(client_sent);
    assert(at == 5);
    at = 0;
    decode_client(client_got);
    assert(at == 5);
    equal_client(client_got, client_sent)
  }
}

/* Executing Trader: encoded, read back, and compared */
proctype check_executing_trader() {
  ExecutingTrader executing_trader_sent;
  ExecutingTrader executing_trader_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_executing_trader(executing_trader_sent, 0)
  :: pattern == 1 -> fill_executing_trader(executing_trader_sent, 32)
  :: pattern == 2 -> fill_executing_trader(executing_trader_sent, 255)
  :: else -> ramp_executing_trader(executing_trader_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_executing_trader(executing_trader_sent);
    assert(at == 5);
    at = 0;
    decode_executing_trader(executing_trader_got);
    assert(at == 5);
    equal_executing_trader(executing_trader_got, executing_trader_sent)
  }
}

/* Investment Decision Maker: encoded, read back, and compared */
proctype check_investment_decision_maker() {
  InvestmentDecisionMaker investment_decision_maker_sent;
  InvestmentDecisionMaker investment_decision_maker_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_investment_decision_maker(investment_decision_maker_sent, 0)
  :: pattern == 1 -> fill_investment_decision_maker(investment_decision_maker_sent, 32)
  :: pattern == 2 -> fill_investment_decision_maker(investment_decision_maker_sent, 255)
  :: else -> ramp_investment_decision_maker(investment_decision_maker_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_investment_decision_maker(investment_decision_maker_sent);
    assert(at == 5);
    at = 0;
    decode_investment_decision_maker(investment_decision_maker_got);
    assert(at == 5);
    equal_investment_decision_maker(investment_decision_maker_got, investment_decision_maker_sent)
  }
}

/* Mifid Fields: encoded, read back, and compared */
proctype check_mifid_fields() {
  MifidFields mifid_fields_sent;
  MifidFields mifid_fields_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mifid_fields(mifid_fields_sent, 0)
  :: pattern == 1 -> fill_mifid_fields(mifid_fields_sent, 32)
  :: pattern == 2 -> fill_mifid_fields(mifid_fields_sent, 255)
  :: else -> ramp_mifid_fields(mifid_fields_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mifid_fields(mifid_fields_sent);
    assert(at == 15);
    at = 0;
    decode_mifid_fields(mifid_fields_got);
    assert(at == 15);
    equal_mifid_fields(mifid_fields_got, mifid_fields_sent)
  }
}

/* Order Mass Cancel: encoded, read back, and compared */
proctype check_order_mass_cancel() {
  OrderMassCancel order_mass_cancel_sent;
  OrderMassCancel order_mass_cancel_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_cancel(order_mass_cancel_sent, 0)
  :: pattern == 1 -> fill_order_mass_cancel(order_mass_cancel_sent, 32)
  :: pattern == 2 -> fill_order_mass_cancel(order_mass_cancel_sent, 255)
  :: else -> ramp_order_mass_cancel(order_mass_cancel_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_cancel(order_mass_cancel_sent);
    assert(at == 39);
    at = 0;
    decode_order_mass_cancel(order_mass_cancel_got);
    assert(at == 39);
    equal_order_mass_cancel(order_mass_cancel_got, order_mass_cancel_sent)
  }
}

/* Bid: encoded, read back, and compared */
proctype check_bid() {
  Bid bid_sent;
  Bid bid_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid(bid_sent, 0)
  :: pattern == 1 -> fill_bid(bid_sent, 32)
  :: pattern == 2 -> fill_bid(bid_sent, 255)
  :: else -> ramp_bid(bid_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid(bid_sent);
    assert(at == 16);
    at = 0;
    decode_bid(bid_got);
    assert(at == 16);
    equal_bid(bid_got, bid_sent)
  }
}

/* Ask: encoded, read back, and compared */
proctype check_ask() {
  Ask ask_sent;
  Ask ask_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ask(ask_sent, 0)
  :: pattern == 1 -> fill_ask(ask_sent, 32)
  :: pattern == 2 -> fill_ask(ask_sent, 255)
  :: else -> ramp_ask(ask_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ask(ask_sent);
    assert(at == 16);
    at = 0;
    decode_ask(ask_got);
    assert(at == 16);
    equal_ask(ask_got, ask_sent)
  }
}

/* Quote: encoded, read back, and compared */
proctype check_quote() {
  Quote quote_sent;
  Quote quote_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote(quote_sent, 0)
  :: pattern == 1 -> fill_quote(quote_sent, 32)
  :: pattern == 2 -> fill_quote(quote_sent, 255)
  :: else -> ramp_quote(quote_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote(quote_sent);
    assert(at == 36);
    at = 0;
    decode_quote(quote_got);
    assert(at == 36);
    equal_quote(quote_got, quote_sent)
  }
}

/* Market Maker Command: encoded, read back, and compared */
proctype check_market_maker_command() {
  MarketMakerCommand market_maker_command_sent;
  MarketMakerCommand market_maker_command_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_maker_command(market_maker_command_sent, 0)
  :: pattern == 1 -> fill_market_maker_command(market_maker_command_sent, 32)
  :: pattern == 2 -> fill_market_maker_command(market_maker_command_sent, 255)
  :: else -> ramp_market_maker_command(market_maker_command_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_maker_command(market_maker_command_sent);
    assert(at == 5);
    at = 0;
    decode_market_maker_command(market_maker_command_got);
    assert(at == 5);
    equal_market_maker_command(market_maker_command_got, market_maker_command_sent)
  }
}

/* Market Maker Command Response: encoded, read back, and compared */
proctype check_market_maker_command_response() {
  MarketMakerCommandResponse market_maker_command_response_sent;
  MarketMakerCommandResponse market_maker_command_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_maker_command_response(market_maker_command_response_sent, 0)
  :: pattern == 1 -> fill_market_maker_command_response(market_maker_command_response_sent, 32)
  :: pattern == 2 -> fill_market_maker_command_response(market_maker_command_response_sent, 255)
  :: else -> ramp_market_maker_command_response(market_maker_command_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_maker_command_response(market_maker_command_response_sent);
    assert(at == 7);
    at = 0;
    decode_market_maker_command_response(market_maker_command_response_got);
    assert(at == 7);
    equal_market_maker_command_response(market_maker_command_response_got, market_maker_command_response_sent)
  }
}

/* Request For Execution: encoded, read back, and compared */
proctype check_request_for_execution() {
  RequestForExecution request_for_execution_sent;
  RequestForExecution request_for_execution_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_for_execution(request_for_execution_sent, 0)
  :: pattern == 1 -> fill_request_for_execution(request_for_execution_sent, 32)
  :: pattern == 2 -> fill_request_for_execution(request_for_execution_sent, 255)
  :: else -> ramp_request_for_execution(request_for_execution_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_for_execution(request_for_execution_sent);
    assert(at == 5);
    at = 0;
    decode_request_for_execution(request_for_execution_got);
    assert(at == 5);
    equal_request_for_execution(request_for_execution_got, request_for_execution_sent)
  }
}

/* Bid Offer Update: encoded, read back, and compared */
proctype check_bid_offer_update() {
  BidOfferUpdate bid_offer_update_sent;
  BidOfferUpdate bid_offer_update_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_offer_update(bid_offer_update_sent, 0)
  :: pattern == 1 -> fill_bid_offer_update(bid_offer_update_sent, 32)
  :: pattern == 2 -> fill_bid_offer_update(bid_offer_update_sent, 255)
  :: else -> ramp_bid_offer_update(bid_offer_update_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_offer_update(bid_offer_update_sent);
    assert(at == 29);
    at = 0;
    decode_bid_offer_update(bid_offer_update_got);
    assert(at == 29);
    equal_bid_offer_update(bid_offer_update_got, bid_offer_update_sent)
  }
}

/* Trade Bust: encoded, read back, and compared */
proctype check_trade_bust() {
  TradeBust trade_bust_sent;
  TradeBust trade_bust_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_bust(trade_bust_sent, 0)
  :: pattern == 1 -> fill_trade_bust(trade_bust_sent, 32)
  :: pattern == 2 -> fill_trade_bust(trade_bust_sent, 255)
  :: else -> ramp_trade_bust(trade_bust_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_bust(trade_bust_sent);
    assert(at == 4);
    at = 0;
    decode_trade_bust(trade_bust_got);
    assert(at == 4);
    equal_trade_bust(trade_bust_got, trade_bust_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_login()
  :: run check_login_response()
  :: run check_connection_close()
  :: run check_reject()
  :: run check_test()
  :: run check_test_event()
  :: run check_trading_session_status()
  :: run check_client()
  :: run check_executing_trader()
  :: run check_investment_decision_maker()
  :: run check_mifid_fields()
  :: run check_order_mass_cancel()
  :: run check_bid()
  :: run check_ask()
  :: run check_quote()
  :: run check_market_maker_command()
  :: run check_market_maker_command_response()
  :: run check_request_for_execution()
  :: run check_bid_offer_update()
  :: run check_trade_bust()
  fi
}
