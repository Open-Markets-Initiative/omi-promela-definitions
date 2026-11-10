/*
 * Coinbase 
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
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 72

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Logon Message: 49 bytes ------------------------------------------------- */

/* LogonMessage */
typedef LogonMessage {
  byte username[16];
  byte password[32];
  byte reset_seq_num
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> logon_message_record.username[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> logon_message_record.password[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.reset_seq_num = logon_message_value;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> logon_message_record.username[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> logon_message_record.password[logon_message_at] = (logon_message_base + 16 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.reset_seq_num = (logon_message_base + 48 + 1) % 256;
  skip
}

/* Logon Message to the wire, 49 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> wire[at] = logon_message_record.username[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> wire[at] = logon_message_record.password[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_message_record.reset_seq_num; at = at + 1;
  skip
}

/* Logon Message off the wire, 49 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> logon_message_record.username[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> logon_message_record.password[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.reset_seq_num = wire[at]; at = at + 1;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> assert(logon_message_read.username[logon_message_at] == logon_message_written.username[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> assert(logon_message_read.password[logon_message_at] == logon_message_written.password[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  assert(logon_message_read.reset_seq_num == logon_message_written.reset_seq_num);
  skip
}

/* ---- Logon Conf Message: 4 bytes --------------------------------------------- */

/* LogonConfMessage */
typedef LogonConfMessage {
  byte heartbeat_interval_seconds[4]
};

int logon_conf_message_at;

/* every byte of Logon Conf Message set to one value */
inline fill_logon_conf_message(logon_conf_message_record, logon_conf_message_value) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> logon_conf_message_record.heartbeat_interval_seconds[logon_conf_message_at] = logon_conf_message_value; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Conf Message set to where it lies, so a field read out of place says so */
inline ramp_logon_conf_message(logon_conf_message_record, logon_conf_message_base) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> logon_conf_message_record.heartbeat_interval_seconds[logon_conf_message_at] = (logon_conf_message_base + 0 + logon_conf_message_at + 1) % 256; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Conf Message to the wire, 4 bytes from where the cursor stands */
inline encode_logon_conf_message(logon_conf_message_record) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> wire[at] = logon_conf_message_record.heartbeat_interval_seconds[logon_conf_message_at]; at = at + 1; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Conf Message off the wire, 4 bytes from where the cursor stands */
inline decode_logon_conf_message(logon_conf_message_record) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> logon_conf_message_record.heartbeat_interval_seconds[logon_conf_message_at] = wire[at]; at = at + 1; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Conf Message is what was written, byte for byte */
inline equal_logon_conf_message(logon_conf_message_read, logon_conf_message_written) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> assert(logon_conf_message_read.heartbeat_interval_seconds[logon_conf_message_at] == logon_conf_message_written.heartbeat_interval_seconds[logon_conf_message_at]); logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Message: 64 bytes ------------------------------------------------ */

/* LogoutMessage */
typedef LogoutMessage {
  byte reason_string_64[64]
};

int logout_message_at;

/* every byte of Logout Message set to one value */
inline fill_logout_message(logout_message_record, logout_message_value) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> logout_message_record.reason_string_64[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Message set to where it lies, so a field read out of place says so */
inline ramp_logout_message(logout_message_record, logout_message_base) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> logout_message_record.reason_string_64[logout_message_at] = (logout_message_base + 0 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message to the wire, 64 bytes from where the cursor stands */
inline encode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> wire[at] = logout_message_record.reason_string_64[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message off the wire, 64 bytes from where the cursor stands */
inline decode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> logout_message_record.reason_string_64[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Message is what was written, byte for byte */
inline equal_logout_message(logout_message_read, logout_message_written) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> assert(logout_message_read.reason_string_64[logout_message_at] == logout_message_written.reason_string_64[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logged Out Message: 64 bytes -------------------------------------------- */

/* LoggedOutMessage */
typedef LoggedOutMessage {
  byte reason_string_64[64]
};

int logged_out_message_at;

/* every byte of Logged Out Message set to one value */
inline fill_logged_out_message(logged_out_message_record, logged_out_message_value) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> logged_out_message_record.reason_string_64[logged_out_message_at] = logged_out_message_value; logged_out_message_at = logged_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logged Out Message set to where it lies, so a field read out of place says so */
inline ramp_logged_out_message(logged_out_message_record, logged_out_message_base) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> logged_out_message_record.reason_string_64[logged_out_message_at] = (logged_out_message_base + 0 + logged_out_message_at + 1) % 256; logged_out_message_at = logged_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logged Out Message to the wire, 64 bytes from where the cursor stands */
inline encode_logged_out_message(logged_out_message_record) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> wire[at] = logged_out_message_record.reason_string_64[logged_out_message_at]; at = at + 1; logged_out_message_at = logged_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logged Out Message off the wire, 64 bytes from where the cursor stands */
inline decode_logged_out_message(logged_out_message_record) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> logged_out_message_record.reason_string_64[logged_out_message_at] = wire[at]; at = at + 1; logged_out_message_at = logged_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logged Out Message is what was written, byte for byte */
inline equal_logged_out_message(logged_out_message_read, logged_out_message_written) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> assert(logged_out_message_read.reason_string_64[logged_out_message_at] == logged_out_message_written.reason_string_64[logged_out_message_at]); logged_out_message_at = logged_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat Message: 8 bytes ---------------------------------------------- */

/* HeartbeatMessage */
typedef HeartbeatMessage {
  byte correlation_id[8]
};

int heartbeat_message_at;

/* every byte of Heartbeat Message set to one value */
inline fill_heartbeat_message(heartbeat_message_record, heartbeat_message_value) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> heartbeat_message_record.correlation_id[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_message(heartbeat_message_record, heartbeat_message_base) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> heartbeat_message_record.correlation_id[heartbeat_message_at] = (heartbeat_message_base + 0 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message to the wire, 8 bytes from where the cursor stands */
inline encode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> wire[at] = heartbeat_message_record.correlation_id[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message off the wire, 8 bytes from where the cursor stands */
inline decode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> heartbeat_message_record.correlation_id[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Message is what was written, byte for byte */
inline equal_heartbeat_message(heartbeat_message_read, heartbeat_message_written) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> assert(heartbeat_message_read.correlation_id[heartbeat_message_at] == heartbeat_message_written.correlation_id[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Test Request Message: 8 bytes ------------------------------------------- */

/* TestRequestMessage */
typedef TestRequestMessage {
  byte correlation_id[8]
};

int test_request_message_at;

/* every byte of Test Request Message set to one value */
inline fill_test_request_message(test_request_message_record, test_request_message_value) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> test_request_message_record.correlation_id[test_request_message_at] = test_request_message_value; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Test Request Message set to where it lies, so a field read out of place says so */
inline ramp_test_request_message(test_request_message_record, test_request_message_base) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> test_request_message_record.correlation_id[test_request_message_at] = (test_request_message_base + 0 + test_request_message_at + 1) % 256; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Test Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_test_request_message(test_request_message_record) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> wire[at] = test_request_message_record.correlation_id[test_request_message_at]; at = at + 1; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Test Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_test_request_message(test_request_message_record) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> test_request_message_record.correlation_id[test_request_message_at] = wire[at]; at = at + 1; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Test Request Message is what was written, byte for byte */
inline equal_test_request_message(test_request_message_read, test_request_message_written) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> assert(test_request_message_read.correlation_id[test_request_message_at] == test_request_message_written.correlation_id[test_request_message_at]); test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Resend Request Message: 8 bytes ----------------------------------------- */

/* ResendRequestMessage */
typedef ResendRequestMessage {
  byte from_sequence_number[4];
  byte to_sequence_number[4]
};

int resend_request_message_at;

/* every byte of Resend Request Message set to one value */
inline fill_resend_request_message(resend_request_message_record, resend_request_message_value) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.from_sequence_number[resend_request_message_at] = resend_request_message_value; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.to_sequence_number[resend_request_message_at] = resend_request_message_value; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Resend Request Message set to where it lies, so a field read out of place says so */
inline ramp_resend_request_message(resend_request_message_record, resend_request_message_base) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.from_sequence_number[resend_request_message_at] = (resend_request_message_base + 0 + resend_request_message_at + 1) % 256; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.to_sequence_number[resend_request_message_at] = (resend_request_message_base + 4 + resend_request_message_at + 1) % 256; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_resend_request_message(resend_request_message_record) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> wire[at] = resend_request_message_record.from_sequence_number[resend_request_message_at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> wire[at] = resend_request_message_record.to_sequence_number[resend_request_message_at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_resend_request_message(resend_request_message_record) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.from_sequence_number[resend_request_message_at] = wire[at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.to_sequence_number[resend_request_message_at] = wire[at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Resend Request Message is what was written, byte for byte */
inline equal_resend_request_message(resend_request_message_read, resend_request_message_written) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> assert(resend_request_message_read.from_sequence_number[resend_request_message_at] == resend_request_message_written.from_sequence_number[resend_request_message_at]); resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> assert(resend_request_message_read.to_sequence_number[resend_request_message_at] == resend_request_message_written.to_sequence_number[resend_request_message_at]); resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gap Fill Message: 8 bytes ----------------------------------------------- */

/* GapFillMessage */
typedef GapFillMessage {
  byte new_sequence_number[4];
  byte gap_fill_padding[4]
};

int gap_fill_message_at;

/* every byte of Gap Fill Message set to one value */
inline fill_gap_fill_message(gap_fill_message_record, gap_fill_message_value) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> gap_fill_message_record.new_sequence_number[gap_fill_message_at] = gap_fill_message_value; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> gap_fill_message_record.gap_fill_padding[gap_fill_message_at] = gap_fill_message_value; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Gap Fill Message set to where it lies, so a field read out of place says so */
inline ramp_gap_fill_message(gap_fill_message_record, gap_fill_message_base) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> gap_fill_message_record.new_sequence_number[gap_fill_message_at] = (gap_fill_message_base + 0 + gap_fill_message_at + 1) % 256; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> gap_fill_message_record.gap_fill_padding[gap_fill_message_at] = (gap_fill_message_base + 4 + gap_fill_message_at + 1) % 256; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gap Fill Message to the wire, 8 bytes from where the cursor stands */
inline encode_gap_fill_message(gap_fill_message_record) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> wire[at] = gap_fill_message_record.new_sequence_number[gap_fill_message_at]; at = at + 1; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> wire[at] = gap_fill_message_record.gap_fill_padding[gap_fill_message_at]; at = at + 1; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gap Fill Message off the wire, 8 bytes from where the cursor stands */
inline decode_gap_fill_message(gap_fill_message_record) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> gap_fill_message_record.new_sequence_number[gap_fill_message_at] = wire[at]; at = at + 1; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> gap_fill_message_record.gap_fill_padding[gap_fill_message_at] = wire[at]; at = at + 1; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Gap Fill Message is what was written, byte for byte */
inline equal_gap_fill_message(gap_fill_message_read, gap_fill_message_written) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> assert(gap_fill_message_read.new_sequence_number[gap_fill_message_at] == gap_fill_message_written.new_sequence_number[gap_fill_message_at]); gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 4 -> assert(gap_fill_message_read.gap_fill_padding[gap_fill_message_at] == gap_fill_message_written.gap_fill_padding[gap_fill_message_at]); gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reject Message: 72 bytes ------------------------------------------------ */

/* RejectMessage */
typedef RejectMessage {
  byte ref_sequence_number[4];
  byte reason_reject_reason[4];
  byte details[64]
};

int reject_message_at;

/* every byte of Reject Message set to one value */
inline fill_reject_message(reject_message_record, reject_message_value) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.ref_sequence_number[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.reason_reject_reason[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 64 -> reject_message_record.details[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reject Message set to where it lies, so a field read out of place says so */
inline ramp_reject_message(reject_message_record, reject_message_base) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.ref_sequence_number[reject_message_at] = (reject_message_base + 0 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.reason_reject_reason[reject_message_at] = (reject_message_base + 4 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 64 -> reject_message_record.details[reject_message_at] = (reject_message_base + 8 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message to the wire, 72 bytes from where the cursor stands */
inline encode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> wire[at] = reject_message_record.ref_sequence_number[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> wire[at] = reject_message_record.reason_reject_reason[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 64 -> wire[at] = reject_message_record.details[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message off the wire, 72 bytes from where the cursor stands */
inline decode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.ref_sequence_number[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.reason_reject_reason[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 64 -> reject_message_record.details[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reject Message is what was written, byte for byte */
inline equal_reject_message(reject_message_read, reject_message_written) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> assert(reject_message_read.ref_sequence_number[reject_message_at] == reject_message_written.ref_sequence_number[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> assert(reject_message_read.reason_reject_reason[reject_message_at] == reject_message_written.reason_reject_reason[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 64 -> assert(reject_message_read.details[reject_message_at] == reject_message_written.details[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Logon Message: encoded, read back, and compared */
proctype check_logon_message() {
  LogonMessage logon_message_sent;
  LogonMessage logon_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_message(logon_message_sent, 0)
  :: pattern == 1 -> fill_logon_message(logon_message_sent, 32)
  :: pattern == 2 -> fill_logon_message(logon_message_sent, 255)
  :: else -> ramp_logon_message(logon_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_message(logon_message_sent);
    assert(at == 49);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 49);
    equal_logon_message(logon_message_got, logon_message_sent)
  }
}

/* Logon Conf Message: encoded, read back, and compared */
proctype check_logon_conf_message() {
  LogonConfMessage logon_conf_message_sent;
  LogonConfMessage logon_conf_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_conf_message(logon_conf_message_sent, 0)
  :: pattern == 1 -> fill_logon_conf_message(logon_conf_message_sent, 32)
  :: pattern == 2 -> fill_logon_conf_message(logon_conf_message_sent, 255)
  :: else -> ramp_logon_conf_message(logon_conf_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_conf_message(logon_conf_message_sent);
    assert(at == 4);
    at = 0;
    decode_logon_conf_message(logon_conf_message_got);
    assert(at == 4);
    equal_logon_conf_message(logon_conf_message_got, logon_conf_message_sent)
  }
}

/* Logout Message: encoded, read back, and compared */
proctype check_logout_message() {
  LogoutMessage logout_message_sent;
  LogoutMessage logout_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout_message(logout_message_sent, 0)
  :: pattern == 1 -> fill_logout_message(logout_message_sent, 32)
  :: pattern == 2 -> fill_logout_message(logout_message_sent, 255)
  :: else -> ramp_logout_message(logout_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout_message(logout_message_sent);
    assert(at == 64);
    at = 0;
    decode_logout_message(logout_message_got);
    assert(at == 64);
    equal_logout_message(logout_message_got, logout_message_sent)
  }
}

/* Logged Out Message: encoded, read back, and compared */
proctype check_logged_out_message() {
  LoggedOutMessage logged_out_message_sent;
  LoggedOutMessage logged_out_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logged_out_message(logged_out_message_sent, 0)
  :: pattern == 1 -> fill_logged_out_message(logged_out_message_sent, 32)
  :: pattern == 2 -> fill_logged_out_message(logged_out_message_sent, 255)
  :: else -> ramp_logged_out_message(logged_out_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logged_out_message(logged_out_message_sent);
    assert(at == 64);
    at = 0;
    decode_logged_out_message(logged_out_message_got);
    assert(at == 64);
    equal_logged_out_message(logged_out_message_got, logged_out_message_sent)
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
    assert(at == 8);
    at = 0;
    decode_heartbeat_message(heartbeat_message_got);
    assert(at == 8);
    equal_heartbeat_message(heartbeat_message_got, heartbeat_message_sent)
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
    assert(at == 8);
    at = 0;
    decode_test_request_message(test_request_message_got);
    assert(at == 8);
    equal_test_request_message(test_request_message_got, test_request_message_sent)
  }
}

/* Resend Request Message: encoded, read back, and compared */
proctype check_resend_request_message() {
  ResendRequestMessage resend_request_message_sent;
  ResendRequestMessage resend_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_resend_request_message(resend_request_message_sent, 0)
  :: pattern == 1 -> fill_resend_request_message(resend_request_message_sent, 32)
  :: pattern == 2 -> fill_resend_request_message(resend_request_message_sent, 255)
  :: else -> ramp_resend_request_message(resend_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_resend_request_message(resend_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_resend_request_message(resend_request_message_got);
    assert(at == 8);
    equal_resend_request_message(resend_request_message_got, resend_request_message_sent)
  }
}

/* Gap Fill Message: encoded, read back, and compared */
proctype check_gap_fill_message() {
  GapFillMessage gap_fill_message_sent;
  GapFillMessage gap_fill_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gap_fill_message(gap_fill_message_sent, 0)
  :: pattern == 1 -> fill_gap_fill_message(gap_fill_message_sent, 32)
  :: pattern == 2 -> fill_gap_fill_message(gap_fill_message_sent, 255)
  :: else -> ramp_gap_fill_message(gap_fill_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gap_fill_message(gap_fill_message_sent);
    assert(at == 8);
    at = 0;
    decode_gap_fill_message(gap_fill_message_got);
    assert(at == 8);
    equal_gap_fill_message(gap_fill_message_got, gap_fill_message_sent)
  }
}

/* Reject Message: encoded, read back, and compared */
proctype check_reject_message() {
  RejectMessage reject_message_sent;
  RejectMessage reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reject_message(reject_message_sent, 0)
  :: pattern == 1 -> fill_reject_message(reject_message_sent, 32)
  :: pattern == 2 -> fill_reject_message(reject_message_sent, 255)
  :: else -> ramp_reject_message(reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reject_message(reject_message_sent);
    assert(at == 72);
    at = 0;
    decode_reject_message(reject_message_got);
    assert(at == 72);
    equal_reject_message(reject_message_got, reject_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_logon_message()
  :: run check_logon_conf_message()
  :: run check_logout_message()
  :: run check_logged_out_message()
  :: run check_heartbeat_message()
  :: run check_test_request_message()
  :: run check_resend_request_message()
  :: run check_gap_fill_message()
  :: run check_reject_message()
  fi
}
